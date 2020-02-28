<%@page import="ezo.shop.dao.AdminItemDao"%>
<%@page import="ezo.shop.vo.ItemOption"%>
<%@page import="ezo.shop.vo.Category"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="ezo.shop.vo.Item"%>
<%@page import="ezo.shop.util.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	MultipartRequest multipartRequest = new MultipartRequest(request
										,"C:\\Users\\zm_mz\\OneDrive\\web_workspace\\semi\\WebContent\\resources\\product"
										, 1024*1024*10
										, "utf-8");
	String path = "/semi/resources/product/";
	
	int subNo = NumberUtils.stringToNumber(multipartRequest.getParameter("sub"));
	String subName = multipartRequest.getParameter("subname");
	String brand = multipartRequest.getParameter("brand");
	String name = multipartRequest.getParameter("name");
	int stock = NumberUtils.stringToNumber(multipartRequest.getParameter("stock"));
	int price = NumberUtils.stringToNumber(multipartRequest.getParameter("price"));
	int rate = NumberUtils.stringToNumber(multipartRequest.getParameter("rate"));
	int discount = NumberUtils.stringToNumber(multipartRequest.getParameter("discount"));
	String imagePath = multipartRequest.getFilesystemName("image");
	String soldout = multipartRequest.getParameter("soldout");
	String display = multipartRequest.getParameter("display");
	String options = multipartRequest.getParameter("options");

	Item item = new Item();
	item.setCategory(new Category());
	item.getCategory().setNo(subNo);
	item.setBrand(brand);
	item.setName(name);
	item.setPrice(price);
	item.setDiscountRate(rate);
	item.setDiscountPrice(discount);
	item.setImagePath(path+imagePath);
	item.setIsDisplay(display);
	item.setSoldout(soldout);
	if(rate > 0) {
		item.setIsDiscount("Y");
	} else {
		item.setIsDiscount("N");
	}
	
	AdminItemDao adminItemDao = AdminItemDao.getinstance();
	
	adminItemDao.insertNewItem(item);
	
	String[] optionSets = options.split("&");	
	for (String optionSet : optionSets) {
		String[] option = optionSet.split("/");
		
		ItemOption itemOption = new ItemOption();
		itemOption.setColor(option[0]);
		itemOption.setStock(NumberUtils.stringToNumber(option[1]));
		itemOption.setSize("FREE");
		
		adminItemDao.insertNewOption(itemOption);
	}
	
%>
<script type="text/javascript">
	alert("상품이 추가되었습니다.");
</script>	

<%
	response.sendRedirect("product.jsp");
%>