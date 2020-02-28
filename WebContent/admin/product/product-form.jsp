<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.AdminItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>   

     <section id="main-content">
       <section class="wrapper">
         <h3><i class="fa fa-angle-right" style="padding-left: 11px;"></i> 상품등록</h3>
         <div class="row mt">
           <div class="col-md-12">
             <form id="itemForm" action="product-insert.jsp" onsubmit="return false;" class="form-horizontal style-form" method="post" enctype="multipart/form-data"> 
               <div class="form-panel">
                 <div class="form-group" style="margin-top: 15px;">
                   <label class="control-label col-md-1">카테고리</label>
                   <div class="col-md-3">
                     <select class="form-control" id="main-category" name="main">
                     	<option value="">- - - 상위 카테고리 선택 - - -</option>
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
                     <select class="form-control sy" id="sub-category" name="sub" style="display:none;"></select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-1">브랜드</label>
                   <div class="col-md-6">
                     <input type="text" class="form-control" name="brand" placeholder="브랜드명을 입력해주세요." autocomplete="off" style="font-size: 13px;"/>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-1">상품명</label>
                   <div class="col-md-6">
                     <input type="text" class="form-control" name="name" placeholder="상품명을 입력해주세요." autocomplete="off" style="font-size: 13px;"/>
                   </div>
                 </div>
               	 <div class="form-group">
                   <label class="control-label col-md-1">옵션 설정</label>
                   <div class="col-md-8">
                     <div class="panel-group">
                       <div class="panel panel-default">
                         <div class="panel-heading" style="background: white;">
                           <h4 class="panel-title">
                             <a data-toggle="collapse" href="#collapse1" style="font-size:14px;"> - - 색상 및 사이즈 - - <i class="fa fa-sort-desc" style="float:right"></i></a>
                           </h4>
                         </div>
                         <div id="collapse1" class="panel-collapse collapse">
                         	<input type="hidden" name="options"/>
                           <div class="panel-body">
		 					 <div class="form-group" style="border:none">
		 					 	<div style="padding-top: 20px; padding-bottom: 20px;" class="form-option">
				                    <div class="col-md-7" >
				                      <input type="text" class="form-control" name="color" placeholder="추가할 색상을 입력해주세요." autocomplete="off"/>
				                    </div>   
				                    <div class="col-md-3" >
				                      <input type="number" class="form-control" name="stock" placeholder="수량을 입력해주세요." autocomplete="off"/>
				                    </div>
				                    <span class="help-block help-block-sy" >개</span>
		 					 	</div>
			                 </div>                        		
                             <table class="table table-bordered sy-table-opt">
                               <colgroup>
                                 <col width="8%">
                                 <col width="8%">
                                 <col width="8%">
                                 <col width="3%">
                               </colgroup>
                               <thead>
	                               <tr>
	                                 <th>색상</th>
	                                 <th>사이즈</th>
	                                 <th>재고수량</th>
	                                 <th>삭제</th>
	                               </tr>
                               </thead>
                               <tbody class="option-body"></tbody>
                             </table>
                           </div>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="form-group">
                    <label class="control-label col-md-1">상품 가격</label>
                    <div class="col-md-2" >
                      <input type="number" class="form-control" name="price" autocomplete="off"/>
                    </div>
                    <span class="help-block help-block-sy" >원</span>
                    
                 	<label class="control-label col-md-1">할인율</label>
                    <div class="col-md-1" >
                      <input type="number" class="form-control" name="rate" autocomplete="off"/>
                    </div>
                    <span class="help-block help-block-sy">%</span>
                 </div> 
                 <div class="form-group" class="col-md-12">
                    <label class="control-label col-md-1"">판매 가격</label>
                    <div class="col-md-2">
                      <input type="number" class="form-control" name="discount"/>
                    </div>
                    <span class="help-block help-block-sy" >원</span>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-1">이미지 첨부</label>
                   <div class="col-md-8">
                     <input type="file" class="form-control" name="image" >
                     <span class="help-block">[150px - 300px]</span>
                   </div>
                 </div>
                 <div class="form-group">
                    <label class="control-label col-md-1">판매 여부</label>
                    <div class="col-md-6">
                      <div class="radio-sy">
                        <label>
                          <input type="radio" name="soldout" value="Y" checked>판매
                        </label>
                        <label>
                          <input type="radio" name="soldout" value="N">판매안함
                        </label>
                      </div>
                    </div>
                 </div>
				 <div class="form-group">
                    <label class="control-label col-md-1">진열 여부</label>
                    <div class="col-md-6">
                      <div class="radio-sy">
                        <label>
                          <input type="radio" name="display" value="Y" checked>진열
                        </label>
                        <label>
                          <input type="radio" name="display" value="N">진열안함
                        </label>
                      </div>
                    </div>
                 </div>
                 <div class="text-right" style="padding-right:5%;">
                    <button type="reset" class="btn btn-warning">초기화</button>
                    <button type="button" class="btn btn-theme" id="btn-submit">등록</button>
                 </div>
               </div>
             </form>
           </div>
         </div>
       </section>
     </section>
