<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Onboarding Tool</title>
</head>

<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

   <script src="js/jquery.js"></script>
   <script src ="js/table.js"></script>
  <script src="js/jstree.min.js"></script>
   <script src="js/multiplepages.js"></script>
  

    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
   
    

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
   
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>


 <style>
.newspaper {
    -webkit-column-count: 3; /* Chrome, Safari, Opera */
    -moz-column-count: 3; /* Firefox */
    column-count: 3;
    -webkit-column-gap: 40px; /* Chrome, Safari, Opera */
    -moz-column-gap: 40px; /* Firefox */
    column-gap: 40px;
    -webkit-column-rule: 1px solid lightblue; /* Chrome, Safari, Opera */
    -moz-column-rule: 1px solid lightblue; /* Firefox */
    column-rule: 1px solid lightblue;
}


 

#cmd {

float:right;

} 


#table
  {
 
    width: 90%;
    margin:50px;
    
    background: #fff;
    padding-left:10px;
    border: 2px solid #E6E9ED;
    -webkit-column-break-inside: avoid;
    -moz-column-break-inside: avoid;
    column-break-inside: avoid;
    opacity: 1;
    transition: all .2s ease;
}

#wizard{

padding-left:20px;
}

</style>
<style>




.bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #428bca; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background:#428bca; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 100%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: lightblue; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #428bca;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
/*END Form Wizard*/

</style>
  <body style="background-color:#F7F7F7;margin-left:0px">
  <%@page language="java"%>
<%@page import="java.sql.*"%>
     
<%
try {
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String idd=(String)session.getAttribute("appidd");
String query4 = "select * from appinfo where appname ='"+idd+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query1 = "select * from business";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);

String query2 = "select * from technical";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);

 
%>
 <div class="row"  id="wizard">
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Intake Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                
                </div>
                
                <div class="col-xs-2 bs-wizard-step complete"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Summary</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Review</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Approval</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                 <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
            </div>
  <div class="col-md-11" >
   <a href="business.jsp" style="background:lightgreen;" class="btn btn-default btn pull-left">Edit</a>
<button id="cmd" class="btn btn-primary pull-right" ><span class="glyphicon glyphicon-download-alt"></span> Export PDF</button>
<button id="cmd" class="btn btn-primary pull-right" onclick="location.href='firstinsert.jsp'" >HOME</button>
</div>
<div class="container">
<div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table-scroll">
    <table>
             <tbody>
                 <tr>
                           <td>
                                 <table width='780' border='0' align='center' '>
                                        <tbody>
                                              
                                               <tr>
                                                     <td valign='top' style='color:#404041;line-height:16px;padding:25px 20px 0px 20px'>
                                                            <p>
                                                                   <section style='position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;'>
                                                                         <h3 align='center' style='margin-top: -12px;background-color: #FFF;clear: both;width: 180px;margin-right: auto;margin-left: auto;padding-left: 15px;padding-right: 15px; font-family: arial,sans-serif;'>
                                                                                <span>Summary & Review</span>
                                                                         </h3>
                                                                   </section>
                                                            </p>               
                                                     </td>
                                               </tr>
                                             
                                               <tr align='left' >
                                                     <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                     
                                                     <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Bussiness Details</h2></span>
                <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table1">                                           
    <table width='0' border='0' align='left' cellpadding='0' cellspacing='0'>
                                                           
                                                                   <tbody>
                                                                   <tr>
                                                                     <%
          
