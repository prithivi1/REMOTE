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
        	top:20px;
         	background-color:#4CAF50;
        }
		
		#attendance{
        	top:80px;
        	background-color: #99ddff;
        }
		
        #request {
          top: 140px;
          background-color: #2196F3;
          /*background-color: #66ccff;*/
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
          color:white;
          text-decoration:none;
          /*background-color:  #0088cc;*/
        }

        #contact{
          top: 380px;
          background-color:  #800080;
          /*background-color: #005580;*/
        }
        .username{
        	font-size:25px;
        	color:white;
        	margin-left:200px;
        }
        .content{
          width: 1000px;
          height: 500px;
          background-color: #330033;
          margin-left: 170px;
          display: flex;
          flex-wrap: wrap;
          position: absolute;
          max-width: 1000px;
          border-radius: 5px;
          font-family: 'Raleway', sans-serif;
          margin-top:0px;
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
          margin-top: 320px;
          background-color: #ff8000;
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
		.content{
          width: 1000px;
          height: 500px;
          background-color: #330033;
          margin-left: 170px;
          margin-top: 0px;
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
            border-radius:5px;
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
            border-radius:5px;
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
		  	width:60%;
		  	margin:auto;
		  	text-align:center;
		  }
		  .task{
		    color:black;
		    font-size:1.1rem;
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
		  ::-webkit-scrollbar {
            width: 0px; 
            background: transparent; 
        }
    </style>
</head>

<body >

      
    <div id="result"></div> 
    <div class="header">
        <div class="logo">
        <div class="logoname">
        	<a class="re" href="remote_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i></a>
            <h4 class="text1">Remote</h4>
         </div>  
        </div>
        <div class="topbar">
            <div class="icons">
                <a href="#" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
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
   	  <a href="remote_chat.jsp" id="chat">Chat  <i style="float:right" class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="remote_dash.jsp" id="attendance">Dash<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="remote_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="remote_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="remote_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="remote_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    <div id="select">
    	  <a href="remote_todo.jsp" id="todo">To-do <i class="fa fa-list-ul" aria-hidden="true"></i></a>
   	</div>
    
    <div class="content">
   	  <form id="myDIV" class="header1" method="post" action="ToDoList">
        <h2 style="margin:5px; float: left; margin-top: 40px;">TO-DO LIST</h2><br><br>
        <input type="text" id="myInput" name="task_name" placeholder="Title..." autocomplete="off" required>
        <button type="submit" class="addBtn" ><i style="color: rgb(204, 0, 0)" class="fa fa-plus" aria-hidden="true"></i>  Add</button>
      </form>
      
      <%
	      UserModel user = (UserModel) session.getAttribute("user");
	      List <ToDoListModel> allToDos = ToDoListDAO.getAllToDoOfUser(user.getEmail());
		  session.setAttribute("allToDos",allToDos );
      %>

      <div class="alltasks">
      <% if(allToDos!=null){for(ToDoListModel i : allToDos){ %>
        <div class="task">
	        <div><%= i.getTaskName() %></div>
	        <a href="ToDoList?action=delete&taskId=<%= i.getTaskId() %>"><i id="cross" style="color: rgb(204, 0, 0)" class="fa fa-window-close" aria-hidden="true"></i></a>
        </div>
        <% }} %>
      </div>
    </div>

    
</body>
</html>