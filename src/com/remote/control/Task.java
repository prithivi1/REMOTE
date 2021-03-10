package com.remote.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.TaskDAO;
import com.remote.util.DBConnection;

/**
 * Servlet implementation class Task
 */
@WebServlet("/Task")
public class Task extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Task() {
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
	    Connection con = DBConnection.getConnection();
	    int status=0;
		
	    try{
			if(action.equalsIgnoreCase("delete")){
				String name = request.getParameter("name").trim();
				PreparedStatement ps = con.prepareStatement("DELETE FROM `tasktable` WHERE taskname = ?");
			    ps.setString(1, name);
			    status = ps.executeUpdate();
		        response.sendRedirect("admin_task.jsp");
			}
			else if(action.equalsIgnoreCase("update"))
			{
				String taskname = request.getParameter("taskname");
				String date = request.getParameter("date");
				String type = request.getParameter("type");
				String assigned = request.getParameter("assigned");
				String hours = request.getParameter("hours");
				String fromTime = request.getParameter("fromTime");
				String toTime = request.getParameter("toTime");
				String link = request.getParameter("link");
				
				TaskDAO.updateTask(taskname,date,type,assigned,hours,fromTime,toTime, link);
				response.sendRedirect("admin_task.jsp");
			}
		} catch (Exception e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
	}

}
