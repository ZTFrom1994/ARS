package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable{
	private static final long serialVersionUID = -4559036495893547645L;
	private int id;
	private int object;
	private String Content;
	private String State;
	private String type;
	private Admin admin;
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	private Date date;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getObject() {
		return object;
	}
	public void setObject(int object) {
		this.object = object;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
