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
      		color: white;
            text-decoration: none;
              margin-top: 20px;
          background-color: #4CAF50;
          /*background-color: #99ddff ;*/
        }
        
        #attendance{
        	top:80px;
        	background-color: #99ddff;
        }

        #request {
          top:140px;
          background-color:#99ddff;;
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
          margin-top:10px;
           border: 2px solid #dedede;
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
		
		  .details
          {
            width: 400px;
            height: 200px;
            background-color:#330033;
            border-radius: 30px;
            margin-left: 5px;
            margin-top: 10px;
            /*border: 1px solid #777;*/
          } 
          
          .pic
          {
            width: 350px;
            height: 500px;
            border-radius: 30px;
            background-color: #1b141a;
            margin-left: 0px; 
             /*border: 1px solid #777;*/
          } 
          .profiledetail
          {
            color: white;
            background-color: #transparent;
            position: relative;
            margin-left: -60px;
          }
          
          .profile-label{
            display:grid;
            grid-template-columns:1fr 3fr;
          }

          .profile-label label
          {
            display: inline-flex;
            flex-direction: row;
            width:400px;
            line-height:26px;
            margin-bottom :10px;
            font-weight: bold;
            padding-bottom: 20px; 
            margin-left: 130px;
          }
          .profile-label input
          {
            height: 20px;
            flex: 0 0 200px;
            margin-left: -210px;
            background-color: #777;
          }
          #myBtn{
          margin-left: 320px;
        }



      .modal {
        margin-left: 150px;
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      padding-top: 100px; /* Location of the box */
      left: 0;
      top: 0;
      width: 50%; /* Full width */
      height: 100% /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
      color: white;
      background-color: #777;
      margin: auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      height: 300px;
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

    .model-form{
      color: white;
      background-color: #1b141a;
      width: 100%;
      height: 240px;
    }

    .model-form label{
      padding-bottom: 20px;
      margin-left: 50px;
    }

    .model-form input{
      float: right;
      margin-right: 140px;
    }

    .model-form button{
      margin-left:  180px;
    }

        .container {
           /*max-width: 960px;*/
           height: 400px;
           margin-top: 30px;
           margin-right: 80px;
           padding: 20px;
           /*background: red;*/
        }
         .avatar-upload {
           position: relative;
           max-width: 205px;
           margin: 50px auto;
           margin-top: -10px;
        }
         .avatar-upload .avatar-edit {
           position: absolute;
           right: 45px;
           z-index: 1;
           top: 10px;
           font-size: 20px;
        }

        #ic{
          /*background: red;*/
          height: 30px;
        }
         .avatar-upload .avatar-edit input {
              display: none;
          }

         .avatar-upload .avatar-edit input + label {
           display: inline-block;
           width: 34px;
           height: 15px;
           margin-bottom: 0;
           border-radius: 100%;
           background: #fff;
           border: 1px solid transparent;
           box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
           cursor: pointer;
           font-weight: normal;
           transition: all 0.2s ease-in-out;
        }
         .avatar-upload .avatar-edit input + label:hover {
           background: #f1f1f1;
           border-color: #d6d6d6;
        }
         .avatar-upload .avatar-edit input + label:after {
           content: "\f040";
           font-family: 'FontAwesome';
            position: absolute;
           color: #757575;
           top: 4px;
           left: 0;
           right: 10px;
           text-align: right;
           margin:auto;
           
        }
         .avatar-upload .avatar-preview {
           width: 152px;
           height: 152px;
           position: relative;
           border-radius: 100%;
           border: 6px solid #f8f8f8;
           box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
        }

       /*  .avatar-upload .avatar-preview > div {
           width: 100%;
           height: 100%;
           border-radius: 100%;
           background-size: cover;
           background-repeat: no-repeat;
           background-position: center;
        }*/

        .avatar-upload .avatar-preview img{
            position: fixed;
            color:white; 
            margin-top: 0px;
            margin-left: 0px;
            border-radius: 100px;
        }
		
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
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
                <a href="#" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
            </div>
            <div class="icons">
                <a href="admin_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
   	<a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="admin_whitelist.jsp" id="attendance">Whitelist<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a> 
      <a href="admin_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_schedule.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="admin_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <%
     UserModel i = (UserModel)session.getAttribute("user");
   %>
    
    <div class="content">
    		<div class="page">
            <div class="details">
                <h2 style ="color :white; text-align:center" >PROFILE</h2>
                <div class="profiledetail">
                  <div class="profile-label">
                     <label for ="name">Name : </label>
                     <label for ="name" style="margin-left: -200px;"><%=i.getName() %></label>
                  </div>
                  <div class="profile-label">
                      <label for ="regno">Register No. : </label>
                      <label for ="name" style="margin-left: -200px;"><%=i.getRegNo() %></label>
                  </div>
                  <div class="profile-label">
                      <label for ="mailid">Email : </label>
                      <label for ="name" style="margin-left: -200px;"><%=i.getEmail() %></label>
                  </div>
                  <div class="profile-label">
                      <label for ="gender">Gender : </label>
                      <label for ="name" style="margin-left: -200px;"><%=i.getGender() %></label>
                  </div>
                  <div class="profile-label">
                      <label for ="dept">Department : </label>
                      <label for ="name" style="margin-left: -200px;"><%=i.getDept() %></label>
                  </div>
                 <div class="profile-label">
                   <label for ="contact">Contact No. : </label>
                   <label for ="name" style="margin-left: -200px;"><%=i.getPhoneNumber() %></label>
                 </div>
               </div> 
               <button id="myBtn">Update Profile</button>
            </div>

      <div id="myModal" class="modal">
          <div class="modal-content">
              <div class="modal-header">
                <span class="close">&times;</span>
                <p>UPDATE YOUR PROFILE</p>
            </div>
            <div class="modal-body">
                  <form class="model-form" action="profile" method="post"><br>
                    <label for ="name">NAME : </label>
                    <input  type="text" name="name" value="<%= i.getName() %>" ><br><br>
                    <label for ="name">REGNO : </label>
                    <input  type="text" name="regno" value="<%= i.getRegNo() %>" ><br><br>
                    <label for ="gender">GENDER : </label>
                    <input type="text" name="gender" value="<%= i.getGender() %>" ><br><br>
                    <label for ="dept">DEPARTMENT : </label>
                    <input type="text" name="dept" value="<%= i.getDept() %>" ><br><br>
                    <label for ="contact">CONTACT : </label>
                    <input type="text" name="ph_no" value="<%= i.getPhoneNumber()%>" style="-moz-appearance: textfield;" ><br><br>
                    <button type="submit" id= "btn" style="margin-left:300px;">UPDATE</button><br>
                  </form> 
              </div>
              <div class="modal-footer">
                <h3></h3>
              </div>
            </div>
          </div>
      </div>
      <hr>
      
       <form action="ProfilePictureUpload?action=image" method="post" class="container" enctype="multipart/form-data">
              <div class="avatar-upload">
                <div class="avatar-edit">
                  <input type='file' id="imageUpload" name ="profile_img"/>
                  <label for="imageUpload" id="ic"></label>
                </div>
                <div class="avatar-preview">
                  <img id="imagePreview" src="getImage.jsp?email=<%=i.getEmail()%>" alt="dp" width="152px" height="152px" />
                </div>
              </div>
          <button type="submit" id="pic-btn" style="margin-left: 170px;margin-top: -30px;">Upload</button>
          <br><br>
          <label style="color: white;padding-top: 30px;margin-left:30px;font-size: 30px;"><%=i.getName() %></label>
      </form>
    </div>
    
   

    <script type="text/javascript">
    var modal = document.getElementById("myModal");
	
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }

    </script>
</body>
</html>