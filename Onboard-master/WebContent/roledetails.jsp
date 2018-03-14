<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>List Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
		<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <style>
    
	<style>
	
	input.noact
{
border:none;
border-color:transparent;
width:40px;
background-color:transparent;
}

input.act
{
border:none;
border-color:transparent;
width:45px;
background-color: transparent;
}
	.glyphicon {
    font-size: 35px;
}
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:10px;
}
 </style>
      <script>
	function calls()
	{
		    var x = document.getElementById('myDiv1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } 
		    else {
		        x.style.display = 'none';
		    }
		
	}
	</script>
	<script>
	function edit_serv()
	{
		 var f=document.loginForm;
		    f.method="post";
		    f.action='Role_details';
		    f.submit(); 
	}
	
	</script>
	<script>
function checkk()
{
	document.getElementById('sub_btn').disabled = true;
	}
</script>  
<style>
    body
    {
     margin:0; padding:0; 
    color:#73879C;
    font-family: "Helvetica Neue",Roboto,Arial,"Droid Sans",sans-serif;
    }
    .navbar-brand {
    
    padding: 10px;
  border: 0px;
  border-radius: 1px;
   font-size: 1.15em;
  font-weight: 400;
    }
    .
    
   .navbar-brand {
  color: black;
}

.navbar-brand:hover {
  color: #ffffff;
  text-shadow: 1px -1px 8px #b3e9ff;
}
    
    
    #sitetitle{
    
    font-size: 22px;
    margin:auto;
}


    
    

   #sidemenu
   {
   
   background:#3276B1 ;
   position: fixed;
	top: 45px;
	left: -1%;
	padding-left:0px;
	width:300px !important;
	bottom: 0px;
	overflow: auto;
	color:white;
	text-size:30%;
	} 
 


#sidemenu a:hover {
    background-color: #ddd;
    color: black;
    }

   </style>
</head>
<body>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
	response.sendRedirect("Login.html");
}
%>
<%
HttpSession details=request.getSession();
String info=(String)details.getAttribute("admin");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
String query="select * from role_details";
String query1="select * from user_details";
Statement s=conn.createStatement();
Statement s1=conn.createStatement();
ResultSet rs=s.executeQuery(query);
ResultSet rs1=s1.executeQuery(query1);
int count=0;
%>
<form class="form-signin" name="loginForm" method="post" action="Role_details">
<div class="wrapper">
    <div class="sidebar" data-color="blue">
    	<div class="sidebar-wrapper">
                       <ul class="nav">
                <li><br/><br/><br/>
                    <a href="Project_List.jsp">
                         <i class="glyphicon glyphicon-home"></i>
                        <p>Home</p>
                    </a>
                </li>
                <li>
                    <a href="Registration.jsp">
                        <i class="pe-7s-user"></i>
                        <p>User Configuration</p>
                    </a>
                </li>
                <li>
                    <a href="userslist.jsp">
                        <i class="pe-7s-note2"></i>
                        <p>Users List</p>
                    </a>
                </li>
                <li class="active">
                    <a href="roledetails.jsp">
                        <i class="pe-7s-news-paper"></i>
                        <p>Authorization</p>
                    </a>
                </li>
                         </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class=" navbar-fixed-top" style="background-color:#3276B1">
            <div class="container-fluid">
                
    
                 
                    <a class="navbar-brand" style="color:white"id="sitetitle">Onboarding Tool</a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                        <li>
                           <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
<br/><br/><br/>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Authorization List</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
  <th>Role</th>
  <th>Admin</th>
  <th>AppEmphasize</th>
  <th>Intake</th>
  <th>Archival Execution</th>
  <th>Decommision</th>
  <th>Program governance</th>
  <th>Reporting</th>
  <th>Finance</th>
                                    </thead>
                                    <tbody>
                                      <%
                                  
                                      int i=0;
                                      while(rs.next()){ 
                                      %>
                                      <tr>
                                      <td><input class="act" style="width:170px;" type="text" name="role<%=i %>" value="<%= rs.getString(1) %>"></td>
                                      <td><input class="act" type="text" name="admin<%=i %>" value="<%= rs.getString(2) %>"></td>
                                      <td><input class="act" type="text" name="app_emp<%=i %>" value="<%= rs.getString(3) %>"></td>
                                      <td><input class="act" type="text" name="intake<%=i %>" value="<%= rs.getString(4) %>"></td>
                                      <td><input class="act" type="text" name="arch_exe<%=i %>" value="<%= rs.getString(5) %>"></td>
                                      <td><input class="act" type="text" name="decomm<%=i %>" value="<%= rs.getString(6) %>"></td>
                                      <td><input class="act" type="text" name="prgm_gov<%=i %>" value="<%= rs.getString(7) %>"></td>
                                      <td><input class="act" type="text" name="report<%=i %>" value="<%= rs.getString(8) %>"></td>
                                      <td><input class="act" type="text" name="finance<%=i %>" value="<%= rs.getString(9) %>"></td>
                                      </tr> 
                                      <%
                                      }
                                 
%>  
                                                                           </tbody>
                                </table>
 <input type="text" id="pwqej" value="<%= info %>" hidden>
 &nbsp;&nbsp;&nbsp;<button type="button" id="sub_btn" class="btn btn-primary" onclick="edit_serv()">Submit</button>                           </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

     


    </div>
</div>
  <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>   
</form>
</body>


    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>


</html>
