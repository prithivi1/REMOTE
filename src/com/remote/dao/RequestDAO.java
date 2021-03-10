package com.remote.dao;

import java.util.*;
import java.sql.*;

import com.remote.model.*;
import com.remote.util.DBConnection;

public class RequestDAO {
	public static List<RequestModel> getAllRequest()
	{
		List<RequestModel> students = new ArrayList<RequestModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from requesttable where status = 0";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				RequestModel user = new RequestModel();
				user.setRequestId(rs.getInt("requestId"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setDepartment(rs.getString("department"));
				user.setPurpose(rs.getString("purpose"));
				user.setFromDate(rs.getString("fromDate"));
				user.setToDate(rs.getString("toDate"));
				user.setReason(rs.getString("reason"));
				System.out.println(user);
				students.add(user);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return students;
	}
	
	
	
	/// delete with id bug
	public static void makestatusDone(int id)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `requesttable` SET `status`= 1 WHERE requestId = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static void deleteRequest(int id)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "DELETE FROM `requesttable`  WHERE requestId = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
