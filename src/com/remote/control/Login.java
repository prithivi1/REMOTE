package com.remote.control;
  
import java.io.IOException;  
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.model.*;
import com.remote.util.*;
import com.remote.dao.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		System.out.println(email);
		HttpSession session = request.getSession();
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
		try {
			
			// check user exists in database
			UserModel user = UserDAO.getStudentByEmail(email);
			System.out.println("user-> "+user);
			if(user.getName()!=null) {
				// user exists
				String	dbPassword = user.getPassword();
				HashPassword hashPassword = new HashPassword();
				boolean isAuthenticated = hashPassword.login(password,dbPassword);
				System.out.println(isAuthenticated);
				// check user is whitelisted
				if(user.getIswhitelist()==1){
					out.println("whitelist");
				}
				else
				{
					if(isAuthenticated==true){
						response.setContentType("text/html"); 
						session.setAttribute("user", user);
						
						StatusDAO.makestatusOnline(email);
						
						// check user is admin
						if(user.getIsAdmin()==1){
							out.println("admin");
//							response.sendRedirect("admin_home.jsp");
						}
						else{
//							response.sendRedirect("remote_home.jsp");
							out.println("user");
							}
					}
					else{
						out.println("error");
					}
				}
			}
		  else{
				// user not exists
//					session.setAttribute("err","Invalid Credentials");
//					response.sendRedirect("index.jsp");
			out.println("error");
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
