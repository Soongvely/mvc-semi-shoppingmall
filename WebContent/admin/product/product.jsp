<%@page import="ezo.shop.vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.AdminItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

  <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 상품조회</h3>
        <!--상품 리스트 조회-->
        <div class="row mt" id="board-top-sy">
          <div class="col-md-12">
            <form id="item-form" class="form-horizontal style-form" method="get">
              <div class="form-panel">
                <div class="form-group" style="margin-top: 15px;">
                  <label class="control-label col-md-1">카테고리</label>
                  <div class="col-md-3">
                    <select class="form-control" id="main-category" name="main-category">
                      <option value=''>- - - 상위 카테고리 선택 - - -</option>
                 <%
                 	 AdminItemDao adminItemDao = AdminItemDao.getinstance();
                 	 List<Category> categories = adminItemDao.getMainCategories();
                 	 
                 	 for (Category category : categories) {
                 %>
                      <option value="<%=category.getNo()%>"><%=category.getName() %></option>
				 <%
                 	 }
				 %>
                    </select>
                  </div>
                  <div class="col-md-3">
                     <select class="form-control sy" id="sub-category" name="sub-category" style="display:none;"></select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-1">상품 검색</label>
                  <div class="col-md-6">
                    <input type="text" class="form-control" name="searchkeyword" placeholder="검색할 상품의 이름 또는 번호를 입력해주세요." style="font-size: 13px;">
                  </div>
                </div>
				<div class="form-group" style="margin-top: 15px;">
                  <label class="control-label col-md-1" style="margin-right:15px;">상품 등록일</label>
                  <div style="float:left;display:inline-block;">
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="today()">오늘</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeThreeDays()">3일</button>
                    <button type="button" class="btn btn-default btn-sm sy-btn-cal" onclick="beforeOneweek()">7일</button>
                  </div>
                  <div class="col-md-5">
                      <div class="input-group input-large">
                        <input type="date" id="start-date" class="form-control dpd1" name="from" >
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="date" id="end-date" class="form-control dpd2" name="to">
                    </div>
                  </div>
                </div>
                <div class="form-group"  id="is-display" >
                  <label class="control-label col-md-1">판매 여부</label>
                  <div class="col-md-6">
                    <div class="radio-sy">
                      <label>
                        <input type="radio" id="optionsRadios1" name="display" value="all" checked> 전체
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios2" name="display" value="yes"> 판매
                      </label>
                      <label>
                        <input type="radio" id="optionsRadios3" name="display" value="no"> 판매안함
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-right" id="reset-btn" style="margin-right:10%; padding-top:10px; padding-buttom: 10px;">
                   <button type="button" class="btn btn-warning btn-sm">초기화</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- 상품 리스트 start-->
        <div class="row mt" id="item-box">
          <div class="col-md-12">
            <div class="content-panel" style="margin: 10px;min-height:300px;">
            <form id="check-form">
              <table class="table table-bordered table-advance table-hover">
                <colgroup>
                  <col width="6%">
                  <col width="9%">
                  <col width="25%">
                  <col width="11%">
                  <col width="10%">
                  <col width="8%">
                  <col width="10%">
                  <col width="6%">
                  <col width="6%">
                </colgroup>
                <div class="col-sm-6">
                  <div>
                    <p style="padding-top:8px; font-size:15px;">[조회된 상품 목록]</p>
                  </div>
                </div>
                <div class="col-sm-6" >
                    <div class="dropdown" id="sort" style="float:right;">
                      <select class="btn btn-sm" name="sort" style="border:1px solid lightgray; font-size:13px;">
                        <option value="date" selected>등록일순</option>
                        <option value="max">높은가격순</option>
                        <option value="min">낮은가격순</option>
                     </select>
                     <button type="button" id="btn-del-item" class="btn btn-default btn-sm" >삭제</button>
                   </div>
                </div>
                <!--end-->
                <hr>
                <thead>
                  <tr class="sy-table-tr">
                    <th><i class=""></i>
                      <label class="checkbox-inline">
                        <input type="checkbox" id="ck-allitem" onchange="changeAllOrNothingItem()">전체
                      </label>
                    </th>
                    <th>상품분류</th>
                    <th class="hidden-phone">상품명</th>
                    <th>옵션(재고)</th>
                    <th>가격 (할인가)</th>
                    <th>상품번호</th>
                    <th>등록일</th>
                    <th>수정</th> 
                  </tr>
                </thead>
                <tbody class="board-body-product">
                </tbody>
              </table>
              </form>
            </div>
          </div>
        </div>
      </section>
    </section>
