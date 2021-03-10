<%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*,com.remote.util.*"%>


<%
	UserModel user = (UserModel)session.getAttribute("user");
	
	String email="";
	email=user.getEmail();
	StatusDAO.makestatusOffline(email);
	session.invalidate();
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setDateHeader("Expires", 0);
	response.sendRedirect("index.jsp");
%>
