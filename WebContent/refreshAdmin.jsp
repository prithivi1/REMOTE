<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
      //List<UserModel> usersOnline = UserDAO.getAllStudents();
    	

    	List<StatusModel> usersOnline = StatusDAO.getAllStudentsOnline();
    	List<StatusModel> usersOffline = StatusDAO.getAllStudentsOffline();
    	%>
	<div class="home">
            <div class="online">
              <h3 style="color: #777"><i style="color: green;font-size: 10px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i>  online<h3 style="color: #777;font-family:Arial"> (<%=usersOnline.size()%>)</h3></h3>
            </div>
            <div class="con">
              <table class="tab">
                <% for(StatusModel i : usersOnline){ %>
                <tr>
                  <td><%= i.getName() %></td>
                  <td><%= i.getJob() %></td>
                </tr>
         		<%} %>
              </table>
            </div>  
        </div>
        

        <div class="away">
            <div class="offline">
              <h3 style="color: #777"><i style="color: red;font-size: 12px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i> away<h3 style="color: #777;font-family:font-family:Arial;">(<%=usersOffline.size() %>)</h3></h3>
            </div>
            <div class="con">
              <table class="tab">
                <% for(StatusModel i : usersOffline){ %>
                <tr>
                  <td><%= i.getName() %></td>
                  <td style="padding-left:100px;"><%= i.getJob() %></td>
                </tr>
         		<%} %>
              </table>
            </div>
        </div>
        
        
        
        <div class="schedule">
            <div class="sch">
              <h3 style="color: #777"><i style="color: blue;font-size: 12px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i> schedule</h3>
            </div>
            <div class="con">
              <table class="tab">
                <%List<ScheduleModel> list = TaskDAO.getAllSchedule();
              	for(ScheduleModel i : list)
              	{
              	%>
                <tr>
                  <td><%=i.getSubject() %></td>
                  <td><%=i.getFromTime() %></td>
                  <td><%=i.getToTime() %></td>
                </tr>
                <%} %>
              </table>
              <div class="fun">
              <table class="tab">
                <tr>
                <td>set attendance</td>
                <td><a href="Attendence?action=setattendence" style="color:white;text-decoration:none;"><button>Set attendance</button></a></td>
                </tr>
                <tr>
                <td>generate csv</td>
                <td><a href="Attendence?action=getattendence" target="blank" style="color:white;text-decoration:none;"><button>Get attendance</button><br></a></td>
                </tr>
                <tr>
                <td>post result</td>
                <td>
                  <a href="page.jsp" style="color:white;text-decoration:none;"><button style="width:100%">Post results</button><br></a></form></td>
                </tr>
              </table>
				</div>
            </div>
        </div>
</body>
</html>