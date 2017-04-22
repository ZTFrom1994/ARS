package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class Admin implements Serializable{
	private static final long serialVersionUID = 7901640060819607091L;
	private int id;
	private String name;
	private String password;
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
	
}
