<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Map"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.ReviewDao"%>
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
    	margin-bottom: -5px;
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
    #gh .padd {
    	padding-bottom: 20px;
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
	.starR {
		background: url(resources/images/profile/star.png) no-repeat right 0;
	  	background-size: auto 100%;
	  	width: 30px;
	  	height: 30px;
	  	display: inline-block;
	  	text-indent: -9999px;
	  	cursor: pointer;
	  	border-style: none;
	}
	.starR.on {
		background-position:0 0;
	}
  </style>
</head>
<body>
<%@ page buffer="100kb" %>
<%
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=reviewlist.jsp");
		return;		
	}
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
	
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	List<OrderProduct> orderProducts = orderProductDao.writepossibleReviewBycustNo(loginedUser.getNo());
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	List<Map<String, Object>> reviews = reviewDao.writedReviewByNo(loginedUser.getNo());

%>
<%@include file="navBarB.jsp" %>
<div class="container" id="gh">
	<div class="row">
		<div class="col-sm-2">
		<!-- 좌측메뉴 -->
			<h2><strong><%=loginedUser.getName() %>님</strong></h2>
			<p><small><%=loginedUser.getEmail() %></small></p>
			<ul>
				<li><a href="likeheart.jsp"><span class="glyphicon glyphicon-heart"></span> 나의하트 <%=likecount %></a></li>
			</ul>
			
			<h5><strong>나의쇼핑정보</strong></h5>
			<ul>			
				<li><a href="orderdeliverylist.jsp">주문배송조회</a></li>
				<li><a href="canscelexchange.jsp">취소/교환 내역</a></li>
				<li><a href="reviewlist.jsp">상품리뷰</a></li>
				<li><a href="">증빙서류 발급</a></li>
			</ul>
			
			<h5><strong>나의 계정설정</strong></h5>
			<ul>
				<li><a href="passwordform.jsp">회원정보수정</a></li>
				<li><a href="pointhistory.jsp">포인트현황</a></li>
				<li><a href="">회원등급</a></li>
				<li><a href="">쿠폰</a></li>
			</ul>
			
			<h5><strong>고객센터</strong></h5>
			<ul>
				<li><a href="questionboard.jsp">문의게시판</a></li>
				<li><a href="notice.jsp">공지사항</a></li>				
				<li><a href="">FAQ</a></li>				
			</ul>		
		</div>
		
		<div class="col-sm-10">
		
			<div class="row back">
				<ul class="col-sm-4" >
					<li style="text-align: left;">
						<span>회원등급 ></span>
						<a href="" class="bot">GREEN
							<span class="pull-right">할인혜택 보기</span>
						</a>
					</li>
				</ul>
				<ul class="col-sm-4">
					<li style="text-align: left;">
						<span>사용가능쿠폰 ></span>
						<a href=""  class="bot">4</a>
					</li>
				</ul>
				<ul class="col-sm-4">
					<li style="text-align: left;">
					<span>포인트 ></span>
					<a href="pointhistory.jsp"  class="bot"><%=NumberUtils.numberWithComma(loginedUser.getPoint())%></a>
					</li>
				</ul>
			</div>
			
			<h3>리뷰</h3>
			<div class="row">
				<ul class="nav nav-tabs" style="border-bottom: 2px solid black;">
					<li class="active"><a href="" onclick="showbox1(event)">작성 가능한 리뷰 (<%=orderProducts.size() %>)</a></li>
					<li><a href="" onclick="showbox2(event)">내 리뷰 (<%=reviews.size() %>)</a></li>
					<li class="pull-right" style="margin-right: 15px;"><small>리뷰 작성시 최종결제금액의 10% 적립</small></li>
				</ul>  
			</div>
			<!-- 작성 가능한 리뷰를 선택하면 나옴 --> 
			
		<%
			if (orderProducts.isEmpty()) {
		%>
			<div class="reviewbox-1"  style="margin-top: 40px; text-align: center;">
				<p>작성 가능한 리뷰가 없습니다.</p>
			</div>
		<%
			}
			for (OrderProduct orderproduct : orderProducts ) {
		%>
			<div class="list-group1 reviewbox-1">
				<div class="row" id="">
					<div class="col-sm-8">
						<a href="detail.jsp?itemno=<%=orderproduct.getItemOption().getItem().getNo() %>&cateNo=<%=orderproduct.getItemOption().getItem().getCategory().getNo() %>" class="a1">
							<div class="col-sm-3">
								<img src="<%=orderproduct.getItemOption().getItem().getImagePath() %>" style="width: 100px; height: 100px;"/>
							</div> 
							<div class="col-sm-9" style="height: 100px; text-align: left;">
								<p style="padding-bottom: 5px; padding-top: 15px"> 
									<strong style="font-size: 16px"><%=orderproduct.getItemOption().getItem().getBrand() %></strong>
								</p>
								<p><%=orderproduct.getItemOption().getItem().getName() %></p>
								<p><small>[<%=orderproduct.getItemOption().getColor() %>] - [<%=orderproduct.getItemOption().getSize() %>]</small></p>
							</div>							
						</a> 
					</div>	 
					<div class="col-sm-2">
						<div style="height: 100px; padding-top: 35px">
							<span><%=DateUtils.dateToString(orderproduct.getOrder().getCreateDate()) %></span> 
						</div>
					</div>	
					<div class="col-sm-2">
						<div style="height: 100px; width: 100px; padding-top: 30px;">
							<button type="button" style="background-color: black; color: white; width: 100px; height: 30px" data-target="#myModal" data-toggle="modal" onclick="rewr1(<%=orderproduct.getNo() %>, event)">
								리뷰쓰기
							</button>
						</div>
					</div>
				</div>	
			</div>
		<%		
				
			}
		%>
			<!-- 내 리뷰를 선택하면 나옴 -->
		<%
			if (reviews.isEmpty()) {
		%>
			<div class="reviewbox-2" style="margin-top: 40px; text-align: center;">  
				<p>작성한 리뷰가 없습니다.</p>  
			</div>
		<%	
			}
			for (Map<String, Object> review : reviews) {
					String result = "";
					for (int i=1; i<=((BigDecimal)review.get("REVIEW_STAR")).intValue(); i++) {
			     		result += "★"; 
					}
		%>  
			<div class="list-group1 reviewbox-2" style="padding-bottom: 20px;">
				<div class="row" id=""> 
					<div class="col-sm-9">
						<a href="detail.jsp?itemno=<%=review.get("ITEM_NO") %>&cateNo=<%=review.get("CATE_NO") %>" class="a1">
							<div class="col-sm-3">
								<img id="img-<%=review.get("ORDER_PRODUCT_NO") %>" src="<%=review.get("ITEM_IMAGE_PATH")%>" style="width: 100px; height: 100px; margin-top: 10px;"/>
							</div>
							<div class="col-sm-7" style="height: 100px; text-align: left;">
								<p style="margin: 0px">
									<strong style="font-size: 16px;"><%=review.get("ITEM_BRAND") %></strong>
								</p> 
								<p style="margin: 3px;"><small></small><%=review.get("ITEM_NAME")%> </p>
								<p style="margin: 3px;"><small>[<%=review.get("OPT_COLOR") %>] - [<%=review.get("OPT_SIZE") %>] </small></p>
								<p style="margin: 3px;"><small id="result-<%=review.get("ORDER_PRODUCT_NO") %>" value="<%=review.get("REVIEW_STAR") %>"><%=result %></small></p>
								<p style="margin: 3px; text-overflow: ellipsis; overflow: hidden; height: 20px;"><small id="content-<%=review.get("ORDER_PRODUCT_NO") %>" ><%=review.get("REVIEW_CONTENTS")%></small></p>  
							</div>
							<div class="col-sm-2">  
								<img id="review-<%=review.get("ORDER_PRODUCT_NO") %>" src="<%=review.get("REVIEW_IMAGE") %>" style="width: 100px; height: 100px; margin-top: 10px;"/> 
							</div>				 	 
						</a>
					</div>
					<div class="col-sm-3">
						<div style="height: 100px; width: 150px; padding-top: 30px; text-align: center; margin-top: 10px;" class="pull-right">
								<button type="button" class="btn btn-default" style="width: 50px; height: 30px" data-target="#myModal1" data-toggle="modal" onclick="rewr2(<%=review.get("ORDER_PRODUCT_NO") %>, event)">수정</button>
								<button type="button" class="btn btn-default" style="width: 50px; height: 30px" data-target="#myModal2" data-toggle="modal" onclick="rewr3(<%=review.get("ORDER_PRODUCT_NO") %>, event)">삭제</button> 
						</div>
					</div>
				</div>
			</div> 
		<%
			}
		%>
		</div>
	</div>
