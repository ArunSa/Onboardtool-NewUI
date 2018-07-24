<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<% HttpSession details=request.getSession(); %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">




function line_chart()
{
	 var e = document.getElementById("myList").value;
	 var uid;
	 alert(e);
	 if(e=="none")
		 {
		 uid="<%= details.getAttribute("username") %>";
		 }
	 else
		 {
		 uid=e;
		 }
	 alert(uid);
var samp=document.getElementById("tid").value;

var date =[];
var month =[];
var year =[];
var no_of_visits =[];
var monthname =[];
var uname =[];
var distinct_monthname =[];
var final_count =[];
var final_month=[];
var final_visits=[];
var result_months=[];
var result_visits=[];
result_months.push("January");
result_months.push("February");
result_months.push("March");
result_months.push("April");
result_months.push("May");
result_months.push("June");
result_months.push("July");
result_months.push("August");
result_months.push("September");
result_months.push("October");
result_months.push("November");
result_months.push("December");

result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");

var flag=0;
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<%
String[] values_name = new String[5];
ArrayList<String> date = new ArrayList<String>();
ArrayList<String> month = new ArrayList<String>();
ArrayList<String> year = new ArrayList<String>();
ArrayList<String> no_of_visits = new ArrayList<String>();
ArrayList<String> monthname = new ArrayList<String>();
ArrayList<String> distinct_monthname = new ArrayList<String>();
ArrayList<String> final_count = new ArrayList<String>();
//ArrayList<String> uname = new ArrayList<String>();
//ArrayList<String> final_month = new ArrayList<String>();

    DBconnection d=new DBconnection();
    Connection con = (Connection)d.getConnection();
    Statement st_distinct= con.createStatement(); 


    ResultSet rs_distinct=st_distinct.executeQuery("select distinct(monthname(date)) from  visits ");
    while (rs_distinct.next())
    {
    %>
    distinct_monthname.push("\"<%=rs_distinct.getString(1)%>\"");
    <%}
    
Statement st_line_chart_month= con.createStatement(); 


ResultSet rs_line_chart_month=st_line_chart_month.executeQuery("select monthname(date),SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count,uname from  visits ");
while (rs_line_chart_month.next())
{
	%>
monthname.push("\"<%=rs_line_chart_month.getString(1)%>\"");
year.push(<%=rs_line_chart_month.getString(2)%>);
month.push(<%=rs_line_chart_month.getString(3)%>);
date.push(<%=rs_line_chart_month.getString(4)%>);
no_of_visits.push(<%=rs_line_chart_month.getString(5)%>);
uname.push("\"<%=rs_line_chart_month.getString(6)%>\"");
<%}%>   
var count=0;
var flag=0,flag1=0;
for(var i=0;i<year.length;i++)
	{
	//alert(uname[i]);
	if(samp==year[i] )
	{
		flag=1;
		
	if(uid==uname[i].substring(1, uname[i].length-1))
			{
			flag1=1;
			alert("HI");
			final_month.push(monthname[i]);
			final_visits.push(no_of_visits[i]);
			}
		//final_month.push(monthname[i]);
		//final_visits.push(no_of_visits[i]);
		
	
	}
	else
		{
		
		continue;
		}
	
}
for(var m=0;m<distinct_monthname.length;m++)
{
	//alert(distinct_monthname[m])
	for(var j=0;j<final_month.length;j++)
	{
		if(distinct_monthname[m]==final_month[j])
			{
			
			count=count+final_visits[j];
			
			}
		else
			{
			continue;
			}
		
	}
	
	final_count.push(count);
	count=0;
}

for(var x=0;x<result_months.length;x++)
	{
	

	
	for(var y=0;y<distinct_monthname.length;y++)
		{
		
		if(distinct_monthname[y].substr(1,distinct_monthname[y].length -2)==result_months[x])
			{
			
			result_visits[x]=final_count[y];
			
			}
		
		else
			{
			continue;
			}
		}
	
	}
	


google.charts.load('current', {'packages':['corechart','line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var name;
	
    
  var data = new google.visualization.DataTable();
  data.addColumn('string','name');
  data.addColumn('number','value');

	for(var i=0;i<result_months.length;i++)
	  {
	  
	  data.addRow([result_months[i],Number(result_visits[i])]);
	  }
	
	
  var options = {
        title: '',
        curveType: 'function',
        pointSize: 5,
        
        colors: ['#fb8532'],
       
        vAxis: {
          title: 'No of visits',
          minValue: 0,
          ticks: [{v:0, f:'0'},{v:10, f:'10'},{v:20, f:'20'},{v:30, f:'30'}],
        },
        
        hAxis: {
            title: 'No of visits',
            minValue: 0,
            //ticks: [{h:0, f:'Jan'},{h:10, f:'Feb'},{h:20, f:'March'},{h:30, f:'April'}],
          },
        backgroundColor: '#f6f8fa'
      };

  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
  

  

  chart.draw(data, options);
 
}
	
	
	
}



function line_chart_view()
{
google.charts.load('current', {'packages':['corechart','line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var name;

  var data = google.visualization.arrayToDataTable([
   
    ['Monthly', 'Visits'],
      
   
     <% 
     String name=request.getParameter("tid");
    // System.out.println("Year"+name);
     for(int a=0;a<year.size();a++)
     {
     %>
    

     [ '\'<%=monthname.get(a) %>\'', <%=no_of_visits.get(a)%>],
     
    
     <% }
    %>
  

  ]);

  var options = {
        title: '',
        curveType: 'function',
        pointSize: 5,
        
        colors: ['#fb8532'],
       
        vAxis: {
          title: 'No of visits',
          minValue: 0,
        },
        backgroundColor: '#f6f8fa'
      };

  var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));
  

  

  chart.draw(data, options);
 
} 

}
</script>
<select id = "myList">
<option value="none">select</option>
 <%
 ResultSet rs_name=st_distinct.executeQuery("select uname from Admin_UserDetails ");
 while (rs_name.next())
 {
 
 %>
 
               <option value="<%=rs_name.getString(1) %>"> <%=rs_name.getString(1) %></option>
              
           
             <%} %>
               </select>
 <div id="curve_chart" style="width:1450px; height:400px"></div>
<input type="text" id="tid" name="tid"/>
<input type="button" onclick="line_chart()" value="submit">
</body>
</html>
