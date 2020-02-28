<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	int orderProductNo = Integer.parseInt(request.getParameter("orderproductno"));
	int orderNo = Integer.parseInt(request.getParameter("orderno"));
	
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	
	// 주문상품번호로 내용 변경
	OrderProduct orderProduct = orderProductDao.getOrderProductByNo(orderProductNo);
	orderProduct.setProductStatus("구매확정");
	orderProductDao.updateOrderProductByNo(orderProduct);
	
	response.sendRedirect("orderdetail.jsp?orderno="+orderNo);
%>