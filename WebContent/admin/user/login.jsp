<%@page import="ezo.shop.util.SecurityUtils"%>
<%@page import="ezo.shop.vo.Admin"%>
<%@page import="ezo.shop.dao.AdminUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userid");
	String userPwd = SecurityUtils.sha256hex(request.getParameter("userpwd"));
	
	AdminUserDao adminDao = AdminUserDao.getinstance();
	Admin admin = adminDao.getAdminAccountById(userId);
	
	if (admin == null) {
		response.sendRedirect("login-form.jsp?fail=invalid");
		return;
	}

	if (!admin.getPassword().equals(userPwd)) {
		response.sendRedirect("login-form.jsp?fail=invalid");
		return;
	}
	
	session.setAttribute("LOGINED_ADMIN", admin);
	response.sendRedirect("/semi/admin/home.jsp");
%>
    