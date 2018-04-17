
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Onboard</title>
 
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
   
 <script type="text/javascript" src="js_in_pages/business.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/business.css" type="text/css" />
  
   
  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  
  <body class="top-navbar-fixed">

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
try {
HttpSession details=request.getSession();
	String role_info=(String)details.getAttribute("intake");
	String roles=(String)details.getAttribute("role");
String ID=(String)session.getAttribute("theName");
String app_Name = request.getParameter("appname");
if (app_Name != null && !app_Name.isEmpty()) {
session.setAttribute("appidd", app_Name);
}
app_Name=(String)session.getAttribute("appidd");
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
String Projects=(String)details.getAttribute("projects");
String Applications=(String)details.getAttribute("applications");
String username=(String)details.getAttribute("u_Name");
String Project_Name=(String)details.getAttribute("nameofproject");
String visit_query="select * from visits";
Statement visit_st = conn.createStatement();
ResultSet visit_rs = visit_st.executeQuery(visit_query);
int flag=1;

Date date = new Date();
SimpleDateFormat ft,ft1;
ft=new SimpleDateFormat ("yyyy-MM-dd");
ft1=new SimpleDateFormat ("hh:mm:ss");
String strDate=ft.format(date);
String strTime=ft1.format(date);


String query3 = "select * from projinfo where id = "+ID;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query4 = "select * from appinfo where appname ='"+app_Name+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);

