package com.remote.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Demo4
 */
@WebServlet("/Demo4")
public class Demo4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Demo4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("get method");
		  response.setContentType("text/html");
	      PrintWriter out=response.getWriter();

	        String s1=request.getParameter("msg");

	        if(!s1.equals(""))
	        {
	            try
	            {
	                s1=s1+"%";

	                Class.forName("com.mysql.jdbc.Driver");
	                Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/check","root","1234");

	                String query="select ename from employee where ename like ?";
	                PreparedStatement st=con.prepareStatement(query);

	                st.setString(1,s1);
	                ResultSet rs=st.executeQuery();
	                String val="";
	                while(rs.next())
	                {
	                    val=val+"  "+rs.getString("ename");
	                }
	                out.println("<h1>"+val+"</h1>");
	                
	                if(val==""){

	                    out.println("<h3>Match Not Found</h3>");
	                }
	                con.close();
	             }
	            catch(Exception e)
	            {
	                out.println("     "+e);
	            }
	        }
	      out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
