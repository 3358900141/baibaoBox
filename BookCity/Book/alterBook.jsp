<%--
  Created by IntelliJ IDEA.
  User: 33589
  Date: 2022/4/18
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改图书页面</title>
    <style>
        body{
            background-color: #e0e0e0;
        }
        table td{
            text-align: center;
            width: 260px;
            height: 36px;
        }
        table td input{
            border: 0;
            border-bottom:1px solid green;
            width: 250px;
            height: 30px;
        }
        table td button{
            width: 150px;
            height: 30px;
            border: 0;
            border-radius: 48px;
            background: #e0e0e0;
            box-shadow:  7px 7px 14px #656565,
            -7px -7px 14px #ffffff;
        }
    </style>
</head>
<body>
<%--<form action="/BookCityProject/page?action=addBook&method=other&pageNo=${requestScope.pageNo}" method="post" id="fom">--%>
<form action="/BookCityProject/page?action=alterBooks&pageNo=${requestScope.pageNo}&id=${requestScope.book.id}" method="post" id="fom">
    <table style="margin: auto;" id="tb">
        <tr class="head" style="background-color: darkcyan">
            <td>书名</td>
            <td>价格</td>
            <td>作者</td>
            <td>销量</td>
            <td>库存</td>
            <td>操作</td>
        </tr>
        <tr style="height: 10px"></tr>
        <tr>
            <td><input name="name" id="name" value="${requestScope.book.name}"></td>
            <td><input name="price" id="price" value="${requestScope.book.price}"></td>
            <td><input name="author" id="author" value="${requestScope.book.author}"></td>
            <td><input name="sales" id="sales" value="${requestScope.book.sales}"></td>
            <td><input name="stock" id="stock" value="${requestScope.book.stock}"></td>
            <td><button type="button" id="butn">添加</button></td>
        </tr>
        <tr>
            <td></td>
            <td><span style="display: none; font-size: 10px; color: red;" id="sPrice">输入格式有误！</span></td>
            <td></td>
            <td><span style="display: none; font-size: 10px; color: red;" id="sSales">输入格式有误！</span></td>
            <td><span style="display: none; font-size: 10px; color: red;" id="sStock">输入格式有误！</span></td>
        </tr>
    </table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function (){
        var iput=$("#tb tr:not(.head) td input");
        iput.focus(function () {
            iput.css("font-size","17px","font-family","宋体")
        })
        var but=$("#tb tr:not(.head) td button");

        //获取表单输入的元素
        var name = $("#name");
        var price=$("#price");
        var author=$("#author");
        var sales = $("#sales");
        var stock=$("#stock");
        //检验价格的正则表达式
        var tPrice=/^(([0-9])|([1-9]([0-9]{1,8}))|([1-9]([0-9]{1,4}))((\.?)([0-9]{1,2})))$/;
        //检验销量库存的正则表达式
        var tStock=/^(([0-9])|([1-9]([0-9]{1,8})))$/;
        but.click(function () {
            but.css("box-shadow","39px 39px 66px #bebebe, -39px -39px 66px #ffffff")

            if (!tPrice.test(price.val())){
                addCss(price,"#sPrice");
                return;
            }
            if (!tStock.test(sales.val())){
                addCss(sales,"#sSales");
                return;
            }
            if (!tStock.test(stock.val())){
                addCss(stock,"#sStock");
                return;
            }
            //表单提交
            $("#fom").submit();
        })

        function addCss(target,name) {
            target.css("border-bottom","2px solid red");
            target.css("box-shadow","0px 5px 10px -5px red");
            $(name).show();
            setTimeout(function () {
                but.css("box-shadow","");
                target.css("border-bottom","");
                target.css("box-shadow","");
                $(name).hide();
            },3000);
        }
    })
</script>
</html>
