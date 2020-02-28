<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.dao.CustomerDao"%>
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
    #gh .a1 {
    	padding: 0px;
    	margin-left: 10px;
    	margin-right: 10px;
    	text-align: center;
    }
    #gh .list-group {
    	border-bottom: 2px solid black;
    	padding-bottom: 30px;
    	font-weight: bold;
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
    #gh .padd > div {
    	padding-bottom: 10px;
    	text-align: left;
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
		response.sendRedirect("loginform.jsp?fail=deny");
		return;
	}
	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer = customerDao.getCustomerByCustNo(loginedUser.getNo());
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
%>
<%@include file="navBarB.jsp"%>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-2">
		<!-- 좌측메뉴 -->
			<h2><strong><%=loginedUser.getName() %></strong></h2>
			<p><small><%=loginedUser.getEmail() %></small></p>
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
					<a href="pointhistory.jsp"  class="bot"><%=NumberUtils.numberWithComma(loginedUser.getPoint()) %></a>
					</li>
				</ul>
			</div>
			<div>
				<h3>회원정보수정</h3>
				<div class="row list-group" >
					<div class="col-sm-2 padd">
						<div>성명</div>
						<div>아이디</div>
						<div>생일</div>
						<div>성별</div>
					</div>
					<div class="col-sm-10 padd">
						<div><%=loginedUser.getName() %></div>
						<div><%=loginedUser.getId() %></div>
						<div><%=DateUtils .dateToString(loginedUser.getBirthday()) %></div>
						<div><%=loginedUser.getGender() %></div>
					</div>
				</div>
				<div class="row list-group">
					<div class="col-sm-6 text-left" >
						<form action="custupdate.jsp" id="custupdate-form">		
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" name="password" id="user-pwd" />
							</div>
							<div class="form-group">
								<label>연락처</label>
								<input type="text" class="form-control" name="phone" value="<%=customer.getPhone() %>" id="user-phone"/>
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="text" class="form-control" name="email" value="<%=customer.getEmail() %>" id="user-email" />
							</div>
							<div class="form-group">
								<label>주소</label>
								<input type="text" class="form-control" name="address" value="<%=customer.getAddress() %>" id="user-address" />
							</div>
							<div class="text-right">
								<input type="button" class="btn" value="변경하기" onclick="checkFormfield()" style="background-color: black; color: white;" />
							</div>
						</form>
					</div>
				</div>
				<div class="row list-group" ><a href="" data-target="#myModal" data-toggle="modal">회원탈퇴하기</a></div>
							
			</div>
		</div>
	</div>
</div>

<!-- 회원탈퇴를 누르면 모달이 생성됨 -->
<div class="modal fade" id="myModal" role="dialog">
   	<div class="modal-dialog">
   		<!-- Modal content-->
   		<div class="modal-content">
       		 <div class="modal-body">
       		 	<div class="form-group" style="text-align: center;" >
        			<p>정말 회원탈퇴를 하시겠습니까?</p>
        		</div>
       		</div>
       		<div class="modal-footer">
         		<a type="button" class="btn btn-default" data-dismiss="modal" >취소</a>
         		<a class="btn btn-default" href="deletecustomer.jsp" >확인</a>
       		</div>
     	</div>
   	</div>
 </div>
 
 <%@include file="footer.jsp" %>
<script type="text/javascript">
function checkFormfield() {
	// inputbox 값을 가져오는 것은 value
	var pwd = document.querySelector("#user-pwd").value;	
	if (pwd == "") {
		alert("비밀번호를 입력하세요");
		return;
	}
	var phone = document.querySelector("#user-phone").value;	
	if (phone == "") {
		alert("연락처를 입력하세요");
		return;
	}
	var email = document.querySelector("#user-email").value;	
	if (email == "") {
		alert("이메일을 입력하세요");
		return;
	}
	var address = document.querySelector("#user-address").value;	
	if (address == "") {
		alert("주소를 입력하세요");
		return;
	}
	
	document.querySelector("#custupdate-form").submit();
}
</script>
</body>
</html>