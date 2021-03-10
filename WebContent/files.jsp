<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List,java.util.ArrayList,com.remote.util.*,com.remote.dao.*,java.sql.*"%>
       
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Remote|To Do</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
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
            height: 80px;
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
        }

        .icons .one{
            margin-right: 25px;
            background-color: transparent;
            border: none;
            outline: none;
            color: white;
        }

        .one:hover{
            transition: .5s;
            transform: scale3d(1.3,1.3,1.3);
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
        .text1{
            text-decoration: none;
            font-size: 20px;
        }

        .logo i{
            font-size: 35px;
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
        }

        #mySidenav a {
          position: absolute;
          left: -80px;
          transition: 0.3s;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
        }

        #mySidenav a:hover {
          left: 0;
        }

        #chat {
          top: 20px;
          background-color: #4CAF50;
          /*background-color: #99ddff ;*/
        }

        #request {
          top: 80px;
          background-color: #2196F3;
          /*background-color: #66ccff;*/
        }

        #files {
          top: 140px;
          background-color: #f44336;
          /*background-color:  #33bbff;*/
        }

        #task {
          top: 200px;
          background-color: #555;
          /*background-color: #00aaff;*/
        }

        #contact{
          top: 320px;
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
          margin-top: 260px;
          background-color: #ff8000;
          color: white;
        }

        #todo{
          color: white;
          text-decoration: none;
        }

        .content{
          width: 1000px;
          height: 500px;
          background-color: #330033;
          margin-left: 170px;
          margin-top: 30px;
          display: inline-block;
          border-radius: 5px;
        }


          /* Style the close button */
          .close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 12px 16px 12px 16px;
          }

          .close:hover {
            background-color: #f44336;
            color: white;
          }

          /* Style the header */
          .header1 {
            background-color: #330033;
            padding: 30px 40px;
            color: white;
            text-align: center;
            border-radius: 30px;
          }

          /* Clear floats after the header */
          .header1:after {
            content: "";
            display: table;
            clear: both;
          }

          /* Style the input */
          input {
            margin-right: 40px;
            margin-left: 40px;
            border: none;
            border-radius: 0;
            width: 40%;
            padding: 10px;
            float: left;
            font-size: 16px;
            border-radius:25px;
            outline:none;
          }

          /* Style the "Add" button */
          .addBtn {
            padding: 10px 20px;
            width: 10%;
            background: #d9d9d9;
            color: black;
            float: left;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            border-radius: 0;
            border-radius:25px;
            outline:none;
          }

          .addBtn:hover {
            background-color: #bbb;
          }
		  .alltasks{
		    margin-top:20px;
		    height:auto;
		  	max-height:300px;
		  	overflow-y:scroll;
		  	overflow-x:hidden;
		  	
		  }
		  .task{
		    color:black;
		    font-size:1.4rem;
		  	display:flex;
		  	justify-content:space-between;
		  	height:30px;
		  	padding:5px 20px;
		  	margin-top:5px;
		  	background-color:grey;
		  }
		  .task div{
		  	margin-top:7px;
		  }
		  #cross{
		  color:black;
		  margin-top:7px;
		  }

    </style>
</head>
<body onload="preventBack()">
    <div class="header">
        <div class="logo">
                <a class="re" href="file:///E:/remote/remote_homepage.html"><i class="fa fa-podcast" aria-hidden="true"></i><span class="text1">remote</span></a>
        </div>
        <div class="topbar">
            <div class="icons">
                <button class="one" onclick="window.location='https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179'"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><br><b> meet</b></button>
                <button class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><br><b> break</b></button>
                <button class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><br><b> lunch</b></button>
            </div>
            <div class="icons">
                <button class="one"  onclick="window.location='file:///E:/remote/remote_profile.html'" ><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><br><b>profile</b></button>
                <button class="one" onclick="window.location='file:///E:/remote/remote_index.html'"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><br><b>logout</b></button>
            </div>  
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="#" id="chat">Chat</a>
      <a href="file:///E:/remote/remote.request.html" id="request">Request</a>
      <a href="file:///E:/remote/remote_files.html" id="files">Files</a>
      <a href="file:///E:/remote/remote_task.html" id="task">Task</a>
      <a href="file:///E:/remote/remote_contact.html" id="contact">Contact</a>
    </div>

    <div id="select">
      <a href="#" id="todo"><b>To-do<b></a>
    </div>

    <div class="content">
      
      <%
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from files";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){ %>
	        <div class="alltasks">
			<div class="task">
			    <div><%= rs.getInt("Name") %></div>
			    <a href="getfile.jsp?id=<%=rs.getInt("id")%>" target="_blank">show file</a>
			</div>
			<% }}catch(Exception e){
			System.out.println(e);
		}
      %>

      </div>	

</body>
</html>