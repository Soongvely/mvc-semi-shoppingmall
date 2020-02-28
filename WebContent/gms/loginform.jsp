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
	#gh {
		width: 100%;
		height: 100%;
		position: relative;
		text-align: center;
	}
	#gh .row {
		width: 300px;
		height: 100%;
		margin-left: 40%;
	}
	#gh .blackbox {
		width: 100%;
		height: 40px;
		background-color: black;
		color: white;
		font-size: 20px;
	}
	#gh ul {
		list-style-type: none;
  		text-align: center;
  	}
  	#gh li {  		
		list-style-type: none;
  		text-align: center;
  	}
  	#gh a {
        display: inline;
        color: black;
        text-decoration: none;
        padding: 5px;
        float: left;
    }

	
</style>
</head>
<body>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	
	<div class="row">
		<h1><strong>LOGIN</strong></h1>
	
	<%	
		String pageNo = request.getParameter("pageno");
		String fail = request.getParameter("fail");
		String success = request.getParameter("success");
		String pwdok = request.getParameter("pwdok");
		
		if ("invalid".equals(fail)) {
	%>
		
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<strong style="font-size: 20px;">로그인 실패</strong>
				<p style="padding-top: 10px;">아이디 혹은 비밀번호가</p> 
				<p>일치하지 않습니다.</p>
			</div>
		</div>
	<%
		} else if ("deny".equals(fail)) {
	%>
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<strong style="font-size: 20px;">서비스 거부</strong>
				<p style="padding-top: 10px;">요청한 서비스는 로그인 후</p>
				<p>이용가능 합니다.</p>
			</div>
		</div>
	<%
		} else if ("enabled".equals(fail)) {
	%>
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<strong style="font-size: 20px;">탈퇴된 계정</strong>
				<p style="padding-top: 10px;">계정이 탈퇴되었습니다.</p>
				<p>새로 회원가입하세요.</p>
			</div>
		</div>
	<% 		
		} else if ("success".equals(success)) {
	%>
		<div class="col-sm-12">
			<div class="alert alert-success">
				<strong style="font-size: 20px;">회원가입 성공</strong>
				<p style="padding-top: 10px;">로그인 후 이용하세요.</p>
			</div>
		</div>
	<%
		} else if ("pwdok".equals(pwdok)) {
	%>
		<div class="col-sm-12">
			<div class="alert alert-success">
				<strong style="font-size: 20px;">비밀번호찾기 성공</strong>
				<p style="padding-top: 10px;">로그인 후 이용하세요.</p>
			</div>
		</div>
	<%
		}
	%>
		<form action="login.jsp">
			<div class="form-group">
				<input type="text" class="form-control" name="userid" placeholder="아이디" />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="userpwd" placeholder="비밀번호"/>
			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" name="pageno" value="<%=pageNo%>"/>
			</div>
			<div>
				<button type="submit" class="blackbox" style="margin-bottom: 20px;">LOGIN</button>
			</div>
		</form>
		
		<ul class="list-group">
			<li><a href="registerform.jsp" style="padding-right: 20px; padding-left: 20px;">회원가입</a></li>
			<li><a href="findId.jsp?check=ID" style="padding-right: 20px;">아이디찾기</a></li>
			<li><a href="findId.jsp?check=PWD">비밀번호찾기</a></li>
		</ul>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>