<script>

	// 검증 처리
	$("#btn-submit").click(function() {
		
		var $mainCategory = $("select[name=main]");
		var $subCategory = $("select[name=sub]");
		var $brand = $("input[name=brand]");
		var $name = $("input[name=name]");
		var $price = $("input[name=price]");
		var $options = $("input[name=options]");
		var $image = $("input[name=image]");
		
		if($mainCategory.val() == ''){
			alert("상위 카테고리를 선택해주세요.");
			$mainCategory.focus();
			return false;
		}
		
		if ($brand.val() == '') {
			alert("브랜드명을 입력해주세요.");
			$brand.focus();
			return false;
		}
		if ($name.val() == '') {
			alert("상품명을 입력해주세요.");
			$name.focus();
			return false;
		}
		if ($price.val() == '') {
			alert("판매 가격을 입력해주세요.");
			$price.focus();
			return false;
		}
		
		if ($image.val() == '') {
			alert("이미지 파일을 선택해주세요.");
			$image.focus();
			return false;
		}
		
	/***************************** 옵션 처리 ********************************/

		var optionText = '';
	
		$(".option-body tr").each(function(item,i){
			var optColor = $(this).find(".opt-color").text();
			var optStock = $(this).find(".opt-stock").text();
			
			optionText += optColor + "/" + optStock + "&";
		});
		// 마지막 &를 잘라준다.
		
		optionText = optionText.substring(0,optionText.length-1);
		$options.val(optionText);
		
		/***************************** 옵션 처리 end ********************************/

		if (optionText == '') {
			alert("옵션을 1개 이상 입력해주세요.");
			$("input[name='color']").focus();
			return false;
		}
		
		alert("신규 상품이 등록되었습니다.");
		$("#itemForm").attr("onsubmit","");
		$("#itemForm").submit();
	});

	// 상위카테고리와 일치하는 하위카테고리 조회
	$("#main-category").on("change", function(e){
		
		var mainCategoryNo = $("select[name='main']").val();
		
		$.ajax({
			url : "/semi/api/getSubCategories",
			data : {
					"mainCategoryNo" : mainCategoryNo
				},
			success : function(result) {
				var text = '';
				result.forEach(function(item,i){
					text += '<option value="' +item.no+ '">';
					text += item.name;
					text += '</option>';
				});
				
				result.length ? $("#sub-category").css("display","block") : $("#sub-category").css("display","none")
				
				$("#sub-category").html(text);
			}
		});
	});

	// 상품 할인가격 자동 적용
	$("input[name='rate'], input[name='price']").on("keyup", function(e) {
		var price = $("input[name='price']").val();
		var rate = $("input[name=rate]").val();
		
		if(rate > 100){
			$("input[name=rate]").val(100);
			rate = 100;
		}
		var discountPrice = price - (rate/100*price);
	
		$("input[name='discount']").val(Math.round(discountPrice));
	});	
	
	// 옵션 생성
	var optionIndex = 1;
	
	$(".form-option").keyup(function(e) {
		var text = '';
		var color = $("input[name=color]").val().toUpperCase();
		var stock = $("input[name=stock]").val();
		
		if(e.keyCode != 13) {
			return;
		}
		
		if(color == '') {
			alert("색상을 입력해주세요.");
			$("input[name=color]").focus();
			return;
		}
		if(stock == '') {
			alert("재고 수량을 입력해주세요.");
			$("input[name=stock]").focus();
			return;
		}
		text += '<tr id=option-'+ optionIndex + '>';			
		text += '<td class="opt-color">' + color + '</td>';
		text += '<td>FREE</td>';
		text += '<td class="opt-stock">' + stock + '</td>';
		text += '<td>';
		text += '<button id="btn-delete-'+optionIndex+'" class="btn btn-danger btn-xs" style="margin-left: 3px;"><i class="fa fa-trash-o "></i></button>';
		text += '</td></tr>';
				
		$(".option-body").append(text);
		$("input[name=color]").val('').focus();
		$("input[name=stock]").val('');
		optionIndex++;
	});
	
	// 옵션 삭제
	$(".sy-table-opt").on("mouseup","button[id^='btn-delete-']",function(e) {
		var optionIndex = $(this).prop("id").replace("btn-delete-","");
		
		$("#option-" + optionIndex).remove();
	});
	
</script>

<%@include file="../common/footer.jsp" %>    