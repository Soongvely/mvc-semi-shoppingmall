package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sanggi.api.annotation.Mapping;
import com.sanggi.api.annotation.Soong;

import ezo.shop.dao.ItemDao;
import ezo.shop.dao.LikeDao;
import ezo.shop.util.NumberUtils;
import ezo.shop.vo.Item;
import ezo.shop.vo.Like;
import ezo.shop.vo.Pagination;

@Soong
public class AAAController {


	@Mapping("/getNextItemList")
	public List<Item> getNextItemList(HttpServletRequest request) throws SQLException {
		ItemDao itemdao = ItemDao.getInstance();
		Map<String,Object> keyWord = new HashMap<String, Object>();
		
		String max_price = request.getParameter("max_price");
		String min_price = request.getParameter("min_price");
		String cate = request.getParameter("cate");
		String pageNo = request.getParameter("pageNo");
		String record = request.getParameter("record");
		String search = request.getParameter("search");
		
		int pageno = NumberUtils.stringToNumber(pageNo);
		int reCord = NumberUtils.stringToNumber(record);
		
		/**
		 * 
		 * if-else 를 사용하지 말고 refactoring 해 보세요
		 * 소스코드 전체적으로 if-else를 사용하지 않을 수 있음에도 많이 적용되어 있음
		 * 
		 * */
		if(!max_price.equals("null")) {
			System.out.println("max_price:"+max_price);
			keyWord.put("max_price", max_price);
		}
		if(!min_price.equals("null")) {
			System.out.println("min_price:"+min_price);
			keyWord.put("min_price", min_price);
		}
		if(!cate.equals("null")) {
			System.out.println("移댄뀒:"+cate);
			keyWord.put("cate", cate);
		}
		if(!search.equals("null")) {
			keyWord.put("search", search);
			System.out.println("search:"+search);
		}
		
		int totalRows = itemdao.getItemListbyNameCount(keyWord);
		Pagination pagination = new Pagination(pageno, totalRows, reCord);
		System.out.println("totalRows:"+ totalRows);
		keyWord.put("begin", pagination.getBeginIndex());
		keyWord.put("end", pagination.getEndIndex());
		
		System.out.println("begin :"+ pagination.getBeginIndex());
		System.out.println("end :"+ pagination.getEndIndex());
		
		List<Item> itemList = itemdao.getItemListbyName(keyWord); 
		
		return itemList;
	}
	
	@Mapping("/getSearchItemName")
	public List<Item> getSearchItemName(HttpServletRequest request) throws SQLException {
		ItemDao itemdao = ItemDao.getInstance();
		
		String searchText = request.getParameter("searchText");
		
		
		List<Item> items = itemdao.getSearchItemName(searchText);
		
		return items;
	}
	
	@Mapping("/getLikeItemj")
	public boolean getLikeItem(HttpServletRequest request) throws SQLException {
			
		boolean likecheck = false;
			ItemDao itemdao = ItemDao.getInstance();
			LikeDao likedao = LikeDao.getInstance();
			int itemNo =Integer.parseInt(request.getParameter("itemNo"));
			int custNo =Integer.parseInt(request.getParameter("custNo"));
			List<Like> likes = likedao.getLikeAllByCustNo(custNo);
			Item item = itemdao.getItembyNo(itemNo);
			
			System.out.println("itemno:"+itemNo);
			
			/**
			 * 자바도 메모리 관리해야 합니다.
			 * 아래 구문은 스택 영역에 많은 메모리를 많이 차지합니다.
			 * Refactoring 해 주세요
			 * 
			 * */
			for(Like like : likes) {
				if(like.getItem().getNo() == itemNo) {
					Like thislike1 = new Like(custNo,itemNo);
					likedao.deleteLikeByItemNoandCustNo(thislike1);
					item.setLikeCount(item.getLikeCount() -1);
					itemdao.updateItemByItemNo(item);
					likecheck = true;
				}
			}
			if(!likecheck) {
				Like thisLike2 = new Like(custNo,itemNo);
				likedao.insertLike(thisLike2);

				item.setLikeCount(item.getLikeCount() + 1);
				itemdao.updateItemByItemNo(item);

			}
			
			if(likecheck) {
				return false;
			}else {
				return true;
			}
	}
	
}
