
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">

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
   
<script type="text/javascript" src="js_in_pages/requirements.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/requirements.css" type="text/css" />


  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <style>
 body {
  font-family: Arial, sans-serif;

  background-size: cover;
  height: 100vh;
}

h1 {
  text-align: center;
  font-family: Tahoma, Arial, sans-serif;
  color: #06D85F;
  margin: 80px 0;
}

.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 50px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}



.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 210px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 40%;
  position: relative;
  
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color:black;
}
.popup .close:hover {
  color: black;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

.button{
color:white;
}
@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
  
}

 #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  
              .btn { background: gray;
    color: #fff; }

/*END Form Wizard*/
</style>
  <body class="top-navbar-fixed">
  <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>


<%
try {
HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String det=(String)session.getAttribute("theName");
String idd=(String)session.getAttribute("appidd");
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query4 = "select * from appinfo where appname ='"+idd+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query7 = "select requirements from newRequirements where appname ='"+idd+"'";
Statement st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);
String imp_id="";
String sequenceNumber="";
int actualHours=0,plannedHours=0,actualHours1=0,plannedHours1=0;
{
%>
<form class="form-signin"name="loginForm" method="post">

        <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                    
                 <% if(rs3.next()){ %>
                 <% if(rs4.next()){ %>
                   
                    <%
                    String quer2="select * from archive_exec where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                   ResultSet rss = s2.executeQuery(quer2);
                   while(rss.next())
                   	session.setAttribute(rss.getString(3),rss.getString(15));
                   
                   String quer3="select id from archive_exec where name='"+rs4.getString("appname")+"' and projects='"+rs3.getString("projectname")+"'order by seq_num";
                   Statement s3 = conn.createStatement();
                  ResultSet rss1 = s3.executeQuery(quer3);
                  while(rss1.next())
                	  imp_id=rss1.getString(1);
                  System.out.println(imp_id);
                  String quer4="select * from archive_exec where ref_id='"+imp_id+"' and projects='"+rs3.getString("projectname")+"'order by seq_num";
                  Statement s4 = conn.createStatement();
                 ResultSet rss2 = s4.executeQuery(quer4);
                
                  while(rss2.next()){
                  	session.setAttribute(rss2.getString(3),rss2.getString(15));
                  	System.out.println(rss2.getString(3));
                  }
                  
                  String quer5="select seq_num from archive_exec where name='Build and Test'";
                  Statement s5 = conn.createStatement();
                  ResultSet rss3 = s5.executeQuery(quer5);
                  if(rss3.next())
                	  sequenceNumber=rss3.getString(1);
                  System.out.println(sequenceNumber);
                  String quer6="select * from archive_exec where projects='"+rs3.getString("projectname")+"' and seq_num>"+sequenceNumber+" and seq_num<"+(sequenceNumber+33)+" and level=4";
                  Statement s6 = conn.createStatement();
                  ResultSet rss4 = s6.executeQuery(quer6);
                  int knt=0;
     
                  while(rss4.next())
                  {
                	  if(knt>2)
                	  {
                		  if(rss4.getString(9).equals(""))
                			  actualHours1+=0;
                		  else
                		  actualHours1+=Integer.parseInt(rss4.getString(9));
                		  if(rss4.getString(13).equals(""))
                			  plannedHours1+=0;
                		  else
                		  plannedHours1+=Integer.parseInt(rss4.getString(13)); 
                	  }
                	  else
                	  { 
                		  if(rss4.getString(9).equals(""))
                			  actualHours+=0;
                		  else
                		  actualHours+=Integer.parseInt(rss4.getString(9));
                		  if(rss4.getString(13).equals(""))
                			  plannedHours+=0;
                		  else
                		  plannedHours+=Integer.parseInt(rss4.getString(13)); 
                		  System.out.println(actualHours);
                	  }
                	 knt++;
                  }
                    } }%>
              
               <div class="navbar-header no-padding" >
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

                		<div class="collapse navbar-collapse" id="navbar-collapse-1" style = "background-color:#fff " >
                			
                            <!-- /.nav navbar-nav -->
 			<ul class="nav navbar-nav navbar-right">
      <ul class="nav navbar-nav navbar-right" >
       <%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li ><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
						<li ><a href="logout.jsp" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                        <div class="sidebar-content" id='jqxWidget' >
						
							
                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li id='home' item-selected='true'>
                                        <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <span class="">App Emphasize Module</span>
                                    </li>
                                    <li class="has-children">
                                        <a><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a id="xxx"> <span>Parameters</span></a></li>
                                            <li><a id="xxz"> <span>Archival Complexity Calculation</span></a></li>
                                            <li><a id="xxy"> <span>Archival Cost Estimate</span></a></li>
                                        </ul>
                                    </li>

                                    <li>
                                        <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>
					
                       		

                                    <li class="nav-header">
                                        <span class="">Intake Module</span>
                                    </li>

                                    <li class="has-children">
                                        <a href="Intake_Business.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a> <span>Application Information</span></a></li>
                                            <li><a> <span>Legacy Retention Information</span></a></li>
                                            <li><a> <span>Archive Data Management</span></a></li>
                                            <li><a> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="Intake_TechnicalDetails.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a> <span>Application Data Information</span></a></li>
                                            <li><a> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="Intake_ArchiveRequirements.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a> <span>Screen/Report Requirements</span></a></li>
                                            <li><a> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
                 		    <li><a href="Archive_Execution.jsp"><span>Archive Execution Module</span></a>
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


                 <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
if(initiate == null)
initiate="0";
if(plan == null)
plan="0";
if(execute == null)
execute="0";
if(hypercare == null)
hypercare="0";
%>                            
<br/><br/><br/>
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
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
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
  <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
 <div class="row">
    <%
     int dev=0,test=0;
String requirements=(String)session.getAttribute("Requirements");
String implement=(String)session.getAttribute("Implement");
    if(plannedHours!=0)
     dev=(actualHours*100)/plannedHours;
    if(plannedHours1!=0)
     test=(actualHours1*100)/plannedHours1;
    String development=String.valueOf(dev);
    String testing=String.valueOf(test);
if(requirements == null)
requirements="0";
if(implement == null)
	implement="0";

%>
  <div class="col-md-3">
  <div class="form-group">
  <center><label >Requirements</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar4" style="width: <%=requirements%>%" aria-valuenow="<%=requirements %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=requirements %>%</span></div>
  </div></div></div>
<div class="col-md-3">
  <div class="form-group">
  <center><label >Development</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar5" style="width: <%=development%>%" aria-valuenow="<%=development %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=development %>%</span></div>
  </div></div></div>
 <div class="col-md-3">
  <div class="form-group">
  <center><label >Testing</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar6" style="width: <%=testing%>%" aria-valuenow="<%=testing %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=testing %>%</span></div>
  </div></div></div>
 <div class="col-md-3">
 <div class="form-group">
 <center><label >Deployment</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar7" style="width: <%=implement%>%" aria-valuenow="<%=implement%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=implement %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details1.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
<jsp:param name="Requirements" value="<%=requirements %>"/>
<jsp:param name="Development" value="<%=development %>"/>
<jsp:param name="Testing" value="<%=testing %>"/>
<jsp:param name="Deployment" value="<%=implement %>"/>
</jsp:include>

<div class="row">
 
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Intake Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Summary</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">2</a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Review</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">3</a>
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
        
        
        
</div>



<div class="panel-group" id="panels1"> 
                       <br><br><br>
                     
                        <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1">Screen/Report Requirement</a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body">
                                    <!-- The Modal -->
                     
                        <% while(rs7.next()){ %>
                        <div class="form-group">
                        <span><input type="checkbox" value="<%=rs7.getString("requirements")%>" checked>&nbsp;<%=rs7.getString("requirements")%></span>
                        </div>
                           <% }%>
	 <button type="button"  class="btn btn-primary  pull-left" > <a class="button" href="#popup1">Add Requirements</a></button>

                                          <div id="popup1" class="overlay">
	
      <script>
      function myCall()
      {
      var f=document.loginForm;
          f.method="post";
          f.action='NewRequirements';
          f.submit();
      }


      </script>
             
       
         
         
             
                                    
<div class="popup">
		 <a class="close" href="#">&times;</a> 
		<br/>
		 <div class="form-group">
      <label for="new">Requirements:</label>
      <input type="text" name='newRequirements' class="form-control" id="new">
      
    </div>
    <button type="button" onclick="myCall()" class="btn btn-success">Add</button>
	</div>
</div>
                                   <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2">Archive Requirements</a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="legalholds" value="Yes" >Current Legal holds on the application data must be applied to the application's archived data to override the Retention schedule
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataapp" value="Yes">Data from application must be retained based on the Client Retention schedule.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataloc" value="Yes">Data Localization Laws must be followed where relevant.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="reconsttools" value="Yes">The System has tools to reconstruct the data in its original format
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="viewblob" value="Yes">The System allows for user viewing of blob data in its original format in relationship to its structured data
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="fieldprop" value="Yes">Archived data maintains its field properties and formats from the source system (i.e. decimals, %, commas, .00x, YYY-MM-DD) to display values defined in Views and schemas
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="fieldtype" value="Yes">Archived data maintains its field types from the source system (i.e. STRING, Integer, CHAR, VCHAR, Date) to display values defined in Views and schemas
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="splchars" value="Yes">The System supports archiving special characters as found in source data to include Foreign characters
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="foreignlang" value="Yes">The System supports archiving Foreign Language data and maintains the Language in the archive
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="clob" value="Yes">The System Maintains CLOBs from source systems
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="unstructarch" value="Yes">The System supports archiving unstructured formats such as word, excel, PowerPoint, pdf.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="accrole" value="Yes">Access to the Archive is role based and controlled through Active Directory.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataview" value="Yes">The System allows for configuration of data views.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="complctrl" value="Yes">Completeness Control - record level check (The number of records sent from the Application are compared to the number of records posted to the target.)
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="errctrl" value="Yes">Error Handling Control - record level check (During the load, records deemed as errors based on program logic will be written to an exception log in their entirety).
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="metadata" value="Yes">The System supports metadata management and indexing.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="advsearch" value="Yes">The System provides advanced search tools to include data parameters and the standard search tools
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label" name="searchparam" value="Yes"> 
                                                <input type="checkbox">Based on search parameters, data can be exported out of the system for analysis
                                            </label>  
                                             <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                  
                                        </div> 
                                </div>                                 
                            </div>                             
                        </div>
                    
                   
                    </div>
       
       <button type="button" class="btn btn-primary" onclick="call()" >Save</button> &nbsp;

                    <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel</button> 
       </div>
                
            </div>
            
            </div>
				    </div>
                                    <!-- /.col-md-6 -->

                                </div>
                                <!-- /.row -->
							</div>
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
            
      
        <%
}
}
catch(Exception e){}
%>
</form>
  
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
       
	</body>
</html>


