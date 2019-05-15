<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Movie</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css">
    <html>
<body>
<!--加载导航栏-->
<div id="nav"></div>

<!--加载页面主题-->
<div class="layui-container" id="container">
    <div class="layui-fluid">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>许闲心</td>
                <td>2016-11-28</td>
                <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<%--<script !src=""></script>--%>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>


<script type="text/javascript">
    $ = layui.$
    ;!function () {
        $(function () {
            //调用ajax实现页面的局部刷新,将iframe的页面加载出来
            $("#nav").load("movietype/nav");
        });
    }();
</script>
</body>
</html>

