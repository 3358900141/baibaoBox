<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/22
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录界面</title>
    <style>
        body{
            background-color: darkcyan;
        }
        #bigBox{
            /*border: darkcyan 1px solid;*/
            background-color:white;
            width: 600px;
            height: 350px;
            margin: auto;
            border-radius: 10px;
        }
        #bigBox form table,#bigBox button{
            font-size: 25px;
            font-family: 幼圆;
        }
        #bigBox input{
            height: 35px;
            width:260px;
            font-family: 幼圆;
            font-size: 25px;
        }
        #bigBox button{
            position: relative;
            left: 120px;
            background-color: darkcyan;
            height: 60px;
            width: 390px;
        }
        h1{
            background-color: darkcyan;
            /*color: ;*/
        }
        .p1{
            position: relative;
            float: right;
            right: 10px;
        }
        .p1 a{
            text-underline: red;
            color: red;
        }
    </style>
</head>
<body>

<br>
<br>
<br>
<div id="bigBox">
    <!--    <h3 align="center">欢迎登录</h3>-->
    <br>
    <span style="color: white;font-size: 10px;">提示</span>
    <span style="color: red; font-size: 15px; font-family: 楷体;position: relative;left: 230px;">
        <%=request.getAttribute("LogInMessage")==null?"":request.getAttribute("LogInMessage")%>
    </span>
    <form action="/BookCityProject/LoginOrRegister" method="post">
        <input name="action" value="Login" type="hidden">
        <table align="center">
            <tr height="100px">
                <td>用户名:</td>
                <td><input name="username" value="<%=request.getAttribute("userValues")==null?"":request.getAttribute("userValues")%>"/></td>
            </tr>
            <tr>
                <td>密 码:</td>
                <td><input name="passwd" type="password"/></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
            </tr>
        </table>
        <button type="submit">登录</button>
    </form>
    <p class="p1">没有账号?<a href="register.jsp">立即注册</a></p>
</div>
</body>
<script type="text/javascript">

</script>
</html>