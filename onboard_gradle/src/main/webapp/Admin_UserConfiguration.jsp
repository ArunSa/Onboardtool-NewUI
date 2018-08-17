<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>UserConfiguration Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    
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
    <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
        </style>

	<style>
	
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:6px;
}

   </style>
   
      <script>
	function calls()
	{
		    var x = document.getElementById('myDiv1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } 
		    else {
		        x.style.display = 'none';
		    }
		
	}
	</script>
<script>
	var har=[];
	var his=[];
	function oop(name)
	{
		
		if(har.indexOf(name)>=0)
			{
			var i = har.indexOf(name);
			if(i != -1) {
				har.splice(i, 1);
			}
			}
		else
			har.push(name);
	}
	function ops(name)
	{
		
		if(his.indexOf(name)>=0)
			{
			var i = his.indexOf(name);
			if(i != -1) {
				his.splice(i, 1);
			}
			}
		else
			his.push(name);
	}
	
	
	function servlet_call()
	{
		var f=document.loginForm;
	    f.method="post";
	    f.action='deactivate?values='+har+'&values2='+his;
	    f.submit(); 
	}
	</script>
	<script>
	var arr="";
	function ooo()
	{
		var e=document.getElementById("dates-field2");
	for(i=0;i<9;i++)
		{
		if(e[i].selected==true){
			arr=arr+(e[i].value);
		}
		}
	
		}
	function qq()
	{
		var msg=document.getElementById("message").value;
		var ffname=document.getElementById("fname").value;
		var llname=document.getElementById("lname").value;
		var email=document.getElementById("email_val").value;
		var project=document.getElementById('proj').value;
		var app=document.getElementById('app').value;
		//window.alert(project);
		if(ffname==="" || llname==="" || arr==="")
			window.alert("fill the mandatory fileds");
		else
			{
			 if((email.includes("@"))&&(email.includes(".com")))
				{
				
				 var f=document.loginForm;
				    f.method="post";
				    f.action="sendMail?roless="+arr+"&mailid="+email+"&message="+msg+"&fname="+ffname+"&lname="+llname+"&project="+project+"&application="+app;
				    f.submit();
				}
			 else
				 window.alert("Invalid EmailID");
			}
	}
	</script>
	<script>
function checkk()
{
	
	document.getElementById('fname').readOnly = true;
	document.getElementById('message').readOnly = true;
	document.getElementById('lname').readOnly = true;
	document.getElementById('dates-field2').disabled = true;
	document.getElementById('email_val').readOnly = true;
	document.getElementById('proj').readOnly = true;
	document.getElementById('send_btn').disabled = true;
	}
</script> 
</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Admin_UserConfiguration JSP PAGE-----[INFO]");  %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
	response.sendRedirect("Login.jsp");
}
%>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
<%
HttpSession details=request.getSession();
String prjname=(String)details.getAttribute("nameofproject");
String info=(String)details.getAttribute("admin");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding","root","password123"); 
String query="select * from Admin_UserDetails";
String query1="select * from Admin_UserDetails";
Statement s=conn.createStatement();
Statement s1=conn.createStatement();
ResultSet rs=s.executeQuery(query);
ResultSet rs1=s1.executeQuery(query1);
String query2="select * from AppEmphazize_ProjectDetails";
Statement s2=conn.createStatement();
ResultSet rs2=s2.executeQuery(query2);
int count=0;
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
                         <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=prjname %></a>

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
      
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


<form class="form-signin" name="loginForm" method="post">

            <div class="content-wrapper">
                <div class="content-container">
         
                    <!-- ========== LEFT SIDEBAR for UserConfiguration ========== -->
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
                                        <a><span class="">User Module</span></a>
                                    </li>
                                    <li>
                                        <a href="Admin_UserConfiguration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i> <span>Users List</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_RoleDetails.jsp"><i class="fa fa-map-signs"></i> <span>Authorization </span> </a>
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
                                    <div class="col-md-12">
            
