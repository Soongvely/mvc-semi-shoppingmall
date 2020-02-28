<%@page import="ezo.shop.dao.OrderDao"%>
<%@page import="ezo.shop.vo.Order"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.OrderProductDao"%>
<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.util.NumberUtils"%>
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
  </style>
</head>
<body>
<%
   Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
   if (loginedUser == null) {
      response.sendRedirect("loginform.jsp?fail=deny&pageno=orderdeliverylist.jsp");
      return;
   }
   
   LikeDao likeDao = LikeDao.getInstance();
   int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
   
   OrderProductDao orderProductDao = OrderProductDao.getInstance();
   OrderDao orderDao = OrderDao.getInstance();
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
         
         <div>
            <h3>주문배송조회</h3>
            <div class="list-group" >
               <div class="col-sm-7">상품정보</div>   
               <div class="col-sm-2">배송비</div>   
               <div class="col-sm-3">진행상태</div>   
            </div>
            <%
               List<Order> orders = orderDao.getAllOrderByCustNo(loginedUser.getNo());
               List<OrderProduct> orderProducts = orderProductDao.getAllOrderDetailByCustNo(loginedUser.getNo());
            %>
            <%
               for (Order order : orders) {
            %>
               <li style="border-bottom: 2px solid black;">
               <div class="list-group1">
                  <div class="row" style="padding-left: 30px;">
                     <div class="list1">
                        <a href="orderdetail.jsp?orderno=<%=order.getNo() %>" class="a1">
                           <span>주문일자</span>
                           <em class="row1"><%=DateUtils.dateToString(order.getCreateDate()) %></em>
                        </a>   
                     </div>
                     <div class="list1">
                        <a href="orderdetail.jsp?orderno=<%=order.getNo() %>" class="a1">
                           <span>주문번호</span>
                           <em class="row1"><%=order.getNo() %></em> >
                        </a>   
                     </div>   
                  </div>
               </div>
               <%
                  for (OrderProduct orderProduct : orderProducts) {
                     if (orderProduct.getOrder().getNo().equals(order.getNo())) {
               %>
               <div class="list-group1">
                  <div class="row">
                     <div class="col-sm-7">
                        <a href="orderdetail.jsp?orderno=<%=order.getNo() %>" class="a1">
                           <div class="col-sm-3">
                              <img src="<%=orderProduct.getItemOption().getItem().getImagePath() %>" style="width: 100px; height: 100px;"/>
                           </div>
                           <div class="col-sm-9" style="height: 100px">
                              <p><strong style="padding-bottom: 5px; font-size: 12px;"><%=orderProduct.getItemOption().getItem().getBrand() %></strong></p>
                              <p><strong style="padding-bottom: 5px"><%=orderProduct.getItemOption().getItem().getName() %></strong></p>
                              <p><span><%=orderProduct.getItemOption().getSize() %> <%=orderProduct.getItemOption().getColor() %></span></p>
                              <p>
                                 <span><%=NumberUtils.numberWithComma(orderProduct.getItemOption().getItem().getDiscountPrice()) %> 원</span>
                                 <span><%=orderProduct.getOrderAmount() %> 개</span>                           
                              </p>
                           </div>                     
                        </a>
                     </div>   
                     <div class="col-sm-2" style="text-align: center;">
                        <div style="height: 100px; padding-top: 30px">
                           <span>무료배송</span>
                        </div>
                     </div>   
                     <div class="col-sm-3" style="text-align: center;">
                        <div style="height: 100px; padding-top: 30px">
                           <strong><%=orderProduct.getProductStatus() %></strong>
                        </div>
                     </div>
                  </div>
               </div>
               <%
                     }
                  }
               %>
            </li>
            <%   
               }
            %>
         </div>
         <div class="row" style="margin-top: 70px">
            <h3>주문상태 및 취소기간 안내</h3>
            <div>
               <img src="/semi/gms/resources/images/profile/list.JPG" style="width: 98%; padding-top: 20px;" />
            </div>      
         </div>
         <div class="row" style="margin-top: 40px">
            <h3>반품안내</h3>
            <p><small>불량 및 파손에 의한 반품을 제외한, 고객 변심에 의한 반품은 출고일로부터 7일 이후(평일기준)에는 불가합니다.</small></p>
            <p><small>상품의 배송구분에 따라 반품방식이 다르니, 이점 유의하시기 바랍니다.</small></p>
         </div>
         
         <div class="row" style="margin-top: 40px">
            <p><strong>반품절차</strong></p>            
            <p><small>번거로우시겠지만, 직접 반품을 해주셔야 합니다. 가능하시면 상품을 수령한 택배회사를 이용해주세요.</small></p>
            <p><small>업체별 개별기준이 있는 경우, 해당 기준이 우선 적용 됩니다 (해당 상품의 상품페이지 참고)</small></p>
            <div>
               <img src="/semi/gms/resources/images/profile/list1.JPG" style="width: 100%; padding-top: 20px;" />               
            </div>
         </div>
      </div>
   </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>