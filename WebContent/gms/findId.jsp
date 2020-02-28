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
    #nameck.active{
    	display: inline-block;
    }
    #nameck{
    	display: none;
    }
    #phoneck.active{
    	display: inline-block;
    }
    #phoneck{
    	display: none;
    }
    #emailck.active{
    	display: inline-block;
    }
    #emailck{
    	display: none;
    }
    #idck.active{
    	display: inline-block;
    }
    #idck{
    	display: none;
    }
    
    #emailckpwd{
    	display: none;
    }
    #emailckpwd.active{
    	display: inline-block;
    }
    #idckpwd{
    	display: none;
    }
    #idckpwd.active{
  		display: inline-block;
    }
    #nameckpwd{
    	display: none;
    }
    #nameckpwd.active{
    	display: inline-block;
    }
    
    #phoneckpwd{
    	display: none;
    }
    
    #phoneckpwd.active{
    	display: inline-block;
    }
    
    <%
    	String name= request.getParameter("OK");
    	String id= request.getParameter("ID");
    	String check = request.getParameter("check");
    %>

</style>
</head>
<body>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	
	<div class="row">
		<h1 style="font-size: 45px;"><strong>ID/PW 찾기</strong></h1>
	
		<div class="row" style="margin-left: 0px;">
				<ul class="nav nav-tabs" style="border-bottom: 2px solid black;">
					<li id="fid"><a href="" onclick="showbox1(event)">ID 찾기</a></li>
					<li id="fpwd"><a href="" onclick="showbox2(event)">비밀번호 찾기</a></li>
				</ul>
			</div>
		<form action="findIdForm.jsp" id="findIdform" method="post">
			<strong style="margin-bottom: 50px;">본인 확인을 통해 아이디를 찾을수 있습니다.</strong>
			<div class="form-group" style="padding-top: 20px;">
				<input type="text" class="form-control" name="username" id="username" placeholder="이름" onchange="ValidCheck()"/>
				<span id="nameck" style="color: red;">이름을 입력해 주세요.</span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="userphone" id="userphone" placeholder="전화번호를 입력해주세요." onchange="ValidCheck()" />
				<span id="phoneck" style="color: red;">전화번호를 입력해 주세요.</span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="useremail" id="useremail" placeholder="이메일" onchange="ValidCheck()"/>
				<span id="emailck" style="color: red;">이메일을 입력해 주세요.</span>
			</div>
			<div class="getIdboard" id="getIdboard">
				<%
					if(name != null && name.equals("YES")){
				%>
				<span id="getId">찾으시는 아이디는 : <strong>'<%=id %>'</strong> 입니다.</span>
				<%
					}else if(name != null && name.equals("NO")){
				%>
					<span id="failId">일치하는 정보가 없습니다.</span>
				<%
					}
				%>
			</div>
			<div>
				<button type="button" class="blackbox" style="margin-bottom: 20px;" onclick="checkvalues()">아이디 찾기</button>
			</div>
		</form>
		<form action="findPassWord.jsp" id="findPasswordform" method="post">
			<strong>이메일,아이디, 기본정보 확인을 통해 비밀번호를 찾으실수 있습니다.</strong>
			<div class="form-group" style="padding-top: 20px;">
				<input type="text" class="form-control" name="userid" id="useridpwd" placeholder="아이디" onchange="isemptyPwd()"/>
				<span id="idckpwd"  style="color: red;">아이디을 입력해 주세요.</span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="username" id="usernamepwd" placeholder="이름" onchange="isemptyPwd()"/>
				<span id="nameckpwd" style="color: red;">이름을 입력해 주세요.</span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="userphone" id="userphonepwd" placeholder="전화번호를 입력해주세요." onchange="isemptyPwd()" />
				<span id="phoneckpwd" style="color: red;">전화번호를 입력해 주세요.</span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="useremail" id="useremailpwd" placeholder="이메일" onchange="isemptyPwd()"/>
				<span id="emailckpwd" style="color: red;">이메일을 입력해 주세요.</span>
			</div>
				<%
				if(name != null && name.equals("NO")){
				%>
					<span id="failId">일치하는 정보가 없습니다.</span>
				<%
					}
				%>
			<div>
				<button type="button" class="blackbox" style="margin-bottom: 20px;" onclick="checkvaluespwd()">비밀번호 찾기</button>
			</div>
		</form>
		
	</div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript">

