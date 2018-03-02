<!DOCTYPE html>
<html lang="en">
<head>
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
  <script src="js/jquery.js"></script>
  <script src="js/jstree.min.js"></script>

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
  <style>.bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 
  </style>
  
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
<script>
function update()
{
var anl_org=document.loginForm.anl_org.value-0; 
var mf_serv=document.loginForm.mf_serv.value-0;
var app_serv=document.loginForm.app_serv.value-0;
var web_serv=document.loginForm.web_serv.value-0;
var ws_serv=document.loginForm.ws_serv.value-0;
var vtl_serv=document.loginForm.vtl_serv.value-0;
var db_serv=document.loginForm.db_serv.value-0;
var anl_lic_cst=document.loginForm.anl_lic_cst.value-0;
var db_lic=document.loginForm.db_lic.value-0;
var op_sys_lic=document.loginForm.op_sys_lic.value-0;
var swft_lic=document.loginForm.swft_lic.value-0;
var oth_lic=document.loginForm.oth_lic.value-0;
var anl_sprt_cst=document.loginForm.anl_sprt_cst.value-0;
var yrly_upgrd_cst=document.loginForm.yrly_upgrd_cst.value-0;
var yrly_res_cst=document.loginForm.yrly_res_cst.value-0;
document.loginForm.ttl.value=anl_org+mf_serv+app_serv+web_serv+ws_serv+vtl_serv+db_serv+anl_lic_cst+db_lic+op_sys_lic+swft_lic+oth_lic+anl_sprt_cst+yrly_upgrd_cst+yrly_res_cst; 

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


  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body>
  <%@page language="java"%>
<%@page import="java.sql.*"%>


<%
try {
	String det=(String)session.getAttribute("theName");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
{
%>
<form class="form-signin"name="loginForm" method="post" action="comp">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                    <% if(rs3.next()){ %>
                    <a class="navbar-brand" href="#">Onboarding Tool-<%=rs3.getString("projectname") %></a>
                    <%} %>
              
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
                            <a href="Login.html">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
               
               
               
               <div class="col-md-3 sidebar">
                  <div id='jqxWidget'>
        <div id='jqxTree' style='visibility: hidden;  padding-top:40px; float:left;  margin-left: -45px; padding-left:0 '>
                    <ul class="nav nav-sidebar">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp">Home </a></li>
                <li item-expanded='true'>App Emphasize Module
                    <ul>
                       <li item-expanded='true'>Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true' item-selected='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                               
                            </ul>
                        </li>
                         <li><a href="applnprior.jsp">Application-Prioritized</a></li>
                       <li item-selected='true'><a href="demo.jsp">ROI Calculation</a></li>
                        <li>Estimates</li>

                    </ul>
                </li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'>Business
                <ul>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                
                </ul></li>
                <li item-expanded='true'>Technical
                <ul>
                <li>Application Data Information</li>
                <li>Infrastructure & Environment Inforamation</li>
                <li>Technical Information</li>
                </ul>
                </li>
                
                 <li item-expanded='true'>Archival Requirements
                 <ul>
                 <li>Screen/Report Requirements</li>
                 <li>Archive Requirements</li>
                 </ul>
                 </li>
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
  <br/><br/><br/>
                                
                 <div class="col-md-8">
                 
                 
                             

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
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1"> Legacy Application Maintenance Inputs   </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse1" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                

                                    
                                    
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Annual Organization pay on Server maintenances</label>
                                            <input type="text" class="form-control" id="formInput526"  name="anl_org" onChange="update()">
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Mainframe Servers</label>
                                            <input type="text" class="form-control" id="formInput526"  name="mf_serv" onChange="update()">
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Application Servers</label>
                                            <input type="text" class="form-control" id="formInput526"  name=app_serv onChange="update()">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316">Web Servers</label>
                                              <input type="text" class="form-control"  name="web_serv"  onChange="update()"> 
                                         </div>
                                        <div class="form-group">
                                       
                                            <label class="control-label" for="formInput526">Windows Servers</label>
                                            <input type="text" class="form-control" id="formInput526"  name="ws_serv" onChange="update()">
                                      
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Virtual Servers</label>
                                            <input type="text" class="form-control" id="formInput526"  name="vtl_serv" onChange="update()">
                                        </div>
                                                <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Database Servers</label>
                                            <input type="text" class="form-control" id="formInput526"  name="db_serv" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Annual License/Contractual Cost for each application</label>
                                            <input type="text" class="form-control" id="formInput526"  name="anl_lic_cst"  onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Database License</label>
                                            <input type="text" class="form-control" id="formInput526"  name="db_lic" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Operating Systems License</label>
                                            <input type="text" class="form-control" id="formInput526"  name="op_sys_lic" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Software Product License</label>
                                            <input type="text" class="form-control" id="formInput526"  name="swft_lic" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Other License</label>
                                            <input type="text" class="form-control" id="formInput526"  name="oth_lic" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Annual Operational Support Cost</label>
                                            <input type="text" class="form-control" id="formInput526"  name="anl_sprt_cst" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Yearly Product Upgrade Cost</label>
                                            <input type="text" class="form-control" id="formInput526"  name="yrly_upgrd_cst" onChange="update()">
                                        </div>
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Yearly resource cost</label>
                                            <input type="text" class="form-control" id="formInput526"  name="yrly_res_cst"  onChange="update()">
                                        </div>   
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Total</label>
                                            <input type="text" class="form-control" id="formInput526"  name="ttl">
                                        </div>                         
                               
                               
                                </div>                                 
                            </div>                             
                        </div> 
                                                                             <br>               
                                   <button type="submit" class="btn btn-primary" >Save</button>
                     <a href="project.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                                    
                                      
                                </div>                                 
                            </div>                             
                        </div>                       
                  
                        
                    </div> 
        
                    
                  
       </div>
                
            </div>
           
           
        <%
}
}
catch(Exception e){}
%>
 </form>
</body>
</html>


