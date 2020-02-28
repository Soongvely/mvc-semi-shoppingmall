package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Like;
import ezo.shop.vo.Notice;

public class NoticeDao {
	
	private static NoticeDao instance = new NoticeDao();
	
	private NoticeDao() {}
	
	public static NoticeDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 모든 공지 조회
	@SuppressWarnings("unchecked")
	public List<Notice> getAllnotice () throws SQLException {
		return sqlmap.queryForList("notices.getAllnotice");
	}
	
}