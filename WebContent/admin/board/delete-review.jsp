<%@page import="ezo.shop.dao.AdminReviewDao"%>
<%@page import="ezo.shop.vo.Review"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int reviewNo = NumberUtils.stringToNumber(request.getParameter("reviewno"));

	Review review = new Review();
	review.setNo(reviewNo);
	
	AdminReviewDao adminReviewDao = AdminReviewDao.getInstance();
	adminReviewDao.deleteReviewByReviewNoInBoard(review);
	
	response.sendRedirect("board.jsp?searchtype=review");
%>
