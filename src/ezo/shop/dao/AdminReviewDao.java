package ezo.shop.dao;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Review;
@SuppressWarnings("unchecked")

public class AdminReviewDao {
	
	private static AdminReviewDao instance = new AdminReviewDao();
	private AdminReviewDao() {}
	public static  AdminReviewDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	// 관리자 게시판 - 리뷰조회
	
	public List<Review> getAllReviewsInBoard() throws SQLException {
		return sqlmap.queryForList("adminreviews.getAllReviewsInBoard");
	}
	
	// 관리자 게시판 - 리뷰 번호로 조회
	public Review getReviewByReviewNoInBoard (int reviewNo) throws SQLException {
		return (Review)sqlmap.queryForObject("adminreviews.getReviewByReviewNoInBoard", reviewNo);
	}
	
	// 관리자 게시판 - 리뷰 삭제
	public void deleteReviewByReviewNoInBoard(Review review) throws SQLException {
		sqlmap.delete("adminreviews.deleteReviewByReviewNoInBoard", review);
	}
	
	// 리뷰 조건으로 조회 Criteria
	public List<Review> getReviewByReviewByCriteria (Criteria cri) throws SQLException {
		return sqlmap.queryForList("adminreviews.getReviewByReviewByCriteria", cri);
	}
	
	// 최근 3일 리뷰 총 개수
	public int getCountRecentReview() throws SQLException {
		return (int) sqlmap.queryForObject("adminreviews.getCountRecentReview");
	}
}
