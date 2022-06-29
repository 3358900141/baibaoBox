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
    <title>首页</title>
</head>
<body>
<%
    String pageNo = request.getParameter("pageNo");
    request.setAttribute("pageNo",pageNo);
    request.getRequestDispatcher("/page?action=GoodsByPrice").forward(request,response);
%>

</body>
</html>
