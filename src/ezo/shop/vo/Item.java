package ezo.shop.vo;

import java.util.Date;
import java.util.List;

public class Item {

	private int no;
	private Category category;
	private String name;
	private int price;
	private int discountPrice;
	private String soldout;
	private String isDiscount;
	private String isDisplay;
	private Date createDate;
	private String brand;
	private String imagePath;
	private int likeCount;
	private int discountRate;
	private ItemOption itemOption;
	private List<ItemOption> itemOptions;
	private String isDelete;
	
	public Item() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getSoldout() {
		return soldout;
	}

	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}

	public String getIsDiscount() {
		return isDiscount;
	}

	public void setIsDiscount(String isDiscount) {
		this.isDiscount = isDiscount;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public ItemOption getItemOption() {
		return itemOption;
	}

	public void setItemOption(ItemOption itemOption) {
		this.itemOption = itemOption;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public List<ItemOption> getItemOptions() {
		return itemOptions;
	}

	public void setItemOptions(List<ItemOption> itemOptions) {
		this.itemOptions = itemOptions;
	}
	
	
	
}
