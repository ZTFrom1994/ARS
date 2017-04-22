package priv.zt.ars.domain;

import java.io.Serializable;

public class OffsetBorrowing implements Serializable {
	
	private static final long serialVersionUID = 4744698020266543378L;
	
	private int id;
	private BorrowRecord borrowRecord;
	private float amount;
	private String state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public BorrowRecord getBorrowRecord() {
		return borrowRecord;
	}
	public void setBorrowRecord(BorrowRecord borrowRecord) {
		this.borrowRecord = borrowRecord;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	
}
