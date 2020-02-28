package ezo.shop.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Customer;

public class CustomerDao {
	
	// 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.
	private static CustomerDao instance = new CustomerDao();
	// 생성자를 private 으로 선언
	private CustomerDao () {}
	//UserDao 객체를 제공하는 정적메소드를 정의
	public static CustomerDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 고객 추가
	public void insertCustomer(Customer customer) throws SQLException {
		sqlmap.insert("customers.insertCustomer", customer);
	}
	
	// 아이디로 조회 
	public Customer getCustomerByCustId(String custId) throws SQLException {
		return (Customer) sqlmap.queryForObject("customers.getCustomerByCustId", custId);
	}
	
	// 고객번호로 조회
	public Customer getCustomerByCustNo (int custNo) throws SQLException {
		return (Customer) sqlmap.queryForObject("customers.getCustomerByCustNo", custNo);
	}
	
	// 고객정보 변경하기
	public void updateCustomer (Customer customer) throws SQLException {
		sqlmap.update("customers.updateCustomer", customer);
	}
	
//	// 고객번호로 고객 삭제하기
//	public void deleteCustomerByCustNo (int custNo) throws SQLException {
//		sqlmap.delete("customers.deleteCustomerByCustNo", custNo);
//	}
	
	//고객아이디 찾기(이름,전화번호,이메일 비교)
	public String findCustomerId(Customer customer) throws SQLException {
		return (String)sqlmap.queryForObject("customers.findCustomerId", customer);
	}
	
	//고객비밀번호찾기(이름,전화번호,이메일,아이디 비교) 찾으면 트루 펄스 리턴해서 변경
	public Customer findCustomerPassword(Customer customer) throws SQLException {
		Customer check = (Customer)sqlmap.queryForObject("customers.findCustomerPwd", customer);
		
		return check;
	}
	
	//고객 비밀번호 변경
	public void changePWD(Customer customer) throws SQLException {
		sqlmap.update("customers.changePWD", customer);
	}
	
}
