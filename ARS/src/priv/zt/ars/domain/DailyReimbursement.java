package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class DailyReimbursement implements Serializable{
	private static final long serialVersionUID = -4023905443080471767L;
	private int id;
	private String remarks;
	private Date applyDate;
	private Staff proposer;
	private String state;
	private Project project;
	private String paymentType;
	private String leaveMessages;
	private int sheetId;
	private int totalNumber;
	private float totalMoney;
	private OffsetBorrowing offsetBorrowing;
	private Event event;
	private List<DailyReimbursementItem> itemList; 
	private Date finishDate;
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public List<DailyReimbursementItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<DailyReimbursementItem> itemList) {
		this.itemList = itemList;
	}
	public String getLeaveMessages() {
		return leaveMessages;
	}
	public void setLeaveMessages(String leaveMessages) {
		this.leaveMessages = leaveMessages;
	}
	public int getSheetId() {
		return sheetId;
	}
	public void setSheetId(int sheetId) {
		this.sheetId = sheetId;
	}

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	public OffsetBorrowing getOffsetBorrowing() {
		return offsetBorrowing;
	}
	public void setOffsetBorrowing(OffsetBorrowing offsetBorrowing) {
		this.offsetBorrowing = offsetBorrowing;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public Staff getProposer() {
		return proposer;
	}
	public void setProposer(Staff proposer) {
		this.proposer = proposer;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public float getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}
	
}
