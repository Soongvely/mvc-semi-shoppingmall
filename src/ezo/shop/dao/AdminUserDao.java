package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Admin;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Customer;

public class AdminUserDao {
	
	private static AdminUserDao instance = new AdminUserDao();
	private AdminUserDao() {}
	public static AdminUserDao getinstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	 
	// 관리자 계정조회
	public Admin getAdminAccountById(String adminId) throws SQLException {
		return (Admin)sqlmap.queryForObject("admins.getAdminAccountById", adminId);
	}
	
	// 관리자 계정 생성
	public void insertAdminAccount() throws SQLException {
		sqlmap.insert("admins.insertAdminAccount");
	}
	
	// 조건별 고객 조회 Criteria
	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomersByCriteria(Criteria criteria) throws SQLException {
		return sqlmap.queryForList("admins.getAllCustomersByCriteria", criteria);
	}
	
	// 조건별로 조회된 총 데이터 개수
	public int getTotalCountCustomerList(Criteria criteria) throws SQLException {
		return (int) sqlmap.queryForObject("admins.getTotalCountCustomerList", criteria);
	}
	
	// 고객 아이디로 조회
	public int getCustomerById(String custId) throws SQLException {
		return (int)sqlmap.queryForObject("admins.getCustomerById", custId);
	}
	
	// 고객 정보 변경
	public void updateCustomerByAdmin (Customer customer) throws SQLException {
		sqlmap.update("admins.updateCustomerByAdmin", customer);
	}
		
}
