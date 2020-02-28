package ezo.shop.vo;

public class ItemOption {

	private int no;
	private Item item;
	private String color;
	private String size;
	private String isSoldout;
	private int stock;
	
	public ItemOption() {}

	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getIsSoldout() {
		return isSoldout;
	}

	public void setIsSoldout(String isSoldout) {
		this.isSoldout = isSoldout;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "ItemOption [no=" + no + ", item=" + item + ", color=" + color + ", size=" + size + ", isSoldout="
				+ isSoldout + ", stock=" + stock + "]";
	}
	
}
