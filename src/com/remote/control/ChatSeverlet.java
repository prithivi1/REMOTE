package com.remote.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.ChatDAO;
import com.remote.model.ChatModel;
import com.remote.model.UserModel;

/**
 * Servlet implementation class ChatSeverlet
 */
@WebServlet("/ChatSeverlet")
public class ChatSeverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatSeverlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 response.setContentType("text/html");
	     PrintWriter out=response.getWriter();

	     String s1=request.getParameter("msg");
	     if(!s1.equals(""))
	     {
		     HttpSession session = request.getSession();
		     UserModel user = (UserModel)session.getAttribute("user");
		     ChatModel model = new ChatModel();
		     model.setEmail(user.getEmail());
		     model.setUsername(user.getName());
		     model.setMessage(s1);
		     if(!s1.equals(""))
		     {
		    	 ChatDAO.clientSide(model);
		     }
	     } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
