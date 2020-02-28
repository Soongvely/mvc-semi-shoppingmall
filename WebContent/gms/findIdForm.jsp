<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");	

	CustomerDao customerDao = CustomerDao.getInstance();
	
	String tag = request.getParameter("tag");
	String name = request.getParameter("username");
	String phone = request.getParameter("userphone");
	String email = request.getParameter("useremail");
	String id = request.getParameter("userid");
	
	Customer customer = new Customer();
	
	customer.setName(name);
	customer.setPhone(phone);
	customer.setEmail(email);
	
	System.out.println(name);
	System.out.println(phone);
	System.out.println(email);
	
	
	String findId = customerDao.findCustomerId(customer); 
	
	System.out.println(findId);
	
		if(findId == null){ 
			System.out.println("노");
			response.sendRedirect("findId.jsp?check=ID&OK=NO");
		}else{
			System.out.println("예스");
			response.sendRedirect("findId.jsp?check=ID&OK=YES&ID="+findId);
		}
	
%>