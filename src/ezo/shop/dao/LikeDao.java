package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Like;

public class LikeDao {
	
	private static LikeDao instance = new LikeDao();
	
	private LikeDao() {}
	
	public static LikeDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 좋아요 추가
	public void insertLike(Like like) throws SQLException {
		sqlmap.insert("likes.insertLike", like);
	}
	
	//고객 번호로 좋아요한 상품 상위 5개 조회하기 
	@SuppressWarnings("unchecked")
	public List<Like> getLikefiveByCustNo(int custNo) throws SQLException {
		return sqlmap.queryForList("likes.getLikefiveByCustNo", custNo);
	}
	
	// 한 고객이 좋아요 한 상품 갯수 
	public int getlikecountByCustNo(int custNo) throws SQLException {
		return (Integer) sqlmap.queryForObject("likes.getlikecountByCustNo", custNo);
	}
	
	//고객 번호로 좋아요한 상품 조회하기
	@SuppressWarnings("unchecked")
	public List<Like> getLikeAllByCustNo (int custNo) throws SQLException {
		return sqlmap.queryForList("likes.getLikeAllByCustNo", custNo);
	}
	
	// 아이템번호, 고객번호로 like 삭제 
	public void deleteLikeByItemNoandCustNo(Like like) throws SQLException {
		sqlmap.delete("likes.deleteLikeByItemNoandCustNo", like);
	}
	
}