<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navBar.jsp" %>

	<style type="text/css">
	

	.MJ li{
		list-style: none;
		display: inline-block;
		
	}
	font:hover{
		text-decoration: underline ;
	}

	.big_menub font{
		padding-right: 0px;
		font-weight: 900;
		color: #000;
		font-size: 50px;
	}
	.big_menub li{
		padding-left: 30px;
	}
	.small_menub1 font{
		padding-right: 10px;
		font-weight: 800;
		color: #000;
		font-size: 15px;
		margin-right: 0px;
	}

	.small_menub2 font{
		padding-right: 20px;
		font-weight: 500;
		color: #000;
		font-size: 15px;
		font-style: italic;
	}
	.small_menub1 li {
		padding-left: 10px;
		
	}
	.small_menub2 li {
		padding-left: 0px;
	}

	.mini_menub li{
	 font-size: 17px;
	 padding:0px;
	 padding-right: 10px;
	}
	.search_icon{
		background-color: rgba(1,1,1,0);
		margin-top:10px;
		border: 0px;
	}
	#navBarB.active{
		display: none;
		width: 100%;
		position: fixed;
		-webkit-transform: translateZ(5);
	}
	
	#navBarB {
		
	}
	#searchId input::-webkit-input-placeholder{
		font-size: 25px;
	}

	</style>



<div class="container-fluid MJ" id="navBarB" style="margin-bottom: 70px; background-color: white;">
	<div class="row">
			<div class="col-sm-12" style="height: 56px; background-color: black;">
			</div>
	</div>
		<div class="row">
			<div class="col-sm-2" style="height: 56px; padding-left: 55px; ">
				<a href="main.jsp"><img alt="logo"src="/semi/gms/resources/images/MJImg/10-3.png" style="width:120px; height: 30px; margin-top: 20px; margin-right:10px;"></a>
			</div>
			<div class="col-sm-10" style="height: 56px;" align="right">
				<ul class="mini_menub" style="padding-top: 30px;">
					<li class="glyphicon glyphicon-user"><a href="mypage.jsp" style="font-size: 10px; color: black; padding: 0px; text-decoration: none;">My PAGE</a></li>
					<li class="glyphicon glyphicon-heart"><a href="likeheart.jsp" style="font-size: 10px; color: black; padding: 0px; text-decoration: none;">My HEART</a></li>
					<li class="glyphicon glyphicon-lock"><a href="cart.jsp" style="font-size: 10px; color: black; padding: 0px; text-decoration: none;">SHOPPING BAG</a></li>
					<%
						if (loginedUser_navbar != null) {
					%>
					<li class="glyphicon glyphicon-log-out" style="padding-right: 40px;"><button type="button" data-toggle="modal" data-target="#ghModal1"  style="font-size: 10px; color: black; padding: 0px; text-decoration: none; border: none; background-color: white;"> LOG OUT</button></li>					<%
						} else {
					%>
					<li class="glyphicon glyphicon-log-in" style="padding-right: 40px;"><a href="loginform.jsp" style="font-size: 10px; color: black; padding: 0px; text-decoration: none;"> LOG IN</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-9">
				<ul class="big_menub" style="padding-left: 0px;margin-bottom: 5px; margin-top: 10px;">
					<li style="padding-left: 40px;"><a href="" style="text-decoration: none;"><font>Special-Order</font></a></li>
					<li style="padding-left: 40px;"><a href="" style="text-decoration: none;"><font>Showcase</font></a></li>
					<li style="padding-left: 40px;"><a href="" style="text-decoration: none;"><font>PT</font></a></li>
					<li style="padding-left: 40px;"><a href=""style="text-decoration: none;"><font>Welove</font></a></li>
				</ul>
				
			</div>
			<div class="col-sm-3" align="right" style=" padding-right: 40px;">
				<button class="search_icon" style="background-image:url('/semi/gms/resources/images/MJImg/button_search.png') ; background-size:50px; width: 50px; height: 50px;" onclick="search_active()"></button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="margin-top: 8px; padding: 0px;size: auto;"align="left">
			<ul class="small_menub1" name="small_menu" style="padding-left:40px; display: inline;">
						<li><a href="/semi/gms/itemList.jsp?title=WOMEN&smallMenu=NEW"><font>WOMEN</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=ACC&smallMenu=NEW"><font>ACC</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=MEN&smallMenu=NEW"><font>MEN</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=HOME&smallMenu=NEW"><font>HOME</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=BEAUTY&smallMenu=NEW"><font>BEAUTY</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=TECH+&smallMenu=NEW"><font>TECH+</font></a></li>
						<li style="border-right: 1px solid rgba(0.2,0.2,0.2,0.2);"><a href=""><font style="padding-right: 20px;">CULTURE</font></a></li>
					</ul>
					<ul class="small_menub2" style="padding-left:0px;  display: inline;">
						<li style="padding-left: 20px;"><a href=""><font>Best</font></a></li>
						<li><a href=""><font>Event</font></a></li>
						<li><a href=""><font>Brand</font></a></li>
						<li><a href=""><font>Lookbook</font></a></li>
					</ul>
			</div>
	</div>
</div>

<div class="modal fade" id="ghModal1" role="dialog" >
   	<div class="modal-dialog" >
   		<!-- Modal content-->
 
 		<div class="modal-content" >
       		 <div class="modal-body">
       		 	<div class="form-group" style="text-align: center; z-index: 100">
        			<p>정상적으로 로그아웃되었습니다.</p>
        		</div>
       		</div>
       		<div class="modal-footer">
         		<a class="btn btn-default" href="logout.jsp" >확인</a>
       		</div>
     	</div>
   	</div>
</div>

<script type="text/javascript">
	

	

</script>