</div>			

<!-- 리뷰 쓰기 --> 
<div class="modal fade" id="myModal" role="dialog" >
   	<div class="modal-dialog">
   		<!-- Modal content-->
 		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">&times;</button>
       			<h4 class="modal-title"><strong>리뷰 쓰기</strong></h4>
     		</div>
     		<form action="reviewwrite.jsp" id="review-write" method="post" enctype="multipart/form-data">
     			<input type="hidden" id="review-write-1" value="" name="orderproductno"/>
     			<div class="modal-body">
       				<div class="form-group">
        				<div class="starRev" style="text-align: center; margin-top: 70px; margin-bottom: 70px;">
        					<span class="starR on">별1</span>
        					<span class="starR on">별2</span>
						  	<span class="starR on">별3</span>
						  	<span class="starR">별4</span>
						  	<span class="starR">별5</span>
						  	<input id="stars-1" type="hidden" value="" name="star" />
						</div>
       				</div>
       				<div class="form-group">
       					<input type="file" name="reviewfile" id="review-file-1" />
       				</div>
       				<div class="form-group">
       					<textarea class="form-control" name="reviewcontents" id="review-length"  placeholder="15 ~ 50 자 이내로 작성하세요." style="background-color: #f8f8f8; height: 200px"></textarea>	
       				</div>
       			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: black; color: white;" onclick="reviewWrite(event)">등록하기</button>
      			</div>
     	 	</form>
   		</div>
 	</div>
