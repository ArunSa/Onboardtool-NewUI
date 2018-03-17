

<!DOCTYPE html>  
<html>  
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>

  

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.js"></script> 
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />   
 
 
		<script type="text/javascript" src="js/jquery-ui-1.8.13.custom.min.js"></script>
		<script src="http://code.jquery.com/jquery-2.0.3.js"></script>
		<script type="text/javascript" src="js/jqueryprogressbar.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
         <script src="https://docraptor.com/docraptor-1.0.0.js"></script>
		<link type="text/css" href="css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />	
		<link type="text/css" rel="stylesheet" href="css/progressbar.css" />
		<script src="js/treeTable.js"></script>

		 <script src="js/jstree.min.js"></script>
  

   
       

    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
     <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
      	
	
     
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
 
<script>

$(function() {
	 for(var i=0;i<200;i++)
		{
	    $( "#pln_srt_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#pln_end_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#act_srt_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#act_end_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
		}
	});


</script>		  
 
    <script>
	  function getID(lev,pln_srt,pln_end,act_srt,status,pln_hrs,act_hrs,progressbar,actual_enddate)
	  {
		 // window.alert(pln_srt+" "+pln_end+" "+act_srt+" "+status.id+" "+pln_hrs.id+" "+act_hrs.id+" "+progressbar.id);
		  var startDate =pln_srt;
		  var endDate =pln_end;
		  var actual_startdate =act_srt;
		  var percentage;

		  if (startDate!="" && endDate!="" && actual_startdate!= "") {
		  var minDate = new Date(convertStringToDate(startDate));
		  var today = new Date();
		  var maxDate = new Date(convertStringToDate(endDate));
		  var actual_minDate = new Date(convertStringToDate(actual_startdate));
		  var nbPastDays = Math.floor((today.getTime() - actual_minDate.getTime()) / 86400000);

		  var actual_Hours= (nbPastDays*24)/3;

		  var total_days = (minDate-maxDate)-86400000;

		  var total_hours =(Math.round(Math.abs(total_days/(60*60*1000))))/3;

		  var percent = (actual_Hours/total_hours) * 100;

		  //alert("minDate "+minDate);
		  //alert("maxDate "+maxDate);
		  percentage=100;
		  console.log("actual_Hours : "+actual_Hours);
		  console.log("total_hours : "+total_hours);
		  if(lev!=1){
		  document.getElementById(pln_hrs.id).value=total_hours;
		  document.getElementById(act_hrs.id).value=actual_Hours;
		  }
		  if (percent < 0 ) {
		  percent=0;
		  $('#'+progressbar.id).reportprogress(percent);
		  } 
		  else if(percent>100)
		  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }  
		  else if (actual_enddate!="") {
		  
		  percent=100 ;
		  $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  else if (percent < 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'red'});
		  }
		  else if (percent > 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'yellow'});
		  }
		               else if (percent < 75) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'orange'});
		  }
		               else if (percent >76 ) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  }
		  else
			  {
		
			  }
		  }
	  </script>
	  <script>
	  var mindates=[];
	  var maxdates=[];
	  var actdates=[];
	  function exxexx(x){
		  var dat=document.getElementById(x).value;
		  actdates.push(new Date(dat));
		  var actDate=new Date(Math.max.apply(null,actdates));
		  document.getElementById("act_srt_date0").value=(actDate.getMonth()+1)+'/'+actDate.getDate()+'/'+actDate.getFullYear();  
	  }
	  function exex(x){
		  var dat=document.getElementById(x).value;
		  mindates.push(new Date(dat));
		  var minDate=new Date(Math.min.apply(null,mindates));
		  document.getElementById("pln_srt_date0").value=(minDate.getMonth()+1)+'/'+minDate.getDate()+'/'+minDate.getFullYear();  
	  }
	  function exexx(x){
		  var dat=document.getElementById(x).value;
		  maxdates.push(new Date(dat));
		  var minDate=new Date(Math.max.apply(null,maxdates));
		  document.getElementById("pln_end_date0").value=(minDate.getMonth()+1)+'/'+minDate.getDate()+'/'+minDate.getFullYear();  
	  }
	  </script>
    
 
  
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '550px', width: '300px' });
            $('#jqxTree').css('visibility', 'visible');
            var contextMenu = $("#jqxMenu").jqxMenu({ width: '120px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
            var clickedItem = null;
            
            var attachContextMenu = function () {
                // open the context menu when the user presses the mouse right button.
                $("#jqxTree li").on('mousedown', function (event) {
                    var target = $(event.target).parents('li:first')[0];
                    var rightClick = isRightClick(event);
                    if (rightClick && target != null) {
                        $("#jqxTree").jqxTree('selectItem', target);
                        var scrollTop = $(window).scrollTop();
                        var scrollLeft = $(window).scrollLeft();
                        contextMenu.jqxMenu('open', parseInt(event.clientX) + 5 + scrollLeft, parseInt(event.clientY) + 5 + scrollTop);
                        return false;
                    }
                });
            }
            attachContextMenu();
            $("#jqxMenu").on('itemclick', function (event) {
                var item = $.trim($(event.args).text());
                switch (item) {
                    case "Add Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('addTo', { label: 'Item' }, selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                    case "Remove Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('removeItem', selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                }
            });
            // disable the default browser's context menu.
            $(document).on('contextmenu', function (e) {
                if ($(e.target).parents('.jqx-tree').length > 0) {
                    return false;
                }
                return true;
            });
            function isRightClick(event) {
                var rightclick;
                if (!event) var event = window.event;
                if (event.which) rightclick = (event.which == 3);
                else if (event.button) rightclick = (event.button == 2);
                return rightclick;
            }
        });
    </script>
 
  </style>

<style>

#pdf-button{


float:right;
}
@page {
size: A4 landscape;
/*prince-bleed: 10mm;*/
/*prince-trim: 10mm;*/
/*prince-mark-offset: 1cm;*/
marks: crop cross;
margin: -3mm;
padding:2mm;
prince-bleed: 0.25in;
    prince-trim: 0.25in;
      background-position: center;
    background-size: 104%;
    background: url("images/logo.jpg");
}

