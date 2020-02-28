<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="ezo.shop.vo.ItemListSearchData"%>
<%@page import="ezo.shop.vo.ItemBrandsCheck"%>
<%@page import="ezo.shop.vo.Pagination"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.ItemDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		.sample div{
		}
		.itemList_name button{
			outline: 0px;
			border: 0px;
			background-color: white;
			color: #5D5D5D;
			font-size: 16px;
			padding-right: 30px;
			margin-bottom: 10px;
		}
		
		<%
			String a = request.getParameter("smallMenu");
		%>
		.itemList_name li #<%=a%>{
			font-weight: 900;
			color: #000000;
		}
		.itemList_name li button:hover {
			font-weight: 900;
			color: #000000;
		}
		.page a{
			font-size: 48px;
			color: grey;
			padding-left: 10px;
			padding-right: 10px;
			text-decoration: none;
		}
		.activ {
			color: #000000;
		}
	</style>
</head>

<body>

<%
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	LikeDao likedao = LikeDao.getInstance();
	ItemListSearchData searchData = new ItemListSearchData();

	String titleName = request.getParameter("title");
	String max_price = request.getParameter("max_price");
	String min_price = request.getParameter("min_price");
	String reset = request.getParameter("reset");
	String smallMenu = request.getParameter("smallMenu");
	String[] brandArray = request.getParameterValues("brand");
	
	
	
	Map<String,Object> keyWord = new HashMap<String,Object>();
	keyWord.put("max_price", max_price);
	keyWord.put("min_price", min_price);
	keyWord.put("title", titleName);
	keyWord.put("smallMenu", smallMenu);
	
	
	if(brandArray == null){
		System.out.println("브랜드가 없다");
		brandArray = null;
		System.out.println(brandArray);
	}
	
	if(max_price != null && max_price.equals("all")){
		max_price = null;		
	}
	keyWord.put("max_price", max_price);
	
	if(min_price != null && min_price.equals("all")){
		min_price = null;		
	}
	keyWord.put("min_price", min_price);
	
	if(brandArray != null){
	keyWord.put("brand", brandArray);
	System.out.println("브랜드put완료11");
	}
	
	ItemDao itemdao = ItemDao.getInstance();
	int max= 0;
	int min= 0;
	int totalBrandCnt = itemdao.getTotalBrandCount(keyWord);
	
	List<Integer> prices = new ArrayList<Integer>();
	List<ItemBrandsCheck> itemBrands = itemdao.getItemBrandList(keyWord);
		
	
	int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"), 1);
	int record = NumberUtils.stringToNumber(request.getParameter("record"), 8);
	
	int totalRows = itemdao.getItemListCount(keyWord);
	
	Pagination pagination = new Pagination(pageNo, totalRows, record, 5);
	
	
	keyWord.put("begin", pagination.getBeginPage());
	keyWord.put("end", pagination.getTotalPagesCount() * 8);
	System.out.println("비긴페이지"+pagination.getBeginPage());
	System.out.println("엔드페이지"+pagination.getTotalPagesCount() * 8);
	System.out.println("max_price"+max_price);
	System.out.println("min_price"+min_price);
	System.out.println("smallMenu"+smallMenu);
	
	List<Item> MMitems = itemdao.searchItems(keyWord);
	
	if(MMitems != null){
		System.out.println("아이템사이즈" + MMitems.size());
			if(!MMitems.isEmpty()){
				for(Item item : MMitems){
					prices.add(item.getDiscountPrice());
				}
			 max = Collections.max(prices);
			 min = Collections.min(prices);
			}
		} 
	
	
	keyWord.put("begin", pagination.getBeginIndex());
	keyWord.put("end", pagination.getEndIndex());
	
	List<Item> items = itemdao.searchItems(keyWord);
	
	System.out.println("최종아이템갯수" + items.size());
	ReviewDao reviewdao = ReviewDao.getInstance();
	for(Item item : items){
		System.out.println("아이템번호1:" + item.getNo());
	}
	 
	
