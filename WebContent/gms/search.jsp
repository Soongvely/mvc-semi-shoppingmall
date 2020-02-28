<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="ezo.shop.vo.Pagination"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="java.util.List"%>
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
  	.sortmenu div{
  		padding-left: 20px;
  		padding-right: 20px;
  		font-size: 12px;
  		border-right: 1px solid;
  	}
  	
  	.sortmenu a{
  		text-decoration:none !important;
  		color: #D3D3D3;
  		margin: 10px;
  	}
  	.sortmenu a:hover{
  		text-decoration:none !important;
  		color: #000000;
  		font-weight: bold;
  	}
  	.sortmenu div{
  		margin-top: 10px;
  		margin-bottom: 10px;
  	}
  	.active.set{
  		display: none;
  	}
  </style>
</head>
<body>
<%
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");

		String max_price = request.getParameter("max_price");
		String min_price = request.getParameter("min_price");
		String searchText = request.getParameter("search");
		String reset = request.getParameter("reset");
		String cate = request.getParameter("cate");
		
		
		Map<String,Object> keyWord = new HashMap<String,Object>();
		
		if(max_price !=null && !max_price.equals("null")){
		keyWord.put("max_price", max_price);
		}
		
		if(min_price != null && !min_price.equals("null")){
		keyWord.put("min_price", min_price);
		}
	
		if(searchText != null && !searchText.equals("")){
		keyWord.put("search", searchText);
		}else{
			searchText = "";
		}
		keyWord.put("cate", cate);
		
		int pageNo = 1;
		int record = NumberUtils.stringToNumber(request.getParameter("record"), 20);

		
		ItemDao itemdao = ItemDao.getInstance();
		int totalRows = itemdao.getItemListbyNameCount(keyWord);
		
		Pagination pagination = new Pagination(pageNo, totalRows, record, 5);
		
		keyWord.put("begin", pagination.getBeginPage());
		keyWord.put("end", pagination.getEndIndex());
		
		
		Integer max= 0;
		Integer min= 0;
		List<Item> items = itemdao.getItemListTotal(keyWord);
		
		List<Item> itemss = itemdao.getItemListTotal(keyWord);
		List<Integer> prices = new ArrayList<Integer>();
			
		if(itemss != null){
				if(!itemss.isEmpty()){
					for(Item item : itemss){
						prices.add(item.getDiscountPrice());
					}
				 max = Collections.max(prices);
				 min = Collections.min(prices);
				}
			}
		
	LikeDao likedao = LikeDao.getInstance();
