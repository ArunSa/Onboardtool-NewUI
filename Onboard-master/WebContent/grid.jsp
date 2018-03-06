<!DOCTYPE html>

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    div div #testDecom
{
  pointer-events: none;
  /* for "disabled" effect */
  opacity: 0.5;
  
}
    #navbar {
    color:#008B8B;
    
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

.img-rounded {
width:100%;
    border-top-left-radius: 0.5px;
    border-top-right-radius: 0.5px;
    border-bottom-left-radius: 0.5px;
    border-bottom-right-radius: 0.5px;
    padding-top: 10px;
    
}

.img-rounded:hover {
    box-shadow: 0px 0px 10px #797373;
     border-top-left-radius: 5px;
    border-top-right-radius: 5px;
       border-bottom-left-radius: 5px;
        border-bottom-left-radius: 5px;
}
  </style>
  <script src="js/multiplepages.js"></script>
  <script language="javascript"></script>

 
</head>
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
	response.sendRedirect("Login.html");
	
}
else{
	String name=(String)session.getAttribute("ID");
	  HttpSession details=request.getSession(); 
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "strutsdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="password123";
session.setAttribute("theName", name);
String roles=(String)details.getAttribute("role");
int sumcount=0;
Statement st,st2;
try{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
Statement st1;
String query1 = "select * from projinfo where id = "+name;
st1 = con.createStatement();
ResultSet rs = st1.executeQuery(query1);
if(rs.next())
{
	
	
	
%>
<div class="container">
<nav class="navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                    <a class="navbar-brand" href="Project_List.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%=rs.getString("projectname") %></a>
              <%
              details.setAttribute("nameofproject",rs.getString("projectname"));
              %>
                <div id="navbar" class="navbar-collapse collapse" >
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                          <img src="assets/images/logo1.png" id="image" class="img" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li> 
                        <li>
                            <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
     
        </div>
        
    
        

  <br><br>
<div class="container-fluid bg-3 text-center">
<div class="container-fluid bg-3 text-center">  
<div class="container-fluid bg-3 text-center">
<div class="container-fluid bg-3 text-center">  
 <br>
  
<br>
<br>
<br><br>
<br><br>
<br><br>
<br><br>
<div class="col-sm-3">
</div>

<% 
	if(roles.equals("admin")){
	%>
    <!--  admin Role -->  
    
           
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
          <a href="UserConfiguration.jsp">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
           </a>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
            <a href="#">
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="#">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="#">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="#">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        

<%
}
	else if(roles.equals("TestLead"))
{
%>
<!-- Test Lead -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="90" alt="Avatar" >
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
     
          <div class="well">
         <a href="#">
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="90" alt="Avatar" float="left">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>

<%
}
else if(roles.equals("ArchivalAdmin"))
{
	%>
	<!-- Archival Admin -->
	 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           <a href="UserConfiguration.jsp">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
           </a>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">

        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
	
	<%} 
	
else if(roles.equals("ArchivalProgramManager"))
{
	%>
	<!-- Archival Program Manager -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
            <a href="UserConfiguration.jsp">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
           </a>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        


<%
}
else if(roles.equals("LegacyBusinessSME"))
{
%>
      <!-- Technical BUsiness SME -->
     <div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      
      
      
      
      
 <%
}
else if(roles.equals("LegacyTechnicalSME"))
{
      %>
      <!-- Legacy Technical SME -->
       <div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 
 <%} 
else if(roles.equals("LegacyProgramManager"))
{
 %>    

<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 


<%
  
         }
else if(roles.equals("ArchivalBusinessAnalyst"))
{
         %>
         
         <!-- Archival Business Analyst -->
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well"> 
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 

<%
}
else if(roles.equals("ArchivalTechnicalLead"))
{
%>
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 
<%
}
else if(roles.equals("ArchivalProjectManager"))
{
	%>
	<!-- Archival Program Manager -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           <a href="UserConfiguration.jsp">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
           </a>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        


<%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar" >
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>



<%} %>



      </div>
   
</div>
<div class="col-sm-3"></div>
<br><br>
</div>
</div>
</div>
</div>

  


					<%
					
}
%>

<%
}
catch(Exception e){
e.printStackTrace();
}
}
%>
</body>

<script>
$(document).ready(function() {
    
    $('#testDecom').attr('disabled', true);
});
</script>
</html>