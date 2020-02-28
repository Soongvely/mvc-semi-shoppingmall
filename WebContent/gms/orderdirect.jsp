<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.ItemOptionDao"%>
<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.vo.Cart"%>
<%@page import="ezo.shop.dao.ItemDao"%>
<%@page import="ezo.shop.dao.CartDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");
	int itemNo = NumberUtils.stringToNumber(request.getParameter("itemno")); 
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=detail.jsp?itemno="+itemNo);
		return;
	}



	
	String size = request.getParameter("size");
	String[] optionNos = request.getParameterValues("color");
	String[] amounts = request.getParameterValues("amount");
	int eachPrice = NumberUtils.stringToNumber(request.getParameter("eachPrice"));
	
	String text = request.getParameter("totalPrice");
	System.out.println(text);
	text = text.replaceAll(",", "");
	System.out.println(text);
	int totalPrice = NumberUtils.stringToNumber(text);
	System.out.println(text);
	
	

	
%>
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
#sb .tab-content {
   margin-top: 10px;
}

#sb .row {
   margin: 10px;
}

#sb #order-prod-info {
   margin-left: 35px;
   margin-top: 38px;
   padding: 0px 30px 28px;
   border: 3px solid #000;
   box-sizing: border-box;
}

#sb #order-prod-info .detail-prod-area {
   overflow: auto;
   height: 444px;
}

#sb .detail-price-area td {
   text-align: right;
}

#sb .orange {
   color: #ff4800;
   font-weight: bold;
   font-size: 28px;
}

#sb hr {
   border-bottom: 3px solid black;
}

#sb #check-out {
   background-color: #000;
   color: #fff;
   margin-top: 10px;
}

#sb #check-out:hover {
   background-color: #ff4800;
}

