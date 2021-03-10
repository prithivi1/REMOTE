<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List,java.sql.*,com.remote.model.*" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title></title>
   </head>
   <body>
      <h1>Attendance</h1>
      <table cellpadding="1"  cellspacing="1" border="1" bordercolor="gray">
         <tr>
         	<td>Name</td>
            <td>Email</td>
            <td>Status</td>
         </tr>
         <%
                 List<AttendanceModel> students =(List<AttendanceModel>) request.getAttribute("attendence");

                  if (students!=null) {
                      response.setContentType("application/vnd.ms-excel");
                      response.setHeader("Content-Disposition", "inline; filename="+ "attendenceReport.xls");
                  }
            %>
            <%for(AttendanceModel i:students){ %>
         <tr>
         	<td><%=i.getName() %></td>
            <td><%=i.getEmail()%></td>
            <%if(i.getAttendenceCount()>4){ %>
            <td>Present</td>
            <%}else{ %>
            <td>Absent</td>
         </tr>
         <%} }%>
      </table>
   </body>
</html>