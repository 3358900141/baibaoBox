<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/17
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>测试页面</h1>
<div style="height: 6000px;height: 1000px;">
<div id="box1" style="width:198px; height:200px; background-color:#ac2e9d; position: absolute; top: 0px;left:900px;"></div>
    <div style="height: 100px;width: 500px;background-color: green;margin: auto;">
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

    var dv1=document.getElementById("box1");
    // alert(dv1.style.top)
    window.onscroll=divMove;

    function divMove(){
        var arr=getScroll();
        dv1.style.top=arr[0]+50;
        // alert(dv1)
    }


    function getScroll() {
        var arry=new Array();
        if (document.documentElement&&document.documentElement.scrollTop){
            arry[0]=document.documentElement.scrollTop;
            arry[1]=document.documentElement.scrollLeft;
            arry[2]=document.documentElement.scrollWidth;
            arry[3]=document.documentElement.scrollHeight;
        }else if (document.body){
            arry[0]=document.body.scrollTop;
            arry[1]=document.body.scrollLeft;
            arry[2]=document.body.scrollWidth;
            arry[3]=document.body.scrollHeight;
        }
        return arry;
    }

</script>
</html>
