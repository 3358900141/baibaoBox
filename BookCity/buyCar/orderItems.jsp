<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/22
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <style>
        table tr td{
            border-radius: 10px;
            width:500px;height:100px;background-color: white;
            font-size: 20px;
            font-family: 幼圆;
            color: darkcyan;
            line-height: 36px;
        }
        table tr{
            display: block;
            border-spacing:20px;
        }
    </style>
</head>
<body style="background-color: antiquewhite;">
<button style="height: 30px;width: 100px;border-top-left-radius: 15px;border-bottom-left-radius: 15px;" id="back">返回</button>
<table style="margin:0px auto">
        <th style="width:500px;height:20px;font-family: 幼圆;font-size: 30px;color: green;text-align: center;">
            订单<span style="color: orange">${requestScope.orderId}</span>的商品信息
        </th>
    <c:forEach var="orderItem" items="${requestScope.orderItems}">
    <tr>
        <td>
            <span>&nbsp;订单编号 :${orderItem.orderId}</span>
            <br>
            <span>&nbsp;${orderItem.name}</span>
            <br>
            <span>&nbsp;单价:${orderItem.price}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span>&nbsp;数量:${orderItem.count}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span>&nbsp;总价:${orderItem.totalPrice}</span>
            <br>
            <span style="font-size: 10px">&nbsp;*发货时间一般在付款后48小时，实际以地区为准</span>
        </td>
    </tr>
    </c:forEach>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function () {
        $("#back").click(function () {
            window.history.back();
        })
    })
</script>
</html>
