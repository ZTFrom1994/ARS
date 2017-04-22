package priv.zt.ars.domain;

import java.io.Serializable;

public class NoReadMessage implements Serializable{
	private static final long serialVersionUID = -1241558126654078726L;
	private int id;
	private int userType;
	private int userId;
	private Message message;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	
}