String query5 = "select read_date from app_prior where prj_name ='"+Project_Name+"' and proj_name = '"+app_Name+"'";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String imp_id="";
String sequenceNumber="";
int actualHours=0,plannedHours=0,actualHours1=0,plannedHours1=0;
{
%>

<form class="form-signin" name="loginForm" method="post" action="business" >

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
                           <% if(rs3.next()){ %>
                    <% if(rs4.next()){
                    	String rowCount="";
                    	 String query11 = "select * from business where appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"' and id=(select max(id) from business where appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"')";
                         Statement st11 = conn.createStatement();
                         ResultSet rs11 = st11.executeQuery(query11); 
                         String query12 = "select count(*) from business where appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"'";
                         Statement st12 = conn.createStatement();
                         ResultSet rs12 = st12.executeQuery(query12);
                         if(rs12.next())
                        	 rowCount=rs12.getString(1);
                        	 
                    	%>
                         <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %></a>
                       <input type="text" id="project_name" name="project_name" value="<%=rs3.getString("projectname")%>" style="display:none;">
                                                   
                    <%
                    
                    while(visit_rs.next())
                    {
                    	if(visit_rs.getString(1)!=null){
                    	if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Intake Module") && visit_rs.getString(6).equals(Project_Name) && visit_rs.getString(7).equals(rs4.getString("appname")) )
                    	{
                    		Statement stmtt = conn.createStatement();
                             String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Intake Module' and Projects='"+Project_Name+"' and Applications='"+rs4.getString("appname")+"'";
                             int count = stmtt.executeUpdate(queryy);
                             flag=0;
                    	}
                    }
                    }
                    System.out.println("below visits");
                    if(flag==1)
                    {
                    	
                    	String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    	        + " values (?, ?, ?, ?, ?, ?, ?)";
                    	System.out.println(ins_query);
                    	      PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
                    	      preparedStmt.setString (1, username);
                    	      preparedStmt.setString (2, strDate);
                    	      preparedStmt.setString(3, "Intake Module");
                    	      preparedStmt.setString(4, "1");
                    	      preparedStmt.setString(5, strTime);
                    	      preparedStmt.setString(6, Project_Name);
                    	      preparedStmt.setString(7, app_Name );

                    	      // execute the preparedstatement
                    	      preparedStmt.execute();
                    }
                    
                    
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
                  System.out.println("bala");
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
                	  { System.out.println("murugan");
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
                    %>
              

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span id="nav_userid"><%=username%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=roles%></span></a></li>
      
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
                                        <a href="Intake_Business.jsp" class="active-menu"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Intake_Business.jsp"> <span>Application Information</span></a></li>
                                            <li><a href="Intake_Business.jsp"> <span>Legacy Retention Information</span></a></li>
                                            <li><a href="Intake_Business.jsp"> <span>Archive Data Management</span></a></li>
                                            <li><a href="Intake_Business.jsp"> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>
   <li class="has-children">
                                        <a href="Intake_TechnicalDetails.jsp" class="active-menu"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Intake_TechnicalDetails.jsp"> <span>Application Data Information</span></a></li>
                                            <li><a href="Intake_TechnicalDetails.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="Intake_ArchiveRequirements.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>

                        		<li><a href="Archive_Execution.jsp"><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span></a></li>
                                </ul>
                    
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
            

                <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>
                
                			
<!-- Projects List Start -->

                 
                     
            
<section>

    <div class="row">
      <div class="container">

                      <div class="main">
                         <br>
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

     <br>
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

<br/>

<div class="row m0a">
        
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

 <% if (rs11.next() || rowCount.equals("0")) {%>  
<div class="panel-group" id="panels1" > 
                    
                 <div class="panel panel-default"> 
                    <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" >Application Information</a> </h4> 
                            </div>                             
                        <div id="collapse1" class="panel-collapse collapse in" name="collapse"> 
                              <div class="panel-body">
                                  <form role="form"> 
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput198" >
                                            <div class="required">Legacy Application Name&nbsp;
                                            </div>
                                            </label>
                                            <input type="text" class="form-control" id="legappname" placeholder="Legacy Application Name" name="legappname" value="<%=app_Name%>"  />
                                        </div>
                                        
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput229">References to Application</label>
                                            <input type="text" class="form-control" id="reftoapp" placeholder="References" name="reftoapp" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(2) %>" <%} %> >
                                     </div>
                                    
                                       <div class="form-group row log-date">
           <div class="col-md-12">
            <label class="control-label">Tracking ID</label>
            <input placeholder="ID" id="tid" name="tid" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(3) %>" <%} %> >
            </div>
          
                                       </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Description</div></label>
            <input placeholder="Description" id="descr" name="descr" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(4) %>" <%} %> >
          </div> 
          
        </div>  
        
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Legacy Application Vendor/Manufacturer</div></label>
            <input  id="vendor" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(5) %>" <%} %> >
          </div>
        
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Contract Expiration Date</div></label>
            <input placeholder="mm/dd/yyyy" id="expirydate" name="expdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(6) %>" <%} %> >
          </div>
          
        </div>  
                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Notice Period for Expiration of Contract</label>
            <input  id="noticeperiod" name="noticeperiod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(7) %>" <%} %>>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Contract Value of Application</label>
            <input  id="contractvalue" name="contractvalue" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(8) %>" <%} %>>
          </div>
          
        </div>  
               
                                             
                                       <%if(rs5.next()) {
                                    	   System.out.println("aaa "+rs5.getString("read_date"));
                                       %>
                                        
                                        
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label"><div class="required">Read Only Date</div></label>
            <input placeholder="mm/dd/yyyy" id="rod" name="rod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs5.getString("read_date")%>">
          </div>
          <%} %>
          
        </div>
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Comment</label>
            <input  id="cmnt" name="cmnt" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(12) %>" <%} %>>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">If the applications transitions has dependencies?</label>
            <input placeholder="" id="hasdep" name="hasdep" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(13) %>" <%} %>>
          </div>
          
        </div>    
   
       
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label"><div class="required">Size of Database</div></label>
            <input  id="dbsize" name="dbsize" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(15) %>" <%} %>>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Location of Data</label>
            <input  id="dataloc" name="dataloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(16) %>" <%} %>>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Site Location of Data</label>
            <input  id="siteloc" name="siteloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(17) %>" <%} %>>
          </div>
          
        </div>
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Does the application needs archival?</div></label>                                             
                                            <select id="needarch" class="form-control" name="needarch" > 
                                            <option></option>
                                                <option <% if(!rowCount.equals("0") && (rs11.getString(18).equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString(18).equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>  
                                                <option <% if(!rowCount.equals("0") && (rs11.getString(18).equals("Other"))){ %> value="Other" selected <%} else{%>value="Other"<%} %>>Other</option>                                                 
                                            </select>
                                        </div>  
  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Comments</div></label>
            <input  id="archcmnt" name="archcmnt" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(20) %>" <%} %>>
          </div>
          
        </div> 
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox"  id="sourceoft" name="sourceoft" <% if(!rowCount.equals("0") && (rs11.getString("ssn").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Is this Application's data the source of Truth?
                                            </label>                                             
                                        </div> 
                                        
  <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick=" validateform()"> Next<span class="glyphicon glyphicon-chevron-right"></span></button> 
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        
                 <div class="panel panel-default"> 
                     <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Legacy Retention Information</a> </h4> 
                      </div>                             
                         <div id="collapse2" class="panel-collapse collapse"> 
                             <div class="panel-body">
                                <form role="form">
                                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Retention Code</div></label>
            <input  id="reccode" name="reccode" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text"  <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(22) %>" <%} %>/>
          </div>
          
        </div> 
                                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "> <div class="required">Trigger Date Field</div></label>
            <input placeholder="mm/dd/yyyy"  id="triggerdate" name="triggerdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(23) %>" <%} %>>
          </div>
          
        </div> 
        
        
        
        
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Period of Retention</div></label>
            <input  id="retentionperiod" name="retentionperiod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(24) %>" <%} %>>
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Table Name/s where Retention need to apply</div></label>
            <input  id="retentiontable" name="retentiontable" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(25) %>" <%} %>>
          </div>
          
        </div> 
                                        <label text-align:"left"><div class="required">Retention Document to refer to</div></label>
                                        <input type="file" name="file" id="file" size="60"  />
                                                            
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Name of the Legal Retention & e-Discovery SME</div></label>
            <input  id="retentionname" name="retentionname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(26) %>" <%} %>>
          </div>
          
        </div> 
        <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Does any Records have legal holds/Tax Holds or any indication?</label>                                             
                                            <select id="legalholds" class="form-control" name="legalholds"> 
                                            <option></option>
                                               <option <% if(!rowCount.equals("0") && (rs11.getString(27).equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString(27).equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>  
                                                <option <% if(!rowCount.equals("0") && (rs11.getString(27).equals("Other"))){ %> value="Other" selected <%} else{%>value="Other"<%} %>>Other</option>                                                 
                                           </select>
                                        </div>   
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Who or what entity provided legal or tax hold identification</label>
            <input  id="wholegal" name="wholegal" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(28) %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Should this application's data to be archived?</div></label>                                             
                                            <select id="app_data_arch" class="form-control" name="app_data_arch" > 
                                              <option></option>
                                               <option <% if(!rowCount.equals("0") && (rs11.getString("app_data_arch").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("app_data_arch").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                            </select>
                                        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Brief Explanation</label>
            <input  id="archexp" name="archexp" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString(29) %>" <%} %>>
          </div>
          
        </div>             
           <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt1" onclick="validateform1()"> <a class="collapsed"  href="#collapse3">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                       <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                        
                                    </form>
                                </div>                                 
                            </div>                             
                        </div>
                       
                 <div class="panel panel-default"> 
                     <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors1();">Archive Data Management</a> </h4> 
                            </div>                             
                         <div id="collapse3" class="panel-collapse collapse"> 
                              <div class="panel-body">
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="">Is this application's been used for BI report?</div></label>                                             
                                            <select id="useforBI" class="form-control" name="useforBI"> 
                                            <option></option>
                                              <option <% if(!rowCount.equals("0") && (rs11.getString("useforBI").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("useforBI").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                                                                             
                                            </select>
                                        </div> 
                                             <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="BItarget" type="checkbox" name ="BItarget" <% if(!rowCount.equals("0") && (rs11.getString("BItarget").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>> Is BI aware of using new/alternate target application data to support operational report</label>                                             
                                        </div>
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="BIengagement" type="checkbox" name = "BIengagement" <% if(!rowCount.equals("0") && (rs11.getString("BIengagement").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %> >BI Engagement should be initiated by Application owner and completed prior archiving</label>
                                        </div>                                        
                                     <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt2" onclick="validateform3()">   Next<span class="glyphicon glyphicon-chevron-right"></span></button>
                                      <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new2" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        
                 <div class="panel panel-default"> 
                      <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse4" onclick="switchColors2();">Privacy Classification</a> </h4> 
                            </div>                             
                          <div id="collapse4" class="panel-collapse collapse"> 
                              <div class="panel-body">
                              
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" id="creditacc" name="creditacc" <% if(!rowCount.equals("0") && (rs11.getString("creditacc").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Account Credit Card
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="financialacc" type="checkbox" name="financialacc" <% if(!rowCount.equals("0") && (rs11.getString("financialacc").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %> >Account Number - Financial
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="dob" name="dob" type="checkbox" name="dob"  <% if(!rowCount.equals("0") && (rs11.getString("dob").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Date of Birth
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input  id="driverlic" name="driverlic" type="checkbox" name="driverlic" <% if(!rowCount.equals("0") && (rs11.getString("driverlic").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %> >Driver's License Number
                                                <br>
                                            </label>                                             
                                        </div> 
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="email" name="email" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("email").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Email Address
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="family"  name="family" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("family").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>family Status
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="gender"  name="gender" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("gender").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Gender
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="geoloc" name="geoloc" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("geoloc").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Geo Location
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="img" name="img" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("img").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Image/Video
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="income" type="checkbox" name="income" <% if(!rowCount.equals("0") && (rs11.getString("income").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Income
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="ipadrs" type="checkbox" name="ipadrs" <% if(!rowCount.equals("0") && (rs11.getString("ipadrs").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>IP Address
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="martialstatus" type="checkbox" name="martialstatus" <% if(!rowCount.equals("0") && (rs11.getString("martialstatus").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Martial Status
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="mobid" type="checkbox" name="mobid" <% if(!rowCount.equals("0") && (rs11.getString("mobid").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Mobile Device Id
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="name" name="name" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("name").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Name
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="phno" name="phno" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("phno").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %> >Phone Number
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="mailadrs" type="checkbox" name="mailadrs" <% if(!rowCount.equals("0") && (rs11.getString("mailadrs").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Physical/Mailing Address
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="physic" type="checkbox" name="physic" <% if(!rowCount.equals("0") && (rs11.getString("physic").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %> >Physical Description
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="race" type="checkbox" name="race" <% if(!rowCount.equals("0") && (rs11.getString("race").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Race/Ethnicity
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="religion" type="checkbox" name="religion" <% if(!rowCount.equals("0") && (rs11.getString("religion").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>> Religion
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="sexualpref" type="checkbox" name="sexualpref" <% if(!rowCount.equals("0") && (rs11.getString("sexualpref").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Sexual Preference
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="ssn" name="ssn" type="checkbox" <% if(!rowCount.equals("0") && (rs11.getString("ssn").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>SSN/SIN
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input  id="others" type="checkbox" name="others" <% if(!rowCount.equals("0") && (rs11.getString("others").equals("Yes"))){ %> value="Yes" checked <%} else{%>value="Yes"<%} %>>Others
                                            </label>                                             
                                        </div>
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Brief Explanation</label>
            <input  id="expl" name="expl" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("expl") %>" <%} %>>
          </div>
          
        </div> 
                           <h4>Security Information:</h4>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Does the application have localization requirement/ regulations</div></label>                                             
                                            <select id="localreq" class="form-control" name="localreq"> 
                                            <option></option>
                                             <option <% if(!rowCount.equals("0") && (rs11.getString("localreq").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("localreq").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                                                                                
                                            </select>
                                        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">List of Countries where localization requirement/ regulations apply</div></label>                                             
                                            <select id="localcountry" class="form-control" name="localcountry"> 
                                            <option></option>
                                              <option <% if(!rowCount.equals("0") && (rs11.getString("localcountry").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("localcountry").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                                                                                 
                                            </select>
                                        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Are the Localization requirements/regulations enforced with infrastructure or geofencing</div></label>                                             
                                            <select id="localinf" class="form-control" name="localinf"> 
                                            <option></option>
                                              <option <% if(!rowCount.equals("0") && (rs11.getString("localinf").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("localinf").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                                                                               
                                            </select>
                                        </div> 
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Infrastructure Localization enforcement, please list the locations of the datacenters</div></label>
            <input  id="datacenters" name="datacenters" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("datacenters") %>" <%} %>>
          </div>
          
        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26">External access  for archived data</label>                                             
                                            <select id="extaccess" class="form-control" name="extaccess"> 
                                            <option></option>
                                              <option <% if(!rowCount.equals("0") && (rs11.getString("extaccess").equals("Yes"))){ %> value="Yes" selected <%} else{%>value="Yes"<%} %> >Yes</option>                                                 
                                                <option <% if(!rowCount.equals("0") && (rs11.getString("extaccess").equals("No"))){ %> value="No" selected <%} else{%>value="No"<%} %>>No</option>    
                                                                                                 
                                            </select>
                                        </div>  
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Describe who or what external entity needs access </label>
            <input placeholder="" id="who" name="who" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("who") %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">User Name</label>
            <input  id="uname" name="uname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("uname") %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Role Description</label>
            <input  id="roledesc" name="roledesc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("roledesc") %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Reason for Access</label>
            <input  id="accreason" name="accreason" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("accreason") %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Frequency of Access</label>
            <input  id="accfreq" name="accfreq" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("accfreq") %>" <%} %>>
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Additional System Requirements</label>
            <input  id="sysreq" name="sysreq" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" <% if(rowCount.equals("0")) {%>value=""<%} else {%> value="<%= rs11.getString("sysreq") %>" <%} %>>
          </div>
          
        </div> 
      
                                         <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new3" onclick="validateform3()"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                             
                                </div>                                 
                            </div>                             
                        </div>
        </div>
                     <input type="text" id="role_info" value="<%= role_info %>" style="display:none">   
       
                    <button type="submit" class="btn btn-primary btn pull-right" onclick="validateform2();">Save & Continue...</button>&nbsp;

                    <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel</button> 
                     
 </div>  
                   
       </div>
                
      
        <%
}
}
}
}
}
catch(Exception e){}
%>
</form>

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
