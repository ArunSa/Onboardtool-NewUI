<!DOCTYPE html>
<html lang="en-US">
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query8 = "select * from user_details where roles='ArchivalAdmin' and uname='bala'";
Statement st8 = conn.createStatement();
ResultSet rs8 = st8.executeQuery(query8);
%>
<h1>My Web Page</h1>

<div id="piechart"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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

</body>
</html>
