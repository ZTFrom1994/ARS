package priv.zt.ars.domain;

import java.io.Serializable;

public class DailyReimbursementItem implements Serializable {
	private static final long serialVersionUID = -2160052122861647847L;
	private int id;
	private int draId;
	private String largeClass;
	private String smallClass;
	private String name;
	private int number;
	private float total;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDraId() {
		return draId;
	}
	public void setDraId(int draId) {
		this.draId = draId;
	}
	public String getLargeClass() {
		return largeClass;
	}
	public void setLargeClass(String largeClass) {
		this.largeClass = largeClass;
	}
	public String getSmallClass() {
		return smallClass;
	}
	public void setSmallClass(String smallClass) {
		this.smallClass = smallClass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
