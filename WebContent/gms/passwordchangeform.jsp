<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	CustomerDao customerdao = CustomerDao.getInstance();


	String pwd = request.getParameter("password");
	int userNo = Integer.parseInt(request.getParameter("userNo"));

	Customer cust = customerdao.getCustomerByCustNo(userNo);
	
	System.out.println(userNo);
	
	cust.setPassword(pwd);
	cust.setNo(userNo);
	
	customerdao.changePWD(cust);
	
	response.sendRedirect("loginform.jsp?pwdok=pwdok");
	
	
%>