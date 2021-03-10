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

       background-color: #4CAF50;
        margin-top:20px; 
        }
        
        #white{
        	
          color: white;
          text-decoration: none;
        }

        #request {
          top:140px;
          background-color:#2196F3;;
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
  
      #select{
          position: absolute;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          margin-top: 80px;
          background-color: #99ddff;
          color: white;
        }
/*
        #white{
          color: white;
          text-decoration: none;
        }*/

        /*.white{
          width: 1000px;
          height: 500px;
          background-color: white;
          margin-left: 170px;
          margin-top: 30px;
          display: inline-block;
          border-radius: 5px;
        }*/
      
      .content{
          width: 1000px;
          height: 500px;
          background-color: #330033;
          margin-left: 170px;
          margin-top: 20px;
          display: inline-block;
          border-radius: 5px;
           border: 2px solid #dedede;
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
        	<a class="re" href="admin_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i></a>
            <h4 class="text1">Remote</h4>
         </div>  
        </div>
        <div class="topbar">
            <div class="icons">
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                               
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   			</div>
            <div class="icons">
                <a href="admin_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="admin_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_schedule.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="admin_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>

      <div id="select">
      <a href="admin_whitelist.jsp" id="white">Whitelist <i class="fa fa-check-circle" aria-hidden="true"></i></a>
    </div>
    

     <div class="content">
      <form id="myDIV" class="header1" method="post" action="Whitelist?action=add">
        <h2 style="margin:5px; float: left; margin-top: 40px;">WHITELIST</h2><br><br>
        <input type="text" id="myInput" name="email" placeholder="enter email to add..." autocomplete="off" required>
        <button type="submit" class="addBtn" >Add</button>
      </form>
      
      <%
	      UserModel user = (UserModel) session.getAttribute("user");
	      List<UserModel> users = UserDAO.getAllStudents();
		  session.setAttribute("allusers",users);
      %>

      <div class="alltasks">
       <% if(users!=null)
       {for(UserModel i : users){ 
       if(i.getIswhitelist()==1)
       {%>
        <div class="task">
	        <div><%=i.getEmail() %>          (<%=i.getName() %>)</div>
	        <a href="Whitelist?action=delete&email=<%=i.getEmail()%>"><i id="cross" style="color: white" class="fa fa-times" aria-hidden="true"></i></a>
        </div>
		<% }}}%>
      </div>
    </div>

    
</body>
</html>