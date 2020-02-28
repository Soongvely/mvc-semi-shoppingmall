<%@page import="ezo.shop.vo.QuestionBoard"%>
<%@page import="ezo.shop.dao.QuestionBoardDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny");
		return;
	}
	  
	String title = request.getParameter("boardtitle");
	String type = request.getParameter("type");
	String boardContent = request.getParameter("boardcontents");
	
	QuestionBoardDao questionBoardDao = QuestionBoardDao.getInstance();
	
	QuestionBoard questionBoard = new QuestionBoard();
	
	questionBoard.setCustomer(loginedUser);
	questionBoard.setTitle(title);
	questionBoard.setType(type);
	questionBoard.setContents(boardContent);
	questionBoard.setIsAnswered("N");
	
	questionBoardDao.insertQuestionBoard(questionBoard);
	
	response.sendRedirect("questionboard.jsp");
%>