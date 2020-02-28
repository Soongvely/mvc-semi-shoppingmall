<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.Order"%>
<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
#sb table {
	border: 4px solid #000;
}

#sb .row {
	margin: 30px;
}
</style>
</head>
<body>
<%@ include file="navBarB.jsp" %>
<% 	
	request.setCharacterEncoding("utf-8");
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=main.jsp");
		return;
	}
	String requestInfo = request.getParameter("requestinfo");
	int orderNo = NumberUtils.stringToNumber(request.getParameter("orderno")); 
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String dateText = sdf.format(now);
	
	
	OrderDao orderDao = OrderDao.getInstance();
	Order order = orderDao.getOrderByOrderNo(orderNo);
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd EEEE a h시 m분 s초");
	String paymentDate = sdf2.format(order.getCreateDate());
	
	OrderProductDao orderProductDao = OrderProductDao.getInstance();
	List<OrderProduct> orderProdcuts = orderProductDao.getOrderDetailByOrderNo(orderNo);
	
	
%>
	<div id="sb" class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="" align="center">
					<span style="color: rgba(0, 0, 0, 0.3);"><strong>01
							SHOPPING BAG</strong></span> <span style="color: rgba(0, 0, 0, 0.3);"><strong>>
							02 ORDER</strong> </span> <span><strong>> 03 ORDER CONFIMED</strong></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div>
					<table class="table" style="width: 100%; text-align: left;">
						<colgroup>
							<col width="80%">
							<col width="20%">
						</colgroup>
						<tr>
							<td class="" height="180px"><h2>
									<strong>주문이 완료 되었습니다</strong>
								</h2></td>
							<td rowspan="2"
								style="background-image: url('resources/images/brand_logo/g.jpg'); height: 250px;"></td>
						</tr>
						<tr>
							<td>주문번호 <strong><span style="color: #ff4800;">ORD<%=dateText %>-<%=(int)Math.ceil(Math.random() * order.getNo())%></span></strong></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div>
					<table class="table">
						<caption style="text-align: left;">주문 상품 정보 / <%=orderProdcuts.size() %>개</caption>
						<thead>
							<tr>
								<th>상품</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
								<%
									for(OrderProduct orderProduct : orderProdcuts){ 
								%>
							<tr>
								<td><img alt="" src="<%=orderProduct.getItemOption().getItem().getImagePath() %>"
									height="60px" width="60px">
								</td>
								<td>
									<ul style="list-style: none;">
										<li><%=orderProduct.getItemOption().getItem().getBrand()%></li>
										<li><strong><%=orderProduct.getItemOption().getItem().getName() %></strong></li>
										<li><span style="color: #ff4800;"><strong
												class="comma"><%=orderProduct.getItemOption().getItem().getDiscountPrice() %></strong><strong> 원</strong></span></li>
										<li><span style="color: #686868">[COLOR:SIZE]<%=orderProduct.getItemOption().getColor() %>:<%=orderProduct.getItemOption().getSize() %></span></li>
									</ul>
								</td>
								<td>
									<%=orderProduct.getOrderAmount() %>개
								</td>
								<td>
									<%=order.getPaymentStatus() %>
								</td>
							</tr>
								<%
									}
								%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div>
					<table class="table">
						<caption style="text-align: left;">결제정보</caption>
						<tbody>
							<tr>
								<th>결제방법</th>
								<td><%=order.getPaymentMethod() %></td>
							</tr>
							<tr>
								<th>결제금액</th>
								<td><span class="comma"><%=order.getTotalPrice() %></span><span>원</span></td>
							</tr>
							<tr>
								<th>결제일시</th>
								<td id=""><%=paymentDate %></td>
							</tr>
							<tr>
								<th>결제상태</th>
								<td id=""><%=order.getPaymentStatus() %></td>
							</tr>
		
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div>
					<table class="table">
						<caption style="text-align: left;">배송정보</caption>
						<tbody>
							<tr>
								<th>받으시는 분</th>
								<td><%=loginedUser.getName() %></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td><%=loginedUser.getPhone() %></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><%=loginedUser.getAddress() %></td>
							</tr>
							<tr>
								<th>배송요청사항</th>
								<td>부재중시 경비실에 맞겨주세요</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="text-align: center;">
				<a href="main.jsp"><button type="button" class="btn btn-default" style="width: 300px; "> CONTINUE
					SHOPPING</button></a>
				<a href="orderdeliverylist.jsp"><button type="button" class="btn btn-default"style="color: white; background-color: black; width: 300px;">주문/배송조회</button></a>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
	<script type="text/javascript">
	<!-- 숫자 콤마 붙이기-->


    (function commaNumber() {
        var commaAll = document.querySelectorAll("[class='comma']");
        for (i = 0; i < commaAll.length; i++) {
           var eachComma =new Number(commaAll[i].textContent.replace(/,/g, '')).toLocaleString();

           commaAll[i].textContent = eachComma;
        }
  
        
     })();
	</script>
</body>
</html>