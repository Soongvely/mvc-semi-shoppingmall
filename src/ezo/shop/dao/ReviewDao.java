package ezo.shop.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Review;
import ezo.shop.vo.ReviewCountWithStar;

public class ReviewDao {
	
	// 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.
	private static ReviewDao instance = new ReviewDao();
	// 생성자를 private 으로 선언
	private ReviewDao () {}
	//UserDao 객체를 제공하는 정적메소드를 정의
	public static ReviewDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 내가 작성한 리뷰
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> writedReviewByNo(int custNo) throws SQLException {
		return sqlmap.queryForList("reviews.writedReviewByNo", custNo);
	} 
	
	// 리뷰 추가
	public void insertReview(Review review) throws SQLException {
		sqlmap.insert("reviews.insertReview", review);
	}
	
	// 주문상품번호로 리뷰 조회하기
	public Review getReviewByOrderProductNo (int orderProductNo) throws SQLException {
		return (Review)sqlmap.queryForObject("reviews.getReviewByOrderProductNo", orderProductNo);
	}
	
	// 주문상품번호로 리뷰 수정하기
	public void updateReviewByOrderProductNo (Review review) throws SQLException {
		sqlmap.update("reviews.updateReviewByOrderProductNo", review);
	}
	
	// 주문상품번호로 리뷰 삭제하기
	public void deleteReviewByOrderProductNo(int OrderProductNo) throws SQLException {
		sqlmap.delete("reviews.deleteReviewByOrderProductNo", OrderProductNo);
	}
	//상품 디테일 게시판에서 리뷰 조회하기
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getReviewByItemNo (int itemNo) throws SQLException {
		return sqlmap.queryForList("reviews.getReviewByItemNo", itemNo);
		
	}
	//총 리뷰 갯수 평균 리뷰별수 조회하기
	
	public ReviewCountWithStar getCountWithStarByItemNo (int itemNo) throws SQLException {
		return (ReviewCountWithStar) sqlmap.queryForObject("reviews.getCountWithStarByItemNo", itemNo);
	}
	
//	// 리뷰 번호로 조회하기
//	public Review getReviewByReviewNo(int reviewNo) throws SQLException {
//		return (Review)sqlmap.queryForObject("reviews.getReviewByReviewNo", reviewNo);
//	}
	
//	// 리뷰 전체 조회 
//	@SuppressWarnings("unchecked")
//	public List<Review> getAllReview() throws SQLException {
//		return sqlmap.queryForList("reviews.getAllReview");
//	}
	
//	// 리뷰번호로 리뷰 수정하기
//	public void updateReviewByNo(Review review) throws SQLException {
//		sqlmap.update("reviews.updateReviewByNo", review);
//	}
	
//	// 리뷰게시판 리뷰 전체 조회
//	@SuppressWarnings("unchecked")
//	public List<Review> getAllReviewInReviewBoard() throws SQLException {
//		return sqlmap.queryForList("reviews.getAllReviewInReviewBoard");
//	}
}
