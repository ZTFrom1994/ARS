package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.List;
public class StaffHomeData implements Serializable{
	private static final long serialVersionUID = 8110925018917906565L;
	private List<ApplicationSheet> applicationSheets;
	private int monthTotalReimbursement;
	private int monthTotalApprovedReim;
	private float totalReimMoney;
	private int numberOfSentReservations;
	private int numberOfFailReimSheets;
	private int numberOfMyBorrowingRecord;
	public List<ApplicationSheet> getApplicationSheets() {
		return applicationSheets;
	}
	public void setApplicationSheets(List<ApplicationSheet> applicationSheets) {
		this.applicationSheets = applicationSheets;
	}
	public int getMonthTotalReimbursement() {
		return monthTotalReimbursement;
	}
	public void setMonthTotalReimbursement(int monthTotalReimbursement) {
		this.monthTotalReimbursement = monthTotalReimbursement;
	}
	public int getMonthTotalApprovedReim() {
		return monthTotalApprovedReim;
	}
	public void setMonthTotalApprovedReim(int monthTotalApprovedReim) {
		this.monthTotalApprovedReim = monthTotalApprovedReim;
	}
	public float getTotalReimMoney() {
		return totalReimMoney;
	}
	public void setTotalReimMoney(float totalReimMoney) {
		this.totalReimMoney = totalReimMoney;
	}
	public int getNumberOfSentReservations() {
		return numberOfSentReservations;
	}
	public void setNumberOfSentReservations(int numberOfSentReservations) {
		this.numberOfSentReservations = numberOfSentReservations;
	}
	public int getNumberOfFailReimSheets() {
		return numberOfFailReimSheets;
	}
	public void setNumberOfFailReimSheets(int numberOfFailReimSheets) {
		this.numberOfFailReimSheets = numberOfFailReimSheets;
	}
	public int getNumberOfMyBorrowingRecord() {
		return numberOfMyBorrowingRecord;
	}
	public void setNumberOfMyBorrowingRecord(int numberOfMyBorrowingRecord) {
		this.numberOfMyBorrowingRecord = numberOfMyBorrowingRecord;
	}
	
}
