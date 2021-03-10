package com.remote.model;

import java.sql.Date;

public class ToDoListModel {
	private String email;
	private int task_id;
	private String task_name;
	private Date date;
	
	public ToDoListModel() {
		super();
	}

	public ToDoListModel(int task_id, String email, String task_name, Date date) {
		super();
		this.task_id=task_id;
		this.email = email;
		this.task_name = task_name;
		this.date = date;
	}

	public int getTaskId(){
		return task_id;
	}
	public void setTaskId(int task_id){
		this.task_id=task_id;
	}
	
	public String getUserEmail() {
		return email;
	}

	public void setUserEmail(String email) {
		this.email = email;
	}
	
	public String getTaskName() {
		return task_name;
	}

	public void setTaskName(String task_name) {
		this.task_name = task_name;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date=(Date) date;
	}
}
