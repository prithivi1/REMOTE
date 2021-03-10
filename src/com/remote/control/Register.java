package com.remote.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.StatusDAO;
import com.remote.dao.UserDAO;
import com.remote.model.UserModel;
import com.remote.util.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
		    try {
                // check email already exists in database
		    	System.out.println("fsdsfs"+ UserDAO.getStudentByEmail(email));
				if(UserDAO.getStudentByEmail(email).getName()==null){
					HashPassword hashPassword = new HashPassword();
					String hashedPassword = hashPassword.signup(password);
					UserModel user = new UserModel();
					
					user.setName(name);
					user.setEmail(email);
					user.setPassword(hashedPassword);
					
					// check data saved
					if(UserDAO.save(user)>0){
						StatusDAO.createTable(email, name);
						StatusDAO.createAttendanceTable(email, name);
						session.setAttribute("user", user);
						StatusDAO.makestatusOnline(email);
						out.print("success");
					}
					else{
						out.print("error");
					}	
				}
				else{
					out.print("error");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
