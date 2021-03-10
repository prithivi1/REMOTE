<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>OTP ACCESS</title>
	 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
    <style type="text/css">
     	body
    	{
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #1b141a;
        }
        .logo
        {
            margin-right: 680px;
            padding-top: 20px;
            padding-left: 23px;
            width: 100px;
            background-color: #1b141a;
        }
        .content
        {
          width: 300px;
          height: 250px;
          background-color: #1b141a;
          margin-left: 420px;
          margin-top: 100px;
          border-radius: 30px;
          border: 0.5px solid #777;
        }
        .input-field
		{
			width:150px;
			padding: 5px 0px;
			margin: 15px 80px;
			border-top: 0;
			border-right: 0;
			border-left: 0;
			border-bottom: 1px solid white;
			outline: none;
			background: transparent;
			color:white;
		}
		#btn
          {
            width:80px;
            height: 30px;
            margin-left:110px;
            margin-top: 30px;
            cursor: pointer;
            background-color: #777;
            color: white;
          }
      </style>
<body>
 <div class="logo">
                <a class="re" href="D:/remote/remote_homepage.html"><i class="fa fa-podcast" aria-hidden="true"></i><span class="text1">remote</span></a>
     </div>

      <div class="content">
    	<h2 style="color: white;margin-left: 40px;margin-top: 30px;padding-top: 20px">RESET PASSWORD</h2>

    	<form id="otp" class="input" method="post" action="ForgetPassword?action=validateotp">
			<input type="text" class="input-field" placeholder="Enter OTP" name="otpvalue" required><br>
			 <button type="submit" id= "btn">SUBMIT</button>
		</form>
		</div>
</body>