while(rs1.next()){

%>

<h3>Application Information :</h3>
        <tr>
        
         <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Legacy Application Name       : <strong align="right"><%=rs1.getString("legappname") %></strong></pre> </tr> 
          <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Reference To Application         :  <strong><%=rs1.getString("reftoapp") %></strong></pre></tr>
          <tr class="row_t">    <pre style="font-family:verdana;font-size:100%;">Tracking  ID         : <strong><%=rs1.getString("tid") %></strong></pre></tr> 
          <tr class="row_d">    <pre style="font-family:verdana;font-size:100%;">Description          : <strong><%=rs1.getString("descr") %></strong></pre></tr> 
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Legacy Application Vendor/Manufacture : <strong><%=rs1.getString("vendor") %></strong></pre></tr>
            <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Contract Expiration Date : <strong><%=rs1.getString("expdate") %></strong></pre></tr>
             <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Notice Period for Expiration of Contract  : <strong><%=rs1.getString("noticeperiod") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Contract Value of Application  : <strong><%=rs1.getString("contractvalue") %></strong></pre></tr>
         <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">ROD : <strong><%=rs1.getString("rod") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Commment : <strong><%=rs1.getString("cmnt") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">If the applications transitions has dependencies?  : <strong><%=rs1.getString("hasdep") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">What is the date Range of this Data? : <strong><%=rs1.getString("daterange") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Size of Database : <strong><%=rs1.getString("dbsize") %></strong></pre></tr>
          
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Location of Data : <strong><%=rs1.getString("dataloc") %></strong></pre></tr>
          <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Site Location of Data  : <strong><%=rs1.getString("siteloc") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Does the application needs archival?  : <strong><%=rs1.getString("needarch") %></strong></pre></tr>
           <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Reason : <strong><%=rs1.getString("archreason") %></strong></pre></tr>
         <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Comments : <strong><%=rs1.getString("archcmnt") %></strong></pre></tr>
           <br />
       
         
        </tr>
        <h3>Legal Retention Information :</h3>
        <tr>
        
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Record Code Of Application: <strong align="right"><%=rs1.getString("reccode") %></strong></pre> </tr> 
<tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Trigger Date:  <strong><%=rs1.getString("triggerdate") %></strong></pre></tr>
<tr class="row_t">    <pre style="font-family:verdana;font-size:100%;">Period of Retention : <strong><%=rs1.getString("retentionperiod") %></strong></pre></tr> 
<tr class="row_d">    <pre style="font-family:verdana;font-size:100%;">Table Name/s where Retention need to apply : <strong><%=rs1.getString("retentiontable") %></strong></pre></tr> 
<tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Name of the Legal Retention & e-Discovery SME : <strong><%=rs1.getString("retentionname") %></strong></pre></tr>
<tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Does any Records have legal holds/Tax Holds or any indication? : <strong><%=rs1.getString("legalholds") %></strong></pre></tr> 
  <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Who or what entity provided legal or tax hold identification : <strong><%=rs1.getString("wholegal") %></strong></pre></tr>  
  <tr class="row_d">   <pre style="font-family:verdana;font-size:100%;">Brief Explanation : <strong><%=rs1.getString("archexp") %></strong></pre></tr>
 </tr>
        <h3>Archive Data Management :</h3>
        <tr>
        
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Is this application's been used for BI report?: <strong align="right"><%=rs1.getString("useforBI") %></strong></pre> </tr> 

 
         
        </tr> 
        
        </table>
       </div>
        <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table2">  
     <table>
     
     
      <h3>SystemRequirements :</h3>
        <tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Account Credit Card: <strong align="right"><%=rs1.getString("creditacc") %></strong></pre> </tr> 
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Account Number-Financial: <strong align="right"><%=rs1.getString("financialacc") %></strong></pre> </tr>     
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Date of Birth: <strong align="right"><%=rs1.getString("dob") %></strong></pre> </tr> 
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Driver's License Number: <strong align="right"><%=rs1.getString("driverlic") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Email Address: <strong align="right"><%=rs1.getString("email") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Family Status: <strong align="right"><%=rs1.getString("family") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Gender: <strong align="right"><%=rs1.getString("gender") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Geo Location: <strong align="right"><%=rs1.getString("geoloc") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Image/Video: <strong align="right"><%=rs1.getString("img") %></strong></pre> </tr>
<tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Income: <strong align="right"><%=rs1.getString("income") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">IP Address: <strong align="right"><%=rs1.getString("ipadrs") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Martial Status: <strong align="right"><%=rs1.getString("martialstatus") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Mpobile Device ID: <strong align="right"><%=rs1.getString("mobid") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Name: <strong align="right"><%=rs1.getString("name") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Phone Number: <strong align="right"><%=rs1.getString("phno") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Physical/Mailing Address : <strong align="right"><%=rs1.getString("mailadrs") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Physical Description: <strong align="right"><%=rs1.getString("physic") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Race/Ethnicity: <strong align="right"><%=rs1.getString("race") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Religion: <strong align="right"><%=rs1.getString("religion") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Sexual Preference : <strong align="right"><%=rs1.getString("sexualpref") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">SSN: <strong align="right"><%=rs1.getString("ssn") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Others: <strong align="right"><%=rs1.getString("others") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Brief Explaination: <strong align="right"><%=rs1.getString("expl") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Does the application have localization requirement/ regulations: <strong align="right"><%=rs1.getString("localreq") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">List of Countries where localization requirement/ regulations apply: <strong align="right"><%=rs1.getString("localcountry") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Are the Localization requirements/regulations enforced with infrastructure or geofencing : <strong align="right"><%=rs1.getString("localinf") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Infrastructure Localization enforcement, please list the locations of the datacenters : <strong align="right"><%=rs1.getString("datacenters") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">External access required for archived data : <strong align="right"><%=rs1.getString("extaccess") %></strong></pre> </tr>        
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Describe who or what external entity needs access : <strong align="right"><%=rs1.getString("who") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">User Name : <strong align="right"><%=rs1.getString("uname") %></strong></pre> </tr> 
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Role Description : <strong align="right"><%=rs1.getString("roledesc") %></strong></pre> </tr>
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Reason for Access : <strong align="right"><%=rs1.getString("accreason") %></strong></pre> </tr>    
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Frequency of Access : <strong align="right"><%=rs1.getString("accfreq") %></strong></pre> </tr> 
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Additional System Requirements : <strong align="right"><%=rs1.getString("sysreq") %></strong></pre> </tr>     
        </tr>
        
        
     
     
     </table>
    </div>
        
        
       <% }%>
       
       <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table3">  
     <table>
       <%
          
