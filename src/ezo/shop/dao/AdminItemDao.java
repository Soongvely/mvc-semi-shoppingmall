package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.Category;
import ezo.shop.vo.Criteria;
import ezo.shop.vo.Item;
import ezo.shop.vo.ItemOption;

@SuppressWarnings("unchecked")

public class AdminItemDao {

	private static AdminItemDao instance = new AdminItemDao();

	private AdminItemDao() {
	}

	public static AdminItemDao getinstance() {
		return instance;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	// 상위 카테고리 조회
	public List<Category> getMainCategories() throws SQLException {
		return sqlmap.queryForList("adminitems.getMainCategories");
	}

	// 하위 카테고리 조회
	public List<Category> getSubCategories(int maincateNo) throws SQLException {
		return sqlmap.queryForList("adminitems.getSubCategories", maincateNo);
	}

	// 조건별 상품 조회
	public List<Item> getItemByCriteria(Criteria criteria) throws SQLException {
		return sqlmap.queryForList("adminitems.getItemByCriteria", criteria);
	}
	
	// 모든 상품 조회
	public Item getItemByItemNo(int itemNo) throws SQLException {
		return (Item)sqlmap.queryForObject("adminitems.getItemByItemNo", itemNo);
	}

	// 새상품 추가
	public void insertNewItem(Item item) throws SQLException {
		sqlmap.insert("adminitems.insertNewItem", item);
	}
	
	// 새 옵션 추가
	public void insertNewOption(ItemOption option) throws SQLException {
		sqlmap.insert("adminitems.insertNewOption", option);
	}

	// 상품 수정
	public void updateItemByItemNo(Item item) throws SQLException {
		sqlmap.update("adminitems.updateItemByItemNo", item);
	}
	
	// 상품 삭제여부 수정
	public void updateItemIsDelete(int itemNo) throws SQLException {
		sqlmap.update("adminitems.updateItemIsDelete", itemNo);
	}
	
	// 상품 옵션조회
	public List<ItemOption> getOptionByItemNo(int itemNo) throws SQLException {
		return sqlmap.queryForList("adminitems.getOptionByItemNo", itemNo);
	}
	
	// 상품목록 총 조회 개수
	public int getTotalCountItemList(Criteria criteria) throws SQLException {
		return (int)sqlmap.queryForObject("adminitems.getTotalCountItemList", criteria);
		
	}
	
	public List<Category> getSalesCategory() throws SQLException {
		return sqlmap.queryForList("adminitems.getSalesCategory");
	}
}
