<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>Onboarding Tool</title>
</head>


 <link rel="stylesheet" href="styles/styles.css" type="text/css" />
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
   

 <style>
.newspaper {
    -webkit-column-count: 3; /* Chrome, Safari, Opera */
    -moz-column-count: 3; /* Firefox */
    column-count: 3;
    -webkit-column-gap: 40px; /* Chrome, Safari, Opera */
    -moz-column-gap: 40px; /* Firefox */
    column-gap: 40px;
    -webkit-column-rule: 1px solid lightblue; /* Chrome, Safari, Opera */
    -moz-column-rule: 1px solid lightblue; /* Firefox */
    column-rule: 1px solid lightblue;
}

#cmd {
float:right;
} 

#table
  {
    width: 90%;
    margin:50px;
    
    background: #fff;
    padding-left:10px;
    border: 2px solid #E6E9ED;
    -webkit-column-break-inside: avoid;
    -moz-column-break-inside: avoid;
    column-break-inside: avoid;
    opacity: 1;
    transition: all .2s ease;
}

#wizard {
padding-left:20px;
}
.text-white { color:#fff !important; }


.btn { background: gray;
    color: #fff; }

.bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #428bca; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background:#1a92f6; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 100%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: lightblue; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #1a92f5;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
/*END Form Wizard*/

</style>
  <body class="top-navbar-fixed">
  <%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Intake_Review JSP PAGE-----[INFO]");  %>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
     
<%
try {
HttpSession details=request.getSession();
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
String role_info=(String)details.getAttribute("intake");
String roles=(String)details.getAttribute("role");
String ID=(String)session.getAttribute("theName");
String app_Name = request.getParameter("appname");
if (app_Name != null && !app_Name.isEmpty()) {
session.setAttribute("appidd", app_Name);
}
app_Name=(String)session.getAttribute("appidd");
String query4 = "select * from AppEmphazize_ApplicationInfo where appname ='"+app_Name+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query1 = "select * from business where appname ='"+app_Name+"'";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);

String query2 = "select * from Intake_TechnicalDetails where appname ='"+app_Name+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
System.out.println("appname in review : "+app_Name);
System.out.println("appname in review : "+app_Name);
String query3 = "select * from archivalRequirement where appname ='"+app_Name+"'";
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query5= "select * from Intake_NewRequirements where appname ='"+app_Name+"'";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
 
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
                                        <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
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
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
  </li>
					                <li><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
                                    </li>
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
            

					
<!-- Projects List Start -->

                    <div class="main-page">
                       
                        <section>

                                <div class="row">
                                <div class="container-fluid">
                                    <div class="col-md-12">


 <div class="row"  id="wizard">
      <div class="container">  
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Intake Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                
                </div>
                
                <div class="col-xs-2 bs-wizard-step complete"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Summary</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot text-white">2</a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Review</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dottext-white">3</a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Approval</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">4</a>
                </div>
                
                 <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">5</a>
                </div>
            </div>
  <div class="container" >
  <a href="Intake_Business.jsp" class="btn btn-default btn pull-left">Edit</a>
<button id="cmd" class="btn btn-primary pull-right" ><span class="glyphicon glyphicon-download-alt"></span> Export PDF</button>
<button  class="btn btn-primary pull-left" onclick="location.href='Applications.jsp'" >HOME</button>
 
</div>
<div class="container">
<div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table-scroll">
    <table>
             <tbody>
                 <tr>
                           <td>
                                 <table width='780' border='0' align='center' '>
                                        <tbody>
                                              
                                               <tr>
                                                     <td valign='top' style='color:#404041;line-height:16px;padding:25px 20px 0px 20px'>
                                                            <p>
                                                                <section style='position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;'>
                                                                         <h3 align='center' style='margin-top: -12px;background-color: #FFF;clear: both;width: 30%;margin-right: auto;margin-left: auto;padding-left: 15px;padding-right: 15px; font-family: arial,sans-serif;'>
                                                                                <span>Summary & Review</span>
                                                                         </h3>
                                                                   </section>    
                                                            </p>               
                                                     </td>
                                               </tr>
                                             
                                               <tr align='left' >
                                                     <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                     
                                                    <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Bussiness Details</h2></span>
                <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table1">                                           
    <table width='0' border='0' align='left' cellpadding='0' cellspacing='0'>
                                                           
                                                                   <tbody>
                                                                   <tr>

                                                                     <%
          
while(rs1.next()){

%>
 
<h3>Application Information :</h3>
        <tr>
        
         <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Legacy Application Name       : <strong align="right"><%=rs1.getString("legappname") %></strong></pre> </tr> 
          <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Reference To Application         :  <strong><%=rs1.getString("reftoapp") %></strong></pre></tr>
          <tr class="row_t">    <pre style="font-family:verdana;font-size:100%;">Tracking  ID         : <strong><%=rs1.getString("tid") %></strong></pre></tr> 
          <tr class="row_d">    <pre style="font-family:verdana;font-size:100%;">Description          : <strong><%=rs1.getString("descr") %></strong></pre></tr> 
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Legacy Application Vendor/Manufacture : <strong><%=rs1.getString("vendor") %></strong></pre></tr>
            <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Contract Expiration Date : <strong><%=rs1.getString("expdate") %></strong></pre></tr>
             <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Notice Period for Expiration of Contract  : <strong><%=rs1.getString("noticeperiod") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Contract Value of Application  : <strong><%=rs1.getString("contractvalue") %></strong></pre></tr>
         <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">ROD : <strong><%=rs1.getString("rod") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Commment : <strong><%=rs1.getString("cmnt") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">If the applications transitions has dependencies?  : <strong><%=rs1.getString("hasdep") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">What is the date Range of this Data? : <strong><%=rs1.getString("daterange") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Size of Database : <strong><%=rs1.getString("dbsize") %></strong></pre></tr>
          
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Location of Data : <strong><%=rs1.getString("dataloc") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Site Location of Data  : <strong><%=rs1.getString("siteloc") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Does the application needs archival?  : <strong><%=rs1.getString("needarch") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Reason : <strong><%=rs1.getString("archreason") %></strong></pre></tr>
         <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Comments : <strong><%=rs1.getString("archcmnt") %></strong></pre></tr>
           <br />
       
         
        </tr>
        <h3>Legal Retention Information :</h3>
        <tr>
        
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Record Code Of Application: <strong align="right"><%=rs1.getString("reccode") %></strong></pre> </tr> 
<tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Trigger Date:  <strong><%=rs1.getString("triggerdate") %></strong></pre></tr>
<tr class="row_t">    <pre style="font-family:verdana;font-size:100%;">Period of Retention : <strong><%=rs1.getString("retentionperiod") %></strong></pre></tr> 
<tr class="row_d">    <pre style="font-family:verdana;font-size:100%;">Table Name/s where Retention need to apply : <strong><%=rs1.getString("retentiontable") %></strong></pre></tr> 
<tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Name of the Legal Retention & e-Discovery SME : <strong><%=rs1.getString("retentionname") %></strong></pre></tr>
<tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Does any Records have legal holds/Tax Holds or any indication? : <strong><%=rs1.getString("legalholds") %></strong></pre></tr> 
  <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Who or what entity provided legal or tax hold identification : <strong><%=rs1.getString("wholegal") %></strong></pre></tr>  
  <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Brief Explanation : <strong><%=rs1.getString("archexp") %></strong></pre></tr>
 </tr>
        <h3>Archive Data Management :</h3>
        <tr>
        
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Is this application's been used for BI report?: <strong align="right"><%=rs1.getString("useforBI") %></strong></pre> </tr> 

 
         
        </tr> 
        
        </table>
       </div>
        <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table2">  
     <table>
     
     
      <h3>SystemRequirements :</h3>
        <tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Account Credit Card: <strong align="right"><%=rs1.getString("creditacc") %></strong></pre> </tr> 
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Account Number-Financial: <strong align="right"><%=rs1.getString("financialacc") %></strong></pre> </tr>     
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Date of Birth: <strong align="right"><%=rs1.getString("dob") %></strong></pre> </tr> 
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Driver's License Number: <strong align="right"><%=rs1.getString("driverlic") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Email Address: <strong align="right"><%=rs1.getString("email") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Family Status: <strong align="right"><%=rs1.getString("family") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Gender: <strong align="right"><%=rs1.getString("gender") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Geo Location: <strong align="right"><%=rs1.getString("geoloc") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Image/Video: <strong align="right"><%=rs1.getString("img") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Income: <strong align="right"><%=rs1.getString("income") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">IP Address: <strong align="right"><%=rs1.getString("ipadrs") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Martial Status: <strong align="right"><%=rs1.getString("martialstatus") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Mpobile Device ID: <strong align="right"><%=rs1.getString("mobid") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Name: <strong align="right"><%=rs1.getString("name") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Phone Number: <strong align="right"><%=rs1.getString("phno") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Physical/Mailing Address : <strong align="right"><%=rs1.getString("mailadrs") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Physical Description: <strong align="right"><%=rs1.getString("physic") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Race/Ethnicity: <strong align="right"><%=rs1.getString("race") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Religion: <strong align="right"><%=rs1.getString("religion") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Sexual Preference : <strong align="right"><%=rs1.getString("sexualpref") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">SSN: <strong align="right"><%=rs1.getString("ssn") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Others: <strong align="right"><%=rs1.getString("others") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Brief Explaination: <strong align="right"><%=rs1.getString("expl") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Does the application have localization requirement/ regulations: <strong align="right"><%=rs1.getString("localreq") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">List of Countries where localization requirement/ regulations apply: <strong align="right"><%=rs1.getString("localcountry") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Are the Localization requirements/regulations enforced with infrastructure or geofencing : <strong align="right"><%=rs1.getString("localinf") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Infrastructure Localization enforcement, please list the locations of the datacenters : <strong align="right"><%=rs1.getString("datacenters") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">External access required for archived data : <strong align="right"><%=rs1.getString("extaccess") %></strong></pre> </tr>        
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Describe who or what external entity needs access : <strong align="right"><%=rs1.getString("who") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">User Name : <strong align="right"><%=rs1.getString("uname") %></strong></pre> </tr> 
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Role Description : <strong align="right"><%=rs1.getString("roledesc") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Reason for Access : <strong align="right"><%=rs1.getString("accreason") %></strong></pre> </tr>    
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Frequency of Access : <strong align="right"><%=rs1.getString("accfreq") %></strong></pre> </tr> 
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Additional System Requirements : <strong align="right"><%=rs1.getString("sysreq") %></strong></pre> </tr>     
        </tr>
        
        
     
     
     </table>
    </div>
        
        
       <% }%>
       
       <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table3">  
     <table>
      
      <%
          
while(rs2.next()){

%>
<span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Technical Details</h2></span>
      
 
<h3>Application Data Information :</h3>
   <tr>
        
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Datatype Characteristics  : <strong align="right"><%=rs2.getString("datatype") %></strong></pre> </tr> 
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">If the Data Type is Unstructured or Hybrid, process for extracting unstructured data? : <strong><%=rs2.getString("pname") %></strong></pre></tr>
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Does Unstructured or Hybrid business objects needs to be archived? : <strong><%=rs2.getString("archneed") %></strong></pre></tr>
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Please specify the formats : <strong><%=rs2.getString("formatsp") %></strong></pre></tr>   
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Any Special/ Multi Language characters or Foreign Language contained in the application?: <strong><%=rs2.getString("mlang") %></strong></pre></tr>
  <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">User Documentation :<strong><%=rs2.getString("userdoc") %></strong></pre></tr>  
  
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Technical Documentation :<strong><%=rs2.getString("techdoc") %></strong></pre></tr>  
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Training Documentation : <strong><%=rs2.getString("traindoc") %></strong></pre></tr> 
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Support Documentation :<strong><%=rs2.getString("supportdoc") %></strong></pre></tr> 
    <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Data Dictionary :<strong><%=rs2.getString("datadic") %></strong></pre></tr> 
    <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Test Case Documentation :<strong><%=rs2.getString("testcasedoc") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Testing Records :<strong><%=rs2.getString("testrec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Design Specification :<strong><%=rs2.getString("designspec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Validityplan :<strong><%=rs2.getString("validityplan") %></strong></pre></tr>
   
   <h3>Infrastructure & Environment Information :</h3>
   
   
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Location of Data :<strong><%=rs2.getString("dataloc") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Server Name :<strong><%=rs2.getString("servername") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Production Instances :<strong><%=rs2.getString("prodinstance") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Location of Production Instances :<strong><%=rs2.getString("prodinstanceloc") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Contact Name or Entity for Infrastructure Engagement :<strong><%=rs2.getString("infraengage") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">If external facing, web apps/website URLs :<strong><%=rs2.getString("url") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Database size of the application :<strong><%=rs2.getString("dbsize") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Estimated No of Table in the application :<strong><%=rs2.getString("nooftable") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Estimated No of Records(volume) in the application :<strong><%=rs2.getString("noofrec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">XML counts for the database :<strong><%=rs2.getString("xmlcount") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Does this application utilize any VPN environments (E.g. Citrix) for access :<strong><%=rs2.getString("anyvpn") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Specify the application to integrate :<strong><%=rs2.getString("appintegrate") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Ready Date for Complete Server decommission and Application Retirement :<strong><%=rs2.getString("decomdate") %></strong></pre></tr>
                     <br />
       
         
        </tr>
 
   <%} %>
 
 

      </table>
      </div>
 
    
     <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table4">  
     <table>
      <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Archival Requirements</h2></span>
       
       <h3>Screen/Report Requirements :</h3>
        
        <%
          
while(rs5.next()){

%>        
    <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"><%=rs5.getString("requirements") %> :<Strong> Yes</Strong></pre> </tr>
    
    <% 
}
    
    %>   
       
        <h3>Archive Requirements :</h3>
        <%
          
while(rs3.next()){

%>        

<tr class="edit_row">  
<pre style="font-family:verdana;font-size:100%;">Current Legal holds on the application data must be applied to the application's archived data to override the Retention schedule  : <strong align="right"><%=rs3.getString("legalholds") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Data from application must be retained based on the Client Retention schedule :<strong align="right"><%=rs3.getString("dataapp") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Data Localization Laws must be followed where relevant: <strong align="right"><%=rs3.getString("dataloc") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System has tools to reconstruct the data in its original format : <strong align="right"><%=rs3.getString("reconsttools") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System allows for user viewing of blob data in its original format in relationship to its structured data : <strong align="right"><%=rs3.getString("viewblob") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Archived data maintains its field properties and formats from the source system (i.e. decimals, %, commas, .00x, YYY-MM-DD) to display values defined in Views and schemas : <strong align="right"><%=rs3.getString("fieldprop") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Archived data maintains its field types from the source system (i.e. STRING, Integer, CHAR, VCHAR, Date) to display values defined in Views and schemas : <strong align="right"><%=rs3.getString("fieldtype") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System supports archiving special characters as found in source data to include Foreign characters : <strong align="right"><%=rs3.getString("splchars") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System supports archiving Foreign Language data and maintains the Language in the archive  : <strong align="right"><%=rs3.getString("foreignlang") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System Maintains CLOBs from source systems  : <strong align="right"><%=rs3.getString("clob") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">The System supports archiving unstructured formats such as word, excel, PowerPoint, pdf : <strong align="right"><%=rs3.getString("unstructarch") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Access to the Archive is role based and controlled through Active Directory : <strong align="right"><%=rs3.getString("accrole") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> The System allows for configuration of data views: <strong align="right"><%=rs3.getString("dataview") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> Completeness Control - record level check (The number of records sent from the Application are compared to the number of records posted to the target : <strong align="right"><%=rs3.getString("complctrl") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> Error Handling Control - record level check (During the load, records deemed as errors based on program logic will be written to an exception log in their entirety  : <strong align="right"><%=rs3.getString("errctrl") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> The System supports metadata management and indexing :  <strong align="right"><%=rs3.getString("metadata") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> The System provides advanced search tools to include data parameters and the standard search tools : <strong align="right"><%=rs3.getString("advsearch") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;"> Based on search parameters, data can be exported out of the system for analysis :<strong align="right"><%=rs3.getString("searchparam") %></strong></pre> </tr>
   <%} %>
     </table>
     </div>
    
       
       
        </tr>
       
         
         
         
         
        </tbody>
        </table>
        </td>
                                                    
                                               </tr>
                                       
                                               <tr>
                                                                                                                                                    
                                                                                                                                                 
                                                 <tr>
                                                                                                       
                                              
                                        </tbody>
                                 </table>
                           </td>
                    </tr>
             </tbody>
       </table>
    
      
      </br>  <br>
        
      
</div>
</div>
   
        <%

                                                                 
}
catch(Exception e){}
%>
 


				  					  </div>
                                    <!-- /.col-md-6 -->
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


        <!-- ========== THEME JS ========== -->
        
<script type="text/javascript">
    $('.datepicker').datepicker({
    format: 'mm/dd/yyyy',
    startDate: '-3d'
});
</script>


 
 

		
        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

                // 1st  datepicker
                $('#basicExample .time').timepicker({
                'showDuration': true,
                'timeFormat': 'g:ia'
                });

                $('#basicExample .date').datepicker({
                'format': 'm/d/yyyy',
                'autoclose': true
                });

                var basicExampleEl = document.getElementById('basicExample');
                var datepair = new Datepair(basicExampleEl);

                // 2nd  datepicker
                $('#datetimepicker1').datetimepicker({
                    debug: true
                });

                // 3rd  datepicker
                $('#datetimepicker9').datetimepicker({
                viewMode: 'years'
                });

                // 4th  datepicker
                $('#datetimepicker10').datetimepicker({
                viewMode: 'years',
                format: 'MM/YYYY'
                });

                // 5th  datepicker
                $('#datetimepicker11').datetimepicker({
                daysOfWeekDisabled: [0, 6]
                });

                // 6th  datepicker
                $('#datetimepicker12').datetimepicker({
                    inline: true,
                    sideBySide: true
                });
            });
        </script>
       
<script>
 var doc = new jsPDF();
 
 var options = {
    background: 'blue',
    pagesplit: true
};
 var specialElementHandlers = {
     '#editor': function (element, renderer) {
         return true;
     }
 };
 
 $('#cmd').click(function () {  
 
     doc.fromHTML($('#table1').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
    
     doc.addPage();
     
     doc.fromHTML($('#table2').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
    
     doc.addPage();
     doc.fromHTML($('#table3').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
     doc.addPage();
     doc.fromHTML($('#table4').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
     var d = new Date().toISOString().slice(0, 19);
     filename = 'Intake' +"_"+ d + '.pdf';
     doc.save(filename);

 });
</script>  

		
      
       
	</body>
</html>

