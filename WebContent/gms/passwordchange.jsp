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
	#gh .starR {
		background: url(resources/images/profile/star.png) no-repeat right 0;
	  	background-size: auto 100%;
	  	width: 30px;
	  	height: 30px;
	  	display: inline-block;
	  	text-indent: -9999px;
	  	cursor: pointer;
	  	ma
	}
	#gh .starR.on {
		background-position:0 0;
	}
	
	#PWDcheck{
    	display: none;
    }
    #PWDcheck.active{
    	display: inline-block;
    }
    #PWDcheck2{
    	display: none;
    }
    #PWDcheck2.active{
    	display: inline-block;
    }
    <%
   	 int userNo = (Integer)pageContext.getSession().getAttribute("userNo");
   		 
   		CustomerDao customerdao = CustomerDao.getInstance();
   		
   		Customer cust = customerdao.getCustomerByCustNo(userNo);
    %>
  </style>
</head>
<body>
<%
%>
<%@include file="navBarB.jsp"%>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-12">
			<h3>변경할 비밀번호</h3>
			<form id="changePWD" action="passwordchangeform.jsp" method="post">
				<input type="hidden" name="userNo" value="<%=userNo%>">
				<div class="form-group" style="padding-top: 20px;">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-6">
						<input id="firstPWD" type="password" class="form-control" name="password" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<h3>비밀번호 재입력</h3>
				<div class="form-group" style="padding-top: 20px;">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-6">
						<input id="lastPWD" type="password" class="form-control" name="password" onchange="comparePWD()" />
						<span id="PWDcheck" style="color: red;">입력하신 비밀번호가 다릅니다.</span>
						<span id="PWDcheck2" style="color: red;">입력하신 비밀번호가 이전 비밀번호와 같습니다.</span>
					</div>
					<div class="col-sm-2"> 
						<input type="button" class="btn" style="background-color: black; color: white;" value="확인" onclick="submit()"/>
					</div>
				</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
	var submitCK = false;
	function comparePWD() {
		var firstPWD = document.getElementById("firstPWD").value;
		var lastPWD = document.getElementById("lastPWD").value;
		var currentPWD = <%=cust.getPassword()%>;
		
		$("#PWDcheck2").removeClass("active");
		$("#PWDcheck").removeClass("active");
		
		if(firstPWD != lastPWD){
			$("#PWDcheck").addClass("active");
			submitCK = false;
		}else{
		$("#PWDcheck").removeClass("active");
			if(lastPWD == currentPWD ){
				$("#PWDcheck2").addClass("active");
				submitCK = false;
			}else{
				$("#PWDcheck2").removeClass("active");
				submitCK = true;
			}
		}
		
	}
	
	function submit() {
		if(submitCK){
			$("#changePWD").submit();
		}
	}
</script>
</body>
</html>