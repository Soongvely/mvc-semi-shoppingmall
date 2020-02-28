package ezo.shop.vo;

public class Cart {
	private Integer no;
	private Customer customer;
	private ItemOption itemOption;
	private Integer amount;
	private Item item;
	public Cart() {
		
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}



	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public ItemOption getItemOption() {
		return itemOption;
	}

	public void setItemOption(ItemOption itemOption) {
		this.itemOption = itemOption;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
}
