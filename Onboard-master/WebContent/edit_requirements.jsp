<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
   <script>
 function chk(){
var number=document.getElementById("number").value;
var s="";
for(var i = 1; i <= number; i++) {
    s+= '<label>Checkbox Label'+i +':</label><input type="text" class="form-control" name="label'+i+'"><br/>'; //Create one textbox as HTML
}
document.getElementById("demo").innerHTML=s;
 }
 
 function radio(){
	 var number=document.getElementById("radio_number").value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Radiobox Label'+i +':</label><input type="text" class="form-control" name="Rlabel'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo1").innerHTML=s;
	  }
 function drp_dwn(){
	 var number=document.getElementById("drop_number").value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Options Label'+i +':</label><input type="text" class="form-control" name="drp_label'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo2").innerHTML=s;
	  }
 </script> 
    <script>
   function call()
   {
	  // alert(ans);
	   var type=document.getElementById("types");
	//   alert(type);
	   if(type[type.selectedIndex].value == "Check box") {
		   alert("check box");
	    document.getElementById("check").style.display='block';
	    document.getElementById("rdo").style.display='none';
	    document.getElementById("drop").style.display='none';
	   }
	   if(type[type.selectedIndex].value == "Text box") {
		   alert("text box");
		    document.getElementById("check").style.display='none';
		    document.getElementById("rdo").style.display='none';
		    document.getElementById("drop").style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Radio box") {
		   alert("radio box");
		    document.getElementById("rdo").style.display='block';
		    document.getElementById("check").style.display='none';
		    document.getElementById("drop").style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Dropdown") {
		   alert("dropdown");
		    document.getElementById("rdo").style.display='none';
		    document.getElementById("check").style.display='none';
		    document.getElementById("drop").style.display='block';
		   }
   }
   </script>
</head>
<body style="margin-left:30px;"><br/><br/>
<%
String label=request.getParameter("label");
String id=request.getParameter("idname");
%>
  <div class="content-wrapper">
                <div class="content-container">
            
                    <div class="main-page">
<h1>Edit Page</h1>                    
 <div class="container">
    <br/><br/>
<div class=" well col-lg-6 col-lg-push-1 well">
<div class="row">
<div class="col-sm-12" style="padding:10px">
<form class="form-signin" name="loginForm" method="post" action="Edit_Requirements">
 <div class="content-wrapper">
                <div class="content-container">
            
                    <div class="main-page">
                     <div class="container">
<div class="row">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Label:</label>
<input type="text" class="form-control" id="label"  name="label" value="<%= label %>" required>
</div>
 </div>
 </div><br/>
  <div class="row">
 <div class="form-group"> 
 <div class="col-sm-4">
<input type="text" class="form-control" id="idname"  name="idname" value="<%= id %>" style="display:none;">
</div>
 </div>
 </div><br/>
 <div class="row">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Type:</label>
<select id="types" class="form-control" name="types" onChange="call()" required >  
                                                <option value="Text box">Text box</option>                                                 
                                                <option value="Check box">Check box</option>
                                                <option value="Radio box">Radio box</option> 
                                                <option value="Dropdown">Dropdown</option>                                              
                                            </select>
</div>
 </div>
 </div><br/>
 
 <div class="row" id="check" style="display:none;">
  <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of check boxes:</label>
<input type="text" class="form-control" id="number"  name="number" onChange="chk()">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="rdo" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of Radio boxes:</label>
<input type="text" class="form-control" id="radio_number"  name="radio_number" onChange="radio()">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="drop" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of Options:</label>
<input type="text" class="form-control" id="drop_number"  name="drop_number" onChange="drp_dwn()">
</div>
 </div>
 <br/>
 </div>

  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo"></div>
</div>
 </div>
 </div>
 
  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo1"></div>
</div>
 </div>
 </div>
 <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo2"></div>
</div>
 </div>
 </div>

 <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Mandatory:</label>
<select id="mandatory" class="form-control" name="mandatory" required > 
                                                <option>Yes</option>                                                 
                                                <option>No</option>                                              
                                            </select>
</div>
 </div>
 </div>
<br/><br/>
 <button type="submit" class="btn btn-primary">Submit</button>
 <button type="button" onclick="window.location.href='Intake_ArchiveRequirements.jsp'" class="btn btn-default">Cancel</button>
 </div></div></div>
  </form>
 

</div> 
</div>
</div>
</div>
  </div></div></div>
 
</body>
</html>