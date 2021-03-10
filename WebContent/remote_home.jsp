<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="ISO-8859-1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
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
          top: 320px;
          background-color:  #ff8000;
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
          background-color: transparent;
          margin-left: 170px;
          display: flex;
          flex-wrap: wrap;
          position: absolute;
          max-width: 1000px;
          border-radius: 30px;
          font-family: 'Raleway', sans-serif;
          margin-top:-10px;
        }

        .home{
          padding:20px;
          background-color: #330033;
          width: 25%;
          height: 83%;
          margin-left: 30px;
          margin-top: 20px;
          border-radius: 5px;
        }

        .away{
          padding:20px;
          background-color: #330033;
          width: 25%;
          height: 83%;
          margin-left: 30px;
          margin-top: 20px;
          border-radius: 5px;
        }

        .online{
          width: 100%;
          height: 10%;
          /*background-color: green;*/
          margin-top: -30px;
          display: flex;
        }

        .offline{
          width: 100%;
          height: 10%;
          /*background-color: green;*/
          margin-top: -30px;
          display: flex;
        }
        .con{
          width: 100%;
          height: 98%;
          margin-top: 10px;
          display: block;
          background-color: #330033;
          overflow: scroll;
        }

        .schedule{
           padding:20px;
          background-color:  #330033;
          width: 25%;
          height: 83%;
          margin-left: 30px;
          margin-top: 20px;
          border-radius: 5px;
        }

        .sch{
           width: 100%;
          height: 10%;
          /*background-color: green;*/
          margin-top: -30px;
          display: flex;
        }

        ::-webkit-scrollbar {
            width: 0px;  /* Remove scrollbar space */
            background: transparent;  /* Optional: just make scrollbar invisible */
        }
        /* Optional: show position indicator in red */
        ::-webkit-scrollbar-thumb {
            background: #FF0000;
        }

        table {
          border-collapse: collapse;
          width: 100%;
          height: 50px;
          outline: none;
          border: none;
          color: white;
          overflow: scroll;
        }

         td, th {
          text-align: left;
          padding: 8px;
        }

        tr:hover{
          background-color: #777;
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
		.tab{
			 border: 0.5px solid #dedede;
		}
		
		
		.attendence-modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		.attendence-modal-header p{
		  color:black;
		}
		.attendence-modal-header h2{
		  color:black;
		}
		/* Modal Content */
		.attendence-modal-content {
		  position: relative;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 0;
		  border: 1px solid #888;
		  width: 80%;
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		  -webkit-animation-name: animatetop;
		  -webkit-animation-duration: 0.4s;
		  animation-name: animatetop;
		  animation-duration: 0.4s
		}
		
		/* Add Animation */
		@-webkit-keyframes animatetop {
		  from {top:-300px; opacity:0} 
		  to {top:0; opacity:1}
		}
		
		@keyframes animatetop {
		  from {top:-300px; opacity:0}
		  to {top:0; opacity:1}
		}
		
		/* The Close Button */
		.attendence-close {
		  color: black;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.attendence-close:hover,
		.attendence-close:focus {
		  color: red;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.attendence-modal-header {
		  padding: 10px 16px;
		  color: white;
		}
		
		.attendence-modal-body {padding: 2px 16px;}
		
		.attendence-modal-footer {
		  padding: 2px 16px;
		  color: white;
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
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
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
      <a href="remote_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="remote_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="remote_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="remote_todo.jsp" id="todo">To-do <i class="fa fa-list-ul" aria-hidden="true"></i></a>
      <a href="remote_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    <%
    	UserModel user = (UserModel)session.getAttribute("user");
	
		String	userName = user.getName();
  		String email= user.getEmail();
        //List<UserModel> usersOnline = UserDAO.getAllStudents();
      	

      	List<StatusModel> usersOnline = StatusDAO.getAllStudentsOnline();
      	List<StatusModel> usersOffline = StatusDAO.getAllStudentsOffline();

    %>
    <div class="details">
    	<p class="username" style="margin-bottom:0px;font-family: 'Raleway', sans-serif;">Hey , <%= userName %></p>
    </div>
    <div class="content">
    	
        <div class="home">
            <div class="online">
              <h3 style="color: #777"><i style="color: green;font-size: 10px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i>  online<h3 style="color: #777;font-family:Arial"> (<%=usersOnline.size()%>)</h3></h3>
            </div>
            <div class="con">
              <table class="tab">
                <% for(StatusModel i : usersOnline){ %>
                <tr>
                  <td><%= i.getName() %></td>
                  <td><%= i.getJob() %></td>
                </tr>
         		<%} %>
              </table>
            </div>  
        </div>
        
        
        
        <div class="away">
            <div class="offline">
              <h3 style="color: #777"><i style="color: red;font-size: 12px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i> away<h3 style="color: #777;font-family:font-family:Arial;">(<%=usersOffline.size() %>)</h3></h3>
            </div>
            <div class="con">
              <table class="tab">
                <% for(StatusModel i : usersOffline){ %>
                <tr>
                  <td><%= i.getName() %></td>
                  <td style="padding-left:100px;"><%= i.getJob() %></td>
                </tr>
         		<%} %>
              </table>
            </div>
        </div>
        
        <div class="schedule">
            <div class="sch">
              <h3 style="color: #777"><i style="color: blue;font-size: 12px;margin-top:-5px;" class="fa fa-circle" aria-hidden="true"></i> schedule</h3>
            </div>
            <div class="con">
              <table class="tab">
                <%List<ScheduleModel> list = TaskDAO.getAllSchedule();
              	for(ScheduleModel i : list)
              	{
              	%>
                <tr>
                  <td><%=i.getSubject() %></td>
                  <td><%=i.getFromTime() %></td>
                  <td><%=i.getToTime() %></td>
                </tr>
                <%} %>
              </table>
            </div>
        </div>
    </div>
    
    <div id="attendence-modal" class="attendence-modal">
					
					  <!-- Modal content -->
					  <div class="attendence-modal-content">
					    <div class="attendence-modal-header">
					      <span class="attendence-close">&times;</span>
					      <h2>Attendence...</h2>
					      <p>Press attendence button within 10 seconds..</p>
					      <p>Otherwise you will be marked as absent.</p>
					      <p>Overall attendence will be given by attendence count</p>
					    </div>
					    
					    <div class="attendence-modal-body">
					          <form method="post" action="Attendence?action=present">
					               <button type="submit" id= "attendence-present-btn" ">Present</button>
					          </form>
					    </div>
					    
					    
					    <div class="attendence-modal-footer">
					      <h3></h3>
					    </div>
					  </div>
					
					</div>

    <script type="text/javascript">
    var remainingAttendenceCount;
    var userStatus;
    function show()
    {
    	let attendenceModal = document.getElementById("attendence-modal");
        attendenceModal.style.display = "block";

        setTimeout(function(){
        	attendenceModal.style.display = "none";
        	setAttendenceAbsent();
        }, 8000);
    }
    
    function setAttendenceAbsent() {
    	var xhttp = new XMLHttpRequest();
    	  xhttp.onreadystatechange = function() {
    	    if (this.readyState == 4 && this.status == 200) {
    	      console.log("You are marked as absent.. Please be attentive");
    	    }
    	  };
    	  xhttp.open("POST", "Attendence?action=absent", true);
     	  xhttp.send();
       }
    
    
     let timer = setInterval(function() {
    	 
    	 console.log("count->>  ",remainingAttendenceCount);
		 if(remainingAttendenceCount>0){
			     show();
		  }
		 else{
			 //clearInterval(overallTimer);
			 clearInterval(timer);
		 }
     	}, 20000);
    
    function getRemainingAttendenceCount(){
    	var xhttp = new XMLHttpRequest();
  	    xhttp.onreadystatechange = function() {
  	    if (this.readyState == 4 && this.status == 200) {
  	    	remainingAttendenceCount = parseInt(this.responseText);
  	    	console.log(remainingAttendenceCount);
  	    }
  	  };
  	  xhttp.open("GET", "Attendence?action=get", true);
  	  xhttp.send();
    }
    function getUserStatus(){
    	var xhttp = new XMLHttpRequest();
  	    xhttp.onreadystatechange = function() {
  	    if (this.readyState == 4 && this.status == 200) {
  	    	userStatus = parseInt(this.responseText);
  	    	console.log(userStatus);
  	    }
  	  };
  	  xhttp.open("GET", "Attendence?action=getStatus", true);
  	  xhttp.send();
    }
    
    setInterval(function(){
    	getUserStatus();
    	if(userStatus>0){
    		getRemainingAttendenceCount();
       }
    	else{
    		remainingAttendenceCount=null;
    	}
    },1000);
    
    

    window.onload = function(){
		var teabreak = <%= session.getAttribute("teabreak")%>
		if(teabreak==true)
		{
			myBlurFunction(1);
		}else if(teabreak==false){
			myBlurFunction(0);
		}

		var lunchbreak = <%= session.getAttribute("lunchbreak")%>
		if(lunchbreak==true)
		{
			myBlurFunction1(1);
		}
		else if(lunchbreak==false){
			myBlurFunction1(0);
		}
		
	}
	    
    myBlurFunction = function(state) {
        var containerElement = document.getElementById('main_container');
        var overlayEle = document.getElementById('overlay');
		if (state) {
            overlayEle.style.display = 'block';
           // containerElement.setAttribute('class', 'blur');
        } else {
            overlayEle.style.display = 'none';
           // containerElement.setAttribute('class', null);
        }
    };
    
	   myBlurFunction1 = function(state) {  
	    var overlayEle = document.getElementById('overlay1');
		 if (state) {
	        overlayEle.style.display = 'block';
	       // containerElement.setAttribute('class', 'blur');
	    } else {
	        overlayEle.style.display = 'none';
	        //containerElement.setAttribute('class', null);
	    }
	};
	    
	
	
	var countDownDate = new Date();
	countDownDate.setMinutes(countDownDate.getMinutes() + 60 );
	
	 var x = setInterval(function() {
	 var now = new Date().getTime();
	 var distance = countDownDate - now;
	 var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	 var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	 document.getElementById("ld").innerHTML = minutes + "m " + seconds + "s ";
	 if (distance < 0) {
	    clearInterval(x);
	    document.getElementById("ld").innerHTML = "EXPIRED";
	  }
	}, 1000);

	
	
	var breaktime = new Date();
	breaktime.setMinutes( breaktime.getMinutes() + 15 );
	
	var y = setInterval(function(){
		var cur = new Date().getTime();
		var dif = breaktime - cur;
		var min = Math.floor((dif % (1000 * 60 * 60)) / (1000 * 60));
		var sec = Math.floor((dif % (1000 * 60)) / 1000);
		document.getElementById("td").innerHTML = min + "m " + sec + "s ";
		if (dif < 0) {
		    clearInterval(y);
		    document.getElementById("td").innerHTML = "EXPIRED";
		}
	},1000);
	
	$(document).ready(function(){
		 $(".content").load("refresh.jsp");
     setInterval(function() {
         $(".content").load("refresh.jsp");
     }, 1000);
  });
	
    </script>
</body>
</html>