<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
 
    
</head>
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>


  <div class="col-sm-6 text-center">
       <label class="label label-success">Line Chart</label>
      <div id="line-chart"></div>
    </div>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query10 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 10 DAY) AND NOW()";
Statement st10 = conn.createStatement();
ResultSet rs10 = st10.executeQuery(query10);
String query11 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()";
Statement st11 = conn.createStatement();
ResultSet rs11 = st11.executeQuery(query11);
int last_10=0,last_30=0;
System.out.println("before last 10");
while(rs10.next())
	last_10+=Integer.parseInt(rs10.getString(4));
System.out.println("after last 10");
while(rs11.next())
	last_30+=Integer.parseInt(rs11.getString(4));

System.out.println("lst 10 days : "+last_10+" lst 30 days : "+last_30);
%>
<script>
var data = [
    { y: 10, a: <%= last_10 %>},
    { y: '20', a: 3 },
    { y: '30', a: <%= last_30 %> }
  ],
  config = {
    data: data,
    xkey: 'y',
    ykeys: ['y', 'a'],
    labels: ['Days', 'Visits'],
    fillOpacity: 0.4,
    hideHover: 'auto',
    behaveLikeLine: true,
    resize: true,
    pointFillColors:['#ffffff'],
    pointStrokeColors: ['black'],
    lineColors:['gray','red']
};

config.element = 'line-chart';
Morris.Line(config);
config.element = 'stacked';
config.stacked = true;

</script>

































</body>
</html>