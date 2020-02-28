<%@page import="ezo.shop.util.DateUtils"%>
<%@page import="ezo.shop.vo.QuestionBoard"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.QuestionBoardDao"%>
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
    #gh .list-group2 {
    	border-bottom: 2px solid black;
    	padding-bottom: 5px;
    	font-weight: bold;
    	font-size: 12px;
    	text-align: center;
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
	
	#gh .box--1 {
		display: none;
	}
  </style>
</head>
<body>
<%
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=questionboard.jsp");
		return;
	}
	
	LikeDao likeDao = LikeDao.getInstance();
	int likecount = likeDao.getlikecountByCustNo(loginedUser.getNo());
	
	QuestionBoardDao questionBoardDao = QuestionBoardDao.getInstance();
	
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
				<h3>문의게시판
					<small class="pull-right" >
						<button type="button" style="background-color: black; color: white; width: 100px; height: 30px" data-target="#myModal" data-toggle="modal">
							문의쓰기
						</button>
					</small>
				</h3>
				<div class="padd">
					<div class="list-group" >
						<div class="col-sm-2">문의타입</div>	
						<div class="col-sm-6">문의제목</div>	
						<div class="col-sm-2">작성일</div>	
						<div class="col-sm-2">답변유무</div>	
					</div>
						<%
							List<QuestionBoard> questionBoards = questionBoardDao.getAllQuestionBoardsByCustNo(loginedUser.getNo());  
							if (questionBoards.isEmpty()) {
						%>
							<div>
								<p style="padding-top: 15px; text-align: center;">작성한 문의 내역이 없습니다.</p>
							</div>
					
						<%
							}
							for (QuestionBoard questionBoard : questionBoards) {
						%>
					<div class="list-group1">
						<a href="" class="a1" onclick="clickbox(<%=questionBoard.getNo() %>, event)">
							<div class="row" style="text-align: center;">
								<div class="col-sm-2"><%=questionBoard.getType() %></div>	
								<div class="col-sm-6"><%=questionBoard.getTitle() %></div>	
								<div class="col-sm-2"><%=DateUtils.dateToString(questionBoard.getCreateDate()) %></div>	
								<div class="col-sm-2"><%=questionBoard.getIsAnswered() %></div>
							</div>
						</a>
					</div>
					
					<!-- 이거는 위의 a를 눌렀을때만 나오게 설정해야함 -->
					<div class="row box--1" style="background-color: #f8f8f8; padding-left: 20px; height: 320px; " id="box-<%=questionBoard.getNo() %>">
						<div style="width: 700px">
							<form name="form" method="get" action="">
								<div class="form-group" style="padding-right: 20px">
									<label>문의타입</label>
									<select name="type" style="width: 100px; height:25px; padding-left: 20px">
										<option value="상품" <%="상품".equals(questionBoard.getType()) ? "selected" : "" %>>상품</option>
										<option value="결제" <%="결제".equals(questionBoard.getType()) ? "selected" : "" %>>결제</option>
										<option value="배송" <%="배송".equals(questionBoard.getType()) ? "selected" : "" %>>배송</option>
									</select>
								</div>
								<div class="form-group">
									<label>문의제목</label>
									<input name="boardtitle" value="<%=questionBoard.getTitle() %>" type="text" style="width: 300px;" /> 
								</div>
								<input name="questionboardno" value="<%=questionBoard.getNo() %>" type="hidden" />
								<div class="form-group">
		          					<textarea class="form-control" name="boardcontents" style="height: 150px; width: 700px"><%=questionBoard.getContents() %></textarea>	
		          				</div>
		          				<%
		          					if ("N".equals(questionBoard.getIsAnswered())) {
		          				%>
		          				<div class="row pull-right">
									<button type="submit" style="background-color: black; color: white; width: 100px; height: 30px" onclick="javascript: form.action='questionboardupdate.jsp';">수정</button>
									<button type="submit" style="background-color: black; color: white; width: 100px; height: 30px" onclick="javascript: form.action='questionboarddelete.jsp';">삭제</button>
								</div>
								<%
									} else { 
								%>
								<div class="row"> 
									<div style="padding-left: 20px; font-size: 17px;">
										<strong>답글내용</strong>
										<p><%=questionBoard.getBoardReply().getContents() %></p> 
									</div>
								</div>
								<%
									}
								%>
							</form>
						</div>
					</div>
					<%
						}
					%>
					<!-- 문의쓰기를 눌렀을 때 나옴 -->
					<div class="modal fade" id="myModal" role="dialog">
    					<div class="modal-dialog">
				    		<!-- Modal content-->
				    		<div class="modal-content">
				        		<div class="modal-header">
				          			<button type="button" class="close" data-dismiss="modal">&times;</button>
				          			<h4 class="modal-title"><strong>문의 쓰기</strong></h4>
				        		</div>
				        		<div class="modal-body" style="height: 300px">
				        			<form name="formwrite" method="get" action="questionboardwrite.jsp" id="board-write">
										<div class="form-group" style="padding-right: 20px">
											<label>문의타입</label>
											<select name="type" style="width: 100px; height:25px; padding-left: 20px">
												<option value="상품">상품</option>
												<option value="결제">결제</option>
												<option value="배송">배송</option>
											</select>
										</div>
										<div class="form-group">
											<label>문의제목</label>
											<input name="boardtitle" value="" type="text" style="width: 300px;"  /> 
										</div>
										<div class="form-group">
				          					<textarea class="form-control" name="boardcontents" placeholder="질문은 최소 5자 이상 입력해주세요" style="height: 150px; width: 570px"></textarea>	
				          				</div>
				          				<div class="pull-right">
											<button type="button" data-dismiss="modal" style="background-color: black; color: white; width: 100px; height: 30px" onclick="boardWrite(event)">등록</button>
										</div>
									</form>
				        		</div>
				      		</div>
				    	</div>
				  	</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript">
	
	function clickbox(no, e) {
		e.preventDefault();
		
		if (document.querySelector("#box-"+no).style.display === 'none') {
			document.querySelector("#box-"+no).style.display = 'block';
			return;
		} else {
			document.querySelector("#box-"+no).style.display = 'none';
			return;
		}
	}
	
	// 문의 쓰기 등록 눌렀을 때
	function boardWrite(e) {
  		document.querySelector("#board-write").submit();
  		console.log("확인");
	}
	
//	function submitbox(index) {
//		if (index == 1) {
//			document.ghform.action='questionboardupdate.jsp';
//		}
//		if (index == 2) {
//			document.ghform.action='questionboarddelete.jsp';
//		}
//		document.ghform.submit();
//	}
</script>
</body>
</html>