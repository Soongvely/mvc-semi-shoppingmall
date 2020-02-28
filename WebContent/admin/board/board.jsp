<%@page import="ezo.shop.dao.AdminOrderProductDao"%>
<%@page import="ezo.shop.vo.OrderProduct"%>
<%@page import="ezo.shop.dao.AdminReviewDao"%>
<%@page import="ezo.shop.vo.Review"%>
<%@page import="ezo.shop.dao.ReviewDao"%>
<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.QuestionBoardDao"%>
<%@page import="ezo.shop.vo.QuestionBoard"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/header.jsp"%> 
  
  <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 게시글 관리</h3>
        <%
        	String searchType = request.getParameter("searchtype");			// 검색 타입   
        	String questionType = request.getParameter("questiontype");		// 문의 타입				
        	String searchKeyword = request.getParameter("searchkeyword"); 	// 검색 키워드
        	
        	if (searchType == null) {
        		searchType = "question";
        	}
        %>
        <!--문의글 검색-->
        <div class="row mt" id="board-top-sy">
          <div class="col-md-12">
            <form id="search-form" class="form-horizontal style-form" method="get">
              <input type="hidden" id="pageno" name="pageno">
              <div class="form-panel">
                <div style="margin-top: 15px;">
                  <div class="form-group">
                    <label class="control-label col-md-1">게시글 타입</label>
                    <div class="col-md-3">
                      <select class="form-control" id="search-type" name="searchtype" onchange="toggleBoard()">
                        <option value="question" <%="question".equals(searchType) ? "selected" : "" %>>문의</option>
                        <option value="review" <%="review".equals(searchType) ? "selected" : "" %>>리뷰</option>
                      </select>
                    </div>
                    <div class="col-md-1"></div>
                    <!-- 게시글타입이 '문의'일 경우에만 표시 -->
                    <label class="control-label col-md-1 question-type">문의 타입</label>
                    <div class="col-md-3 question-type">
                      <select class="form-control sy" id="question-type" name="questiontype">
                        <option value="all" >전체</option>
                        <option value="product" <%="product".equals(questionType) ? "selected" : "" %>>상품</option>
                        <option value="payment" <%="payment".equals(questionType) ? "selected" : "" %>>결제</option>
                        <option value="delivery" <%="delivery".equals(questionType) ? "selected" : "" %>>배송</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">게시글 검색</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="searchkeyword" autocomplete="off" placeholder="검색할 키워드를 입력해주세요." style="font-size: 13px;">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-1" style="margin-right:15px;">기간 조회</label>
                  <div style="display:inline-block;float:left">
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="today()">오늘</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeThreeDays()">3일</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeOneWeek()">7일</button>
                  </div>
                  <div class="col-md-5">
                      <div class="input-group input-large">
                        <input type="date" id="start-date" class="form-control dpd1 text-center" name="from" >
                       	<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="date" id="end-date" class="form-control dpd2 text-center" name="to" >
                    </div>
                  </div>
                </div>

                <div class="form-group" id="answered-status" >
                  <label class="control-label col-md-1" >답변 상태</label>
                  <div class="col-md-6">
                    <div class="radio-sy">
                      <label>
                        <input type="radio" name="answered" value="all" checked> 전체
                      </label>
                      <label>
                        <input type="radio" name="answered" value="unanswered"> 미답변
                      </label>
                      <label>
                        <input type="radio" name="answered" value="answered"> 답변완료
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
        <!-- 문의글 목록-->
        <div class="row mt" id="question-box" style="display: <%="question".equals(searchType) ? "block" : "none" %>;" >
          <div class="col-md-12">
	          <form id="board-form" onsubmit="return false;">
	            <div class="content-panel" style="margin: 10px;">
	              <table class="table table-advance table-hover">
	                <colgroup>
	                  <col width="6%">
	                  <col width="6%">
	                  <col width="11%">
	                  <col width="36%">
	                  <col width="10%">
	                  <col width="11%">
	                  <col width="10%">
	                </colgroup>
	                <div class="col-sm-6">
	                  <div>
	                    <p style="padding-top:8px;">[총 <span id="question-count" style="color:orange;">n</span>건의 조회결과]</p>
	                  </div>
	                </div>
	                <div class="col-sm-6" >
	                    <div class="dropdown" id="question-sort"  style="float:right;">
	                      <select class="btn btn-sm" name="questionsort" style="border:1px solid lightgray;">
	                        <option value="date" selected>작성일순</option>
	                        <option value="reverse">작성일역순</option>
	                     </select>
	                     <button type="button" class="btn btn-default btn-sm" onclick="delSelectedBoard()">삭제</button>
	                   </div>
	                </div>
	                <!--end-->
	                <hr>
	                <thead>
	                  <tr class="sy-table-tr">
	                    <th><i class=""></i>
	                      <label class="checkbox-inline">
	                        <input type="checkbox" id="ck-allboard" onchange="changeAllOrNothing()"/> 전체
	                      </label>
	                    </th>
	                    <th>번호</th>
	                    <th>문의타입</th>
	                    <th class="hidden-phone">제목</th>
	                    <th>작성자 [ID]</th>
	                    <th>작성일</th>
	                    <th>답변상태</th>
	                    <th>답변/삭제</th>
	                  </tr>
	                </thead>
	                <tbody class="board-body" id="board-box"></tbody>
	              </table>
	              <div style="text-align: center" id="pagination"></div>
	            </div>
	           </form> 
          </div>
        </div>
        <!-- 문의글 end -->
        <!-- 리뷰 start -->
        <div class="row mt" id="review-box" style="display: <%="review".equals(searchType) ? "block" : "none" %>;" >
          <div class="col-md-12">
	         <form id="review-form" action="deletereview-selected.jsp" method="get">
	            <div class="content-panel" style="margin: 10px;">
	              <table class="table table-advance table-hover">
	                <colgroup>
	                  <col width="5%">
	                  <col width="5%">
	                  <col width="25%">
	                  <col width="22%">
	                  <col width="8%">
	                  <col width="9%">
	                  <col width="9%">
	                  <col width="6%">
	                </colgroup>
	                <div class="col-sm-6">
	                  <div>
	                    <p style="padding-top:8px;">[총 <span id="review-count" style="color:orange;">n</span>건의 조회결과]</p>
	                  </div>
	                </div>
	                <div class="col-sm-6" >
	                   <button type="button" class="btn btn-default btn-sm"  style="float:right; margin-left: 5px;"" onclick="delSelectedReview()">삭제</button>
	                    <div class="dropdown" style="float:right; margin-left: 5px;">
	                      <select class="btn btn-sm" name="showcount" style="border:1px solid lightgray;">
	                        <option value="ten" selected>10개씩 보기</option>
	                        <option value="twenty">20개씩 보기</option>
	                        <option value="thirty">30개씩 보기</option>
	                     </select>
	                    </div>
	                    <div class="dropdown" id="review-sort" style="float:right;">
	                      <select class="btn btn-sm" name="reviewsort" style="border:1px solid lightgray;">
	                        <option value="date" selected>등록일순</option>
	                        <option value="reverse" >등록일역순</option>
	                     </select>
	                   </div>
	                </div>
	                <hr>
	                <thead>
	                  <tr class="sy-table-tr">
	                    <th><i class=""></i>
	                      <label class="checkbox-inline">
	                        <input type="checkbox" id="ck-allreview" onchange="changeAllOrNothingReview()"> 전체
	                      </label>
	                    </th>
	                    <th>번호</th>
	                    <th>상품명</th>
	                    <th>내용</th>
	                    <th>적립여부</th>
	                    <th>작성자 [ID]</th>
	                    <th>작성일</th>
	                    <th>삭제</th>
	                  </tr>
	                </thead>
	                <tbody class="board-body"></tbody>
	              </table>
	            </div>
	         </form> 
          </div>
        </div>
        <!-- 리뷰 end -->
      </section>
    </section>
    <!-- 답글 START -->
	<!-- Modal -->
	<div class="modal fade" id="modal-answer" role="dialog">
	   <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-main-title" style="display:inline-block;"><i class="fa fa-pencil fa-sm"></i> 문의답변</h4>
	        </div>
	        <div class="modal-body">
	            <div class="question-top">
	              <br>
	              <table class="table table-advance question-answer">
	                <colgroup>
	                  <col width="11%">
	                  <col width="60%">
	                </colgroup>
					
					<tr>
	                  <th>문의 번호</th>
	                  <td class="modal-no"></td>
	                </tr>
	                <tr>
	                  <th>작성자</th>
	                  <td class="modal-writer"></td>
	                </tr>
	                <tr>
	                  <th>연락처</th>
	                  <td class="modal-phone"></td>
	                </tr>
	                 <tr>
	                  <th>이메일</th>
	                  <td class="modal-email"></td>
	                </tr>
	                <tr>
	                  <th>문의 타입</th>
	                  <td class="modal-type"></td>
	                </tr>
	                <tr>
	                  <th>제목</th>
	                  <td class="modal-title" style="color: #797979;"></td>
	                </tr>
	                <tr style="height: 100px;">
	                  <th>문의 내용</th>
	                  <td><textarea class="form-control modal-contents" name="q-contents" rows="5"  readonly="readonly" style="background: white;"></textarea></td>
	                </tr>
	                <tr>
	                  <th>답변 내용</th>
	                  <td>
	                  	<textarea class="form-control modal-answer" name="a-contents" rows="10" ></textarea>
	                  </td>
	                </tr>
	              </table>
	            </div>
	            <div class="text-right" style="padding-right:5%;">
	               <a type="button" id="btn-cancle" class="btn btn-warning btn-sm">취소</a>
	               <button class="btn btn-theme btn-sm btn-reply-submit">등록</button>
	            </div>
	          </div>
	       </div>
       </div>
	</div>    