while(rs2.next()){

%>        
     
      <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Technical Details</h2></span>
                                                                   
              

<h3>Application Data Information :</h3>
        <tr>
        
 <tr class="edit_row">  <pre style="font-family:verdana;font-size:100%;">Datatype Characteristics  : <strong align="right"><%=rs2.getString("datatype") %></strong></pre> </tr> 
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">If the Data Type is Unstructured or Hybrid, process for extracting unstructured data? : <strong><%=rs2.getString("pname") %></strong></pre></tr>
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Does Unstructured or Hybrid business objects needs to be archived? : <strong><%=rs2.getString("archneed") %></strong></pre></tr>
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Please specify the formats : <strong><%=rs2.getString("formatsp") %></strong></pre></tr>   
 <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Any Special/ Multi Language characters or Foreign Language contained in the application?: <strong><%=rs2.getString("mlang") %></strong></pre></tr>
  <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">User Documentation :<strong><%=rs2.getString("userdoc") %></strong></pre></tr>  
  
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Technical Documentation :<strong><%=rs2.getString("techdoc") %></strong></pre></tr>  
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Training Documentation : <strong><%=rs2.getString("traindoc") %></strong></pre></tr> 
   <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Support Documentation :<strong><%=rs2.getString("supportdoc") %></strong></pre></tr> 
    <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Data Dictionary :<strong><%=rs2.getString("datadic") %></strong></pre></tr> 
    <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Test Case Documentation :<strong><%=rs2.getString("testcasedoc") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Testing Records :<strong><%=rs2.getString("testrec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Design Specification :<strong><%=rs2.getString("designspec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Validityplan :<strong><%=rs2.getString("validityplan") %></strong></pre></tr>
   
   <h3>Infrastructure & Environment Information :</h3>
   
   
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Location of Data :<strong><%=rs2.getString("dataloc") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Server Name :<strong><%=rs2.getString("servername") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Production Instances :<strong><%=rs2.getString("prodinstance") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Location of Production Instances :<strong><%=rs2.getString("prodinstanceloc") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Contact Name or Entity for Infrastructure Engagement :<strong><%=rs2.getString("infraengage") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">If external facing, web apps/website URLs :<strong><%=rs2.getString("url") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Database size of the application :<strong><%=rs2.getString("dbsize") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Estimated No of Table in the application :<strong><%=rs2.getString("nooftable") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Estimated No of Records(volume) in the application :<strong><%=rs2.getString("noofrec") %></strong></pre></tr>
     <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">XML counts for the database :<strong><%=rs2.getString("xmlcount") %></strong></pre></tr>
      <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Does this application utilize any VPN environments (E.g. Citrix) for access :<strong><%=rs2.getString("anyvpn") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Specify the application to integrate :<strong><%=rs2.getString("appintegrate") %></strong></pre></tr>
       <tr class="row_s"> <pre style="font-family:verdana;font-size:100%;">Ready Date for Complete Server decommission and Application Retirement :<strong><%=rs2.getString("decomdate") %></strong></pre></tr>
                     <br />
       
         
        </tr>

       <% }%>
    
     
     
     
     
     </table>
     </div>
     <div   bgcolor='#e4e4e4'  style='font-family:Arial,Helvetica,sans-serif;' id="table4">  
     <table>
      <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Archival Requirements</h2></span>
       
       <h3>Screen/Report Requirements :</h3>
       
       
       
     </table>
     </div>
       
       
       
       
        </tr>
       
         
         
         
         
        </tbody>
        </table>
        </td>
                                                    
                                               </tr>
                                       
                                               <tr>
                                                                                                                                                    
                                                                                                                                                 
                                                 <tr>
                                                                                                       
                                              
                                        </tbody>
                                 </table>
                           </td>
                    </tr>
             </tbody>
       </table>
      <!-- -----------------------------         Technical Details -->
      
      </br>  <br>
        
      
</div>
</div>
   
        <%

                                                                 
}
catch(Exception e){}
%>
 
</body>


 
 <script>
 var doc = new jsPDF();
 
 var options = {
    background: 'blue',
    pagesplit: true
};
 var specialElementHandlers = {
     '#editor': function (element, renderer) {
         return true;
     }
 };
 
 $('#cmd').click(function () {  
 
     doc.fromHTML($('#table1').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
    
     doc.addPage();
     
     doc.fromHTML($('#table2').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
    
     doc.addPage();
     doc.fromHTML($('#table3').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
     doc.addPage();
     doc.fromHTML($('#table4').html(), 15, 15, {
         'width': 170,
         'pagesplit': true,
             'elementHandlers': specialElementHandlers
     });
     var d = new Date().toISOString().slice(0, 19);
     filename = 'Intake' +"_"+ d + '.pdf';
     doc.save(filename);

 });
</script>  



</html>