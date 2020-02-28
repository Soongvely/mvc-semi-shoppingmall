<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style type="text/css">
	html {
    scroll-behavior: smooth;
	}
	
	.MJ li{
		list-style: none;
		display: inline-block;
	}
	.big_menu font{
		padding-right: 23px;
		font-weight: 900;
		color: #000;
		font-size: 30px;
		
	}
	.small_menu1 font{
		padding-right: 15px;
		font-weight: 800;
		color: #000;
		font-size: 12px;
		margin-right: 0px;
	}
	.small_menu2 font{
		padding-right: 20px;
		font-weight: 500;
		color: #000;
		font-size: 12px;
		font-style: italic;
	}
	.mini_menu{
		margin-top:20px;
		white-space: nowrap;
		
	}
	.mini_menu li{
	 font-size: 17px;
	 padding-right: 13px;
	}
	.search_icon{
		background-color: rgba(1,1,1,0);
		margin-top:10px;
		border: 0px;
	}
	#navBar.active{
		width: 100%;
		display: block;
			z-index: 4;
	}
	#navBar{
		width: 100%;
		position: fixed;
		display: none;
		-webkit-transform: translateZ(4);
	}
	
		.serch_click{
		display: none;
	}
	.serch_click.active{
		display: inline-block;
		
	}
	#searchAtag:hover {
		background-color: #D4D4D4;
	}
	
	</style>
	<%
		Customer loginedUser_navbar = (Customer) session.getAttribute("LOGINED_USER");
		
	%>

<div class="serch_click" style="width:100%; height: 100%; background-color: rgba(255,255,255,0.98); z-index: 5; position: fixed;">
	
	<div class="row">
		<div class="col-sm-12" align="right">
			<span class="glyphicon glyphicon-remove" style="font-size: 5em; padding-right: 30px; padding-top: 20px;" onclick="seach_remove_active()"></span>
		</div>
	</div>	
	<div class="row">
		<div class="col-sm-9">
		</div>
		<div class="col-sm-3">
			<div class="serch_wrap" style="">
				<form action="/semi/gms/search.jsp">
					<input type="hidden" name="cate" value="NEW">
					<input autocomplete="off"  type="text" id="searchId" name="search" placeholder="Search" value=""  style="position: fixed; left: 1080px; width: 720px; height:50px; top:150px; font-size: 50px; outline: none; border: 0px;">
					<button type="submit"  class="search_icon"  style="background-image:url('/semi/gms/resources/images/MJImg/button_search.png') ; background-size:50px; width: 50px; height: 50px; position: fixed; left: 1800px; top:135px;" ></button>
					<hr style="position:fixed; left:1080px; width: 770px; height:7px; border:0px; background-color: black; margin-top: 100px;">
						<ul id="searchResult" style="border: 1px solid; color: black; position: fixed; left: 1080px; width: 770px; height: auto; max-height:421px; top:200px; background-color: white; padding-left: 0px; overflow: auto;  z-index: 5">
							
						</ul>
				</form>
			</div>
		</div>
	</div>

