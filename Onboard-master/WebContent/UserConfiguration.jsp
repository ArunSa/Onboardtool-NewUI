<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>UserConfiguration Page</title>

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
	var har=[];
	var his=[];
	function oop(name)
	{
		
		if(har.indexOf(name)>=0)
			{
			var i = har.indexOf(name);
			if(i != -1) {
				har.splice(i, 1);
			}
			}
		else
			har.push(name);
	}
	function ops(name)
	{
		
		if(his.indexOf(name)>=0)
			{
			var i = his.indexOf(name);
			if(i != -1) {
				his.splice(i, 1);
			}
			}
		else
			his.push(name);
	}
	
	
	function servlet_call()
	{
		var f=document.loginForm;
	    f.method="post";
	    f.action='deactivate?values='+har+'&values2='+his;
	    f.submit(); 
	}
	</script>
	<script>
	var arr="";
	function ooo()
	{
		var e=document.getElementById("dates-field2");
	for(i=0;i<9;i++)
		{
		if(e[i].selected==true){
			arr=arr+(e[i].value);
		}
		}
	
		}
	function qq()
	{
		var msg=document.getElementById("message").value;
		var ffname=document.getElementById("fname").value;
		var llname=document.getElementById("lname").value;
		var email=document.getElementById("email_val").value;
		var project=document.getElementById('proj').value;
		var app=document.getElementById('app').value;
		//window.alert(project);
		if(ffname==="" || llname==="" || arr==="")
			window.alert("fill the mandatory fileds");
		else
			{
			 if((email.includes("@"))&&(email.includes(".com")))
				{
				
				 var f=document.loginForm;
				    f.method="post";
				    f.action="sendMail?roless="+arr+"&mailid="+email+"&message="+msg+"&fname="+ffname+"&lname="+llname+"&project="+project+"&application="+app;
				    f.submit();
				}
			 else
				 window.alert("Invalid EmailID");
			}
	}
	</script>
	<script>
function checkk()
{
	
	document.getElementById('fname').readOnly = true;
	document.getElementById('message').readOnly = true;
	document.getElementById('lname').readOnly = true;
	document.getElementById('dates-field2').disabled = true;
	document.getElementById('email_val').readOnly = true;
	document.getElementById('proj').readOnly = true;
	document.getElementById('send_btn').disabled = true;
	}
</script> 
</head>
<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
	response.sendRedirect("Login.html");
}
%>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
<%
HttpSession details=request.getSession();
String prjname=(String)details.getAttribute("nameofproject");
String info=(String)details.getAttribute("admin");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
String query="select * from user_details";
String query1="select * from user_details";
Statement s=conn.createStatement();
Statement s1=conn.createStatement();
ResultSet rs=s.executeQuery(query);
ResultSet rs1=s1.executeQuery(query1);
String query2="select * from projinfo";
Statement s2=conn.createStatement();
ResultSet rs2=s2.executeQuery(query2);
int count=0;
%>
<form class="form-signin" name="loginForm" method="post">
<div class="wrapper">
    <div class="sidebar" data-color="blue">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
                       <ul class="nav">
                <li><br/><br/><br/>
                    <a href="Project_List.jsp">
                        <i class="glyphicon glyphicon-home"></i>
                        <p>Home</p>
                    </a>
                </li>
                <li class="active">
                    <a href="UserConfiguration.jsp">
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
                <li>
                    <a href="roledetails.jsp">
                        <i class="pe-7s-news-paper"></i>
                        <p>Authorization</p>
                    </a>
                </li>
                         </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar-fixed-top" style="background-color:#3276B1">
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

<div id="config" class="tabcontent">
 <div class="container">
 <br/><div class="col-lg-10" style="background-color:white;border-radius:5px;margin-left:20px;">
	<br/><br/><div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-5 form-group">
							
								<label>First Name<span class="glyphicon glyphicon-asterisk"></span></label>
							<input type="text" id="fname" name="fname"  class="form-control" />
					</div>
					<div class="col-sm-5 form-group">
							
							 <label for="comment">Message</label>
      <textarea class="form-control" rows="5" id="message"></textarea>
					</div>
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Last Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text"  class="form-control" id="lname" >
							</div>
							<div class="col-sm-5 form-group">
								<label>Email<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="email" class="form-control" id="email_val" >
							</div>
						</div>		
						<div class="row">			
							<div class="col-sm-5 form-group">
								 <label>Role Name<span class="glyphicon glyphicon-asterisk"></span></label>
    <div class="col-lg-13">
        <select id="dates-field2" class="multiselect-ui form-control" multiple="multiple" name="myOption">
            <option value="ArchivalAdmin">archival admin</option>
            <option value="LegacyTechnicalSME">legacy technical sme</option>
            <option value="LegacyBusinessSME">legacy business sme</option>
            <option value="ArchivalProgramManager">archival program manager</option>
            <option value="ArchivalProjectManager">archival project manager</option>
            <option value="LegacyProgramManager">legacy program/project manager</option>
            <option value="ArchivalBusinessAnalyst">archival business analyst</option>
            <option value="ArchivalTechnicalLead">archival technical lead</option>
            <option value="ArchivalDeveloper">archival developer</option>
            <option value="TestLead">test lead</option>
        </select>
    </div>
</div>
</div>
<script type="text/javascript">
$(function() {
    $('.multiselect-ui').multiselect({
        includeSelectAllOption: true
    });
});
</script>
						
							<div class="row">					
					<div class="col-sm-5 form-group">
						<label>Projects</label>
						 <select id="proj" class="form-control" name="proj" onChange="calx()" required > 
						 <option></option>
						 
                                         <% while(rs2.next()) { %>
                                                <option><%=rs2.getString("projectname") %></option>
                                                
                                          <%}%>                                                 
                                            </select>
					</div>	
					<script>
						function calx()
						{
							
							var prj=document.getElementById('proj').value;
							var select = document.getElementById("app");
							
							
							var length = select.options.length;
							document.getElementById("app").options.length = 0;
		
							var options = [];
							var option = document.createElement('option');
							var i;
							var prjarray=[];
							var apparray=[];
							<% String query3="select appname,prjname from appinfo";
							Statement s3=conn.createStatement();
							ResultSet rs3=s3.executeQuery(query3);
							
							while(rs3.next()){
							%>	
							
							apparray.push("<%=rs3.getString("appname") %>");
							prjarray.push("<%=rs3.getString("prjname") %>");
		                         <% 
		                       
							}
							%>
							
							var k=0;
							for(i=0;i<=prjarray.length;i++)
								{
								if(prj==prjarray[i])
								{
									
									option.text = option.value = apparray[i];
								    options.push(option.outerHTML);
								  
								}		
			
							}
							select.insertAdjacentHTML('beforeEnd', options.join('\n'));
						}
							
										</script>	
					<div class="col-sm-5 form-group" id="cont">
						<label>Applications</label>
						<select id="app" class="form-control"></select>
						</div>	
					</div>
					<br/>
					 <input type="text" id="pwqej" value="<%= info %>" hidden>  
					<button type="button" class="btn btn-primary" id="send_btn" onclick="ooo();qq();">Send Invites</button>	
					<br/>		<hr/>		
					</div>
				
				</div>
	</div>
	</div>
</div>




</form>
            


    </div>
</div>
 
</form>
 <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>    
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
