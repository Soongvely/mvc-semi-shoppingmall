package ezo.shop.vo;

import java.sql.SQLException;

import ezo.shop.dao.AdminItemDao;
import ezo.shop.util.NumberUtils;

public class Test {

	public static void main(String[] args) throws SQLException {
		
		AdminItemDao dao = AdminItemDao.getinstance();
		
		String options = "RED/100&BLUE/50&";
		
		String[] optionSplit = options.split("&");

		for (String option : optionSplit) {
			
			String[] opt = option.split("/");
			
			ItemOption itemOption = new ItemOption();
			itemOption.setColor(opt[0]);
			itemOption.setStock(NumberUtils.stringToNumber(opt[1]));
			itemOption.setSize("FREE");
			
			dao.insertNewOption(itemOption);
			
		}
		
		
	}
	
}
