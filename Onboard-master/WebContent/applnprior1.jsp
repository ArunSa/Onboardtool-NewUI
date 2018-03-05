<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    
    <script type="text/javascript" src="js_in_pages/applnprior1.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/applnprior1.css" type="text/css" />
   
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
  
</head>
<body class='default'>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
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
double ans=0.0;
try {
	int  total;
	HttpSession details=request.getSession();
	String det=(String)session.getAttribute("theName");
	String appl=(String)details.getAttribute("applications");
	String prj=(String)details.getAttribute("projects");
	DBconnection d=new DBconnection();
	Connection conn = (Connection)d.getConnection();
String query3 = "select * from projinfo where id = "+det;

String name="";

Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
if(rs3.next())
	name=rs3.getString("projectname");
session.setAttribute("newname",name);
String query1="";
if(prj.equals("all"))
	 query1 = "select * from appinfo where prjname = '"+name+"' and complexity is not null";
else
	 query1 = "select * from appinfo where prjname = '"+prj+"' and appname='"+appl+"' and complexity is not null";
ResultSet rs1 = st1.executeQuery(query1);
String query2= "select count(prjname) As total from appinfo where prjname='"+name+"' and complexity is not null";
ResultSet rs2 = st2.executeQuery(query2);
{
%>

<%if(rs2.next())
{
total=rs2.getInt("total");
System.out.println(total);

%>

 
<form class="form-signin" name="loginForm" method="post">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
           
                
                    
                    <a class="navbar-brand" href="project.jsp" style="color:white">Onboarding Tool-<%=name %></a>
                    <%String quer2="select * from archive_exec where level=1 and projects='"+name+"'order by seq_num";
 Statement s2 = conn.createStatement();
ResultSet rss = s2.executeQuery(quer2);
while(rss.next())
{
	session.setAttribute(rss.getString(3),rss.getString(15));
}
%>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                         <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String roles=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=roles%></span></p>
</li> 
                        <li>
                            <a href="logout.jsp" style="color:white ;background:#3276B1" >Logout</a>
                        </li>
                    </ul>
                    
                </div>
               
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-md-3 sidebar">
                  <div id='jqxWidget'>
        <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; margin-right:30px; padding-left:10px '>
                    <ul class="nav nav-sidebar" id ="sidemenu">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li item-selected='true'><a href="AppEmphasize_application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree1.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                                
                            </ul>
                        </li>
                        <li item-selected='true'><a href="applnprior1.jsp">Application-Prioritized</a></li>
                    </ul>
                </li>
               <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href='firstinsert.jsp'>Business</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Information</a></li>
                <li><a href='firstinsert.jsp'>Legacy Retention Information</a></li>
                <li><a href='firstinsert.jsp'>Archive Data Management</a></li>
                <li><a href='firstinsert.jsp'>System Requirements</a></li>
                
                </ul></li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Technical</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Data Information</a></li>
                <li><a href='firstinsert.jsp'>Infrastructure & Environment Inforamation</a></li>
                <li><a href='firstinsert.jsp'>Technical Information</a></li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href='firstinsert.jsp'>Archival Requirements</a>
                 <ul>
                 <li><a href='firstinsert.jsp'>Screen/Report Requirements</a></li>
                 <li><a href='firstinsert.jsp'>Archive Requirements</a></li>
                 </ul>
                 </li>
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

                             <br/><br/><br/>
                    
                    
                <div class="col-md-9">
          <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("HyperCare");
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
  <div  class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
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
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
                              
         <div class="row">
		
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                
                </div>
                
                <div class="col-xs-3 bs-wizard-step complete"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">2</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">3</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
            </div>
            <br/>
        
        
        
	</div>
        
                                
                                
  <div class="table-responsive" id="table-scroll"  > 
   
    <table class="js-dynamitable     table table-bordered" id="myTable" >
      
      <thead style="color:white; background:#3276B1">

        <tr>
          <th>Application Name</th>
          <th>Complexity</th>
          <th>Estimated Size of xDB </th>
          <th>Estimated Service Cost </th>
          <th>Priorities</th>
         
    </tr>
        
        
      </thead>
     
      <tbody>   
        
      <%int i=0	; %>
          <%
        
while(rs1.next()){

%>

        <tr>
        
          <td class="edit_row" style="cursor:pointer" id="11"><span class="test"><input type="text" id="project_name<%=i%>" name="project_name<%=i%>" value="<%=rs1.getString("appname") %>"></span></td>
          <td class="row_s" style="cursor:pointer" id="22"><span class="test"><input type="text" id="complexity<%=i%>" name="complexity<%=i%>" value="<%=rs1.getString("complexity") %>"></span></td>
          <td class="row_t" style="cursor:pointer" id="33"><span class="test"><input type="text" id="est_db_size<%=i%>" name="est_db_size<%=i%>" value="<%=rs1.getString("est_db_size") %>"></span></td>
          <td class="row_d" style="cursor:pointer" id="44"><span class="test"><input type="text" id="est_cst<%=i%>" name="est_cst<%=i%>" value="<%=rs1.getString("est_cst") %>"></span></td>
          <td class="row_d" id="55">
          <span class="test"><input type="text" name="priority<%=i %>" id="priority<%=i %>" value="<%=rs2.getInt("total")-i %>"></span>
        </td>

       
         
         
        </tr>
        <%
i++;        
} 
        
	
        %>
        
    </tbody>
    </table>
 
      <script>
// JavaScript script from: http://coursesweb.net/javascript/

// gets all the .edit_row cells, registers click to each one
var edit_row = document.querySelectorAll('#myTable .edit_row');
for(var i=0; i<edit_row.length; i++) {
  edit_row[i].addEventListener('click', function(e){
    // get parent row, add data from its cells in form fields
    var tr_parent = this.parentNode;
    document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
    document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
    document.getElementById('est_db_size').value = tr_parent.querySelector('.row_t').innerHTML;
    document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
    }, false);
}

</script>
     
  </div>
  <br />
                                
                        
                            <br/>
                      
         
                                                                                            
                                   
                                   
<button type="button" class="btn btn-primary" onclick="call()" >Submit</button>     
     
                    <a href="tree1.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                    
                    <a href="tree1.jsp" style="float:right">Click here to enter data for application</a>
                                      <% } 
                                      
%> 
                           
                                </div>                                 
                            </div>
                             <%

}}
catch(Exception e){}
%>
</body>
</html>