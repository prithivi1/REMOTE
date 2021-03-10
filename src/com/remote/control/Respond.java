package com.remote.control;

import java.io.IOException; 
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.remote.dao.RequestDAO;
import com.remote.util.*;;

/**
 * Servlet implementation class Respond
 */
@WebServlet("/Respond")
public class Respond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Respond() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		System.out.println(action);
		System.out.println(requestId);
		String email="";
		
		// Get email of requested user
		try{
			Connection con = DBConnection.getConnection();
			String query = "select * from requesttable where requestId=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,requestId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				email=rs.getString("email");
			}
		
		}
		catch(Exception e){
			System.out.println(e);
		}
		System.out.println("email --->> "+email);
		
		if(action.equals("accept")){
			SendMail.successMail(email);
		    RequestDAO.makestatusDone(requestId);
		}
		else if(action.equals("deny")){
			SendMail.denyMail(email);
		    RequestDAO.makestatusDone(requestId);
		}
		response.sendRedirect("admin_request.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
//		String email = request.getParameter("email");
//		if (request.getParameter("btn_accept") != null) {
//			SendMail.successMail(email);
//		    RequestDAO.makestatusDone(email);
//		} else if (request.getParameter("btn_deny") != null) {
//			SendMail.denyMail(email);
//		    RequestDAO.makestatusDone(email);
//		}
//		request.getRequestDispatcher("/admin_request.jsp").forward(request, response);
	}

}