<script>
	// 시작 시 문의, 리뷰 렌더링
	getQuestionAndView();
	getReviewAndView();
	
	// 기간 조회
	function today() {
		var today = new Date();

		$("#start-date").val(getDateString(today));
		$("#end-date").val(getDateString(today));
	}

	function beforeThreeDays() {
		var now = new Date();
		var time = now.getTime();
		var ThreeDaysTime = 60 * 60 * 24 * 3 * 1000;
		
		var beforeDay = new Date(time - ThreeDaysTime);
		$("#start-date").val(getDateString(beforeDay));
		$("#end-date").val(getDateString(now));
	}
	
	function beforeOneWeek() {
		var now = new Date();
		var time = now.getTime();
		var oneWeekTime = 60 * 60 * 24 * 7 * 1000;
		
		var beforeDay = new Date(time - oneWeekTime);
		
		$("#start-date").val(getDateString(beforeDay));
		$("#end-date").val(getDateString(now));
	}
	
	// 날짜 출력 형식 변환
	function getDateString(date) {
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		month = month >= 10 ? month : '0' + month;
		day = day >= 10 ? day : '0' + day;
		
		return year + "-" + month + "-" + day;
	}
	
	// 게시글 타입에 따라 조회결과 show/hide
	function toggleBoard() {
		var type= $("#search-type").val();
		if (type == "question") {
			$("#question-box").show();
			$("#review-box").hide();
			$(".question-type").show();
			$("#answered-status").show();
			
		} else if (type == "review") {
			$("#question-box").hide();
			$("#review-box").show();
			$(".question-type").hide();
			$("#answered-status").hide();
		}
	}
	
	// 리셋 버튼 누르면 초기화
	$("#reset-btn").on("click", 'button', function(e) {
		
		getQuestionAndView();
		getReviewAndView();
	});
	
	// 게시글 체크박스 전체 선택
	function changeAllOrNothing() {
		$("input[name='boardno']").prop("checked",$("input[id=ck-allboard]").is(":checked"));
	}

	// 게시글 삭제 ajax
		$("#board-box").on("click", "button[id^='btn-delete-']", function(e){
			
		var qno = $(this).prop("id").replace("btn-delete-", "");
		
		$.ajax({
			url: "/semi/api/deleteBoard",	
			data: {"qno" : qno},
			success : function(){
				$("#question-contents").remove();
				alert ("게시글이 삭제되었습니다.");
				getQuestionAndView();
			}
		});
	}); 
	
	// 리뷰 체크박스 전체 선택
	function changeAllOrNothingReview() {
		$("input[name='reviewno']").prop("checked", $("input[id=ck-allreview]").is(":checked"));
	}
	
	// 리뷰 목록 선택 삭제
	function delSelectedReview() {
		var checkedCheckboxes = $("input[name='reviewno']:checked");
		if (checkedCheckboxes.length == 0) {
			alert ("삭제할 리뷰를 선택해주세요.");
			return;
		}
		$("#review-form").submit();
	}
	
	// Modal: 게시글 답글 작성 ajax 
	$("#board-form").on("click","button[id^='btn-board-'],td[id^=title-]",function() { // td안에 id가 btn-board-로 시작하는 엘리먼츠를 클릭했을 때
		var qno = $(this).prop("id").startsWith("btn") ?  $(this).prop("id").replace("btn-board-","") : $(this).prop("id").replace("title-","");
	
			// $(this) 는 현재 클릭한 엘리먼트
			// 클릭된 엘리먼츠의 property가 id인 것을 가져오고,
			// 가져온 id의 값 중 btn-board-를 지운 나머지를 qno로 설정
			// $("button[id='btn-board-']").attr("id","btn-board") >> id 변경
		
		$.ajax({
			url: "/semi/api/getQuestion",
			data: {no:qno},
			success: function(result) {
				console.log(result);
				
				var writer = "<b>" + result.customer.name + " (" + result.customer.id +")" + "</b>";
				
				//document.querySelector(".modal-writer").innerHTML = writer;
				$(".modal-no").text(result.no);
				$(".modal-writer").html(writer);
				$(".modal-phone").text(result.customer.phone);
				$(".modal-email").text(result.customer.email);
				$(".modal-type").text("[" + result.type + "]");
				$(".modal-title").text(result.title );
				$(".modal-contents").text(result.contents);
				if(result.boardReply != null)
					$(".modal-answer").val(result.boardReply.contents);
				else
					$(".modal-answer").val('');
				
				$("#modal-answer").modal();	
			}
		});
	});
	
	// Modal: 게시글 답변 작성 취소 실행 
	$("#btn-cancle").on("click", function(e) {
		$("#modal-answer").modal("hide");	
	});
	
	var page = 1;
	
	$("#search-form .form-group").on("click",'button', function(e) {
		
		page = 1;
		
		var searchType = $("#search-type").val(); // 문의인지 리뷰
		
		if (searchType == 'question') {
			getQuestionAndView();
		} else {
			getReviewAndView();
		}
	})
	
	// 폼안에 select, checkbox가 바뀌면 실행되는 함수
	$("#search-form").on("change", function(e) {
		
		page = 1;
		
		var searchType = $("#search-type").val();
		var questionType = $("select[name=questiontype]").val();
		
		if (searchType == 'question') {
			getQuestionAndView();
		} else {
			getReviewAndView();
		}
	});

	// form안에  select, checkbox를 누르면 실행되는 함수
	$("#search-form").on("keyup", function(e) {
		
		page = 1;
		
		var searchType = $("#search-type").val(); 
		var questionType = $("select[name=questiontype]").val();
		
		if (searchType == 'question') {
			getQuestionAndView();
		} else {
			getReviewAndView();
		}
	});
	
	// 페이지네이션 실행
	$("#pagination").on("click",'.pagination li a',function(e) {
		page = $(this).data("page");
		getQuestionAndView();
	})
	
	// 문의 sort 실행
	$("select[name='questionsort']").on("change", function(e) {
		getQuestionAndView();	
	});
	
	// 리뷰 sort 실행
	$("select[name='reviewsort']").on("change", function(e) {
		getReviewAndView();	
	});
	
	// 문의 조회 ajax
	function getQuestionAndView() {
		var questionType = $("#question-type").val(); 			 // 문의일 경우 문의의 타입
		var startDate = $("input[name='from']").val(); 			 // 시작 날짜
		var endDate = $("input[name='to']").val(); 				 // 마지막 날짜
		var answerd = $("input[name='answered']:checked").val(); // 답변 상태
		var keyword = $("input[name='searchkeyword']").val();    // 검색 키워드
		var sort = $("select[name='questionsort']").val();	     // 정렬 기준
		var showCount = $("select[name='showcount']").val();
		
		$.ajax({
			url: "/semi/api/getQuestionByCriteria",
			data: {
					"questionType":questionType,
					"startDate":startDate,
					"endDate": endDate,
					"answerd":answerd,
					"keyword":keyword,
					"sort":sort,
					"showCount" : showCount,
					"page":page
				  },
			success : function(resultMap) {
				
				var result = resultMap.list;
				var beginPage = resultMap.beginPage;
				var endPage = resultMap.endPage;
				var totalPage = resultMap.totalPage;
				var totalCount = resultMap.totalCount;
				console.log(result);
				
				var text = '';
				
				if(resultMap.list.length) {
					result.forEach(function(item,i) {
						text += '<tr class="board-bottom-sy" id="question-contents">';
						text += '<td>';
						text += '<label class="checkbox-inline" style="color:white;">';
						text += '<input type="checkbox" name="boardno" value="'+item.no+'" >-';
						text += '</label>';
						text += '</td>';
						text += '<td>' + item.no + '</td>';
						text += '<td id="type-' + item.no + '">' + item.type + '</td>';
						text += '<td id="title-' + item.no + '" style="cursor:pointer">' +item.title+ '</td>';
						text += '<td id="customer-' + item.no + '">'+item.customer.name+' ['+item.customer.id+']</td>';
						text += '<td id="createdate-' + item.no + '">'+item.createDate+'</td>';
						
					 	if(item.isAnswered == 'Y') {
							text += '<td id="answered"><span class="label label-info label-mini label-sy">답변완료</span></td>';  
	                    } else {
	                    	text += '<td id="un-answered"><span class="label label-default label-mini label-sy">답변대기</span></td>';
	                    }
						text += '<td class="button-ud">'
						text += '<button id="btn-board-' +item.no+ '" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>';
						text += '<button id="btn-delete-' +item.no+ '" class="btn btn-danger btn-xs" style="margin-left: 3px;"><i class="fa fa-trash-o "></i></button>';
						text += '</td>';
						text += '</tr>';
					});
					var pageText = '';
					
					pageText += '<ul class="pagination pagination-sm" style="cursor:pointer;">';
					if(beginPage > 3){
						pageText += ' <li><a data-page="' + (beginPage - 1) + '"><span>&laquo;</span></a></li>';
					}
					for (var i = beginPage; i <= endPage; i++) {
						pageText += '  <li> <a data-page="'+ i +'" style=" ' + ( page == i ? 'background:skyblue' : '' ) + '">' + i + '</a> </li>';
					}
	                pageText += '<li><a data-page="' + (endPage+1) + '" style="' + (totalPage == endPage ? 'display:none' : 'display:block') + '"><span>&raquo;</span></a></li>';
	                pageText += '</ul>';
					
	                $("#pagination").html(pageText);
				} else {
					text += "<tr><td colspan='8'><h5>조회된 결과가 없습니다.</h5><td></tr>";
				}
				$("#question-count").text(totalCount);
				$("#question-box .board-body").html(text);
			}
		});
	};

	// 리뷰 조회 ajax
	function getReviewAndView() {
		var startDate = $("input[name='from']").val();
		var endDate = $("input[name='to']").val();
		var keyword = $("input[name='searchkeyword']").val();
		var showCount = $("select[name='showcount']").val();
		var sort = $("select[name='reviewsort']").val();

		$.ajax({
			url : "/semi/api/getReviewByCriteria",
			data : {
				"startDate" : startDate,
				"endDate" : endDate,
				"keyword" : keyword,
				"showCount" : showCount,
				"sort" : sort,
				"page" : page
			},
			success : function(result) {
				var text = '';

				if (result.length) {
					result.forEach(function(item, i) {
						var star = "";
						var totalPoint = Number(item.orderProduct.order.totalPrice / 10).toLocaleString();
	
						text += '<tr class="board-bottom-sy">'
						text += '<td>'
						text += '<label class="checkbox-inline" style="color:white;">'
						text += '<input type="checkbox" name="reviewno" value="'+ item.no +'">-'
						text += '</label>'
						text += '</td>'
						text += '<td>' + item.no + '</td>'
						text += '<td class="hidden-phone item-name" style="text-align: left;">'
						text += '<img src="' +item.imageFilename+ '" width="45px;" heigth:45px;   />'
						text += ' <strong> '
								+ item.orderProduct.itemOption.item.name
								+ '</strong>'
						text += '</td>'
						
						for (var i=1; i<=item.star; i++) {
							star += "★"
						}
						text += '<td class="hidden-phone">'
								+ star + ''
						text += '<p>' + item.contents + '</p>'
						text += '</td>'
	
						if (item.orderProduct.reviewEnabled == 'Y') {
							text += '<td id="answered">'
							text += '<span class="label label-warning label-mini label-sy">적립완료</span>'
	
							text += '<p>' + totalPoint
									+ '원</p>'
							text += '</td>'
						} else {
							text += '<td></td>'
						}
						text += '<td>'
								+ item.orderProduct.order.customer.name
								+ ' [ '
								+ item.orderProduct.order.customer.id
								+ ']</td>'
						text += '<td>' + item.createDate
								+ '</td>'
						text += '<td class="button-ud">'
						text += '<a href="delete-review.jsp?reviewno='
								+ item.no
								+ '" class="btn btn-danger btn-xs"><i class="fa fa-trash-o" ></i></a>'
						text += '</td>'
						text += '</tr>'
					});
				} else {
					text += "<tr><td colspan='8'><h5>조회된 결과가 없습니다.</h5><td></tr>";
				}
				$("#review-count").text(result.length);
				$("#review-box .board-body").html(text);
			}
		});
	};

	$(".btn-reply-submit").on("click", function(e) {
		var no = $(".modal-no").text(); 
		var answer = $(".modal-answer").val(); 

		$.ajax({
			url : "/semi/api/insertBoardReply",
			data : {
				"no" : no,			 // "컨트롤러에서 받는 파라미터" : ajax에서 보내는 변수이름
				"contents" : answer
			},
			success : function() {
				alert("게시글에 답변이 등록되었습니다.");
				$("#modal-answer").modal("hide");
				getQuestionAndView();
			}
		});
	});
</script>    
<%@include file="../common/footer.jsp" %>    