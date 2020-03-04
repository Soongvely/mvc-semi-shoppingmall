package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.OrderProduct;

@SuppressWarnings("unchecked")

public class AdminOrderProductDao {

	private static AdminOrderProductDao instance = new AdminOrderProductDao();
	private AdminOrderProductDao() {}
	public static AdminOrderProductDao getInstance() {
		return instance;
	}
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 관리자 - 주문리스트 조회
	public List<OrderProduct> getAllOrdersInAdminOrderList() throws SQLException {
		return sqlmap.queryForList("adminorders.getAllOrdersInAdminOrderList");
	}
	
	// 주문상품번호로 주문리스트 조회
	public OrderProduct getOrderProductByOrderProductNo(int orderProductNo) throws SQLException {
		return (OrderProduct)sqlmap.queryForObject("adminorders.getOrderProductByOrderProductNo");
	}
	
	// 주문번호로 주문리스트 조회
	public OrderProduct getOrderProductByOrderNo(int orderNo) throws SQLException {
		return (OrderProduct)sqlmap.queryForObject("adminorders.getOrderProductByOrderNo");
	}
	
	// 조건별 주문리스트 조회
	public List<OrderProduct> getOrderListByCriteria(Criteria criteria) throws SQLException {
		return sqlmap.queryForList("adminorders.getOrderListByCriteria", criteria);
	}
	
	// 조건별 주문리스트 총 개수
	public int getTotalCountOrderList(Criteria criteria) throws SQLException {
		return (int)sqlmap.queryForObject("adminorders.getTotalCountOrderList", criteria);
	}
	
	// 조건별 상품주문상태 리스트 조회
	public List<OrderProduct> getOrderProductStatusListByCriteria(Criteria criteria) throws SQLException {
		return sqlmap.queryForList("adminorders.getOrderProductStatusListByCriteria", criteria);
	}

	// 조건별 상품주문상태 총 개수
	public int getTotalCountOrderProductStatusList(Criteria criteria) throws SQLException {
		return (int) sqlmap.queryForObject("adminorders.getTotalCountOrderProductStatusList", criteria);
	}
	
	// 최근 3일 주문건 총 개수
	public int getCountRecentOrder() throws SQLException {
		return (int) sqlmap.queryForObject("adminorders.getCountRecentOrder");
	} 
	// 입금전 건수 조회
	public int getCountBeforePayment() throws SQLException {
		return (int) sqlmap.queryForObject("adminorders.getCountBeforePayment");
	}
	
	// 일별 매출 
	public Map getDailySales() throws SQLException {
		return (Map) sqlmap.queryForMap("adminorders.getDailySales",null, "createDate");
	}
}