.page {
height: 216mm; /*210mm + 3 + 3 */
width: 303mm; /* 297mm + 3 + 3 */
page-break-after: always;
}
     

body { font-size: 100%;

 }



input
{
border:none;
border-color:transparent;
width:200px;
}
.in
{
border:none;
border-color:transparent;
width:75px;
}
.task
{
width:250px;
}
.intask
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:200px;
}  
.intask1
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:150px;
} 
.intask2
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:50px;
} 
.task1
{
border:1px;
padding:10px;
margin-left:10%;
margin-bottom:0px;
background-color:lightblue;
border-left:5px solid black;
width:100px;
} 
.btn
{
  margin-top:20px;
  border-radius:10px;
  background-color:#00BFFF;
  padding:10px;
  border:none;
  width:100px;
  color:white;
  margin-right:10px;
}
.another
{
  border:1px solid black;
  padding:10px;
  border-left:5px solid black;
  width:250px;
}
input:hover
{
  cursor:pointer;
}
thead
{
  text-align:center;
}
th
{
  width:100px;
}
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 0px;
    font-size: 36px;
    margin-right: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

<script>

$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox").attr("disabled", "disabled");
        }
    });
});
$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox1").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox1").attr("disabled", "disabled");
        }
    });
});


</script>
 <style>
 
.progressTSK {
  overflow: hidden;
 
  padding: 0 15px;
  width: 220px;
  height: 34px;
  background: #d3d5d9;
  border-radius: 17px;
  background-image: -webkit-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -moz-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -o-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: linear-gradient(to bottom, #ebecef, #bfc3c7);
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
}

.progressTSK-val {
  float: right;
  margin-left: 15px;
  font: bold 15px/34px Helvetica, Arial, sans-serif;
  color: #333;
  text-shadow: 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-bar {
  display: block;
  overflow: hidden;
  height: 8px;
  margin: 13px 0;
  background: #b8b8b8;
  border-radius: 4px;
  background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.2), transparent 60%);
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-in {
  display: block;
  min-width: 3px;
  height: 20px;
  background: #1997e6;
  background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -webkit-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -moz-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -o-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -o-linear-gradient(left, #147cd6, #24c1fc);
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), linear-gradient(to right, #147cd6, #24c1fc);
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
}
 
 #table{
 
 padding:0px;
 
 }
 
  </style>
 
  <script>
  function sub(x,y,z,w)
  {
	  var f=document.loginForm;
	    f.method="post";
	    f.action='archive_exec?s='+x+'&l='+y+'&r='+z+'&m='+w;
	    f.submit();
  	}
  </script>
  <script>
  function update()
  {
	  
	  var f=document.loginForm;
	    f.method="post";
	    f.action='update_view';
	    f.submit(); 
	 // document.loginForm.action = "update_view";
  	 // document.loginForm.submit();   
  // document.Form1.target = "_blank";    // Open in a new window
  //document.loginForm.submit(); 
	  
  }
  
  </script>
  <script>
  function call_fun(name,a,b,c,d,e,g)
  {
	 var f=document.loginForm;
	    f.method="post";
	    f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e;
	    f.submit();  
  }
  </script>
  
<script>
function remove(x)
{
	var f=document.loginForm;
    f.method="post";
    f.action='remove?s='+x;
    f.submit();
}
</script>
<body class='default'>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		
<form class="form-signin" name="loginForm" method="post" action="archive_exec">
	
<%

String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 

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
System.out.println(rs9.getString("projectname"));
String query5 = "select * from archive_exec where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);

String query7 = "select * from projinfo where id = "+det;
Statement st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);

