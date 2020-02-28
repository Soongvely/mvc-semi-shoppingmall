<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
 <head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title></title>
   <link href="/semi/resources/admin/img/favicon.png" rel="icon">
   <link href="/semi/resources/admin/img/apple-touch-icon.png" rel="apple-touch-icon">
	
   <!-- Bootstrap core CSS -->
   <link href="/semi/resources/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <!--external css-->
   <link href="/semi/resources/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
   <link rel="stylesheet" type="text/css" href="/resources/admin/css/zabuto_calendar.css">
   <link rel="stylesheet" type="text/css" href="/resources/admin/lib/gritter/css/jquery.gritter.css" />
   <!-- Custom styles for this template -->
   <link href="/semi/resources/admin/css/style.css" rel="stylesheet">
   <link href="/semi/resources/admin/css/style-responsive.css" rel="stylesheet">
   <script src="/semi/resources/admin/lib/chart-master/Chart.js"></script>
   <script src="/semi/resources/admin/lib/jquery/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 </head>
 <body>  
 <%
 	if(session.getAttribute("LOGINED_ADMIN") != null)
 		response.sendRedirect("/semi/admin/home.jsp");
 %>
 <div id="login-page">
    <div class="container">  
      <form class="form-login" action="/semi/admin/user/login.jsp">
        <h2 class="form-login-heading">로그인</h2>
       <%
       	String fail = request.getParameter("fail");
       
       	if ("invalid".equals(fail)) {
       %>    
	       	<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-danger text-center">
						<strong>아이디 혹은 패스워드가 일치하지 않습니다.</strong> 						
					</div>
				</div>
			</div>
       <%		
       	} else if ("deny".equals(fail)) {
       %>    
       		<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-warning text-center">
						<strong>로그인 후 이용가능합니다.</strong> 				
					</div>
				</div>
			</div>	
       <% 
         }   
       %>
        <div class="login-wrap">
          <input type="text" class="form-control" name="userid" placeholder="아이디" autofocus autocomplete="off">
          <br>
          <input type="password" class="form-control" name="userpwd" placeholder="패스워드">       
          <label class="checkbox">
            <input type="checkbox" name="rememberme" value="remember-me" style="margin-left: 1%;"> <span style="margin-left: 7%;">아이디 저장</span>
            <span class="pull-right">
            	<a data-toggle="modal" href="login.html#myModal">패스워드 찾기</a>
            </span>
            </label>
          <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> Login</button>
          <hr>
          <div class="registration">
            <a class="" href="#">새 계정 만들기</a>
          </div>
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">패스워드 찾기</h4>
              </div>
              <div class="modal-body">
                <p>이메일 주소를 입력하여 비밀번호를 재설정해주세요.</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
                <button class="btn btn-theme" type="submit">확인</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/semi/resources/admin/lib/jquery/jquery.min.js"></script>
  <script src="/semi/resources/admin/lib/bootstrap/js/bootstrap.min.js"></script>
  
  <!--BACKSTRETCH-->
  <script type="text/javascript" src="/semi/resources/admin/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("/semi/resources/admin/img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>

