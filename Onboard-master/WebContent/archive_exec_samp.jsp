<!DOCTYPE html>  
<html>  
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script> 

<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
		<script type="text/javascript" src="js/jquery-ui-1.8.13.custom.min.js"></script>
		<script src="http://code.jquery.com/jquery-2.0.3.js"></script>
		<script type="text/javascript" src="js/jqueryprogressbar.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
         <script src="https://docraptor.com/docraptor-1.0.0.js"></script>
		<link type="text/css" href="css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />	
		<link type="text/css" rel="stylesheet" href="css/progressbar.css" />
		<script src="js/treeTable.js"></script>
		 <script src="js/jstree.min.js"></script>
 
<script type="text/javascript" src="js_in_pages/archive_exec.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/archive_exec.css" type="text/css" />

    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
     <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
      	
	
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
		  


<body class='default'>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%@ page import="onboard.DBconnection" %>
		<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<form class="form-signin" name="loginForm" method="post" action="archive_exec">
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
String info=(String)details.getAttribute("archive_exec");
	String det=(String)session.getAttribute("theName");
	String username=(String)details.getAttribute("u_Name");
	String Project_Name=(String)details.getAttribute("nameofproject");
	DBconnection d=new DBconnection();
	Connection conn = (Connection)d.getConnection();
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

	while(visit_rs.next())
	{
		if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Archive Execution Module") && visit_rs.getString(6).equals(Project_Name) )
		{
			Statement stmtt = conn.createStatement();
	         String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Archive Execution Module' and Projects='"+Project_Name+"'";
	         int count = stmtt.executeUpdate(queryy);
	         flag=0;
		}
	}
	if(flag==1)
	{
		String ins_query = " insert into visits (uname, date, module, count, time, Projects)"
		        + " values (?, ?, ?, ?, ?, ?)";
		      PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
		      preparedStmt.setString (1, username);
		      preparedStmt.setString (2, strDate);
		      preparedStmt.setString(3, "Archive Execution Module");
		      preparedStmt.setString(4, "1");
		      preparedStmt.setString(5, strTime);
		      preparedStmt.setString(6, Project_Name);

		      // execute the preparedstatement
		      preparedStmt.execute();
	}
String query = "select * from projinfo where id = "+det;
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query9 = "select * from projinfo where id = "+det;
Statement st9 = conn.createStatement();
ResultSet rs9 = st9.executeQuery(query9);
String query4 = "select * from dummy";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
if(rs9.next()){
}
String query3 = "select * from archive_exec where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query5 = "select * from archive_exec where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);

String query7 = "select * from projinfo where id = "+det;
Statement st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);

