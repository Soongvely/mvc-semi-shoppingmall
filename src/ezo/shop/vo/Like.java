package ezo.shop.vo;

public class Like {
	private Customer customer;		//cust_no
	private Item item;				// item_no
	
	public Like () {}
	public Like(int custNo, int itemNo) {
		this.setCustomer(new Customer());
		this.setItem(new Item());
		this.getCustomer().setNo(custNo);
		this.getItem().setNo(itemNo);
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	
	
	
}
