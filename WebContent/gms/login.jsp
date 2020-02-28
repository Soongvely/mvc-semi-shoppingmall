<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	String pageNo = request.getParameter("pageno");
	
	CustomerDao customerDao = CustomerDao.getInstance();
	
	Customer customer = customerDao.getCustomerByCustId(id);
	if (customer == null) {
		response.sendRedirect("loginform.jsp?fail=invalid&pageno="+pageNo);
		return;
	}
	if (customer.getEnabled().equals("N")) {
		response.sendRedirect("loginform.jsp?fail=enabled&pageno="+pageNo);
		return;
	}
	
	if (!customer.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?fail=invalid&pageno="+pageNo);
		return;
	}
	
	session.setAttribute("LOGINED_USER", customer);
	
	if (pageNo != null) {
		if(pageNo.startsWith("detail.jsp")){
			response.sendRedirect(pageNo);
			return;
		}
		if("cart.jsp".equals(pageNo)){
			response.sendRedirect("cart.jsp");
			return;
		}
		if("order.jsp".equals(pageNo)){
			response.sendRedirect("order.jsp");
			return;
		}
		if("canscelexchange.jsp".equals(pageNo)){
			response.sendRedirect("canscelexchange.jsp");
			return;
		}
		if("mypage.jsp".equals(pageNo)){
			response.sendRedirect("mypage.jsp");
			return;
		}
		if("notice.jsp".equals(pageNo)){
			response.sendRedirect("notice.jsp");
			return;
		}
		if("orderdeliverylist.jsp".equals(pageNo)){
			response.sendRedirect("orderdeliverylist.jsp");
			return;
		}
		if("orderdetail.jsp".equals(pageNo)){
			response.sendRedirect("orderdetail.jsp");
			return;
		}
		if("orderproductcancelform.jsp".equals(pageNo)){
			response.sendRedirect("orderproductcancelform.jsp");
			return;
		}
		if("pointhistory.jsp".equals(pageNo)){
			response.sendRedirect("pointhistory.jsp");
			return;
		}
		if("questionboard.jsp".equals(pageNo)){
			response.sendRedirect("questionboard.jsp");
			return;
		}
		if("reviewlist.jsp".equals(pageNo)){
			response.sendRedirect("reviewlist.jsp");
			return;
		}
	}

	response.sendRedirect("main.jsp");
	
%>