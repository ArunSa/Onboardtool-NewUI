
<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <link rel="stylesheet" type="text/css" href="css/intake/business/business.css">
  <script type="text/javascript" src="js/business.js"></script>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
   
     
 <script type="text/javascript" src="js_in_pages/business.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/business.css" type="text/css" />
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
      <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>





  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body>
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
	String info=(String)details.getAttribute("intake");
	String roles=(String)details.getAttribute("role");
String det=(String)session.getAttribute("theName");
String idd = request.getParameter("id");
if (idd != null && !idd.isEmpty()) {
session.setAttribute("appidd", idd);
}
idd=(String)session.getAttribute("appidd");
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
String prj=(String)details.getAttribute("projects");
String appl=(String)details.getAttribute("applications");
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


String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
System.out.println(query3);
String app_Name=idd;
String query4 = "select * from appinfo where appname ='"+idd+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
System.out.println(query4);
String imp_id="";
String sequenceNumber="";
int actualHours=0,plannedHours=0,actualHours1=0,plannedHours1=0;
{
%>

<form class="form-signin" name="loginForm" method="post" action="business" >
<div class="container">
<nav class="navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                   <% if(rs3.next()){ %>
                    <% if(rs4.next()){ %>
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %></a>
                      <input type="text" id="project_name" name="project_name" value="<%=rs3.getString("projectname")%>" hidden>                              
                    <%
                    
                    while(visit_rs.next())
                    {
                    	if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Intake Module") && visit_rs.getString(6).equals(Project_Name) && visit_rs.getString(7).equals(rs4.getString("appname")) )
                    	{
                    		Statement stmtt = conn.createStatement();
                             String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Intake Module' and Projects='"+Project_Name+"' and Applications='"+rs4.getString("appname")+"'";
                             int count = stmtt.executeUpdate(queryy);
                             flag=0;
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
                    } }%>
              
                <div id="navbar" class="navbar-collapse collapse">
                
                    <ol class="nav navbar-nav navbar-right">
                        <li>
                       <img src="assets/images/Logo sized.jpg" class="img-rounded"  height="50" width="80" float="right" alt="Avatar">&nbsp;
</li>
                   
         <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>     <li>
                            <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ol>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-md-3 sidebar">
                  <div id='jqxWidget' >
        <div id='jqxTree' style='visibility: hidden;  padding-top:40px; float:left;  margin-left: -45px; padding-left:0 '>
                  <ul class="nav nav-sidebar" id ="sidemenu" >
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li > Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                               
                            </ul>
                        </li>
                         <li><a href="applnprior.jsp">Application-Prioritized</a></li>                 

                    </ul>
                </li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href="business.jsp">Business</a>
                <ul>
                <li id='a'><a href="business.jsp">Application Information</a></li>
                <li id='b'><a href="business.jsp">Legacy Retention Information</a></li>
                <li id='c'><a href="business.jsp">Archive Data Management</a></li>
                <li id='d'><a href="business.jsp">System Requirements</a></li>
                
                </ul></li>
                <li item-expanded='true'><a href="component.jsp">Technical</a>
                <ul>
                <li><a href="component.jsp">Application Data Information</a></li>
                <li><a href="component.jsp">Infrastructure & Environment Inforamation</a></li>
                <li><a href="component.jsp">Technical Information</a></li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href="requirements.jsp">Archival Requirements</a>
                 <ul>
                 <li><a href="requirements.jsp">Screen/Report Requirements</a></li>
                 <li><a href="requirements.jsp">Archive Requirements</a></li>
                 </ul>
                 </li>
                </ul>
                </li>
                <li><a href="archive_exec_samp.jsp">Archive Execution Module</a>
               </li> 
                
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>
                
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




<div class="panel-group" id="panels1" > 
                       <br><br><br>
                 <div class="panel panel-default"> 
                    <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();">Application Information</a> </h4> 
                            </div>                             
                        <div id="collapse1" class="panel-collapse collapse in" name="collapse"> 
                              <div class="panel-body">
                                  <form role="form"> 
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput198" >
                                            <div class="required">Legacy Application Name&nbsp;
                                            </div>
                                            </label>
                                            <input type="text" class="form-control" id="legappname" placeholder="Legacy Application Name" name="legappname" value="<%=rs4.getString("appname") %>"required />
                                        </div>
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput229">References to Application</label>
                                            <input type="text" class="form-control" id="reftoapp" placeholder="References" name="reftoapp" >
                                     </div>
                                       <div class="form-group row log-date">
           <div class="col-md-12">
            <label class="control-label ">Tracking ID</label>
            <input placeholder="ID" id="tid" name="tid" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
            </div>
          
                                       </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Description</div></label>
            <input placeholder="Description" id="descr" name="descr" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Legacy Application Vendor/Manufacturer</div></label>
            <input placeholder="Vendor/Manufacturer" id="vendor" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
        
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Contract Expiration Date</div></label>
            <input placeholder="dd/mm/yyyy" id="expirydate" name="expdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>  
                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Notice Period for Expiration of Contract</label>
            <input placeholder="Description" id="noticeperiod" name="noticeperiod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Contract Value of Application</label>
            <input placeholder="Contract Value" id="contractvalue" name="contractvalue" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox"  id="businessunits" name="businessunits">Business Units Involved
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox"  id="rodch" name="rodch" value="Yes" >&nbsp;Read Only Date                       
                                            </label>                                             
                                        </div>
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Read Only Date</div></label>
            <input placeholder="dd/mm/yyyy" id="rod" name="rod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Comment</label>
            <input placeholder="Comments" id="cmnt" name="cmnt" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">If the applications transitions has dependencies?</label>
            <input placeholder="" id="hasdep" name="hasdep" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>    
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "> <div class="required">What is the date Range of this Data?</div></label>
            <input placeholder="dd/mm/yyyy" id="daterange" name="daterange" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Size of Database</div></label>
            <input placeholder="Size" id="dbsize" name="dbsize" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Location of Data</label>
            <input placeholder="location" id="dataloc" name="dataloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Site Location of Data</label>
            <input placeholder="sitelocation" id="siteloc" name="siteloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Does the application needs archival?</div></label>                                             
                                            <select id="needarch" class="form-control" name="needarch" required> 
                                            <option></option>
                                                <option value="yes">Yes</option>                                                 
                                                <option value="no">No</option>  
                                                <option value="other">Other</option>                                                 
                                            </select>
                                        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Reason</div></label>
            <input placeholder="Reason" id="archreason" name="archreason" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Comments</div></label>
            <input placeholder="Comments" id="archcmnt" name="archcmnt" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox"  id="sourceoft" name="sourceoft">Is this Application's data the source of Truth?
                                            </label>                                             
                                        </div> 
                                        
  <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick=" validateform()"> Next<span class="glyphicon glyphicon-chevron-right"></span></button> 
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        
                 <div class="panel panel-default"> 
                     <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Legacy Retention Information</a> </h4> 
                      </div>                             
                         <div id="collapse2" class="panel-collapse collapse"> 
                             <div class="panel-body">
                                <form role="form">
                                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Record code of Application</div></label>
            <input placeholder="Recordcode" id="reccode" name="reccode" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required />
          </div>
          
        </div> 
                                    <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "> <div class="required">Trigger Date</div></label>
            <input placeholder="dd/mm/yyyy"  id="triggerdate" name="triggerdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Period of Retention</div></label>
            <input placeholder="RententionPeriod" id="retentionperiod" name="retentionperiod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Table Name/s where Retention need to apply</div></label>
            <input placeholder="Table Name" id="retentiontable" name="retentiontable" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
                                        <label text-align:"left"><div class="required">Retention Requirement</div></label>
                                        <input type="file" name="file" id="file" size="60" required />
                                                            
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Name of the Legal Retention & e-Discovery SME</div></label>
            <input placeholder="Name of Retention" id="retentionname" name="retentionname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
        <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Does any Records have legal holds/Tax Holds or any indication?</label>                                             
                                            <select id="reason_for_access" class="form-control" name="recordhold" > 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                <option>Other</option>                                                 
                                            </select>
                                        </div>   
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Who or what entity provided legal or tax hold identification</label>
            <input placeholder="Identification" id="wholegal" name="wholegal" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Should this application's data to be archived?</div></label>                                             
                                            <select id="reason_for_access1" class="form-control" name="reason" required> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label"><div class="required">Brief Explanation</div></label>
            <input placeholder="Explaination" id="archexp" name="archexp" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>             
           <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="validateform1()"> <a class="collapsed"  href="#collapse3" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                       <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                        
                                    </form>
                                </div>                                 
                            </div>                             
                        </div>
                       
                 <div class="panel panel-default"> 
                     <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors1();">Archive Data Management</a> </h4> 
                            </div>                             
                         <div id="collapse3" class="panel-collapse collapse"> 
                              <div class="panel-body">
                                   <form role="form"> 
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Is this application's been used for BI report?</div></label>                                             
                                            <select id="reason_for_access2" class="form-control" name="reason_for_access" required/> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div>  
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox" type="checkbox" name ="report" required /> <div class="required">Is BI aware of using new/alternate target application data to support operational report </div></label>                                             
                                        </div>
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox1" type="checkbox" name = "archive" required /><div class="required">BI Engagement should be initiated by Application owner and completed prior archiving </div></label>
                                        </div>
                                                                              
                                    </form>
                                     <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="validateform2()"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse4" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                      <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        
                 <div class="panel panel-default"> 
                      <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse4" onclick="switchColors2();">System Requirements</a> </h4> 
                            </div>                             
                          <div id="collapse4" class="panel-collapse collapse"> 
                              <div class="panel-body">
                                   <form role="form"> 
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox23" type="checkbox" name="creditacc" value="Yes">Account Credit Card
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox2" type="checkbox" name="financialacc" value="Yes" >Account Number - Financial
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox3" name="dob" type="checkbox" name="dob"  value="Yes">Date of Birth
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input  id="checkbox4" name="driverlic" type="checkbox" name="driverlic" value="Yes" >Driver's License Number
                                                <br>
                                            </label>                                             
                                        </div> 
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox5" name="email" type="checkbox" name="email" value="Yes">Email Address
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox6"  name="family" type="checkbox" name="family" value="Yes">family Status
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox7"  name="gender" type="checkbox" name="gender" value="Yes">Gender
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox8" name="geoloc" type="checkbox" value="Yes" name="geoloc">Geo Location
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox9" name="img" type="checkbox" name="img" value="Yes">Image/Video
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox10" type="checkbox" name="income" value="Yes">Income
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox11" type="checkbox" name="ipadrs" value="Yes">IP Address
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox12" type="checkbox" name="martialstatus" value="Yes">Martial Status
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox13" type="checkbox" name="mobid" value="Yes">Mobile Device Id
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox14" name="name" type="checkbox" name="name" value="Yes">Name
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox15" name="phno" type="checkbox" name="phno" value="Yes" >Phone Number
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox16" type="checkbox" name="mailadrs" value="Yes">Physical/Mailing Address
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox17" type="checkbox" name="physic" value="Yes" >Physical Description
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox18" type="checkbox" name="race" value="Yes">Race/Ethnicity
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox19" type="checkbox" name="religion" value="Yes"> Religion
                                            </label>
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox20" type="checkbox" name="sexualpref" value="Yes">Sexual Preference
                                                <br>
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox21" name="ssn" type="checkbox" name="ssn" value="Yes">SSN/SIN
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input  id="checkbox22" name="others" type="checkbox" name="others" value="Yes">Others
                                            </label>                                             
                                        </div>
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Brief Explanation</label>
            <input placeholder="Explaination" id="expl" name="expl" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                           <h5>Security Information:
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Does the application have localization requirement/ regulations</div></label>                                             
                                            <select id="reason_for_access4" class="form-control" name="localreq" required> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">List of Countries where localization requirement/ regulations apply</div></label>                                             
                                            <select id="reason_for_access5" class="form-control" name="localcountry" required> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Are the Localization requirements/regulations enforced with infrastructure or geofencing</div></label>                                             
                                            <select id="reason_for_access6" class="form-control" name="localinf" required> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div> 
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Infrastructure Localization enforcement, please list the locations of the datacenters</div></label>
            <input placeholder="location" id="vendor1" name="datacenters" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26">External access required for archived data</label>                                             
                                            <select id="reason_for_access7" class="form-control" name="extaccess"> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                           
                                            </select>
                                        </div>  
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Describe who or what external entity needs access </label>
            <input placeholder="" id="vendor2" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">User Name</label>
            <input placeholder="Username" id="vendor3" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Role Description</label>
            <input placeholder="RoleDescription" id="vendor4" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Reason for Access</label>
            <input placeholder="Reason" id="vendor5" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Frequency of Access</label>
            <input placeholder="Frequency" id="vendor6" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label">Additional System Requirements</label>
            <input placeholder="Countries/Modules" id="sysreq" name="sysreq" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                         <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="validateform3()"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                                              
                                    </form>
                                </div>                                 
                            </div>                             
                        </div>
        </div>
                     <input type="text" id="pwqej" value="<%= info %>" hidden>   
       
                    <button type="submit" class="btn btn-primary btn pull-right" onclick="validateform2();">Save & Continue...</button>&nbsp;

                    <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel</button> 
                     
 </div>  
                   
                    
       </div>
                
            
          
            
      
        <%
}
}
catch(Exception e){}
%>
</form>


  </body>
</html>
