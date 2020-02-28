<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="ezo.shop.vo.PointHistory"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
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
	
	Integer orderProductNo = Integer.parseInt(request.getParameter("orderproductno"));
	
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	// 주문상품번호로 내용 변경
	OrderProduct orderProduct = orderProductDao.getOrderProductByNo(orderProductNo);
	//orderProduct.setProductStatus("구매확정");
	orderProduct.setReviewEnabled("N");
	orderProductDao.updateOrderProductByNo(orderProduct);
	
	// 리뷰 삭제하기
	ReviewDao reviewDao = ReviewDao.getInstance();
	reviewDao.deleteReviewByOrderProductNo(orderProductNo);
	
	response.sendRedirect("reviewlist.jsp");
	
%>