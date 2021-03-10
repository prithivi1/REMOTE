package com.remote.control;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.ha.backend.Sender;

import com.remote.dao.UserDAO;
import com.remote.model.UserModel;
import com.remote.util.DBConnection;
import com.remote.util.GenerateOTP;
import com.remote.util.HashPassword;
import com.remote.util.SendMail;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if(action.equalsIgnoreCase("sendotp"))
		{
			String email = request.getParameter("email");
			UserModel user = UserDAO.getStudentByEmail(email);
			if(!user.equals(null))
			{
				String otp = GenerateOTP.Password(6);
				session.setAttribute("email", email);
				session.setAttribute("otp", otp);
				SendMail.sendOTP(email,otp);
				response.sendRedirect("enterOTP.jsp");
			}else{
				response.sendRedirect("forgetpassword.jsp");
			}
		}else if(action.equalsIgnoreCase("validateotp")){
			String otp = (String) request.getParameter("otpvalue");
			String conotp = (String) session.getAttribute("otp");
			if(otp.equalsIgnoreCase(conotp))
			{
				response.sendRedirect("newPassword.jsp");
			}else{
				response.sendRedirect("forgetpassword.jsp");
			}
		}else if(action.equalsIgnoreCase("changepwd")){
			String newPassword = request.getParameter("pass");
			String confirmPassword = request.getParameter("conpass");
			int status = 0;
			if(newPassword.equals(confirmPassword)){
					HashPassword hashPassword = new HashPassword();
					String hashedPassword = hashPassword.signup(newPassword);
					try{
						Connection con= DBConnection.getConnection();
						String query = "update users set password=? where email=?";
						PreparedStatement ps = con.prepareStatement(query);
						ps.setString(1, hashedPassword);
						ps.setString(2, (String) session.getAttribute("email"));;
						status = ps.executeUpdate();
					}
					catch(Exception e){
						System.out.println(e);
					}
					if(status>0){
						System.out.println("Password Updated");
						session.removeAttribute("email");
						response.sendRedirect("index.jsp");
					}
					else{
						response.sendRedirect("forgetpassword.jsp");
					}
			}
			else{
				response.sendRedirect("forgetpassword.jsp");
			}
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
