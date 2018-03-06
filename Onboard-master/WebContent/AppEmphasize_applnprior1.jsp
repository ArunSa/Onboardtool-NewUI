<!DOCTYPE html>
<html lang="en">
<head>


 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Projects</title>
 <meta name="description" content="Blueprint: View Mode Switch" />
 <meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
 
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
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
        <script type="text/javascript" src="js_in_pages/applnprior1.js"></script>
   
</head>
<body class="top-navbar-fixed">
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>
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
double ans=0.0;
try {
	int  App_Priorities;
	HttpSession details=request.getSession();
	String ID=(String)session.getAttribute("theName");
	String Application_Name=(String)details.getAttribute("applications");
	String Project_Name=(String)details.getAttribute("projects");
	DBconnection d=new DBconnection();
	Connection conn = (Connection)d.getConnection();
String query3 = "select * from projinfo where id = "+ID;

String Project_name="";

Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
if(rs3.next())
	Project_name=rs3.getString("projectname");
session.setAttribute("newname",Project_name);
String query1="";
if(Project_Name.equals("all"))
	 query1 = "select * from appinfo where prjname = '"+Project_name+"' and complexity is not null";
else
	 query1 = "select * from appinfo where prjname = '"+Project_Name+"' and appname='"+Application_Name+"' and complexity is not null";
ResultSet rs1 = st1.executeQuery(query1);
String query2= "select count(prjname) As total from appinfo where prjname='"+Project_name+"' and complexity is not null";
ResultSet rs2 = st2.executeQuery(query2);
{
%>

<%if(rs2.next())
{
App_Priorities=rs2.getInt("total");
System.out.println(App_Priorities);

%>

<form class="form-signin" name="loginForm" method="post">

 <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">

                			<a class="navbar-brand" href="project.jsp" id="sitetitle">
                			    <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                			</a>
                           
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
<li><%
                         String uid=(String)details.getAttribute("username");
                         String roles=(String)details.getAttribute("role");%>
 <p><%=uid%>&nbsp;logged in as &nbsp;<span><%=roles%></span></p>
</li> 
<li><a href="logout.jsp" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                                        <a href="editproject.jsp"><span class="">App Emphasize Module</span></a>
                                    </li>
                                    <li class="has-children">
                                        <a href="editproject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="editproject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="tree.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="editproject1.php"> <span>Parameters</span></a></li>
                                            <li><a href="editproject.php"> <span>Archival Complexity Calculation</span></a></li>
                                            <li><a href="editproject1.php"> <span>Archival Cost Estimate</span></a></li>
                                        </ul>
                                    </li>

                                    <li>
                                        <a href="AppEmphasize_applnprior1.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
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
           
                    
<section>

    <div class="row">
      <div class="container">
                    <h1 class="page-header">Projects</h1>
                      <div class="main">
                      
          <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("HyperCare");
if(initiate == null)
	initiate="0";
if(plan == null)
	plan="0";
if(execute == null)
	execute="0";
if(hypercare == null)
	hypercare="0";
%>                            

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div  class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
                              
         <div class="row">
		
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                
                </div>
                
                <div class="col-xs-3 bs-wizard-step complete"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">2</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">3</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
            </div>
            <br/>
        
        
        
	</div>
        
                                
                                
  <div class="table-responsive" id="table-scroll"  > 
   
    <table class="js-dynamitable table table-bordered" id="myTable" >
      
      <thead>

        <tr>
          <th>Application Name</th>
          <th>Complexity</th>
          <th>Estimated Size of xDB </th>
          <th>Estimated Service Cost </th>
          <th>Priorities</th>
         
    </tr>
        
        
      </thead>
     
      <tbody>   
        
      <%int i=0	; %>
          <%
        
while(rs1.next()){

%>

        <tr>
        
          <td class="edit_row" style="cursor:pointer" id="11"><span class="test"><input type="text" id="project_name<%=i%>" name="project_name<%=i%>" value="<%=rs1.getString("appname") %>"></span></td>
          <td class="row_s" style="cursor:pointer" id="22"><span class="test"><input type="text" id="complexity<%=i%>" name="complexity<%=i%>" value="<%=rs1.getString("complexity") %>"></span></td>
          <td class="row_t" style="cursor:pointer" id="33"><span class="test"><input type="text" id="est_db_size<%=i%>" name="est_db_size<%=i%>" value="<%=rs1.getString("est_db_size") %>"></span></td>
          <td class="row_d" style="cursor:pointer" id="44"><span class="test"><input type="text" id="est_cst<%=i%>" name="est_cst<%=i%>" value="<%=rs1.getString("est_cst") %>"></span></td>
          <td class="row_d" id="55">
          <span class="test"><input type="text" name="priority<%=i %>" id="priority<%=i %>" value="<%=rs2.getInt("total")-i %>"></span>
        </td>

       
         
         
        </tr>
        <%
i++;        
} 
        
	
        %>
        
    </tbody>
    </table>
 
      <script>
// JavaScript script from: http://coursesweb.net/javascript/

// gets all the .edit_row cells, registers click to each one
var edit_row = document.querySelectorAll('#myTable .edit_row');
for(var i=0; i<edit_row.length; i++) {
  edit_row[i].addEventListener('click', function(e){
    // get parent row, add data from its cells in form fields
    var tr_parent = this.parentNode;
    document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
    document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
    document.getElementById('est_db_size').value = tr_parent.querySelector('.row_t').innerHTML;
    document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
    }, false);
}

</script>
     
  </div>
  <br />
                                
                        
                            <br/>
                      
         
                                                                                            
                                   
                                   
<button type="button" class="btn btn-primary" onclick="call()" >Submit</button>     
     
                    <a href="tree1.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                    
                    <a href="tree1.jsp" style="float:right">Click here to enter data for application</a>
                                      <% } 
                                      
%> 
                           
                                </div>                                 
                            </div>
                             <%

}}
catch(Exception e){}
%>

                   <!-- /.row -->
</section>
                        <!-- /.section -->

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->
                           
        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>


        <script type="text/javascript">
            $(document).ready(function() {
                $(".lis").click(function() {
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
                });
                $(".gr").click(function() {
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
                });
            });
        </script>
      

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