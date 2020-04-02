package ezo.shop.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

		int pageno = NumberUtils.stringToNumber(pageNo);
		int reCord = NumberUtils.stringToNumber(record);

		Map<String,Object> keyWord = new HashMap<String, Object>();

		keyWord.put("max_price", Optional.ofNullable(request.getParameter("max_price")).orElse("0"));
		keyWord.put("max_price", Optional.ofNullable(request.getParameter("min_price")).orElse("0"));
		keyWord.put("max_price", Optional.ofNullable(request.getParameter("cate")).orElse("0"));
		keyWord.put("max_price", Optional.ofNullable(request.getParameter("pageNo")).orElse("0"));
		keyWord.put("max_price", Optional.ofNullable(request.getParameter("record")).orElse(0));
		keyWord.put("max_price", Optional.ofNullable(request.getParameter("search")).orElse(0));

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
			

			for(Like like : likes) {
				if(like.getItem().getNo() == itemNo) {
					likedao.deleteLikeByItemNoandCustNo(new Like(custNo, itemNo));
					item.setLikeCount(item.getLikeCount() -1);
					itemdao.updateItemByItemNo(item);
					likecheck = true;
				}
			}
			if(!likecheck) {
				likedao.insertLike(new Like(custNo,itemNo));

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