(function() {
	if(<%=check.equals("ID")%>){
		document.querySelector("#findPasswordform").style.display = 'none';	
		document.getElementById("fid").className = "active";
	}else if(<%=check.equals("PWD")%>){
		document.querySelector("#findIdform").style.display = 'none';		
		document.getElementById("fpwd").className = "active";
	}
	})();

	// 다른 함수에서 호출하는(실행하는) 함수
	function hideAllBox() {
		document.querySelector("#findIdform").style.display = 'none';	
		document.querySelector("#findPasswordform").style.display = 'none';	  		
	}
	
	// 버튼 클릭시 실행되는 함수
	function showbox1(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#findIdform").style.display = 'block';
		
		$('#idckpwd').removeClass('active');
    	$('#nameckpwd').removeClass('active');
    	$('#emailckpwd').removeClass('active');
    	$('#phoneckpwd').removeClass('active');
	}

	// 버튼 클릭시 실행되는 함수
	function showbox2(e) {
		// 수행문에서 다른 함수 실행
		e.preventDefault();
		$(e.target).parents('ul').find('li').removeClass('active');
		$(e.target).parent().addClass('active')
		hideAllBox();
		document.querySelector("#findPasswordform").style.display = 'block';	  	
		
		$('#nameck').removeClass('active');
    	$('#phoneck').removeClass('active');
    	$('#emailck').removeClass('active');
	}
	

function checkvalues() {
	 var name = document.getElementById("username").value;
     var phone = document.getElementById("userphone").value;
     var email = document.getElementById("useremail").value;
  
     if(isNull(name)){
     	$('#nameck').addClass('active');
     }
     if(isNull(phone)){
     	$('#phoneck').addClass('active');
     }
     if(isNull(email)){
     	$('#emailck').addClass('active');
     }
     
     if(!isNull(name) && !isNull(phone) && !isNull(email)){
    	 console.log("완료");
    	$('#findIdform').submit(); 
     }
}

function isNull(elm)
{
        //Null 체크 함수
        var elm;
        return (elm == null || elm == "" || elm == "undefined" || elm == " ") ? true : false
}

function ValidCheck()
{
        var name = document.getElementById("username").value;
        var phone = document.getElementById("userphone").value;
        var email = document.getElementById("useremail").value;
        
        if(!isNull(name)){
        	$('#nameck').removeClass('active');
        };
        if(!isNull(phone)){
        	$('#phoneck').removeClass('active');
        }
        if(!isNull(email)){
        	$('#emailck').removeClass('active');
        };
   
}

function isemptyPwd() {
	var id = document.getElementById("useridpwd").value;
    var phone = document.getElementById("userphonepwd").value;
    var email = document.getElementById("useremailpwd").value;
    var name = document.getElementById("usernamepwd").value;
    
    if(!isNull(id)){
    	$('#idckpwd').removeClass('active');
    };
    if(!isNull(name)){
    	$('#nameckpwd').removeClass('active');
    }
    if(!isNull(email)){
    	$('#emailckpwd').removeClass('active');
    };
    if(!isNull(phone)){
    	$('#phoneckpwd').removeClass('active');
    }
}

function checkvaluespwd() {
	var id = document.getElementById("useridpwd").value;
    var phone = document.getElementById("userphonepwd").value;
    var email = document.getElementById("useremailpwd").value;
    var name = document.getElementById("usernamepwd").value;
 
    if(isNull(id)){
    	$('#idckpwd').addClass('active');
    };
    if(isNull(name)){
    	$('#nameckpwd').addClass('active');
    }
    if(isNull(email)){
    	$('#emailckpwd').addClass('active');
    };
    if(isNull(phone)){
    	$('#phoneckpwd').addClass('active');
    }
    
    if(!isNull(name) && !isNull(phone) && !isNull(email) && !isNull(id)){
   		console.log("완료");
   		$('#findPasswordform').submit(); 
    }
}

</script>
</body>
</html>