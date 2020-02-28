package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sanggi.api.annotation.Mapping;
import com.sanggi.api.annotation.Soong;

import ezo.shop.dao.AdminReviewDao;
import ezo.shop.dao.QuestionBoardDao;
import ezo.shop.util.NumberUtils;
import ezo.shop.vo.Admin;
import ezo.shop.vo.BoardReply;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Pagination;
import ezo.shop.vo.QuestionBoard;
import ezo.shop.vo.Review;

@Soong
public class BoardController {

	private final QuestionBoardDao questionDao = QuestionBoardDao.getInstance();
	private final AdminReviewDao adminReviewDao = AdminReviewDao.getInstance();

	// 번호에 맞는 문의를 가져옴
	@Mapping("/getQuestion")
	public QuestionBoard getQuestionBoardByNo(HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return null;
		}
		
		int boardNo = NumberUtils.stringToNumber(request.getParameter("no"));
		QuestionBoard board = questionDao.getQuestionBoardByNo(boardNo);
		return board;
	}

	// 조건별 문의 조회
	@Mapping("/getQuestionByCriteria")
	public HashMap<String, Object> getQuestionByCriteria(HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return null;
		}

		String questionType = request.getParameter("questionType");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String answered = request.getParameter("answerd");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		int page = NumberUtils.stringToNumber(request.getParameter("page"));
		
		if (page < 1)
			page = 1;

		Criteria cri = new Criteria();
		cri.setQuestionType(questionType);
		cri.setStartDate(startDate);
		cri.setEndDate(endDate);
		cri.setAnswer(answered);
		cri.setKeyword(keyword);
		cri.setSort(sort);
		cri.setPage(page);

		int totalCount = questionDao.getTotalCount(cri);

		Pagination pagination = new Pagination(page, totalCount, 15, 3);

		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());

		HashMap<String, Object> model = new HashMap<String, Object>();
		List<QuestionBoard> list = questionDao.getQuestionBoardsByCriteria(cri);
		
		model.put("list", list);
		model.put("beginPage", pagination.getBeginPage());
		model.put("endPage", pagination.getEndPage());
		model.put("totalPage", pagination.getTotalPagesCount());
		model.put("totalCount", totalCount);

		return model;
	}

	// 조건별 리뷰 조회
	@Mapping("/getReviewByCriteria")
	public List<Review> getReviewByCriteria(HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return null;
		}

		Criteria cri = new Criteria();
		cri.setStartDate(request.getParameter("startDate"));
		cri.setEndDate(request.getParameter("endDate"));
		cri.setKeyword(request.getParameter("keyword"));
		cri.setSort(request.getParameter("sort"));
		cri.setPage(NumberUtils.stringToNumber(request.getParameter("page")));

		List<Review> list = adminReviewDao.getReviewByReviewByCriteria(cri);
		return list;
	}

	// 게시글 답글 추가
	@Mapping("/insertBoardReply")
	public void insertBoardReply(HttpServletRequest request) throws SQLException {

		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return;
		}

		int boardNo = NumberUtils.stringToNumber(request.getParameter("no"));
		String contents = request.getParameter("contents");
		Admin admin = (Admin) session.getAttribute("LOGINED_ADMIN");

		BoardReply reply = new BoardReply();
		reply.setAdmin(admin);
		reply.setContents(contents);
		reply.setNo(boardNo);
		reply.setType("");

		questionDao.insertBoardReply(reply);
		questionDao.updateBoardReplyStatus(boardNo);
	}
	
	// 게시글 삭제
	@Mapping("/deleteBoard")
	public void deleteQuestionBoard(HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		Admin admin = (Admin) session.getAttribute("LOGINED_ADMIN");

		if (admin == null) {
			return;
		}
		
		QuestionBoard questionBoard = new QuestionBoard();	
		questionBoard.setNo(NumberUtils.stringToNumber(request.getParameter("qno")));
		
		
		BoardReply reply = new BoardReply();
		reply.setNo(NumberUtils.stringToNumber(request.getParameter("qno")));
		reply.setAdmin(admin);
		reply.setContents(request.getParameter("answer"));
		
		questionDao.deleteBoardReply(reply);
		questionDao.deleteQuestionBoardByNo(questionBoard);	
	}
	
}
