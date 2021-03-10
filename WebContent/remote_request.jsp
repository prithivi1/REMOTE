<%@page import="com.remote.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*,java.sql.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="ISO-8859-1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <title>Remote|Home</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">    
        <style type="text/css">
        
          body{
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #1b141a;
        }

        .header{
            display: inline-flex;
            flex-direction: row;
            height: 60px;
        }

        .topbar{
            display: flex;
            float: right;
            margin-left:30px;
            width: 600px;
        }

        .icons{
            padding-top: 20px;
            padding-right: 40px;
            position: relative;
            display: inline-block;
        }
        
        .icons .tooltiptext {
          width: 120px;
          margin-top: 25px;
          margin-left:  -75px; 
          background-color: transparent;
          color: #777;
          text-align: center;
          padding: 5px 0;      
          position: absolute;
          z-index: 1;
        }


        .icons .one{
            margin-right: 25px;
            background-color: transparent;
            border: none;
            outline: none;
            color: #777;
            cursor:pointer;
        }

      
        .one i{
            font-size: 30px;
            color: white;
        }

        .breaks{
            padding-top: 20px;
            padding-right: 20px;
        }

        .breaks .two{
            font-size: 15px;
            border-radius: 20px;
            outline: none;
            margin-right: 25px;
            margin-top: 15px;
        }

        .two:hover{
            background-color: #777;
        }

        .logo{
            margin-right: 680px;
            padding-top: 20px;
            padding-left: 23px;
            width: 100px;
            background-color: #1b141a;
        }
        
        .logoname{
        	display:flex;
        	vertical-align:middle;
    		
        }
        .text1{
            text-decoration: none;
            font-size:15px;
            color:white;
            margin: 15px 0 0 5px;
        }

        .logo i{
        	color:white;
            font-size: 30px;
        }
        
		.re{
		 	text-decoration:none;
		 }
		 
        .re:hover{
            color: red;
            transition: .5s;
            transform: scale3d(1.1,1.1,1.1);
        }

        .tablinks{
            margin-right: 20px;
        }

        .sidenav{
            position: relative;
            margin-top:20px;
        }

        #mySidenav a {
          position: absolute;
          left: -80px;
          transition: 0.5s;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          
        }
		
		#mySidenav i{
			float:right;
		}
		
		
        #mySidenav a:hover {
          left: 0;
        }
        
        
        
        #chat {
          top: 20px;
          background-color: #4CAF50;
          /*background-color: #99ddff ;*/
        }

		#attendance{
        	top:80px;
        	background-color: #99ddff;
        }
		
        #files {
          top: 200px;
          background-color: #f44336;
          /*background-color:  #33bbff;*/
        }

        #task {
          top: 260px;
          background-color: #555;
          /*background-color: #00aaff;*/
        }

        #todo{
          top: 320px;
          background-color:  #ff8000;
          /*background-color:  #0088cc;*/
        }

        #contact{
          top: 380px;
          background-color:  #800080;
          /*background-color: #005580;*/
        }
        
         #select{
          position: absolute;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          margin-top: 140px;
          background-color: #2196F3;
          color: white;
        }

        #request {
          color: white;
          text-decoration: none;
        }

        .content{
          width: 630px;
          height: 500px;
          background-color: #330033;
          /*background-color: white;*/
          margin-left: 170px;
          display: inline-block;
          border-radius: 5px;
          border: 2px solid #dedede;
        }

        label {
          display: inline-flex;
          flex-direction: row;
          justify-content: flex-start;
          margin-left: 50px;
          width: 400px;
          line-height: 26px;
          margin-bottom: 10px;
          font-weight: bold;
          padding-bottom: 20px;
          /*color: white;*/
        }

        input {
          height: 20px;
          flex: 0 0 200px;
          margin-left: -280px;
          background-color: white;
          border: none;
        }

        .requestform{ 
          margin-top: -30px;
          margin-left: 00px;
          width: 620px;
          background-color: transparent;
          border-bottom-right-radius: 30px;
          border-bottom-left-radius: 30px;
          color:white;
        }

        #requestButton{
          margin-left: 30px;
          padding: 10px;
          border-radius: 10px;
          outline: none;
          cursor: pointer;
        }
        
        .sent-items{
        	background:red;
        	width:300px;
        	color:white;
        	margin-left:880px;
        	margin-top:-450px;
        	
        }
        
        table {
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
          outline: none;
          border: none;
          border-top-left-radius:30px;
          border-top-right-radius:30px;
          color:black;
        }

        th {
          text-align: center;
          padding: 10px;
          height: 20px;
        }
        
        td{
        	 text-align: center;
        	padding:20px;
        }

        tr {
          background-color: #dddddd;
        }
		
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
                <a class="re" href="remote_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i><span class="text1">remote</span></a>
        </div>
        <div class="topbar">
            <div class="icons">
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   			</div>
            <div class="icons">
                <a href="remote_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
       <a href="remote_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="remote_dash.jsp" id="attendance">Dash<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="remote_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="remote_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="remote_todo.jsp" id="todo">To-do <i class="fa fa-list-ul" aria-hidden="true"></i></a>
      <a href="remote_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>

    <div id="select">
        <a href="remote_request.jsp" id="request">Request     <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
    </div>

    <div class="content">
    	<% UserModel user = (UserModel)session.getAttribute("user");
  			String	userName = user.getName();
      		String email= user.getEmail();
      		String department = user.getDept();
 		%>
    
        <h2 style="padding-left: 200px;color:white">REQUEST FORM</h2><br>
        <form class="requestform" method="post" action="ServerReq?action=add">
          <br>
          <label for="dummy1">NAME</label>
          <input readonly id="dummy1" name="name" value="<%= userName%>"><br>
          <label for="dummy2">EMAIL</label>
          <input  id="dummy2" name="email" value="<%= email%>"><br>
          <label for="dummy3">DEPARTMENT</label>
          <input readonly id="dummy3" name="department" value="<%= department%>"><br>

          <label for="purpose">PURPOSE</label>
          <select style="margin-left: -280px;padding-right: 20px; padding-top: 5px;background-color: white" name="purpose" id="purpose" required="">
            <option value="leave">leave</option>
            <option value="od">od</option>
          </select>
      
          <br>
      <label for="dummy3">DATE<br>(FROM/TO)</label>
      <div style="display: inline-flex;">
          <input type="DATE" id="dummy3" name="fromDate" required=""> 
          <input style="margin-left: 30px" type="DATE" id="toDate" name="toDate"><br>
      </div>
          <label for="discription">REASON</label>
          <textarea required style="background-color:white;flex: 0 0 200px;margin-left: -280px;" id="discription" name="discription" cols="56"></textarea><br>
          <button id="requestButton" type="submit" style="margin-left: 480px;margin-bottom: 10px;">REQUEST</button>
          <br>
      </form>
    </div>
    
     <div class="sent-items">
          <table>
          	<th>purpose</th>
          	<th>date</th>
          	<th>delete</th>
          	<% try{
				Connection con = DBConnection.getConnection();
      			String query = "select * from requesttable where email = ? AND status = 0";
      			PreparedStatement ps = con.prepareStatement(query);
      			ps.setString(1, user.getEmail());
    			ResultSet rs = ps.executeQuery();
    			while(rs.next()){
          	%>
          	<tr>
          		<td><%= rs.getString("purpose") %></td>
          		<td><%= rs.getString("fromDate") %></td>
          		<td><a href="ServerReq?action=cancel&requestId=<%=rs.getInt("requestId")%>">cancel</a></td>
          	</tr>
          	<%}}catch(Exception e){System.out.println(e.getMessage());} %>
          </table>
        </div>

    <script type="text/javascript">

    </script>
</body>
</html>