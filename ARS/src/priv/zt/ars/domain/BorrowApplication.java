package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class BorrowApplication implements Serializable{
	private static final long serialVersionUID = 539171466845199953L;
	private int id;
	private Project project;
	private int amount;
	private String remarks;
	private String paymentType;
	private String state;
	private Staff borrower;
	private Date applyDate;
	private String use;
	private Event event;
	private int paymentDaysLimit;
	private String leaveMessages;
	private int sheetId;
	public int getSheetId() {
		return sheetId;
	}
	public void setSheetId(int sheetId) {
		this.sheetId = sheetId;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public int getPaymentDaysLimit() {
		return paymentDaysLimit;
	}
	public void setPaymentDaysLimit(int paymentDaysLimit) {
		this.paymentDaysLimit = paymentDaysLimit;
	}
	public String getLeaveMessages() {
		return leaveMessages;
	}
	public void setLeaveMessages(String leaveMessages) {
		this.leaveMessages = leaveMessages;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Staff getBorrower() {
		return borrower;
	}
	public void setBorrower(Staff borrower) {
		this.borrower = borrower;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
}
