<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <meta charset="ISO-8859-1">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<title>remote|chat</title>
	<style type="text/css">

		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			
		}
		html,body{
			display: grid;
			height: 100%;
			place-items: center;
			background: #1b141a;
		}

		::-webkit-scrollbar {
            width: 3px;  
            border-radius: 25px;  
        }
        
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: #ddd;
        }

         ::-webkit-scrollbar-thumb:hover {
            background: #ccc;
        }

		.wrapper{
			margin-left: 0px;
			width: 870px;
			background: #fff;
			border-radius: 5px;
			border: 1px solid lightgrey;
			border-top: 0px;
			font-family: 'poppins',sans-serif;
		}

		.wrapper .title{
			background: #330033;
			color: #fff;
			font-size: 20px;
			font-weight: 500;
			line-height: 60px;
			text-align: center;
			border: 1px solid white;
			border-radius: 5px 5px 0 0;
		}

		.wrapper .form{
			padding: 20px 15px;
			min-height: 400px;
			max-height: 400px;
			overflow-y: auto;
			background:#330033;
		}

		.wrapper .form .inbox{
			width: 100%;
			display: flex;
			align-items: baseline;
		}

		.wrapper .form .user-inbox{
			justify-content: flex-end;
			margin: 13px 0; 
		}

		.wrapper .form .inbox .icon{
			height:  40px;
			width: 40px;
			color: #fff;
			text-align: center;
			line-height: 40px;
			border-radius: 50%;
			font-size: 18px;
			background: #007bff;	
		}
		
		.wrapper .form .inbox i{
			margin-top:10px;
		}

		.wrapper .form .inbox .msg-header{
			max-width: 53%;
			margin-left: 10px;
		}

		.form .inbox .msg-header p{
			color: #fff;
			background: #007bff;
			border-radius: 10px;
			padding: 8px 10px;
			font-size: 14px;
			word-break:break-all;
		}

		.form .user-inbox .msg-header p{
			color: #333;
			background: #efefef;
		}

		.wrapper .typing-field{
			display: flex;
			height: 60px;
			width: 100%;
			align-items: center;
			justify-content: space-evenly;
			background: #330033;
			border-top: 1px solid #d9d9d9;
			border-radius: 0 0 5px 5px;
		}

		.wrapper .typing-field .input-data{
			height: 40px;
			width: 535px;
			position: relative;
		}
		.wrapper .typing-field .input-data input{
			height: 100%;
			width: 100%;
			outline: none;
			border: 1px solid transparent;
			padding: 0 80px 0 15px;
			border-radius: 3px;
			font-size: 15px;
			background: #fff;
			transition: all 0.3s ease;
		}

		.typing-field .input-data input:focus{
			border-color: rgba(0,123,255,0.8);
		}

		.input-data input::placeholder{
			color: #999999;
			transition: all 0.3s ease;
		}

		.input-data input:focus::placeholder{
			color: #bfbfbf;
		}


		.wrapper .typing-field .input-data button{
			position: absolute;
			right: 5px;
			top: 50%;
			height: 30px;
			width: 65px;
			color: #fff;
			font-size: 16px;
			cursor: pointer;
			border-radius: 3px;
			background: #330033;
			border: 1px solid #007bff;
			transform: translateY(-50%);
		}

		/*.topbar{
			display: flex;
			float: right;
			 margin-left:30px;
            width: 600px;
		}*/

		.icons{
			/*margin-left: 800px;*/
			width: 1250px;
			margin-top: 20px;
			height: 50px;
        }

        .icons a{
        	font-size: 20px;
        	padding-right: 15px; 
        }


        .logo{
        	float: left;
        	padding-top: 20px;
        	width: 100px;
        	display: flex;
        	vertical-align:middle;
            background-color: #1b141a;
        }

        .logo i{
        	color:white;
            font-size: 40px;
        }

        .text1{
            text-decoration: none;
            font-size:15px;
            margin-top: 15px;
            color: white;
        }

        .links{
        	display: inline-flex;
        	float: right;
        	padding-right: 20px;
        }

        .tooltiptext{
        	font-size: 16px;
        	color: #777;
        	/*margin-left: -10px;*/
        }

        .links i{
        	margin-left: 5px;
        	font-size: 30px;
        }

        .sidenav{
        	/*margin-top: 100px;*/
        	display: flex;
        	flex-direction: column;
        	margin-right:1200px; 
        }

        #mySidenav a {
          position: absolute;
          margin-top: 80px;
          left: -80px;
          transition: 0.5s;
          padding: 15px;
          width: 130px;
          text-decoration: none;
          font-size: 20px;
          border-radius: 0 5px 5px 0;
          color: white;
        }

        #mySidenav a:hover {
          left: 0;
        }

        #mySidenav i{
			float:right;
			color: white;
		}

		#select i{
			float: right;
			color: white
		}

        #chat {
      		color: white;
            text-decoration: none;
          /*background-color: #99ddff ;*/
        }

        #attendance{
        	top:80px;
        	background-color: #99ddff;
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
          width: 120px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          left:-10px;
          margin-top: 100px;
          background-color: #4CAF50;
          color: white;
        }


	</style>
