package com.remote.dao;

import com.remote.model.*;
import com.remote.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StatusDAO {
	
	public static void createTable(String mailid,String name)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "INSERT INTO `status`(`mailid`, `name`) VALUES (?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, mailid);
			pst.setString(2, name);
			result = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void createAttendanceTable(String mailid,String name)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "INSERT INTO `attendance`(`name`,`email`) VALUES (?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, mailid);
			result = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
	public static void makestatusOnline(String mailid)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `status` SET `online`= 1, `job` = 'online'  WHERE mailid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, mailid);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static void makestatusOffline(String mailid)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `status` SET `online`= 0, `job` = 'offline' WHERE mailid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, mailid);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
		
	public static List<StatusModel> getAllStudentsOnline(){
		List<StatusModel> students = new ArrayList<StatusModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from status where online = 1";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				StatusModel user = new StatusModel();
				user.setEmail(rs.getString("mailid"));
				user.setName(rs.getString("name"));
				user.setDepartment(rs.getString("department"));
				user.setJob(rs.getString("job"));
				students.add(user);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return students;
	}
	
	public static List<StatusModel> getAllStudentsOffline(){
		List<StatusModel> students = new ArrayList<StatusModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from status where online = 0";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				StatusModel user = new StatusModel();
				user.setEmail(rs.getString("mailid"));
				user.setName(rs.getString("name"));
				user.setDepartment(rs.getString("department"));
				user.setJob(rs.getString("job"));
				students.add(user);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return students;
	}
	
	public static void makeStudentAtTea(String email)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `status` SET `job`= 'tea' WHERE mailid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static void makeStudentAtLunch(String email)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `status` SET `job`= 'lunch' WHERE mailid = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
