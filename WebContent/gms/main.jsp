<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="ezo.shop.dao.ItemDao"%>
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
  	
  	
  	img{
  		width: 100%;
  	
  	}
  	.left_item{
  		width: 793.813px;
  		height: 952.563px;
  	}
  	.wrap_img li{
  		padding-left: 0px;
  		padding-right: 0px;
  	}
  	.wrap_img div{
  		padding-left: 1px;
  		padding-right: 1px;
  	}
  	
  	 #columns{
	column-gap: 50px;
	column-count: 2;
  	width:110%;
	column-rule-style :solid;	
	column-rule-width : 1px;
	column-rule-color: rgba(0,0,0,0.3);
	column-gap:100px;
	padding-right: 0px;
      }
      
      #columns figure{
        display: block;
        margin:0;
        padding-top:10px;
        column-break-inside: avoid;
        transition: opacity 4s ease-in-out;
  		break-inside: avoid-column;
  		width:105%;
      }
      #columns figure img{
        width:100%;
      }
      #columns figure figcaption{
        padding:10px;
        margin-top:11px;
      }
     #mj div{
		white-space: nowrap;
     }
    <%
	    request.setCharacterEncoding("utf-8");
    	ItemDao itemdao = ItemDao.getInstance();
	   	 Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	   	 LikeDao likedao = LikeDao.getInstance();
	   	 
	   	List<Like> likes = null;
	   	 if(loginedUser != null){
	   	 	likes = likedao.getLikeAllByCustNo(loginedUser.getNo());
	   	 }
    %>

  </style>
