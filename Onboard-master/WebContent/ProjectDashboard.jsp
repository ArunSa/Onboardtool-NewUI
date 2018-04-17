<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project-Dashboard</title>
<!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
      

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
         <style type="text/css">
         body{
         background: #f5f5f5;
         }
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
              
              
#page-wrapper {
    margin: 0 0 0 260px;
    padding: 15px 30px;
    min-height: 1200px;
}
.text-dark {
    color: #797979 !important;
}
.m-b-30 {
    margin-bottom: 30px !important;
}
.m-t-0 {
    margin-top: 0 !important;
}
.header-title {
    font-size: 16px;
    font-weight: 400;
    letter-spacing: 0.02em;
    line-height: 16px;
    margin-bottom: 8px;
    padding: 15px 30px;
}
h4 {
    color: #36404a;
    margin: 10px 0;
}
.portlet .portlet-heading {
    border-radius: 3px 3px 0 0;
    color: #ffffff;
    padding: 12px 20px;
}
.col-12{
   
    width: 100%;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

.container-fluidbox{


    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;

}

.portlet {
  background: #ffffff;
  border-radius: 3px;
  margin-bottom: 30px;
  box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.1);
  background-clip: padding-box;
}

.portlet .portlet-heading {
  border-radius: 3px 3px 0 0;
  color: #ffffff;
  padding: 12px 20px;
}

.portlet .portlet-heading .portlet-title {
  color: #ffffff;
  float: left;
  font-size: 15px;
  font-weight: 600;
  margin-bottom: 0;
  margin-top: 0;
  text-transform: uppercase;
  letter-spacing: 0.03em;
}

.portlet .portlet-heading .portlet-widgets {
  display: inline-block;
  float: right;
  font-size: 15px;
  line-height: 30px;
  padding-left: 15px;
  position: relative;
  text-align: right;
}

.portlet .portlet-heading .portlet-widgets .divider {
  margin: 0 5px;
}

.portlet .portlet-heading .portlet-widgets .collapsed .ion-minus-round:before {
  content: "\f217" !important;
}

.portlet .portlet-heading a {
  color: #999999;
}

.portlet .portlet-body {
  -moz-border-radius-bottomleft: 5px;
  -moz-border-radius-bottomright: 5px;
  -webkit-border-bottom-left-radius: 5px;
  -webkit-border-bottom-right-radius: 5px;
  background: #ffffff;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  padding: 15px;
}

.portlet-default .portlet-title {
  color: #797979 !important;
}

.portlet .portlet-heading.bg-custom a, .portlet .portlet-heading.bg-purple a, .portlet .portlet-heading.bg-info a, .portlet .portlet-heading.bg-success a, .portlet .portlet-heading.bg-primary a, .portlet .portlet-heading.bg-danger a, .portlet .portlet-heading.bg-warning a, .portlet .portlet-heading.bg-inverse a, .portlet .portlet-heading.bg-pink a {
  color: #ffffff;
}

.panel-disabled {
  background: rgba(243, 242, 241, 0.5);
  bottom: 15px;
  left: 0;
  position: absolute;
  right: -5px;
  top: 0;
}

.loader-1 {
  -moz-animation: loaderAnimate 1000ms linear infinite;
  -o-animation: loaderAnimate 1000ms linear infinite;
  -webkit-animation: loaderAnimate 1000ms linear infinite;
  animation: loaderAnimate 1000ms linear infinite;
  clip: rect(0, 30px, 30px, 15px);
  height: 30px;
  left: 50%;
  margin-left: -15px;
  margin-top: -15px;
  position: absolute;
  top: 50%;
  width: 30px;
}

.loader-1:after {
  -moz-animation: loaderAnimate2 1000ms ease-in-out infinite;
  -o-animation: loaderAnimate2 1000ms ease-in-out infinite;
  -webkit-animation: loaderAnimate2 1000ms ease-in-out infinite;
  animation: loaderAnimate2 1000ms ease-in-out infinite;
  border-radius: 50%;
  clip: rect(0, 30px, 30px, 15px);
  content: '';
  height: 30px;
  position: absolute;
  width: 30px;
}

        </style>
        
        <!-- ========== COMMON JS FILES ========== -->