</div>

<!-- 리뷰수정 -->
<div class="modal fade" id="myModal1" role="dialog">
 	<div class="modal-dialog">
 		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">&times;</button>
       			<h4 class="modal-title"><strong>리뷰 수정</strong></h4>
     		</div>
      		<form action="reviewupdate.jsp" id="review-write1" method="post" enctype="multipart/form-data">
      			<input id="review-write-2" value="" name="orderproductno" type="hidden" />
      			<div class="modal-body">
       				<div class="form-group">
        				<div class="starRev" style="text-align: center; margin-top: 70px; margin-bottom: 70px;">
				  			<span class="starR on">별1</span>
        					<span class="starR on">별2</span>
						  	<span class="starR on">별3</span>
						  	<span class="starR">별4</span>
						  	<span class="starR">별5</span>
						  	<input id="stars-2" type="hidden" value="" name="star" />
						</div> 
       				</div>
       				<div class="form-group">
       					<input type="file" name="reviewfile" id="review-file-2" value="" />
       				</div>
       				<div class="form-group">
       					<textarea class="form-control" name="reviewcontents" style="background-color: #f8f8f8; height: 200px" id="review-content-2"></textarea>	 
       				</div>
      			</div>
     			<div class="modal-footer">
       				<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: black; color: white;" onclick="reviewWrite1(event)">수정완료</button>
     			</div>
    	   </form>
   		</div>
 	</div>
</div>

<!-- 리뷰 삭제 -->
<div class="modal fade" id="myModal2" role="dialog"> 
 	<div class="modal-dialog">
 		<div class="modal-content" >
     		<form action="reviewdelete.jsp" id="review-write2" method="post" >
     			<input id="review-write-3" value="" name="orderproductno" type="hidden" />
	      		<div class="modal-body">
	    			<div class="form-group" style="text-align: center;" >
	    				<p>작성한 리뷰를 삭제해도 재 작성이 가능합니다.</p>
	    				<p>삭제하시겠습니까?</p>	
	    			</div>
	  			</div>
	      		<div class="modal-footer">
	       			<button type="button" class="btn btn-default" data-dismiss="modal" >취소</button>
	       			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="reviewWrite2(event)">확인</button>
	      		</div>
      		</form>
   		</div>
 	</div>
</div>

