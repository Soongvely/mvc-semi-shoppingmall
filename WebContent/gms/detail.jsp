<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="ezo.shop.vo.ReviewCountWithStar"%>
<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.dao.ItemOptionDao"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.dao.ItemDao"%>
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
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<style type="text/css">

#sb #brandlogo {margin-left: -15px;}
#sb .img-thumbnail {padding: 0px;}
#sb #check-out {
   background-color: black;
   color: white;
}

#sb #check-out:hover {
   background-color: #ff4800;
}

#sb .row {
   margin-top: 10px;
}
/* modal position(center)*/
#sb .modal {
   text-align: center;
}
#sb .modal-content {top:300px;}
@
@media screen and (min-width: 768px) {
#sb .modal:before {
      display: inline-block;
      vertical-align: middle;
      content: " ";
      height: 100%;
   }
}

#sb .modal-dialog modal-sm {
   display: inline-block;
   text-align: left;
   vertical-align: middle;
}
#sb #total-price {
   color: #ff4800; font-size: 22px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: right;
   margin-left: 165px;
}
#sb #swiper1-detail .swiper-button-prev:after {right: 20px;}
#sb #swiper1-detail .swiper-button-next:after {left: 20px;}
#sb #swiper1-detail .swiper-pagination-fraction, #sb #swiper1-detail .swiper-pagination-custom, #sb #swiper1-detail .swiper-container-horizontal > .swiper-pagination-bullets {
   bottom: 0px;
   font-size: large;
}

#sb #swiper1-detail .swiper-container {
      width: 100%;
      height: 100%;
      padding-bottom: 30px;
   
    }
#sb #swiper1-detail .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
}


#sb #swiper1-detail .swiper-button-prev:after, #sb #swiper1-detail .swiper-button-next:after {
   color: rgba(0,0,0,0.4);
   position: absolute; 
   top: -10px;
   font-size: 25px;
   
}
#sb #swiper1-detail .swiper-pagination-bullet {
      width: 20px;
      height: 20px;
      text-align: center;
      line-height: 20px;
      font-size: 12px;
       color:rgba(0,0,0,0.4);
      opacity: 1;
      background-color: rgba(0,0,0,0.0);
      font-size: 25px;
      
    }
#sb #swiper1-detail   .swiper-pagination-bullet-active {
      color:#ff4800;
      
    }

#sp #swiper2-detail .swiper-container {
  width: 100%;
  height: 100%;
}
#sb #swiper2-detail .swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}   
#sb #swiper2-detail .swiper-button-prev:after, #sb #swiper2-detail .swiper-button-next:after {
   color: rgba(0,0,0,0.4);
   position: absolute; 
   font-size: 45px;
   
}
#sb #swiper2-detail .swiper-button-prev:after {left: 20px;}
#sb #swiper2-detail .swiper-button-next:after {right: 20px;}
#sb #swiper2-detail  .swiper-pagination-bullet {
      width: 10px;
      height: 10px;
      text-align: center;
      line-height: 20px;
   
      background: rgba(0,0,0,0.1);
      opacity: 1;
  

    }
#sb #swiper2-detail .swiper-pagination-bullet-active {
     
      background-color: rgba(0,0,0,0.4);
    }
#sb #swiper1-detail .swiper-button-prev:after {right: 20px;}
#sb #swiper1-detail .swiper-button-next:after {left: 20px;}
#sb #swiper1-detail .swiper-pagination-fraction, #sb #swiper1-detail .swiper-pagination-custom, #sb #swiper1-detail .swiper-container-horizontal > .swiper-pagination-bullets {
   bottom: 0px;
   font-size: large;
}

#sb #swiper3-detail .swiper-container {
      width: 100%;
      height: 100%;
      padding-bottom: 30px;
   
    }
#sb #swiper3-detail .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
}


