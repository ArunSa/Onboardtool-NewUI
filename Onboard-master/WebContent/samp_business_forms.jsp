<script>
 function chk(q){
var number=document.getElementById("number"+q).value;
var s="";
for(var i = 1; i <= number; i++) {
    s+= '<label>Checkbox Label'+i +':</label><input type="text" class="form-control" name="label'+i+'"><br/>'; //Create one textbox as HTML
}
document.getElementById("demo"+q).innerHTML=s;
 }
 
 function radio(q){
	 var number=document.getElementById("radio_number"+q).value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Radiobox Label'+i +':</label><input type="text" class="form-control" name="Rlabel'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo1"+q).innerHTML=s;
	  }
 function drp_dwn(q){
	 var number=document.getElementById("drop_number"+q).value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Options Label'+i +':</label><input type="text" class="form-control" name="drp_label'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo2"+q).innerHTML=s;
	  }
 </script> 
    <script>
   function call(x)
   {
	  // alert(ans);
	   var type=document.getElementById("types"+x);
	   
	//   alert(type);
	   if(type[type.selectedIndex].value == "Check box") {
		  // alert("check box");
	    document.getElementById("check"+x).style.display='block';
	    document.getElementById("rdo"+x).style.display='none';
	    document.getElementById("drop"+x).style.display='none';
	   }
	   if(type[type.selectedIndex].value == "Text box") {
		//   alert("text box");
		    document.getElementById("check"+x).style.display='none';
		    document.getElementById("rdo"+x).style.display='none';
		    document.getElementById("drop"+x).style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Radio box") {
		  // alert("radio box");
		    document.getElementById("rdo"+x).style.display='block';
		    document.getElementById("check"+x).style.display='none';
		    document.getElementById("drop"+x).style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Dropdown") {
		 //  alert("dropdown");
		    document.getElementById("rdo"+x).style.display='none';
		    document.getElementById("check"+x).style.display='none';
		    document.getElementById("drop"+x).style.display='block';
		   }
   }
   </script>

<% for(int i=1;i<=4;i++){ %>
<form class="form-signin" name="LloginForm" method="post" action="sampadd">
 <div id="popup<%=i %>" class="overlay">        
<div class="popup">
		 <a class="close" href="#">&times;</a> 
		<br/>
		              <div class="ScrollStyle">  
<div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Label:</label>
<input type="text" class="form-control" id="label<%=i %>"  name="label<%=i %>" required>
</div>
 </div>
 </div><br/>
 <div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Column name:</label>
<input type="text" class="form-control" id="idname<%=i %>"  name="idname<%=i %>" required>
</div>
 </div>
 </div><br/>
 <div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Type:</label>
<select id="types<%=i %>" class="form-control" name="types<%=i %>" onChange="call('<%=i %>')" required >  
                                                <option value="Text box">Text box</option>                                                 
                                                <option value="Check box">Check box</option>
                                                <option value="Radio box">Radio box</option> 
                                                <option value="Dropdown">Dropdown</option>
                                                <option value="Datepicker">Datepicker</option>                                              
                                            </select>
</div>
 </div>
 </div>
 
 <div class="row" id="check<%=i %>" style="display:none;">
  <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of check boxes:</label>
<input type="text" class="form-control" id="number<%=i %>"  name="number<%=i %>" onChange="chk('<%=i %>')">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="rdo<%=i %>" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of Radio boxes:</label>
<input type="text" class="form-control" id="radio_number<%=i %>"  name="radio_number<%=i %>" onChange="radio('<%=i %>')">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="drop<%=i %>" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-4">
<label class="control-label" for="formInput526">Number of Options:</label>
<input type="text" class="form-control" id="drop_number<%=i %>"  name="drop_number<%=i %>" onChange="drp_dwn('<%=i %>')">
</div>
 </div>
 <br/>
 </div>

  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo<%=i %>"></div>
</div>
 </div>
 </div>
 
  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo1<%=i %>"></div>
</div>
 </div>
 </div>
 <div class="row">
  <div class="form-group"> 
 <div class="col-sm-4">
  <div id="demo2<%=i %>"></div>
</div>
 </div>
 </div>

 <div class="row">
  <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Mandatory:</label>
<select id="mandatory" class="form-control" name="mandatory<%=i %>" required > 
                                                <option>Yes</option>                                                 
                                                <option>No</option>                                              
                                            </select>
</div>
 </div>
 </div>
<br/><br/>
<input type="text" name="panel" value="<%=i %>" style="display:none;">
 <button type="submit" class="btn btn-primary" >Submit</button>
 <button type="button" onclick="window.location.href='samp_business.jsp'" class="btn btn-default">Cancel</button>
	</div>
	</div>
</div>
  </form>
<%} %>
 
  
  <form class="form-signin" name="loginFormm" method="post" action="sampadd">

 <div id="popup_edit" class="overlay">        
<div class="popup">
		 <a class="close" href="#">&times;</a> 
		<br/>
		              <div class="ScrollStyle">  
<div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Label:</label>
<input type="text" class="form-control" id="label"  name="label" required>
</div>
 </div>
 </div><br/>
 <div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Column name:</label>
<input type="text" class="form-control" id="idname"  name="idname" required>
</div>
 </div>
 </div><br/>
 <div class="row">
 <div class="form-group"> 
 <div class="col-lg-8">
<label class="control-label" for="formInput526">Type:</label>
<select id="types" class="form-control" name="types" onChange="call()" required >  
                                                <option value="Text box">Text box</option>                                                 
                                                <option value="Check box">Check box</option>
                                                <option value="Radio box">Radio box</option> 
                                                <option value="Dropdown">Dropdown</option>
                                                <option value="Datepicker">Datepicker</option>                                              
                                            </select>
</div>
 </div>
 </div>
 
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
  <div class="row" id="drop3" style="display:none;">
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
 <div class="col-lg-8">
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
 <button type="button" onclick="window.location.href='samp_business.jsp'" class="btn btn-default">Cancel</button>
	</div>
	</div>
</div>

  </form> 