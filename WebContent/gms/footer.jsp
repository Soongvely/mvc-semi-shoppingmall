<%@page import="java.util.List"%>
<%@page import="ezo.shop.vo.Notice"%>
<%@page import="ezo.shop.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style type="text/css">

	footer_Menu	a:hover{
		text-decoration: underline;
	}	
	</style>
	
	<%
		NoticeDao footernoticedao = NoticeDao.getInstance();
	
		List<Notice> footernotices = footernoticedao.getAllnotice();
	%>
	

<div class="container-fluid footer" style="padding: 50px; background-color: white; margin-top: 100px;">
	<div class="row">
		<div class="col-sm-12">
		<hr id="" style="border:solid 2px black; width: 40px;" align="left"/>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		<h2 style="margin-top: 0px; font-size: 40px; font-weight: bold;">1644-0560</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		<p style="margin: 0px; font-size:12px;">AM 10:00 ~ PM 05:00 off-time PM 12:00 ~ PM 02:00</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		<p style="font-size:12px; ">DAY OFF (SATURDAY. SUNDAY. HOLIDAY)</p> 
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3">
		<form action="questionboard.jsp">
		<button type="submit" class="btn btn-default" style="width: 66px;height:27px; background-color: black; text-align: left;"><font style="color: white; font-weight: bold;">FAQ></font></button>
		</form>
		</div>
		<div class="col-sm-9" align="right">
		</div>
	</div>
	<hr id="top_hr" style="border:solid 1px rgba(0.1,0.1,0.1,0.1); margin: 10px;">
	<div class="row" >
		<div class="col-sm-7">
		<h4 style="font-size: 13px; font-weight: bold;">NOTICE</h4>
		</div>
		<div class="col-sm-1">
		</div>
		<div class="col-sm-1">
		<h4 style="font-size: 13px; font-weight: bold;">ABOUT US</h4>
		</div>
		<div class="col-sm-1">
		<h4 style="font-size: 13px; font-weight: bold;">MY ORDER</h4>
		</div>
		<div class="col-sm-1">
		<h4 style="font-size: 13px; font-weight: bold;">MY ACCOUNT</h4>
		</div>
		<div class="col-sm-1">
		<h4 style="font-size: 13px; font-weight: bold;">HELP</h4>
		</div>
	</div>
	<div class="row footer_Menu">
		<div class="col-sm-7">
		<ul style="list-style: none; padding-left: 0px; line-height: 25px">
		 <%
		 for(int i=0; i<5; i++){
		 %>
		<li style="display: block;"><a href="" style=" color: black; font-size: 12px; "><%=footernotices.get(i).getTitle() %></a></li>
		<%
		 }
		%> 
		</ul>
		</div>
		<div class="col-sm-1">
		</div>
		<div class="col-sm-1">
		<ul style="padding-left: 0px; list-style: none; line-height: 25px">
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">회사 소개</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">인재 채용</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">상시 할인 혜택</a></li>
		</ul>
		</div>
		<div class="col-sm-1">
		<ul style="padding-left: 0px; list-style: none; line-height: 25px">
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">주문 배송</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">취소/교환/반품 내역</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">상품리뷰 내역</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">증빙서류발급</a></li>
		</ul>
		</div>
		<div class="col-sm-1">
		<ul style="padding-left: 0px; list-style: none; line-height: 25px">
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">회원정보수정</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">회원등급</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">마일리지현황</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px;">쿠폰</a></li>
		</ul>
		</div>
		<div class="col-sm-1">
		<ul style="padding-left: 0px; list-style: none; line-height: 25px">
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">1:1 상담내역</a></li>
			<li style="display: block;"><a href="" style=" color: black; font-size: 12px; ">상품 Q&A내역</a></li>
			<li style="display: block;"><a href="notice.jsp" style=" color: black; font-size: 12px; ">공지사항</a></li>
			<li style="display: block;"><a href="questionboard.jsp" style=" color: black; font-size: 12px; ">FAQ</a></li>
		</ul>
		</div>
	</div>
	<hr style="border:solid 1px rgba(0.1,0.1,0.1,0.1); margin: 10px;">
	<div class="row">
		<div class="col-sm-12">
		<font style="font-weight: bold;">개인정보처리방침  / 이용약관</font>
		</div>
	</div>
	<div class="row" style="padding-top: 0px;">
		<div class="col-sm-9" style=" word-break:break-all;">
		<div class="row">
			<div class="col-sm-12">
			<font style="font-size: 10px;">고객센터1644-0560평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무)이메일customer@29cm.co.kr대표이사이창우개인정보책임자김평수호스팅서비스(주)에이플러스비</font>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
			<font style="font-size: 10px;">상호명(주)에이플러스비사업장소재지서울특별시 강남구 선릉로93길 35 나라키움 역삼B빌딩 4층팩스070-8622-7737사업자등록번호101-86-64617통신판매업신고2019-서울강남-02774</font>
			</div>
		</div>
		</div>
		<div class="col-sm-3">
		</div>
	</div>
</div>
