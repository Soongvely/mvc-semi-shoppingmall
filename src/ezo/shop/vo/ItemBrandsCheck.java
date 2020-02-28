package ezo.shop.vo;

public class ItemBrandsCheck {
	String brand;
	int count;
	boolean checked = false;
	
	ItemBrandsCheck() {}
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}


	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
