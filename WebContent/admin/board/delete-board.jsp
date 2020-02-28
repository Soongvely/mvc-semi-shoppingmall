<%@page import="ezo.shop.dao.QuestionBoardDao"%>
<%@page import="ezo.shop.vo.QuestionBoard"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int boardNo = NumberUtils.stringToNumber(request.getParameter("boardno"));

	QuestionBoard questionBoard = new QuestionBoard();
	questionBoard.setNo(boardNo);
	
	QuestionBoardDao questionBoardDao = QuestionBoardDao.getInstance();
	questionBoardDao.deleteQuestionBoardByNo(questionBoard);
	
	response.sendRedirect("board.jsp?searchtype=question");
%>
