package ezo.shop.vo;

import java.util.Map;

public class ItemListSearchData {

	Map<String,Object> keyWord;
	String[] brandArray;
	
	public ItemListSearchData() {}

	public Map<String, Object> getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(Map<String, Object> keyWord) {
		this.keyWord = keyWord;
	}

	public String[] getBrandArray() {
		return brandArray;
	}

	public void setBrandArray(String[] brandArray) {
		this.brandArray = brandArray;
	}
	
}
