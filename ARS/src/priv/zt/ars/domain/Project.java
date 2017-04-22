package priv.zt.ars.domain;

import java.io.Serializable;

public class Project implements Serializable{
	
	private static final long serialVersionUID = -7621366409628991507L;
	private int id;
	private String projectName;
	private String department;
	private Staff  principal;
	private float reimburseLimit;
	private float balance;
	private String state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Staff getPrincipal() {
		return principal;
	}
	public void setPrincipal(Staff principal) {
		this.principal = principal;
	}
	public float getReimburseLimit() {
		return reimburseLimit;
	}
	public void setReimbuseLimit(float reimburseLimit) {
		this.reimburseLimit = reimburseLimit;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