<script type="text/javascript">

	var page = 1;

	$(function() 
		getItemAndView();
	});

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
	
	// 체크박스 전체 선택
	function changeAllOrNothingItem() {
		$("input[name='ck-item']").prop("checked", $("#ck-allitem").prop("checked"));
	}
	
	// 폼이 바뀌면 실행
	$("#item-form").on("change", function(e) {
		page = 1;
		
		$(".board-body-product").empty();
		getItemAndView();
	});
	
	// 폼을 클릭하면 실행
	$("#item-form .form-group").on("click", 'button', function(e) {
		page = 1;
		
		$(".board-body-product").empty();
		getItemAndView();
	})
	
	// 눌리면 실행
	$("input[name=searchkeyword]").on("keyup", function(e) {
		
		page = 1;
		$(".board-body-product").empty();
		getItemAndView();
	});
	
	// 리셋 버튼 누르면 초기화
	$("#reset-btn").on("click", 'button', function(e) {

		$("#item-form").each(function(i,item){
			this.reset()
		});
			
		page = 1;
		
		$(".board-body-product").empty();
		getItemAndView();
	});
	
	// sort 실행
	$("select[name='sort']").on("click", function(e) {

		page = 1;
		$(".board-body-product").empty();
		getItemAndView();	
	});
	
	$("select[name='sort']").on("change", function(e) {
		page = 1;
		
		$(".board-body-product").empty();
		getItemAndView();	
	});
	
	// 상품 삭제여부 변경
	$("#btn-del-item").on("click", function(e) {
		var checkedNo = [];
		
		$("input[name='ck-item']:checked").each(function(i) {
			checkedNo.push($(this).val())
		});
		
		if (checkedNo.length == 0) {
			alert("삭제할 상품을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url: "/semi/api/deleteItem",
			data: $("#check-form").serialize(),
			success: function() {
				alert("선택하신 상품이 삭제되었습니다.");
				checkedNo.forEach(function(checkNo,i) {
					$("#item-list-" + checkNo).remove();
				}); 
			}
		});
	});
	
	$(window).scroll(function () {
		 var documentValue = $(document).height() - 1;
		 var scrollValue = $(document).scrollTop() + $(window).height();
			if(documentValue <= scrollValue){
				getItemAndView();
			}
		});
	
	// 상품 조건별 조회		
	function getItemAndView() {
		var mainCategory = $("select[name='main-category']").val();
		var subCategory = $("select[name='sub-category']").val();
		var startDate = $("input[name='from']").val();
		var endDate = $("input[name='to']").val();
		var keyword = $("input[name='searchkeyword']").val(); 
		var isDisplay = $("input[name='display']:checked").val();
		var sort = $("select[name='sort']").val();
		
		var category = '';
		
		if(subCategory) {
			category = subCategory;
		} else {
			category = mainCategory;
		}
		
		$.ajax({ 												// jQuery에 만들어진 비동기식으로 데이터를 불러오는 함수
			url:"/semi/api/getItemsByCriteria",	// 데이터를 가져올 경로
			data: {
				"mainCategory" : mainCategory,
				"subCategory" : subCategory,
				"startDate" : startDate,
				"endDate" : endDate,
				"keyword" : keyword,
				"isDisplay" : isDisplay,
				"sort" : sort,
				"page" : page
			},
			success: function(resultMap) {				// 성공하면 실행시킬 함수 , 함수 안에 파라미터가 받아온 데이터
				
				var totalCount = resultMap.totalCount;
				var result = resultMap.list;

				var text = '';
				if(result.length) {
					result.forEach(function(item,i) {
						
						var price = Number(item.price).toLocaleString();
						var discountPrice = Number(item.discountPrice).toLocaleString();
						
						text += '<tr id="item-list-'+item.no+'" style="font-size: 14px;">'
						text += '<td>'
						text += '<label class="checkbox-inline" style="gray;" >'
						text += '<input type="checkbox" name="ck-item" value="' +item.no+ '">'
						text += '</label>'
						text += '</td>'
						text += '<td value="' +item.category.no+ '">' +item.category.name+ '</td>'
						text += '<td class="item-image" style="font-weight:bold;"><img src="'+item.imagePath+'" /> ' +item.name+'</td>'
						text += '<td style="vertical-align: center; font-weight:2px;">'
						
						item.itemOptions.forEach(function(option, j) {
							if (option.color == 'PURPLE') {
								text += '<i class="fa fa-square" style="color:purple;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'BLACK') {
								text += '<i class="fa fa-square" style="color:black;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'RED') {
								text += '<i class="fa fa-square" style="color:red;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'SKYBLUE') {
								text += '<i class="fa fa-square" style="color:skyblue;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'BROWN') {
								text += '<i class="fa fa-square" style="color:#801a00;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'NAVY') {
								text += '<i class="fa fa-square" style="color:#00004d;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'GREEN') {
								text += '<i class="fa fa-square" style="color:#003300;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'PINK') {
								text += '<i class="fa fa-square" style="color:#ff99cc;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else if (option.color == 'GREY') {
								text += '<i class="fa fa-square" style="color:grey;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							} else {
								text += '<i class="fa fa-square" style="color:white;"></i> ' + option.color+ ' - ' +option.size + '  (' + option.stock +'개)<br/>'
							}
						})
						text += '</td>'
						text += '<td>' + price + '원<p>(' +discountPrice+ '원)</p></td>'
						text += '<td>' +item.no+ '</td>'
						text += '<td>' +item.createDate+ '</td>'
						text += '<td class="button-ud">'
						//'<button class="btn btn-primary btn-xs" onclick="location.href='/semi/admin/product/product-form.jsp'"><i class="fa fa-pencil"></i></button>'
						text += '<button type="button" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>'
						text += '</td>'
						text += '<input type="hidden" ' + item.brand + '/>'
						text += '</tr>'
					});
				} else {
					text += "<tr class='no-contents'><td colspan='8'><h5>조회된 결과가 없습니다.</h5></td></tr>";
					if(totalCount <= 0){
						$(".board-body-product").html(text);
					}
					return;
				}
				$(".board-body-product").append(text);
				page++;
			}
		});
	};
	
	// 상위와 일치하는 하위카테고리 조회
	$("#main-category").on("change", function(e){
		var mainCategoryNo = $("select[name='main-category']").val();
		
		$.ajax({
			url: "/semi/api/getSubCategories",
			data: {
				"mainCategoryNo" : mainCategoryNo
			},
			success : function(result) {
				var text = '';
				
				text += '<option value="0">전체</option>';
				result.forEach(function(item,i){
					text += '<option value="'+item.no+'">';
					text += item.name;
					text += '</option>';
				});

				result.length ? $("#sub-category").css("display", "block") : $("#sub-category").css("display", "none");
				
				$("#sub-category").html(text);
			}
		});
	});
</script>

<%@include file="../common/footer.jsp" %>        