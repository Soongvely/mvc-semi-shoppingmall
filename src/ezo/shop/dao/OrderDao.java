package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Order;

public class OrderDao {
   
   private static OrderDao instance = new OrderDao();
   
   private OrderDao() {}
   
   public static OrderDao getInstance() {
      return instance;
   }
   
   private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
   
   ///////////////////////////////////////////////orders.xml
   // 주문번호 미리 획득
   public int getOrderSequence() throws SQLException {
      return (int)sqlmap.queryForObject("orders.getOrderSequence");
   }
   // 카트에서온 주문 추가
   public void insertOrderByCart(Order order) throws SQLException {
      sqlmap.insert("orders.insertOrderByCart", order);
   }
   // 상품페이지에서 온 바로 구매 주문추가
   //최근 1주일의 주문 조회 (고객번호)
   @SuppressWarnings("unchecked")
   public List<Order> getOrdersevendaysByCustNo(int custNo) throws SQLException {
      return sqlmap.queryForList("orders.getOrdersevendaysByCustNo", custNo);
   }
   
   // 주문번호로 조회
   public Order getOrderByOrderNo(int orderNo) throws SQLException {
      return (Order)sqlmap.queryForObject("orders.getOrderByOrderNo", orderNo);
   }
   
//   // 주문조회
//   @SuppressWarnings("unchecked")
//   public List<Order> getAllOrderByOrderNo () throws SQLException {
//      return sqlmap.queryForList("orders.getAllOrderByOrderNo");
//   }
   
   //고객번호로 모든 주문 조회
   @SuppressWarnings("unchecked")
   public List<Order> getAllOrderByCustNo (int custNo) throws SQLException {
      return sqlmap.queryForList("orders.getAllOrderByCustNo", custNo);
   }
   
   // 고객번호와 (주문날짜,히스토리날짜)가 같을때 포인트관련  주문번호로 조회
   @SuppressWarnings("unchecked")
   public Map<String, Object> getPointUseAmountByOrderNo (int orderNo) throws SQLException {
	   return (Map<String, Object>) sqlmap.queryForObject("orders.getPointUseAmountByOrderNo", orderNo);
   }
   

}