package com.remote.model;

public class Dashmodel {
	private String Mailid;
	private String Name;
	private int week1;
	private int week2;
	private int week3;
	private int week4;
	private int avg;
	private int Rank;
	
	
	public String getMailid() {
		return Mailid;
	}
	public void setMailid(String mailid) {
		Mailid = mailid;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getWeek1() {
		return week1;
	}
	public void setWeek1(int week1) {
		this.week1 = week1;
	}
	public int getWeek2() {
		return week2;
	}
	public void setWeek2(int week2) {
		this.week2 = week2;
	}
	public int getWeek3() {
		return week3;
	}
	public void setWeek3(int week3) {
		this.week3 = week3;
	}
	public int getWeek4() {
		return week4;
	}
	public void setWeek4(int week4) {
		this.week4 = week4;
	}
	public int getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	public int getRank() {
		return Rank;
	}
	public void setRank(int rank) {
		Rank = rank;
	}

}
