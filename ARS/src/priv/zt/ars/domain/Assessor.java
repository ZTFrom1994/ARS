package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class Assessor implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3678899500088897630L;
	private int id;
	private String name;
	private String password;
	private String state;
	private String positionName;
	private String department;
	private int operationTimes;
	private Date registerDate;
	private String sex;
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getOperationTimes() {
		return operationTimes;
	}
	public void setOperationTimes(int operationTimes) {
		this.operationTimes = operationTimes;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
}
