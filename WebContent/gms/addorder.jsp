<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.vo.Cart"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="ezo.shop.vo.PointHistory"%>
<%@page import="ezo.shop.vo.Order"%>
<%@page import="ezo.shop.dao.PointHistoryDao"%>
<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="ezo.shop.dao.ItemOptionDao"%>
<%@page import="ezo.shop.dao.CartDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int itemNo = NumberUtils.stringToNumber(request.getParameter("itemno")); 
	// 고객 객체 가져옴
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		  response.sendRedirect("loginform.jsp?fail=deny&pageno=main.jsp");
		return;
	}
	
   String name = request.getParameter("name");
   String address = request.getParameter("address");
   String phone1 = request.getParameter("phone1");
   String phone2 = request.getParameter("phone2");
   int requestInfo = NumberUtils.stringToNumber(request.getParameter("requestinfo"));
   String paymethod = request.getParameter("paymethod");
   String paymentStatus = "";
   if(paymethod.equals("신용카드") || paymethod.equals("네이버페이")) {
	   paymentStatus = "결제완료";
	  
   } else if (paymethod.equals("무통장")) {
	   paymentStatus = "입금전";
   }
   
   String[] cartNos = request.getParameterValues("cartno"); 
   String[] cartAmounts = request.getParameterValues("cartamount");
   String[] optionNos = request.getParameterValues("optno");
   String[] optionAmounts = request.getParameterValues("optionamount");
	
   int totalAmount = NumberUtils.stringToNumber(request.getParameter("totalallprice"));
   System.out.println(totalAmount);
	//포인트 사용 포인트  
   CustomerDao customerDao = CustomerDao.getInstance();
   loginedUser.setAddress(address);
   loginedUser.setPhone(phone1);
   customerDao.updateCustomer(loginedUser);
   	int usePoint = NumberUtils.stringToNumber(request.getParameter("usepoint"));
 	
   	if(usePoint != 0) {
		//포인트 사용시만 적용 포인트 사용후 잔여 포인트
	   int newPoint = loginedUser.getPoint() - usePoint;
	   loginedUser.setPoint(newPoint);
	   customerDao.updateCustomer(loginedUser);

	   PointHistoryDao pointHistoryDao = PointHistoryDao.getInstance();
	   PointHistory pointHistory = new PointHistory();
	   pointHistory.setCustomer(loginedUser);
	   pointHistory.setUseAmount(usePoint);
	   pointHistory.setStatus("사용");
	   pointHistory.setContents("구매");
	   pointHistoryDao.insertPointHistoryByCustNo(pointHistory);
 	}
   OrderDao orderDao = OrderDao.getInstance();
   // 주문번호 시퀀스로 획득
   int orderNo = orderDao.getOrderSequence();
   
   Order order = new Order();
   order.setNo(orderNo);
   order.setCustomer(loginedUser);
   order.setPaymentStatus(paymentStatus);
   order.setPaymentMethod(paymethod);
   order.setTotalPrice(totalAmount);
   orderDao.insertOrderByCart(order);
   
   OrderProductDao orderProductDao = OrderProductDao.getInstance();
   
   OrderProduct orderProduct = new OrderProduct();
   orderProduct.setOrder(order);
   if(("무통장").equals(paymentStatus)){
	   orderProduct.setProductStatus("입금전");
   }
   if(cartNos != null && cartAmounts != null){
	   for(int i=0; i < cartNos.length; i++) {
		   CartDao cartDao = CartDao.getInstance();
		   Cart cart = cartDao.getCartByCartNo(NumberUtils.stringToNumber(cartNos[i]));
		   ItemOption itemOption = new ItemOption();
		   
		   // 상품옵션에 옵션번호 cart.getItemOption().getNo()
		   itemOption.setNo(cart.getItemOption().getNo());
		   orderProduct.setItemOption(itemOption);
		   orderProduct.setOrderAmount(NumberUtils.stringToNumber(cartAmounts[i]));
		   orderProductDao.insertOrderProduct(orderProduct);
		   
		   ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
		   ItemOption itemOption2 = itemOptionDao.getItemOptionByOptNo(cart.getItemOption().getNo());
		   int stock = itemOption2.getStock() - NumberUtils.stringToNumber(cartAmounts[i]);
		   itemOption2.setStock(stock);
		  
		   itemOptionDao.updateOptStock(itemOption2);
		   cartDao.deleteCartByCartNo(NumberUtils.stringToNumber(cartNos[i]));
	   }
   }
   if(optionNos != null && optionAmounts != null){
	   for(int i=0; i < optionNos.length; i++) {
		 
		   ItemOption itemOption = new ItemOption();
		   
		   // 상품옵션에 옵션번호 cart.getItemOption().getNo()
		   itemOption.setNo(NumberUtils.stringToNumber(optionNos[i]));
		   orderProduct.setItemOption(itemOption);
		   orderProduct.setOrderAmount(NumberUtils.stringToNumber(optionAmounts[i]));
		   orderProductDao.insertOrderProduct(orderProduct);
		   
		   ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
		   ItemOption itemOption2 = itemOptionDao.getItemOptionByOptNo(NumberUtils.stringToNumber(optionNos[i]));
		   int stock = itemOption2.getStock() - NumberUtils.stringToNumber(optionAmounts[i]);
		   itemOption2.setStock(stock);
		  
		   itemOptionDao.updateOptStock(itemOption2);
		
	   }
   }
   response.sendRedirect("order-confirmed.jsp?requestinfo="+requestInfo+"&orderno="+orderNo);
%>
