<%@page import="ezo.shop.vo.PointHistory"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	String name = request.getParameter("username");
	Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("userbirthday"));
	String gender = request.getParameter("usergender");
	String email = request.getParameter("useremail");
	String phone = request.getParameter("userphone");
	String address = request.getParameter("useraddress");
	
	CustomerDao customerDao = CustomerDao.getInstance();

	Customer preCust = customerDao.getCustomerByCustId(id);
	if (preCust != null) {
		response.sendRedirect("registerform.jsp?fail=dup");
		return;
	}
	
	Customer customer = new Customer();
	customer.setId(id);
	customer.setPassword(password);
	customer.setName(name);
	customer.setBirthday(birthday);
	customer.setGender(gender);
	customer.setEmail(email);
	customer.setPhone(phone);
	customer.setAddress(address);
	// 회원가입시 포인트 3000 점 지급  + 트리거 
	customer.setPoint(3000);	

	customerDao.insertCustomer(customer);
	
	response.sendRedirect("loginform.jsp?success=success");
	
	
	
	
	
	
%>