<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FORGET PASSWORD</title>
	 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
    <style type="text/css">
     	body
    	{
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #1b141a;
        }
        .logo{
            margin-right: 680px;
            padding-top: 20px;
            padding-left: 23px;
            width: 100px;
            background-color: #1b141a;
        }
        .content{
          width: 440px;
          height: 350px;
          background-color: #1b141a;
          margin-left: 420px;
          margin-top: 100px;
          border-radius: 30px;
          border: 0.5px solid #777;
        }
        .input-field
		{
			width:200px;
			padding: 10px 0;
			margin: 15px 100px;
			border-top: 0;
			border-right: 0;
			border-left: 0;
			padding-left: 20px;
			border-bottom: 1px solid  white;
			outline: none;
			background: transparent;
			color:white;
		}
		 #btn
          {
            width:120px;
            height: 30px;
            margin-left:150px;
            margin-top: 30px;
            cursor: pointer;
            background-color: #777;
            color: white;
          }
    </style>
</head>
<body>

	 <div class="logo">
                <a class="re" href="D:/remote/remote_homepage.html"><i class="fa fa-podcast" aria-hidden="true"></i><span class="text1">remote</span></a>
     </div>

      <div class="content">
    	<h2 style="color: white;margin-left: 130px;margin-top: 40px;padding-top: 20px">Forget password?</h2>
        <form class="forgetpwd" method="post" action="ForgetPassword?action=sendotp">
        	<p style="padding: 15px 15px 15px 20px;color: white"> Don't worry! just fill in your email and we'll help you reset your password!!!</p>
			<input type="email" class="input-field" placeholder="Enter Email" name="email" required><br>
			 <button type="submit" id= "btn">SEND EMAIL</button>
		</form>
</body>
</html>