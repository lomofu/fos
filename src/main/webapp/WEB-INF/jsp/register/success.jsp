
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
<<<<<<< HEAD
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/success/success.css">
</head>
<body>
<div class="layui-icon layui-icon-ok layui-anim layui-anim-up" id="success"></div>
<hr class="layui-anim layui-anim-fadein" >
<h1 class="layui-anim layui-anim-up" >注册成功！</h1>
<div  class="layui-anim layui-anim-fadein" id="welcome">开启你的电影评论之旅吧!<br></div>
<div id="info" class="layui-anim layui-anim-fadein"></div>
=======
</head>
<body>
<div class="layui-icon layui-icon-ok layui-anim layui-anim-up" style="font-size:100px;position: absolute;left: 45%;top: 30%"></div>
<hr class="layui-anim layui-anim-fadein" style="position: absolute;top: 48%;width: 50%;left: 20%">
<h1 class="layui-anim layui-anim-up" style="position: absolute;left: 44%;top: 55%">注册成功！</h1>
<div  class="layui-anim layui-anim-fadein" style="position: absolute;left: 43%;top: 60%;color: grey">开启你的电影评论之旅吧!<br></div>
<div id="info" class="layui-anim layui-anim-fadein" style="position: absolute;left: 43%;top: 62%;color: grey"></div>
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7



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