%>
<%@ include file="navBarB.jsp"%>
<div class="container-fluid">
	<div class="row" style="margin-bottom:100px;">
	<input type="hidden" id="max_price" value="<%=max_price%>">
	<input type="hidden" id="min_price" value="<%=min_price%>">
	<input type="hidden" id="search" value="<%=searchText%>">
	<input type="hidden" id="cate" value="<%=cate%>">
	<input type="hidden" id="pageNo" value="<%=pageNo%>">
	<input type="hidden" id="record" value="<%=record%>">
	<input type="hidden" id="totalRows" value="<%=totalRows%>">
	
	
	
	<div class="col-lg-12" align="center">
		<form action="/semi/gms/search.jsp">
		<input type="hidden" name="cate" id="cate" value="NEW">
		<input type="text" id="search" name="search" value="<%=searchText %>" placeholder="Search" style="width: 870px; height: 50px; font-size: 40px; border: 0px; outline: 0;" onkeypress="searchPressEnter(event)" autocomplete="off">
			<span class="glyphicon glyphicon-remove" style="font-size: 3em;" onclick="searchBarValueRemove()"></span>
			<hr style="width: 900px; height:5px; border:0px; background-color: #000; margin-top: 0px;">
		</form>
		<div class="col-sm-12" align="right">
		</div>
		</div>
		<%
		if(items.isEmpty() ||  items == null){
		%>
				<h2 id="nosearch" align="center" style="padding-top: 50px;">검색 결과가 없습니다.</h2>
		<%
		}
		%>
	</div>
	<div class="row active">
		<div class="col-lg-2" style="width: 10%; margin-left: 20px;">
			<div class="row">
				<div class="col-sm-2">
					<span style="font-weight: bold; font-size: 13px;">Filter</span>
				</div>
				<div class="col-sm-7">
				</div>
				<div class="col-sm-2">
				<form action="http://localhost/semi/gms/search.jsp" method="post">
					<input type="hidden" name="cate" value="NEW">
					<button type="submit" name="reset" style="border: 0px; outline: 0px; background-color: #fff; text-decoration: underline; color: #303033; padding-left: 0px; padding-right: 20px; width: 80px; font-size: 14px;">Reset all</button>
				</form>
				</div>
				<hr style="width: 200px; height:2px; border:0px; background-color: black; margin-left: 13px; margin-top: 30px;">
			</div>
			<form action="/semi/gms/search.jsp" id="MINMAXSUMMIT" onclick="updateTotalPrice(event)">
			<div class="row" style="margin-left: 2px;">
				<div class="row">
				<input type="hidden" name="search" value="<%=searchText %>">
				<input type="hidden" name="cate" value="NEW">
					<div class="col-sm-2">
						<span style="font-weight: 600; font-size: 14px; padding-top: 10px;">Price</span>
					</div>
					<div class="col-sm-7">
					</div>
					<div class="col-sm-2">
					<button  type="submit" style="border: 0px solid; outline: 1px solid; background-color: #fff; font-size: 11px; margin-bottom: 10px;width: 52px; height: 27px; " >적용</button>
			</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<span>
							<input  id="min_price1" name="min_price" value="<%=NumberUtils.numberWithComma(min) %>"  style="width: 90px; height: 38px; "onblur="ableComma()">
							<span style="z-index: 3; display: inline; position: relative; top:-30px; left:70px;">원</span>
						</span>
					</div>
					<div class="col-sm-1">
							<span style="padding-left: 12px; font-weight: 1000;">~</span>
					</div>
					<div class="col-sm-5">
						<span style="">
							<input id="max_price1"  name="max_price" value="<%=NumberUtils.numberWithComma(max) %>" style="width: 90px; height: 38px;" onblur="ableComma()">
							<span style="z-index: 3; display: inline; position: relative; top:-30px; left:70px;">원</span>
						</span>
						</div>
					</div>
					<hr style="width: 230px; height:1px; border:0px; background-color: #D4D4D4; margin-left: 3px; ">
			</div>
			</form>
		</div>
		<div class="col-sm-9" style="padding-left: 200px;">
			<div class="row sortmenu" style="border: 1px solid; color: #D3D3D3; margin-left: 0px; width: 90%;"  align="center">
				<div style="display: inline-block;">
					<a href="search.jsp?search=<%=searchText %>&cate=NEW&min_price=<%=min_price%>&max_price=<%=max_price%>">신상품순</a>
				</div>
				<div style="display: inline-block;">
					<a href="search.jsp?search=<%=searchText %>&cate=BEST&min_price=<%=min_price%>&max_price=<%=max_price%>">베스트순</a>
				</div>
				<div style="display: inline-block;">
					<a href="search.jsp?search=<%=searchText %>&cate=ROWPRICE&min_price=<%=min_price%>&max_price=<%=max_price%>">낮은가격순</a>
				</div>
				<div style="display: inline-block;">
					<a href="search.jsp?search=<%=searchText %>&cate=HIGHPRICE&min_price=<%=min_price%>&max_price=<%=max_price%>">높은가격순</a>
				</div>
				<div style="display: inline-block;">
					<a href="search.jsp?search=<%=searchText %>&cate=HIGHDISCOUNT&min_price=<%=min_price%>&max_price=<%=max_price%>">높은할인순</a>
				</div>
			</div>
			
			<div class="row">
						<div id="insertItem"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
var no =1;
$('#insertItem').ready(function(){
	console.log("첫번쨰 들어간다");
	getNextItemList(no);
	no++;

});



