<%@page import="ezo.shop.vo.Admin"%>
<%@page import="java.util.Date"%>
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
   <!-- Custom styles for this template -->
   <link href="/semi/resources/admin/css/style.css" rel="stylesheet">
   <link href="/semi/resources/admin/css/style-responsive.css" rel="stylesheet">
   <link href="/semi/resources/admin/css/sy.css?ver=<%=new Date() %>" rel="stylesheet">
   <script src="/semi/resources/admin/lib/jquery/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   
   <script src="/semi/resources/admin/lib/chart-master/Chart.js"></script>
 </head>
   <%
  	   Admin admin = (Admin) session.getAttribute("LOGINED_ADMIN");
	   if (admin == null) {
	   response.sendRedirect("/semi/admin/user/login-form.jsp?fail=deny");
	   return;
	 } 
   %>
 <body>
   <section id="container">
     <header class="header black-bg">
       <div class="sidebar-toggle-box">
         <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
       </div>
       <a href="/semi/admin/home.jsp" class="logo"><b>Soo<span>ng</span></b></a>
       <div class="nav notify-row" id="top_menu">
         <!--  notification start -->
         <ul class="nav top-menu">
           <!-- settings start -->
           <li class="dropdown">
             <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
               <i class="fa fa-tasks"></i>
               <span class="badge bg-theme">4</span>
               </a>
             <ul class="dropdown-menu extended tasks-bar">
               <div class="notify-arrow notify-arrow-green"></div>
               <li>
                 <p class="green">You have <span style="color=orange;">n</span>  pending tasks</p>
               </li>
               <li>
                 <a href="index.html#">
                   <div class="task-info">
                     <div class="desc">Soong Admin Panel</div>
                     <div class="percent">40%</div>
                   </div>
                   <div class="progress progress-striped">
                     <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                       <span class="sr-only">40% Complete (success)</span>
                     </div>
                   </div>
                 </a>
               </li>
               <li>
                 <a href="index.html#">
                   <div class="task-info">
                     <div class="desc">Database Update</div>
                     <div class="percent">60%</div>
                   </div>
                   <div class="progress progress-striped">
                     <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                       <span class="sr-only">60% Complete (warning)</span>
                     </div>
                   </div>
                 </a>
               </li>
               <li>
                 <a href="index.html#">
                   <div class="task-info">
                     <div class="desc">Product Development</div>
                     <div class="percent">80%</div>
                   </div>
                   <div class="progress progress-striped">
                     <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                       <span class="sr-only">80% Complete</span>
                     </div>
                   </div>
                 </a>
               </li>
               <li>
                 <a href="index.html#">
                   <div class="task-info">
                     <div class="desc">Payments Sent</div>
                     <div class="percent">70%</div>
                   </div>
                   <div class="progress progress-striped">
                     <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                       <span class="sr-only">70% Complete (Important)</span>
                     </div>
                   </div>
                 </a>
               </li>
               <li class="external">
                 <a href="#">See All Tasks</a>
               </li>
             </ul>
           </li>
           <!-- settings end -->
           <!-- inbox dropdown start-->
           <li id="header_inbox_bar" class="dropdown">
             <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
               <i class="fa fa-envelope-o"></i>
               <span class="badge bg-theme">5</span>
               </a>
             <ul class="dropdown-menu extended inbox">
               <div class="notify-arrow notify-arrow-green"></div>
               <li>
                 <p class="green">You have 5 new messages</p>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="photo"><img alt="avatar" src=""></span>
                   <span class="subject">
                   <span class="from">Zac Snider</span>
                   <span class="time">Just now</span>
                   </span>
                   <span class="message">
                   Hi mate, how is everything?
                   </span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="photo"><img alt="avatar" src=""></span>
                   <span class="subject">
                   <span class="from">Divya Manian</span>
                   <span class="time">40 mins.</span>
                   </span>
                   <span class="message">
                   Hi, I need your help with this.
                   </span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="photo"><img alt="avatar" src=""></span>
                   <span class="subject">
                   <span class="from">Dan Rogers</span>
                   <span class="time">2 hrs.</span>
                   </span>
                   <span class="message">
                   Love your new Dashboard.
                   </span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="photo"><img alt="avatar" src=""></span>
                   <span class="subject">
                   <span class="from">Dj Sherman</span>
                   <span class="time">4 hrs.</span>
                   </span>
                   <span class="message">
                   Please, answer asap.
                   </span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">See all messages</a>
               </li>
             </ul>
           </li>
           <li id="header_notification_bar" class="dropdown">
             <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
               <i class="fa fa-bell-o"></i>
               <span class="badge bg-warning">7</span>
               </a>
             <ul class="dropdown-menu extended notification">
               <div class="notify-arrow notify-arrow-yellow"></div>
               <li>
                 <p class="yellow">You have 7 new notifications</p>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                   Server Overloaded.
                   <span class="small italic">4 mins.</span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="label label-warning"><i class="fa fa-bell"></i></span>
                   Memory #2 Not Responding.
                   <span class="small italic">30 mins.</span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                   Disk Space Reached 85%.
                   <span class="small italic">2 hrs.</span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">
                   <span class="label label-success"><i class="fa fa-plus"></i></span>
                   New User Registered.
                   <span class="small italic">3 hrs.</span>
                   </a>
               </li>
               <li>
                 <a href="index.html#">See all notifications</a>
               </li>
             </ul>
           </li>
         </ul>
       </div>
	       <div class="top-menu">
	         <ul class="nav pull-right top-menu">
         <%
        	Admin adminAccount = (Admin) session.getAttribute("LOGINED_ADMIN");
         	if (adminAccount == null) {         		
         %>
	           <li><a class="logout" href="#">Login</a></li>
         <%         
         	} else { 
         %>  
           <li><a class="logout" href="/semi/admin/user/logout.jsp">Logout</a></li>
         <%
         	}
         %> 
         </ul>
       </div>
     </header>
     <!--header end-->
   
     <!--sidebar start-->
	     <aside>
	       <div id="sidebar" class="nav-collapse ">
	         <!-- sidebar menu start-->
	         <ul class="sidebar-menu" id="nav-accordion">
	           <p class="centered"><img src="" class="img-circle" width="80"></p>
	           <h5 class="centered">seungyeon</h5>
	           <li class="mt">
	             <a class="<%=request.getRequestURI().equals("/semi/admin/home.jsp") ? "active" : "" %>" href="/semi/admin/home.jsp">
	               <i class="fa fa-home"></i>
	               <span>메인</span>
	               </a>
	           </li>
	
	           <!-- 상품관리 메뉴-->
	           <li class="sub-menu">
	             <a href="#" class=" <%=
	            		 request.getRequestURI().equals("/semi/admin/product/product-form.jsp") ||
	            		 request.getRequestURI().equals("/semi/admin/product/product.jsp") ? "active" : "" %>">
	               <i class="fa fa-shopping-cart"></i>
	               <span>상품관리</span>
	               </a>
	             <ul class="sub">
	               <li><a href="/semi/admin/product/product-form.jsp">상품등록</a></li>
	               <li><a href="/semi/admin/product/product.jsp">상품목록</a></li>
	             </ul>
	           </li>
	           <!-- 주문관리 메뉴-->
	           <li class="sub-menu">
	             <a href="#" class=" <%=
	            		 request.getRequestURI().equals("/semi/admin/order/order.jsp") ||
	            		 request.getRequestURI().equals("/semi/admin/order/payment.jsp") ? "active" : "" %>">
	               <i class="fa fa-truck"></i>
	               <span>주문관리</span>
	               </a>
	             <ul class="sub" >
	               <li><a href="/semi/admin/order/order.jsp">전체 주문목록</a></li>
	               <li><a href="/semi/admin/order/payment.jsp">취소/교환/반품</a></li>
	             </ul>
	           </li>
	           <!-- 고객관리 메뉴-->
	           <li>
	             <a class="<%=request.getRequestURI().equals("/semi/admin/customer/customer.jsp") ? "active" : "" %>" href="/semi/admin/customer/customer.jsp">
	               <i class="fa fa-user"></i>
	               <span>고객관리</span>
	               </a>
	           </li>
	           <!-- 문의관리 메뉴-->
	           <li>
	             <a class="<%=request.getRequestURI().equals("/semi/admin/board/board.jsp") ? "active" : ""  %>" href="/semi/admin/board/board.jsp">
	               <i class="fa fa-list-ul"></i>
	               <span>문의관리</span>
	               </a>
	           </li>
	         </ul>
	         <!-- sidebar menu end-->
	       </div>
	     </aside>