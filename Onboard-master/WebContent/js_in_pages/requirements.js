
function switchColors()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("b");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#269af8' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#269af8";
element.style.background="#269af8";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#269af8'; 


} 
function switchColors0()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#269af8' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#269af8";
element.style.background="#269af8";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#269af8' ; 


} 
function call()
{
var f=document.loginForm;
    f.method="post";
    f.action='ArchivalRequirements';
    f.submit();
}

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
 