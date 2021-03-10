package com.remote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.remote.model.ScheduleModel;
import com.remote.model.TaskModel;
import com.remote.util.DBConnection;

public class TaskDAO {
	
	public static List<TaskModel> getAllTask()
	{
		List<TaskModel> t = new ArrayList<TaskModel>();
		try{ 
			Connection con = DBConnection.getConnection();
			Statement statement=con.createStatement();
			String sql ="SELECT * FROM tasktable ORDER BY date";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				TaskModel task = new TaskModel();
				task.setTaskname(resultSet.getString("taskname"));
				task.setDate(resultSet.getString("date"));
				task.setType(resultSet.getString("type"));
				task.setAssigned(resultSet.getString("assigned"));
				task.setHours(resultSet.getString("hours"));
				task.setFromTime(resultSet.getString("fromTime"));
				task.setToTime(resultSet.getString("toTime"));
				task.setLink(resultSet.getString("link"));
				t.add(task);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	public static List<TaskModel> getRecent()
	{

		List<TaskModel> t = new ArrayList<TaskModel>();
		try{ 
			Connection con = DBConnection.getConnection();
			Statement statement=con.createStatement();
			String sql ="SELECT * FROM tasktable ORDER BY date LIMIT 10";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				TaskModel task = new TaskModel();
				task.setTaskname(resultSet.getString("taskname"));
				task.setDate(resultSet.getString("date"));
				task.setType(resultSet.getString("type"));
				task.setAssigned(resultSet.getString("assigned"));
				task.setHours(resultSet.getString("hours"));
				task.setFromTime(resultSet.getString("fromTime"));
				task.setToTime(resultSet.getString("toTime"));
				task.setLink(resultSet.getString("link"));
				t.add(task);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static void updateTask(String taskname,String date,String type,String assign,String hour,String ftime,String tTime,String link){
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "INSERT INTO `tasktable`(`taskname`, `date`, `type`, `assigned`, `hours`, `fromTime`, `toTime`, `link`) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, taskname);
			pst.setString(2, date);
			pst.setString(3, type);
			pst.setString(4, assign);
			pst.setString(5, hour);
			pst.setString(6, ftime);
			pst.setString(7, tTime);
			pst.setString(8, link);
			result = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static List<ScheduleModel> getAllSchedule()
	{
		List<ScheduleModel> t = new ArrayList<ScheduleModel>();
		try{ 
			Connection con = DBConnection.getConnection();
			Statement statement=con.createStatement();
			String sql ="SELECT * FROM schedule";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				ScheduleModel task = new ScheduleModel();
				task.setSubject(resultSet.getString("subject"));
				task.setFromTime(resultSet.getString("fromtime"));
				task.setToTime(resultSet.getString("totime"));
				t.add(task);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
}
