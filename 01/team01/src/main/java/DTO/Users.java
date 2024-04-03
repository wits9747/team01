package DTO;

import java.util.Date;

public class Users {
	
	private Number user_num;
	private Number user_level;
	private String id;
	private String password;
	private String name;
	private String address;
	private String birth;
	private String phone;
	private Date joinDate;
	private Date regDate;
	private Date updDate;
	
	
	
	
	public Users() {
	}

	
	
	public Users(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	public Users(String id, String password, String name, String address, String birth, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birth = birth;
		this.phone = phone;
	}

	public Number getUser_num() {
		return user_num;
	}

	public void setUser_num(Number user_num) {
		this.user_num = user_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdDate() {
		return updDate;
	}

	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}

	
	
	public Number getUser_level() {
		return user_level;
	}

	public void setUser_level(Number user_level) {
		this.user_level = user_level;
	}



	@Override
	public String toString() {
		return "Users [user_num=" + user_num + ", user_level=" + user_level + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", address=" + address + ", birth=" + birth + ", phone=" + phone + ", joinDate="
				+ joinDate + ", regDate=" + regDate + ", updDate=" + updDate + "]";
	}

	
	
	
	
	
	


	
	
	
}
