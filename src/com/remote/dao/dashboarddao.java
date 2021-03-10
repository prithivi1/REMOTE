package com.remote.dao;

import java.sql.*;
import java.util.*;
import com.remote.model.*;
import com.remote.util.DBConnection;

public class dashboarddao {
	public static void updateboard(String Mailid,String Name,String Month,int week1,int week2,int week3,int week4,int avg)
	{
		try
		{
			System.out.println("connection established");
			Connection con = DBConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("insert into dashboard values(?,?,?,?,?,?,?,?)");
			
			ps.setString(1,Mailid);
			ps.setString(2,Name);
			ps.setString(3,Month);
			ps.setInt(4,week1);
			ps.setInt(5,week2);
			ps.setInt(6,week3);
			ps.setInt(7,week4);
			ps.setInt(8,avg);
			ps.executeUpdate();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	public static int calculateavg()
	{
		int week1=0;
		int week2=0;
		int week3=0;
		int week4=0;
		int avg = 0;
		try
		{
			Connection con = DBConnection.getConnection();
			
			String query = "select * from dashboard where Mailid = ?";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				 week1 = rs.getInt("week1");
				 week2 = rs.getInt("week2");
				 week3 = rs.getInt("week3");
				 week4 = rs.getInt("week4");
			}
			 avg = (week1+week2+week3+week4)/4;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return avg;
	}
	public static List<Dashmodel> getAllMarks()
	{
		List<Dashmodel> dboard = new ArrayList<Dashmodel>();
		try
		{
			Connection con = DBConnection.getConnection();
			String query = "select * from dashboard ORDER BY avg DESC";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Dashmodel dmodel = new Dashmodel();
				dmodel.setMailid(rs.getString("Mailid"));
				dmodel.setName(rs.getString("Name"));
				dmodel.setWeek1(rs.getInt("week1"));
				dmodel.setWeek2(rs.getInt("week2"));
				dmodel.setWeek3(rs.getInt("week3"));
				dmodel.setWeek4(rs.getInt("week4"));
				dmodel.setAvg(rs.getInt("avg"));
				dmodel.setRank(rs.getInt("rank"));
				dboard.add(dmodel);
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return dboard;
	}
	
	public static List<Dashmodel> getMyMark(String email){
		List<Dashmodel> dboard = new ArrayList<Dashmodel>();
		try
		{
			Connection con = DBConnection.getConnection();
			String query = "select * from dashboard WHERE Mailid = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Dashmodel dmodel = new Dashmodel();
				dmodel.setMailid(rs.getString("Mailid"));
				dmodel.setName(rs.getString("Name"));
				dmodel.setWeek1(rs.getInt("week1"));
				dmodel.setWeek2(rs.getInt("week2"));
				dmodel.setWeek3(rs.getInt("week3"));
				dmodel.setWeek4(rs.getInt("week4"));
				dmodel.setAvg(rs.getInt("avg"));
				dmodel.setRank(rs.getInt("rank"));
				dboard.add(dmodel);
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return dboard;
	}
	
//	public static int totalavg()
//	{
//		int tavg=0;
//		int count=0;
//		try
//		{
//			Connection con = Database.getConnection();
//			
//			String query = "select * from dashboard where Mailid=?";
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(query);
//			while(rs.next())
//			{
//				tavg+= rs.getInt("avg");
//				count++;
//			}
//		}
//		catch(Exception e tavg/count)
//		{
//			System.out.println(e.getMessage());
//		}
//		return;
//	}
}
