<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="ezo.shop.vo.Review"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	MultipartRequest multipartRequest = new MultipartRequest(request, 
		 "C:\\projects\\web_workspace\\semi\\WebContent\\gms\\resources\\images\\profile",
		 1024*1024*10,
		 "utf-8");
	
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny");
		return;
	}
	
	Integer orderProductNo = Integer.parseInt(multipartRequest.getParameter("orderproductno"));
	Integer star = Integer.parseInt(multipartRequest.getParameter("star"));
	String reviewfile = multipartRequest.getFilesystemName("reviewfile");
	String contents = multipartRequest.getParameter("reviewcontents");
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	Review review = reviewDao.getReviewByOrderProductNo(orderProductNo);
	review.setStar(star);
	review.setImageFilename("/semi/gms/resources/images/profile/"+reviewfile);
	review.setContents(contents);
	
	reviewDao.updateReviewByOrderProductNo(review);
	
	response.sendRedirect("reviewlist.jsp"); 
%>