</div>
<div class="container-fluid MJ" id="navBar" style="background-color: white; padding: 0px;">
	<div class="row" style="width: 100%; border-bottom: 2px solid rgba(0.3,0.3,0.3,0.1); padding-bottom: 10px; margin: 0px;">
		<div class="col-sm-1" align="right">
		<a href="main.jsp"><img alt="logo"src="/semi/gms/resources/images/MJImg/og_image.png" style="width:56px; height: 56px; margin-top: 20px; margin-right:10px;"></a>		
		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-12" style="padding-left: 0px;">
				<ul class="big_menu" style="padding-left: 0px; padding-top: 10px; margin-bottom: 5px;">
					<li><a href=""><font>Special-Order</font></a></li>
					<li><a href=""><font>Showcase</font></a></li>
					<li><a href=""><font>PT</font></a></li>
					<li><a href=""><font>Welove</font></a></li>
				</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" style="padding-left: 0px;">
				 <ul class="small_menu1" style="padding-left:0px; display: inline-block; ">
						<li><a href="/semi/gms/itemList.jsp?title=WOMEN&smallMenu=NEW"><font>WOMEN</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=ACC&smallMenu=NEW"><font>ACC</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=MEN&smallMenu=NEW"><font>MEN</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=HOME&smallMenu=NEW"><font>HOME</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=BEAUTY&smallMenu=NEW"><font>BEAUTY</font></a></li>
						<li><a href="/semi/gms/itemList.jsp?title=TECH&smallMenu=NEW"><font>TECH+</font></a></li>
						<li style="border-right: 1px solid rgba(0.2,0.2,0.2,0.2);"><a href=""><font style="padding-right: 20px;">CULTURE</font></a></li>
					</ul>
					<ul class="small_menu2" style="padding-left:20px; display: inline-block; height: 100%;">
						<li><a href=""><font>Best</font></a></li>
						<li><a href=""><font>Event</font></a></li>
						<li><a href=""><font>Brand</font></a></li>
						<li><a href=""><font>Lookbook</font></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-2" align="right">
			<ul class="mini_menu">
				<li><a href="mypage.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-user" style="color: black;"></span></a></li>
				<li><a href="likeheart.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-heart" style="color: black;"></span></a></li>
				<li><a href="cart.jsp" style="text-decoration: none;"><span  class="glyphicon glyphicon-lock" style="color: black;"></span></a></li>
				<%
				if (loginedUser_navbar != null) {
				%>
				<li><button type="button" data-toggle="modal" data-target="#ghModal" style="text-decoration: none; background: none; border: none; background-color: white;"><span  class="glyphicon glyphicon-log-out" style="color: black;"></span></button></li>				
				<%
				} else {
				%>
				<li><a href="loginform.jsp" style="text-decoration: none;"><span  class="glyphicon glyphicon-log-in" style="color: black;"></span></a></li>
				<% 
					}
				%>
			</ul>
			<button class="search_icon" style="background-image:url('/semi/gms/resources/images/MJImg/button_search.png') ; background-size:25px; width: 25px; height: 25px;"  onclick="search_active()"></button>
		</div>	
	</div>
</div>	

<div class="modal fade" id="ghModal" role="dialog" >
   	<div class="modal-dialog">
   		<!-- Modal content-->
   		<div class="modal-content">
       		 <div class="modal-body">
       		 	<div class="form-group" style="text-align: center; z-index: 1000" >
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
	
	$("#searchId").on("change keyup paste", function() {
	    var searchText = $("#searchId").val();
			if(searchText === ""){
				$("#searchResult").hide();
			}else{
				$("#searchResult").show();
			}
		$.ajax({
				url : "/semi/api/getSearchItemName",
				data : {
					"searchText" : searchText
				},
				success : function(result) {
					
					var htmlContent = ""
						if(result.length){
							result.forEach(function(items,i){
							htmlContent +='<a href="search.jsp?cate=NEW&search='+items.name+'" style=" font-size: 20px; text-decoration: none;">'
							htmlContent +='<li  id="searchAtag" style="list-style: none; display: block; padding_bottom:15px; color: black;">'
							htmlContent +=''+items.name+''
							htmlContent +='</li>'
							htmlContent +='</a>'
							});
				}
						$("#searchResult").html(htmlContent);
					}
				});
	});
	
	
	$(window).on("scroll", function() {
	    if($(window).scrollTop() > 190) {
	    	$('#navBar').addClass('active');
	    } else {
			$('#navBar').removeClass('active');
	    }
	});



	
	function search_active() {
		$('.serch_click').addClass('active');
	}
	
	function seach_remove_active() {
		$('.serch_click').removeClass('active');
		$("#searchId").val("");
	}
</script>
