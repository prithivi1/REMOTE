package com.remote.model;

public class RequestModel {
	private int id;
	private String name;
	private String email;
	private String department;
	private String purpose;
	private String fromdate;
	private String todate;
	private String reason;
	
	public int getRequestId() {
		return id;
	}
	public void setRequestId(int id) {
		this.id = id;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getFromDate() {
		return fromdate;
	}
	public void setFromDate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getToDate() {
		return todate;
	}
	public void setToDate(String todate) {
		this.todate = todate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}
