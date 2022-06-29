<%@ page import="com.pojo.Cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/5
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="heigth" value="125" />
<html>
<%
    int size=0;
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    if (cart!=null)
        size=cart.getItem().size();
%>

<head>
    <title>外淘喵首页</title>
    <style>
        .bigBox{
            margin: auto;
            width: 100%;
            height: ${heigth*requestScope.page.pageSize}px;
            /*background-color: antiquewhite;*/
        }
        #input1{
            float: left;
            /*border: 5px solid rgba(230,158,11,1.00);*/
            border: 5px solid orange;
            border-right: none;
            width: 600px;
            height: 42px;
        }
        #search{
            border: 0;
            background-color: orange;
        }
        #header{
            margin: auto;
        }
        #header{
            width: 800px;
            height:20px;
        }
        #navigation{
            width: 700px;
            margin-left: 20%;
            margin-top: 35px;
        }
        #navigation ul li{
            display: block;
            float: left;
            margin-right:25px;
        }
        #navigation ul li a{
            color: rgba(154,145,145,1.00);
            text-decoration: none;
            font-size: 13px;
        }
        #navigation ul li a:hover{
            text-decoration:underline;
            color: rgba(177,49,45,1.00);
        }
        #tradeShow{
            /*margin-top:150px;*/
            margin:150px auto;
            width: 70%;
            /*background-color: #ac2e9d;*/

        }
        #tradeShow table{
            /*background-color: #ac2e9d;*/
            border-spacing: 0px;
            /*margin: ;*/
        }
        #tradeShow table tr td{
            border: 1px solid lavender;
            width:250px;
            height: 360px;
            margin: 0px;
            padding: 0px;
        }
        #tradeShow table tr td:hover{
            background-color: antiquewhite;
            /*border:1px solid red;*/
        }
        #mathImg{
            position: relative;top: 27px;left: 15px;font-size: 14px;font-family: 幼圆;color: white;
            line-height: 20px;
            text-align: center;
            display:block;
            height: 21px;
            width: 21px;
            background-color: coral;
            border-radius: 50%;
            /*display: none;*/
        }
        #tradeShow input{
            width: 36px;
            height: 20px;
        }
    </style>
</head>


<%--登录显示框--%>
<body style="padding: 0;margin: 0;font-family: 幼圆;">
<div style="width: 100%;height: 30px;background-color: aliceblue;font-size: 12px">
    <span style="position: relative;left: 300px;line-height: 30px;">用户:
        <c:if test="${empty sessionScope.user.username}">
            <a href="/BookCityProject/login.jsp" style="text-decoration: none;"><span style="color:orange">未登录</span></a>
        </c:if>
        <span style="color:orange">${sessionScope.user.username}</span>
        <c:if test="${not empty sessionScope.user.username}">
        <a href="/BookCityProject/LoginOrRegister?action=LogOut" style="text-decoration: none;">
            <span style="position: relative;left: 30px;color: darkgreen">注销</span></a>
        </c:if>
    </span>
</div>

<%--商品展示和搜索--%>
<div class="bigBox">
<%--    ${empty sessionScope.cart.totalCount}--%>
    <br>
    <br>
    <br>
    <div id="header">
    <input type="search" id="input1" name="input" style="outline: none;">
        <button style="width: 110px;height: 42px;" id="search">搜索</button>
    </div>
<div id="navigation">
        <ul>
            <li><a href="#">限时抢购</a></li>
            <li><a href="#">男装</a></li>
            <li><a href="#">女装</a></li>
            <li><a href="#">生活用品</a></li>
            <li><a href="#">数码产品</a></li>
            <li><a href="#">手机</a></li>
            <li><a href="#">家具</a></li>
            <li><a href="#">大牌家电</a></li>
        </ul>
    </div>

<%--    ${requestScope.page.items}--%>
<%--    设置购物车显示加购的商品数--%>
    <div id="buyCar1" style="width:66px; height:150px;position: absolute; top: 200px;left:93%;">
        <span id="mathImg"></span>
        <img src="/BookCityProject/imgs/TbCar.jpg" width="66px" height="66px" id="AnImg"/>
        <a href="/BookCityProject/buyCar/showCart.jsp" style="text-decoration: none;color: coral;font-weight: bolder">&nbsp;购物车</a>
        <div style="height:66px;height: 66px;">
            <span style="text-align: center;display: block;font-family: 幼圆;font-size: 16px;">
                <img src="/imgs/Anima.jpg" width="66px" height="66px;" id="lookOrder">
                <a href="/BookCityProject/order?action=showOrderByUserId" style="text-decoration: none;color: coral;font-weight: bolder">我的订单</a>
            </span>
        </div>
    </div>


    <div id="tradeShow">
