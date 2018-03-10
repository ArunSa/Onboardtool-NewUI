<!DOCTYPE html>
<html lang="en">
<head>
<title>Role Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/RoleDashboard.css">
    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
     <script type="text/javascript" src="js/RoleDashboard.js"></script>
      <script type="text/javascript" src="js/Chart.min.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.0/morris.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
 <link rel="stylesheet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">

<style>.x_panel {
    width: 100%;
    padding: 10px 17px;
    display: inline-block;
    background: #fff;
    border: 1px solid #E6E9ED;
    -webkit-column-break-inside: avoid;
    -moz-column-break-inside: avoid;
    column-break-inside: avoid;
    opacity: 1;
    transition: all .2s ease;
}
custom.min.css:1
.x_panel, .x_title {
    margin-bottom: 30px;
}
#area-chart,
#line-chart,
#bar-chart,
#stacked,
#pie-chart{
  width: 500px;
  min-height: 400px;
}
</style>
 
    
</head><!--from  w  w w  . ja  va 2 s.co  m-->
 <body>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
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
String query4 = "select count(USER_ID) from logs";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(roles) from logs";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);

if(rs.next()){
%>
<form id="form1" name="loginform">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
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
                    
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo_sized.jpg" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>     

<li>               <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
           
                 <div class="row">
            <br>
               <div class="col-sm-3 sidebar">
                 <div class="col-md-2 sidebar" >
                 
        <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; '>
                    <ul class="nav nav-sidebar" id ="sidemenu" >
                        
                        

            <ul>
                  <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="AppEmphasize_EditProject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'><a href="AppEmphasize_EditProject.jsp">Project Details
                    <ul>
                        <li item-selected='true'><a href="AppEmphasize_EditProject.jsp">Project Information</a></li>
                        <li><a href="AppEmphasize_Application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                             
                            </ul>
                        </li>
                        <li><a href="AppEmphasize_applnprior1.jsp">Application-Prioritized</li>
                   

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

                    <br/><br/><br/>
                
                <div class="col-md-4">
                
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

<div class="container"> 
      
        <div class="ui-widget">
  <h1 class="ui-value"><%  while(rs4.next()){ %><%= rs4.getString(1) %><%}%> </h1>
  <span class="ui-label">Users</span>
</div>

<div class="ui-widget">
  <h1 class="ui-value">142</h1>
  <span class="ui-label">Visit</span>
</div>

<div class="ui-widget">
  <h1 class="ui-value"><%  while(rs5.next()){ %><%= rs5.getString(1) %><%}%></h1>
  <span class="ui-label">Roles</span>
</div>
       

<div class="panel panel-primary">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="row">
            <label>Roles :</label>
          <select id="slct1" name="slct1" onchange="getValue(this.value)">
  <option disabled selected>Please Select any Option</option>
   <%  
   

    while(rs1.next()){
    
   
    
        %>
            <option value="<%= rs1.getString("role") %>"><%= rs1.getString("role") %></option>
     
      <%} %>
    
    
  </select>
  
  
  
  
 <label>UserName :</label>
 <span id="state">
      <select name='state' id="username" onchange="filter(this.id,'slct1')">  
     <option disabled selected>Please Select any Option</option>
      </select>  
    </span>
    
  
</div>

          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
               
                <div class="form-group">
                 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="panel-body table-responsive">
        <table class="table table-hover" id="MyTable" >
          <thead>
            <tr>
              <th class="text-center">User Name</th>
              <th class="text-center"> Role </th>
              <th class="text-center">Date </th>
              <th class="text-center">Details </th>
             
            </tr>
          </thead>
          <%
while(rs2.next())
{

%>
          <tbody>
          
            <tr class="content">
              <td  class="text-center"><%=rs2.getString(1)%></td>
              <td  class="text-center"> <%=rs2.getString(6) %> </td>
              <td class="text-center"><%=rs2.getString(2) %></td>
              <td  class="text-center"><%=rs2.getString(5)%></td>
             
            </tr>

<%} %>
                      </tbody>
        </table>
      </div>

      <div class="panel-footer">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-md-8">
              </div>
              <div class="col-md-4">
              <p class="muted pull-right"><strong> © 2018 All rights reserved </strong></p>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <div class="row">
   
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
    <div id="piechart"></div>
   
 </div>
      
    
   
  </div>
  </div>
  
 
     
 
 
                    
         </div>
       </div>
       
       </div>
      

    
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
      String query8 = "select * from user_details where roles='ArchivalAdmin' and uname='bala'";
      Statement st8 = conn.createStatement();
      ResultSet rs8 = st8.executeQuery(query8);
      %>  
    <script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
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
    ['<%= rs8.getString(6) %>', <%= progressBar %>, "Total Visits : <%= ttl_visits %>\nVisits in current day : <%= CurntDay_visits %>\n Last Visited Module : <%= last_visited_Module %>\n Last Visited Application : <%= last_visited_App %>\n Application : <%= rs8.getString(11)%>,Status : <%= Stats %>,Percentage of Completion : <%= ProgresBar %>%"],
  <% }  %>
]);

  // Optional; add a title and set the width and height of the chart
  var options = {
		  'title':'My Average Day',
		  'width':550,
		  'height':400,
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
          title: 'Number of Visits',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script> <script>
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
         <%
}
}
catch(Exception e){}
%>   
   
   </form>
        </body> 
      
</html>