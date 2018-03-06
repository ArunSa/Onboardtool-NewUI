
<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
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
  
  
<script type="text/javascript" src="js_in_pages/requirements.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/requirements.css" type="text/css" />
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
String imp_id="";
String sequenceNumber="";
int actualHours=0,plannedHours=0,actualHours1=0,plannedHours1=0;
{
%>
<form class="form-signin"name="loginForm" method="post">
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
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ol class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li><li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>    <li>
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
                <li id='home' item-selected='true'> <a href="project.jsp">Home </a></li>
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
                         <li><a href="AppEmphasize_applnprior1.jsp">Application-Prioritized</a></li>
                    </ul>
                </li>
                 <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href="business.jsp">Business</a>
                <ul>
                <li><a href="business.jsp">Application Information</a></li>
                <li><a href="business.jsp">>Legacy Retention Information</a></li>
                <li><a href="business.jsp">Archive Data Management</a></li>
                <li><a href="business.jsp">System Requirements</a></li>
                
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
                 <li id='a'><a href="requirements.jsp">Screen/Report Requirements</a></li>
                 <li id='b'><a href="requirements.jsp">Archive Requirements</a></li>
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
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 

</script>
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1;color:white" > 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1">Screen/Report Requirement</a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body">
                                    <form role="form"> 
                                   </form>
                                        <button type="button" class="btn btn-primary">Add Requirement</button>
                                   <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                       
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1;color:white"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2">Archive Requirements</a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="leghpolds" value="checked" >Current Legal holds on the application data must be applied to the application's archived data to override the Retention schedule
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataapp" value="checked">Data from application must be retained based on the Client Retention schedule.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataloc" value="checked">Data Localization Laws must be followed where relevant.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="reconsttools" value="checked">The System has tools to reconstruct the data in its original format
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="viewblob" value="checked">The System allows for user viewing of blob data in its original format in relationship to its structured data
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="fieldprop" value="checked">Archived data maintains its field properties and formats from the source system (i.e. decimals, %, commas, .00x, YYY-MM-DD) to display values defined in Views and schemas
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="filedtype" value="checked">Archived data maintains its field types from the source system (i.e. STRING, Integer, CHAR, VCHAR, Date) to display values defined in Views and schemas
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="splchars" value="checked">The System supports archiving special characters as found in source data to include Foreign characters
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="foreignlang" value="checked">The System supports archiving Foreign Language data and maintains the Language in the archive
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="clob" value="checked">The System Maintains CLOBs from source systems
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="unstructarch" value="checked">The System supports archiving unstructured formats such as word, excel, PowerPoint, pdf.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="accrole" value="checked">Access to the Archive is role based and controlled through Active Directory.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="dataview" value="checked">The System allows for configuration of data views.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="complctrl" value="checked">Completeness Control - record level check (The number of records sent from the Application are compared to the number of records posted to the target.)
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="errctrl" value="checked">Error Handling Control - record level check (During the load, records deemed as errors based on program logic will be written to an exception log in their entirety).
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="metadata" value="checked">The System supports metadata management and indexing.
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input type="checkbox" name="advsearch" value="checked">The System provides advanced search tools to include data parameters and the standard search tools
                                            </label>                                             
                                        </div> 
                                         <div class="checkbox"> 
                                            <label class="control-label" name="searchparam" value="checked"> 
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
            
            
      
        <%
}
}
catch(Exception e){}
%>
</form>
  </body>
 
</html>