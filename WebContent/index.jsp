<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Remote</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<style>		
		body{
			margin: 0;
			padding: 0;
			background-color: black;
			font-family: 'Raleway', sans-serif;
		}
		.page
		{	
			/*background: linear-gradient(90deg,rgb(0, 0, 0) 0%,rgb(53, 164, 228) 0%,rgb(75, 64, 64) 100%);*/
			
			overflow: hidden;
			display: flex;
			flex-direction: row;
		}
		.icon i
		{
			margin-left: 10px;
			font-size: 30px;
			color: white;
			padding-top: 10px;
			padding-right: 10px;
		}
		.welcome 
		{
			margin-left: 200px;
			margin-top: 100px;
		}
		.form
		{
			width:300px;
			height:480px;
			position:fixed;
			margin:6% 0% 6% 65%;
			background:black;
			padding:5px;
			overflow: hidden;
			border-radius: 10px;
			display:inline-block;
			border:.5px solid #777; 
		}
		.button
		{
			width:220px;
			margin:90px auto;
			position:relative;
			box-shadow:0 0 20px 9px #007399;
			border-radius:30px;
		}
		.toggle-btn
		{
			padding:10px 30px;
			cursor:pointer;
			background:transparent;
			border:0;
			outline:none;
			position:relative;
			color: white;
		}
		
		#btn
		{
			top:0;
			left:0;
			position:absolute;
			width:110px;
			height:100%;
			background: linear-gradient(to right,#007399,#007399);
			border-radius:30px;
			transition:linear;
		}
		.input
		{
			top:180px;
			position: absolute;
			width: 280px;
			transition: 0.5s;
		}
		.input-field
		{
			width:200px;
			padding: 10px 0;
			margin: 5px 0;
			border-top: 0;
			border-right: 0;
			border-left: 0;
			border-bottom: 1px solid #007399;
			outline: none;
			background: transparent;
			color:white;
		}
		.submit-button
		{
			width:70%;
			padding: 10px 30px;
			cursor: pointer;
			display: block;
			margin: 30px 30px 0px 0px;
			background: #007399;
			border: 0;
			outline: none;
			border-radius: 20px;
		}
		.forget
		{
			text-decoration: none;
			color: red;
			margin-left: 100px;
			font-size: 15px;
		}
		span
		{
			color: #777;
			font-size: 12px;
			bottom:112px;
			position: absolute;
		}

		#login
		{
			left: 50px;
		}
		#register
		{
			left: 450px;
		}
		
		#err{
			color:red;
		}
	</style>         
</head>
<body>
	<div class = "page"> 
		<div class="icon">
		<i class="fa fa-podcast" aria-hidden="true"></i>
		</div>  
		<div class = "welcome">
		<img src="images/reg.png" alt = "welcome" width="300" height="300">
		<p style="color:white">Why Remote?</p>
		<p style="color:white">Remote helps to manage tasks in easy way for both admin and users..</p>
		<p style="color:white">Register and enjoy...</p>
		</div>
		<
		<div class ="form">
			<div class="button">
			<div id="btn"></div>
				<button type = "button" class = "toggle-btn" onclick="login()">Log In</button>
				<button type = "button" class = "toggle-btn" onclick="register()">Register</button>
			</div>
		<form id="login" class="input">
			<input type="text" name="email" id="email-id" class="input-field" placeholder="Enter Email" required><br>
			<input type="Password" name="password" id="pass" class="input-field" placeholder="Enter Password" required><br><br>
			<a href="forgetpassword.jsp" class="forget">forget password?</a>
			<p style="color:red" id="err"></p>
			<button type="submit" class="submit-button">LOGIN</button><br>
		</form>
		<form id="register" class="input">
			<input type="text" name="name" id="name" class="input-field" placeholder="Enter Username" required><br>
			<input type="email" name="email" id="email" class="input-field" placeholder="Enter Email" required><br>
			<input type="Password" name="password" id="password" class="input-field" placeholder="Enter Password" required><br>
			<input type="Password" name="conpass" id="conpass" class="input-field" placeholder="Confirm Password" required><br>
			<p style="color:red" id="error"></p>
			<button type="submit" class="submit-button">REGISTER</button><br>
		</form>
		</div>									
	</div>
	<script>
	
	$(document).ready(function(){
		$("#login").submit(function(){
			var data = $('#login').serialize();
			$.ajax({
			url: 'Login',
			type: 'post',
			data:data,
			success: function(msg){
				console.log(msg);
				if(msg.trim() === 'whitelist'){
					$("#err").html('Login Verified, Logging in.....').fadeTo(900,1,function(){
						document.location='whitelistError.jsp';
					});
				}
				else if(msg.trim() === 'admin'){
					$("#err").html('Login Verified, Logging in.....').fadeTo(900,1,function(){
						document.location='admin_home.jsp';
					});
				}
				else if(msg.trim() === 'user'){
					$("#err").html('Login Verified, Logging in.....').fadeTo(900,1,function(){
						document.location='remote_home.jsp';
					});
				}
				else{
					$("#err").html('Invalid credentials');
					setTimeout(function(){
						$("#err").html('');
					},2000);
			    }
			  }
			});
			return false;
		});
	});
	
	
	
	$(document).ready(function(){
		$("#register").submit(function(){
			if($('#password').val()!=$('#conpass').val()){
				$("#error").html('Password not matched');
				setTimeout(function(){
					$("#error").html('');
				},2000);
				return false;
			}
				
			var data = $('#register').serialize();
			$.ajax({
			url: 'Register',
			type: 'post',
			data:data,
			success: function(msg){
				console.log(msg);
				if(msg.trim() === 'success'){
					$("#error").html('Registered, Logging in.....').fadeTo(900,1,function(){
						setTimeout(function(){
							document.location='remote_home.jsp';
						},1000);
					});
				}
				else if(msg.trim() === 'error'){
					$("#error").html('Email already exists');
					setTimeout(function(){
						$("#error").html('');
					},2000);
				}
			  }
			});
			return false;
		});
	});
	 
		var x=document.getElementById("login");
		var y=document.getElementById("register");
		var z=document.getElementById("btn");

		function register()
		{
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left ="110px";
		}
		function login()
		{
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left ="0px";
		}
				
	</script>
</body>
</html>           