<%@ page import="com.pojo.Cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/19
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int size=0;
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    if (cart!=null)
        size=cart.getItem().size();
    request.getSession().setAttribute("size",size);
%>
<html>
<head>
    <title>我的购物车</title>
    <meta http-equiv="refresh" content="5">
    <style>
        body{
            background-color: #e0e0e0;
        }
        #bigBox{
            width:1000px;
            height:${sessionScope.size*30+500}px;
            margin:0 auto;
            background-color: white;
            border-radius: 2%;
        }
        #ender{
           height: 60px;
        }
        #bigBox table tr td{
            width: 200px;
            text-align: center;
            font-size: 20px;
            font-family: 华文宋体;
        }
        #bigBox table {
            width: 90%;
            margin: 50px auto;
            /*border: solid 1px black*/
        }
        button{
            height: 50px;
            width: 120px;
            background-color: coral;
            position: relative;
            border-radius: 60px;
            border: 0;
        }
        .updateCont{
            width: 36px;height: 20px;border: 0;border-bottom: black solid 1px;text-align:center;
        }
    </style>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<body>
<div id="bigBox">
    <div style="width:60%;height:20px;background-color: #ac2e9d;margin:0px auto;"></div>
    <br>
    <div style="width: 100%;height: 50px;">
    <span style="display: block;left:400px;position: relative;font-size: 26px;font-family: 幼圆;color: coral;">当前购物车共<span style="color:
orangered">
        <c:if test="${empty sessionScope.cart.totalCount}" var="empt">
            <c:out value="0" />
        </c:if>
        <c:if test="${!empt}">
            ${sessionScope.cart.totalCount}
        </c:if>
    </span>件宝贝</span>
        <c:if test="${not empty sessionScope.cart.item}">
        <a href="/BookCityProject/buyCart?action=clearItems" style="position: relative;float: right;right: 20px;font-size: 20px;color: orange" id="clear">
            清空购物车</a>
        </c:if>
    </div>
    <hr>
<%--    ${sessionScope.cart.item.size()}--%>

<%--    ${sessionScope.cart.price}--%>
    <table>
        <tr style="font-family: 幼圆;font-size: 26px;font-weight: bolder;">
            <td>商品名称</td>
            <td>单价</td>
            <td>数量</td>
            <td>金额</td>
            <td>操作</td>
        </tr>

            <c:if test="${empty sessionScope.cart.item}">
                <tr style="height: 100px;"></tr>
        <tr>
                <td colspan="5">
                    <a href="/BookCityProject/page?action=Goods" style="text-decoration: none;">
                        <span style="font-family: 幼圆;font-size: 26px;color: chocolate">当前购物车空空如也，快去<span style="color: red;font-weight: bolder;">抢购</span>吧！</span>
                    </a>
                </td>
        </tr>
            </c:if>
        <c:forEach items="${sessionScope.cart.item}" var="cartItem">
        <tr>
            <td>${cartItem.value.name}</td>
            <td>${cartItem.value.price}</td>
            <td><input type="hidden" value="${cartItem.value.id}"><input value="${cartItem.value.count}" class="updateCont" />
                <span style="font-size: 10px;color: red;display: none;" class="sHint">购买的最大数量100</span></td>
            <td>${cartItem.value.totalPrice}</td>
            <td><a href="/BookCityProject/buyCart?action=removeItems&id=${cartItem.value.id}" class="delete" >移除</a>&nbsp;| &nbsp;
                选择<input type="checkbox" checked="checked" disabled="disabled"></td>
        </tr>

        </c:forEach>
        <tr>
            <td colspan="5"><button style="top:120px;right:320px;background-color: coral; " id="backShop">返回购物</button>
                <button style="top:120px;left:320px;font-size: 20px;" id="account">结算:<span style="font-size: 16px">
                    <c:set var="price" value="${sessionScope.cart.price}"/>
                    <c:if test="${price>=10000}">
                        ${price/10000}万
                    </c:if>
                    <c:if test="${price<=10000}">
                        ${price}
                    </c:if>
                </span></button></td>
        </tr>

    </table>
</div>
<%--<div id="ender"></div>--%>
</body>
<script type="text/javascript">

    $(function () {
        var backShop=$("#backShop");
        backShop.click(function () {
            window.location.href="/BookCityProject/page?action=Goods";
        })

        // 当商品发生改变时，返回到服务器更新商品数量
        $(".updateCont").change(function () {
            var value=this.value;
            //获取隐藏域中的id值
            var id=$(this).parent().find("input:first").val();
            //若数量超过最大购买数量100
            if (value>100){
                value=100;//则数量为100
                this.value=value;
                var span=$(this).parent().find("span:first");//获取提示元素
                    span.show();//输出提示信息
                setTimeout(function () {
                    span.hide();//一秒后提示信息消失
                },1000);
            }
            else
                window.location.href = "/BookCityProject/buyCart?action=updateItems&id=" + id + "&count=" + value;
        })

        //删除商品
        $(".delete").click(function () {
            //通过获取当前对象父元素的父元素的第一个td元素来获取商品名称,this代表当前单击的对象，若为$(".calss"),则代表一个数组
            return confirm("确认要将【"+$(this).parent().parent().find("td:first").text()+"】移除购物车吗？");
        })

        //清空购物车
        $("#clear").click(function () {
            return confirm("确认要清空购物车吗?");
        })

        //结算
        $("#account").click(function () {
            if (${sessionScope.cart.price>0}){
                // location.reload();
                window.location.href = "/BookCityProject/order?action=createOrder";
            }
        })
    })
</script>

</html>
