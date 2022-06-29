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
    <title>生成订单</title>
</head>
<body>
<table style="margin:200px auto;">
    <tr>
        <td style="width:500px;height: 50px;">订单已完成，订单号:<span style="color: darkviolet;">${requestScope.orderId}</span></td>
    </tr>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            window.location.href="/BookCityProject/order?action=showOrderByUserId";
        },2000);
    })
</script>
</html>