</head>
<%@ include file="navBarB.jsp"%>
<body onload="init()">
<div class="container-fluid" id="mj">
	<div class="row" style="width: 100%; margin: 0;" >
		<div class="col-lg-5 left_item" style="display: inline-block  padding-right: 30px; padding-left: 0px; width: 45% ">
			<div class="row" style=" border-right: 1px solid; color: rgba(0,0,0,0.3)">
				<div class="col-sm-12">
					<a href="search.jsp?cate=NEW&search="><img id="big_img" alt="" src="/semi/gms/resources/images/MJImg/main.jpg" style="min-height: 1px;"></a>
				</div>
					<div class="col-sm-12">
					<a href="itemList.jsp?title=WOMEN&smallMenu=NEW"><img id="big_img" alt="" src="/semi/gms/resources/images/MJImg/women.jpg" style="min-height: 1px;"></a>
				</div>
					<div class="col-sm-12">
					<a href="itemList.jsp?title=MEN&smallMenu=NEW"><img id="big_img" alt="" src="/semi/gms/resources/images/MJImg/men.jpg" style="min-height: 1px;"></a>
				</div>
					<div class="col-sm-12">
					<a href="itemList.jsp?title=ACC&smallMenu=NEW"><img id="big_img" alt="" src="/semi/gms/resources/images/MJImg/acc.jpg" style="min-height: 1px;"></a>
				</div>
			</div>
		</div>
	<div class="col-lg-6 feed_wrap" style="padding-left:0px; width: 45%; display: inline-block;" >
		<div class=wrap_img style="margin-bottom: 50px;">
			<div class="row" style="display: inline-block; width: 1873px;">
				<div class="col-sm-6" style="display: inline-block; width: 460px">
				<a href="itemList.jsp?title=WOMEN&smallMenu=NEW"><img id="feed_main1" alt="" src="/semi/gms/resources/images/MJImg/LEFT.jpg" style="padding-left: 15px;	width: 100%; max-height: 781px;"></a>
				</div>
				<div class="col-sm-6" style="display: inline-block; width: 460px">
				<a href="itemList.jsp?title=ACC&smallMenu=NEW"><img id="feed_main2" alt="" src="/semi/gms/resources/images/MJImg/RIGHT.jpg" style="padding-right:5px; 	width: 100%; max-height: 781px;"></a>
				</div>
			</div>
		</div>
	<div id="columns">
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?pageno=1&title=WOMEN&smallMenu=TOP" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a2.jpg" style="min-height: 1px; width: 100%; height: auto; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">더욱 빛나는 당신을 위해</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							연말에 각종 모임에 약속에 무슨 옷을 어떻게 입지 고민하고 있을 당신을 위한 데일리룩으로도 손색이 없고 저녁엔 조금 더 분위기 있게 살짝살짝 포인트만 주면 되는 그런 룩들로 준비했어요. 조금 더 고혹스럽고 우아하게 연출해 봐요.</p>
						</div>
					</a>
					

						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
							<a href="detail.jsp?itemno=1343&cateNo=113" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1343).getImagePath() %>" style="width: 52px; height: 52px; ">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1343).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1343).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1343).getDiscountPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
								<%
									boolean check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1343).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								  <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color: red;"></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1343).getLikeCount()%></span>
								</div>
							</div>
     				 </figure>
     <div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?pageno=5&title=MEN&smallMenu=TOP&min_price=19900&max_price=153000" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a1.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">기다렸던 시즌오프!!</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							드디어 시즌오프에 돌입합니다. 장바구니에 넣어놓고 가격 때문에 망설였던 분들은 이 기회를 놓치지 마세요! 재고는 한정적이니 서둘러야 할 거예요.</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1336&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1336).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1336).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1336).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1336).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
								<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1336).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								   <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1336).getLikeCount() %></span>
								</div>
							</div>
     				 </figure>
     				 </div>
     				 <div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?pageno=1&title=MEN&smallMenu=TOP" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a3.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">내일 아침 신을 양말 고민하지 마세요</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
						매일 신기 좋은 양말 브랜드 1507에서 29CM에서만 만나볼 수 있는 특별 상품을 준비했습니다. 1+1 PACK 상품 구성으로 준비한 1507 양말로 매일 아침 양말 고민을 덜어보세요.</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1267&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1267).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1267).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1267).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1267).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
								<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1267).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								 <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1267).getLikeCount() %></span>
								</div>
							</div>
     				 </figure>
     				 </div><div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?pageno=1&title=MEN&smallMenu=TOP" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a4.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">29CM에서 미리 만나는  시즌오프</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							매력적인 캐주얼 스타일을 선보이는 곤니치와봉주르가 오직 29CM를 위한 선 시즌오프를 준비했어요! 지금 조금 더 착한 가격으로  제품들을 만나보세요!</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1053&cateNo=111" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1053).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1053).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1053).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1053).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
									<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1053).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
									<button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1053).getLikeCount() %></span>
								</div>
							</div>
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1064&cateNo=111" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1064).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1064).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1064).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1064).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								 <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1064).getLikeCount() %></span>
								</div>
							</div>
     				 </figure>
     				 </div>
     				 <div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="search.jsp?cate=NEW&search=키" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a5.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">패키지가 예쁜 선물, 오센트</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							피너츠 안 좋아하시는 분은 없을 거라 생각해요. 연말에 고마운 분들께 오센트의 11가지 향기를 선물하는 건 어떠세요? 피너츠 친구들이 전하는 오센트의 이야기가 연말에 여러분에게 작은 위로가 되었으면 좋겠습니다.</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1278&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1278).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px; ">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1278).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1278).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1278).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
									<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1278).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								  <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1278).getLikeCount() %></span>
								</div>
							</div>
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1282&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1282).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1282).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1282).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1282).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
									<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1282).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
									<button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1282).getLikeCount() %></span>
								</div>
							</div>
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1331&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1331).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1331).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1331).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1331).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								  <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color:red; "></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1331).getLikeCount() %></span>
								</div>
							</div>
     				 </figure>
     				 </div>
     				 <div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?pageno=1&title=ACC&smallMenu=JEWELRY" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a6.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">사랑스러운 홀리데이 주얼리 단독 최대 20%</h3>

							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							12월 크리스마스와 연말에 딱 어울릴 빈티지 헐리우드의 사랑스러운 홀리데이 컬렉션을 추천합니다. 고급스러운 펄과 키치 한 펜던트, 볼륨감 있는 크기로 도톰한 스웨터 위에 하나만 착용해도 충분한 포인트가 됩니다. 빈티지 헐리우드와 해피 홀리데이 보내세요.</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1220&cateNo=115" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1220).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1220).getBrand() %></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1220).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1220).getPrice() %>원</span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
									<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1220).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								  <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color: red;"></button>
								  <span style="display:block; color: black;"><%=itemdao.getItembyNo(1220).getLikeCount() %></span>
								</div>
							</div>
     				 </figure>
     				 </div>
     				 <div>
	<figure>
       <hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 10px;">
					<a href="itemList.jsp?title=ACC&smallMenu=NEW" style="text-decoration: none; ">
						<div class="feed" align="center">
						<img id="feed_img" alt="" src="/semi/gms/resources/images/MJImg/a7.jpg" style="min-height: 1px; width: 85%; height: 85%; padding-top: 10px;">
						</div>
						<div class="feed_info" align="left" style="margin-left: 30px;">
							<h3 style="color: black;">29CM 인기 검색어 #머플러</h3>
							<p style="color: black; white-space: pre-line; font-size: 15px; margin-right: 20px; line-height: 24px;">
							조금만 틈을 보여도 찬바람은 매섭게 옷 속을 파고듭니다. 아우터 하나로는 해결하기 힘든 빈틈, 머플러 한 장이면 충분해요. 지금 29CM 고객들이 가장 많이 찾는 머플러가 궁금하다면 클릭!</p>
						</div>
					</a>
						<div class="sub_itemList" style="padding-top: 20px; padding-left: 50px;">
							<div class="row" style="border-top: 1px solid; color: rgba(0,0,0,0.2); width: 95%;">
						<a href="detail.jsp?itemno=1254&cateNo=116" style="text-decoration: none; ">
								<div class="col-sm-2" style="margin-top: 15px; padding-left: 0px;">
									<img alt="" src="<%=itemdao.getItembyNo(1254).getImagePath() %>" style="width: 52px; height: 52px;">
								</div>
								<div class="col-sm-3" style="margin-top: 15px;">
									<div style="display: inline-block; color: black; font-weight: bold;"><%=itemdao.getItembyNo(1254).getBrand()%></div>
									<div style="color: black;"><%=itemdao.getItembyNo(1254).getName() %></div>
									<span style="color: black;"><%=itemdao.getItembyNo(1254).getPrice()%></span>
								</div>
							</a>
								<div class="col-sm-5">
								</div>
										<%
										check = false;
									if(likes != null){
									for(Like like : likes){
											check = false;
										if(like.getItem().getNo() == itemdao.getItembyNo(1254).getNo()){
											check = true;
								%>
										
								<%
											}else{check = false;}
										}
									}
								%>
								<div class="col-sm-2" style="border-left: 1px solid; color: rgba(0,0,0,0.2); padding-bottom: 20px; margin-bottom: 20px;" align="center">
								  <button class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="border: 0px; outline: 0; background-color: white; margin-top: 20px; color: red;"></button>
								  <div style="display:block; color: black;"><%=itemdao.getItembyNo(1254).getLikeCount() %></div>
								</div>
							</div>
     				 </figure>
     				 </div>
			</div>
		</div>
     </div>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">

