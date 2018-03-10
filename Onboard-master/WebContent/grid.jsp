<!DOCTYPE html>

<html lang="en">
<head>
  <title>Onboard Modules List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
     	<!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
   
  <script src="js/multiplepages.js"></script>
  <style>
  .left-sidebar {
	    position: relative;
	    height: 100%;
	}
	
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
    #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  
	 div div #testDecom
{
  pointer-events: none;
  /* for "disabled" effect */
  opacity: 0.5;
  
}
  </style>
</head>
<body class="top-navbar-fixed">
<script>
$(document).ready(function() {
    
    $('#testDecom').attr('disabled', true);
});
</script>
        <div class="main-wrapper">
            
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

            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                     <%
              details.setAttribute("nameofproject",rs.getString("projectname"));
              %> 
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="project.jsp" id="sitetitle">
                			    <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                			</a>
                            <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                				<span class="sr-only">Toggle navigation</span>
                				<i class="fa fa-ellipsis-v"></i>
                			</button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle" >
                				<i class="fa fa-bars"></i>
                			</button>
                		</div>
                        <!-- /.navbar-header -->

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
      <%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
<li><a href="logout.jsp" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>
					
                		</div>
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>

        
            <div class="content-wrapper">
                <div class="content-container">
            
                    <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                        <div class="sidebar-content" id='jqxWidget'>
							
                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li id='home' item-selected='true'>
                                        <a href="project.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                                    </li>
                                    <li class="has-children">
                                        <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="application1.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="tree.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a> <span>Parameters</span></a></li>
                                            <li><a> <span>Archival Complexity Calculation</span></a></li>
                                            <li><a> <span>Archival Cost Estimate</span></a></li>
                                        </ul>
                                    </li>

                                    <li>
                                        <a href="applnprior.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <a href='firstinsert.jsp'><span class="">Intake Module</span></a>
                                    </li>

                                    <li class="has-children">
                                        <a href="firstinsert.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="firstinsert.jsp"> <span>Application Information</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>Legacy Retention Information</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>Archive Data Management</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="firstinsert.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="firstinsert.jsp"> <span>Application Data Information</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="firstinsert.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="firstinsert.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="firstinsert.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
            <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Modules List</h2>
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="project.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        
                                    </ul>
                                </div>
                                
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
            
            
<% 
	if(roles.equals("admin")){
	%>
    <!--  admin Role -->  
    <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp">
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
                        <!-- /.section -->
    
                        
<%
}
	else if(roles.equals("TestLead"))
{
%>
<!-- Test Lead -->
 <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
                        <!-- /.section -->

<%
}
else if(roles.equals("ArchivalAdmin"))
{
	%>
	<!-- Archival Admin -->
	 <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" >
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
	<%} 
	
else if(roles.equals("ArchivalProgramManager"))
{
	%>
	<!-- Archival Program Manager -->
 	 <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" >
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
<%
}
else if(roles.equals("LegacyBusinessSME"))
{
%>
      <!-- Technical BUsiness SME -->
     
      <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
      
      
 <%
}
else if(roles.equals("LegacyTechnicalSME"))
{
      %>
      <!-- Legacy Technical SME -->
      <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
                                <!-- /.row -->
</section>
 <%} 
else if(roles.equals("LegacyProgramManager"))
{
 %>    
 <!-- LegacyProgramManager -->
<section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
             

<%
  
         }
else if(roles.equals("ArchivalBusinessAnalyst"))
{
         %>
         
         <!-- Archival Business Analyst -->
<section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
             
</section>
<%
}
else if(roles.equals("ArchivalTechnicalLead"))
{
%>
<section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
             
</section>
<%
}
else if(roles.equals("ArchivalProjectManager"))
{
	%>
	<!-- Archival Program Manager -->
 <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" >
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
             
</section>

<%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
<section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3"  id="testDecom" >
                  <a href="UserConfiguration.jsp">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="AppEmphasize_EditProject.jsp">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="firstinsert.jsp" >
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="archive_exec_samp.jsp">
                   <center>
                   <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Archival Execution</h6>
                   </center> </a>
                </div>

            </div>
        </div>
    </div>

<div class="row mt-50 grid2">
    <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                   <center>
                   <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Decommission Execution</h6>
                   </center>
                   </a>
                </div>

                <div class="col-md-3 col-sm-3" >
                  <a href="#">
                 <center>
                   <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Reporting</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Program Governance</h6>
                 </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3" id="testDecom">
                  <a href="#">
                 <center>
                   <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Finance & Contract Management</h6>
                 </center>
                  </a>
                </div>

            </div>
        </div>
</div>
             
</section>

<%} %>


      </div>
   
</div>

				  					  

                      
                       

                    </div>
                    <!-- /.main-page -->
                 
<!-- Project List End -->

                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->
            
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

<script>
$(document).ready(function() {
    
    $('#testDecom').attr('disabled', true);
});
</script>

        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script src="js/waypoint/waypoints.min.js"></script>
        <script src="js/counterUp/jquery.counterup.min.js"></script>
        <script src="js/amcharts/amcharts.js"></script>
        <script src="js/amcharts/serial.js"></script>
        <script src="js/amcharts/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
        <script src="js/amcharts/themes/light.js"></script>
        <script src="js/toastr/toastr.min.js"></script>
        <script src="js/icheck/icheck.min.js"></script>
        <script src="js/bootstrap-tour/bootstrap-tour.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
       
       
        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>



</body>
</html>