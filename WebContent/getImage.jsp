<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List,java.util.ArrayList,com.remote.model.*,com.remote.dao.*,com.remote.util.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

//UserModel user =(UserModel) session.getAttribute("user");
String email = (String)request.getParameter("email");
System.out.println("picture--->"+email);
try{
	Connection con = DBConnection.getConnection();
	PreparedStatement ps = con.prepareStatement("select * from users where email=?");
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();
 
	    if(rs.next()){
	        Blob blob = rs.getBlob("profile_picture");
	        byte byteArray[] = blob.getBytes(1, (int)blob.length());
	        response.setContentType("image/gif");
	        OutputStream os = response.getOutputStream();
	        os.write(byteArray);
	        os.flush();
	   }
}
catch(Exception e){
    e.printStackTrace();
}

%>