</head>
<body class="top-navbar-fixed" style="background: #f5f5f5;">
<%@page language="java"%>
<%@page import="java.sql.*"%>
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
int sumcount=0;
Statement st1;
try {
HttpSession details=request.getSession();
String Role_info=(String)details.getAttribute("app_emp");
String Project_Id=(String)session.getAttribute("theName");
String Project_name="";
String Application=(String)details.getAttribute("applications");
String Project_Name=(String)details.getAttribute("projects");
DBconnection d=new DBconnection();
Connection con = (Connection)d.getConnection();


String query31 = "select * from projinfo";
Statement st31 = con.createStatement();
ResultSet rs31 = st31.executeQuery(query31);

String query3 = "select * from projinfo where id = "+Project_Id;
Statement st3 = con.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
if(rs3.next())
Project_name=rs3.getString("projectname");

System.out.println("Project_name of the project is "+Project_name);
String query1="";
if(Project_Name.equals("all"))
query1 = "select * from appinfo where prjname = '"+Project_name+"'";
else
query1 = "select * from appinfo where prjname = '"+Project_Name+"' and appname='"+Application+"'";
st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery(query1);


%>

<div class="main-wrapper">
   <nav class="navbar top-navbar bg-white box-shadow">
   <div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                <a class="navbar-brand" href="Project_List.jsp">
                    <img src="images/logo1.png" alt="Options - Admin Template" class="logo">
                </a>
                
                   </div>
                   <div class="collapse navbar-collapse" id="navbar-collapse-1">
                
                            <!-- /.nav navbar-nav -->
<ul class="nav navbar-nav navbar-right">
<%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
<li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>
                </div>
                </div>
                
   </div>
   </nav>
   
   <div class="content-wrapper" >
                <div class="content-container" >
                    <div class="main-page" >
                    <div class="container-fluid" >
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title"> Project Dashboards</h2>
                                </div>
                            </div>
                        </div>
                        <section>
                         <div class="page-wrapper" >
                          <div class ="page-inner">
                          <div class="row">
                          <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="panel panel-default" >
                            <div class="panel-heading">
                                Project details
                            </div>
                            <div class="panel-body">
                              <canvas id="bar-chart" width="800" height="300"></canvas>  
                            </div>
                        </div>
                    </div>
                     <div class="col-md-5 col-sm-12 col-xs-12">
                     <div class="panel panel-default">
                          <div class="panel-heading">
                                Project Status
                            </div>
                            <div class="panel-body">
                              <canvas id="pie-chart" width="800" height="435"></canvas>  
                            </div>
                        
                        
                     </div>
                          </div>
                    
                          
                         </div>
</section>
<br>
      <div class="container-fluid">
                     <div class="row">

                    <div class="col-12">

                        <div class="portlet">
                            <div class="portlet-heading">
                                <h3 class="portlet-title text-dark text-uppercase">
                                    Projects
                                </h3>
                                <div class="portlet-widgets">
                                    <a href="javascript:;" data-toggle="reload"><i class="ion-refresh"></i></a>
                                    <span class="divider"></span>
                                    <a data-toggle="collapse" data-parent="#accordion1" href="#portlet2" class="" aria-expanded="true"><i class="ion-minus-round"></i></a>
                                    <span class="divider"></span>
                                    <a href="#" data-toggle="remove"><i class="ion-close-round"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="portlet2" class="panel-collapse collapse show">
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                        
                                        
                                            <thead>
                                            <tr>
                                                
                                                <th>Project Name</th>
                                                <th>Start Date</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Assign</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <% while(rs31.next()) { %>
                                            <tr>
                                                <td><%=rs31.getString("projectname") %></td>
                                                <td><%=rs31.getString("Intdate") %></td>
                                                <td><%=rs31.getString("Enddate") %></td>
                                                <td><span class="label label-success">Completed</span></td>
                                                <td></td>
                                            </tr>
                                             <% 
                                                  
                                                                                                }
                                                                                                %>
                                            
                                            </tbody>
                                        </table>
                                        
                                         
                                                                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->

                </div>
                </div>
</div>
</div>

<script>
//Bar chart
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
              <% while(rs31.next()) { %>
      labels: ["","",<%=rs31.getString("projectname")%>],
      
      <% 
      
                           }
                           %>
                        
      
      datasets: [
        {
          label: "Projects",
          backgroundColor: ["","#3e95cd", "#8e5ea2","#3cba9f"],
          data: [0,85,70,50,100]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Project Details'
      }
    }
});
</script>
<script>
new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["CGEN1","CGEN2","CGEN3"],
      datasets: [{
        label: "Project Status",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
        data: ["85","70","55"]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Project Status'
      }
    }
});




</script>

<%

}
catch(Exception e){
e.printStackTrace();
}
%>

</body>
</html>
