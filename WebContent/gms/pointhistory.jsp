<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.vo.PointHistory"%>
<%@page import="ezo.shop.dao.PointHistoryDao"%>
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
    #gh .list-group2 {
    	border-bottom: 2px solid black;
    	padding-bottom: 5px;
    	font-weight: bold;
    	font-size: 12px;
    	text-align: center;
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
		response.sendRedirect("loginform.jsp?fail=deny&pageno=pointhistory.jsp");
		return;
	}
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
	
	PointHistoryDao pointHistoryDao = PointHistoryDao.getInstance();
	List<PointHistory> custPoint = pointHistoryDao.getPointHistoryByCustNo(loginedUser.getNo());
	
	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer = customerDao.getCustomerByCustNo(loginedUser.getNo());
%>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-2">
		<!-- 좌측메뉴 -->
		<%
			int addpoint = 0;
			int usepoint = 0;
			for (PointHistory cp : custPoint) {
				if ("적립".equals(cp.getStatus())) {
					addpoint += cp.getUseAmount();
				} else if ("사용".equals(cp.getStatus())) {
					usepoint += cp.getUseAmount();
				}
			}
		%>
			<h2><strong><%=customer.getName() %> 님</strong></h2>
			<p><small><%=customer.getEmail() %></small></p>
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
					<a href="pointhistory.jsp"  class="bot"><%=NumberUtils.numberWithComma(customer.getPoint()) %></a>
					</li>
				</ul>
			</div>
			
			<div>
				<h3>포인트 누적 현황</h3>
					<div class="padd">
						<div class="list-group" >
							<div class="col-sm-4">현재 포인트</div>	
							<div class="col-sm-4">적립 포인트</div>	
							<div class="col-sm-4">사용 포인트</div>	
						</div>
						<div class="list-group1">
							<div class="row text-center">
								<div class="col-sm-4"><%=NumberUtils.numberWithComma(addpoint-usepoint) %> point</div>
							
					
								<div class="col-sm-4"><%=NumberUtils.numberWithComma(addpoint) %> point</div>	
						
								<div class="col-sm-4"><%=NumberUtils.numberWithComma(usepoint) %> point</div>								
								
							</div>
						</div>
					</div>
					<div>
						<p>포인트는 영구히 사용 가능 합니다.</p>
					</div>
			</div>
			
			<div class="row padd" style="margin-top: 50px">
				<h3>마일리지 적립 및 사용</h3>
				<p><small>마일리지는 적립 및 사용하신 내역입니다.</small></p>
			</div>
			
			<div class="row">
				<ul class="nav nav-tabs" style="border-bottom: 2px solid black;">
					<li class="active"><a href="" onclick="showbox1(event)">적립 포인트</a></li>
					<li><a href="" onclick="showbox2(event)">사용 포인트</a></li>
				</ul>
			</div>
			
			<!-- 적립 포인트를 선택하면 나옴 -->
			<div id="pointbox-1">
				<div class="padd">
					<div class="list-group2">
						<div class="row" style="padding-top: 10px;">
							<div class="col-sm-3">적용일자</div>	
							<div class="col-sm-3">적용내용</div>	
							<div class="col-sm-3">포인트</div>
							<div class="col-sm-3">관련주문번호</div>
						</div>
					</div>
					<div class="list-group1">
						<% 		
							for (PointHistory cp : custPoint) {
								if ("적립".equals(cp.getStatus())) {
									
						%>
						<div class="row text-center" style="padding-top: 10px;">
							<div class="col-sm-3"><%=DateUtils.dateToString(cp.getUpdateDate()) %></div>	
							<div class="col-sm-3"><%=cp.getContents() %></div>	
							<div class="col-sm-3"><%=NumberUtils.numberWithComma(cp.getUseAmount()) %> point</div>
							<div class="col-sm-3"><%=cp.getOrderProductNo() == 0 ? "" : cp.getOrderProductNo() %></div>
						</div>						
						<%			
								} 
							}
						%>
					</div>
				</div>
				<div class="row">
					<h5>마일리지 사용기준 및 사용기한</h5>
					<div>
						<p>포인트는 구매금액 제한 없이 현금처럼 사용하실 수 있습니다.</p>
					</div>	
				</div>
			</div>
				
				<!-- 사용 포인트를 선택하면 나옴 -->
			<div id="pointbox-2">
				<div class="padd">
					<div class="list-group2">
						<div class="row" style="padding-top: 10px;">
							<div class="col-sm-3">적용일자</div>	
							<div class="col-sm-3">적용내용</div>	
							<div class="col-sm-3">포인트</div>
							<div class="col-sm-3">관련주문번호</div>
						</div>
					</div>
					<div class="list-group1">
					<% 		
						for (PointHistory cp : custPoint) {
							if ("사용".equals(cp.getStatus())) {
					%>
						<div class="row text-center" style="padding-top: 10px;">
							<div class="col-sm-3"><%=DateUtils.dateToString(cp.getUpdateDate()) %></div>	
							<div class="col-sm-3"><%=cp.getContents() %></div>	
							<div class="col-sm-3"><%=NumberUtils.numberWithComma(cp.getUseAmount()) %> point</div>
							<div class="col-sm-3"><%=cp.getOrderProductNo() == 0 ? "" : cp.getOrderProductNo() %></div>
						</div>
					<%			
							} 
						}
					%>
					</div>
				</div>
				<div class="row">
					<h5>마일리지 사용기준 및 사용기한</h5>
					<div>
						<p>포인트는 구매금액 제한 없이 현금처럼 사용하실 수 있습니다.</p>
					</div>	
				</div>
			</div>	
	
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
//즉시 실행 함수
// 웹 페이지 로딩시 페이지와 관련된 초기화 작업을 실행할 목적으로 사용한다.
(function() {
	document.querySelector("#pointbox-2").style.display = 'none';		
	})();

	// 다른 함수에서 호출하는(실행하는) 함수
	function hideAllBox() {
		document.querySelector("#pointbox-1").style.display = 'none';	
		document.querySelector("#pointbox-2").style.display = 'none';	  		
	}
	
	// 버튼 클릭시 실행되는 함수
	function showbox1(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#pointbox-1").style.display = 'block';
	}

	// 버튼 클릭시 실행되는 함수
	function showbox2(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#pointbox-2").style.display = 'block';	  		
	}
</script>
</body>
</html>