<%--        价格筛选框--%>
        <div style="width: 100%;height: 50px;position: relative;left: 10px;bottom: 10px;">
            <form action="/BookCityProject/page?action=GoodsByPrice" method="post">
            <span style="font-family: 幼圆;">价格区间 :  </span><input id="minPrice" name="minPrice" value="${param.minPrice}"/>
                &nbsp;-&nbsp;
                <input id="maxPrice" name="maxPrice" value="${param.maxPrice}"/>
                <button style="width: 56px;height:30px;position: relative;left: 10px;background-color: orange;border:solid 1px coral;">筛选</button>
            </form>
        </div>


    <c:if test="${empty requestScope.page.items}">
        <div style="width: 60%;height: 10%;margin:100px 360px;font-size: 30px;color: orange">
            亲 暂时还没有相关宝贝哦^v^
        </div>
    </c:if>

        <table>
            <tr>
                <c:set var="num" value="4"/>
                <c:forEach items="${requestScope.page.items}" var="book" varStatus="count">
                <td>
                    <input value="${book.id}" type="hidden">
                    <div id="img" style="margin: 0 30px;position: relative;"><img src="/imgs/defaults.jpg" width="200px" height="230px"/></div>
                    <div style="margin: 0 30px;position: relative;">${book.name}</div>
                    <div style="margin: 0 30px;position: relative;font-size: 20px;">价格:${book.price}</div>
                    <div style="margin: 0 30px;position: relative;">销量:${book.sales}<span style="position: relative;left:100px;color: orangered;font-weight: bolder;display: none" class="add">+1</span></div>
                    <div style="margin: 0 30px;position: relative;">库存:${book.stock}
                        <div style="float: right;position: relative;margin-right: 25px;">
<%--                            <a href="/BookCityProject/buyCart?action=addItems&id=${book.id}&max=${param.maxPrice}&min=${param.minPrice}&pageNo=${requestScope.pageNo}">--%>
                                <img src="/imgs/buyCar.jpg" width="30px" height="25px" title="加入购物车" alt="加购" class="carImg"/></div>
                    </div>
<%--                    <c:out value="${count.count}"/>--%>
                </td>
                     <c:if test="${count.count==num}">
                        </tr><tr>
                        <c:set var="num" value="${num+4}"/>
                        </c:if>
                </c:forEach>
                </tr>
        </table>
    </div>
</div>



<jsp:include page="/include/paging.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function () {
        var mathImg=$("#mathImg");
        var val=0;
        setInterval(function () {
            if (${empty sessionScope.user}){//如果用户为空，购物车图片上数字变为0
                mathImg.text(0);
            }
            else if(val==0){
                //用户不为空,但是val=0时，即页面刚初始化，用户还未点击加购按钮，此时购物车上0件商品
                //或者刷新页面时，调用session里面cart的totalCount方法
                mathImg.text(${sessionScope.cart.totalCount});
            }else {//用户点击了加购按钮，购物车图片上数字变为当前购买的商品数
                mathImg.text(val);
            }
        },10);

        var dv1=document.getElementById("buyCar1");
        window.onscroll=divMove;


        function divMove(){
            var arr=getScroll();
            // if (arr[0]>0){
            //     $("#buyCar1").show();
            // }
            dv1.style.top=200+arr[0];
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

        //购物车按钮
        $("#AnImg").click(function () {
            // alert("ain")
            window.location.href="/BookCityProject/buyCar/showCart.jsp";
        })
        //查看订单按钮
        $("#lookOrder").click(function () {
            // alert("ain")
            window.location.href="/BookCityProject/order?action=showOrderByUserId";
        })
        // 搜索框按钮
        $("#search").click(function () {
            var input=$(this).parent().find("input:first");
            var name=input.val();
            // alert(name);
            window.location.href="/BookCityProject/page?action=searchByName&name="+name;
        })

        //搜索输入框获得焦点  发送ajax请求
        $(".carImg").click(function () {
            //这两个dom对象不能放在xmlhttp.onreadystatechange=function ()函数里面
            //因为在该函数里面，this对象不是上面单击事件的对象
            var inpt=$(this).parent().parent().parent().find("input:first");
            var add=$(this).parent().parent().parent().find("div:has(span)").children();
            var id=inpt.val();
            var xmlhttp=new XMLHttpRequest();
            xmlhttp.open("GET","/BookCityProject/buyCart?action=addItems&id="+id,true);
            xmlhttp.onreadystatechange=function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    //使用正则表达式判断是否为服务器响应的字符串
                    var jude=/\w{1,8}\d+/;
                    if (${empty sessionScope.user}){
                        window.location.href="/BookCityProject/login.jsp";
                    }
                    // else if (jude.test(xmlhttp.responseText)){
                        add.show();
                        //使用正则表达式截图字符串中的数字
                        val=xmlhttp.responseText.match(/\d+/);
                        setTimeout(function () {
                            add.hide();
                        }, 500);
                    // }
                }
            }
            xmlhttp.send();
        })

    })
</script>
</html>

