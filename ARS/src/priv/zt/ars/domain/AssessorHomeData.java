package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.List;

public class AssessorHomeData implements Serializable{
	private static final long serialVersionUID = -4178579272736460979L;
	private int reservationNumber;
	private int reimCheckNumber;
	private int borrowCheckNumber;
	private List<AssessorOperationRecord> operationRecords;
	public int getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(int reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public int getReimCheckNumber() {
		return reimCheckNumber;
	}
	public void setReimCheckNumber(int reimCheckNumber) {
		this.reimCheckNumber = reimCheckNumber;
	}
	public int getBorrowCheckNumber() {
		return borrowCheckNumber;
	}
	public void setBorrowCheckNumber(int borrowCheckNumber) {
		this.borrowCheckNumber = borrowCheckNumber;
	}
	public List<AssessorOperationRecord> getOperationRecords() {
		return operationRecords;
	}
	public void setOperationRecords(List<AssessorOperationRecord> operationRecords) {
		this.operationRecords = operationRecords;
	}
	
}
