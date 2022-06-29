<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/4
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <style>
        body{
            background-color: darkcyan;
        }
        #bigBox{
            border-radius: 10px;
            background-color: bisque;
            /*background-color:white;*/
            width: 610px;
            height: 470px;
            margin: auto;
        }
        #bigBox form table,#bigBox form{
            font-size: 25px;
            font-family: 幼圆;
        }
        #bigBox form table input{
            font-size: 20px;
            font-family: 方正粗黑宋简体;
            height: 35px;
            width:260px;
        }
        #bigBox table tr{
            height: 60px;
        }
        #vCode{
            position: relative;
            left: 40px;
            /*background-color: red;*/
            height: 35px;
            width: 130px;
        }
        img{
            position: relative;
            left:40px;
        }
        label{
            position: relative;
            left: 20px;
        }
        #bigBox button{
            position: relative;
            left: 120px;
            background-color: burlywood;
            /*background-color: cornflowerblue;*/
            height: 50px;
            width: 390px;
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<%
    String message= (String) request.getAttribute("CheckCodeMessage");
    String userMessage= (String) request.getAttribute("userMessage");
%>
<div id="bigBox">
    <!--    <h3 align="center">欢迎登录</h3>-->
    <br>
    <span style="color: bisque;font-size: 10px;">提示</span>
    <span style="position: relative; left: 200px; color: red;"><%=userMessage==null?"":userMessage%></span>
    <form action="/BookCityProject/LoginOrRegister" method="POST" id="register">
        <input name="action" value="Register" type="hidden">
        <table align="center">
            <tr>
                <td>用户名:</td>
                <td width="410px"><input name="username" id="username" value="<%=request.getAttribute("userValue")==null?"":request.getAttribute("userValue")%>" /><span style="font-size:12px;color: green;" id="uSpan">* 由4-16位字母和数字组成</span>
                    <br>
                    <span style="font-size: 9px;color: red;" id="uCheckNull"></span>
                </td>
                <td id="uImg"></td>
            </tr>
            <tr>
                <td>密 码:</td>
                <td><input name="passwd" type="password" id="passwd" value="<%=request.getAttribute("passwdValue")==null?"":request.getAttribute("passwdValue")%>" /><span style="font-size: 9px;color: green;" id="pSpan">* 不少于6位</span>
                    <br>
                    <span style="font-size: 9px;color: red;" id="pCheckNull"></span>
                </td>
                <td id="pImg"></td>
            </tr>
            <tr>
                <td>确认密码:</td>
                <td><input name="passwd2" type="password" id="passwd2" value="<%=request.getAttribute("passwdValue")==null?"":request.getAttribute("passwdValue")%>"/><span style="font-size: 9px;color: red;" id="pSpan2"></span>
                    <br>
                    <span style="font-size: 9px;color: red;" id="p2CheckNull"></span>
                </td>
                <td width="60px" id="pImg2"></td>
            </tr>
            <tr>
                <td>电子邮箱:</td>
                <td><input name="emil" id="emil" value="<%=request.getAttribute("emilValue")==null?"":request.getAttribute("emilValue")%>" /><span style="font-size: 9px;color: green;">* (必选) 用于找回密码</span>
                    <span style="font-size: 9px;color: red;" id="eSpan"></span></td>
                </td>
            </tr>