function init() {
		getfooterPosition();
	}
function init() {
	 var top = $("#navBarB").scrollTop();
	$(window).scrollTop(top);
};
	function getfooterPosition() {
		var top = $('.footer #top_hr').offset().top;
		console.log("탑"+top);
		var right = $('.footer #top_hr').offset().right;
		$('.feed_wrap ul').css("height", top);
		$('.dummy').css("left",$("#feed_main2").offset().left);
		$('.dummy').css("top",$("#feed_main2").offset().top);
		$('.feed_wrap ul').css("width", right);
		
	}
	

	function resize() {
		var width = $('.banenr_wrap').width();
		console.log("위th"+width);
		$('.bannerImg').css("width", width/2);
		$('.bannerImg').css("height", "auto");
		$('.banner').css("height", $('.bannerImg').height());
		$('.banner').css("width", $('.bannerImg').width());
	}
	
	$(window).resize(function (){
		  // width값을 가져오기
		  var width_size = window.outerWidth;
		});
	
	function check() {
		var a=$('#banenr_wrap >li').length
		console.log(a);
		var Ev =0;
		var prevTop = 0;
		for(var i=1; i<a ; i++){
			if(((i % 2)? "Odd":"Even") == 'Odd'){
				$('#banenr_wrap li:nth-child('+i+')').css("left",500);
				$('#banenr_wrap li:nth-child('+i+')').css("top",prevTop);
				console.log("ev값"+Ev);
				console.log("홀수");
				console.log("인덱스" + i);
				
			}else{
				Ev += 600; 
				$('#banenr_wrap li:nth-child('+i+')').css("top", Ev);
				$('#banenr_wrap li:nth-child('+i+')').css("left",0);
				prevTop = $('#banenr_wrap li:nth-child('+i+')').offset().top;
				console.log($('#banenr_wrap').offset().left);
				console.log("짝수");
				console.log(Ev);
			}
		}
	}
	
	function solution(num) {
		console.log((num % 2)? "Odd":"Even");
	    return  
	}
</script>
</body>
</html>