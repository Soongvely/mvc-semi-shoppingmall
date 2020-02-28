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
%>
<%@include file="navBarB.jsp"%>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-12">
			<h3>비밀번호 체크</h3>
	
	<%
		String fail = request.getParameter("fail");
		if ("invalid".equals(fail)) {
	%>
		
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<strong>로그인 실패</strong>
				<p>아이디 혹은 비밀번호가 일치하지 않습니다.</p>
			</div>
		</div>
	<%
		}
	%>
			<form action="passwordcheck.jsp" method="post">
				<div class="form-group" style="padding-top: 20px;">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="password" />
					</div>
					<div class="col-sm-2"> 
						<input type="submit" class="btn" style="background-color: black; color: white;" value="확인"/>
					</div>
				</div>
			</form>
		</div>
		
	</div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">

</script>
</body>
</html>