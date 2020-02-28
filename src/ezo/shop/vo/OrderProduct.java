package ezo.shop.vo;

public class OrderProduct {
	private Integer no;
	private Order order; 			 // order_no
	private ItemOption itemOption;	// opt_no
	private Integer orderAmount;	// 주문한 상품 개수
	private String reviewEnabled;	// 리뷰 여부
	private String productStatus;	// 주문상품에 대한 주문상태(취소/ (교환/반품) /구매확정 / 배송중)
	
	public OrderProduct() {}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ItemOption getItemOption() {
		return itemOption;
	}

	public void setItemOption(ItemOption itemOption) {
		this.itemOption = itemOption;
	}

	public Integer getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Integer orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getReviewEnabled() {
		return reviewEnabled;
	}

	public void setReviewEnabled(String reviewEnabled) {
		this.reviewEnabled = reviewEnabled;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	
	
	
}
