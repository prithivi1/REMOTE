package com.remote.dao;

import java.sql.*;
import java.util.*;

import com.remote.model.*;
import com.remote.util.*;
public class ToDoListDAO {

	// Save new task
	public static int save(ToDoListModel task){
		int status = 0;
		try{
			Connection con= DBConnection.getConnection();
			String query = "insert into todolist(email,task_name,date) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, task.getUserEmail());
			ps.setString(2, task.getTaskName());
			ps.setDate(3, task.getDate());
			status = ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	// Delete task
	public static int delete(int task_id){
		int status = 0;
		try{
			Connection con= DBConnection.getConnection();
			String query = "delete from todolist where task_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, task_id);
			status = ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	// Get all tasks for a user
	public static List<ToDoListModel> getAllToDoOfUser(String email){
		List<ToDoListModel> all_tasks = new ArrayList<ToDoListModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from todolist where email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ToDoListModel task = new ToDoListModel();
				task.setTaskId(rs.getInt("task_id"));
				task.setTaskName(rs.getString("task_name"));
				task.setDate(rs.getDate("date"));
				all_tasks.add(task);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return all_tasks;
	}	
}
