<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER"); 
	String password = request.getParameter("password");
	
	CustomerDao customerDao = CustomerDao.getInstance();
	
	Customer customer = customerDao.getCustomerByCustNo(loginedUser.getNo());
	
	if (!customer.getPassword().equals(password)) {
		response.sendRedirect("passwordform.jsp?fail=invalid");
		return;
	}
	
	response.sendRedirect("custupdateform.jsp");
	
%>

	