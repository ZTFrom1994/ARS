package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TravelReimbursement implements Serializable{
	private static final long serialVersionUID = 3542210754760356465L;
	
	private int id;
	private String place;
	private int peopleNumber;
	private Date travelTime;
	private String remarks;
	private String state;
	private Date applyDate;
	private String paymentType;
	private String leaveMessages;
	private int totalSheets;
	private float totalMoney;
	private OffsetBorrowing offsetBorrowing;
	private Staff proposer;
	private Project project;
	private Event event;
	private List<TravelReimbursementItem> itemList;
	private int sheetId;
	private Date finishDate;
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public int getTotalSheets() {
		return totalSheets;
	}
	public void setTotalSheets(int totalSheets) {
		this.totalSheets = totalSheets;
	}
	public float getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getSheetId() {
		return sheetId;
	}
	public void setSheetId(int sheetId) {
		this.sheetId = sheetId;
	}
	public String getLeaveMessages() {
		return leaveMessages;
	}
	public void setLeaveMessages(String leaveMessages) {
		this.leaveMessages = leaveMessages;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public List<TravelReimbursementItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<TravelReimbursementItem> itemList) {
		this.itemList = itemList;
	}
	public OffsetBorrowing getOffsetBorrowing() {
		return offsetBorrowing;
	}
	public void setOffsetBorrowing(OffsetBorrowing offsetBorrowing) {
		this.offsetBorrowing = offsetBorrowing;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Staff getProposer() {
		return proposer;
	}
	public void setProposer(Staff proposer) {
		this.proposer = proposer;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public Date getTravelTime() {
		return travelTime;
	}
	public void setTravelTime(Date travelTime) {
		this.travelTime = travelTime;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
