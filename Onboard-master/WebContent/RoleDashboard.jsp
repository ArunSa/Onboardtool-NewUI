<html lang="en">
<head>
<title>Role Dashboard</title>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
         <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
           <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
       
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
        <link rel="stylesheet" href="css/RoleDashboard/RoleDashboard.css">
       

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
       <script type="text/javascript" src="js/paging.js"></script> 
       
  	
	<script type="text/javascript" src="js_in_pages/tree.js"></script>
	<!-- graph -->
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <style>
   .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
                #nav_userid{
             color:green;
             }
              


.pg-normal { 
color: white; 
font-size: 15px; 
cursor: pointer; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}

.pg-selected { 
color: #fff; 
font-size: 15px; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}


</style>
 
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
try {
String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query = "select * from projinfo";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query2 = "select * from logs";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String query1 = "SELECT role FROM role_details";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query4 = "select count(uname) from user_details";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(role) from role_details";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
String query7 = "select sum(count) from visits";
Statement st7 = conn.createStatement();
ResultSet rs7 = st6.executeQuery(query7);

if(rs.next()){
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
                			 
                    <% if(rs3.next()){
                    details.setAttribute("appno",rs3.getString("appno"));
                    details.setAttribute("projectname",rs3.getString("projectname"));
                    %>
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
																					  
					   
                    <%
                    String q2="select * from archive_exec where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    session.setAttribute(rss.getString(3),rss.getString(15));
                    }
                    
                    } %>
                    
                			
                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
					 <ul class="nav navbar-nav navbar-right">
					 	<%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
							<li> <a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a> </li>
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
                                        <a href="AppEmphasize_EditProject.jsp" class="active-menu"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
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
                                            <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
   <li class="has-children"><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
               </li> 
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
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
            
                    <div class="main-page">
                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Dashboard</h2>
                                   
                                </div>
                                
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">Role Dashboard</li>
                                    </ul>
                                </div>
                                <!-- /.col-sm-6 -->
                                <div class="col-sm-6 text-right hidden-xs">
                                    <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                                </div>
                                <!-- /.col-sm-6 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    
         <section>
         <br>
            <div class="container-fluid">
              <div class="row">
              <div class="col-lg-4 col-md-4">
                        <div class="cardo card-primary">
                            <div class="card-body">
                            
                                <div class="ui-widgetf">
								  <h1 class="ui-valuef"><%  while(rs4.next()){ %>
								  
								  <%= rs4.getString(1) %>
								  
								  <%}%> </h1>
								  <span class="ui-label">Users</span>
								</div> 
                            </div>
                        </div>
                    </div>
                    
                    <!-- col -->
                    
                    <div class="col-lg-4 col-md-4">
                        <div class="cardo card-second">
                            <div class="card-body">
                               <div class="ui-widgets">
						    <h1 class="ui-values"> <%  while(rs7.next()){ %><%= rs7.getString(1) %><%}%> </h1>
						     <span class="ui-label">No.of Visit</span>
						</div>
                            </div>
                        </div>
                    </div>
              
                   <div class="col-lg-4 col-md-4">
                   
                        <div class="cardo card-orange">
                       
                            <div class="card-body">
                            
                               <div class="ui-widgett">
                                
							  <h1 class="ui-valuet"><%  while(rs5.next()){ %><%= rs5.getString(1) %><%}%></h1> 
							  <span class="ui-label">Roles</span>
							  
							</div>
                            </div>
                        </div>
                    </div>
              </div>
                
   </div> 
        <!-- table -->
        <br>
        <div class="container-fluid">
        <div class="row">
 
<div class="col-lg-12 col-md-12">
<div class="panel panel-default">
      <div class="panel-heading">
        <div class="row">
        <div class="col-lg-1 col-md-1">
         <label>Roles :</label>
        </div>
          <div class="col-lg-4 col-md-4">
          <select id="slct1" name="slct1" onchange="getValue(this.value)">
  <option disabled selected>Please Select any Option</option>
   <%
    while(rs1.next()){
     %>
            <option value="<%= rs1.getString("role") %>"><%= rs1.getString("role") %></option>
     
      <%} %>
  </select>
   </div>
   <div class="col-lg-2 col-md-1">
        <label>UserName :</label>
        </div>
     <div class="col-lg-4 col-md-5">
 
 <span id="state">
      <select name='state' id="username" onchange="filter(this.id,'slct1')">  
     <option disabled selected>Please Select any Option</option>
      </select>  
    </span>  

    </div>
         
        </div>
      </div>
 
       
   
      
        <table id="tablepaging" class="table table-bordered table-striped" align="center">
          <thead>
            <tr>
              <th class="text-center">User Name</th>
              <th class="text-center"> Role </th>
              <th class="text-center">Date </th>
              <th class="text-center">Details </th>
             
            </tr>
          </thead>
          <tbody>
          <%
while(rs2.next())
{

%>

          
            <tr class="content">
              <td  class="text-center"><%=rs2.getString(1)%></td>
              <td  class="text-center"> <%=rs2.getString(6) %> </td>
              <td class="text-center"><%=rs2.getString(2) %></td>
              <td  class="text-center"><%=rs2.getString(5)%></td>
             
            </tr>

<%} %>
                      </tbody>
                      
                      
                       
                     
        </table>
        <div class="form-group">
      <div id="pageNavPosition" style="padding-top: 20px" align="center"><br>
      </div>
</div>
 
        </div>
        
       </div>
    </div>
      </div>
       <br>
        
        <!-- graph -->
      <div class="container-fluid">
      
      <div class="row">
                    <!-- Column -->
                    <div class="col-lg-7 col-md-7">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                  <div class="col-lg-8 col-md-5">
                                    <h3 class="title">&nbsp;&nbsp;Overview of Visits</h3>
                                      </div>
                                     <!-- dropdown -->
                                      <div class="col-lg-4 col-md-5">
 
										 <span>
										      <select id="linedrop"> 
										      <option disabled> Select any option </option>
										      <option id="weekly" value="weekly" selected> Weekly &nbsp;&nbsp; </option>
										       <option id="monthly" value="monthly"> Monthly</option>
										        <option id="yearly" value="yearly"> Yearly</option>
										      </select>  
										    </span>  
										
										    </div>
                                    <div id="curve_chart" style="height: 250px; width:700px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Role Status</h3>
                                <h6 class="card-subtitle"></h6>
                             <div id="piechart"></div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
      
      
      
      </div>      
            <script type="text/javascript">

function Pager(tableName, itemsPerPage) {

this.tableName = tableName;

this.itemsPerPage = itemsPerPage;

this.currentPage = 1;

this.pages = 0;

this.inited = false;

this.showRecords = function(from, to) {

var rows = document.getElementById(tableName).rows;

// i starts from 1 to skip table header row

for (var i = 1; i < rows.length; i++) {

if (i < from || i > to)

rows[i].style.display = 'none';

else

rows[i].style.display = '';

}

}

this.showPage = function(pageNumber) {

if (! this.inited) {

alert("not inited");

return;

}

var oldPageAnchor = document.getElementById('pg'+this.currentPage);

oldPageAnchor.className = 'pg-normal';

this.currentPage = pageNumber;

var newPageAnchor = document.getElementById('pg'+this.currentPage);

newPageAnchor.className = 'pg-selected';

var from = (pageNumber - 1) * itemsPerPage + 1;

var to = from + itemsPerPage - 1;

this.showRecords(from, to);

}

this.prev = function() {

if (this.currentPage > 1)

this.showPage(this.currentPage - 1);

}

this.next = function() {

if (this.currentPage < this.pages) {

this.showPage(this.currentPage + 1);

}

}

this.init = function() {

var rows = document.getElementById(tableName).rows;

var records = (rows.length - 1);

this.pages = Math.ceil(records / itemsPerPage);

this.inited = true;

}

this.showPageNav = function(pagerName, positionId) {

if (! this.inited) {

alert("not inited");

return;

}

var element = document.getElementById(positionId);

var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span>&nbsp;';

for (var page = 1; page <= this.pages; page++)

pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';

pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next »</span>';

element.innerHTML = pagerHtml;

}

}

</script>
    <script type="text/javascript"><!--
var pager = new Pager('tablepaging', 10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>      
                                                                                                                      
 
                   
   <!--  script for role,piechart curvechart-->
   <script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function getValue(str){
      var input,filter, table, tr, td, i;
     
      
     
      
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      
      var url="state.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      
            }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("username").innerHTML=xmlHttp.responseText   
 
     
      }   
      
    
      }
      
      
      </script> 
     
      <%
      String query8 = "select * from user_details where roles='"+roles+"'and uname='"+uname+"'"; 
      Statement st8 = conn.createStatement();
      ResultSet rs8 = st8.executeQuery(query8);
      %>  
  
    <script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	 
	 var selectedRole = $('#slct1').val();  
	 var selecteduser = $('#username').val();  
    
	 console.log("selectedROle is : " + selectedRole + " selectedUser is :" + selecteduser);
	
	var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('string', 'Year');
    dataTable.addColumn('number', 'Sales');
    // A column for custom tooltip content
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    dataTable.addRows([
  <% while(rs8.next()){ 
	 
  String query22 = "select * from archive_exec where projects='"+rs8.getString("projects")+"' and level=1";
	Statement st22 = conn.createStatement();
	ResultSet rs22 = st22.executeQuery(query22);
	
	while(rs22.next())
	{
	if(rs22.getString("progressbar")=="100")
	continue;
	else
	break;
	}

	String status=rs22.getString("name");
	String progressBar=rs22.getString("progressbar");
	
	if(progressBar.equals("0"))
		progressBar="1";
	  String query23 = "select sum(count) from visits where projects='"+rs8.getString("projects")+"'";
		Statement st23 = conn.createStatement();
		ResultSet rs23 = st23.executeQuery(query23);
		String ttl_visits="",CurntDay_visits="",last_visited_Module="",last_visited_App="";
		while(rs23.next())
			 ttl_visits=rs23.getString(1);
		 String query24 = "select count(*) from visits where date=CURDATE() and projects='"+rs8.getString("projects")+"'";
			Statement st24 = conn.createStatement();
			ResultSet rs24 = st24.executeQuery(query24);
			while(rs24.next())
				CurntDay_visits=rs24.getString(1);
		String query25 = "select module from visits where projects='"+rs8.getString("projects")+"' order by date desc,time desc";
				Statement st25 = conn.createStatement();
				ResultSet rs25 = st25.executeQuery(query25);
				if(rs25.next())
					last_visited_Module=rs25.getString(1);
  
				String query30 = "select Applications from visits where projects='"+rs8.getString("projects")+"' and module='Intake Module' order by date desc,time desc";
				Statement st30 = conn.createStatement();
				ResultSet rs30 = st30.executeQuery(query30);
				if(rs30.next())
					last_visited_App=rs30.getString(1);
	
	String query26 = "select seq_num from archive_exec where projects='"+rs8.getString("projects")+"' and name='"+rs8.getString("application")+"'";
	Statement st26 = conn.createStatement();
	ResultSet rs26 = st26.executeQuery(query26);
	String seqnum="";
	if(rs26.next())
	seqnum=rs26.getString(1);

	String query27="select * from archive_exec where projects='"+rs8.getString("projects")+"' and seq_num>"+seqnum+" and seq_num<="+(Integer.parseInt(seqnum)+70)+" and level=3 order by seq_num";
	//System.out.println(query3);
	Statement st27 = conn.createStatement();
	ResultSet rs27 = st27.executeQuery(query27);

	String Stats="",ProgresBar="";
	while(rs27.next())
	{
	if(rs27.getString("name").equals("Requirements") && Integer.parseInt(rs27.getString("progressbar"))<100 ){
	Stats="Requirements";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	if(rs27.getString("name").equals("Build and Test") && Integer.parseInt(rs27.getString("progressbar"))<100){
	Stats="Development";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	if(rs27.getString("name").equals("Implement") && Integer.parseInt(rs27.getString("progressbar"))<100 ){
	Stats="Implement";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	}
			
	System.out.println(Stats);

		
	
    %>
    ['<%= rs8.getString(6) %>', <%= progressBar %>, "Total Visits : <%= ttl_visits %>\nVisits in current day : <%= CurntDay_visits %>\n Last Visited Module : <%= last_visited_Module %>\n Last Visited Application : <%= last_visited_App %>\n Application : <%= rs8.getString(11)%>,Status : <%= Stats %>\n Percentage of Completion : <%= progressBar %>%"],
  <% }  %>
]);

  // Optional; add a title and set the width and height of the chart
  var options = {
		  'title':'',
		  'width':400,
		  'height':350,
		
		  pieSliceText: 'label',
		  legend : 'none'
  };
  

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(dataTable, options);
}
</script>

<%
String query10 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 10 DAY) AND NOW()";
Statement st10 = conn.createStatement();
ResultSet rs10 = st10.executeQuery(query10);
String query12 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 20 DAY) AND NOW()";
Statement st12 = conn.createStatement();
ResultSet rs12 = st12.executeQuery(query12);
String query13 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()";
Statement st13 = conn.createStatement();
ResultSet rs13 = st13.executeQuery(query13);
String query11 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 50 DAY) AND NOW()";
Statement st11 = conn.createStatement();
ResultSet rs11 = st11.executeQuery(query11);
int last_10=0,last_30=0,last_50=0,last_20=0;
while(rs10.next())
	last_10+=Integer.parseInt(rs10.getString(4));
