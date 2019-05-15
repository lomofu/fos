<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
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
        <div class="layui-carousel layui-anim layui-anim-fadein" id="headline">
            <div carousel-item>
                <div><img src="resources/images/headline/1.jpg" ></div>
                <div><img src="resources/images/headline/2.jpg" ></div>
                <div><img src="resources/images/headline/3.jpg" ></div>
                <div><img src="resources/images/headline/4.jpg" ></div>
            </div>
        </div>
    </div>
</div>




<%--<script !src=""></script>--%>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>

<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#headline'
            , width: '100%' //设置容器宽度
            , height: '580px'//设置容器高度
            , arrow: 'hover' //始终显示箭头
            , indicator: 'none'//指示器不显示
            , anim: 'fade' //切换动画方式
        });
    });
</script>

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
