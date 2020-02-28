<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
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
		padding-top: 10px;
	}
	
	#gh .ghleft {
  		float: left;
  		font-size: 20px;
  		color: #5d5d5d;
  		margin-right: 20px; 
	}
	#gh .ghleft:hover {
  		font-size: 20px;
  		font-weight: bold;
	  	background-color: #ff4800;
	}
	#gh .ghleft:active {
  		font-size: 20px;
  		font-weight: bold;
	  	background-color: #ff4800;
	}
	#gh .ghleft:focused {
  		font-size: 20px;
  		font-weight: bold;
	  	background-color: #ff4800;
	} 
	#gh .ghheart {
		text-align: center;
		margin-top: 30px;
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
	
	ItemDao itemDao = ItemDao.getInstance(); 
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
			
			<div style="padding-top: 20px;"> 
				<div class="row nav nav-tabs" style="padding-left: 25%">  
					<ul class="">
						<li class="active ghleft"><a href="" onclick="showbox1(event)">PRODUCT (<%=likecount %>)</a></li>
						<li class="ghleft"><a href="" onclick="showbox2(event)">BRAND (0)</a></li>
						<li class="ghleft"><a href="" onclick="showbox3(event)">POST (0)</a></li>
					</ul>
				</div>
			</div>
		
			<!-- product 클릭했을때 -->
			<div id="box-1">
			<%
				List<Map<String, Object>> items = itemDao.getAllItemCountReviewandLikeBycustNo(loginedUser.getNo());
				if (items.isEmpty()) {
			%>
				<div class="ghheart row">
					<p>하트한 내역이 없습니다.</p>
				</div>
			<%		
				} else {
			%>
				<div class="row ghheart"> 
			<% 	
					for (Map<String, Object> item : items) { 
			%> 
					<div class="col-sm-3"> 
						<a href="detail.jsp?itemno=<%=item.get("ITEM_NO") %>&cateNo=<%=item.get("CATE_NO") %>" >  
							<img src="<%=item.get("ITEM_IMAGE_PATH") %>" style="width: 200px; height: 200px;" />
							<div class="caption" style="font-size: 12px; height: 120px; position: relative;">
								<p style="text-decoration: underline; margin: 0px; font-weight: bold;"><%=item.get("ITEM_BRAND") %></p>
								<p style="color: #5d5d5d;"><%=item.get("ITEM_NAME") %></p>
								
								<div style="bottom: 13px; position: absolute;">
								<%
									if (((BigDecimal)item.get("ITEM_DISCOUNT_RATE")).intValue() == 0) {  
								%>	  
									<p style="margin: 0px; font-weight: bold;"><%=NumberUtils.numberWithComma(((BigDecimal)item.get("ITEM_PRICE")).intValue()) %> 원</p>
								<%
									} else {
								%>
									<p style="color: #d4d4d4; margin: 0px;"><%=NumberUtils.numberWithComma(((BigDecimal)item.get("ITEM_PRICE")).intValue()) %></p>
									<p style="color: #ff4800; font-weight: bold; margin: 0px;"><%=item.get("ITEM_DISCOUNT_RATE")  %>% <%=NumberUtils.numberWithComma(((BigDecimal)item.get("ITEM_DISCOUNT_PRICE")).intValue()) %> 원</p>
								<%
									}
								%>
									<form action="likecancel.jsp">
										<button id="gunheart-<%=item.get("ITEM_NO") %>" 
											  class="glyphicon glyphicon-heart gunheart"
											  style="color: #ff4800; margin-right: 15px; border: none; background-color: white;"
											  type="submit" name="itemno" value="<%=item.get("ITEM_NO") %>"><%=item.get("ITEM_LIKE_COUNT") %>
										</button>
										<span class="glyphicon glyphicon-comment" style="color: #5d5d5d;"><%=item.get("REVIEWCNT") %></span> 
									</form>
								</div>
							</div>
						</a>
					</div>
				<%		
						}
				%>
				</div>
				<%
					}
				%>	
			</div>	
					
			<!-- brand 클릭했을때 -->
			<div class="ghheart row" id="box-2">
				<p>하트한 내역이 없습니다.</p>
			</div>
						
			<!-- post 클릭했을 때 -->
			<div class="ghheart row" id="box-3">
				<p>하트한 내역이 없습니다.</p>	 							
			</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
//	function heartcansel(e, no) {
//		document.querySelector("#gunheart-"+no).className = 'glyphicon glyphicon-heart-empty';
		
	(function() {
		document.querySelector("#box-2").style.display = 'none';		
		document.querySelector("#box-3").style.display = 'none';		
	})();
	
	// 다른 함수에서 호출하는(실행하는) 함수
	function hideAllBox() {
		document.querySelector("#box-1").style.display = 'none';	
		document.querySelector("#box-2").style.display = 'none';	  		
		document.querySelector("#box-3").style.display = 'none';	  		
	}
	function showbox1(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#box-1").style.display = 'block';
	}
	// 버튼 클릭시 실행되는 함수
	function showbox2(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#box-2").style.display = 'block';	  		
	}
	// 버튼 클릭시 실행되는 함수
	function showbox3(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active');
		hideAllBox();
		document.querySelector("#box-3").style.display = 'block';	  		
	}

</script>
</body>
</html>