<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.AdminOrderProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 주문 조회</h3>
        <!--주문 리스트 조회-->
        <div class="row mt" id="board-top-sy">
          <div class="col-md-12">
            <form id="search-form" class="form-horizontal style-form" method="get">
              <div class="form-panel">
                <div class="form-group" style="margin-top: 15px;">
                  <label class="control-label col-md-1">검색</label>
                  <div class="col-md-7">
                      <input type="text" name="search-keyword" class="form-control" placeholder="검색할 키워드 (주문번호 / 상품명 / 주문자명 / 주문자아이디) 를 입력해주세요." style="font-size: 13px;">
                      <span class="help-block" style="text-align:right">[0 - 30자 이내]</span>
                  </div>
                </div>
                <div class="form-group" style="margin-top: 15px;">
                  <label class="control-label col-md-1" style="margin-right:15px;">주문 일자</label>
                  <div style="float:left;display:inline-block;">
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="today()">오늘</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeThreeDays()">3일</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeOneweek()">7일</button>
                  </div>
                  <div class="col-md-5">
                      <div class="input-group input-large">
                        <input type="date" id="start-date" class="form-control dpd1" name="from">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="date" id="end-date" class="form-control dpd2" name="to">
                    </div>
                  </div>
                </div>
                <div class="form-group" id="payment-status" style="margin-top: 15px;">
                  <label class="control-label col-md-1">결제 상태</label>
                  <div class="col-md-6">
                    <div class="radio-sy">
                      <label>
                        <input type="radio" id="optionsRadios1" name="payment" value="all" checked> 전체
                      </label>
                      <label >
                        <input type="radio" id="optionsRadios1" name="payment" value="before"> 입금전
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios1" name="payment" value="success"> 결제완료
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios1" name="payment" value="cancle"> 결제취소
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group" id="order-status" style="margin-top: 15px; margin-bottom: 0px; border-bottom:none;">
                  <label class="control-label col-md-1">주문 상태</label>
                  <div class="col-md-7">
                    <div class="radio-sy">
                      <label>
                        <input type="radio" id="optionsRadios1" name="order" value="all" checked> 전체
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios2" name="order" value="cancle"> 주문취소
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios3"  name="order" value="change"> 교환/반품
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios4" name="order" value="success"> 구매확정
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-right" id="reset-btn" style="margin-right:6%; padding-top:10px; padding-buttom: 10px;">
                   <button type="reset" class="btn btn-warning btn-sm">초기화</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- 주문 리스트 start-->
        <div class="row mt" id="order-box">
          <div class="col-md-12">
            <div class="content-panel" style="margin: 10px;">
              <table class="table table-advance table-hover">
                <colgroup>
                  <col width="6%">
                  <col width="7%">
                  <col width="10%">
                  <col width="20%">
                  <col width="7%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                </colgroup>
                <div class="col-sm-6">
                  <div>
                    <p style="padding-top:8px;">[총 <span id="order-count" style="color:orange;">n</span>건의 조회결과]</p>
                  </div>
                </div>
                <div class="col-sm-6" >
                   <div class="dropdown" style="float:right; margin-left: 5px;">
                      <select class="btn btn-sm" name="showcount" style="border:1px solid lightgray;">
                        <option value="ten" selected>10개씩 보기</option>
                        <option value="twenty">20개씩 보기</option>
                        <option value="thirty">30개씩 보기</option>
                     </select>
                   </div>
                    <div class="dropdown" id="sort" style="float:right;">
                      <select class="btn btn-sm" name="sort" style="border:1px solid lightgray;">
                        <option value="date" selected>주문일순</option>
                        <option value="max">결제금액순</option>
                     </select>
                   </div>
                </div>
                <hr>
                <thead>
                  <tr class="sy-table-tr">
                    <th><i class=""></i>
                      <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" name="select-all" value="all"> 전체
                      </label>
                    </th>
                    <th>주문번호</th>
                    <th class="hidden-phone">주문자명[아이디]</th>
                    <th>상품명/옵션</th>
                    <th>수량</th>
                    <th>결제금액</th>
                    <th>주문일</th>
                    <th>결제수단</th>
                    <th>결제상태</th>
                    <th>주문상태</th>
                  </tr>
                </thead>
                <tbody class="board-body order"></tbody>
              </table>
            <div style="text-align: center" id="pagination"></div>
          </div>
        </div>
      </div>
      <!--/주문 목록 end-->
    </section>
  </section>

