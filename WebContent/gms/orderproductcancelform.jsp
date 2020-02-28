<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="java.util.Map"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
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
    #gh .a1 {
    	padding: 0px;
    	margin-left: 10px;
    	margin-right: 10px;
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
    	padding-bottom: 30px;
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
	#gh .bold {
		font-weight: bold;
	}
	#gh .list1 {
		float: left;
	}
	#gh .row1 {
		font-style: normal;
		font-weight: bold;
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
		response.sendRedirect("loginform.jsp?fail=deny&pageno=orderproductcancelform.jsp");
		return;
	} 
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
%>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-2">
		<!-- 좌측메뉴 -->
			<h2><strong><%=loginedUser.getName() %>님</strong></h2>
			<p><small><%=loginedUser.getEmail() %></small></p>
			<ul>
				<li><a href="likeheart.jsp"><span class="glyphicon glyphicon-heart"></span> 나의하트  <%=likecount %></a></li>
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
					<a href="pointhistory.jsp"  class="bot"><%=NumberUtils.numberWithComma(loginedUser.getPoint()) %></a>
					</li>
				</ul>
			</div>
			
			<div class="padd">
				<h3>주문상품취소</h3>
				<div class="list-group" >
					<div class="col-sm-7">상품정보</div>	
					<div class="col-sm-2">결제금액</div>	
					<div class="col-sm-3">진행상태</div>	
				</div>
				
				<%
					Integer orderProductNo = Integer.parseInt(request.getParameter("orderproductno"));
				
					OrderProductDao orderProductDao = OrderProductDao.getInstance();
					OrderDao orderDao = OrderDao.getInstance();
	
					OrderProduct orderdetail = orderProductDao.getOrderDetailByOrderProductNo(orderProductNo);
				%>
				<li style="border-bottom: 2px solid black;">
					<div class="list-group1">
						<div class="row">
							<div class="col-sm-7">
								<a href="" class="a1">
									<div class="col-sm-3">
										<img src="<%=orderdetail.getItemOption().getItem().getImagePath() %>" style="width: 100px; height: 100px;"/>
									</div>
									<div class="col-sm-9" style="height: 100px; padding-top: 25px;">
										<p><strong style="padding-bottom: 5px">[<%=orderdetail.getItemOption().getItem().getBrand() %>] <%=orderdetail.getItemOption().getItem().getName() %> </strong></p>
										<p><span><%=orderdetail.getItemOption().getColor() %> <%=orderdetail.getItemOption().getSize() %></span></p>
									</div>							
								</a>
							</div>	
							<div class="col-sm-2">
								<div style="height: 100px; padding-top: 30px">
									<span><%=NumberUtils.numberWithComma(orderdetail.getItemOption().getItem().getDiscountPrice()*orderdetail.getOrderAmount()) %> 원</span>
								</div>
							</div>	
							<div class="col-sm-3">
								<div style="height: 100px; padding-top: 30px">
									<strong><%=orderdetail.getProductStatus() %></strong>
								</div>
							</div>
						</div>
					</div>
				</li>
			</div>
			
			<div class="padd" style="height: 330px; padding-bottom: 0px;">
				<h3>취소정보</h3>
				<div>
					<div class="col-sm-6">
						<div class="row list-group1">
							<p>상품취소금액<strong class="pull-right"><%=NumberUtils.numberWithComma(orderdetail.getItemOption().getItem().getDiscountPrice()*orderdetail.getOrderAmount()) %> 원</strong></p>
						</div>
						<div class="row list-group1">
							<p>배송비<strong class="pull-right">(+) 0 원</strong></p>						
						</div>
						<div class="row list-group1">
							<p>포인트차감<strong class="pull-right">(-) 0 원</strong></p>						
						</div>
						<div class="row list-group1">						
							<p>예치금차감<strong class="pull-right">(-) 0 원</strong></p>						
						</div>
						<div class="row list-group1">						
							<p>보너스쿠폰<strong class="pull-right">(-) 0 원</strong></p>						
						</div>
					</div>
					<div class="col-sm-6">
						<div class="row list-group1" style="height: 253px; padding: 15px;" >
							<p>결제수단 : <%=orderdetail.getOrder().getPaymentMethod() %></p>
							<p style="font-size: 20px; padding-top: 160px;">
								<strong>총 취소금액</strong>
								<strong style="color: #ff4800; font-size: 30px;" class="pull-right"><%=NumberUtils.numberWithComma(orderdetail.getItemOption().getItem().getDiscountPrice()*orderdetail.getOrderAmount()) %> 원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="padd" style="padding-bottom: 0px;">  
				<div class="row">
					<p>저희 쇼핑몰은 포인트가 현금처럼 사용가능하기 때문에 포인트 취소가 아닌, 결제금액 그대로 취소 됩니다.</p>
				</div>
			</div>
				
			<div class="">
				<a href="orderproductcancel.jsp?orderproductno=<%=orderdetail.getNo() %>" style="background-color: black; color: white; width: 100px; height:30px; text-align: center; margin: 25px;" class="pull-right">주문취소</a>
			</div>
			
		
			
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>