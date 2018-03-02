
function editRecord(){
    var f=document.form;
    f.method="post";
    f.action='newapplication.jsp';
    f.submit();
}
function edit(id){
    var f=document.form;
    f.method="post";
    f.action='business.jsp?id='+id;
    f.submit();
}
