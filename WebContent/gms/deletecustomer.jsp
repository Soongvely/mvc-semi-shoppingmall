<%@page import="ezo.shop.dao.CustomerDao"%>
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
	
	CustomerDao customerDao = CustomerDao.getInstance();
	
	Customer customer = customerDao.getCustomerByCustNo(loginedUser.getNo());
	customer.setEnabled("N");
	
	customerDao.updateCustomer(customer);
	
	response.sendRedirect("loginform.jsp");
%>