<jsp:useBean id="books" class="com.pojo.Book"/>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/13
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员操作页面</title>
<%--    <c:out value="123"/>--%>
    <style>
        table td{
            text-align: center;
            width: 150px;
            height: 36px;
        }
    </style>
</head>
<body>
<%--${hello}--%>
<%--${requestScope.pageNo}--%>
<%--<form action="/BookCityProject/page" method="post">--%>
<%--    <input type="hidden" name="action" value="ShowBooks">--%>
<%--    <input type="submit" value="提交">--%>
<%--</form>--%>
<table style="margin: auto;" id="tb">
    <tr class="head" style="background-color: darkcyan">
        <td>书名</td>
        <td>价格</td>
        <td>作者</td>
        <td>销量</td>
        <td>库存</td>
        <td>操作</td>
    </tr>
<%--    <%=${}%>--%>
    <c:forEach items="${requestScope.page.items}" var="book">
    <tr>
<%--&lt;%&ndash;        <td>${empty book?"null":book}</td>&ndash;%&gt;--%>
        <td>${book.name}</td>
        <td>${book.price}</td>
        <td>${book.author}</td>
        <td>${book.sales}</td>
        <td>${book.stock}</td>
    <td><a href="/BookCityProject/page?action=alterBook&id=${book.id}&pageNo=${requestScope.pageNo}">修改</a>&nbsp;<span>|</span>&nbsp;
        <a href="/BookCityProject/page?action=removeBook&id=${book.id}&pageNo=${requestScope.pageNo}">删除</a>
    </td>
    </tr>
    </c:forEach>
    <c:if test="${requestScope.page.pageTotal==requestScope.pageNo}">
        <tr>
            <td  colspan="6" align="center" style="background-color: lavender;">
                <a href="/BookCityProject/page?action=addBook&pageNo=${requestScope.pageNo}&method=add" style="text-decoration:none;">添加商品</a>
            </td>
        </tr>
    </c:if>
</table>






<div style="height: 30px;width:100%;margin: 100px auto; position: relative;">
    <div id="div1" style="height: 30px;width:470px; margin:auto; position: relative;" >
        <c:if test="${requestScope.pageNo!=1}">
            <a href="/BookCityProject/page?action=ShowBooks&pageNo=1">首页</a>
        </c:if>
        &nbsp;
<%--        上一页--%>
<%--        判断是否为第一页，若为第一页，则该超链接不可点击--%>
        <c:if test="${requestScope.pageNo-1>=1}">
<a href="/BookCityProject/page?action=ShowBooks&pageNo=${requestScope.pageNo-1}">上一页</a>
        </c:if>
         <c:if test="${requestScope.pageNo-1<1}">
<a>上一页</a>
         </c:if>
    <span>&nbsp;&nbsp;</span>


<%--    显示页--%>
    <c:choose>
        <c:when test="${requestScope.pageNo<=3}">
            <c:set var="begin" value="1"/>
            <c:set var="end"   value="3"/>
        </c:when>
        <c:when test="${3<requestScope.pageNo&&requestScope.pageNo<=requestScope.page.pageTotal-3}">
            <c:set var="begin" value="${requestScope.pageNo-1}"/>
            <c:set var="end"   value="${requestScope.pageNo+1}"/>
        </c:when>
        <c:when test="${requestScope.pageNo>requestScope.page.pageTotal-3}">
            <c:set var="begin" value="${requestScope.page.pageTotal-2}"/>
            <c:set var="end"   value="${requestScope.page.pageTotal}"/>
        </c:when>
    </c:choose>


    <c:forEach begin="${begin}" end="${end}"  step="1" var="i">
        <%--        传pageNo参数，根据pageNo查询指定页面的数据--%>
        &nbsp;
        <c:choose>
            <%--            判断是否为当前页。若为当前页，则不可点击，并且修改样式--%>
            <c:when test="${requestScope.pageNo==i}">
                [${i}]
            </c:when>
            <%--            不为当前页则添加超链接--%>
            <c:otherwise>
                <a href="/BookCityProject/page?action=ShowBooks&pageNo=${i}"; style="text-decoration: none;">${i}</a>
            </c:otherwise>
        </c:choose>
        &nbsp;
    </c:forEach>

<%--    下一页--%>
    <span>&nbsp;&nbsp;</span>
    <c:if test="${requestScope.pageNo+1<=requestScope.page.pageTotal}">
<a href="/BookCityProject/page?action=ShowBooks&pageNo=${requestScope.pageNo+1}">下一页</a>
    </c:if>
    <c:if test="${requestScope.pageNo+1>requestScope.page.pageTotal}">
        <a>下一页</a>
    </c:if>
    &nbsp;
    <c:if test="${requestScope.pageNo!=requestScope.page.pageTotal}">
    <a href="/BookCityProject/page?action=ShowBooks&pageNo=${requestScope.page.pageTotal}">末页</a>
    </c:if>
    &nbsp;
    <input name="search" id="search" style="width: 30px;height: 20px;">页
    &nbsp;
        共${requestScope.page.pageTotal}页
    </div>
<%--    ${3<requestScope.pageNo<=requestScope.page.pageTotal-3}--%>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $("#search").blur(function () {
        if (this.value>${requestScope.page.pageTotal}){
            this.value=${requestScope.page.pageTotal};
        }else if (this.value<1){
            this.value=1;
        }
        var num=this.value;
        window.location="/BookCityProject/page?action=ShowBooks&pageNo="+num;
    });
    $("#tb tr:odd").css("background-color","bisque");
    $("#tb tr:even:not(.head)").css("background-color","aqua");

</script>
</html>
