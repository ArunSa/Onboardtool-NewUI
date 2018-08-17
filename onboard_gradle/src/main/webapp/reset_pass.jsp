<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
function call_servlet(){
var f=document.loginForm;
f.method="post";
f.action='update_pass';
f.submit(); 
}
</script>
</head>
<body style="background-color:#4169E1">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Reset Password JSP PAGE-----[INFO]");  %>
<% 
HttpSession passwd=request.getSession();
String emailid=(String)passwd.getAttribute("email"); %>
<div class="container">
<h3>Reset Password</h3><br/>
				<form method="post" action="update_pass" role="login" name="loginForm">
					<div class="row"><div class="col-sm-5 form-group"><label>New Password </label><input type="password" name="new_pass"  required class="form-control input-lg" /></div></div>
					<div class="row"><div class="col-sm-5 form-group"><label>Confirm Password </label><input type="password" name="new_cpass"  required class="form-control input-lg" /></div></div>
					<button type="submit"  class="btn btn-lg btn-primary" onclick="call_servlet();">Submit</button>
				</form>
			</div>
	</div>
</body>
</html>