<%@include file="footer.jsp" %>
<script type="text/javascript">
	//리뷰 등록하기 눌렀을 때
	function reviewWrite(e) {
		var leng = document.querySelector("#review-length").length;

  		var starcount = document.querySelectorAll('#myModal span.starR.on').length;
  		document.querySelector("#stars-1").setAttribute("value", starcount);
  		document.querySelector("#review-write").submit();	
  		return;
	}
	// 리뷰 수정완료 눌렀을 때
	function reviewWrite1(e) {
  		var starcount = document.querySelectorAll('#myModal1 span.starR.on').length;
  		document.querySelector("#stars-2").setAttribute("value", starcount);
  		document.querySelector("#review-write1").submit();
  		return;
	}
	// 삭제를 확인 누를 때
	function reviewWrite2(e) {
	  	document.querySelector("#review-write2").submit();
	}
	
	// 리뷰쓰기
	function rewr1(no, e) {
		document.querySelector("#review-write-1").value = no;
	}
	
	// 리뷰수정
	function rewr2(no , e) {
		document.querySelector("#review-write-2").value = no;
		var image = document.querySelector("#review-"+no).getAttribute("src");
		var result = document.querySelector("#result-"+no).textContent;
		var content = document.querySelector("#content-"+no).textContent;
		
		var arr = result.split('');
		var star = arr.length;
		
		// querySelectorAll은 배열이니까 하나씩 꺼내야함 
		var starArray = document.querySelectorAll("#myModal1 span.starR");
		for (var i=0; i<starArray.length; i++) {
			var starEL = starArray[i];
			// 조작의 대상이 되는 클래스를 싹다 지우고, 
			starEL.setAttribute("class", "");
			if (i<star) {
				// 갯수보다 작을 때만 on을 주고 아니면 없게 설정
				starEL.setAttribute("class", "starR on");
			} else {
				starEL.setAttribute("class", "starR");				
			}
		}
	
		document.querySelector("#stars-2").setAttribute("value", star);
		document.querySelector("#review-content-2").textContent = content;
		document.querySelector("#review-file-2").setAttribute("value", image);
		
		console.log(image, result, content);
	}
	// 리뷰 삭제
	function rewr3(no, e) {
		document.querySelector("#review-write-3").value = no;
	}

	////////////////////////////////////////////////////////////////////////////////////////
	// 즉시 실행 함수
	// 웹 페이지 로딩시 페이지와 관련된 초기화 작업을 실행할 목적으로 사용한다.
	(function() {
		var arr = document.querySelectorAll(".reviewbox-2");	
		for (var i=0; i<arr.length; i++) {
			arr[i].style.display = 'none';
		}
 	})();

  	// 다른 함수에서 호출하는(실행하는) 함수
  	function hideAllBox() {
  		var arr = document.querySelectorAll(".reviewbox-1");	
		for (var i=0; i<arr.length; i++) {
			arr[i].style.display = 'none';
		}	
		var arr = document.querySelectorAll(".reviewbox-2");	
		for (var i=0; i<arr.length; i++) {
			arr[i].style.display = 'none';
		}  		
  	}
  	
  	// 버튼 클릭시 실행되는 함수
  	function showbox1(e) {
  		// 수행문에서 다른 함수 실행
  		e.preventDefault();
  		$(e.target).parents('ul').find('li').removeClass('active');
  		$(e.target).parent().addClass('active');
  		hideAllBox();
  		var arr = document.querySelectorAll(".reviewbox-1");	
		for (var i=0; i<arr.length; i++) {
			arr[i].style.display = 'block';
		}
  	}
	
  	// 버튼 클릭시 실행되는 함수
  	function showbox2(e) {
  		// 수행문에서 다른 함수 실행
  		e.preventDefault();
  		$(e.target).parents('ul').find('li').removeClass('active');
  		$(e.target).parent().addClass('active');
  		hideAllBox();
  		var arr = document.querySelectorAll(".reviewbox-2");	
		for (var i=0; i<arr.length; i++) {
			arr[i].style.display = 'block';
		} 		
  	}
	
  	$('.starRev span').click(function(){
  	     $(this).parent().children('span').removeClass('on');
  	     $(this).addClass('on').prevAll('span').addClass('on');
  	     
  	     return false;
  	});
</script>
</body>
</html>