</head>
<body>
	<div class="header">
        <div class="logo">
        	<a class="re" href="remote_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i></a>
            <h4 class="text1">Remote</h4>
        </div>
        <div class="topbar">
            <div class="icons">
               
   				
                <div class="links">
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"><br></i><br><span class="tooltiptext"><b>logout</b></span></a></div>

                <div class="links">
                <a href="remote_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><br><span class="tooltiptext"><b>profile</b></span></a></div>

                	<div class="links">                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><br><span class="tooltiptext"><b>lunch</b></span></a></div>
   				
                <div class="links">
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><br><span class="tooltiptext"><b>break</b></span></a></div>
            
               <div class="links"><a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank"class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><br><span class="tooltiptext" style="margin-left: 5px;"><b>meet</b></span></a></div>
            </div>    
        </div>
    </div>

     <div id="mySidenav" class="sidenav">
      <a href="remote_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="remote_dash.jsp" id="attendance">Dash<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="remote_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="remote_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="remote_todo.jsp" id="todo">To-do  <i  Style="margin-left:5px;" class="fa fa-list-ul" aria-hidden="true"></i></a> 
      <a href="remote_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <div id="select">
    	<a href="remote_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
    </div>

	<div class="wrapper" id="main">
		<div class="title">Remote-Group chatter box</div>
		<div class="form" id="box">
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
		</div>
		<div class="typing-field">
			
			<div class="input-data">
				<input type="text" id="textbox" name="textbox" placeholder="type something here..." autocomplete="off">
				<button type="submit" onclick="test(document.getElementById('textbox').value)" id="btn-send">send</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	window.onload = initPage;
	
	  $(document).ready(function(){
			$("#btn-send").on("click",function(){
				$value = $("#textbox").val();
				$msg = '<div class="user-inbox inbox"><div class="msg-header"><p>'+ $value+'</p></div></div>';
				$("#box").append($msg);
				$("#textbox").val('');
			});
		});
	
	  function test(str)
	  {
		  var ob=new XMLHttpRequest();
		    ob.onreadystatechange=function ss()
	   		{
		    	if(this.readyState==4 && this.status==200)
		    	{
		    		updateScroll();
		    		//alert("success message");
		    	}
		   	}
	   		ob.open("GET","ChatSeverlet?msg="+str,true);
	   		ob.send();
	  }	
	  
	  function initPage() {
		   updateScroll();
	  }
		
	  function load(){
		   setInterval(function () {$("#main").load(window.location.href + " #main" );}, 5000);  
	  }
		
	  function updateScroll(){
			var element = document.getElementById("box");
			element.scrollTop = element.scrollHeight;
	  }	
	  
	  $(document).ready(function(){
			 $(".form").load("refreshChat.jsp");
	       setInterval(function() {
	           $(".form").load("refreshChat.jsp");
	       }, 1000);
	    });
	  				
	</script>
		
</body>
</html>