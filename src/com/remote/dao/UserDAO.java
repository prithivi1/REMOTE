package com.remote.dao;

import com.remote.util.*; 
import com.remote.model.*;

import java.io.*;
import java.io.FileInputStream;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;


public class UserDAO {
	
	// Save new User
	public static int save(UserModel user){
		int status = 0;
		try{
			Connection con= DBConnection.getConnection();
			String query = "insert into users(name,email,password) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			status = ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	// Update details
	public static int update(UserModel user){
		System.out.println(user.getEmail());
		int status = 0;
		try{
			Connection con= DBConnection.getConnection();
			String query = "update users set reg_no=?,name=?,gender=?,dept=?,phone_number=? where email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getRegNo());
			ps.setString(2, user.getName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getDept());
			ps.setString(5, user.getPhoneNumber());
			ps.setString(6, user.getEmail());
			status = ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	// Delete user
	public static int delete(String reg_no){
		int status = 0;
		try{
			Connection con= DBConnection.getConnection();
			String query = "delete from users where reg_no=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, reg_no);
			status = ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	// Get all users
	public static List<UserModel> getAllStudents(){
		List<UserModel> students = new ArrayList<UserModel>();
		try{
			System.out.println("hellllllllloooooooo");
			
			Connection con= DBConnection.getConnection();
			String query = "select * from users";
			System.out.println(query);
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				UserModel user = new UserModel();
				user.setRegNo(rs.getString("reg_no"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setDept(rs.getString("dept"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setIswhitelist(rs.getInt("iswhitelist"));
//				user.setProfilePicture(rs.getString("profile_picture"));
				user.setIsAdmin(rs.getInt("isAdmin"));
				students.add(user);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return students;
	}
	
	// Get student by register number
	public static UserModel getStudentByRegNo(String reg_no){
		UserModel student = new UserModel();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from users where reg_no=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,reg_no);
			ResultSet rs = ps.executeQuery();
			
			student.setRegNo(rs.getString("reg_no"));
			student.setName(rs.getString("name"));
			student.setEmail(rs.getString("email"));
			student.setDept(rs.getString("dept"));
			student.setGender(rs.getString("gender"));
			student.setPhoneNumber(rs.getString("phone_number"));
			student.setIswhitelist(rs.getInt("iswhitelist"));
//			student.setProfilePicture(rs.getString("profile_picture"));
			student.setIsAdmin(rs.getInt("isAdmin"));
		}
		catch(Exception e){
			System.out.println(e);
		}
		return student;
	}
	
	// Get student by register number
		public static UserModel getStudentByEmail(String email){
			UserModel student = new UserModel();
			try{
				Connection con= DBConnection.getConnection();
				String query = "select * from users where email=?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1,email);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					student.setRegNo(rs.getString("reg_no"));
					student.setName(rs.getString("name"));
					student.setEmail(rs.getString("email"));
					student.setPassword(rs.getString("password"));
					student.setDept(rs.getString("dept"));
					student.setGender(rs.getString("gender"));
					student.setPhoneNumber(rs.getString("phone_number"));
					student.setIswhitelist(rs.getInt("iswhitelist"));
//					student.setProfilePicture(rs.getBytes("profile_picture"));
					student.setIsAdmin(rs.getInt("isAdmin"));
				}
				System.out.println("-------------->  "+student.getEmail());
			}
			catch(Exception e){
				System.out.println(e);
			}
			return student;
		}
	
//	// Get students by Dept
//	public static UserModel getStudentsByDept(String dept){
//		UserModel student = new UserModel();
//		try{
//			Connection con= DBConnection.getConnection();
//			String query = "select * from users where user_id=?";
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setInt(1,id);
//			ResultSet rs = ps.executeQuery();
//			
//			student.setUserId(rs.getInt("user_id"));
//			student.setEmail(rs.getString("email"));
//			student.setName(rs.getString("name"));
//			student.setRegNo(rs.getString("reg_no"));
//			student.setProfilePicture(rs.getString("profile_picture"));
//			
//		}
//		catch(Exception e){
//			System.out.println(e);
//		}
//		return student;
//	}
	
}
