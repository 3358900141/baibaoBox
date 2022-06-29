<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/17
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="height: 30px;width:100%;margin: 100px auto; position: relative;">
    <div id="div1" style="height: 30px;width:600px; margin:auto; position: relative;" >
        <c:if test="${requestScope.pageNo!=1}">
            <a href="${requestScope.page.url}&pageNo=1">首页</a>
        </c:if>
        &nbsp;
        <c:if test="${requestScope.pageNo-1>=1}">
            <a href="${requestScope.page.url}&pageNo=${requestScope.pageNo-1}">上一页</a>
        </c:if>
        <c:if test="${requestScope.pageNo-1<1}">
            <a>上一页</a>
        </c:if>
        <span>&nbsp;&nbsp;</span>



        <%--    显示页--%>
        <c:choose>
            <c:when test="${requestScope.pageNo<=3&&requestScope.page.pageTotal<=3}">
                <c:set var="begin" value="1"/>
                <c:set var="end"   value="${requestScope.page.pageTotal}"/>
            </c:when>
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


<%--        变量i从begin开始--%>
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
                    <a href="${requestScope.page.url}&pageNo=${i}"; style="text-decoration: none;">${i}</a>
                </c:otherwise>
            </c:choose>
            &nbsp;
        </c:forEach>

        <%--    下一页--%>
        <span>&nbsp;&nbsp;</span>
        <c:if test="${requestScope.pageNo+1<=requestScope.page.pageTotal}">
            <a href="${requestScope.page.url}&pageNo=${requestScope.pageNo+1}">下一页</a>
        </c:if>
        <c:if test="${requestScope.pageNo+1>requestScope.page.pageTotal}">
            <a>下一页</a>
        </c:if>
        &nbsp;
        <c:if test="${requestScope.pageNo!=requestScope.page.pageTotal}">
            <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a>
        </c:if>
        &nbsp;
        <input id="searchPage" style="width: 30px;height: 20px;">页
        &nbsp;
        共${requestScope.page.pageTotal}页
    </div>
    <%--    ${3<requestScope.pageNo<=requestScope.page.pageTotal-3}--%>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function () {
        $("#searchPage").blur(function () {
            if (this.value>${requestScope.page.pageTotal}){
                this.value=${requestScope.page.pageTotal};
            }else if (this.value<1){
                this.value=1;
            }
            var num=this.value;
            window.location="${requestScope.page.url}&pageNo="+num;
        });
    })
</script>
