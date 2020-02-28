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
  <style type="text/css">
	#gh {
		width: 100%;
		height: 100%;
		position: relative;
		text-align: center;
	}
	#gh .row {
		width: 300px;
		height: 700px;
		margin-left: 40%; 
	}
	#gh .blackbox {
		width: 100%;
		height: 40px;
		background-color: black;
		color: white;
		font-size: 16px;
	}
	#register-form {
		text-align: left;
	}
	#gh label {
		font-size: 13px;
		margin-bottom: -5px;
	}
  </style>
</head>
<body>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	<div class="row">
		<h1>회원가입</h1>
		<hr style="border: 2px solid black;"/>
	
		<%
			String fail = request.getParameter("fail");
			if ("dup".equals(fail)) {
		%>
			
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>회원가입 실패</strong> 
					<p>동일한 아이디가 이미 존재합니다.</p>
				</div>
			</div>
			
		<%
			} 
		%>
		<!-- 아이디,  비번, 이름, 생일, 성별, 이메일, 연락처 , 주소,   -->
		<form action="register.jsp" method="post" id="register-form">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" class="form-control" name="userid" id="user-id" placeholder="아이디를 입력하세요."/>
			</div>	
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" class="form-control" name="userpwd" id="user-pwd" placeholder="비밀번호를 입력하세요."/>
			</div>	
			<div class="form-group">
				<label>이름</label>
				<input type="text" class="form-control" name="username" id="user-name" placeholder="이름을 입력하세요."/>
			</div>	
			<div class="form-group">
				<label>생년월일</label>
				<input type="date" class="form-control" name="userbirthday" id="user-birthday" />
			</div>
			<div class="form-group">
				<label>성별</label>
				<div class="radio">
					<label class="form-inline">
						<input type="radio" name="usergender" value="F" id="user-gender-f" checked="checked" /> 여자
					</label>
					<label class="form-inline">
						<input type="radio" name="usergender" value="M" id="user-gender-m"  /> 남자
					</label>
				</div>
			</div>	
			<div class="form-group">
				<label>이메일</label>
				<input type="email" class="form-control" name="useremail" id="user-email" placeholder="이메일을 입력하세요." />
			</div>
			<div class="form-group">
				<label>연락처</label>
				<input type="text" class="form-control" name="userphone" id="user-phone" placeholder="전화번호를 입력하세요." />
			</div>
			<div class="form-group">
				<label>주소</label>
				<input type="text" class="form-control" name="useraddress" id="user-address" placeholder="주소를 입력하세요." />
			</div>
			<div class="text-right">
				<button onclick="checkFormfield()" type="button" class="blackbox" >가입하기</button>
			</div>
		</form>
	</div>

</div>
	
<%@include file="footer.jsp" %>
<script type="text/javascript">
function checkFormfield() {
	// inputbox 값을 가져오는 것은 value
	var id = document.querySelector("#user-id").value;	
	if (id == "") {
		alert("아이디를 입력하세요");
		return;
	}
	var pwd = document.querySelector("#user-pwd").value;	
	if (pwd == "") {
		alert("비밀번호를 입력하세요");
		return;
	}
	var name = document.querySelector("#user-name").value;	
	if (name == "") {
		alert("이름을 입력하세요");
		return;
	}
	var birthday = document.querySelector("#user-birthday").value;	
	if (birthday == "") {
		alert("생년월일을 입력하세요");
		return;
	}
	var email = document.querySelector("#user-email").value;	
	if (email == "") {
		alert("이메일을 입력하세요");
		return;
	}
	var phone = document.querySelector("#user-phone").value;	
	if (phone == "") {
		alert("연락처를 입력하세요");
		return;
	}
	var address = document.querySelector("#user-address").value;	
	if (address == "") {
		alert("주소를 입력하세요");
		return;
	}
	
	document.querySelector("#register-form").submit();
}	
</script>
</body>
</html>