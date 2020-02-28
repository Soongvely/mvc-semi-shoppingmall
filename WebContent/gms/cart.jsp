<%@page import="ezo.shop.vo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.CartDao"%>
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
   border-top: 4px solid #000;
   border-bottom: 1px solid #000;
   text-align: center;
}

#sb table th {
   text-align: center;
}

#sb #check-out {
   background-color: black;
   color: white;
}

#sb #check-out:hover {
   background-color: #ff4800;
}

#sb .row {
   margin: 25px;
   padding: 10px;
}
</style>
</head>
<body>
<%@include file="navBarB.jsp" %>
<% 
request.setCharacterEncoding("utf-8");
Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
if (loginedUser == null) {
   response.sendRedirect("loginform.jsp?fail=deny&pageno=cart.jsp");
   return;
}


CartDao cartDao = CartDao.getInstance();
List<Cart> carts = cartDao.getCartByCustNo(loginedUser.getNo());
System.out.println(loginedUser.getNo());



%>


   <div id="sb" class="container">
      <div class="row">
         <div class="col-sm-12">
            <div class="" align="center">
               <span><strong>01 SHOPPING BAG</strong></span> <span
                  style="color: rgba(0, 0, 0, 0.3);"> <strong>> 02
                     ORDER</strong>
               </span> <span style="color: rgba(0, 0, 0, 0.3);"><strong>>03 ORDER CONFIMED</strong></span>
            </div>
         </div>
      </div>
      <form id="order-form" action="order.jsp" method="post">
      <div class="row">
         <div class="col-sm-12">
            
               <div class="order-table1">
                  <table class="table">
                     <thead>
                        <tr>
                           <th><input type="checkbox" onchange="changeAllOrNothing()"   id="ck-all" checked="checked"/></th>
                           <th>상품</th>
                           <th>상품정보</th>
                           <th>수량</th>
                           <th>주문금액</th>
                           <th>배송비</th>

                        </tr>
                     </thead>
                     <tbody>
                        <%
                           if(carts.isEmpty()) {
                        %>
                           <tr>
                              <td colspan="12" class="text-center">장바구니에 담긴 상품이 없습니다</td>
                           </tr>
                        <%       
                           } else {
                              for(Cart cart : carts) { 
                        %>
                        <tr>
                        
                           <td><input id="cart-box" type="checkbox" name="cartno" value="<%=cart.getNo() %>" onchange="updateTotalPrice()" checked></td>
                           <!-- 체크박스가 상태가 바뀔때 마다 실행하겠다 -->
                           <td><img alt="" src="<%=cart.getItem().getImagePath() %>"   height="60px" width="60px"></td>
                           <td>
                              <span class="pull-right"><a href="deletecart.jsp?cartno=<%=cart.getNo() %>" class="btn btn-default btn-sm">X</a></span>
                              <ul style="list-style: none; text-align: left;">
                                 <li><%=cart.getItem().getBrand() %></li>
                                 <li><strong><%=cart.getItem().getName() %></strong></li>
                                 <li><span style="color: #ff4800;"><strong class="comma"  id="original-<%=cart.getNo() %>"><%=cart.getItem().getDiscountPrice() %> </strong>원</span></li>
                                 <li><span style="color: #686868">[COLOR:SIZE]<%=cart.getItemOption().getColor() %>:<%=cart.getItemOption().getSize() %></span></li>
                              </ul>
                           </td>
                           <td>
                              <div class="form-group">
                                 <button type="button" class="btn btn-default " onclick="minusAmount(<%=cart.getNo() %>)">-</button>
                                 <input  id="count-number-<%=cart.getNo() %>" type="text" class="form-control" name="amount" style="width: 41.5px; display: inline-block;" value="<%=cart.getAmount()%>">                                 
                                 <button type="button" class="btn btn-default" onclick="plusAmount(<%=cart.getNo() %>)">+</button>
                              </div>
                           </td>
                           <td><span id="each-order-price-<%=cart.getNo() %>" class="comma"><%=cart.getItem().getDiscountPrice() * cart.getAmount()%></span>원</td>
                           <td><span>무료 업체배송</span></td>
                        </tr>
                              <%
                                 } 
                              %>

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
            <button type="button" class="btn btn-default" onclick="deleteCartBySelected()">선택상품 삭제</button>
            <span class="pull-right">장바구니는  일주일 동안 보관됩니다.</span>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-12">
            <div class="order-table2">
               <table class="table">
                  <thead>
                     <tr>
                        <th>총 주문금액</th>
                        <th></th>
                        <th>총 배송비</th>
                        <th></th>
                        <th>총 결제금액</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <strong><span  id="total-item-price" class="comma" >0</span>원</strong><br />
                           <strong><span id="total-item-amount">0</span><span>개</span></strong>
                           
                           <input id="total-amount-calculated" type="hidden"  name="totalAmount" value="">
                           <input id="total-price-calculated" type="hidden" name="totalPrice" value="">
                        </td>
                        
                        <td><span class="glyphicon glyphicon-plus"
                           aria-hidden="true"></span></td>
                        <td><strong><span id="delivery-price" class="comma">0</span>원</strong></td>
                        <td><span class="glyphicon glyphicon-minus"
                           aria-hidden="true"></span></td>
                        <td><strong><span id="total-all-price" class="comma">0</span>원</strong></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-12" style="text-align: center;">
            <a href="detail.jsp" class="btn btn-default" style="width: 300px">CONTINUE
               SHOPPING</a>
            <button id="check-out" type="button" class="btn btn-default" onclick="orderCart(event)"
               style="width: 300px">CHECK OUT</button>
         </div>
      </div>
      </form>
   </div>
   <%@include file="footer.jsp" %>
   <script>
      

   // 주문하기
      function orderCart() {
       if(document.getElementById("total-price-calculated").value == ""){
    	   alert("장바구니에 담긴 상품이 없습니다.");
    	   return;
       } else {
    	   
	   	document.querySelector('#order-form').submit();    
       }
      }
      
      
      updateTotalPrice();
      
      // 총 주문 금액 구하기
      function updateTotalPrice() {
         var totalItemPrice = document.getElementById("total-item-price");
         var totalAllPrice = document.getElementById("total-all-price");
         var totalAllPrice2 = document.getElementById("total-price-calculated");
         var totalAllAmount2 = document.getElementById("total-amount-calculated");
         
         var checkedCheckboxes = document.querySelectorAll("input[name='cartno']:checked");
         if(checkedCheckboxes.length == 0) {
            document.getElementById('total-item-price').textContent = 0;
            document.getElementById('total-item-amount').textContent = 0;
            document.getElementById('total-all-price').textContent = 0;
            document.getElementById('delivery-price').textContent= 0;
            return;
         }
         var totalPrice = 0;
         var totalAmount = checkedCheckboxes.length;
         
         for (var i=0; i < checkedCheckboxes.length; i++) {
            var checkbox = checkedCheckboxes[i];
            var cartNo = checkbox.value;
            var itemPrice = document.getElementById("each-order-price-"+cartNo).textContent.replace(/,/g,'');
            totalPrice += parseInt(itemPrice);
         }
         
         var amount = checkedCheckboxes.length;
         document.getElementById("total-item-amount").textContent =  amount;
         
         
         totalItemPrice.textContent =  totalPrice;
         totalAllPrice.textContent = totalPrice;
         totalAllAmount2.value = amount
         totalAllPrice2.value =  totalPrice;
         commaNumber();
      }

      
      //즉시 숫자 콤마 붙이기  주문금액 = #each-order-price  총주문금액(totlalItemPrice)  총금액 = #total-all-price 
      function commaNumber() {
         var commaAll = document.querySelectorAll("[class='comma']");
         for (i = 0; i < commaAll.length; i++) {
            var eachComma =new Number(commaAll[i].textContent.replace(/,/g, '')).toLocaleString();

            commaAll[i].textContent = eachComma;
         }
   
         
      };
            
      // 수량에 따른 주문 금액 변화
      function updateOrderPriceByAmount(cartNo) {
         var amount = document.getElementById('count-number-'+cartNo).value;
         var price = document.querySelector("#original-" + cartNo).textContent.replace(/,/g, '');
         document.querySelector("#each-order-price-" + cartNo).textContent= new Number(price * amount).toLocaleString();
         
      }
      //수량감소
      function minusAmount(cartNo) {
         var number = parseInt(document.getElementById('count-number-'+cartNo).value);
         if (number <= 1) {
            return;
         }
         var count = --number;
         document.getElementById('count-number-'+cartNo).value = count;
         updateOrderPriceByAmount(cartNo);
         updateTotalPrice();
      }
      // 수량 증가
      function plusAmount(cartNo) {
         var number = parseInt(document.getElementById('count-number-'+cartNo).value);
         if (number >= 10) {
            alert("동일 상품은 10개까지만 구입가능합니다.");
            return;
         }
         var count = ++number;
         document.getElementById('count-number-'+cartNo).value = count;
         updateOrderPriceByAmount(cartNo);
         updateTotalPrice();
      }
      //선택 삭제
      function deleteCartBySelected() {
    	  var checkedCheckboxes = document.querySelectorAll("input[name='cartno']:checked");
         if (checkedCheckboxes.length == 0) {
            alert("선택된 아이템이 없습니다");

            return;
         }
     	document.querySelector('#order-form').setAttribute("action", "deletecart.jsp");
		document.querySelector('#order-form').submit();
	
		
      }

      
      //전체선택,전체취소
      function changeAllOrNothing() {
         var checkedStatus = document.querySelector("#ck-all").checked;
         
         var checkboxes = document.querySelectorAll("input[name='cartno']");
         for (var i = 0; i < checkboxes.length; i++) {
            var checkbox = checkboxes[i];
            checkbox.checked = checkedStatus;
         }
         updateTotalPrice();
      }
   </script>
</body>
</html>