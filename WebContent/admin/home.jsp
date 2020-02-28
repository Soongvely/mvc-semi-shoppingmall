<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="ezo.shop.dao.AdminReviewDao"%>
<%@page import="ezo.shop.dao.AdminOrderProductDao"%>
<%@page import="ezo.shop.dao.QuestionBoardDao"%>
<%@page import="com.sun.org.apache.xpath.internal.operations.Minus"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>

  <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->

            <!--custom chart end-->
            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5 style="font-weight: bold;">배송 현황</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 70,
                        color: "#FF6B6B"
                      },
                      {
                        value: 30,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-12 col-xs-12">
                      <p><span style="color:white; font-size: 15px;">Before 30% </span>|<span style="color:salmon; font-size: 15px;"> Completed 70%</span></p>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5 style="font-weight: bold;">카테고리별 매출</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 34,
                        color: "#1c9ca7"
                      },
                      {
                        value: 20,
                        color: "whitesmoke"
                      },
                      {
                        value: 46,
                        color: "#f68275"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <footer>
                     <div class="pull-center" style="margin-top: 20px; font-weight: 700; margin-left: 15px;">
                      <h5><span style="color: salmon"> Women-46% </span>|<span style="color:#43b1a9"> Men-34% </span>|<span style="color: white"> Acc-20%</span></h5>
                    </div>
                  </footer>
                </div>
                <!--  /darkblue panel -->
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="sy-green-panel pn">
                  <div class="sy-green-header">
                    <h5 style="font-weight: bold;">주문 현황</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 67,
                        color: "#43b1a9"
                      },
                      {
                        value: 18,
                        color: "#f68275"
                      },
                      {
                        value: 15,
                        color: "whitesmoke"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <footer>
                  <p></p>
                    <div class="pull-center" style="margin-top: 20px; font-weight: 700; margin-left: 15px;">
                      <p><span style="color: white;">Cancle-15%</span> |<span style="color: #f68275"> Change-18% </span>|<span> purchase-67%</span> </p>
                    </div>
                  </footer>
                </div>
              </div>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis"></ul>
            
            <script type="text/javascript">
           		$.ajax({
           			url: "/semi/api/testSoong",
           			success: function(result) {
           				
           				var text = '';
           				
           				var maxPrice = 0;
           				for(var str in result ){
           					if(maxPrice < result[str].price)
           					maxPrice = result[str].price;
           				}
           				
						var maxPriceRound = Math.round(maxPrice/1000)*1000;
           				var standardText = '<li><span>' + new Number(maxPriceRound).toLocaleString() + '</span></li>';
           				standardText += '<li><span>800,000</span></li>';
           				standardText += '<li><span>600,000</span></li>';
           				standardText += '<li><span>400,000</span></li>';
           				standardText += '<li><span>200,000</span></li>';
           				standardText += '<li><span>0</span></li>';
           				$(".y-axis").append(standardText);
           			}
           		
           			/*	
           				for(var str in result) {
           					var salePrice = result[str];
           					
           					 text +='<div class="bar">'
       						 text +='<div class="title">'+ salePrice.createDate +'</div>'
   							 text +='<div class="value tooltips" data-original-title="'+(salePrice.price).toLocaleString()+'" data-toggle="tooltip" data-placement="top">'+ Math.round(salePrice.price/maxPrice*100) +'%</div>'
							 text +='</div>'
           				}
           				
           				$(".custom-bar-chart").append(text);
           			}
           		*/
           		})
            </script>
	            <div class="bar">
	              <div class="title">12/10</div>
	              <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
	            </div>
	            <div class="bar ">
	              <div class="title">12/11</div>
	              <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
	            </div>
	            <div class="bar ">
	              <div class="title">12/12</div>
	              <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
	            </div>
	            <div class="bar ">
	              <div class="title">12/13</div>
	              <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
	            </div>
	            <div class="bar">
	              <div class="title">12/14</div>
	              <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
	            </div>
	            <div class="bar ">
	              <div class="title">12/15</div>
	              <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
	            </div>
	            <div class="bar">
	              <div class="title">12/16</div>
	              <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
	            </div>	
            </div>
            <div class="row mt" style="margin-top : 80px; font-size: 17px;">
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="steps pn">
                  <label class="firstblock"> 결제현황 </label>
                  <label class="secondblock">ㆍ입금전 <span class="thirdblock" style="color: #889199; "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35건</span></label>
                  <label class="secondblock">ㆍ결제완료 <span class="thirdblock" style="color: #889199; ">&nbsp;&nbsp; 87건</span> </label>
                  <label class="secondblock">ㆍ결제취소 <span class="thirdblock" style="color:#889199; ">&nbsp;&nbsp; 16건</span> </label>
                </div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="steps pn">
                  <label class="firstblock"> 주문현황 </label>
                  <label class="secondblock">ㆍ주문취소 <span class="thirdblock" style="color: #889199; "> &nbsp;  &nbsp; 16건</span></label>
                  <label class="secondblock">ㆍ교환/반품 <span class="thirdblock" style="color: #889199;">&nbsp;&nbsp;28건</span> </label>
                  <label class="secondblock">ㆍ구매확정 <span class="thirdblock" style="color: #889199;"> &nbsp;  &nbsp; 45건</span></label>
                </div>
              </div>
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="steps pn">
                  <label class="firstblock"> 배송현황 </label>
                  <label class="secondblock">ㆍ배송전 <span class="thirdblock" style="color:#889199;">&nbsp;  &nbsp;  15건</span></label>
                  <label class="secondblock">ㆍ배송중 <span class="thirdblock" style="color: #889199;">&nbsp;  &nbsp;  36건</span> </label>
                  <label class="secondblock">ㆍ배송완료 <span class="thirdblock" style="color: #889199;">&nbsp;67건</span></label>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 ds">
            <div class="panel terques-chart">
              <div class="panel-body">
                <div class="chart">
                  <div class="centered">
                  <br>
                    <strong>Visitor Statistics</strong>
                    <span>by Day</span>
                  </div>
                  <br>
                  <br>
                  <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4"
                    data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
		            <br>
                </div>
              </div>
            </div>
            <h4 class="centered mt">Recent Message</h4>
            <%
				QuestionBoardDao questionBoardDao = QuestionBoardDao.getInstance();   
            	int boradCount = questionBoardDao.getTotalCountBoardReplyIsNot();
            	
            	AdminOrderProductDao adminOrderProductDao = AdminOrderProductDao.getInstance();
            	int recentOrder = adminOrderProductDao.getCountRecentOrder();
            	int beforePayment = adminOrderProductDao.getCountBeforePayment();
            	
            	AdminReviewDao adminReviewDao = AdminReviewDao.getInstance();
            	int recentReview = adminReviewDao.getCountRecentReview();
            %>
            <br>
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details sy-message">
                <p  style="font-size:12px;">
                  <muted><span>28분 전</span></muted>
                  <br />
                  <a href="order/order.jsp">신규 주문</a>이 <span style="color:orange;"> <%=recentOrder %></span>건 있습니다.<br />
                </p>
              </div>
            </div>
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details sy-message">
                <p  style="font-size:12px;">
                  <muted><span>35분 전</span></muted>
                  <br />
                  <a href="order/order.jsp">입금 대기건</a>이 <span style="color:orange;"> <%=beforePayment %></span>건 있습니다.<br />
                </p>
              </div>
            </div>
            <div class="desc">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details sy-message">
                <p style="font-size:12px;">
                  <muted>58분 전</muted>
                  <br />
                  <a href="board/board.jsp">미답변 문의</a>가 <span style="color:orange;"> <%=boradCount %></span>건 있습니다.<br />
                </p>
              </div>
            </div>
            <div class="desc" style="border-bottom: none;">
              <div class="thumb">
                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
              </div>
              <div class="details sy-message">
                <p style="font-size:12px;">
                  <muted>1시간 전</muted>
                  <br />
                  <a href="board/board.jsp?searchtype=review">최근 상품 리뷰</a>가 <span style="color:orange;"> <%=recentReview %></span>건 있습니다.<br />
                </p>
              </div>
            </div>
          </div>
        </div>
      </section> 
    </section>

<%@include file="common/footer.jsp"%>