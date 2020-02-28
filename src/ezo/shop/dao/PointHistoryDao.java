package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.PointHistory;

public class PointHistoryDao {
	
	// 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.
	private static PointHistoryDao instance = new PointHistoryDao();
	// 생성자를 private 으로 선언
	private PointHistoryDao () {}
	//UserDao 객체를 제공하는 정적메소드를 정의
	public static PointHistoryDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 고객번호로 포인트내역 조회하기 
	@SuppressWarnings("unchecked")
	public List<PointHistory> getPointHistoryByCustNo (int custNo) throws SQLException {
		return sqlmap.queryForList("pointhistories.getPointHistoryByCustNo", custNo);
	}
	
	// 포인트 사용내역 변동하기
	public void insertPointHistoryByCustNo (PointHistory pointHistory) throws SQLException {
		sqlmap.insert("pointhistories.insertPointHistoryByCustNo", pointHistory);
	}
}
