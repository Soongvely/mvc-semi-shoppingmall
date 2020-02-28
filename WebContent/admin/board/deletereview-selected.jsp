<%@page import="ezo.shop.vo.Review"%>
<%@page import="ezo.shop.dao.AdminReviewDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] reviewNos = request.getParameterValues("reviewno");

	AdminReviewDao adminReviewDao = AdminReviewDao.getInstance();	
	Review review = new Review();
	
	for (String reviewNo : reviewNos) {
		review.setNo(NumberUtils.stringToNumber(reviewNo));
		adminReviewDao.deleteReviewByReviewNoInBoard(review);
	}
	response.sendRedirect("board.jsp");
%>