package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ApplicationSheet implements Serializable {
	
	private static final long serialVersionUID = 3166015054308235858L;
	private int id;
	private String type;
	private DailyReimbursement dailyReimbursement;
	private TravelReimbursement travelReimbursement;
	private BorrowApplication borrowApplication;
	private BorrowRecord borrowRecord;
	private String invoiceCheck;
	private String reimbursementResult;
	private String remarks;
	private Date date;
	private int staffId;
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public DailyReimbursement getDailyReimbursement() {
		return dailyReimbursement;
	}
	public void setDailyReimbursement(DailyReimbursement dailyReimbursement) {
		this.dailyReimbursement = dailyReimbursement;
	}
	public TravelReimbursement getTravelReimbursement() {
		return travelReimbursement;
	}
	public void setTravelReimbursement(TravelReimbursement travelReimbursement) {
		this.travelReimbursement = travelReimbursement;
	}
	public BorrowApplication getBorrowApplication() {
		return borrowApplication;
	}
	public void setBorrowApplication(BorrowApplication borrowApplication) {
		this.borrowApplication = borrowApplication;
	}
	public String getInvoiceCheck() {
		return invoiceCheck;
	}
	public void setInvoiceCheck(String invoiceCheck) {
		this.invoiceCheck = invoiceCheck;
	}
	public String getReimbursementResult() {
		return reimbursementResult;
	}
	public void setReimbursementResult(String reimbursementResult) {
		this.reimbursementResult = reimbursementResult;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
