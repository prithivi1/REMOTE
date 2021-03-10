<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
    
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

        #request {
          color: white;
          text-decoration: none;
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
           background-color: #ff8000;
        }

        #contact{
          top: 380px;
          background-color:  #800080;
          /*background-color: #005580;*/
        }
  
        .content{
          width: 1200px;
          height: 500px;
          background-color: #330033;
          margin-left: 170px;
          display: flex;
          flex-wrap: wrap;
          position: absolute;
          max-width: 1000px;
          border-radius: 5px;
          font-family: 'Raleway', sans-serif;
          margin-top:10px;
           border: 2px solid #dedede;
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
        
        
        .dia{
        	left: -270%;
			top: 270%;
        	margin:auto;
        	width:150%;
        	height:130%;
        	position:absolute;
        	z-index:100;
        	background-color:#F4FFEF;
        	border:1px dotted black;"
       }
       
       
       .blur{
          -webkit-filter: blur(2px);
          -moz-filter: blur(2px);
          -o-filter: blur(2px);
          -ms-filter: blur(2px);
          filter: blur(2px);    
        }
        
		#overlay    {
		    position: fixed;
		    display: none;
		    left: 0px;
		    top: 0px;
		    right: 0px;
		    bottom: 0px;
		    background: rgba(255,255,255,.8);
		    z-index: 999;
		}
		
		
		#overlay1    {
		    position: fixed;
		    display: none;
		    left: 0px;
		    top: 0px;
		    right: 0px;
		    bottom: 0px;
		    background: rgba(255,255,255,.8);
		    z-index: 999;
		}
		
		#popup {
		    position: absolute;
		    width: 400px;
		    height: 200px;
		    background: rgb(255,255,255);
		    border: 5px solid rgb(90,90,90);
		    left: 0px;
		    right: 0px;
		    top: 0px;
		    bottom: 0px;
		    margin: auto;
		    text-align:center;
		 }
		
		.breakQuotes{
			font-family: 'Raleway', sans-serif;
			text-align:center;
			font-size:20px;
		
		}
		
		 label {
          display: inline-flex;
          flex-direction: row;
          justify-content: flex-start;
          margin-left: 270px;
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
          margin-left: -190px;
          background-color: #777;
          border: none;
        }

        .requestform{ 
          margin-top: -30px;
          margin-left: 00px;
          width: 1000px;
          background-color: white;
          border-bottom-right-radius: 30px;
          border-bottom-left-radius: 30px;
        }

        #requestButton{
          margin-left: 30px;
          padding: 10px;
          border-radius: 30px;
          outline: none;
          cursor: pointer;
        }
        
        table {
          color:white;
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
          outline: none;
          border: none;
          
        }

		th{
			background-color: #dddddd;
			color:black;
		}
		
        th {
          text-align: center;
          padding: 8px;
        }
        
        td{
			padding:10px;  
			text-align: center;      
	    }
        td a{
        	text-decoration:none;
        	color:white;
        }

       .modal {
		  display: none; 
		  position: fixed; 
		  z-index: 1; 
		  padding-top: 100px; 
		  left: 0;
		  top: 0;
		  width: 100%; 
		  height: 100%; 
		  overflow: auto; 
		  background-color: rgb(0,0,0); 
		  background-color: rgba(0,0,0,0.4); 
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 20%;
		  align-items: center;
		  font-family: Arial, Helvetica, sans-serif;
		}
		
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}

		tr:nth-child(odd){
  			background-color: #777;
  			color: #fff;
		}
		
    </style>
</head>


<body >
      
    <div id="result"></div> 
    <div class="header">
        <div class="logo">
        <div class="logoname">
        	<a class="re" href="admin_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i></a>
            <h4 class="text1">Remote</h4>
         </div>  
        </div>
        <div class="topbar">
            <div class="icons">
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
            </div>
            <div class="icons">
                <a href="admin_profile" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="admin_whitelist.jsp" id="attendance">whitelist<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="admin_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_schedule.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="admin_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <div id="select">
    	<a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
    </div>
   
    <div class="content">
        <%
		List<RequestModel> user = (List<RequestModel>)RequestDAO.getAllRequest();
	%>
    	
    	<%if(user.size()!=0){ %>
		<table>
        <tr>
          <th>NAME</th>
          <th>EMAIL</th>
          <th>DEPARTMENT</th>
          <th>PURPOSE</th>
          <th>FROM</th>
          <th>TO</th>
          <th>REASON</th>
          <th>RESPONSE</th>
        </tr>
        
        <% for(RequestModel i : user){ %>
        <tr>
          <td><%= i.getName() %></td>
          <td><%= i.getEmail() %></td>
          <td><%= i.getDepartment() %></td>
          <td><%= i.getPurpose() %></td>
          <td><%= i.getFromDate() %></td>
          <td><%= i.getToDate() %></td>
          <td><%= i.getReason() %></td>
          <td><a href="Respond?action=accept&requestId=<%=i.getRequestId()%>"  style="background-color: green;height:30px; padding: 10px; font-size: 15px;margin-left:40px;margin-bottom:10px">Accept</a>&nbsp<a href="Respond?action=deny&requestId=<%=i.getRequestId()%>"  style="background-color: red;height:30px; padding: 10px; font-size: 15px;margin-left:40px;margin-bottom:10px">Deny</a></td>
        </tr>
		<%} %>
	</table>
		<%}else{ %>
			<h1 style="margin-left:300px;color:white">NO REQUEST FOUND</h1>
		<%} %>
        
    </div>

    <script type="text/javascript">

 		
    </script>
</body>
</html>