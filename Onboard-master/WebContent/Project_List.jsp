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
		 <script type="text/javascript" src="js_in_pages/project.js"></script>
        <script src="js/modernizr/modernizr.min.js"></script>
   
</head>

<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date1 = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed Project_List JSP PAGE-----[INFO]");  %>
  <%@page language="java"%>
  <%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
  <%@page import="java.sql.*"%>
  <%@ page import="onboard.DBconnection" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");
  if (session.getAttribute("username")==null){
     response.sendRedirect("Login.jsp");
   }
%>
<%
  HttpSession role_ses=request.getSession(); 
  String frole=(String)role_ses.getAttribute("role");
  int sumcount=0;
  Statement st,st1;
  try{
  String query;
  HttpSession details=request.getSession();
  String Projets=(String)details.getAttribute("projects");
  //System.out.println(Projets);
  String roles=(String)details.getAttribute("role");
  DBconnection d=new DBconnection();
  Connection con = (Connection)d.getConnection();
  String visit_query="select * from visits";
  Statement visit_st = con.createStatement();
  ResultSet visit_rs = visit_st.executeQuery(visit_query);
  int flag=1,knt=0;
  Date date = new Date();
  SimpleDateFormat ft,ft1;
  String username=(String)details.getAttribute("u_Name");
  
  ft=new SimpleDateFormat ("yyyy-MM-dd");
  ft1=new SimpleDateFormat ("hh:mm:ss");
  String strDate=ft.format(date);
  String strTime=ft1.format(date);
  while(visit_rs.next())
  {
   if(visit_rs.getString(6)!=null)
  	{
  	if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
  	{
  		Statement stmtt = con.createStatement();
           String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Logged in'  and date ='"+strDate+"'";
           int count = stmtt.executeUpdate(queryy);
           flag=0;
           break;
  	}
  }

  }
  //System.out.println("the flag value is "+flag);
  if(flag==1)
  {
  	String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
  	        + " values (?, ?, ?, ?, ?, ?, ?)";
  	      PreparedStatement preparedStmt = con.prepareStatement(ins_query);
  	      preparedStmt.setString (1, username);
  	      preparedStmt.setString (2, strDate);
  	      preparedStmt.setString(3, "Logged in");
  	      preparedStmt.setString(4, "1");
  	      preparedStmt.setString(5, strTime);
  	      preparedStmt.setString(6, "None");
  	      preparedStmt.setString(7, "");

  	      // execute the preparedstatement
  	      preparedStmt.execute();
  }

  
  if(Projets.equals("all"))
     query = "select * from AppEmphazize_ProjectDetails";
  else
     query = "select * from AppEmphazize_ProjectDetails where projectname='"+Projets+"'";
  st = con.createStatement();
  ResultSet rs = st.executeQuery(query);
%>
 <form method="post" name="form" action="Appin">
 
 <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
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
 
  <%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
<li><a href="Logout" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
            

                
                        

<section>

    <div class="row">
      <div class="container">
                    <h1 class="page-header">Projects</h1>
                      <div class="main">
<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
<div class="cbp-vm-options">
<button type="button" class="btn btn-primary pull-right" name="newpr" onclick="location.href='AppEmphasize_NewProject.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  New Project
</button>
<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected gr" data-view="cbp-vm-view-grid">Grid View</a>
<a href="#" class="cbp-vm-icon cbp-vm-list lis" data-view="cbp-vm-view-list">List View</a>
</div>
<ul>
<%
int k=0;
while(rs.next()){
           k++;
          // System.out.println("pname is "+rs.getString(1));
%>
<li>
<h3 class="cbp-vm-title left-col primary" name="name"><%=rs.getString(1)%></h3>
<% String q="select * from ArchiveExecution_Details where level=1 and projects='"+rs.getString(1)+"'order by seq_num";
st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery(q);
while(rs1.next())
{      
if(rs1.getString(15).equals("100") || Integer.parseInt(rs1.getString(15))>=100)
continue;
else
{%>
           <center><div class="progress center-col cbp-vm-detail">
             <div class="progress-bar progress-bar-success progress-bar-striped" id="prog_bar<%=k %>" role="progressbar" aria-valuenow="<%=rs1.getString(15) %>"
             aria-valuemin="0" aria-valuemax="100" style="width:<%=rs1.getString(15) %>%">
             <%=rs1.getString(15) %>%
             </div>
           </div>
           </center>
           <%
if(Integer.parseInt(rs1.getString(15))<35){
%>
<script>document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-danger progress-bar-striped';</script>
<%    }
else if(Integer.parseInt(rs1.getString(15))<65){
%>
<script>document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-warning progress-bar-striped';</script>
<%
} %>
<h5 class="cbp-vm-title right-col primary" ><%=rs1.getString(3) %></h5>
<%
break;
}
} %>

<button type="button" class="btn btn-primary" name="btn" onClick="edit('<%=rs.getString(10)%>','<%=rs.getString(1)%>');">
<i class="fa fa-eye"></i>/ &nbsp; <i class="fa fa-edit"></i>
</button>

</li>
<%
}
%>
</ul>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</div>
</div>


</form>

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