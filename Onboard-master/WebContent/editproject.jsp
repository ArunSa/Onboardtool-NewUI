<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Information</title>

     <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="od/css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="od/css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="od/css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="od/css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="od/css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="od/css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="od/css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="od/css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="od/css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="od/js/modernizr/modernizr.min.js"></script>
   
  </head>
  
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

HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String info=(String)details.getAttribute("app_emp");
String username=(String)details.getAttribute("u_Name");
String Project_Name=(String)details.getAttribute("nameofproject");
System.out.println("the username is "+username);

try {
String det=(String)session.getAttribute("theName");
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
String visit_query="select * from visits";
Statement visit_st = conn.createStatement();
ResultSet visit_rs = visit_st.executeQuery(visit_query);
int flag=1,knt=0;
Date date = new Date();
SimpleDateFormat ft,ft1;
ft=new SimpleDateFormat ("yyyy-MM-dd");
ft1=new SimpleDateFormat ("hh:mm:ss");
String strDate=ft.format(date);
String strTime=ft1.format(date);
while(visit_rs.next())
{
	if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("App Emphasize Module") && visit_rs.getString(6).equals(Project_Name) )
	{
		Statement stmtt = conn.createStatement();
         String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='App Emphasize Module' and Projects='"+Project_Name+"'";
         int count = stmtt.executeUpdate(queryy);
         flag=0;
	}
	else
		System.out.println(++knt+" Noo");
}
System.out.println("the flag value is "+flag);
if(flag==1)
{
	String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
	        + " values (?, ?, ?, ?, ?, ?, ?)";
	      PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
	      preparedStmt.setString (1, username);
	      preparedStmt.setString (2, strDate);
	      preparedStmt.setString(3, "App Emphasize Module");
	      preparedStmt.setString(4, "1");
	      preparedStmt.setString(5, strTime);
	      preparedStmt.setString(6, Project_Name);
	      preparedStmt.setString(7, "");

	      // execute the preparedstatement
	      preparedStmt.execute();
}
String query = "select * from projinfo";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
if(rs.next()){
%>

 
<form class="form-signin" name="loginForm" method="post" action="EditProject">

 <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">

                    <% if(rs3.next()){
                    details.setAttribute("appno",rs3.getString("appno"));
                    details.setAttribute("projectname",rs3.getString("projectname"));
                    %>
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
                    <%
                    String q2="select * from archive_exec where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    session.setAttribute(rss.getString(3),rss.getString(15));
                    }
                    
                    } %>
                    
                			<a class="navbar-brand" href="project.jsp" id="sitetitle">
                			    <img src="od/images/logo1.png" alt="Onboarding Tool" class="logo">
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
                                            <li><a href="application1.jsp"> <span>Application Details</span></a></li>
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
            
            
                        <section>

    <div class="row">
      <div class="container">

                      <div class="main">
              

                <div class="col-md-8">
                
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
</div><jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
<div class="row">
  <div class="panel-group" id="panels1" style="display:block;"> 
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">2</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">3</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">4</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
            </div>
        
 
     
                   
                                              
            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h2 class="panel-title"> <a  data-parent="#panels"   > Project Information  </a> </h2> 
                            </div>  
                                                       
                           
                                <div class="panel-body text-left">
                                <br/><br/>
                                
                                    
                                    
                                        <form role="form" class="form-horizontal">
                                        
                                         <div class="form-group form-group-sm" > 
                                         <div class="col-sm-2">
                                         </div>
                                            <label class="col-sm-2 control-label" for="pid">
                                               Project ID&nbsp;
</label>
<div class="col-sm-5">
                                            <input type="text"  class="form-control" id="pid"  placeholder="Project ID" name="pid" value="<%=rs3.getString("id")%>" >
                                        </div>
                                        </div>
                                        <br/><br/><br>
                                        <div class="form-group form-group-sm"> 
                                        
                                        <div class="col-sm-2">
                                        
                                         </div>
                                            <label class="col-sm-2 control-label" for="projectname">
                                              <div class="required"> Project Name </div>
</label>
                            <div class="col-sm-5">
                                            <input type="text" class="form-control" size="35" id="projectname" placeholder="Project Name" name="projectname" value="<%=rs3.getString("projectname")%>" required>
                                        </div>
                                        </div>
                                      <br/><br/><br>
                                      
                                      
                                        <div class="form-group form-group-sm"> 
                                       
                                        <div class="col-sm-2">
                                         </div>
                                            <label class="col-sm-2 control-label" for="descr"> <div class="required">Description</div></label>
<div class="col-sm-5">
                                            <input type="text" class="form-control" id="descr" placeholder="Description" name="descr"  value="<%=rs3.getString("descr")%>" required>
                                        </div>
                                       
                                        </div>
                                         <br/><br/><br>
                                         
                                         
                                       <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label ">No of Applications</label>
            <div class="col-sm-5">
            <input placeholder="No of Applications" id="appno" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("appno")%>">
          </div>
          </div>
          
        </div>  
        <br/>
        
                                         <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label "><div class="required">Project Start Date</div></label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Startdate" name="Startdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Startdate")%>" required>
          </div>
          </div>
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label "> Initiate Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Intdate" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Intdate")%>">
          </div>
          </div>
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label ">Plan Start Date</label>
            <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Plandate" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Plandate")%>">
          </div>
          </div>
        </div>    
        <br/>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label ">Execution Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Execdate" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Execdate")%>">
          </div>
          </div>
        </div>            
        <br>
        
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label ">Hypercare Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Hyperdate" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Hyperdate")%>">
          </div>
          </div>
         
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label "><div class="required">Project End Date</div></label>
            <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Enddate" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Enddate")%>" required>
          </div>
          </div>
        </div> 
        <input type="text" id="pwqej" value="<%= info %>" hidden>                
                            
                                </div>                                 
                                                      
                       
                       <hr>
        <br/>
                      &nbsp;&nbsp;  &nbsp;&nbsp;<button type="submit" class="btn btn-success pull-right" >Save & Continue...</button>&nbsp;
                       <button type="button" class="btn btn-default">Back</button>
                       
              &nbsp;&nbsp; <br/>
               
              <br/>
               </form>                                                                                                               
 <script>
 if(document.getElementById('pwqej').value=="R")
checkk();
 </script>                             
        
                   
                  
  <%
}
}
catch(Exception e){}
%>    
           
 
         <!-- /.col-md-6 -->

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
                    
         </div>
       </div>
       </div>
   
</body>
</html>