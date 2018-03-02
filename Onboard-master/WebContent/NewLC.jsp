 <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
  <%
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
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

System.out.println("lst 10 days : "+last_10+" lst 30 days : "+last_30);
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
    </script>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>