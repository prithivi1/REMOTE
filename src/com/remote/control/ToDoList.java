package com.remote.control;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.ToDoListDAO;
import com.remote.model.ToDoListModel;
import com.remote.model.UserModel;

/**
 * Servlet implementation class ToDoList
 */
@WebServlet("/ToDoList")
public class ToDoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDoList() {
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
		UserModel user=  (UserModel) session.getAttribute("user");
		
		try{
			if(action!=null&&action.equalsIgnoreCase("delete")){
			    int task_id = Integer.parseInt(request.getParameter("taskId"));
			    ToDoListDAO.delete(task_id);
		        response.sendRedirect("remote_todo.jsp");
			}
			else{
				String taskName = request.getParameter("task_name").trim();
				ToDoListModel task = new ToDoListModel();
				task.setUserEmail(user.getEmail());
				task.setTaskName(taskName);
				ToDoListDAO.save(task);
				response.sendRedirect("remote_todo.jsp");
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