if(rs4.next()){
	%>
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    <% if(rs.next()){ %>
                    <a class="navbar-brand" href="Project_List.jsp" style="color:white"id="sitetitle">Onboarding Tool-<%=rs.getString("projectname") %></a>
                       <input type="text" id="project_name" name="project_name" value="<%=rs.getString("projectname")%>" hidden>                              
                    <%
                    String q2="select * from archive_exec where level=1 and projects='"+rs.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    	session.setAttribute(rss.getString(3),rss.getString(15));
                    	session.setAttribute((rss.getString(3)+"1"),rss.getString(1));
                    }
                    
                    %>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li>
                     <li>
 <p style="color:white; padding-top:15px;">logged in as &nbsp;<span><%=roles%></span></p>
</li> 
                        <li>
                             <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
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
                  
        <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; '>
                    <ul class="nav nav-sidebar" id ="sidemenu" >
                        
                        

            <ul>
                  <li id='home' item-selected='true'> <a href="Project_List.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'>App Emphasize Module
                    <ul>
                       <li item-expanded='true'>Project Details
                    <ul>
                        <li item-selected='true'><a href="AppEmphasize_EditProject.jsp">Project Information</a></li>
                        <li><a href="AppEmphasize_Application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="AppEmphasize_Calculation.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                             
                            </ul>
                        </li>
                        <li><a href="AppEmphasize_PrioritizedApplications.jsp">Application-Prioritized</li>

                    </ul>
                </li>
                <li item-expanded='true'><a href='Applications.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'>Business
                <ul>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                
                </ul></li>
                <li item-expanded='true'>Technical
                <ul>
                <li>Application Data Information</li>
                <li>Infrastructure & Environment Inforamation</li>
                <li>Technical Information</li>
                </ul>
                </li>
                
                 <li item-expanded='true'>Archival Requirements
                 <ul>
                 <li>Screen/Report Requirements</li>
                 <li>Archive Requirements</li>
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
                                
                 <div class="col-md-7">
                 
 <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
String initiate_seqno=(String)session.getAttribute("Ideation and Initiate1");
String plan_seqno=(String)session.getAttribute("Plan1");
String execute_seqno=(String)session.getAttribute("Execute1");
String hypercare_seqno=(String)session.getAttribute("Closure1");
if(initiate == null)
	initiate="0";
if(plan == null)
	plan="0";
if(execute == null)
	execute="0";
if(hypercare == null)
	hypercare="0";
System.out.println(plan);
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
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
           
                     <script>
                     $(function(){
                    	    $.contextMenu({
                    	        selector: '.context-menu-one', 
                    	        items: $.contextMenu.fromMenu($('#html5menu'))
                    	    });
                    	});
                     </script>
               
                 

<table class="table table-bordered" style="align:center" id="table">
<thead>
<tr>
<th style="width:70%;">Tasks </th> 
<th>Resource Assigned</th>
<th>Plan start date</th>
<th>Plan End date</th>
<th>Actual start date</th>
<th>Actual End date</th>
<th>Planned Hours</th>
<th>Actual Hours</th>
<th>Progress %</th>
<th style="width:20%;">Status</th>
<th>Comments</th>
<th></th>
</tr>
</thead>

<tbody >     
<%
 int i=0,count=0,pp=0;
String no="";
while(rs3.next()){
	if(Integer.parseInt(rs3.getString(2))==1)
	{
		pp++;
	%>
<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>">
<td style="width:200px;"><b>
<span style="color:#3071a9;font-size:150%;"><input  type="text"   placeholder="enter" id="task" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly /></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></b></td>
<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
<td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" readonly/></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)" /></td>
<td><input  type="text" class="in"  id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
<td ><div class="progressbar" id="progressbar<%=i%>"></div></td>
	<td ><input type="text" style="background-color:transparent;width:20%;" id="status<%=i %>"  /></td>
<td></td>
<script>
getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value,'<%= rs3.getString(17)%>');
</script>
<%
int progress=0;
%>
</tr>
<%}
	else
	{
	
	%>
		<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>" data-tt-parent-id="<%=rs3.getString(11) %>">
		&nbsp;&nbsp;<td style="width:200px;">
		<span style="color:#00BFFF;font-size:100%;"><input  type="text"   placeholder="enter" id="name<%=i %>" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly/></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></td>
		<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
<td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
		<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',1);"  /></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',2);"  /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',3);"  /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',4);"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13)%>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value,document.getElementById('act_end_date<%=i %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>');"/></td>
<td><input  type="text" class="in" id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value,document.getElementById('act_end_date<%=i %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>');" /></td>
<td ><div class="progressbar" id="progressbar<%=i%>"></div></td>
	<td ><input type="text" style="background-color:transparent;display:none;width:20%;" id="status<%=i %>"  /></td>
<td><input type="text" id="cmnts<%=i %>" name="cmnts<%=i %>" value="<%=rs3.getString(17) %>" /></td>
<% if((rs3.getString(3).equals("Requirements"))||(rs3.getString(3).equals("Build and Test"))){%>
<script>
getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value);
</script>
<%} %>
	
</tr>
<%
	}
i++;
}
%>




</tbody>

</table>
<input type="text" id="pwqej" value="<%= info %>" hidden> 
<script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>    
   <script type="text/javascript">
		com_github_culmat_jsTreeTable.register(this)

		treeTable($('#table'))
	</script>       
<div>
<%if(rs7.next()){ %>
    <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs7.getString("projectname") %>" >
<%} %>
<input type="button" name="addbtn" class="btn btn-primary" onclick="sub(<%=i+1%>,1,'<%=rs4.getString(1) %>','<%=rs4.getString(1) %>');" value="Add" >
<input type="button" name="subbtn" class="btn btn-primary" value="Submit" onclick="update()" >
</div>
</div>

                                              </div>                             
                        </div>                         
                                  
       <%

                    }
}
%>
</form>
</body>
</html>
