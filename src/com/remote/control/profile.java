package com.remote.control;

import java.io.IOException;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.*;
import com.remote.dao.UserDAO;
import com.remote.model.UserModel;

/**
 * Servlet implementation class profile
 */
@WebServlet("/profile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profile() {
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
    	
//    	String name = request.getParameter("name");
//    	String gender  = request.getParameter("gender");
//    	String dept = request.getParameter("dept");
//    	
//    	System.out.println(name);
//    	System.out.println(gender);
//    	System.out.println(dept);
    	
        try {
        	
//            //get id from session
        	response.setContentType("text/html");   
              
            HttpSession session=request.getSession();  
            UserModel newUser = (UserModel) session.getAttribute("user");
//            String path = request.getServletContext().getRealPath("");
//            
            System.out.println("<<<<<<<      "+newUser.getName());
            newUser.setName(request.getParameter("name"));
            newUser.setRegNo(request.getParameter("regno"));
            newUser.setGender(request.getParameter("gender"));
            newUser.setDept(request.getParameter("dept"));
            newUser.setPhoneNumber(request.getParameter("ph_no"));

            if (UserDAO.update(newUser)> 0) { 
                newUser.setPassword("");
                session.setAttribute("user", newUser);

                session.setAttribute("msg", "update user info Successfully");
//                doGet(request,response);
                
                if(newUser.getIsAdmin()==1)
                {
                	response.sendRedirect("admin_profile.jsp");
                }else{
                	response.sendRedirect("remote_profile.jsp");
                }
            } else {
                session.setAttribute("msg", "Error in updating user profile");
                if(newUser.getIsAdmin()==1)
                {
                	response.sendRedirect("admin_profile.jsp");
                }else{
                	response.sendRedirect("remote_profile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

	
	}

}