if(rs4.next()){
	%>
     

               
               
               
               
               
               
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
                                
               
         
                 
                     <br/><br/><br/> 
                     <script>
                     $(function(){
                    	    $.contextMenu({
                    	        selector: '.context-menu-one', 
                    	        items: $.contextMenu.fromMenu($('#html5menu'))
                    	    });
                    	});
                     </script>
                  <script>
               function toenable()
               {
            	   
            	   document.getElementsByName("addbtn")['0'].disabled=false;
               	   document.getElementsByName("subbtn")['0'].disabled=false;
            	   for(var i=0;i<60;i++){
            	  document.getElementsByName("name"+i)['0'].disabled=false;
            	  document.getElementsByName("mem_ass"+i)['0'].disabled=false;
        		  document.getElementsByName("act_srt_date"+i)['0'].disabled=false;
        		  document.getElementsByName("act_end_date"+i)['0'].disabled=false;
        		  document.getElementsByName("pln_srt_date"+i)['0'].disabled=false;
        		  document.getElementsByName("pln_end_date"+i)['0'].disabled=false;
        		  document.getElementsByName("hrs"+i)['0'].disabled=false;
            	   }
            	  
            	   
            	  
               }
                  </script>
              
              
                      
<h3>Archive Execution</h3><a href="Archive_Execution.jsp" class="btn btn-primary" class="btn pull-right">Edit</a><button id="pdf-button" type="button"  class="btn btn-primary" value="Download PDF" onclick="downloadPDF()" />Export PDF</button>
</br></br>     
<div class="container" id="table">
<table class="table table-bordered" style="float:left" >
<thead style="background:#34495E ; color:white;">
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
<th style="width:20px;">Status</th>
<th>Comments</th>

</tr>
</thead>
<tbody >      
<%
 int i=0,count=0;
while(rs3.next()){
	if(Integer.parseInt(rs3.getString(2))==1)
	{
	%>
<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>">
<td style="width:200px;"><b>
<span style="color:#3071a9;font-size:150%;"><input  type="text"   placeholder="enter" id="task" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly /></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></b></td>
<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" onChange="pass('<%=rs3.getString(3)%>',this.value,'<%=i %>')"  readonly/></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)" /></td>
<td><input  type="text" class="in"  id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
<td ><div class="progressbar" id="progressbar<%=i%>"></div></td>
	<td ><input type="text" style="width:20px"; id="status<%=i %>"  /></td>
<td></td>
<td style="display:none"><input type="text" name="seqnum<%=i %>" value="<%=rs3.getString(1) %>" hidden /></td>
<script>
getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);
</script>

</tr>
<%}
	else
	{%>

		<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>" data-tt-parent-id="<%=rs3.getString(11) %>">
		&nbsp;&nbsp;<td style="width:200px;">
		<span style="color:#00BFFF;font-size:100%;"><input  type="text"   placeholder="enter" id="name<%=i %>" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly/></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></td>
		<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>"  /></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>"  /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>"  /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13)%>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value);""/></td>
<td><input  type="text" class="in" id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value);" /></td>
<td ><div class="progressbar" id="progressbar<%=i%>" style="display:none;"></div></td>
	<td ><input type="text" style="background-color:transparent;display:none;width:20%;" id="status<%=i %>"  /></td>
<td></td>
<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getString(1) %>" hidden /></td>

</tr>
<%
	}
i++;
}
%>




</tbody>

</table>
</div>
   <script type="text/javascript">
		com_github_culmat_jsTreeTable.register(this)

		treeTable($('#table'))
	</script>       
<div>
<%if(rs7.next()){ %>
    <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs7.getString("projectname") %>" >
<%} %>

</div>
</div>

                                              </div>                             
                        </div>    
                        
                                  
       <%


}
%>
</form>

</body>
 <script>
    var downloadPDF = function() {
   
      DocRaptor.createAndDownloadDoc("YOUR_API_KEY_HERE", {
        test: true, // test documents are free, but watermarked
        type: "pdf",
        document_content: document.querySelector('html').innerHTML,
       
        
        // use this page's HTML
        // document_content: "<h1>Hello world!</h1>",               // or supply HTML directly
        // document_url: "http://example.com/your-page",            // or use a URL
        // javascript: true,                                        // enable JavaScript processing
        // prince_options: {
        //   media: "screen",                                       // use screen styles instead of print styles
        // }
        
        
        
        
        
      })
    };
    
   
  </script>

<script>
window.DocRaptor = {
  // Creates an HTML form with doc_attrs set, submits it. If successful
  // this will force the browser to download a file. On failure it shows
  // the DocRaptor error directly.
  createAndDownloadDoc: function(api_key, doc_attrs) {
    var makeFormElement = function(name, value) {
      var element = document.createElement("textarea")
      element.name = name
      element.value = value
      return element
    }

    var form = document.createElement("form")
    form.action = "https://docraptor.com/docs"
    form.method = "post"
    form.style.display = "none"

    form.appendChild(makeFormElement("user_credentials", api_key))

    for (var key in doc_attrs) {
      if (key == "prince_options") {
        for (var option in doc_attrs.prince_options) {
          form.appendChild(makeFormElement("doc[prince_options][" + option + "]", doc_attrs.prince_options[option]))
        }
      } else {
        form.appendChild(makeFormElement("doc[" + key + "]", doc_attrs[key]))
      }
    }

    document.body.appendChild(form);
    form.submit()
  }
}





</script>



</html>