<script type="text/javascript">
	getOrderAndView();
	
	// 기간 조회
	function today() {
		var today = new Date();	
		$("#start-date").val(getDateString(today));
		$("#end-date").val(getDateString(today));
	}
	
	function beforeThreeDays() {
		var now = new Date();
		var time = now.getTime();
		var threeDaysTime = 60 * 60 * 24 * 3 * 1000;
		
		var beforeDay = new Date(time - threeDaysTime);
		
		$("#start-date").val(getDateString(beforeDay));
		$("#end-date").val(getDateString(now));
	}
	
	function beforeOneweek() {
		var now = new Date();
		var time = now.getTime();
		var oneWeekTime = 60 * 60 * 24 * 7 * 1000;
		
		var beforeDay = new Date(time - oneWeekTime);
		$("#start-date").val(getDateString(beforeDay));
		$("#end-date").val(getDateString(now));
	}
	
	function getDateString(date) {
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		month = month >= 10 ? month : '0' + month;
		day = day >= 10 ? day : '0' + day;
		
		return year + '-' + month + '-' + day;
	} 
	
	var page = 1;
	
	// 페이지네이션 실행
	$("#pagination").on("click", '.pagination li a', function(e) {
		page = $(this).data("page");		
		
		getOrderAndView();
	});
	
	// 폼 안의 버튼 클릭시 실행
	$("#search-form .form-group").on("click",'button', function(e) {
		getOrderAndView();	
	});
	
	// 리셋 버튼 누르면 초기화
	$("#reset-btn").on("click", 'button', function(e) {
		getOrderAndView();
	});
	
	// 폼이 바뀌면 실행
	$("#search-form").on("change", function(e) {
		getOrderAndView();	
	});
	
	// 누르면 실행
	$("#search-form").on("keyup", function(e) {
		getOrderAndView();	
	});
	
	// sort 실행
	$("select[name='sort']").on("change", function(e) {
		getOrderAndView();	
	});
	
	// 조건별 주문리스트 조회 ajax
	function getOrderAndView() {
		var keyword = $("input[name='search-keyword']").val();
		var startDate = $("input[name='from']").val(); 			
		var endDate = $("input[name='to']").val(); 	
		var payment = $("input[name='payment']:checked").val();
		var order = $("input[name='order']:checked").val();
		var showCount = $("select[name='showcount']").val();
		var sort = $("select[name=sort]").val();
		
		$.ajax({
			url : "/semi/api/getOrderByCriteria",
			data : {
				"keyword" : keyword,
				"startDate" : startDate,
				"endDate" : endDate,
				"payment" : payment,
				"order" : order,
				"showCount" : showCount,
				"sort"  : sort,
				"page" : page
			},
			success : function(resultMap) {
				
				var result = resultMap.list;
				var beginPage = resultMap.beginPage;
				var endPage = resultMap.endPage;
				var totalPage = resultMap.totalPage;
				var totalCount = resultMap.totalCount;
				
				var text = '';			
							
				if (result.length) {
					result.forEach(function(item, i) {
						var totalPrice = Number(item.order.totalPrice).toLocaleString();
						
						text +=	'<tr>';
						text += '<td>';
						text += '<label class="checkbox-inline" style="color:white;">';
						text += '<input type="checkbox" id="inlineCheckbox2" value="' +item.order.no+ '">-';
						text += '</label>';
						text += '</td>';
						text += '<td style="text-decoration: underline;">' +item.order.no+ '</td>';
						text += '<td>' +item.order.customer.name+ ' [ '+ item.order.customer.id +']</td>';
						text += '<td  style="font-weight: bold;">' +item.itemOption.item.name+ '<br/><p>' +item.itemOption.color+ ' - ' +item.itemOption.size+ '</p>';
						text += '</td>';
						text += '<td>' +item.orderAmount + '개</td>';
						text += '<td>' +totalPrice+ '원</td>';
						text += '<td>' +item.order.createDate+ '</td>';
						text += '<td>' +item.order.paymentMethod+ '</td>';
						text += '<td>' +item.order.paymentStatus+ '</td>';
						if (item.productStatus == '주문취소') {
							text += '<td><span class="label label-danger label-mini label-sy">' +item.productStatus+ '</span></td>';
						} else if (item.productStatus == '구매확정') {
							text += '<td><span class="label label-info label-mini label-sy">' +item.productStatus+ '</span></td>';
						} else if (item.productStatus == '결제완료') {
							text += '<td><span class="label label-success label-mini label-sy">' +item.productStatus+ '</span></td>';								
						} else if (item.productStatus == '교환/반품') {
							text += '<td><span class="label label-warning label-mini label-sy">' +item.productStatus+ '</span></td>';
						} else {
							text += '<td><span class="label label-default label-mini label-sy">' +item.productStatus+ '</span></td>';	
						}
						text += '</tr>';
					});
					
					var pageText = '';
					
					pageText += '<ul class="pagination pagination-sm">';
					if(beginPage > 3) {
						pageText += '<li><a data-page="' +(beginPage - 1)+ '" ><span>&laquo;</span></a></li>';
					}
					for (var i = beginPage; i <= endPage; i++) {
						pageText += '<li><a data-page="' + i + '" style=" ' + (page == i  ? 'background:skyblue' : '') +' ">' + i + '</a></li>';
					}
					// 총 페이지의 개수가 현재 선택된 페이지와 같으면 hide();
					pageText += '<li><a data-page="' +(endPage + 1)+ '" style=" ' + (totalPage == endPage ? 'display: none' : 'display:block')+ ' " ><span>&raquo;</span></a></li>'; 
					pageText += '</ul>';
					
					$("#pagination").html(pageText);
				} else {
					text += "<tr><td colspan='10'><h5>조회된 결과가 없습니다.</h5><td></tr>";
				}
				$("#order-count").text(totalCount);
				$("#order-box .board-body").html(text);
			}
		});
	};
	
</script>
<%@include file="../common/footer.jsp" %>        