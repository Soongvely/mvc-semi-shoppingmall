package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Item;
import ezo.shop.vo.ItemBrandsCheck;

public class ItemDao {
	
	private static ItemDao instance = new ItemDao();
	
	private ItemDao() {}
	
	public static ItemDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	@SuppressWarnings("unchecked")
	public List<Item> getItemListbyName(Map<String,Object> keyWord) throws SQLException{
		return sqlmap.queryForList("items.getItemListbyName",keyWord);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> getItemListbyMenu(Map<String,Object> keyWord) throws SQLException {
		return sqlmap.queryForList("items.getItemListbyMenu", keyWord);
	}
	
	public Item getItembyNo(int itemNo) throws SQLException {
		return (Item) sqlmap.queryForObject("items.getItembyNo", itemNo);
	}
	
	public int getItemListCount(Map<String,Object> keyWord) throws SQLException {
		return (Integer) sqlmap.queryForObject("items.getItemListCount", keyWord);
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> searchItems(Map<String,Object> keyWord) throws SQLException {
		return sqlmap.queryForList("items.searchItems", keyWord);
	}
	@SuppressWarnings("unchecked")
	public List<Item> searchItemsGetMinMax(Map<String,Object> keyWord) throws SQLException {
		return sqlmap.queryForList("items.searchItemsGetMinMax", keyWord);
	}
	
	public int getTotalBrandCount(Map<String,Object> Keyword) throws SQLException {
		return (Integer) sqlmap.queryForObject("items.getTotalBrandCount",Keyword);
	}
	
	@SuppressWarnings("unchecked")
	public List<ItemBrandsCheck> getItemBrandList(Map<String,Object> Keyword) throws SQLException {
		return sqlmap.queryForList("items.getItemBrandList",Keyword);
	}
	
	public int getItemListbyNameCount(Map<String,Object> keyWord) throws SQLException {
		return (Integer) sqlmap.queryForObject("items.getItemListbyNameCount", keyWord);
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> getItemListTotal(Map<String,Object> kewWord) throws SQLException {
		return sqlmap.queryForList("items.getItemListTotal", kewWord);
	}
	
	// 리뷰갯수, 좋아요갯수를 불러오는 상품들  건희
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getAllItemCountReviewandLikeBycustNo(int custNo) throws SQLException {
		return sqlmap.queryForList("items.getAllItemCountReviewandLikeBycustNo", custNo);
	}
	

	@SuppressWarnings("unchecked")
	public List<Item> getSearchItemName(String searchText) throws SQLException {
		return sqlmap.queryForList("items.getSearchItemName", searchText);
	}

	// 아이템번호로 좋아요 바꾸기 건희
	public void updateItemByItemNo (Item item) throws SQLException {
		sqlmap.update("items.updateItemByItemNo", item);
	}
	@SuppressWarnings("unchecked")
	public List<Item> getItemTopList (Map<String,Object> kewword) throws SQLException {
		return sqlmap.queryForList("items.getItemTopList", kewword);
	}

}