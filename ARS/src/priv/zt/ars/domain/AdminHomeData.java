package priv.zt.ars.domain;

import java.io.Serializable;

public class AdminHomeData implements Serializable{
	private static final long serialVersionUID = -9205362817311759532L;
	private int staffNumber;
	private int assessorNumber;
	private int adminNumber;
	private int disabledTotal;
	private int messageNumber;
	public int getStaffNumber() {
		return staffNumber;
	}
	public void setStaffNumber(int staffNumber) {
		this.staffNumber = staffNumber;
	}
	public int getAssessorNumber() {
		return assessorNumber;
	}
	public void setAssessorNumber(int assessorNumber) {
		this.assessorNumber = assessorNumber;
	}
	public int getAdminNumber() {
		return adminNumber;
	}
	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}
	public int getDisabledTotal() {
		return disabledTotal;
	}
	public void setDisabledTotal(int disabledTotal) {
		this.disabledTotal = disabledTotal;
	}
	public int getMessageNumber() {
		return messageNumber;
	}
	public void setMessageNumber(int messageNumber) {
		this.messageNumber = messageNumber;
	}
}
