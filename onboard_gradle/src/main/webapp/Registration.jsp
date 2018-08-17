<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>


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
        
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:6px;
}
span.multiselect-native-select {
position: relative
}
span.multiselect-native-select select {
border: 0 !important;
clip: rect(0 0 0 0) !important;
height: 1px !important;
margin: -1px -1px -1px -3px !important;
overflow: hidden !important;
padding: 0 !important;
position: absolute !important;
width: 1px !important;
left: 50%;
top: 30px
}
.multiselect-container {
position: absolute;
list-style-type: none;
margin: 0;
padding: 0
}
.multiselect-container .input-group {
margin: 5px
}
.multiselect-container>li {
padding: 0
}
.multiselect-container>li>a.multiselect-all label {
font-weight: 700
}
.multiselect-container>li.multiselect-group label {
margin: 0;
padding: 3px 20px 3px 20px;
height: 100%;
font-weight: 700
}
.multiselect-container>li.multiselect-group-clickable label {
cursor: pointer
}
.multiselect-container>li>a {
padding: 0
}
.multiselect-container>li>a>label {
margin: 0;
height: 100%;
cursor: pointer;
font-weight: 400;
padding: 3px 0 3px 30px
}
.multiselect-container>li>a>label.radio, .multiselect-container>li>a>label.checkbox {
margin: 0
}
.multiselect-container>li>a>label>input[type=checkbox] {
margin-bottom: 5px
}
.btn-group>.btn-group:nth-child(2)>.multiselect.btn {
border-top-left-radius: 4px;
border-bottom-left-radius: 4px
}
.form-inline .multiselect-container label.checkbox, .form-inline .multiselect-container label.radio {
padding: 3px 20px 3px 40px
}
.form-inline .multiselect-container li a label.checkbox input[type=checkbox], .form-inline .multiselect-container li a label.radio input[type=radio] {
margin-left: -20px;
margin-right: 0
}
.well
{
background-color: rgba(0, 0, 0, 0.76);
border: none;
}
.form-control {
    border-radius: 0px;
    background-color: #212a31;
    color: #bebebe; }
    
label { font-weight: 500 !important; }

.btn { border-radius: 0;
    background-color: #4CAF50; }
    
label .imp { color:#f83223; } 
  
</style>
</head>

<body class="top-navbar-fixed" background="images/bg.jpg">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Registration JSP PAGE-----[INFO]");  %>
<%@page import="java.sql.*"%>
<%
HttpSession ses=request.getSession(); 
String role=(String)ses.getAttribute("My_Roles");
String fname=(String)ses.getAttribute("fname");
String lname=(String)ses.getAttribute("lname");
String email=(String)ses.getAttribute("email");
String project=(String)ses.getAttribute("project");
String app=(String)ses.getAttribute("application");
System.out.println(fname+"   "+lname);
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
String query="select uname from Admin_UserDetails";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<script>
function www()
{

var ffname=document.getElementById("reg_fname").value;
var llname=document.getElementById("reg_lname").value;
var uuname=document.getElementById("reg_uname").value;
var email=document.getElementById("reg_email").value;
var pass=document.getElementById("reg_pwd").value;
var cpass=document.getElementById("reg_cpwd").value;
var confirm=document.getElementById("reg_cemail").value;
<% while(rs.next()){ %>
if(uuname == "<%=rs.getString(1)%>")
{
window.alert("Project Name is already taken");
window.location.href='Registration.jsp';
}
<%}%>
if(ffname==="" || llname==="" || uuname==="")
window.alert("fill the mandatory fileds");
else
{
if((email.includes("@"))&&(email.includes(".com")))
{
var confirm=document.getElementById("reg_cemail").value;
if(email==confirm)
{
if(pass.length>8)
{
  if(pass==cpass)
  {
  var f=document.loginForm;
    f.method="post";
    f.action='user_registration?email='+reg_email;
    f.submit(); 
  }
  else
  window.alert("password and confirm password are not same");
}
else
window.alert("password must be less than 8 letters");
}
else
window.alert("both emails are not same");
}
else
window.alert("Invalid Email");
}
}
</script>


<form class="form-signin" name="loginForm" method="post">

        <div class="main-wrapper">
            
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                			    <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
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
      
<li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
            
                    <div class="main-page">
                    
 <div class="container">
    <br/><br/>
<div class=" well col-lg-10 col-lg-push-1 well">
<div class="row">

<div class="col-sm-12" style="padding:10px">
<div class="row">
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-user"></span> First Name <span class="imp">*</span></label>
		<input type="text" name="reg_fname" id="reg_fname" placeholder="First Name"  class="form-control" value="<%=fname%>" >
	</div>
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-user"></span> Last Name <span class="imp">*</span></label>
		<input type="text" name="reg_lname" id="reg_lname"  class="form-control" value="<%=lname%>">
	</div>
</div> 

<div class="row">
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-user"></span> Username <span class="imp">*</span></label>
		<input type="text" class="form-control" name="reg_uname" id="reg_uname" onChange="check()">
	</div> 
	<div class="col-sm-6 form-group">
	<div class="form-group">
		<label style="color:white"><span class="glyphicon glyphicon-bookmark"></span> Roles </label>
		<input type="text" class="form-control" name="reg_roles" value="<%=role%>">
	</div> 
</div>
</div>

<div class="row">
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-envelope"></span> Email <span class="imp">*</span></label>
		<input type="text" name="reg_email" id="reg_email" class="form-control" value="<%=email%>">
	</div>
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-tasks"></span> Password <span class="imp">*</span></label>
		<input type="password"  class="form-control" name="reg_pwd" id="reg_pwd">
	</div>
</div>

<div class="row">
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-envelope"></span> Confirm Email <span class="imp">*</span></label>
		<input type="text" class="form-control" name="reg_cemail" id="reg_cemail">
	</div>
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-tasks"></span> Confirm Password <span class="imp">*</span></label>
		<input type="password"  class="form-control" name="reg_cpwd" id="reg_cpwd">
	</div>
</div>

<div class="row"> 
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-list-alt"></span> Application </label>
		<input type="text"  class="form-control" name="reg_app"  value="<%=app%>">
	</div>

	<div class="col-sm-6 form-group">
		<label style="color:white"> Security Question <span class="imp">*</span></label>
		<label style="color:white"><span class="glyphicon glyphicon-check"></span> Question 1 </label>
		<select class="form-control" name="reg_qn">
		<option value=""></option>
		  <option value="What is Your Spouse Name?">What is Your pet Name?</option>
		  <option value="Who is your fav Cricketer?">Who is your fav Cricketer?</option>
		  <option value="In what city or town was your first job?">In what city or town was your first job?</option>
		  <option value="What is the name of your favorite childhood friend">What is the name of your favorite childhood friend</option>
		</select>
	</div> 
</div>

<div class="row"> 
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-object-align-right"></span> Projects </label>
		<input type="text"  class="form-control" name="reg_projects" value="<%=project%>">
	</div> 
	<div class="col-sm-6 form-group">
		<label style="color:white"><span class="glyphicon glyphicon-pencil"></span> Answer </label>
		<input type="text" class="form-control" name="reg_ans" id="reg_ans">
	</div>
</div>
<button type="button" class="btn btn-success pull-right" onclick="www();"><span class="glyphicon glyphicon-send"></span>&nbsp; Submit </button>
</div> 
</div>
</div>
</div>
</form>
  
<!-- Project List End -->

                </div>
                <!-- /.content-container -->
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
