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
			UserModel user = (UserModel)session.getAttribute("user");
	  		String	mailid = user.getEmail();
			List<ChatModel> list = ChatDAO.getAllMessages(); 
			for(ChatModel i:list)
			{
				if(!mailid.equals(i.getEmail()))
				{%>
					<div class="bot-inbox inbox">
						<div class="icon">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
						<div class="msg-header">
							<p><span style="color: black;float: left;"><%=i.getUsername() %></span><br><%= i.getMessage() %></p>
						</div>
					</div>
			<%}else{ %>
					<div class="user-inbox inbox">
						<div class="msg-header" id="user-mes">
							<p><%=i.getMessage() %></p>
						</div>
					</div>
			<%}} %>     
</body>
</html>