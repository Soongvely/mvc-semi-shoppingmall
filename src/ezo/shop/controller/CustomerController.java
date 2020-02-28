package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sanggi.api.annotation.Mapping;
import com.sanggi.api.annotation.Soong;

import ezo.shop.dao.AdminUserDao;
import ezo.shop.util.NumberUtils;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Customer;
import ezo.shop.vo.Pagination;

@Soong
public class CustomerController {
	
	AdminUserDao adminUserDao = AdminUserDao.getinstance();
	
	// 조건별 고객 리스트
	@Mapping("/getCustomerByCriteria")
	public HashMap<String, Object> getAllCustomersByCriteria (HttpServletRequest request) throws SQLException {
		
		int page = NumberUtils.stringToNumber(request.getParameter("page"));
		
		Criteria cri = new Criteria();
		
		cri.setKeyword(request.getParameter("keyword"));
		cri.setStartDate(request.getParameter("startDate"));
		cri.setEndDate(request.getParameter("endDate"));
		cri.setRegist(request.getParameter("regist"));
		cri.setSort(request.getParameter("sort"));
		cri.setShowCount(NumberUtils.stringToNumber(request.getParameter("showCount")));
		cri.setPage(page);
	
		if (page < 1) 
			page = 1;
		
		int totalCount = adminUserDao.getTotalCountCustomerList(cri);
		
		Pagination pagination = new Pagination(page, totalCount , 15, 3);
		
		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());
		
		System.out.println(cri);
		
		List<Customer> list = adminUserDao.getAllCustomersByCriteria(cri);

		HashMap<String, Object> model = new HashMap<String, Object>();


		model.put("list", list);
		model.put("beginPage", pagination.getBeginPage());
		model.put("endPage", pagination.getEndPage());
		model.put("totalPage", pagination.getTotalPagesCount());
		model.put("totalCount", totalCount);
		
		return model;
	}
	
	// 고객 정보 변경
	@Mapping("/updateCustomer")
	public void updateCustomerByAdmin(HttpServletRequest request) throws SQLException {
		
		Customer customer = new Customer();
		customer.setNo(NumberUtils.stringToNumber(request.getParameter("no")));
		
		adminUserDao.updateCustomerByAdmin(customer); 
	}
}