<%--            <tr>--%>
<%--                <td>验证码:</td>--%>
<%--                <td></td>--%>
<%--&lt;%&ndash;                <td><textarea name=""></textarea></td>&ndash;%&gt;--%>
<%--            </tr>--%>
         </table>
         <p><label>验证码:</label><input name="verificationCode" id="vCode"/>
             <span></span>
            <img src="/BookCityProject/servlet/CodeServlet" border="0" style="cursor:pointer" id="CheckCode"/>
            <span style="position: relative;left: 40px;font-size: 15px;color: green;"><a href="#a" onclick="trans()">换一张</a></span>
             <span style=" position: relative; left: 100px; font-size: 22px; color: red;"><%=message==null?"":message%></span>
         </p>
        <button type="button" id="checkBut">立即注册</button>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    // alert("hello")
    var img1=document.getElementById("CheckCode");
    function trans() {
        // alert("hello1")
        // location.href='/BookCityProject/servlet/CodeServlet';
        img1.src="/BookCityProject/servlet/CodeServlet?time="+new Date();
    }
    // var username = document.getElementById("username");
    var us=true,ps1=true,ps2=true,em=true;
    var uImg=document.getElementById("uImg");
    var pImg=document.getElementById("pImg");
    var pImg2=document.getElementById("pImg2");
    var ps2Span=document.getElementById("pSpan2");
    var eSpan=document.getElementById("eSpan");
    //表单未输入数据提交,显示错误信息
    var uCheckNull=document.getElementById("uCheckNull");
    var pCheckNull=document.getElementById("pCheckNull");
    var p2CheckNull=document.getElementById("p2CheckNull");

    $("#username").change(function () {
            var userPattern = /^[a-zA-Z0-9]{4,16}$/;
            //判断用户名格式是否与正则表达式相同
            if (userPattern.test(this.value)) {
                //相同添加正确图片
                uImg.innerHTML = "<img  src='yes.jpg' width='25px' height='25px' />";
                // $("#username").css("border","");
                // $("#uSpan").css("color","green");
                // $("#username").css("box-shadow","");
                us=true;
                // alert(uCheckNull)
                removeCss("#username","#uSpan");
                $("#uCheckNull").empty();
                // alert(ps1)
            } else {
                //否则添加错误图片
                us=false;
                uImg.innerHTML = "<img  src='no.jpg' width='25px' height='25px' />";
                addClass("#username","#uSpan");
                // alert(us)
            }
        });

        $("#passwd").change(function (){
            var passwdPattern = /^[a-zA-Z0-9]{4,16}$/;
            if (passwdPattern.test(this.value)) {
                ps1=true;
                pImg.innerHTML = "<img  src='yes.jpg' width='25px' height='25px' />";
                $("#pCheckNull").empty();
                removeCss("#passwd","#pSpan");
            } else {
                ps1=false;
                pImg.innerHTML = "<img  src='no.jpg' width='25px' height='25px' />";
                // $("#passwd").css("border","red 1px solid");
                // // alert("no")
                addClass("#passwd","#pSpan");
            }
        });

        $("#passwd2").change(function (){
            // alert($("#passwd").val())
            // alert($("#passwd2").val())
            if ($("#passwd").val()==$("#passwd2").val()&&$("#passwd2").val()!=""){
                ps2=true;
                pImg2.innerHTML = "<img  src='yes.jpg' width='25px' height='25px' />";
                $("#passwd2").css("border","");
                removeCss("#passwd2","#pSpan2");
                $("#pSpan2").empty();
                $("#p2CheckNull").empty();
                // alert("yes")
            } else {
                ps2=false;
                pImg2.innerHTML = "<img  src='no.jpg' width='25px' height='25px' />";
                // $("#passwd2").css("border","red 1px solid");
                addClass("#passwd2","#pSpan2");
                ps2Span.innerHTML="* 密码必须一致";
                // alert("no")
            }
        });
        $("#checkBut").click(function () {
        });

        //检查电子邮箱的表达式
        $("#emil").change(function (){
            var emilPattern=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (emilPattern.test(this.value)){
                em=true;
               removeCss("#emil","#eSpan");
               $("#eSpan").empty();
            }else {
                em=false;
                addClass("#emil","#eSpan");
                eSpan.innerHTML="邮箱格式不正确";
            }
        });

        function removeCss(name1,name2){//name1为input输入框样式，name2为span样式
            $(name1).css("border","");
            $(name2).css("color","green");
            $(name1).css("box-shadow","");
        }

        function addClass(name1,name2){//name1为input输入框样式，name2为span样式
            $(name2).css("color","red");
            $(name1).css("border","red 1px solid");
            $(name1).css("box-shadow","red 0px 0px 5px 1px");
        }

        $("#checkBut").click(function () {
            // alert("12")
            if(us&&ps1&&ps2&&em){
                if ($("#username").val()==""){
                    addClass("#username","#uSpan");
                    uCheckNull.innerHTML="用户名不能为空！";
                }else if ($("#passwd").val()==""){
                    addClass("#passwd","#pSpan");
                    pCheckNull.innerHTML="密码不能为空！";
                }else if ($("#passwd2").val()==""){
                    addClass("#passwd2","#pSpan2");
                    p2CheckNull.innerHTML="请输入确认密码！";
                }else if ($("#emil").val()==""){
                    addClass("#emil","#eSpan");
                    eSpan.innerHTML="邮箱不能为空！";
                }else {
                    $("#register").submit();
                }
            }
        })

</script>