//숫자 콤마 붙이기
function numberFormat(inputNumber) {
   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


//가격 업데이트
function updateTotalPrice(event) {

	var minPrice = document.getElementById('min_price1').value;
	var maxPrice = document.getElementById('max_price1').value;
	
	minPrice.replace(/[^\d]+/g, '');
	maxPrice.replace(/[^\d]+/g, '');
	
	console.log(minPrice);
	document.getElementById('min_price1').value = uncomma(minPrice);
	document.getElementById('max_price1').value = uncomma(maxPrice);
	
	console.log("콤마삭제된다");
	
}

function ableComma() {
	var minPrice = document.getElementById('min_price1').value;
	var maxPrice = document.getElementById('max_price1').value;
	
	document.getElementById('min_price1').value = numberFormat(minPrice);
	document.getElementById('max_price1').value = numberFormat(maxPrice);
	
}
//콤마 삭제
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}


$(window).on("scroll", function() {
	var scrollHeight = $(document).height();
	var scrollPosition = $(window).height() + $(window).scrollTop();		

	$("#scrollHeight").text(scrollHeight);
	$("#scrollPosition").text(scrollPosition);
	$("#bottom").text(scrollHeight - scrollPosition);

	if (scrollPosition > scrollHeight -1) {			
		
		 $(function() {
			 console.log("무한스크롤");
			 getNextItemList(no);
			 no++;
		    });
	}
});

function getNextItemList(e) {
	var max_price = $("input[id='max_price']").val();
	var min_price = $("input[id='min_price']").val();
	var cate = $("input[id='cate']").val();
	var search = $("input[id='search']").val();
	var pageNo = e;
	var record = $("input[id='record']").val();
	var totalRows = $("input[id='totalRows']").val();
	
	console.log("확인용",max_price, min_price, cate,search, pageNo, record, totalRows);
	
$.ajax({
		url : "http://localhost/semi/api/getNextItemList",
		data : {
			"max_price" : max_price,
			"min_price" : min_price,
			"cate" : cate,
			"search": search,
			"pageNo" : pageNo,
			"record" : record
		},
		success : function(result) {
			var htmlContent = ""
			
				if(result.length){
					result.forEach(function(items,i){
						
				htmlContent +='<div class="col-lg-2" id="items" name="fadetag" style="width: 220px; height: 400px; margin-bottom: 10px; min-height: 220px;">'
				htmlContent +='<div class="itemList_img" style="height: auto">'
				htmlContent +='<a href="detail.jsp?itemno='+items.no+'&cateNo='+items.category.no+'" style="text-decoration: none; color: black;">'
				htmlContent +='<img id="feed_img" alt="" src="'+items.imagePath +'" style="min-height: 1px; width: 100%; height: 100%; max-height:215px; padding-top: 10px; padding-bottom: 15px;">'
				htmlContent +='<span style="display: block; font-weight: bold; font-size: 13px; text-decoration: underline; padding-bottom: 5px;">'+items.brand+'</span>'
				htmlContent +='<span style="white-space: pre-line; display: block; font-size: 12px; padding-bottom: 10px;">'+items.name+'</span>'
				htmlContent +='<span style="display: block; color: #D4D4D4;">'+items.price+'</span>'
				htmlContent +='<span style="display: block; font-weight:bold; color: #FF4800;">'+items.discountRate+'%'+items.discountPrice+'</span>'
				htmlContent +='</a>'
				htmlContent +='</div>'
				htmlContent +='</div>'
				document.getElementById('insertItem').innerHTML += htmlContent;	
				htmlContent = "";
					});
		}
			}
		});
	};

	function searchBarValueRemove() {
		$('input[name=search]').val("");
	}
	
	function realTimeSearch() {
		console.log("들어옴");
	}
	
	function nosearch() {
		$('row').addClass('set');
		console.log("들어옴");
	}
	
	function searchPressEnter(e) {
		if(e.keyCode==13){
			$(this).sumit;
		}
	}
	
</script>
</body>
</html>