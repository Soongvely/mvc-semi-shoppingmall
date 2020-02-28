package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Cart;

public class CartDao {
	// 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.
	private static CartDao instance = new CartDao();
	// 생성자를 private 으로 선언
	private CartDao () {}
	//CartDao 객체를 제공하는 정적메소드를 정의
	public static CartDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	//장바구니에 추가
	public void insertCart(Cart cart) throws SQLException {
		sqlmap.insert("carts.insertCart",cart);
	}
	
	@SuppressWarnings("unchecked")
	public List<Cart> getCartByCustNo(int custNo) throws SQLException {
		
		return sqlmap.queryForList("carts.getCartByCustNo", custNo); 
	}
	
	public Cart getCartByCartNo(int cartNo) throws SQLException {
		return (Cart) sqlmap.queryForObject("carts.getCartByCartNo", cartNo);
	}
	
	public void deleteCartByCartNo(int cartNo) throws SQLException {
		sqlmap.delete("carts.deleteCartByCartNo", cartNo);
	}
	
	public void deleteCarts() throws SQLException {
		sqlmap.delete("carts.deleteCarts");
	}
	
}
