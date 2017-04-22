package priv.zt.ars.domain;

import java.io.Serializable;

public class PaymentRecord implements Serializable{
	private static final long serialVersionUID = 4890590139370444644L;
	
	private int id;
	private Assessor assessor;
	private BorrowRecord borrowRecord;
	private float amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Assessor getAssessor() {
		return assessor;
	}
	public void setAssessor(Assessor assessor) {
		this.assessor = assessor;
	}
	public BorrowRecord getBorrowRecord() {
		return borrowRecord;
	}
	public void setBorrowRecord(BorrowRecord borrowRecord) {
		this.borrowRecord = borrowRecord;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
}
