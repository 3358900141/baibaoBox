<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/7
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册状态</title>
    <style>
        /*h1,h2{*/
        /*    color: darkcyan;*/
        /*    color: chartreuse;*/
        /*    font-family: 华文宋体;*/
        /*}*/
        /*h2{*/
        /*    color: aqua;*/
        /*}*/
        body{
            background-color: darkcyan;
        }
        #bigBox{
            /*border: darkcyan 1px solid;*/
            background-color: white;
            /*background-color:white;*/
            width: 610px;
            height: 470px;
            margin: auto;
        }
        img{
            margin-left: 105px;;
            width: 400px;
            height: 300px;
        }
        h1{
            font-family: 幼圆;
            font-size: 35px;
            color: green;
        }
    </style>
</head>

<body>
<br>
<br>
<br>
<%--<h1 align="center">注册成功</h1>--%>
<%--<br>--%>
<%--<h2 align="center">正在跳转到登录页面......</h2>--%>
<div id="bigBox">
<%--
bigBox背景色逐渐变为白色 动画
放置一张图片  img.hidden
图片缓慢呈现 动画 img.show(1000);
--%>
    <img src="y.jpg" id="YesImg">
    <h1 align="center">注册成功</h1>
</div>
</body>
<script>
    setTimeout(function (){
        window.location="/BookCityProject/login.jsp";
    },1000);

</script>
</html>