<div id="config" class="tabcontent">
 <div class="container-fluid">
 <br/><div class="col-sm-12" >
	<br/> <div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
							
								<label>First Name<span class="glyphicon glyphicon-asterisk"></span></label>
							<input type="text" id="fname" name="fname"  class="form-control" />
					</div>
					<div class="col-sm-6 form-group">
							
							 <label for="comment">Message</label>
      <textarea class="form-control" rows="5" id="message"></textarea>
					</div>
							</div>
							<div class="row">
							<div class="col-sm-6 form-group">
								<label>Last Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text"  class="form-control" id="lname" >
							</div>
							<div class="col-sm-6 form-group">
								<label>Email<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="email" class="form-control" id="email_val" >
							</div>
						</div>		
						<div class="row">			
							<div class="col-sm-6 form-group">
								 <label>Role Name<span class="glyphicon glyphicon-asterisk"></span></label>
    <div class="col-lg-12">
        <select id="dates-field2" class="multiselect-ui form-control" multiple="multiple" name="myOption">
            <option value="ArchivalAdmin">archival admin</option>
            <option value="LegacyTechnicalSME">legacy technical sme</option>
            <option value="LegacyBusinessSME">legacy business sme</option>
            <option value="ArchivalProgramManager">archival program manager</option>
            <option value="ArchivalProjectManager">archival project manager</option>
            <option value="LegacyProgramManager">legacy program/project manager</option>
            <option value="ArchivalBusinessAnalyst">archival business analyst</option>
            <option value="ArchivalTechnicalLead">archival technical lead</option>
            <option value="ArchivalDeveloper">archival developer</option>
            <option value="TestLead">test lead</option>
        </select>
    </div>
</div>
</div>
<script type="text/javascript">
$(function() {
    $('.multiselect-ui').multiselect({
        includeSelectAllOption: true
    });
});
</script>
						
							<div class="row">					
					<div class="col-sm-6 form-group">
						<label>Projects</label>
						 <select id="proj" class="form-control" name="proj" onChange="calx()" required > 
						 <option></option>
						 
                                         <% while(rs2.next()) { %>
                                                <option><%=rs2.getString("projectname") %></option>
                                                
                                          <%}%>                                                 
                                            </select>
					</div>	
					<script>
						function calx()
						{
							
							var prj=document.getElementById('proj').value;
							var select = document.getElementById("app");
							
							
							var length = select.options.length;
							document.getElementById("app").options.length = 0;
		
							var options = [];
							var option = document.createElement('option');
							var i;
							var prjarray=[];
							var apparray=[];
							<% String query3="select appname,prjname from AppEmphazize_ApplicationInfo";
							Statement s3=conn.createStatement();
							ResultSet rs3=s3.executeQuery(query3);
							
							while(rs3.next()){
							%>	
							
							apparray.push("<%=rs3.getString("appname") %>");
							prjarray.push("<%=rs3.getString("prjname") %>");
		                         <% 
		                       
							}
							%>
							
							var k=0;
							for(i=0;i<=prjarray.length;i++)
								{
								if(prj==prjarray[i])
								{
									
									option.text = option.value = apparray[i];
								    options.push(option.outerHTML);
								  
								}		
			
							}
							select.insertAdjacentHTML('beforeEnd', options.join('\n'));
						}
							
										</script>	
					<div class="col-sm-6 form-group" id="cont">
						<label>Applications</label>
						<select id="app" class="form-control"></select>
						</div>	
					</div>
					<br/>
					 <input type="hidden" id="pwqej" value="<%= info %>" hidden>  
					<button type="button" class="btn btn-primary" id="send_btn" onclick="ooo();qq();">Send Invites</button>	
					<br/>		<hr/>		
					</div>
				
				</div>
	</div>
	</div>
</div>

</form>
            

				    </div>
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
            

 <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>  


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


