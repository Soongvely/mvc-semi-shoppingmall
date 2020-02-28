<%@page import="ezo.shop.dao.CartDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String[] cartNos = request.getParameterValues("cartno");
	
	for(int i=0; i<cartNos.length; i++) {
		int cartNo= NumberUtils.stringToNumber(cartNos[i]); 
		
		CartDao cartDao = CartDao.getInstance();
		cartDao.deleteCartByCartNo(cartNo);
	}
	response.sendRedirect("cart.jsp");

%>