#sb #swiper3-detail .swiper-button-prev:after, #sb #swiper3-detail .swiper-button-next:after {
   color: rgba(0,0,0,0.4);
   position: absolute; 
   top: -10px;
   font-size: 25px;
   
}
#sb #swiper3-detail .swiper-pagination-bullet {
      width: 20px;
      height: 20px;
      text-align: center;
      line-height: 20px;
      font-size: 12px;
       color:rgba(0,0,0,0.2);
      opacity: 1;
      background-color: rgba(0,0,0,0.0);
      font-size: medium;
      
    }
#sb #swiper3-detail   .swiper-pagination-bullet-active {
      color:rgba(0,0,0,0.7);
      
    }
#sb #star2 {
   color: #ff4800;
}
#sb #review-text {
   overflow: auto;
   height: 350px;
}
</style>
</head>
<body id="scroll-top">

<%@include file="navBarB.jsp" %>
<%
request.setCharacterEncoding("utf-8");
Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
%>
   
<%
      LikeDao likeDao = LikeDao.getInstance();

      int itemNo = NumberUtils.stringToNumber(request.getParameter("itemno"));
      int cateNo= NumberUtils.stringToNumber(request.getParameter("cateNo"));
      
      ItemDao itemDao = ItemDao.getInstance();
      Item item = itemDao.getItembyNo(itemNo);
      ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
      List<ItemOption> itemOptions = itemOptionDao.getItemOptionByItemNo(itemNo);   
      
      Map<String,Object> keyword = new HashMap<String,Object>();
      keyword.put("cateno", cateNo);
      keyword.put("end", 20);
      List<Item> items = itemDao.getItemTopList(keyword);
      ReviewDao reviewDao = ReviewDao.getInstance();
      List<Map<String, Object>> reviews = reviewDao.getReviewByItemNo(itemNo);
      System.out.println(reviews.size());
      
      ReviewCountWithStar cntStar = reviewDao.getCountWithStarByItemNo(itemNo);
      Integer custNo = null;
      if(loginedUser != null){
         custNo = loginedUser.getNo();
      }else{
         custNo = null;
      }
      
