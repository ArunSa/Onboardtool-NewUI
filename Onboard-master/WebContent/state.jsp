<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#state{color:black}
</style>
</head>
<body>
 <%@page import="java.sql.*"%>
<%
String country=request.getParameter("count");  

 String buffer="<select name='state'> <option disabled selected>Please Select any Option</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from logs where roles='"+country+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
</body>

</html>