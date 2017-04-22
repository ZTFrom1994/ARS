package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class BorrowRecord implements Serializable{
	private static final long serialVersionUID = 8858371925115383402L;
	private int id;
	private Project project;
	private float amount;
	private String remarks;
	private Date paymentTime;
	private String state;
	private float paidMoney;
	private Staff borrower;
	private Date recordDate;
	private String use;
	private int applicationId;
	
	public int getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Staff getBorrower() {
		return borrower;
	}
	public void setBorrower(Staff borrower) {
		this.borrower = borrower;
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
	
	public Date getPaymentTime() {
		return paymentTime;
	}
	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public float getPaidMoney() {
		return paidMoney;
	}
	public void setPaidMoney(float paidMoney) {
		this.paidMoney = paidMoney;
	}
	

}
