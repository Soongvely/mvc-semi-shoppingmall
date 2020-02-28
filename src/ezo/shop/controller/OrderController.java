package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import com.sanggi.api.annotation.Mapping;
import com.sanggi.api.annotation.Soong;

import ezo.shop.dao.AdminOrderProductDao;
import ezo.shop.util.NumberUtils;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.OrderProduct;
import ezo.shop.vo.Pagination;

@SuppressWarnings("unchecked")
@Soong
public class OrderController {

	AdminOrderProductDao adminOrderProductDao = AdminOrderProductDao.getInstance();
	
	// 조건별 주문리스트 조회
	@Mapping("/getOrderByCriteria")
	public HashMap<String, Object> getOrderByCriteria (HttpServletRequest request) throws SQLException {
		
		int page = NumberUtils.stringToNumber(request.getParameter("page"));
		
		Criteria cri = new Criteria();
		
		cri.setKeyword(request.getParameter("keyword"));
		cri.setStartDate(request.getParameter("startDate"));
		cri.setEndDate(request.getParameter("endDate"));
		cri.setOrder(request.getParameter("order"));
		cri.setPayment(request.getParameter("payment"));
		cri.setShowCount(NumberUtils.stringToNumber(request.getParameter("showCount")));
		cri.setSort(request.getParameter("sort"));
		cri.setPage(page);
		
		if (page < 1)
			page = 1;
			
		int totalCount = adminOrderProductDao.getTotalCountOrderList(cri);
		
		Pagination pagination = new Pagination(page, totalCount, 15, 3);
		
		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());

		System.out.println(cri);
		
		List<OrderProduct> list = adminOrderProductDao.getOrderListByCriteria(cri);
		
		HashMap<String, Object> model = new HashMap<String, Object>();
		
		model.put("list", list);
		model.put("beginPage", pagination.getBeginPage());
		model.put("endPage", pagination.getEndPage());
		model.put("totalPage", pagination.getTotalPagesCount());
		model.put("totalCount", totalCount);
		
		return model;
	} 
	
	// 조건별 취소/교환/반품 리스트 조회
	@Mapping("/getPaymentByCriteria")
	public HashMap<String, Object> getOrderProductStatusListByCriteria(HttpServletRequest request) throws SQLException {
		
		int page = NumberUtils.stringToNumber(request.getParameter("page"));
		
		Criteria cri = new Criteria();
		
		cri.setKeyword(request.getParameter("keyword"));
		cri.setStartDate(request.getParameter("startDate"));
		cri.setEndDate(request.getParameter("endDate"));
		cri.setOrder(request.getParameter("order"));
		cri.setSort(request.getParameter("sort"));
		cri.setShowCount(NumberUtils.stringToNumber(request.getParameter("showCount")));
		cri.setPage(page);
		
		if (page < 1) 
			page = 1;
		
		int totalCount = adminOrderProductDao.getTotalCountOrderProductStatusList(cri);
			
		Pagination pagination = new Pagination(page, totalCount, 15, 3); 	// 페이지번호, 데이터 총 개수, 한 페이지에서 표출할 데이터, 페이지구간 
		
		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());
		
		System.out.println(cri);
		
		List<OrderProduct> list = adminOrderProductDao.getOrderProductStatusListByCriteria(cri);
			
		HashMap<String, Object> model = new HashMap<String, Object>();
		
		model.put("list", list);
		model.put("beginPage", pagination.getBeginPage());
		model.put("endPage", pagination.getEndPage());
		model.put("totalPage", pagination.getTotalPagesCount());
		model.put("totalCount", totalCount);
		
		return model;
	}
	
	@Mapping("/testSoong")
	public Map getOrdersdasa() throws SQLException {
		return new TreeMap(adminOrderProductDao.getDailySales());
	}
}
