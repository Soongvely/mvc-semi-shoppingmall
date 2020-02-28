package ezo.shop.vo;

import java.util.Date;

public class QuestionBoard {

	private int no;
	private Customer customer;
	private String type;
	private String title;
	private String contents;
	private String isAnswered;
	private Date createDate;
	private BoardReply boardReply;
	
	public QuestionBoard() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public BoardReply getBoardReply() {
		return boardReply;
	}

	public void setBoardReply(BoardReply boardReply) {
		this.boardReply = boardReply;
	}

	@Override
	public String toString() {
		return "QuestionBoard [no=" + no + ", customer=" + customer + ", type=" + type + ", title=" + title
				+ ", contents=" + contents + ", isAnswered=" + isAnswered + ", createDate=" + createDate
				+ ", boardReply=" + boardReply + "]";
	}
	
	
}