%>
	
<%@ include file="navBarB.jsp"%>
<div class="container-fluid sample">
	<div class="row">
		<div class="col-lg-2" style="width: 10%; margin-left: 20px;">
			<div class="title">
				<h2 style="font-weight: bold;"><%=titleName %></h2>
				<hr style="width: 200px; height:4px; border:0px; background-color: black; margin-left: 0px; margin-top: 10px;">
			</div>
			<form action="/semi/gms/itemList.jsp">
				<input type="hidden" name="pageno" id="page-no" value="1" />
				<input type="hidden" name="title" value="<%=titleName%>">
			<ul class="itemList_name" style="display: block; padding-left: 0px;">
				<li style="display: block;">
					<button name="smallMenu" value="NEW" id="NEW" style="width: 200px; height: 28px; text-align: left;">
						NEW
					</button>
				</li>
				<li style="display: block;">
					<button name="smallMenu" value="BEST" id="BEST" style="width: 200px; height: 28px; text-align: left;">
						BEST
					</button>
				</li>
				<%
					if(!titleName.equals("ACC")){
				%>
				<li style="display: block;">
					<button name="smallMenu" value="TOP" id="TOP" style="width: 200px; height: 28px; text-align: left;">
						TOP
					</button>
				</li>
				<li style="display: block;">
					<button name="smallMenu" value="BOTTOM" id="BOTTOM" style="width: 200px; height: 28px; text-align: left;">
						BOTTOM
					</button>
				</li>
				<%
					} else {
				%>
					<li style="display: block;">
					<button name="smallMenu" value="JEWELRY" id="JEWELRY" style="width: 200px; height: 28px; text-align: left;">
						Jewelry
					</button>
				</li>
				<li style="display: block;">
					<button name="smallMenu" value="ETC" id="ETC" style="width: 200px; height: 28px; text-align: left;">
						Etc
					</button>
				</li>
				<%
					}
				%>
			</ul>
			</form>
			<form action="/semi/gms/itemList.jsp" method="get">
			<input type="hidden" name="pageno" id="page-no" value="1" />
			<input type="hidden" name="title" value="<%=titleName%>">
			<input type="hidden" name="smallMenu" value="<%=smallMenu%>">
			<div class="row">
			<div style="padding-bottom: 20px;">
				<div class="col-sm-2">
					<span style="font-weight: bold; font-size: 13px;">Filter</span>
				</div>
				<div class="col-sm-6">
				</div>
				<div class="col-sm-3">
					<button type="submit" style="border: 0px; outline: 0px; background-color: #fff; text-decoration: underline; color: #303033; padding-left: 0px; padding-right: 50px; display: inline; width: 150px;">Reset all</button>
				</div>
			</div>
				<hr style="width: 200px; height:2px; border:0px; background-color: black; margin-left: 13px; margin-top: 10px;">
			</div>
			</form>
			<form id="brandForm" action="/semi/gms/itemList.jsp" onclick="updateTotalPrice(event)">
			<input type="hidden" name="pageno" id="page-no" value="1" />
			<input type="hidden" name="title" value="<%=titleName%>">
			<input type="hidden" name="smallMenu" value="<%=smallMenu%>">
			
			
			<div class="row" style="" align="left">
				<div class="col-sm-2">
						<span style="font-weight: 600; font-size: 14px; padding-top: 10px; padding-bottom: 10px;">Brand(<%=totalBrandCnt %>)</span>
						<div class="row">
							<div class="col-sm-12" style="width: 100%">
								<ul style="width: 200px; max-height: 300px; overflow: scroll; list-style: none; padding-left: 10px;">
								<%
									for(ItemBrandsCheck brand : itemBrands){
								%>
									<li>
									<label>  
									<input id="<%=brand.getBrand() %>" name="brand" value="<%=brand.getBrand() %>" type="checkbox"  <%=brand.isChecked()==true ? "checked" : ""%> onclick="submit_brandName(this)">
									<%=brand.getBrand() %>(<%=brand.getCount() %>)
									</label>
									</li>
								<%
									}
								%>
								</ul>
								<%
									if(brandArray != null){
								%>
								<script type="text/javascript">
								(function () {
									<%
									for(int i=0; i<brandArray.length; i++){
									%>
									var a = document.getElementById('<%=brandArray[i]%>');
										if(a == null){
											return;
										}
										document.getElementById('<%=brandArray[i]%>').checked = true;
									<%}%>
								})();
								</script>
								<%
									}
								%>
								</div>
						</div>
					</div>
						<hr style="width: 200px; height:2px; border:0px; background-color: black; margin-left: 13px; margin-top: 10px;">
			</div>
			<div class="row" style="margin-left: 2px;">
				<div class="row">
					<div class="col-sm-2">
						<span style="font-weight: 600; font-size: 14px; padding-top: 10px;">Price</span>
					</div>
					<div class="col-sm-7">
					</div>
					<div class="col-sm-2">
					<button type="submit" style="border: 0px solid; outline: 1px solid; background-color: #fff; font-size: 11px; margin-bottom: 10px;width: 42px; height: 27px; ">적용</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<span>
							<input id="min_price" name="min_price"  value="<%=min%>" placeholder="<%=NumberUtils.numberWithComma(min) %>" style="width: 90px; height: 38px;" onblur="ableComma()">
							<span style="z-index: 3; display: inline; position: relative; top:-30px; left:70px;">원</span>
						</span>
					</div>
					<div class="col-sm-1">
							<span style="padding-left: 12px; font-weight: 1000;">~</span>
					</div>
					<div class="col-sm-5">
						<span style="">
							<input id="max_price" name="max_price" value="<%=max %>" placeholder="<%=NumberUtils.numberWithComma(max) %>" style="width: 90px; height: 38px;" onblur="ableComma()">
							<span style="z-index: 3; display: inline; position: relative; top:-30px; left:70px;">원</span>
						</span>
						</div>
					</div>
					<hr style="width: 230px; height:1px; border:0px; background-color: #D4D4D4; margin-left: 3px; ">
				</div>
			</form>
		</div>
		<div class="col-lg-1"></div>
		<div class="col-lg-9" style="width: 80%;">
		<%
			for(Item item : items){
			boolean check = false;
				if(loginedUser != null){
					List<Like> likes = likedao.getLikeAllByCustNo(loginedUser.getNo());
					for(Like like : likes) {
						if(like.getItem().getNo() == item.getNo()) {
							check = true;
						}
					}
				}
				System.out.println("아이템번호:"+item.getNo());
				%>
	
			<div class="col-lg-3" style="width: 24%; margin-bottom: 50px;">
				<div class="itemList_img" style="max-height: 478px;">
					<a href="/semi/gms/detail.jsp?itemno=<%=item.getNo() %>&cateNo=<%=item.getCategory().getNo() %>" style="text-decoration: none; color: black;">
						<img id="feed_img" alt="" src="<%=item.getImagePath() %>" style="min-height: 1px; width: 343.09px; height: 368.09px; padding-top: 10px; padding-bottom: 15px;">
						<span style="display: block; font-weight: bold; font-size: 13px; text-decoration: underline; padding-bottom: 5px;"><%=item.getBrand() %></span>
						<span style="white-space: pre-line; display: block; font-size: 12px; padding-bottom: 10px;"><%=item.getName() %></span>
						<span style="display: block; color: #D4D4D4;"><%=NumberUtils.numberWithComma(item.getPrice()) %></span>
						<span style="display: block; font-weight:bold; color: #FF4800;"><%=item.getDiscountRate() %>% <%=NumberUtils.numberWithComma(item.getDiscountPrice() )%>원</span>
						<span class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" style="display: inline-block; padding-right: 30px; color: red;"><%=item.getLikeCount() %></span>
						<span class="glyphicon glyphicon-comment"><%=reviewdao.getCountWithStarByItemNo(item.getNo()).getCount() %></span>
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<form action="/semi/gms/itemList.jsp" id="search-form" method="get">
	<div class="row">
		<div class="col-sm-12 page" align="center">
			<input type="hidden" name="pageno" id="page-no1" value="<%=pageNo%>" />
			<input type="hidden" name="title" value="<%=titleName%>">
			<input type="hidden" name="smallMenu" value="<%=smallMenu%>">
			<input type="hidden" name="min_price" value="<%=min%>">
			<input type="hidden" name="max_price" value="<%=max%>">
			<%
			if(brandArray != null){
				for(int i=0; i<brandArray.length; i++){
			%>
			<input type="hidden" name="brand" value="<%=brandArray[i]%>">
			<%
				}}
			%>
				<%
					int minPage = pageNo -3;
					int maxPage = pageNo +3;
					
				if((pageNo - 1) >= 6){
					for(int i=1; i<=pagination.getTotalPagesCount(); i++){
							if(i == 1){
				%>
								<a href=""  onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>"><%=i %></span></a>
				<%
								continue;
							}
							if(minPage-1 > i){
								continue;
							}
							if(minPage-1 == i){
				
				%>
								<a href="" onclick="searchBooks(<%=i %>, event)"><span>...</span></a>
				<%
								continue;
							}
							if(pagination.getTotalPagesCount() == i){
				%>
					
								<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>"><%=i %></span></a>
				<%
								continue;
							}
							if(maxPage == i){
				
				%>
								<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>">...</span></a>
				<%
								continue;
							}
							if(maxPage < i){
								continue;
							}
				%>
							
							<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>"><%=i %></span></a>
				<%
						}
					}else{
						for(int i=1; i<=pagination.getTotalPagesCount(); i++){
							if(i == pagination.getTotalPagesCount()){
					%>
								<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>"><%=i %></span></a>
					<%
								continue;
							}
							
							if(i == maxPage){
					%>
								<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>">...</span></a>
					<%
								continue;
							}
							if(i > maxPage){
								continue;
							}
						 	if(i < maxPage){
					%>							
						 	<a href="" onclick="searchBooks(<%=i %>, event)"><span class="<%=pageNo == i ? "activ" : "" %>"><%=i %></span></a>
					<%
						 	continue;
						 	}
						 	
						}
					}
					%>							
		</div>
	</div>
	</form>
</div>
<%@ include file="footer.jsp" %>

<script type="text/javascript">


function searchBooks(pageno, e) {
	if (e) {
		e.preventDefault();
	}
	// 전달받은 페이지번호를 form의 히든필드에 값으로 담는다.
	
	document.getElementById("page-no1").value = pageno;
	// 폼을 서버로 보낸다.
	// 폼의 pageno, sort, record, searchopt, searchkeyword값이 서버로 제출된다.
	document.getElementById("search-form").submit();
	
}

//숫자 콤마 붙이기

function numberFormat(inputNumber) {
   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//콤마 삭제
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
//가격 업데이트
function updateTotalPrice(event) {

	var minPrice = document.getElementById('min_price').value;
	var maxPrice = document.getElementById('max_price').value;
	
	document.getElementById('min_price').value = uncomma(minPrice);
	document.getElementById('max_price').value = uncomma(maxPrice);
}

function ableComma() {
	var minPrice = document.getElementById('min_price').value;
	var maxPrice = document.getElementById('max_price').value;
	
	document.getElementById('min_price').value = numberFormat(minPrice);
	document.getElementById('max_price').value = numberFormat(maxPrice);
	
}

function submit_brandName(brand) {
	
	console.log(brand.value);
	console.log("들어옴");
	
	 var minPrice = document.getElementById('min_price').value;
	   var maxPrice = document.getElementById('max_price').value;
	   
	   document.getElementById('min_price').value = 'all';
	   document.getElementById('max_price').value = 'all';
	
	document.getElementById('brandForm').submit();

		
	
}


</script>
</body>
</html>