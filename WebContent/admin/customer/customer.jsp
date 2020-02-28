<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>   

<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 고객 관리</h3>
        <!--문의글 검색-->
        <div class="row mt" id="board-top-sy">
          <div class="col-md-12">
            <form id="customer-form" class="form-horizontal style-form" method="get">
              <div class="form-panel">
                <div style="margin-top: 15px;">
                  <div class="form-group">
                    <label class="control-label col-md-1">조회 타입</label>
                    <div class="col-sm-7">
                      <input type="text" class="form-control" name="keyword" placeholder="검색할 키워드 (고객명 / 고객아이디 / 연락처 / 이메일) 를 입력해주세요." style="font-size: 13px;">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-1">기간 조회</label>
                  <div class="col-md-2">
                    <select class="form-control">
                      <option>가입일</option>
                    </select>
                  </div>
                  <div class="col-md-5">
                    <div class="input-group input-large">
                      <input type="date" id="start-date" class="form-control dpd1" name="from" >
                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                      <input type="date" id="end-date" class="form-control dpd2" name="to">
                    </div>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px;border-bottom:none;">
                  <label class="control-label col-md-1">가입 여부</label>
                  <div class="col-md-4">
                    <div class="radio-sy" id="regist">
                      <label>
                     	 <input type="radio" name="regist" value="all" checked> 전체
                      </label>
                      <label>
                        <input type="radio" name="regist" value="regist" > 가입
                      </label>
                      <label>
                        <input type="radio" name="regist" value="secession"> 탈퇴
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-right" style="margin-right:8%; padding-top:10px; margin-buttom: 3%;">
                   <button type="reset" id="reset-btn" class="btn btn-warning btn-sm">초기화</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- 회원 목록-->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel" style="margin: 10px;">
              <table class="table table-advance table-hover">
                <colgroup>
               	  <col width="6%">
                  <col width="6%">
                  <col width="9%">
                  <col width="10%">
                  <col width="12%">
                  <col width="13%">
                  <col width="12%">
                  <col width="10%">
                  <col width="9%">
                  <col width="6%">
                </colgroup>
                <div class="col-sm-6">
                  <div>
                    <p style="padding-top:8px;">[총 <span id="customer-count" style="color:orange;">n</span>건의 조회결과]</p>
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
                        <option value="regist" selected>가입일순</option>
                        <option value="reverse">가입일역순</option>
                     </select>
                   </div>
                </div>
                <!--end-->
                <hr>
                <thead>
                  <tr class="sy-table-tr">
                    <th>전체</th>
                    <th>고객번호</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>생년월일</th>
                    <th>등록일</th>
                    <th>가입여부</th>
                    <th>탈퇴처리</th>
                  </tr>
                </thead>
                <tbody class="board-body-cust" id="customer-box"></tbody>
              </table>
              <div style="text-align: center" id="pagination"></div>
            </div>
          </div>
        </div>
      </section>
    </section>

<script type="text/javascript">
	getCustomerAndView();
	
	function getDateString(date) {
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
	
		month = month >= 10 ? month : '0' + month;
		day = day >= 10 ? day : '0' + day;
	
		return year + '-' + month + '-' + day;
	}
	
	var page = 1;
	
	$("#pagination").on('click', '.pagination li a', function(e) {
		page = $(this).data("page");
		
		console.log(page);
		getCustomerAndView();
	});
	
	$("#customer-form").on("change", function(e) {
		console.log("change");
		
		getCustomerAndView();
	});
	
	$("#customer-form").on("keyup", function(e) {
		console.log("keyup");
		
		getCustomerAndView();
	});
	
	$("select[name='sort']").on("change", function(e) {
		console.log("change");
		
		getCustomerAndView();	
	});

	//리셋 버튼 누르면 초기화
	$("#reset-btn").on("click", 'button', function(e) {
		console.log("click");
		
		getCustomerAndView();
	});
	
	// 고객 탈퇴처리
	$("#customer-box").on("click", "button[id^='btn-delete-']" ,function(e) {
		console.log("click");
		
		var no = $(this).prop("id").replace("btn-delete-", "");
		
		$.ajax({
			url: "/semi/api/updateCustomer",
			data: {"no" : no},
			success : function(){
				getCustomerAndView();
			}
		});
	});
	
	// 고객 조회 ajax
	function getCustomerAndView(){
		var keyword = $("input[name='keyword']").val();
		var startDate = $("input[name='from']").val(); 
		var endDate = $("input[name='to']").val(); 
		var regist = $("input[name='regist']:checked").val();
		var sort = $("select[name='sort']").val();
		var showCount = $("select[name='showcount']").val();
		
		$.ajax({
			url: "/semi/api/getCustomerByCriteria",
			data: {
				"keyword" : keyword,
				"startDate" : startDate,
				"endDate" : endDate,
				"regist" : regist,
				"sort" : sort,
				"showCount" : showCount,
				"page" : page
			},
			success : function(resultMap) {
				
				var result = resultMap.list;
				var totalPage = resultMap.totalPage;
				var beginPage = resultMap.beginPage;
				var endPage = resultMap.endPage;
				var totalCount = resultMap.totalCount;
				
				var text = '';
				
				if (result.length) {
					result.forEach(function(item, i) {
						
						text += '<tr>';
						text += '<td>';
						text += '<label class="checkbox-inline" style="color:white;">';
						text += '<input type="checkbox" name="boardno" value="'+item.no+'" >-';
						text += '</label>';
						text += '</td>';
						text += '<td>' + item.no + '</td>';
						text += '<td>' + item.name + '</td>';
						text += '<td>' + item.id + '</td>';
						text += '<td>' + item.phone + '</td>';
						text += '<td>' + item.email + '</td>';
						text += '<td>' + item.birthday + '</td>';
						text += '<td>' + item.createDate + '</td>';
						
						if(item.enabled == 'Y'){
							text += '<td><span class="label label-info label-mini label-sy">가입</span></td>';
						} else {
							text += '<td><span class="label label-default label-mini label-sy">탈퇴</span></td>';
						}
						text += '<td class="button-ud">';
						text += '<button id="btn-delete-' + item.no + '" class="btn btn-danger btn-xs" style="margin-left: 3px;"><i class="fa fa-minus-circle "></i></button>';
						text += '</td>';
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
					pageText += '<li><a data-page="' +(endPage + 1)+ '" style=" ' + (totalPage == endPage ? 'display: none' : 'display:block')+ ' " ><span>&raquo;</span></a></li>'; 
						
					pageText += '</ul>';
					
					$("#pagination").html(pageText);
					
				} else {
					text += "<tr><td colspan='10'><h5>조회된 결과가 없습니다.</h5><td></tr>";
				}
				$("#customer-count").text(totalCount);
				$("#customer-box").html(text);
			}
		});
	}
</script>    
    
<%@include file="../common/footer.jsp" %>        