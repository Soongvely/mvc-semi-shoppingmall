package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.BoardReply;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.QuestionBoard;
@SuppressWarnings("unchecked")
public class QuestionBoardDao {

	private static QuestionBoardDao instance = new QuestionBoardDao();
	private QuestionBoardDao () {}
	public static QuestionBoardDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 모든 게시글 조회
	public List<QuestionBoard> getAllQuestionBoards() throws SQLException {
		return sqlmap.queryForList("boards.getAllQuestionBoards");
	}
	
	// 게시글 번호로 조회
	public QuestionBoard getQuestionBoardByNo(int boardNo) throws SQLException {
		return (QuestionBoard)sqlmap.queryForObject("boards.getQuestionBoardByNo", boardNo);
	} 
	
	// 게시글 타입으로 조회
	public List<QuestionBoard> getQuestionBoardByType(String type) throws SQLException {
		return sqlmap.queryForList("boards.getQuestionBoardByType", type);
	}
	
	// 게시글 조건으로 조회 Criteria
	public List<QuestionBoard> getQuestionBoardsByCriteria(Criteria cri) throws SQLException {
		return sqlmap.queryForList("boards.getQuestionBoardsByCriteria",cri);
	}
	
	// 게시글 삭제
	public void deleteQuestionBoardByNo(QuestionBoard board) throws SQLException {
		sqlmap.delete("boards.deleteQuestionBoardByNo", board);
	}
	
	// 게시글 답글 삭제
	public void deleteBoardReply(BoardReply reply) throws SQLException {
		sqlmap.delete("boards.deleteBoardReply", reply);
	}
	
	// 게시글 추가
	public void insertQuestionBoard(QuestionBoard board) throws SQLException {
		sqlmap.insert("boards.insertQuestionBoard", board);
	}
	
	// 게시글 답변 추가
	public void insertBoardReply(BoardReply reply) throws SQLException {		
		sqlmap.insert("boards.insertBoardReply", reply);
	}
	
	// 답글 등록시 게시글 업데이트
	public void updateBoardReplyStatus(int boardNo) throws SQLException {
		sqlmap.update("boards.updateBoardReplyStatus", boardNo);
	}
	
	// 게시글 개수 조회
	public int getTotalCount(Criteria cri) throws SQLException {
		return  (int) sqlmap.queryForObject("boards.getTotalCount",cri);
	}
	
	// 미답변 문의 총 개수 조회
	public int getTotalCountBoardReplyIsNot() throws SQLException {
		return (int) sqlmap.queryForObject("boards.getTotalCountBoardReplyIsNot");
	}
	
	/////////////////////////////////////////////////////////////건희
	// 모든 게시글 조회 (고객번호로)
	public List<QuestionBoard> getAllQuestionBoardsByCustNo (int custNo) throws SQLException {
	return sqlmap.queryForList("boards.getAllQuestionBoardsByCustNo", custNo);
	} 
	
	// 게시글 업데이트
	public void updateBoardByboardNo (QuestionBoard board) throws SQLException {
	sqlmap.update("boards.updateBoardByboardNo", board);
	}
	
	// 게시글 삭제 (보드번호로)
	public void deleteBoardByBoardNo (int boardNo) throws SQLException {
	sqlmap.delete("boards.deleteBoardByBoardNo", boardNo);
	}
}
