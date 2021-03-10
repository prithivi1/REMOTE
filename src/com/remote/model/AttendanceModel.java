package com.remote.model;

public class AttendanceModel {
	private String name;
	private String email;
	private int attendence_count;
	
	public AttendanceModel() {
		super();
	}

	public AttendanceModel(String email,int attendence_count) {
		super();
		this.email = email;
		this.attendence_count = attendence_count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAttendenceCount(int attendence_count) {
		this.attendence_count = attendence_count;
	}
	
	public int getAttendenceCount() {
		return attendence_count;
	}
}
