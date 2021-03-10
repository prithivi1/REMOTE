package com.remote.control;


import java.io.IOException; 
import java.sql.*;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.remote.dao.*;
import com.remote.model.*;
import com.remote.util.DBConnection;

/**
 * Servlet implementation class Whitelist
 */
@WebServlet("/Whitelist")
public class Whitelist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Whitelist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String action = request.getParameter("action");
		HttpSession session=request.getSession();
		String email = request.getParameter("email").trim();
	    Connection con = DBConnection.getConnection();
	    int status=0;
		try{
			if(action.equalsIgnoreCase("delete")){
				PreparedStatement ps = con.prepareStatement("update users set iswhitelist=0 where email=?");
			    ps.setString(1, email);
			    status = ps.executeUpdate();
		        response.sendRedirect("admin_whitelist.jsp");
			}
			else if(action.equalsIgnoreCase("add")){
				PreparedStatement ps = con.prepareStatement("update users set iswhitelist=1 where email=?");
			    ps.setString(1, email);
			    status = ps.executeUpdate();
		        response.sendRedirect("admin_whitelist.jsp");
		        
			}
			} catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
