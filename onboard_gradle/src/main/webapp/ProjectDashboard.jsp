<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Project_Dashboard</title>
<meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
         <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
           <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
       
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
         <link rel="stylesheet" href="css/ProjectDashboard.css" media="screen" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
     
       

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
       <script type="text/javascript" src="js/paging.js"></script> 
       
  	
	<script type="text/javascript" src="js_in_pages/tree.js"></script>
	<!-- graph -->
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <style>
  
   .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
              
body
    {
    background-color:#eaf3fd;
      font-family: "Poppins", sans-serif;
    margin: 0;
    font-weight: 300;
    }
    
        </style>
        
        <!-- ========== COMMON JS FILES ========== -->
</head>
 <body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed ProjectDashboard JSP PAGE-----[INFO]");  %>
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
response.sendRedirect("Login.jsp");
}
%>
<%

HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String info=(String)details.getAttribute("app_emp");
try {
String det=(String)session.getAttribute("theName");
String proj_count="",active_users="";
int Serial_No=0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
String query = "select count(*) from AppEmphazize_ProjectDetails";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next())
{
	proj_count=rs.getString(1);
	
}

String query1 = "select count(*) from Admin_UserDetails where stats = 'active'";
Statement st1 = conn.createStatement();
ResultSet rs1 = st.executeQuery(query1);
while(rs1.next())
{
	active_users=rs1.getString(1);
	
}
String query3 = "select * from AppEmphazize_ProjectDetails";
Statement st3 = conn.createStatement();
ResultSet rs3 = st.executeQuery(query3);

%>
 


<div class="main-wrapper">
          <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
							<a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
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
                			 
                    
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-</a>
																					  
					   
                    
                    
                			
                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
					 <ul class="nav navbar-nav navbar-right">
					 	<%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
							<li> <a href="logout.jsp" class="text-center"><i class="fa fa-sign-out"></i> Logout</a> </li>
                     </ul>
					
                		</div>
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>
   
   <div class="content-wrapper" >
                <div class="content-container" >
                      <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                        <div class="sidebar-content" id='jqxWidget'>
							
                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li id='home' item-selected='true'>
                                        <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                                    </li>
                                    <li class="has-children">
                                        <a href="AppEmphasize_EditProject.jsp" ><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                  <li class="has-children">
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                             </ul>
                                    </li>

                                    <li>
                                        <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>

 <li class="nav-header">
                                        <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                    </li>

                                    <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                            <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
   <li class="has-children"><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
               </li> 
                <li class="nav-header">
                                        <a href='Applications.jsp'><span class="">Report Module</span></a>
                                    </li>
                                      <li class="has-children">
                                        <a href=""><i class="fa fa-archive"></i> <span>Dashboards</span> <i class="fa fa-angle-right arrow"></i></a>
                                         <ul class="child-nav">
                                            <li><a href="RoleDashboard.jsp" > <span>Role Dashboard</span></a></li>
                                            <li><a href="ProjectDashboard.jsp" class="active-menu"> <span>Project Dashboard</span></a></li>
                                            <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a></li>
                                          </ul>
                                    </li>
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
                    
                    
                    <div class="main-page" >
       <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Dashboard</h2>
                                   
                                </div>
                                
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">Project Dashboard</li>
                                    </ul>
                                </div>
                                <!-- /.col-sm-6 -->
                                <div class="col-sm-6 text-right hidden-xs">
                                    <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                                </div>
                                <!-- /.col-sm-6 -->
                            </div>
                            <!-- /.row -->
                            <br>
                               <div class="row">
              <div class="col-lg-4 col-md-4">
                        <div class="cardo card-orange">
                            <div class="card-body">
                            
                                <div class="ui-widgetf">
								  <h1 class="ui-values"><%=proj_count %></h1>
								  <span class="ui-label">No of Projects</span>
								</div> 
                            </div>
                        </div>
                    </div>
                    
                    <!-- col -->
                    
                    <div class="col-lg-4 col-md-4">
                        <div class="cardo card-second ">
                            <div class="card-body">
                               <div class="ui-widgets">
						    <h1 class="ui-values"> 1</h1>
						     <span class="ui-label">No.of Clients</span>
						</div>
                            </div>
                        </div>
                    </div>
              
                   <div class="col-lg-4 col-md-4">
                   
                        <div class="cardo card-primary ">
                       
                            <div class="card-body">
                            
                               <div class="ui-widgett">
                                
							  <h1 class="ui-values"><%=active_users %></h1> 
							  <span class="ui-label">Active Users</span>
							  
							</div>
                            </div>
                        </div>
                    </div>
              </div>  
              </div>
              <br>  
              <!-- row -->
              <div class="container-fluid">
                 <div class="row">

                    <div class="col-12">

                        <div class="portlet">
                            <div class="portlet-heading">
                                <h3 class="portlet-title text-dark text-uppercase">
                                    Projects Details
                                </h3>
                              <br>
                            
                            </div>
                            <div id="portlet" class="panel-collapse">
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Project Name</th>
                                                <th>Start Date</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Assign</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <%while(rs3.next())
                                           {
                                        	   Serial_No++;                                    		
                                        %>
                                            <tr>
                                                <td><%=Serial_No %></td>
                                                <td><%=rs3.getString("projectname") %></td>
                                                <td><%=rs3.getString("Intdate") %></td>
                                                <td><%=rs3.getString("Enddate") %></td>
                                                <td><span class="label label-success">Completed</span></td>
                                                <td>Rajesh</td>
                                            </tr>
                                           <%} %>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->

                </div> 
                                      
                        </div>
                        <!-- /.container-fluid -->
                
               
            </div>
                </div>
                   
                   
                   
                   
                   
                   
                   
                   
                </div>
</div>
</div>
</div>

<%

}
catch(Exception e){
e.printStackTrace();
}
%>
        
    
       <!-- ========== COMMON JS FILES ========== -->
       
      
       
       
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        
        
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
        <script src="js/main.js"></script>
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>
       
        <!-- ========== PAGE JS FILES ========== -->
        
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

</body>
</html>