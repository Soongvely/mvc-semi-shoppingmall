<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.dao.ItemOptionDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny");
		return;
	}

	Integer orderProductNo = Integer.parseInt(request.getParameter("orderproductno"));
	// 주문상품번호로 주문상품취소하기
	
	// 주문은 그대로 두고 주문상품만 변경
	
	// 1. 주문상태를 주문취소로 변경
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	OrderProduct orderProduct = orderProductDao.getOrderProductByNo(orderProductNo);
	
	orderProduct.setProductStatus("주문취소");
	orderProductDao.updateOrderProductByNo(orderProduct);
	
	// 2.옵션별 재고를 주문상품 수량 만큼 올리기
	int optionNo = orderProductDao.getItemOptionNoByOrderProductNo(orderProductNo);
	
	ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
	ItemOption itemOption = itemOptionDao.getItemOptionByOptNo(optionNo);
	
	itemOption.setStock(itemOption.getStock() + orderProduct.getOrderAmount());
	
	itemOptionDao.updateOptStock(itemOption);
	// 10007 
	response.sendRedirect("canscelexchange.jsp");
%>