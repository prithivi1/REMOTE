package com.remote.model;

import com.mysql.jdbc.Blob;

public class UserModel {
	private String reg_no;
	private String name;
	private String email;
	private String password;
	private Blob profile_pic;
	private String phone_number;
	private String gender;
	private String dept;
	private int iswhitelist;
	private int isAdmin;


	public UserModel() {
		super();
	}

	public UserModel(String reg_no, String name, String password, String email, Blob profile_pic,String mob) {
		super();
		this.reg_no = reg_no;
		this.name = name;
		this.password = password;
		this.email = email;
		this.profile_pic = profile_pic;
		this.phone_number = mob;
	}

//	public int getUserId() {
//		return user_id;
//	}
//
//	public void setUserId(int user_id) {
//		this.user_id = user_id;
//	}
//	
	public String getRegNo() {
		return reg_no;
	}

	public void setRegNo(String reg_no) {
		this.reg_no = reg_no;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNumber() {
		return phone_number;
	}

	public void setPhoneNumber(String phone_number) {
		this.phone_number = phone_number;
	}

	public Blob getProfilePicture() {
		return profile_pic;
	}

	public void setProfilePicture(Blob profile_pic) {
		this.profile_pic = profile_pic;
	}
	

	public int getIswhitelist() {
		return iswhitelist;
	}

	public void setIswhitelist(int iswhitelist) {
		this.iswhitelist = iswhitelist;
	}
	
	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	
}
