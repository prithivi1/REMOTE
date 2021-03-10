<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List,java.util.ArrayList,com.remote.model.*,com.remote.dao.*,com.remote.util.*"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%@page import="java.sql.*"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<%

String id = request.getParameter("id");
System.out.println(id);
try{
	Connection con = DBConnection.getConnection();
	PreparedStatement ps = con.prepareStatement("select * from files where id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
 
	    if(rs.next()){
	        Blob blob = rs.getBlob("file");
	        byte byteArray[] = blob.getBytes(1, (int)blob.length());
	        response.setContentType("application/pdf");
	        OutputStream os = response.getOutputStream();
	        os.write(byteArray);
	        os.flush();
	   }
}
catch(Exception e){
    e.printStackTrace();
}

%>