while(rs11.next())
	last_50+=Integer.parseInt(rs11.getString(4));
while(rs12.next())
	last_20+=Integer.parseInt(rs12.getString(4));
while(rs13.next())
	last_30+=Integer.parseInt(rs13.getString(4));
%>
 <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
        var data = google.visualization.arrayToDataTable([
        	
          ['day', 'Visits'],
          ['Last 10 days', <%= last_10 %> ],
          ['Last 20 days', <%= last_20 %>],
          ['Last 30 days', <%= last_30 %>],
          ['Last 50 days', <%= last_50 %>]
        ]);

        var options = {
          title: '',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script> 
    
    <script>
      function filter(input,s2) {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("username").value;
      
      s2 = document.getElementById("slct1").value;
      
    console.log("Role : " + s2 + " Username :" + input)
     
    $.ajax({
          type:"Post",
          url:"fetch.jsp",
         data:{
              s2: s2,
              input: input
             
           }, 
         async:true,
         cache:false,
         success:function(data) {

console.log(data);
         }
          });
     
    }
      </script>
      
      <!-- filter Html table -->
      
      <script>

function filter(input,s2)
	{  
   var srole = new RegExp($('#slct1').val());
   var user = new RegExp($('#username').val());
		if(user == "/all/")
		{
			clearFilter()
			
		}else{
			$('.content').hide();
			$('.content').filter(function() {
				 var tester = true;
				 tester = srole.test($(this).text());
				 var suser = user.test($(this).text());
				 tester = tester && suser;
			
			        return tester;
		
			}).show();
			
	}
	}
	



</script>
      <!-- pagination  -->
      
  <%
}

}
catch(Exception e){}
%>    
           
 
      

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
         
    
       <!-- ========== COMMON JS FILES ========== -->
       
      
       
       
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        
        
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

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
        <script src="js/main.js"></script>
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>
       
        <!-- ========== PAGE JS FILES ========== -->
        
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

                // 1st  datepicker
                $('#basicExample .time').timepicker({
                'showDuration': true,
                'timeFormat': 'g:ia'
                });

                $('#basicExample .date').datepicker({
                'format': 'd/m/yyyy',
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