<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	<title>ONBOARD</title>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	
	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">

	<script>
	function res()
	{
		var x=document.getElementById("Answer").value;
		var y=document.getElementById("ans").value;
		var name=document.getElementById("uname").value;
		if(x==y){
			window.location.href='mail_uname?uname='+name;
		}
		else
			window.alert("wrong answer");
	}
	</script>
</head>
<body style="background-color:#4169E1">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed reset_uname JSP PAGE-----[INFO]");  %>
 <%@page language="java"%>
<%@page import="java.sql.*"%>
<% 
String x=request.getParameter("email");
HttpSession passwd=request.getSession();
passwd.setAttribute("emailid",x);
String rl=request.getParameter("role");
String pj=request.getParameter("project");
String Qn="";
String ans="";
String uname="";
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
String query = "SELECT * from Admin_UserDetails where email='"+x+"' and roles='"+rl+"' and projects='"+pj+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
if(rs.next()){
	 Qn=rs.getString(9);
	 ans=rs.getString(10);
	 uname=rs.getString(1);
	 
}

%>
	
	<div class="container">
	<h3><span style="color:white"><%=Qn %></span></h3>
<div class="row"><div class="col-sm-5 form-group">	<input type="text" id="Answer"  class="form-control input-lg" />
<input type="text" id="ans"  class="form-control input-lg" value="<%=ans %>" style="display:none;" />	
<input type="text" id="uname"  class="form-control input-lg" value="<%=uname %>" style="display:none;" />	
<br/><button type="button" class="btn btn-primary" onclick="res()">Submit</button>		</div>
	</div>
	</div>

	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>