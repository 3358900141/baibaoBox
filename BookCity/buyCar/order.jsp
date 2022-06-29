<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/17
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <style>
        /*table tr td{*/
        /*    width: 260px;*/
        /*    height: 36px;*/
        /*    font-size: 20px;*/
        /*    font-family: 幼圆;*/
        /*}*/
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
        table tr td a{
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: lavender;">
<button style="height: 30px;width: 100px;border-top-left-radius: 15px;border-bottom-left-radius: 15px;" id="backIndex">返回首页</button>
<table style="margin:10px auto;">
    <th style="width:500px;height:20px;font-family: 幼圆;font-size: 30px;color: green;text-align: center;">
        用户<span style="color: coral">${sessionScope.user.username}</span>&nbsp;的订单页
    </th>
<%--    <tr>--%>
<%--        <td colspan="5"><hr/></td>--%>
<%--    </tr>--%>
    <c:forEach var="order" items="${requestScope.orders}">
        <tr>
        <tr>
            <td>
                <span>&nbsp;订单编号 :${order.orderId}</span>
                <br>
                <span>&nbsp;创建时间:${order.createTime}</span>
                <br>
                <span>&nbsp;总金额:${order.price}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                <bu>&nbsp;物流状态:<input type="hidden" value="${order.orderId}">
                    <c:if test="${order.status==1}">
                        <span style="color:orange">未发货</span>
                    </c:if>
                    <c:if test="${order.status==2}">
                        <span style="color:orange">已发货</span>
                    </c:if>
                    <c:if test="${order.status==3}">
                        <span style="color:orange">已签收</span>
                    </c:if>
                    <c:if test="${order.status!=3}">
<%--                    <a href="/BookCityProject/order?action=changOrderStatus&orderId=&status=3" class="changOrderStatus">--%>
                    <button style="font-size: 10px;color: red;border: none;background-color: white" class="changOrderStatus">已签收?</button>
<%--                        </a>--%>
                    </c:if>
                </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--                <span>&nbsp</span>--%>
                <span>&nbsp;<a href="/BookCityProject/order?action=showOrderItemsDetails&orderId=${order.orderId}">订单详情》</a></span>
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
        // setTimeout(function () {
        //     window.location.href="http://localhost:8080/BookCityProject/buyCar/showCart.jsp";
        // },2000);
        $(".LogisticsStatus").change(function () {
            var chan=$(this).find("option:selected");
            var i=$(this).parent().parent().find("td:first");
            alert(i.text());
            alert(chan.text())
        })
        $("#backIndex").click(function () {
            window.location.href="/BookCityProject/page?action=Goods";
        })

        $(".changOrderStatus").click(function () {
            var order=$(this).parent().find("input:first");
            var orderId=order.val();
            if(confirm("一旦确认便不可更改，确认已签收吗？")){
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.open("GET","/BookCityProject/order?action=changOrderStatus&status=3&orderId="+orderId,true);
                xmlhttp.onreadystatechange=function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        location.reload();
                    }
                }
                xmlhttp.send();
            }
        })

    })
</script>
</html>
