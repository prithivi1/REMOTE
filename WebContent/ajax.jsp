<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<form name="f1"  action="" autocomplete="off">
    Username :<input type="text" name="user" onkeyup="test(this.value);" />
              <input type="submit" value="submit" />
  </form>

     <div id="s1">
			hello
     </div>
     <script type="text/javascript">
		
		  function test(str)
		  {
		   		var ob=new XMLHttpRequest();
			    ob.onreadystatechange=function ss()
		   		{
			    	if(this.readyState==4 && this.status==200)
			    	{
			        	document.getElementById("s1").innerHTML=ob.responseText;
			    	}else{
			    		document.getElementById("s1").innerHTML="error";
			    	}
			   	}
		   		ob.open("GET","Demo4?msg="+str,true);
		   		ob.send();
		  }

 </script>
</body>
</html>