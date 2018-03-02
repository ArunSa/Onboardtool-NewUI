<!DOCTYPE html>
<html lang="en">
<head>
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
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="css/style.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  
   <script src="js/jquery.js"></script>
  <script src="js/jstree.min.js"></script>
   <script src="js/multiplepages.js"></script>

    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
   
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '400px', width: '300px' });
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
      <style>

.glyphicon { cursor: pointer; }

input,
select { width: 100%; }


#table-scroll {
  height:150px;
  overflow:auto;  
  margin-top:20px;
}
.bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 

</style>
  
   <script>
function myFunction1() {
    var x = document.getElementById('myDiv1');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction2() {
    var x = document.getElementById('myDiv2');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction3() {
    var x = document.getElementById('myDiv3');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction4() {
    var x = document.getElementById('myDiv4');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
</script>
  
  <script>
  

  function kk2()
  {
      document.getElementById("complexity").disabled  = false;
      document.getElementById("est_archive").disabled  = false;
      document.getElementById("est_scrn").disabled  = false;
      document.getElementById("est_db_size").disabled  = false;
      document.getElementById("est_hrs").disabled  = false;
      document.getElementById("est_cst").disabled  = false;
      document.getElementById("ttl_IA_cst").disabled  = false;
      document.getElementById("ttl_infra_cst").disabled  = false;
      document.getElementById("ttl_IA_prdct_cst").disabled  = false;
      document.getElementById("ttl").disabled  = false;

  }
  </script>
  
<script>

function againupdate(){
	var a,b,c,d,e,z;
if(document.loginForm.complexity.value=="Low")
{
document.loginForm.est_archive.value =700;
document.loginForm.est_scrn.value ="<=5";
z=1;
}
if(document.loginForm.complexity.value=="Low to Medium")
{
document.loginForm.est_archive.value =1000;
document.loginForm.est_scrn.value ="<=10";
z=2;
}
if(document.loginForm.complexity.value=="Medium")
{
document.loginForm.est_archive.value =1400;
document.loginForm.est_scrn.value ="<=20";
z=3;
}
if(document.loginForm.complexity.value=="Medium to High")
{
document.loginForm.est_archive.value =1800;
document.loginForm.est_scrn.value ="<=25";
z=4;
}
if(document.loginForm.complexity.value=="High")
{
document.loginForm.est_archive.value =2500;
document.loginForm.est_scrn.value ="<=30";
z=5;
}
document.loginForm.est_db_size.value=(z*0.1*document.loginForm.strg_est.value).toFixed(2);
document.loginForm.est_hrs.value =(document.loginForm.no_of_app.value*document.loginForm.est_archive.value).toFixed(2);
a=(100*document.loginForm.est_hrs.value);
document.loginForm.est_cst.value="$"+a.toFixed(2);
b=document.loginForm.est_db_size.value*document.loginForm.IA_lic_cst.value;
document.loginForm.ttl_IA_cst.value ="$"+b.toFixed(2);
c=10000*document.loginForm.est_db_size.value;
document.loginForm.ttl_infra_cst.value="$"+c.toFixed(2);
d=5*b*document.loginForm.IA_maint_cst.value;
document.loginForm.ttl_IA_prdct_cst.value ="$"+d.toFixed(2);
e=(a*5)+(b*5)+(c*5)+d;
document.loginForm.ttl.value="$"+e.toFixed(2);
}
</script>  
  
  
  

  
<script type="text/javascript">
    function EnableDisableTextBox(chkROD) {
        var txtROD = document.getElementById("txtROD");
        txtROD.disabled = chkROD.checked ? false : true;
        if (!txtROD.disabled) {
            txtROD.focus();
        }
        
    }
</script>
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
<script type="text/javascript">
    function ShowHideDiv() {
        var adMigrated = document.getElementById("adMigrated");
        var adMigratedDet = document.getElementById("adMigratedDet");
        adMigratedDet.style.display = adMigrated.value == "Y" ? "block" : "none";
    }
</script>

<script type="text/javascript">
    function ShowHideDiv() {
        var arcNeed = document.getElementById("arcNeed");
        var arcReason = document.getElementById("arcReason");
        arcReason.style.display = arcNeed.value == "N" ? "block" : "none";
        var arcComment = document.getElementById("arcComment");
        arcComment.style.display = arcNeed.value == "O" ? "block" : "none";
    }
</script>
  
 
    
</head>
<body class='default'>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>

<%
String det=(String)session.getAttribute("theName");
double ans=0.0;
try {
	
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");

String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);

String query = "SELECT * from app_prior where id=(select max(id) from app_prior)";
PreparedStatement statement =  conn.prepareStatement("select sum(ttl) from app_prior");
ResultSet result = statement.executeQuery();
result.next();
String sum=result.getString(1);
ans = Double.parseDouble(sum);
String ans1=String.format("%.2f",ans);
PreparedStatement stmt =  conn.prepareStatement("select appno from projinfo where id=(select max(id) from projinfo)");
ResultSet res = stmt.executeQuery();
res.next();
String appno=res.getString(1);
Statement st = conn.createStatement();
Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();

ResultSet rs = st.executeQuery(query);

String query1= "SELECT * from appinfo";
String query2= "SELECT * from app_prior";
ResultSet rs2 = st2.executeQuery(query2);
ResultSet rs1 = st1.executeQuery(query1);
{
%>

  <%if(rs3.next()){ %>
        
        <script>
        var name="<%=rs3.getString("projectname") %>";
        window.location.replace("tree1.jsp?name="+name);
        </script>
        <%} %>


<script type="text/javascript">
  var e;
 function updatesum() {
	 var x=document.loginForm.data_size.value;
	  var y=document.loginForm.curnt_users.value;

var a,b,c,d,z;
if(x.charAt(0)=='<' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='<' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='<' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='<' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='<' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='1' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='1' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='5' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='5' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='>' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='>' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="High";
}
if(document.loginForm.complexity.value=="Low")
	{
	document.loginForm.est_archive.value =700;
	document.loginForm.est_scrn.value ="<=5";
	z=1;
	}
if(document.loginForm.complexity.value=="Low to Medium")
{
document.loginForm.est_archive.value =1000;
document.loginForm.est_scrn.value ="<=10";
z=2;
}
if(document.loginForm.complexity.value=="Medium")
{
document.loginForm.est_archive.value =1400;
document.loginForm.est_scrn.value ="<=20";
z=3;
}
if(document.loginForm.complexity.value=="Medium to High")
{
document.loginForm.est_archive.value =1800;
document.loginForm.est_scrn.value ="<=25";
z=4;
}
if(document.loginForm.complexity.value=="High")
{
document.loginForm.est_archive.value =2500;
document.loginForm.est_scrn.value ="<=30";
z=5;
}
var qqq="<%=appno%>"
document.loginForm.est_db_size.value=(z*0.1*document.loginForm.strg_est.value).toFixed(2);
document.loginForm.est_hrs.value =(qqq*document.loginForm.est_archive.value).toFixed(2);
a=(100*document.loginForm.est_hrs.value);
document.loginForm.est_cst.value="$"+a.toFixed(2);
b=document.loginForm.est_db_size.value*document.loginForm.IA_lic_cst.value;
document.loginForm.ttl_IA_cst.value ="$"+b.toFixed(2);
c=10000*document.loginForm.est_db_size.value;
document.loginForm.ttl_infra_cst.value="$"+c.toFixed(2);
d=5*b*document.loginForm.IA_maint_cst.value
document.loginForm.ttl_IA_prdct_cst.value ="$"+d.toFixed(2);
e=(a*5)+(5*b)+(5*c)+d;
document.loginForm.ttl.value="$"+e.toFixed(2);
document.loginForm.ttl.value=e.toFixed(2);
}
function add()
{
	var i;
	i=(document.loginForm.ttl_cst_fr_app.value-0)+(document.loginForm.add_cst_fr_contigency.value-0)+(document.loginForm.add_cst.value-0)+(document.loginForm.IA_app_sprt_cst.value-0);
	document.loginForm.est_archive_cst.value="$"+i.toFixed(2); 
}
</script>

 
<form class="form-signin" name="loginForm" method="post">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
            
            <%if (rs3.next()) {%>
                
                    
                    <a class="navbar-brand" href="#">Onboard-<%=rs3.getString("projectname") %></a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                        <li>
                            <a href="#">Settings</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="#">Help</a>
                        </li>
                    </ul>
                    
                </div>
               
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-sm-2 col-md-2 sidebar">
                  <div id='jqxWidget'>
        <div id='jqxTree' style='visibility: hidden;  padding-top:40px; float:left;  margin-left: -45px; padding-left:0 '>
                    <ul class="nav nav-sidebar">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp">Home </a></li>
                <li >App Emphasize Module
                    <ul>
                       <li>Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-selected='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li>Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                            </ul>
                        </li>
                        
                       <li> <a href="demo.jsp">ROI Calculation</a></li>
                        <li>Estimates</li>

                    </ul>
                </li>
                <li>Intake Module
                <ul>
                <li><a href="business.jsp">Business</a></li>
                <li><a href="editproject.jsp">Technical</a></li>
                <li><a href="requirements.jsp">Archival Requirements</a></li>
                </ul>
                </li>
                
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>

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

  </script>
  

                    <br/><br/><br/>
                    
                    
                <div class="col-md-9">
          
            

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div id="one" class="bar" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Hypercare</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>
</div>
              
                    <br/><br/><br/>
                    <div class="panel-group" id="panels1"> 
                                                <div class="panel panel-default">
        <div class="panel-heading"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1"> Parameters   </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse1" class="panel-collapse collapse "> 
                                <div class="panel-body text-left">
                                
                                <%if(rs.next()){ %>
                                    
                                    
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Project Name</label>
                                            <input type="text" class="form-control" id="formInput526"  name="prj_name" value=<%=rs3.getString("projectname") %>>
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA License cost per TB</label>
                                            <input type="text" class="form-control" id="formInput526"  name="IA_lic_cst" value="<%=rs.getString("IA_lic_cst")%>">
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA Maintenance Cost Per Year</label>
                                            <input type="text" class="form-control" id="formInput526"  name="IA_maint_cst" value="<%=rs.getString("IA_maint_cst")%>">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316">Infra Structure Cost per TB</label>
                                              <input type="text" class="form-control"  name="Infrastrct_cst" value="<%=rs.getString("Infrastrct_cst")%>"> 
                                         </div>
                                        <div class="form-group">
                                       
                                            <label class="control-label" for="formInput526">Storage Estimate</label>
                                            <input type="text" class="form-control" id="formInput526"  name="strg_est" value="<%=rs.getString("strg_est")%>">
                                      
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Labor Cost Per Hour for IA Dev Team</label>
                                            <input type="text" class="form-control" id="formInput526"  name="lab_cst" value="<%=rs.getString("lab_cst")%>">
                                        </div>
                                                                        </div>                                 
                            </div>                             
                        </div> 
                  
                               <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2">    Archival Complexity Calculation    </a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                
                                
  <div class="table-responsive" id="table-scroll"> 
    
    <!-- Initialization 
                * js-dynamitable => dynamitable trigger (table)
                -->
    <table class="js-dynamitable     table table-bordered" id="myTable">
      
      <!-- table heading -->
      <thead>
        
        <!-- Sortering
                        * js-sorter-asc => ascending sorter trigger
                        * js-sorter-desc => desending sorter trigger
                        -->
        <tr>
          <th>Application Name<span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction1()"></span></th>
          <th>Complexity <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction2()"></span></th>
          <th>Estimated Size of xDB <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction3()"></span></th>
          <th>Estimated Service Cost <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span><span class="glyphicon glyphicon-search pull-right" onClick="myFunction4()"> </span></th>
        </tr>
        
        <!-- Filtering
                        * js-filter => filter trigger (input, select)
                        -->
        <tr>
          <th> <!-- input filter -->
            
            <input  class="js-filter form-control" type="text" style="display:none" value="" id="myDiv1">
          </th>
          <th> <!-- select filter -->
            
            <input  class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv2">
          </th>
          <th><input class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv3"></th>
          <th><input class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv4"></th>
        </tr>
      </thead>
      
      <!-- table body -->
      <tbody>   
        
      
          <%
          
while(rs1.next()){

%>

        <tr>
        
          <td class="edit_row" style="cursor:pointer" id="1"><%=rs1.getString(1) %></td>
          <td class="row_s" style="cursor:pointer" id="2"><%=rs1.getString(2) %></td>
          <td class="row_t" style="cursor:pointer" id="3"><%=rs1.getString(3) %></td>
          <td class="row_d" style="cursor:pointer" id="4"><%=rs1.getString(4) %></td>
       
         
        </tr>
        <% } 
        
	
        %>
    </tbody>
    </table>
    <script>
// JavaScript script from: http://coursesweb.net/javascript/

// gets all the .edit_row cells, registers click to each one
var edit_row = document.querySelectorAll('#myTable .edit_row');
for(var i=0; i<edit_row.length; i++) {
  edit_row[i].addEventListener('click', function(e){
    // get parent row, add data from its cells in form fields
    var tr_parent = this.parentNode;
    document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
    document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
    document.getElementById('est_db_size').value = tr_parent.querySelector('.row_t').innerHTML;
    document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
    }, false);
}

</script>
     
  </div>
  <br />
                                 
                                  
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Project Name</label>
                                            <input type="text" class="form-control" id="proj_name"  name="proj_name" value="<%=rs.getString("proj_name")%>" >
                                        </div>                                         
                                         
                                      
                                              <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Data Size</label>                                             
                                            <select id="data_size" class="form-control" name="data_size" onChange="updatesum()" > 
                                            <option><%=rs.getString("data_size")%></option>
                                                <option><100 GB</option>                                                 
                                                <option>100 to 250 GB</option>
                                                <option>250 to 500 GB</option>
                                                <option>500 to 1 TB</option>
                                                <option>>1 TB</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                        
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664"><b>Data Source</b></label> 
                                            </div>
                                            <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" <%=rs.getString("data_source")%>>Regular DB</label><br />
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp" <%=rs.getString("data_source")%>>ERP</label><br />
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product" <%=rs.getString("data_source")%>>Product based 
                                                </label>  <br />                          
                                        </div>
                                        
                                      
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Current users</label>                                             
                                            <select id="curnt_users" class="form-control" name="curnt_users" onChange="updatesum()"> 
                                            <option><%=rs.getString("curnt_users")%></option>
                                                <option><10</option>                                                 
                                                <option><25</option>
                                                <option><50</option>
                                                <option><100</option> 
                                                <option>100 to 500</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Complexity</label>                                             
                                            <select id="complexity" class="form-control" name="complexity" onChange="againupdate()">
                                                <option></option>
                                                <option>Low</option>                                                 
                                                <option>Low to Medium</option>
                                                <option>Medium</option>
                                                <option>Medium to High</option> 
                                                <option>High</option>                                                 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">Read Only Date</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="read_date" onChange="againupdate()" value="<%=rs.getString("read_date")%>"> 
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">SME Date</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="sme_date" onChange="againupdate()" value="<%=rs.getString("sme_date")%>"> 
                                        </div>          
                                        
                                    <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Archival Service Effort</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="est_archive" onChange="againupdate()" value="<%=rs.getString("est_archive")%>"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Screen</label>                                             
                                            <input type="text" class="form-control" id="est_scrn"  name="est_scrn" onChange="againupdate()" value="<%=rs.getString("est_scrn")%>" > 
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Size of xDB</label>                                             
                                            <input type="text" class="form-control" id="est_db_size"  name="est_db_size" onChange="againupdate()" value="<%=rs.getString("est_db_size")%>" > 
                                        </div>
                                      <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Hours</label>                                             
                                            <input type="text" class="form-control" id="est_hrs"  name="est_hrs" onChange="againupdate()"  value="<%=rs.getString("est_hrs")%>" >  
                                        </div>
                                                                                <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Total Service Cost</label>                                             
                                            <input type="text" class="form-control" id="est_cst"  name="est_cst" onChange="againupdate()" value="<%=rs.getString("est_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total IA License Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_cst"  name="ttl_IA_cst" onChange="againupdate()" value="<%=rs.getString("ttl_IA_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Infrastructure Storage Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_infra_cst"  name="ttl_infra_cst" onChange="againupdate()" value="<%=rs.getString("ttl_infra_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Info Archive Product Maintenance Cost for 5 years</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_prdct_cst"  name="ttl_IA_prdct_cst" onChange="againupdate()"  value="<%=rs.getString("ttl_IA_prdct_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total</label>                                             
                                            <input type="text" class="form-control" id="ttl"  name="ttl"  value="<%=rs.getString("ttl")%>" > 
                                        </div>                                                     
                                </div>                                 
                            </div>                             
                        </div>
                   
                        
                               <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3">    Archival Cost Estimate    </a> </h4> 
                            </div>                             
                            <div id="collapse3" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                 
                                  
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Total Cost for all applications in the project</label>
                                            <input type="text" class="form-control" id="ttl_cst_fr_app"  name="ttl_cst_fr_app" onChange="add()" value="<%=ans1%>" >
                                        </div>                                         
                                          <div class="form-group">
                                            <label class="control-label" for="formInput664">Additional Cost for Contingency</label>
                                             <div class="input-group">
                                               <input type="text" class="form-control" id="add_cst_fr_contigency" name="add_cst_fr_contigency" onChange="add()" value="<%=rs.getString("add_cst_fr_contigency")%>"> 
                                                <div class="input-group-addon">
	                                           <a href="#" data-toggle="tooltip" title="Infra Setup/unplanned labor/travel Etc."> <span class="glyphicon glyphicon-info-sign" ></span></a> 
                                               </div>
                                               </div>                                     
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Additional Cost</label>     
                                             <div class="input-group">                                        
                                            <input type="text" class="form-control" id="add_cst" name="add_cst" onChange="add()" value="<%=rs.getString("add_cst")%>">
                                            <div class="input-group-addon">
	                                           <a href="#" data-toggle="tooltip" title="if there is a program team"> <span class="glyphicon glyphicon-info-sign" ></span></a> 
                                               </div>
                                               </div>    
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">IA Application Support Cost Labor</label>                                             
                                            <input type="text" class="form-control" id="IA_app_sprt_cst" name="IA_app_sprt_cst" onChange="add()" value="<%=rs.getString("IA_app_sprt_cst")%>"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Archival Cost for CAR Projection</label>                                             
                                            <input type="text" class="form-control" id="est_archive_cst" name="est_archive_cst" value="<%=rs.getString("est_archive_cst")%>"> 
                                        </div>
                        
                        </div>
                        </div>
                        </div>
                        <br/>
                      <script>
                      function OnButton1()
                      {
                          document.loginForm.action = "Displaydb"
                        	  document.loginForm.submit();   
                          // document.Form1.target = "_blank";    // Open in a new window
                          document.loginForm.submit();             // Submit the page

                          return true;
                      }
                      function OnButton2()
                      {
                          document.loginForm.action = "infodb"
                          // document.Form1.target = "_blank";    // Open in a new window

                          document.loginForm.submit();             // Submit the page

                          return true;
                      }
                      
                      
                     
                      </script>
         
                                                                                            
                                   
                                   
<button type="button" class="btn btn-primary" onclick="OnButton1()">Save</button>
<button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" onclick="window.location.href='test.jsp'">Next<span class="glyphicon glyphicon-chevron-right"></span></button>
        
     
                    <a href="root1.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                                      <% } %> 
                                      
                                </div>                                 
                            </div>
                             <%
}
}}
catch(Exception e){}
%>
</body>
</html>