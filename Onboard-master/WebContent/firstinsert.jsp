<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Projects</title>
		<meta name="description" content="Blueprint: View Mode Switch" />
		<meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script type="text/javascript" src="js_in_pages/firstinsert.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/firstinsert.css" type="text/css" />

  
	</head>
	<!--from  w  w w  . ja  va 2 s.co  m-->
  <body style='margin:30px'>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
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

String det=(String)session.getAttribute("theName");

try{
	String query3="";
	HttpSession details=request.getSession();
	DBconnection d=new DBconnection();
	Connection con = (Connection)d.getConnection();
String prj=(String)details.getAttribute("projects");
String appl=(String)details.getAttribute("applications");
String username=(String)details.getAttribute("u_Name");
String Project_Name=(String)details.getAttribute("nameofproject");
String visit_query="select * from visits";
Statement visit_st = con.createStatement();
ResultSet visit_rs = visit_st.executeQuery(visit_query);
int flag=1;

Date date = new Date();
SimpleDateFormat ft,ft1;
ft=new SimpleDateFormat ("yyyy-MM-dd");
ft1=new SimpleDateFormat ("hh:mm:ss");
String strDate=ft.format(date);
String strTime=ft1.format(date);

if(prj.equals("all"))
	 query3 = "select * from projinfo where id="+det;
	else
	 query3 = "select * from projinfo where projectname='"+prj+"'";

Statement st3 = con.createStatement();
ResultSet rs3 = st3.executeQuery(query3);





%>

<form method="post" name="form" action="Appin">
<div class="container">
<nav class=" navbar-fixed-top" style="background-color:#3276B1">
            <div class="container-fluid">
                
                     <%if (rs3.next()) {
                    	 String name=rs3.getString("projectname");
                    	 System.out.println("the projectname is "+name);
                    	 String query="";
                    	 if(prj.equals("all"))
                    	  query = "select * from appinfo where prjname = '"+name+"'";
                    	 else
                    		 query = "select * from appinfo where prjname = '"+name+"' and appname='"+appl+"'";
                    	 Statement st = con.createStatement();
                    	 ResultSet rs = st.executeQuery(query);
                     
                     %>
                  <a class="navbar-brand" href="project.jsp" style="color:white"id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                  
                        <li item-selected='true'>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
<li><%
                         String uid=(String)details.getAttribute("username");
                         String roles=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=roles%></span></p>
</li> 
                        <li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-sm-2 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                    <br>
                        
                        
                    </ul>
                </div>
                
                <div class="col-md-9">
                    <h1 class="page-header">Applications</h1>
                    
                    <div class="main">
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
				
					<div class="cbp-vm-options">
					
					
		<button type="button" class="btn btn-primary pull-right"  name="newpr"   onClick="editRecord();" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  New Application
</button>
					
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid">Grid View</a>
						<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List View</a>
					</div>
					
	<ul>
<%
String sequnce="";
while(rs.next()){
%>			
						<li>
							<h3 class="cbp-vm-title left-col primary" name="name"><%= rs.getString("appname")%></h3>
<% 
String detail="";
String q3="select seq_num from archive_exec where projects='"+name +"' and name='"+rs.getString("appname")+"'";
Statement stt = con.createStatement();
ResultSet rst = stt.executeQuery(q3);
if(rst.next())
	detail=rst.getString(1);

String q1="select * from archive_exec where projects='"+name+"' and seq_num>"+detail+" and seq_num<"+(detail+70)+" and level=3";
Statement st2 = con.createStatement();
ResultSet rs2 = st2.executeQuery(q1);
int l=-1;
while(rs2.next()){
	l++;
	System.out.println(rs2.getString(15));
	if(rs2.getString(15).equals("100"))
		continue;
	else
	{
		System.out.println(rs2.getString(15));
%>
							<center><div class="progress center-col cbp-vm-detail">
 <div class="progress-bar progress-bar-success" id="prog_bar<%=l %>" role="progressbar" aria-valuenow="<%=rs2.getString(15) %>"
  aria-valuemin="0" aria-valuemax="100" style="width:<%=rs2.getString(15) %>%">
    <%=rs2.getString(15) %>%
  </div>
  
							
</div> 		
</center>
	<%if(Integer.parseInt(rs2.getString(15))<35){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-danger progress-bar-striped';</script>

<%} 
else if(Integer.parseInt(rs2.getString(15))<65){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-warning progress-bar-striped';</script>
<%} %>
<% if(l==1){%>
<%if(Integer.parseInt(rs2.getString(15))<35){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-danger progress-bar-striped';</script>
<%} 
else if(Integer.parseInt(rs2.getString(15))<65){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-warning progress-bar-striped';</script>
<%} %>
<h5 class="cbp-vm-title right-col primary" >Development</h5>
<%} else if(l==2){ %>
<%if(Integer.parseInt(rs2.getString(15))<35){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-danger progress-bar-striped';</script>
<%} 
else if(Integer.parseInt(rs2.getString(15))<65){
%>
<script>document.getElementById('prog_bar<%=l %>').className='progress-bar progress-bar-warning progress-bar-striped';</script>
<%} %>
<h5 class="cbp-vm-title right-col primary" >Testing</h5>
<%} %>
<h5 class="cbp-vm-title right-col primary" ><%=rs2.getString(3) %></h5>
<%
break;
}
} %>

			
							<button type="button" class="btn btn-primary" onClick="edit('<%= rs.getString("appname")%>');">
 View/Update
</button>
						</li>
												
						<%
}
%>			

</ul>
<%
}}
catch(Exception e){
e.printStackTrace();
}
%>
				</div>
			</div> 
   
       </div>
                
            </div>
            
      
        
</form>
<script src="js/classie.js"></script>
		<script src="js/cbpViewModeSwitch.js"></script>
  </body>
</html>