%>
   <div id="sb" class="container">
      <div class=categories style="text-align: center;">
         <div class="btn-group">
            <a class="btn btn-default" href="main.jsp">MAIN</a>
         </div>
         <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle"    data-toggle="dropdown" aria-expanded="false">
               MEN  <span class="caret" aria-hidden="true"></span></button>
            <ul class="dropdown-menu" role= "menu">
               <li><a href="itemList.jsp?title=MEN">MEN</a></li>
               <li><a href="itemList.jsp?title=WOMEN">WOMAN</a></li>
               <li><a href="itemList.jsp?title=ACC">ACC</a></li>
            </ul>
            
         </div>

      </div>

      <div id="brandlogo" class="row" >
         <div class="col-sm-2">
            <a href=""><img alt="brand_logo" src="<%=item.getImagePath() %>" class="img-thumbnail" style="width: 100px; height: 100px;"></a>
         </div>
         <div class="col-sm-6" style="margin-left: -70px; margin-top: 12px;">
            <p><%=item.getBrand() %></p>
            <p>EZO AhAh CHUNG</p>
            <a class="btn btn-default btn-sm " href="">BRAND HOME</a>

         </div>
      </div>
      <div class="row">
         <div class="col-sm-6">
            <div id="swiper2-detail">
               <div class="swiper-container">
                   <div class="swiper-wrapper">
                     <div class="swiper-slide"><img alt="" src="<%=item.getImagePath() %>"   class="img-thumbnail" style="width: 100%;height: 100%;"></div>
                     <div class="swiper-slide"><img alt="" src="resources/images/sb/cd.<%=itemNo %>.jpg"   class="img-thumbnail" style="width: 100%;height: 100%;"></div>
                     <div class="swiper-slide"><img alt="" src="resources/images/sb/cde.<%=itemNo %>.jpg"  class="img-thumbnail" style="width: 100%;height: 100%;"></div>

                   </div>
                   <!-- Add Arrows -->
                   <div class="swiper-pagination"></div>
                   <div class="swiper-button-next"></div>
                   <div class="swiper-button-prev"></div>
                 </div>
            </div>   
         </div>
         <div class="col-sm-6" style="border-top: 2px solid black; padding: 15px;">
            <div class="row">
               <div class="col-sm-10">
                  <h3><%=item.getName() %> </h3>
                  <p>
                     <span id="star1"><%=cntStar.getAvg() %></span> 
                     <a href="#move-review" class="btn btn-default-outline" style="background-color: transparent; color: grey;">
                     <small><u><%=cntStar.getCount()%>개   리뷰보기</u></small></a>
                  </p>
               </div>
               <div class="col-sm-2">
               <%
                  boolean check = false;
                  if(loginedUser != null){
                     List<Like> likes = likeDao.getLikeAllByCustNo(loginedUser.getNo());
                     for(Like like : likes) {
                        if(like.getItem().getNo() == item.getNo()) {
                           check = true;
                        }
                     }
                  }
               %>
                  <button type="button" class="btn btn-default btn-lg" onclick="checkLike(event,<%=item.getNo()%>)">
                  <span id="heart" class="<%=check == true ? "glyphicon glyphicon-heart" : "glyphicon glyphicon-heart-empty" %>" aria-hidden="true" style="color:red;"></span>
                  <br />
                  <span id="likecount"><%=item.getLikeCount() %></span>
                  </button>
               </div>
            </div>
            <div class="row" style="color: grey;">
               <div class="col-sm-12">
                  <del>
                     <span class="comma"><%=item.getPrice() %></span>
                  </del>
               </div>
            </div>
            <div class="row" style="color: #ff4800; font-size: 22px; border-bottom: 1px solid lightgrey;">
               <div class="col-sm-12">
                  <span><%=item.getDiscountRate() %>%</span> <span class="comma"><%=item.getDiscountPrice() %></span><span>원</span>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                  <dl>
                     <dt>상품할인</dt>
                     <dt>추가혜택</dt>
                  </dl>
               </div>
               <div class="col-sm-9">
                  <ul style="list-style: none;">

                     <li><span><%=item.getDiscountRate()%>% </span><span class="comma"><%=item.getDiscountPrice() %></span><span>원</span></li>

                     <!-- 적립금이 소수점이 될때는 생각해서 ceil로 올림합니다. -->
                     <li><span>적립금 </span><span class="comma"><%= Math.ceil(item.getDiscountPrice() * 0.1) %></span><span>p</span></li>
                  </ul>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                  <form id="cart-or-order-form" action="addcart.jsp?itemno=<%=itemNo %>" class=""  method="post">
                     <div class="form-group">
                        <select id="color-box"  name="" class="form-control" onchange="initSize()">
                           <option value="">-- 색상을 선택하세요 --</option>
                        <% 
                           for(ItemOption itemOption : itemOptions){
                        %>
                           <option id="<%=itemOption.getNo()%>" value="<%=itemOption.getNo()%>"><%=itemOption.getColor()%></option>
                     
                        <%
                           }
                        %>                     
                        </select>
                  </div>
                     <div class="form-group">
                        <select id="size-box" name="size" class="form-control"  onchange="addProduct(<%=item.getDiscountPrice() %>)">
                        <option value=''>-- 사이즈를 선택하세요 --</option>
                           <option value="FREE">FREE</option>
                        </select>
                     </div>
                     <div id="select-box">
                        <div id="selected-products-box" ></div>

                        <div class="row">
                           <div class="col-sm-12"   style="border-top: 2px solid black; ">
                           
                                 <span style="text-align: left">총 상품 금액 </span>
                                                      
                               <input type="hidden" name="eachPrice" value="<%=item.getDiscountPrice() %>">
                               <input id="total-price" type="text"class="comma" readonly value="" name="totalPrice"><span style="color: #ff4800; font-size: 22px;">원</span>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-sm-12">
                           <div>
                              <button id="shopping-bag" type="button" class="btn btn-default btn-block" onclick="addCart()">SHOPPING BAG</button>
                        
                              <button id="check-out" type="button" class="btn btn-block"   onclick="directOrder()" >BUY NOW</button>
                              
                              <!-- Modal -->
                              <div id="myModal" class="modal fade" role="dialog">
                                 <div class="modal-dialog modal-sm">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                       <div class="modal-body">
                                          <p>
                                             <strong>상품옵션을 선택해주세요</strong>
                                          </p>
                                          <button type="button" class="btn btn-default"
                                             data-dismiss="modal">확인</button>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                                 <div id="myModal2" class="modal fade" role="dialog">
                                 <div class="modal-dialog modal-sm">

                                   <!-- Modal content-->
									<div class="modal-content">
										<div class="modal-body" >
											<p>
												<strong>로그인이 필요합니다.</strong>
											</p>
											<a href="loginform.jsp" class="btn btn-default">확인</a>
                                       </div>
                                    </div>
                                 </div>
                              </div>                                    
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-12"  style=" border-top: 1px solid lightgrey;">
            <br>
            <dl>
               <dt>상품코드</dt>
               <dd><%= itemNo %></dd>
               <dt>배송정보</dt>
               <dd>해당브랜드는 50,000원 이상 구매시 무료배송</dd>
            </dl>
         </div>
      </div>
      <div class="row" style="border-top: 1px solid lightgrey; ">
         <h3>상품정보</h3><br>
         <div class="col-sm-12" style="position: relative; left: 60px;" style="border-color:#0000";>
            <img alt="" src="resources/images/sb/c.<%=itemNo %>.jpg"   class="img-thumbnail" style="border-color:#0000"> 
            <img alt="" src="resources/images/sb/d.<%=itemNo %>.jpg" class="img-thumbnail" style="border-color:#0000">   
            <img alt="" src="resources/images/sb/e.<%=itemNo %>.jpg"   class="img-thumbnail" style="border-color:#0000">
            <img alt="" src="resources/images/sb/f.<%=itemNo %>.jpg"   class="img-thumbnail" style="border-color:#0000">
         </div>
      </div>
      <div class="row">
         <div id="move-review" class="col-sm-12"   style=" border-top: 1px solid lightgrey;">
            <h3>상품리뷰 (<%=cntStar.getCount() %>) <span id="star2"><%=cntStar.getAvg()%></span></h3><br>
            <div id="swiper1-detail" >
              <div class="swiper-container">
                <div class="swiper-wrapper">
                  <% 
                     for(Map<String,Object> review : reviews) {
                     
                  %>
                        <div class="swiper-slide" ><a class="" href="#<%=review.get("REVIEW_NO") %>"><img alt="" class="rounded" src="<%=review.get("REVIEW_IMAGE") %>" style="width: 150px; height: 150px;"></a></div>
                      
                  <%   
                     }
                  %>
                   </div>
                   
                <!-- Add Pagination -->
                   <div class="swiper-pagination"></div>
                   <!-- Add Arrows -->
                   <div class="swiper-button-next"></div>
                   <div class="swiper-button-prev"></div>
              </div>
              
            </div>
            <div id="row">
                  
               <% 
                     for(Map<String,Object> review : reviews) {   
               %>
               <div id="<%=review.get("REVIEW_NO") %>" class="col-sm-12" style="border-top: 1px solid lightgrey; height: 250px;">
                     
                     <div  style="padding: 12px; ">
                        <span id="star3"><%=review.get("REVIEW_STAR") %></span><span> <%=review.get("CUST_NAME") %></span><span class="pull-right">작성일: <%=review.get("REVIEW_CREATE_DATE") %></span>
                     </div>
                     <div id="row" >   
                        <div id="review-text" class="col-sm-6">
                           <div><span style="color: #686868 ">[COLOR]<%=review.get("OPT_COLOR") %> [SIZE] <%=review.get("OPT_SIZE")%> 구매</span></div>
                           <div><p style="font-size: 18px; font-weight: ;"><%=review.get("REVIEW_CONTENTS") %></p></div>      
                        </div>
                        <div class="col-sm-6">
                           <div align="right"><img class="img-fluid" style=" width:200px; height: 200px;  padding: 10px; text-align:right" src="<%=review.get("REVIEW_IMAGE") %>"></div>
                        </div>
                     </div>
                     <br >
               </div>
               <%   
                  }
               %>
                  
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-12">
            <div class="guide-line">
               <div class="delivery-info"    style="border-top: 1px solid lightgrey; ">
                  <h3>배송정보</h3><br>
                  <ul>
                     <li>Delivery 브랜드 업체발송은 상품설명에 별도로 기입된 브랜드 알림 배송공지 기준으로 출고되고
                        브랜드마다 개별 배송비가 부여됩니다.</li>
                     <li>Delivery 29CM 자체발송은 오후 2시까지 결제확인된 주문은 당일 출고되고 5만원 이상 주문은
                        무료배송, 5만원 미만은 3,000원의 배송비가 추가됩니다.</li>
                     <li>SPECIAL ORDER, PT 등 예약주문은 상세설명의 출고일정을 확인하시기 바랍니다.</li>
                  </ul>
               </div>
               <div class="cs-info"    style="border-top: 1px solid lightgrey; ">
                  <h3>교환,환불,A/S 안내</h3><br>
                  <ul>
                     <li>상품 수령일로부터 7일 이내 반품 / 환불 가능합니다.</li>
                     <li>변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야
                        합니다.</li>
                     <li>SPECIAL ORDER, PT 등 예약주문은 상세설명의 출고일정을 확인하시기 바랍니다.</li>
                     <li>출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-sm-12"    style="border-top: 1px solid lightgrey; ">
            <h3>Ezo Recommend Best of Category (Likes) </h3><br>
             <div id="swiper1-detail">
              <div class="swiper-container">
                <div class="swiper-wrapper">
                  <% 
                     for(Item topItem : items) {
                  %>
                        <div class="swiper-slide"><a class="" href="detail.jsp?itemno=<%=topItem.getNo()%>&cateNo=<%=topItem.getCategory().getNo() %>"><img alt="" src="<%=topItem.getImagePath() %>" style="width: 100%; height: 100%;"></a></div>
                  <%
                     }
                  %>
                   </div>
                <!-- Add Pagination -->
                   <div class="swiper-pagination"></div>
                   <!-- Add Arrows -->
                   <div class="swiper-button-next"></div>
                   <div class="swiper-button-prev"></div>
              </div>
            </div> 
         </div>
      </div>
   </div>
      <!-- 스크롤 하기 -->

   
   <%@include file="footer.jsp" %>
   <%@include file="scroll.jsp" %>
   <div id="scroll-end"></div>
   <script type="text/javascript">
      //숫자 콤마 붙이기
      function commaNumber() {
         var commaAll = document.querySelectorAll("[class='comma']");
         for (i = 0; i < commaAll.length; i++) {
            var eachComma =new Number(commaAll[i].textContent.replace(/,/g, '')).toLocaleString();

            commaAll[i].textContent = eachComma;
         }
   
         
      }
      commaNumber();
      //사이즈 초기화
      function initSize() {
         document.getElementById('size-box').value = '';
         
      }
      //상품이 추가된다.
      function addProduct(price) {
         
         if (document.getElementById('size-box').value == "") {
            alert("컬러를 고르세요");
            return;
         }
         
         var optionNo = document.getElementById('color-box').value;
         var optionColor = document.getElementById(optionNo).textContent;
         var optionSize = document.getElementById(optionNo)
         
         
         var htmlContent = ""
         htmlContent += '<div class="row">'
         htmlContent += '   <div class="col-sm-4">'
         htmlContent += '      <div class="form-group">'
         htmlContent += '         <span>'+optionColor+'-FREE</span>'
         htmlContent += '             <input type="hidden" name="color" value="'+optionNo+'"/>'   
         htmlContent += '      </div>'
         htmlContent += '   </div>'
         htmlContent += '   <div class="col-sm-8" align="right">'
         htmlContent += '      <div class="form-group">'
         htmlContent += '         <button type="button" class="btn btn-default " onclick="minusAmount('+optionNo+')">-</button>'
         htmlContent += '         <input id="count-number-'+optionNo+'" name="amount" type="text" class="form-control" style="width: 41.5px; display: inline-block;" value="1">'
         htmlContent += '         <button type="button" class="btn btn-default "onclick="plusAmount('+optionNo+')">+</button>'
         htmlContent += '         <span id="each-price" class="comma">'+price+'</span><span>원</span>'
         htmlContent += '      </div>'
         htmlContent += '   </div>'
         htmlContent += '</div>';
         
         document.getElementById('selected-products-box').innerHTML += htmlContent;   
         showBox();
         updateTotalPrice();
         commaNumber();
      }
      //가격 업데이트
      function updateTotalPrice() {

         var eachPrice = document.getElementById('each-price').textContent.replace(/,/g, '');
         var arr = document.querySelectorAll("[id^='count-number']");
         
         var countNumber = 0;
         for (var i=0; i<arr.length; i++) {
            var span = arr[i];
            var count = parseInt(span.value);
            countNumber += count;
         }
         document.getElementById('total-price').value = new Number(eachPrice * countNumber).toLocaleString();
      }

      // 상품 수량 감소
      function minusAmount(optionNo) {
         var number = parseInt(document.getElementById('count-number-'+ optionNo).value);
         if (number <= 1) {

            return;
         }
         var count = number - 1;
         count += "";
         document.getElementById('count-number-'+optionNo).setAttribute('value', count);
         updateTotalPrice();
      }
      //상품 수량 증가
      function plusAmount(optionNo) {
         var number = parseInt(document.getElementById('count-number-'+optionNo).value);
         if (number >= 10) {
            alert("동일 상품은 10개까지만 구입가능합니다.");
            return;
         }
         var count = number + 1;
         count += "";
         document.getElementById('count-number-'+optionNo).setAttribute('value', count);
         updateTotalPrice();
      }
      //선택창 감추기
      (function hideBox() {
         document.querySelector('#select-box').style.display = 'none';
         
      })();
      //옵션 선택후 창 보이기
      function showBox() {
         if (document.querySelector('#color-box').value == ''
               && document.querySelector('#size-box').value == '') {
            alert("컬러를 먼저 선택하세요");
            document.querySelector("#size-box").value = '';
            return;
         }
         if (!(document.querySelector('#color-box option:checked').value == '' || document.querySelector('#size-box option:checked').value == ''))
            
            document.querySelector('#select-box').style.display = '';
      }
      // 상품 미선택시 띄우는 모달창
      function alertModal() {
         var color = document.querySelector('#color-box').value;
         if(color == '') {
            $('#myModal').modal("show");
            return false;
         }
         var size = document.querySelector('#size-box').value;
         if(size == '') {
            $('#myModal').modal("show");
            return false;
         }
         return true;
      }
      // 장바구니 바로구매 클릭시 로그인하라는 창
      (function getStar() {
         var starAll = document.querySelectorAll(("[id^='star']"));
         var star = starAll[0].textContent ;
         for(var i = 0; i< starAll.length; i++){
            if(star == 0){
               starAll[i].textContent = "☆☆☆☆☆"
               
            }
            if(star == 1){
               starAll[i].textContent = "★☆☆☆☆"
               
            }
            if(star == 2){
               starAll[i].textContent = "★★☆☆☆"
               
            }
            if(star == 3){
               starAll[i].textContent = "★★★☆☆"
               
            }
            if(star == 4){
               starAll[i].textContent = "★★★★☆"
               
            }
            if(star == 5){
               starAll[i].textContent = "★★★★★"
         
            }
         }
      })();
      
      // 카트로 이동.
      function addCart(){
         var result = alertModal();
         if(result){

         
            document.querySelector('#cart-or-order-form').submit();
         }
      }
      // 바로구매 페이지로 이동.
      function directOrder(){
         var result = alertModal();
         
         if (result) {
            document.querySelector('#cart-or-order-form').setAttribute("action", 'orderdirect.jsp?itemno=<%=itemNo%>');
            document.querySelector('#cart-or-order-form').submit();
         }
      }
      //리뷰 개수에 따라 별수 붙이기
      
      
      //swiper 컨텐츠
         //swiper 1
         var swiper = new Swiper('#swiper1-detail .swiper-container', {
              slidesPerView: 5,
              spaceBetween: 5,
              slidesPerGroup: 5,
              loop: true,
              loopFillGroupWithBlank: true,
              pagination: {
                el: '#swiper1-detail .swiper-pagination',
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + '</span>';
                  },
              },
              navigation: {
                nextEl: '#swiper1-detail .swiper-button-next',
                prevEl: '#swiper1-detail .swiper-button-prev',
              },
            });
         //swiper2
          var swiper = new Swiper('#swiper2-detail .swiper-container', {
             slidesPerView: 1,
                 spaceBetween: 30,
                 slidesPerGroup: 1,
                 loop: true,
                 pagination: {
                     el: '#swiper2-detail .swiper-pagination',
                     clickable: true,
                   },
              navigation: {
                nextEl: '#swiper2-detail .swiper-button-next',
                prevEl: '#swiper2-detail .swiper-button-prev',
              },
            });
         //swiper3 
         var swiper = new Swiper('#swiper3-detail .swiper-container', {
              slidesPerView: 5,
              spaceBetween: 5,
              slidesPerGroup: 5,
              loop: true,
              loopFillGroupWithBlank: true,
              pagination: {
                el: '#swiper3-detail .swiper-pagination',
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + '</span>';
                  },
              },
              navigation: {
                nextEl: '#swiper3-detail .swiper-button-next',
                prevEl: '#swiper3-detail .swiper-button-prev',
              },
            });
         
         function checkLike(e, itemno) {
            console.log(itemno);
            var itemNo = itemno;
            var custNo = <%=custNo%>;
            if(custNo == null){
               alertModal2();
               return;
            }
            console.log("좋아요 확인용",itemNo,custNo);
            $.ajax({
               url  : "http://localhost/semi/api/getLikeItemj",
               type : "POST",
               data : {
                  "itemNo" : itemNo,
                  "custNo" : custNo,
               },
               success : function(result) {
                     if(result){
                        $("#heart").attr('class','glyphicon glyphicon-heart');
                        console.log("좋아요 하트");
                        document.getElementById("likecount").textContent = parseInt(document.getElementById("likecount").textContent)+1;
                     }else{
                        $("#heart").attr('class','glyphicon glyphicon-heart-empty');
                        console.log("좋아요 하트X");
                        document.getElementById("likecount").textContent = parseInt(document.getElementById("likecount").textContent)-1;
                     }
                     console.log(<%=item.getLikeCount()%>);
               }
            });
         };
         
         
         
         function alertModal2() {
            var color = document.querySelector('#color-box').value;
            if(color == '') {
               $('#myModal2').modal("show");
               return false;
            }
            var size = document.querySelector('#size-box').value;
            if(size == '') {
               $('#myModal2').modal("show");
               return false;
            }
            return true;
         };
         
   </script>
</body>
</html>