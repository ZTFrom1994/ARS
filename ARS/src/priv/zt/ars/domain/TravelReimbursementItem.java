package priv.zt.ars.domain;

import java.io.Serializable;

public class TravelReimbursementItem implements Serializable{

	private static final long serialVersionUID = 616673886625278483L;
	private int id;
	private int traId;
	private String largeClass;
	private String smallClass;
	private int peopleNumber;
	private float singlePrice;
	private int sheetNumber;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTraId() {
		return traId;
	}
	public void setTraId(int traId) {
		this.traId = traId;
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
	public int getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public float getSinglePrice() {
		return singlePrice;
	}
	public void setSinglePrice(float singlePrice) {
		this.singlePrice = singlePrice;
	}
	public int getSheetNumber() {
		return sheetNumber;
	}
	public void setSheetNumber(int sheetNumber) {
		this.sheetNumber = sheetNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
