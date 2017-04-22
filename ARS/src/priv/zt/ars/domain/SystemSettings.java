package priv.zt.ars.domain;

import java.io.Serializable;

public class SystemSettings implements Serializable{
	private static final long serialVersionUID = -7098406328003704807L;
	private String  dailyFunction;
	private String travelFunction;
	private String offsetFunction;
	private String borrowFunction;
	private int systemOpen;
	public int getSystemOpen() {
		return systemOpen;
	}

	public void setSystemOpen(int systemOpen) {
		this.systemOpen = systemOpen;
	}

	public void setDailyFunction(String dailyFunction) {
		this.dailyFunction = dailyFunction;
	}

	public void setTravelFunction(String travelFunction) {
		this.travelFunction = travelFunction;
	}

	public void setOffsetFunction(String offsetFunction) {
		this.offsetFunction = offsetFunction;
	}

	public void setBorrowFunction(String borrowFunction) {
		this.borrowFunction = borrowFunction;
	}

	public String getDailyFunction() {
		return dailyFunction;
	}

	public String getTravelFunction() {
		return travelFunction;
	}

	public String getOffsetFunction() {
		return offsetFunction;
	}

	public String getBorrowFunction() {
		return borrowFunction;
	}
}
