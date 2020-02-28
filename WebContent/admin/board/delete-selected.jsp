<%@page import="ezo.shop.util.NumberUtils"%>
<%@page import="ezo.shop.dao.QuestionBoardDao"%>
<%@page import="ezo.shop.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] boardNos = request.getParameterValues("boardno");
	String[] reviewNos = request.getParameterValues("reviewno");

	QuestionBoardDao questionBoardDao = QuestionBoardDao.getInstance();
	QuestionBoard questionBoard = new QuestionBoard();
	
	for (String boardNo : boardNos) {
		questionBoard.setNo(NumberUtils.stringToNumber(boardNo));		
		questionBoardDao.deleteQuestionBoardByNo(questionBoard);
	}
	response.sendRedirect("board.jsp");
%>