</style>
</head>
<body>
 <%@include file="navBarB.jsp" %>
   <div id="sb" class="container">
      <div class="col-sm-12">
         <div class="row">
            <div class="" align="center">
               <span style="color: rgba(0, 0, 0, 0.3);"><strong>01
                     SHOPPING BAG</strong></span> <span><strong>> 02 ORDER</strong> </span> <span
                  style="color: rgba(0, 0, 0, 0.3);"><strong>> 03
                     ORDER CONFIMED</strong></span>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-12">
            <form id="order-submit" class="form-horizontal " method="post" action="addorder.jsp">
               <div class="row">
                  <div class="col-sm-6">
                     <small><span>*</span>표시는 필수입력항목</small><br>
                     <small style="color: #ff4800">신규입력시 고객님이 입력한 배송지, 연락처에 따라 개인정보가 자동으로 업데이트 됩니다.</small>
                     <hr />
                     <h3>배송정보</h3>
                     <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#old-loc">최근배송지</a></li>
                        <li><a data-toggle="tab" href="#new-loc" onclick="resetOldLoc(event)" class="btn btn-warning">신규입력</a></li>

                     </ul>
                     <div class="tab-content">
                        <div id="old-loc" class="tab-pane fade in active">
                           <div class="form-group">
                              <label class="col-sm-2 control-label">수령인 *</label>
                              <div class="col-sm-10">
                                 <input id= "" type="text" readonly class="form-control" name="name" value="<%=loginedUser.getName()%>">
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label">배송지 *</label>
                              <div class="col-sm-10">
                                 <input id="reset0" type="text" class="form-control" name="address"
                                    value="<%=loginedUser.getAddress()%>">
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-sm-2">연락처 *</label>
                              <div class="col-sm-10">
                                 <input id="reset1" type="text" class="form-control" value="<%=loginedUser.getPhone() %>" name="phone1"  />
                              </div>
             
                           </div>
                           <div class="form-group">
                              <label class="control-label col-sm-2">연락처 2</label>
                              <div class="col-sm-10">
                                 <input id="reset2" type="text" class="form-control" name="phone2" value=""/>
                           </div>
         
                           </div>
                           <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-10">
                                 <select class="form-control" name="requestinfo">
                                    <option value="1000">배송시 요청사항을 선택해주세요</option>
                                    <option value="1100">부재중시 경비실에 맞겨주세요</option>
                                    <option value="1200">배송전에 연락주세요</option>
                                 </select>
                              </div>
                           </div>
                           <hr />
                           <div class="form-group">
                              <label class="control-label col-sm-2">적립금 </label>
                              <div class="col-sm-2">
                                 <input id="payment-point" class="" type="number" value="" name="usepoint"  onkeyup="alterPointByKeyboard(event);changePointBox();changeTotalBox();">
                              </div>
                              <div class="col-sm-5" style="left: 94px;">
                                 <button id="use-all-point" type="button" class="btn btn-default btn-xs"  onclick="useAllPoint()">사용</button>
                              	 <button id="cancel-all-point" type="button" class="btn btn-default btn-xs"  onclick="cancelAllPoint()">사용안함</button>	
                              </div>
                              <div class="col-sm-3 " style="text-align: left;">
                                 <small>보유적립금 <span id="mypoint" class=""><%=loginedUser.getPoint()%></span>p</small>
                    
                              </div>
                           </div>
                           <hr />
                           <div class="form-group">
                              <label class="control-label col-sm-2">결제방법</label>
                              <div class="col-sm-9 ">
                                 <input type="radio" name="paymethod" value="신용카드"
                                    checked="checked" onclick="showbox1()">신용카드 
                                 <input type="radio" name="paymethod" value="무통장"
                                    onclick="showbox2()">무통장 
                                 <input type="radio"   name="paymethod" value="네이버페이" onclick="showbox3()">네이버페이
                              </div>

                              <div class="col-sm-11">
                                 <div class="pay-info" style="margin-top: 20px;">
                                    <p id="paybox-1">신용/체크카드 MAC 환경에서도 신용카드 결제가 가능합니다.(ISP
                                       결제 제외) 국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다. (해외배송은
                                       불가능합니다) 금요일 오후 6시~ 일요일 주문은 결제 완료 후 취소 요청시 고객센터 > 주문취소를
                                       이용하시면 됩니다.</p>
                                    <p id="paybox-2">가상 계좌 안내계좌 유효 기간 2019년 12월 13일 23시 59분 59초
                                   					 가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명이 다르더라도 입금 확인이 가능합니다. 단, 선택하신 은행을 통해 결제 금액을 1원 단위까지 정확히 맞추셔야 합니다. 가상 계좌의 입금 유효 기간은 주문 후 2일 이내이며, 기간 초과 시 계좌번호는 소멸되어 입금되지 않습니다. 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상 계좌를 통한 재주문이 불가 합니다. 인터넷뱅킹, 텔레뱅킹, ATM/CD기계, 은행 창구 등에서 입금할 수 있습니다.
														ATM 기기는 100원 단위 입금이 되지 않으므로 통장 및 카드로 계좌이체 해주셔야 합니다. 은행 창구에서도 1원 단위 입금이 가능합니다. 자세한 내용은 FAQ를 확인하여 주시기 바랍니다.</p>
                                    <p id="paybox-3">삼성 페이 결제 가능 카드 : 삼성, 신한, 국민, 롯데, 농협,
                                       비씨, 하나, 우리, 씨티 결제 불가 카드 : 현대카드 '29CM X 하나 1Q Shopping+ 카드'
                                       청구할인 혜택을 받으시려면 결제방법 중 '신용/체크카드'를 선택해 결제해주시기 바랍니다</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="new-loc" ></div>

                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="form-group">
                        <div id="order-prod-info">
                           <div>
                              <h3>주문상품 정보/ 총 <%=optionNos.length %>개</h3>
                           </div>
                           <div class="detail-prod-area" >
                              <div class="row" >
                                 <% 
                                 	
                                    for(int i = 0; i < optionNos.length; i++) {
                                    int optionNo = NumberUtils.stringToNumber(optionNos[i]);
                                    int amount = NumberUtils.stringToNumber(amounts[i]);
                 
                                    ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
                                    ItemOption itemOption = itemOptionDao.getItemOptionByOptNo(optionNo);
                               		ItemDao itemDao = ItemDao.getInstance();
                               		Item item = itemDao.getItembyNo(itemOption.getItem().getNo());
                                 
                                    
                                    
                                 %>
                                 <div class="col-sm-5">
                                    <img alt="" src="<%=item.getImagePath() %>"   class="img-rounded" style="width: 90%; ">
                                    <br>
                                 </div>
                                 <div class="col-sm-7">
                                    <h6><%=item.getBrand() %></h6>
                                 
                                    <span><strong>옥스포드</strong></span>            
                                    <span style="color: #ff4800;"><%=item.getDiscountRate() %>%</span> 
                                    <span style="color: #ff4800;" class="comma"><%=item.getDiscountPrice() %></span><span>원</span>
                                     <span style="color: #686868">[COLOR:SIZE]<%=itemOption.getColor() %>:FREE</span>
                                     <span>　　수량:<%=amount %></span>
                                     <input type="hidden" name="optno" value="<%=optionNo%>">
                                     <input type="hidden" name ="optionamount" value="<%=amount %>">
                                      <br><br><br><br><br>
                                 </div>
                                 <% 
                                    } 
                                 %>
                              </div>
                           </div>
                           <div class="detail-price-area">
                              <table class="table">
                                 <colgroup>
                                    <col width="60%">
                                    <col width="40%">
                                 </colgroup>
                                 <tbody>
                                    <tr>
                                       <th>총 상품금액</th>
                                       
                                       <td><span id="before-price" class="comma"><%=totalPrice %></span>원</td>
                                    </tr>
                                    <tr>
                                       <th>배송비</th>
                                       <td><span class="comma">0</span>원</td>
                                    </tr>
                                    <tr>
                                       <th>적립금 사용 (-)</th>
                                       <td><span id="usepoint-text">0</span>p</td>
                                    </tr>
                                    <tr>
                                       <th>총 결제금액</th>
                                       <td class="orange" ><span  id="total-all-price" class="comma"><%=totalPrice%></span>원
                                       
                                       <input id="total-all-price2" type="hidden" name="totalallprice" value="<%=totalPrice%>"></td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>

                           <div class="check-out">
                              <input id="check-agree" type="checkbox" value="agree">주문하실 상품 및 결제,주문정보 확인하였으며, 이에 동의합니다. (필수) 
                              <button id="check-out" type="button"  class="btn btn default btn-block btn-lg" onclick="checkAgree()">CHECK OUT</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>

   </div>
   <%@include file="footer.jsp" %>
   <script type="text/javascript">
   var initUsePoint = document.querySelector('#mypoint').textContent;
      (function commaNumber() {
         var commaAll = document.querySelectorAll("[class='comma']");
         for (i = 0; i < commaAll.length; i++) {
            var eachComma =new Number(commaAll[i].textContent.replace(/,/g, '')).toLocaleString();

            commaAll[i].textContent = eachComma;
         }
   
         
      })();
      (function() {

         document.querySelector("#paybox-2").style.display = 'none';
         document.querySelector("#paybox-3").style.display = 'none';
         document.querySelector("#cancel-all-point").style.display = 'none';

      })();
      //적립금 전체사용
      function useAllPoint() {
         var useAllmyPoint = parseInt(document.querySelector('#mypoint').textContent);
    	 var beforePrice = parseInt(document.querySelector("#before-price").textContent.replace(/,/g,''));
    	 
    	 if(useAllmyPoint <= beforePrice) {
         
          document.getElementById('payment-point').value = useAllmyPoint
    	  document.querySelector('#mypoint').textContent = 0;
    	  document.querySelector('#usepoint-text').textContent = useAllmyPoint;
    	  
    	 
    	  
    	  var totalAllPrice = beforePrice-useAllmyPoint;
    	  
    	  
    	  document.querySelector('#total-all-price').textContent = Number(totalAllPrice).toLocaleString();
    	  document.getElementById('total-all-price2').value = totalAllPrice;
    	  
    	  document.querySelector("#use-all-point").style.display = 'none';
    	  document.querySelector("#cancel-all-point").style.display = 'block';
    	  return;
    	 } else {
    		 document.querySelector('#mypoint').textContent = useAllmyPoint - beforePrice; 
    		 document.getElementById('payment-point').value = beforePrice; 
    		 document.querySelector('#usepoint-text').textContent = beforePrice;
    		 document.querySelector('#total-all-price').textContent = 0;
    		 document.getElementById('total-all-price2').value = 0;
       	  document.querySelector("#use-all-point").style.display = 'none';
    	  document.querySelector("#cancel-all-point").style.display = 'block';
    	 }
    	 
      }
   
      
      // 적립금 전체취소
      function cancelAllPoint() {
    	  var paymentPoint = document.getElementById('payment-point').value;
    	  var beforePrice2 = document.getElementById('total-all-price2').value;
    	  var totalAllPrice2 = beforePrice2 - paymentPoint;
    	  
    	if(document.querySelector('#mypoint').textContent == 0) {
	    	  document.querySelector('#usepoint-text').textContent = 0;
	    	  var beforePrice = document.querySelector('#before-price').textContent;
	    	  document.querySelector('#total-all-price').textContent = beforePrice;
			  
	    	  document.getElementById('total-all-price2').value = totalAllPrice2;
	    	  
	    	  document.querySelector('#mypoint').textContent = paymentPoint;
	    	  document.getElementById('payment-point').value = "";
	    	  document.querySelector("#cancel-all-point").style.display = 'none';
	    	  document.querySelector("#use-all-point").style.display = 'block';
    	} else {
    		document.querySelector('#mypoint').textContent = parseInt(document.querySelector('#mypoint').textContent) + parseInt(document.getElementById('payment-point').value)
    		document.getElementById('payment-point').value = "";
    		document.querySelector('#usepoint-text').textContent = 0;
    		 document.querySelector('#total-all-price').textContent = document.querySelector("#before-price").textContent;
    		 document.getElementById('total-all-price2').value = parseInt(document.querySelector("#before-price").textContent.replace(/,/g,''));
	    	  document.querySelector("#cancel-all-point").style.display = 'none';
	    	  document.querySelector("#use-all-point").style.display = 'block';
    	}
      }
		
		// 적립금을 숫자로 쓰기
      var initMypoint = document.querySelector('#mypoint').textContent;
      function alterPointByKeyboard(event) { 
    	 var paymentPoint = document.getElementById('payment-point').value;
    	 var myPoint = document.querySelector('#mypoint').textContent;

	 		if(parseInt(paymentPoint) >  parseInt(myPoint))   {
	 		 	alert("보유적립금 보다 많은 적립금을 사용할 수 없습니다.");
	 		 	document.getElementById('payment-point').value = 0;
	 		 	document.querySelector('#mypoint').textContent = initMypoint;
	    		return;
	 		}
	 		if(parseInt(paymentPoint) > parseInt(document.getElementById('before-price').textContent.replace(/,/g,''))){
	 			alert("적립금 사용은 총 상품금액을 초과할 수 없습니다 ");
	 			document.getElementById('payment-point').value = 0;
	 			document.querySelector('#mypoint').textContent = initMypoint;
	 			return;
	 		}
	    	document.querySelector('#mypoint').textContent = initUsePoint - paymentPoint;
	    	
	    	if (paymentPoint == "") {
	    		 document.querySelector('#mypoint').textContent = initUsePoint;
	    		 return;
	    	
    	 	}
      }
	// 적립금 숫자로 할때 포인트박스 변화
	function changePointBox() {
		document.querySelector('#usepoint-text').textContent = document.getElementById('payment-point').value;
	}
	// 적립금 숫자로 할때 총가격변화
	function changeTotalBox() {
		var totalPrice = parseInt(document.querySelector("#before-price").textContent.replace(/,/g,'')) - document.getElementById('payment-point').value;
		document.querySelector('#total-all-price').textContent = totalPrice.toLocaleString();
		document.getElementById('total-all-price2').value = totalPrice;
	}
	
			
      // 다른 함수에서 호출하는(실행하는) 함수
      function hideAllBox() {

         document.querySelector("#paybox-1").style.display = 'none';
         document.querySelector("#paybox-2").style.display = 'none';
         document.querySelector("#paybox-3").style.display = 'none';
			
      }
      // 버튼 클릭시(이벤트 발생시)실행되는 함수
      function showbox1() {
         hideAllBox() // 수행문에서 다른함수 실행
         document.querySelector("#paybox-1").style.display = 'inline';

      }
      // 버튼 클릭시 실행되는 함수
      function showbox2() {
         hideAllBox() // 수행문에서 다른함수 실행
         document.querySelector("#paybox-2").style.display = 'block';

      }
      // 버튼 클릭시 실행되는 함수
      function showbox3() {
         hideAllBox() // 수행문에서 다른함수 실행
         document.querySelector("#paybox-3").style.display = 'inline-block';

      }
      //이전 주소 신규입력을 위해 초기화
      function resetOldLoc(e) {
         e.stopPropagation();
         var resetAll = document.querySelectorAll("[id^='reset']");
         for(var i=0; i<resetAll.length; i++) {
            
             document.querySelector('#reset'+i).value = "";
            
         }      
      }
      // 주문동의 필수체크 확인
      function checkAgree() {
    	 var check = document.getElementById('check-agree').checked
    	if(!check) {
    		alert("주문동의를 체크해 주십시오")
    		return;
    	}
    	document.querySelector('#order-submit').submit();
      }
   </script>
</body>
</html>


