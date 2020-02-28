package ezo.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ezo.shop.util.IbatisUtil;
import ezo.shop.vo.ItemOption;

public class ItemOptionDao {
	private static ItemOptionDao instance = new ItemOptionDao();
	private ItemOptionDao() {}
	
	public static ItemOptionDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	
	@SuppressWarnings("unchecked")
	public List<ItemOption> getItemOptionByItemNo(int itemNo) throws SQLException {
		return sqlmap.queryForList("itemOptions.getOptionsByItemNo", itemNo);
	}
	
	public ItemOption getItemOptionByOptNo(int optNo) throws SQLException {
		return (ItemOption) sqlmap.queryForObject("itemOptions.getItemOptionByOptNo", optNo);
	}
	
	public void updateOptStock(ItemOption itemOption) throws SQLException {
		sqlmap.update("itemOptions.updateOptStock",itemOption);
	}
//	public void insertItemOption(int itemNo) throws SQLException {
//		sqlmap.insert("itemOptions.insertItemOption",itemNo);
//	}
	
}
