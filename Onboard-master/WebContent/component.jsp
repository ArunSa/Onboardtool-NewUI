<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
 <script type="text/javascript" src="js_in_pages/technical.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/technical.css" type="text/css" />
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
   
</head>
<body>
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
try {
HttpSession details=request.getSession();
String info=(String)details.getAttribute("intake");

String roles=(String)details.getAttribute("role");
System.out.println("IntakeModule    "+ info);
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
String imp_id="";
String sequenceNumber="";
int actualHours=0,plannedHours=0,actualHours1=0,plannedHours1=0;
{
%>
<form class="form-signin" name="loginForm" method="post" action="Technical">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                   <% if(rs3.next()){ %>
                    <% if(rs4.next()){ %>
                   <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %></a>
                    <input type="text" id="project_name" name="project_name" value="<%=rs3.getString("projectname")%>" hidden>             
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
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li><li><%
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
                  <div id='jqxWidget'>
        <div id='jqxTree' style='visibility: hidden;  padding-top:40px; float:left;  margin-left: -45px; padding-left:0 '>
                    <ul class="nav nav-sidebar" id="sidemenu">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'>Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="AppEmphasize_application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree1.jsp">Application Prioritization</a>
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
                <li><a href="business.jsp">Application Information</a></li>
                <li><a href="business.jsp">Legacy Retention Information</a></li>
                <li><a href="business.jsp">Archive Data Management</a></li>
                <li><a href="business.jsp">System Requirements</a></li>
                
                </ul></li>
                <li item-expanded='true'><a href="component.jsp">Technical</a>
                <ul>
                <li id='a'><a href="component.jsp">Application Data Information</a></li>
                <li id='b'><a href="component.jsp">Infrastructure & Environment Inforamation</a></li>
                <li id='c'><a href="component.jsp">Technical Information</a></li>
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


<script>
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#3276B1' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#3276B1";
element.style.background="#3276B1";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 

</script>

<div class="panel-group" id="panels1"> 
<br><br>
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();">                            Application Data Information                            </a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body text-left">
                               
                                  <form role="form"> 
                          <div class="form-group"> 
                                            <label class="control-label"> 
                                                <div class="required">Datatype Characteristics</div>
                                            </label>      
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<input id="checkbox" type="checkbox" name="datatype" value="Structured">Structured &nbsp;      
                                            <input id="checkbox1" type="checkbox" name="datatype" value="Unstructured" >Unstructured &nbsp;
                                            <input id="checkbox2" type="checkbox" name="datatype" value="Hybrid" >Hybrid      &nbsp;                         
                                        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">If the Data Type is Unstructured or Hybrid, process for extracting unstructured data? </div></label>
            <input placeholder="Process Name"  id= "pname" name="pname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26"><div class="required">Does Unstructured or Hybrid business objects needs to be archived?</div></label>                                             
                                            <select id="reason1" class="form-control" name="archneed" required> 
                                           
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                                
                                            </select>
                                        </div>  
       
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "><div class="required">Please specify the formats</div></label>
            <input placeholder="Format Name" id="format" name="format" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
          <div class="checkbox"> 
                                            <label class="control-label required"> 
                                                <input id="language" type="checkbox" name ="mlang" value="Yes" required>Any Special/ Multi Language characters or Foreign Language contained in the application?
                                            </label>                                             
                                        </div> 
                                          <div class="checkbox"> 
                                            <label class="control-label required"> 
                                                <input id="archive" type="checkbox" name="loclang" value="Yes" required>If the legacy application contains local language, should the local language be maintained in the archive? 
                                            </label>                                             
                                        </div> 
                                          <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="range" type="checkbox">Based on the application data and date range of the data, is all or part of the data required to be retained beyond application retirement or repurposing?
                                            </label>                                             
                                        </div> 
         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="Documentation" type="checkbox">System Documentation and its Location
                                            </label>                                             
                                        </div> 
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">User Documentation</label>
            <input placeholder="User Documentation" id="userdoc" name="userdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Technical Documentation</label>
            <input placeholder="Technical Documentation" id="techdoc" name="techdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Training Documentation</label>
            <input placeholder="Training Documentation" id="traindoc" name="traindoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Support Documentation</label>
            <input placeholder="Support Documentation" id="supportdoc" name="supportdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Data Dictionary</label>
            <input placeholder="Data Dictionary" id="datadic" name="datadic" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Test Case Documentation</label>
            <input placeholder="Test Case Documentation" id="testcasedoc" name="testcasedoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Testing Records</label>
            <input placeholder="Testing Records" id="testrec" name="testrec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Design Specification</label>
            <input placeholder="Design Specification" id="designspec" name="designspec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Requirements Specification</label>
            <input placeholder="Requirements Specification" id="reqSpeci" name="reqSpeci" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Validation Plan</label>
            <input placeholder="Validation Plan" id="validityplan" name="validityplan" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                     <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="validateform()"> <a class="collapsed"  href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                        
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Infrastructure & Environment Information</a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    <form role="form">
                                    
                                    <div class="checkbox"> 
                                            <label class="control-label required"> 
                                                <input id="checkbox3" type="checkbox" name="dataloc"  value="stage" required>&nbsp;Location of Data                       
                                            </label>                                             
                                        </div>
                                        
                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Server Name</label>
            <input placeholder="Server Name" id="servername" name="servername" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Production Instances</label>
            <input placeholder="Production Instances" id="prodinstance" name="prodinstance" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Location of Production Instances</label>
            <input placeholder="Location of Production Instances" id="prodinstanceloc" name="prodinstanceloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        
        
        
                                      <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Contact Name or Entity for Infrastructure Engagement </label>
            <input placeholder="Contact Name or Entity for Infrastructure Engagement " id="infraengage" name="infraengage" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        
        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                &nbsp;Do you need to archive source code?   <input id="checkbox4" type="checkbox">                    
                                            </label>                                             
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label required" for="formInput26">Is this Application a Hosted Service ?</label>                                             
                                            <select id="reasonfor" class="form-control" name="reasonfor"  required> 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                         
                                            </select>
                                        </div>  
                                           
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Duration for retention agreements with the vendor</label>
            <input placeholder="" id="retenduration" name="retenduration" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Does the legacy application’s data need to be archived in the client archive application </label>
            <input placeholder="" id="clientapp" name="clientapp" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Is the Application external customer facing or have a component of being external customer facing</label>
            <input placeholder="" id="extcustfacing" name="extcustfacing" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
          
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">If external facing, web apps/website URLs</label>
            <input placeholder="" id="url" name="url" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Database size of the application</label>
            <input placeholder="" id="dbsize" name="dbsize" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Estimated No of Table in the application</label>
            <input placeholder="" id="nooftable" name="nooftable" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Estimated No of Records(volume) in the application</label>
            <input placeholder="" id="noofrec" name="noofrec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div> 
     
   
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">XML counts for the database</label>
            <input placeholder="" id="xmlcount" name="xmlcount" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Does this application utilize any VPN environments (E.g. Citrix) for access</label>
            <input placeholder="" id="anyvpn" name="anyvpn" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        
       <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox5" type="checkbox">&nbsp;VPN access required for application access                        
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox6" type="checkbox">&nbsp;Does data in the Application integrate to or from other systems?                        
                                            </label>                                             
                                        </div>
      
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label ">Specify the application to integrate</label>
            <input placeholder="" id="appintegrate" name="appintegrate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                       <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Ready Date for Complete Server decommission and Application Retirement</label>
            <input placeholder="dd/mm/yyyy" id="integname" name="integname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required>
          </div>
          
        </div>                    
         <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="validateform1();"> <a class="collapsed" href="#collapse3" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
        <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                                    
                                    </form>
                                    
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors1();">Technical Information</a> </h4> 
                            </div>                             
                            <div id="collapse3" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    <form role="form"> 
                                        <label text-align:"left">Downloadable Attachment1</label>
    <input type="file" id="file" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment2</label>
    <input type="file" id="file1" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment3</label>
    <input type="file" id="file2" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment4</label>
    <input type="file"  id="file3" name="file" size="60" />   
    <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                            
                                    </form>
                                </div>                                 
                            </div>                             
                        </div>
          
                    </div>
       <input type="text" id="pwqej" value="<%= info %>" hidden>
      
    
                    <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel</button> 
                   <button type="submit" class="btn btn-primary btn pull-right" >Save & Continue ...</button>&nbsp;
    
                    <script>
 if(document.getElementById('pwqej').value=="RX" || document.getElementById('pwqej').value=="R")
 
checkk();
 
 </script>        
            
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