<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ezo.shop.dao.ItemOptionDao"%>
<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.vo.Cart"%>
<%@page import="ezo.shop.dao.ItemDao"%>
<%@page import="ezo.shop.dao.CartDao"%>
<%@page import="ezo.shop.vo.Customer"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");
	int itemNo = NumberUtils.stringToNumber(request.getParameter("itemno")); 
	Customer loginedUser = (Customer) session.getAttribute("LOGINED_USER");
	if (loginedUser == null) {
		response.sendRedirect("loginform.jsp?fail=deny&pageno=detail.jsp?itemno="+itemNo);
		return;
	}

	CartDao cartDao = CartDao.getInstance();
	ItemOptionDao itemOptionDao = ItemOptionDao.getInstance();
	
	String size = request.getParameter("size");
	String[] optionNos = request.getParameterValues("color");
	String[] amounts = request.getParameterValues("amount");
	int eachPrice = NumberUtils.stringToNumber(request.getParameter("eachPrice"));
	int totalPrice = NumberUtils.stringToNumber(request.getParameter("totalPrice"));
	
	//cart_no(시퀀스) , Cust_no(loginedUser.getNo()) opt_no (itemOption.getNo) cart_order_amount(amount)
	for(int i = 0; i < optionNos.length; i++) {
		Cart cart = new Cart();

		cart.setCustomer(loginedUser);
		
		ItemOption itemOption = new ItemOption();
		itemOption.setSize(size);
		int optionNo = NumberUtils.stringToNumber(optionNos[i]);
		itemOption.setNo(optionNo);
		
		cart.setItemOption(itemOption);
		
		int amount = NumberUtils.stringToNumber(amounts[i]);
		cart.setAmount(amount);
		
		cartDao.insertCart(cart);		
	}
	response.sendRedirect("cart.jsp");
	
%>