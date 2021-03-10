package com.remote.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.remote.util.DBConnection;

/**
 * Servlet implementation class Schedule
 */
@WebServlet("/Schedule")
public class Schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Schedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		String h1 = request.getParameter("h1");
		String h1f= request.getParameter("h1fromTime");
		String h1t = request.getParameter("h1toTime");
		
		String h2 = request.getParameter("h2");
		String h2f= request.getParameter("h2fromTime");
		String h2t = request.getParameter("h2toTime");

		String h3 = request.getParameter("h3");
		String h3f= request.getParameter("h3fromTime");
		String h3t = request.getParameter("h3toTime");

		String h4 = request.getParameter("h4");
		String h4f= request.getParameter("h4fromTime");
		String h4t = request.getParameter("h4toTime");

		try{
				Connection con = DBConnection.getConnection();
				
				String Query1 = "UPDATE `schedule` SET `subject`= '"+h1+"',`fromtime`= '"+h1f+"' ,`totime`= '"+h1t+"' WHERE hour='hour1'";
				String Query2 = "UPDATE `schedule` SET `subject`= '"+h2+"',`fromtime`= '"+h2f+"',`totime`= '"+h2t+"' WHERE hour= 'hour2'";
				String Query3 = "UPDATE `schedule` SET `subject`='"+h3+"',`fromtime`= '"+h3f+"',`totime`= '"+h3t+"' WHERE hour='hour3'";
				String Query4= "UPDATE `schedule` SET `subject`= '"+h4+"',`fromtime`= '"+h4f+"',`totime`= '"+h4t+"' WHERE hour='hour4'";
				
				Statement s1 = (Statement) con.createStatement();
				int a = s1.executeUpdate(Query1);
				
				Statement s2 = (Statement) con.createStatement();
				 a = s2.executeUpdate(Query2);
				
				Statement s3 = (Statement) con.createStatement();
					 a = s3.executeUpdate(Query3);
					
				Statement s4 = (Statement) con.createStatement();
					 a = s4.executeUpdate(Query4);
			
				con.close();
				
				response.sendRedirect("admin_schedule.jsp");
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
