package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Order;
import ezo.shop.vo.OrderProduct;

public class OrderProductDao {
	
	// 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.
	private static OrderProductDao instance = new OrderProductDao();
	// 생성자를 private 으로 선언
	private OrderProductDao () {}
	//UserDao 객체를 제공하는 정적메소드를 정의
	public static OrderProductDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	///////////////////////////////////////////////orderproducts.xml
	// 주문상품 등록
	public void insertOrderProduct(OrderProduct orderProduct) throws SQLException {
		sqlmap.insert("orderProducts.insertOrderProduct",orderProduct);
	}
	// 작성가능한 리뷰 조회
	@SuppressWarnings("unchecked")
	public List<OrderProduct> writepossibleReviewBycustNo(int custNo) throws SQLException {
		return sqlmap.queryForList("orderProducts.writepossibleReviewBycustNo", custNo);
	}
	
	// 주문상품번호로 조회
	public OrderProduct getOrderProductByNo(int orderProductNo) throws SQLException {
		return (OrderProduct)sqlmap.queryForObject("orderProducts.getOrderProductByNo", orderProductNo);
	}
	
	//주문상품번호로 주문상품 내용 변경 (상태, 리뷰여부)
	public void updateOrderProductByNo (OrderProduct orderProduct) throws SQLException {
		sqlmap.update("orderProducts.updateOrderProductByNo", orderProduct);
	}
	
	// 주문상품번호로 조회해서 옵션번호를 반환
	public int getItemOptionNoByOrderProductNo (int orderProductNo) throws SQLException {
		return (int)sqlmap.queryForObject("orderProducts.getItemOptionNoByOrderProductNo", orderProductNo);
	}
	 
	///////////////////////////////////////////////orders.xml
	   //주문번호로 제품 상세 조회  dd
	@SuppressWarnings("unchecked")
	public List<OrderProduct> getOrderDetailByOrderNo (int orderNo) throws SQLException {
		return sqlmap.queryForList("orders.getOrderDetailByOrderNo", orderNo);
	}
	
	  //주문상품번호로 제품 상세 조회
	public OrderProduct getOrderDetailByOrderProductNo (int orderProductNo) throws SQLException {
		return (OrderProduct)sqlmap.queryForObject("orders.getOrderDetailByOrderProductNo", orderProductNo);
	}
	
	  //고객번호로 주문,주문상품 상세 조회
	@SuppressWarnings("unchecked")
	public List<OrderProduct> getAllOrderDetailByCustNo (int custNo) throws SQLException {
		return sqlmap.queryForList("orders.getAllOrderDetailByCustNo", custNo);
	}
	
}
