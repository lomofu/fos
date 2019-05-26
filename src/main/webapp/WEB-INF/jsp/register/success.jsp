
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/success/success.css">
</head>
<body>
<div class="layui-icon layui-icon-ok layui-anim layui-anim-up" id="success"></div>
<hr class="layui-anim layui-anim-fadein" >
<h1 class="layui-anim layui-anim-up" >注册成功！</h1>
<div  class="layui-anim layui-anim-fadein" id="welcome">开启你的电影评论之旅吧!<br></div>
<div id="info" class="layui-anim layui-anim-fadein"></div>



<script type="text/javascript">
    var num = 3; //倒计时的秒数
    var URL = "${pageContext.request.contextPath}/index.jsp";
    var id = window.setInterval('doUpdate()', 1000);
    function doUpdate() {
        document.getElementById('info').innerHTML = '将在'+num+'秒后自动跳转到首页!' ;
        if(num == 0) {
            window.clearInterval(id);
            window.location = URL;
        }
        num --;
    }
</script>


    </body>
</html>
