
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Onboard - Options</title>

        <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
        <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
            h6 { line-height: 1.5em; }
            
             #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  

        </style>

    </head>
    <body class="top-navbar-fixed">
    
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
        <div class="main-wrapper">

		
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="index.php">
                			    <img src="images/logo1.png" alt="Options - Admin Template" class="logo">
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

                        </li>
                    </ul>
					
                		</div>
                		
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>


            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    
                    <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                        <div class="sidebar-content">
                            
                            <!-- /.user-info -->

                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-home"></i> <span>Home</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <span class="">App Emphasize Module</span>
                                    </li>
                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="projects.php"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="editproject1.php"> <span>Parameters</span></a></li>
                                            <li><a href="editproject.php"> <span>Archival Complexity Calculation</span></a></li>
                                            <li><a href="editproject1.php"> <span>Archival Cost Estimate</span></a></li>
                                        </ul>
                                    </li>

                                    <li>
                                        <a href="#"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <span class="">Intake Module</span>
                                    </li>

                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="#"> <span>Application Information</span></a></li>
                                            <li><a href="#"> <span>Legacy Retention Information</span></a></li>
                                            <li><a href="#"> <span>Archive Data Management</span></a></li>
                                            <li><a href="#"> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="#"> <span>Application Data Information</span></a></li>
                                            <li><a href="#"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a href="#"> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="#"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="#"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="#"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <!-- /.side-nav 
                                <div class="purchase-btn hidden-sm hidden-xs">
                                    <a href="https://themeforest.net/item/options-admin-responsive-web-application-ui-kit/19796742?license=regular&open_purchase_for_item_id=19796742&purchasable=source&ref=salttechno" target="_blank" class="btn btn-success btn-labeled">Purchase Now<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></a>
                                </div> -->
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->

<!-- Projects List Start -->

                    <div class="main-page">
                       
                        <!-- /.container-fluid -->

<section>
<div class="row mt-50 grid1">
</div>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="editproject1.php">
                   <center>
                   <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar" >
                   <h6 class="mt-5">Admin</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="editproject.php">
                 <center>
                   <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">App Emphasize</h6>
               </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="editproject1.php">
                   <center>
                   <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Intake</h6>
                   </center>
                  </a>
                </div>

                <div class="col-md-3 col-sm-3">
                  <a href="editproject.php">
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

                    </div>
                    <!-- /.main-page -->

                   
                                            
<!-- Project List End -->

                </div>
                <!-- /.content-container -->
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
        <script type="text/javascript">
            $(document).ready(function() {
                $(".process1").mouseover(function() {
                    $(".process1 .progress-bar").addClass("active");
                })
                $(".process1").mouseleave(function() {
                    $(".process1 .progress-bar").removeClass("active");
                })

                $(".process2").mouseover(function() {
                    $(".process2 .progress-bar").addClass("active");
                })
                $(".process2").mouseleave(function() {
                    $(".process2 .progress-bar").removeClass("active");
                })

                $(".process3").mouseover(function() {
                    $(".process3 .progress-bar").addClass("active");
                })
                $(".process3").mouseleave(function() {
                    $(".process3 .progress-bar").removeClass("active");
                })

                $(".process4").mouseover(function() {
                    $(".process4 .progress-bar").addClass("active");
                })
                $(".process4").mouseleave(function() {
                    $(".process4 .progress-bar").removeClass("active");
                })
            })
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
       <%
}
}

catch(Exception e){
e.printStackTrace();
}
}
%>
    </body>
</html>
