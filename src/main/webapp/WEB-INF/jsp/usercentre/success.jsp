
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/success/success.css">
</head>
<body>
<div id="success" class="layui-icon layui-icon-ok-circle layui-anim layui-anim-up" ></div>
<hr class="layui-anim layui-anim-fadein" >
<h1 class="layui-anim layui-anim-up" >修改成功！</h1>
<div id="info" class="layui-anim layui-anim-fadein" ></div>



<script type="text/javascript">
    var num = 2; //倒计时的秒数
    var URL = "${pageContext.request.contextPath}/userinfo";
    var id = window.setInterval('doUpdate()', 1000);
    function doUpdate() {
        document.getElementById('info').innerHTML = '将在'+num+'秒后自动返回!' ;
        if(num == 0) {
            window.clearInterval(id);
            window.location = URL;
        }
        num --;
    }
</script>


</body>
</html>
