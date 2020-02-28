package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sanggi.api.annotation.Mapping;
import com.sanggi.api.annotation.Soong;

import ezo.shop.dao.AdminItemDao;
import ezo.shop.util.NumberUtils;
import ezo.shop.vo.Category;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Item;
import ezo.shop.vo.Pagination;

@Soong
public class AdminItemController {

	private final AdminItemDao adminItemDao = AdminItemDao.getinstance();

	// 상위 카테고리 조회
	@Mapping("/getMainCategories")
	public List<Category> getMainCategories () throws SQLException {
		
		return adminItemDao.getMainCategories();
	}
	
	// 상위와 일치하는 하위카테고리 조회
	@Mapping("/getSubCategories")
	public List<Category> getSubCategories (HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return null;
		}
		int mainCategoryNo = NumberUtils.stringToNumber(request.getParameter("mainCategoryNo"));

		return adminItemDao.getSubCategories(mainCategoryNo);
	}
	
	// 조건별 상품조회
	@Mapping("/getItemsByCriteria")
	public HashMap<String, Object> getItemByCriteria (HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return null;
		}
		
		Criteria cri = new Criteria();
		cri.setMainCategory(NumberUtils.stringToNumber(request.getParameter("mainCategory")));
		cri.setSubCategory(NumberUtils.stringToNumber(request.getParameter("subCategory")));
		cri.setStartDate(request.getParameter("startDate"));
		cri.setEndDate(request.getParameter("endDate"));
		cri.setKeyword(request.getParameter("keyword").toLowerCase());
		cri.setIsDisplay(request.getParameter("isDisplay"));
		cri.setSort(request.getParameter("sort"));
		cri.setPage(NumberUtils.stringToNumber(request.getParameter("page")));
		
		int totalCount = adminItemDao.getTotalCountItemList(cri);
				
		
		Pagination pagination = new Pagination(cri.getPage(), totalCount, 20);
		
		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());
		
		List<Item> list = adminItemDao.getItemByCriteria(cri);
		
		for (Item item : list) {
			item.setItemOptions(adminItemDao.getOptionByItemNo(item.getNo()));
			System.out.println(item);
		}
		
		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("totalCount", totalCount);
		model.put("pagination",pagination);
		
		return model;
	}
	
	// 상품 삭제 (Y -> N)
	@Mapping("/deleteItem")
	public void updateItemIsDelete(HttpServletRequest request) throws SQLException {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return;
		}
		
		String[] checkedNos = request.getParameterValues("ck-item");
		
		for (String no : checkedNos) {
			adminItemDao.updateItemIsDelete(NumberUtils.stringToNumber(no));		
		}
	}
	
	// 새 상품 등록
	@Mapping("/insertItem")
	public void insertNewItem(HttpServletRequest request) {
		
		final HttpSession session = request.getSession();
		
		if (session.getAttribute("LOGINED_ADMIN") == null) {
			return ;
		}
		
	}
	
	@Mapping("/getSalesCategory")
	public List<Category> getSalesCategory() throws SQLException {
		return adminItemDao.getSalesCategory();
	}

}
