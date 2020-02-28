<%@page import="java.math.BigDecimal"%>
<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="java.util.Map"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
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
       padding-bottom: 30px;
       height: 100%;
       width: 100%;
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
      padding-top: 10px;
   }
  </style>
</head>
<body>
<%
   Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
   if (loginedUser == null) {
      response.sendRedirect("loginform.jsp?fail=deny&pageno=orderdetail.jsp");
      return;
   }
   
   LikeDao likeDao = LikeDao.getInstance();
   int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
   
   Integer orderNo = Integer.parseInt(request.getParameter("orderno"));
   
   OrderDao orderDao = OrderDao.getInstance();
   OrderProductDao orderProductDao = OrderProductDao.getInstance();
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
               <a href="pointhistory.jsp"  class="bot"><%=NumberUtils.numberWithComma(loginedUser.getPoint()) %></a>
               </li>
            </ul>
         </div>
         
         <div class="padd" style="height: auto;">
            <h3>주문상세내역</h3>
            <div class="list-group" >
               <div class="col-sm-7">상품정보</div>   
               <div class="col-sm-2">배송비</div>   
               <div class="col-sm-3">진행상태</div>   
            </div>
            
            <li style="border-bottom: 1px solid black;">
            <%
            
               Order order = orderDao.getOrderByOrderNo(orderNo);
            %>
               <div class="list-group1">
                  <div class="row" style="padding-left: 30px;">
                     <div class="list1" style="margin-right: 20px;">
                        <span>주문일자</span>
                        <em class="row1"><%=DateUtils.dateToString(order.getCreateDate()) %></em>
                     </div>
                     <div class="list1">
                        <span>주문번호</span>
                        <em class="row1"><%=order.getNo() %></em>
                     </div>   
                  </div>
               </div>
               <%
                  List<OrderProduct> orderdetails = orderProductDao.getOrderDetailByOrderNo(orderNo);
                  for (OrderProduct orderdetail : orderdetails) {
               %>
               <div class="list-group1" >
                  <div class="row">
                     <div class="col-sm-7">
                        <a href="detail.jsp?itemno=<%=orderdetail.getItemOption().getItem().getNo() %>&cateNo=<%=orderdetail.getItemOption().getItem().getCategory().getNo() %>" class="a1">
                           <div class="col-sm-3">
                              <img src="<%=orderdetail.getItemOption().getItem().getImagePath() %>" style="width: 100px; "/>
                           </div>
                           <div class="col-sm-9" ">
                              <p><strong style="padding-bottom: 5px; font-size: 12px;"><%=orderdetail.getItemOption().getItem().getBrand() %></strong></p>
                              <p><strong style="padding-bottom: 5px"><%=orderdetail.getItemOption().getItem().getName() %></strong></p>
                              <p><span><%=orderdetail.getItemOption().getColor() %> <%=orderdetail.getItemOption().getSize() %></span></p>
                              <p>
                                 <span><%=NumberUtils.numberWithComma(orderdetail.getItemOption().getItem().getDiscountPrice()) %> 원</span>
                                 /<span> 수량 <%=orderdetail.getOrderAmount() %> 개</span>                           
                              </p>
                           </div>                     
                        </a>
                     </div>   
                     <div class="col-sm-2">
                        <div style=" padding-top: 30px">
                           <span>무료배송</span>
                        </div>
                     </div>   
                     <div class="col-sm-3" style="vertical-align: middle; text-align: center; width: 100px; margin-left: 60px;">   
                        <div style="padding-top: 30px;  text-align: center;">
                        <%
                        	// 구매확정, 주문취소, 교환/반품  ||
                           if ("구매확정".equals(orderdetail.getProductStatus()) || "주문취소".equals(orderdetail.getProductStatus()) || "교환/반품".equals(orderdetail.getProductStatus()) ) {
                        %>
                           <strong><%=orderdetail.getProductStatus() %></strong>
                        <%   
                           } else {
                        %>
                           <strong><%=orderdetail.getProductStatus() %> </strong>
                           <span style="text-align: center;">
	                           <a href="orderproductcancelform.jsp?orderproductno=<%=orderdetail.getNo() %>" style="background-color: black; color: white; width: 80px; text-align: center; ">주문취소</a>
    	                       <a href="" data-toggle="modal" data-target="#ghorderModal" style="background-color: black; color: white; width: 80px; text-align: center;">구매확정</a>
                           </span>
                        <%      
                           }
                        %>
                        </div>
                     </div>
                  </div>
               </div>
               
		        <div class="modal fade" id="ghorderModal" role="dialog" >
				   	<div class="modal-dialog" >
				 		<div class="modal-content" >
					 		 <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
						     </div>
				       		 <div class="modal-body">
				       		 	<div class="form-group" style="text-align: center; z-index: 100">
				        			<p>리뷰를 작성하면 최종결제금액의 10% 포인트가 적립됩니다. 리뷰페이지로 가시겠습니까?</p>
				        		</div>
				       		</div>
				       		<div class="modal-footer" >
				         		<a class="btn pull-right" href="reviewlist.jsp" style="width: 150px; text-align: center; background-color: black; color: white;">확인</a>
				         		<a class="btn btn-default pull-right" href="notreviewpurchaseconfirmation.jsp?orderproductno=<%=orderdetail.getNo() %>&orderno=<%=orderdetail.getOrder().getNo() %>" style="width: 160px; text-align: center; margin-right: 5px;">리뷰작성 없이 구매확정</a>
				       		</div>
				     	</div>
				   	</div>
				</div>
               
               <%
                  }
               %>
            </li>
         </div>
         

		
         <div class="padd">
            <h3>구매자정보</h3>
            <div>
               <div class="row list-group1">
                  <div class="col-sm-6">
                     <div class="col-sm-4" style="border-right: 1px solid gray;">주문자</div>
                     <div class="col-sm-8"><strong><%=loginedUser.getName() %></strong></div>
                  </div>
                  <div class="col-sm-6" >
                     <div class="col-sm-4" style="border-right: 1px solid gray;">이메일주소</div>
                     <div class="col-sm-8"><strong><%=loginedUser.getEmail() %></strong></div>
                  </div>
               </div>
               <div class="row list-group1">
                  <div class="col-sm-6">
                     <div class="col-sm-4" style="border-right: 1px solid gray; ">전화번호</div>
                     <div class="col-sm-8" ><strong></strong></div>
                  </div>
                  <div class="col-sm-6">
                     <div class="col-sm-4" style="border-right: 1px solid gray;">휴대폰번호</div>
                     <div class="col-sm-8"><strong><%=loginedUser.getPhone() %></strong></div>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="padd">
            <h3>결제정보</h3>
            <div class="row" style="padding-bottom: 5px">
            <%
            	Map<String, Object> amounts = orderDao.getPointUseAmountByOrderNo(orderNo);
            // 포인트를 사용하지 않았을 때 주문
				if (amounts == null) {
			%>
				<div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>주문금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(order.getTotalPrice()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">상품금액</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(order.getTotalPrice()) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">배송비</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>할인금액</strong></div>
                     <div class="col-sm-6"><strong><%=0 %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">포인트할인</div>
                     <div class="col-sm-6"><%=0 %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">쿠폰할인</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong style="color: #ff4800">결제금액</strong></div>
                     <div class="col-sm-6"><strong style="color: #ff4800"><%=NumberUtils.numberWithComma(order.getTotalPrice()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6"><%=order.getPaymentMethod() %></div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(order.getTotalPrice()) %> 원</div>
                  </div>
               </div>
			<%		
				} else {            	
            // 주문상품 전액 포인트 적용했을 경우 
           		System.out.println(((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue());
            	if (((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue() == 0) {
            %>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>주문금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">상품금액</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">배송비</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>할인금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">포인트할인</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">쿠폰할인</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong style="color: #ff4800">결제금액</strong></div>
                     <div class="col-sm-6"><strong style="color: #ff4800"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6"><%=order.getPaymentMethod() %></div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</div>
                  </div>
               </div>
               <%
            	   } else {
            		   // 주문상품의 일부만 포인트 적용했을 경우
               %>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>주문금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue()+((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">상품금액</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue()+((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">배송비</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>할인금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">포인트할인</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("POINT_USE_AMOUNT")).intValue()) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">쿠폰할인</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong style="color: #ff4800">결제금액</strong></div>
                     <div class="col-sm-6"><strong style="color: #ff4800"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue()) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6"><%=order.getPaymentMethod() %></div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(((BigDecimal)amounts.get("ORDER_TOTAL_PRICE")).intValue()) %> 원</div>
                  </div>
               </div>
               <%
	            	   }
					}
               %>
            </div>
            <div class="row" style="padding-left: 20px">
               <p><small>입금 시 주문자명과 상관없이 결제금액만 일치하면 정상 결제완료됩니다.</small></p>
               <p><small>입금기한까지 미입금 시 주문은 자동취소됩니다.</small></p>
            </div>         
         </div>
         <%
         	int addtotal = 0;
            for (OrderProduct orderdetail : orderdetails) {
               if ("주문취소".equals(orderdetail.getProductStatus()) || "교환/반품".equals(orderdetail.getProductStatus())) {
  					addtotal += orderdetail.getItemOption().getItem().getDiscountPrice()*orderdetail.getOrderAmount();
              
             
         %>
         <div class="padd">
            <h3>취소/환불정보</h3>
            <div class="row" style="padding-bottom: 5px">
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>원결제금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(addtotal) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">상품금액</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(addtotal) %> 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">환불배송비</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4" style="border-right: 1px solid gray;">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong>차감금액</strong></div>
                     <div class="col-sm-6"><strong><%=NumberUtils.numberWithComma(addtotal) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">추가배송비</div>
                     <div class="col-sm-6">0 원</div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">반품배송비</div>
                     <div class="col-sm-6">0 원 </div>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="row" style="border-bottom: 1px solid gray; font-size: 20px">                     
                     <div class="col-sm-6"><strong style="color: #ff4800">환불금액</strong></div>
                     <div class="col-sm-6"><strong style="color: #ff4800"><%=NumberUtils.numberWithComma(addtotal) %> 원</strong></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6"> 환불</div>
                     <div class="col-sm-6"><%=NumberUtils.numberWithComma(addtotal) %> 원</div>
                  </div>
               </div>
            </div>
            <div class="row" style="padding-left: 20px">
               <p><small>반품상품 수거완료 이후 환불금액이 확정됩니다.</small></p>
               <p><small>한 주문에서 여러 건의 취소/반품이 진행될 경우 처리 순으로 환불이 진행되므로 접수 시 환불예정금액과 실제 환불금액은 달라질 수 있습니다.</small></p>
               <p><small>저희 쇼핑몰은 포인트가 현금처럼 사용가능하기 때문에 포인트 취소가 아닌, 결제금액 그대로 취소 됩니다.</small></p>
            </div>         
         </div>
   		<%
               }
   			}
   		%>
         <div class="padd">
            <h3>배송지정보</h3>
            <div>
               <div class="row list-group1">
                  <div class="col-sm-2" style="border-right: 1px solid gray;">받는사람</div>
                  <div class="col-sm-10"><strong><%=loginedUser.getName() %></strong></div>
               </div>
               <div class="row list-group1">
                  <div class="col-sm-2" style="border-right: 1px solid gray;">전화번호</div>
                  <div class="col-sm-10"><strong><%=loginedUser.getPhone() %></strong></div>
               </div>
               <div class="row list-group1">
                  <div class="col-sm-2" style="border-right: 1px solid gray;">주소</div>
                  <div class="col-sm-10"><strong><%=loginedUser.getAddress() %></strong></div>
               </div>
               <div class="row list-group1">
                  <div class="col-sm-2" style="border-right: 1px solid gray;">배송요청사항</div>
                  <div class="col-sm-10"><strong>부재중시 경비실에 맡겨주세요</strong></div>
               </div>
            </div>
         </div>
         
      </div>
   </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>