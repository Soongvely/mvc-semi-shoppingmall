<%@page import="ezo.shop.vo.Order"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="java.util.Map"%>
<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.dao.ItemDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  	#gh ul {
  		list-style-type: none;
  		text-align: center;
  	}
  	
  	#gh li {
  		list-style-type: none;
  		text-align: center;
  	}
  	#gh a {
         display: block;
         color: black;
         text-align: left;
         text-decoration: none;
         padding: 5px;
    }
    #gh .list-group {
		border-bottom: 2px solid black;
    	padding-bottom: 30px;
    	font-weight: bold;
    	margin-bottom: -5px;
    	font-size: 12px;
    	text-align: center;
    }
    #gh .list-group1 {
    	border-bottom: 1px solid gray;
    	padding-bottom: 10px;
    }
    #gh h3 {
    	border-bottom: 3px solid black;
    	padding: 5px;
    	padding-bottom: 10px;
    }
    #gh h5 {
    	font-weight:bold;
    }
    #gh .padd {
    	padding-bottom: 20px;
    }
	#gh .back {
		background-color: black;
		color: white;
		padding-top: 15px;
		padding-bottom: 20px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#gh .bot {
		margin-top: 40px;
		margin-bottom: -30px;
		color: white;
		font-size: 20px;
	}
	#gh .bot:hover {
		color: white;
	}
	#gh .row {
		padding-top: 10px
	}
  </style>
</head>
<body>
<%
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=mypage.jsp");
		return;
	}
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
%>
<%@include file="navBarB.jsp"%>    
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-2">
		<!-- 좌측메뉴 -->
			<h2><strong><%=loginedUser.getName()%>님</strong></h2>
			<p><small><%=loginedUser.getEmail()%></small></p>
			<ul>
				<li><a href="likeheart.jsp"><span class="glyphicon glyphicon-heart"></span> 나의하트 <%=likecount %></a></li>
			</ul>
			
			<h5><strong>나의쇼핑정보</strong></h5>
			<ul>			
				<li><a href="orderdeliverylist.jsp">주문배송조회</a></li>
				<li><a href="canscelexchange.jsp">취소/교환 내역</a></li>
				<li><a href="reviewlist.jsp">상품리뷰</a></li>
				<li><a href="">증빙서류 발급</a></li>
			</ul>
			
			<h5><strong>나의 계정설정</strong></h5>
			<ul>
				<li><a href="passwordform.jsp">회원정보수정</a></li>
				<li><a href="pointhistory.jsp">포인트현황</a></li>
				<li><a href="">회원등급</a></li>
				<li><a href="">쿠폰</a></li>
			</ul>
			
			<h5><strong>고객센터</strong></h5>
			<ul>
				<li><a href="questionboard.jsp">문의게시판</a></li>
				<li><a href="notice.jsp">공지사항</a></li>				
				<li><a href="">FAQ</a></li>				
			</ul>		
		</div>
		
		<div class="col-sm-10">
			<div class="row back">
				<ul class="col-sm-4" >
					<li style="text-align: left;">
						<span>회원등급 ></span>
						<a href="" class="bot">GREEN
							<span class="pull-right">할인혜택 보기</span>
						</a>
					</li>
				</ul>
				<ul class="col-sm-4">
					<li style="text-align: left;">
						<span>사용가능쿠폰 ></span>
						<a href=""  class="bot">4</a>
					</li>
				</ul>
				<ul class="col-sm-4">
					<li style="text-align: left;">
					<span>포인트 ></span>
					<a href="pointhistory.jsp" class="bot"><%=NumberUtils.numberWithComma(loginedUser.getPoint())%></a>
					</li>
				</ul>
			</div>
			
			<div style="padding-bottom: 20px; padding-top: 20px;">
				<h3>최근주문<span><a href="orderdeliverylist.jsp" class="pull-right"><small>더보기 ></small></a></span></h3>
				<div class="list-group" >
					<div class="col-sm-2">주문일</div>	
					<div class="col-sm-3">주문상태</div>		
					<div class="col-sm-3">결제수단</div>		
					<div class="col-sm-2">주문번호</div>	
					<div class="col-sm-2">결제금액</div>	
				</div>
					
				<%
					OrderDao orderDao = OrderDao.getInstance();
					List<Order> orders = orderDao.getOrdersevendaysByCustNo(loginedUser.getNo());
					for (Order order : orders) {
				%>
				<div class="list-group1" style="border-bottom: 1px solid black; padding-bottom: 10px;">
					<a href="orderdetail.jsp?orderno=<%=order.getNo() %>" class="a1">
						<div class="row">
							<div class="col-sm-2" style="text-align: center"><%=DateUtils.dateToString(order.getCreateDate()) %></div>	
							<div class="col-sm-3" style="text-align: center"><%=order.getPaymentStatus() %></div>		
							<div class="col-sm-3" style="text-align: center"><%=order.getPaymentMethod() %></div>	
							<div class="col-sm-2" style="text-align: center"><%=order.getNo() %></div>	
							<div class="col-sm-2" style="text-align: center"><%=NumberUtils.numberWithComma(order.getTotalPrice()) %> 원</div>	 
						</div>
					</a>
				</div>
				<%
					}
				%>	
			</div>
		
			<%
				List<Like> likes = likeDao.getLikefiveByCustNo(loginedUser.getNo());
			%>
			<div>
				<h3>MY HEART<span><a href="likeheart.jsp" class="pull-right"><small>더보기 > </small></a></span></h3>
				<table class="table">
					<div>
						<div class="list-group1">
							<h5>Products</h5>
							<div class="row">
								<ol>
									<li>
									<%	
										if (likes.isEmpty()) { 
									%>
										<p>상품 하트내역이 없습니다.</p> 
									<%
										}	
										for (Like like : likes) {
									%>
									<div>
										<a href="detail.jsp?itemno=<%=like.getItem().getNo() %>&cateNo=<%=like.getItem().getCategory().getNo() %>" style="text-align: left; float: left;">
											<img src="<%=like.getItem().getImagePath() %>" style="width: 170px; height: 170px;" />
											<div class="caption" style="width: 150px">
												<span><%=like.getItem().getName() %></span>			
											</div>
										</a>
									</div>
									<%
										}
									%>
									</li>
								</ol>
							</div>
						</div>
						
						<div class="list-group1">
						<h5>Brand</h5>
							<ol>
								<li>
									<p>브랜드 하트내역이 없습니다.</p>
								</li>
							</ol>
						</div>
						<div class="list-group1">
						<h5>Post</h5>
							<ol>
								<li>
									<p>포스트 하트내역이 없습니다.</p>
								</li>
							</ol>
						</div>
					</div>
				</table>
			</div>	
					
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>