package ezo.shop.vo;

import java.util.Date;

public class PointHistory {
	
	private Integer no;
	private Customer customer; // customer_no 
	private Date updateDate;
	private String status;		// 적립, 사용
	private Integer useAmount;  // 사용량
	private String contents;   // 포인트발생이유 (구매, 이벤트, 사용등 포인트 내용)
	private Integer orderProductNo; //주문상품번호
	
	public PointHistory () {}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getUseAmount() {
		return useAmount;
	}

	public void setUseAmount(Integer useAmount) {
		this.useAmount = useAmount;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getOrderProductNo() {
		return orderProductNo;
	}

	public void setOrderProductNo(Integer orderProductNo) {
		this.orderProductNo = orderProductNo;
	}
	
	
	
	
}
