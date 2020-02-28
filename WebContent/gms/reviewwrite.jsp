<%@page import="ezo.shop.dao.PointHistoryDao"%>
<%@page import="ezo.shop.vo.PointHistory"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="ezo.shop.vo.Review"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="ezo.shop.util.NumberUtils"%>
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
	
	Review review = new Review();
	
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	
	// 주문상품번호로 내용 변경
	OrderProduct orderProduct = orderProductDao.getOrderProductByNo(orderProductNo);
	orderProduct.setProductStatus("구매확정");
	orderProduct.setReviewEnabled("Y");
	orderProductDao.updateOrderProductByNo(orderProduct);
	
	// 리뷰 추가하기
	review.setOrderProduct(orderProduct);
	review.setStar(star);
	review.setImageFilename("/semi/gms/resources/images/profile/"+reviewfile);
	review.setContents(contents);
	ReviewDao reviewDao = ReviewDao.getInstance();
	reviewDao.insertReview(review);
	
	// 리뷰 작성시 최종결제금액에 10% 적립
	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer = customerDao.getCustomerByCustNo(loginedUser.getNo());
	customer.setPoint(customer.getPoint() + orderProduct.getOrder().getTotalPrice() / 10);
	customerDao.updateCustomer(customer);
	
	// 포인트 히스토리에 최종결제금액에 10% 적립
	PointHistoryDao pointHistoryDao = PointHistoryDao.getInstance();
	
	PointHistory pointHistory = new PointHistory();
	
	pointHistory.setCustomer(loginedUser);
	pointHistory.setStatus("적립");
	pointHistory.setUseAmount((int) (orderProduct.getOrder().getTotalPrice() / 10));
	pointHistory.setContents("리뷰작성");
	pointHistory.setOrderProductNo(orderProductNo);
	pointHistoryDao.insertPointHistoryByCustNo(pointHistory);

	response.sendRedirect("reviewlist.jsp");
%>

