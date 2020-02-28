<%@page import="ezo.shop.dao.LikeDao"%>
<%@page import="ezo.shop.vo.Like"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.dao.ItemDao"%>
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
	
	Integer itemNo = Integer.parseInt(request.getParameter("itemno"));
	
	// 아이템 번호로 좋아요 -1 로 바꾸기
	ItemDao itemDao = ItemDao.getInstance();
	Item item = itemDao.getItembyNo(itemNo);
	
	item.setLikeCount(item.getLikeCount() - 1);
	
	itemDao.updateItemByItemNo(item);
	
	// like 테이블에서 그 고객번호, 아이템번호로 아이템 삭제
	Like like = new Like();
	like.setItem(item);
	like.setCustomer(loginedUser);
	
	LikeDao likeDao = LikeDao.getInstance();
	likeDao.deleteLikeByItemNoandCustNo(like);
	
	response.sendRedirect("likeheart.jsp");
%>