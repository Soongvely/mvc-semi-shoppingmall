<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 배송 관리</h3>
        <!--배송내역 검색-->
        <div class="row mt" id="board-top-sy">
          <div class="col-md-12">
            <form action="#" class="form-horizontal style-form">
              <div class="form-panel">
                <div class="form-group" style="margin-top: 15px;">
                  <label class="control-label col-md-1">조회 타입</label>
                  <div class="col-md-2">
                    <select class="form-control" name="search-type">
                      <option value="orderno">주문번호</option>
                      <option value="orderproductno">주문상품번호</option>
                      <option value="productno">상품명</option>
                      <option value="orderername">주문자명</option>
                      <option value="orderderid">주문자 아이디</option>
                    </select>
                  </div>
                  <div class="col-md-5">
                      <input type="text" class="form-control" placeholder="검색할 키워드를 입력해주세요." style="font-size: 13px;">
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
                  <div>
                    <button type="button" class="btn btn-default btn-sm" id="button-sy-a" onclick="searchDelivery(1)">조회</button>
                  </div>
                </div>
                <div class="form-group" style="margin-top: 15px;">
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
                        <input type="radio" id="optionsRadios1" name="payment" value="deposit"> 입금완료
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios1" name="payment" value="pay"> 결제완료
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-right" style="padding-right:85px;padding-top:10px; padding-buttom: 10px;">
                   <button type="reset" class="btn btn-warning btn-sm">초기화</button>
                   <button type="submit" class="btn btn-theme btn-sm">검색</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- 문의글 목록 start-->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel" style="margin: 10px;">
              <table class="table table-advance table-hover">
                <colgroup>
                  <col width="6%">
                  <col width="*%">
                  <col width="*%">
                  <col width="*%">
                  <col width="7%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                  <col width="9%">
                </colgroup>
                <div class="col-sm-6">
                  <div>
                    <p style="padding-top:8px;">[총 <span style="color:orange;">n</span>건의 조회결과]</p>
                  </div>
                </div>
  				<div class="col-sm-6" >
  					<div class="dropdown" style="float:right; margin-left: 5px;">
                      <select class="btn btn-sm" name="show-count" style="border:1px solid lightgray;">
                        <option value="10">10개씩 보기</option>
                        <option value="20">20개씩 보기</option>
                        <option value="30" selected>30개씩 보기</option>
                     </select>
                   </div>
                    <div class="dropdown" style="float:right;">
                      <select class="btn btn-sm" name="sort" style="border:1px solid lightgray;">
                        <option value="max">높은가격순</option>
                        <option value="min">낮은가격순</option>
                        <option value="date" selected>등록일순</option>
                     </select>
                   </div>
                </div>
                <thead>
                  <tr class="sy-table-tr">
                    <th><i class=""></i>
                      <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 전체
                      </label>
                    </th>
                    <th>주문번호</th>
                    <th class="hidden-phone">주문자명[아이디]</th>
                    <th class="#">상품명/옵션</th>
                    <th class="#">주문금액</th>
                    <th>결제금액</th>
                    <th>주문일</th>
                    <th>결제수단</th>
                    <th>결제상태</th>
                    <th>배송상태</th>
                  </tr>
                </thead>
                <tbody class="board-body">
                  <tr class="board-bottom-sy">
                    <td><i class=""></i>
                      <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox2" value="option1">1
                      </label>
                    </td>
                    <td style="text-decoration: underline;">2345</td>
                    <td class="hidden-phone">이숭숭 [숭숭]</td>
                    <td>미니 플레어원피스 / color:blue / size:S <img src="" /></td>
                    <td>3,0000원</td>
                    <td>25,000원</td>
                    <td>2019-10-10 </td>
                    <td>계좌이체</td>
                    <td>입금완료</td>
                    <td>배송중</td>
                  </tr>
                </tbody>
              </table>
              <div style="text-align: center">
                <ul class="pagination pagination-sm">
                  <li><span>&laquo;</span></li>
                  <li> <a href="#">1</a> </li>
                  <li> <a href="#">2</a> </li>
                  <li> <a href="#">3</a> </li>
                  <li><span>&raquo;</span></li>
                </ul>
            </div>
            </div>
          </div>
        </div>
        <!--/주문 목록 end-->
      </section>
    </section>
<script type="text/javascript">

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
</script>

<%@include file="../common/footer.jsp" %>    