
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未登录...</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nologin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
</head>
<body class="layui-anim layui-anim-upbit">

<div class="wrapper">
    <div class="swing">
        <div class="human">
            <div class="top-part">
                <div class="head">
                    <div class="hair"></div>
                    <div class="fringe"></div>
                    <div class="eye"></div>
                    <div class="mouth"></div>
                </div>
                <div class="body">
                    <div class="hand">
                        <div class="hand-one"></div>
                        <div class="hand-two"></div>
                    </div>
                </div>
            </div>
            <div class="leg-one"></div>
            <div class="leg-two"></div>
        </div>
        <div class="swing-rod"></div>
        <div class="bottom"></div>
    </div>
    <div class="pole one"></div>
    <div class="pole two"></div>
</div>
<h1 style="font-size: 50px;color: #555555">你还没登录哦...</h1>
<a style="color: white" href="/filmos"><button class="layui-btn layui-btn-radius" id="back" style="position:absolute;top:43%;left: 56%;width: 180px">知道啦！回到主页</button></a>
</body>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
</html>
