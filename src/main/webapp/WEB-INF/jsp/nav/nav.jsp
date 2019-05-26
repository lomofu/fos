<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav/nav.css">
</head>
<body>

<ul class="layui-nav">
<<<<<<< HEAD
<%--    首页--%>
    <li class="layui-nav-item layui-this"><a href="index.jsp">首页</a></li>
<%--    分类--%>
    <li class="layui-nav-item">
        <a href="javascript:;">分类</a>
<%--    分类列表--%>
=======
    <li class="layui-nav-item layui-this"><a href="index.jsp">首页</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">分类</a>
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
        <dl id="moivetype" class="layui-nav-child">
            <dd><a href=""></a></dd>
        </dl>
    </li>
<%--资讯--%>
    <li class="layui-nav-item"><a href="">资讯</a></li>
<%--电影库--%>
    <li class="layui-nav-item"><a href="">电影库</a></li>

<<<<<<< HEAD
<%--    登录--%>
    <li id="tourist" class="layui-nav-item" >
=======
    <li id="tourist" class="layui-nav-item" style="position:absolute;right: 360px;top:0px;display: block">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
        <button id="login" class="hvr-pulse-grow layui-btn layui-btn-radius layui-btn-normal "
                style="width: 50px;">
            登录
        </button>
    </li>
<<<<<<< HEAD
<%--    注册--%>
    <li id="tourist1" class="layui-nav-item" >
=======
    <li id="tourist1" class="layui-nav-item" style="position:absolute;right:300px;top: 0px;display: block">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
        <button id="register" class="hvr-pulse-grow layui-btn layui-btn-radius layui-btn-warm "
                style="width: 50px;">注册
        </button>
    </li>
<%--    搜索--%>
    <li class="layui-nav-item" id="search-card">
        <div id="search" class="layui-icon layui-icon-search hvr-pulse-grow" ></div>
    </li>
<<<<<<< HEAD
    <li class="layui-nav-item" id="customer1" >
        <%--style="display: none;position: absolute!important;top: 0px!important;right: 200px!important;">--%>
        <a><img src="/img/${user.userImg}" class="layui-nav-img">
=======
    <li class="layui-nav-item" id="customer1" style="display: block;position: absolute;top: -5px;right: 176px;">
        <%--style="display: none;position: absolute!important;top: 0px!important;right: 200px!important;">--%>
        <a href=""><img src="/img/1.jpg" class="layui-nav-img">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
            <%--style="position: absolute!important;top: 7px!important;right: 80px!important;"--%>
            <span style="position: absolute;top: 7px;right: 80px;font-size: 18px;">${user.userName}</span>
        </a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/centre">个人中心</a></dd>
<<<<<<< HEAD
            <dd><a href="${pageContext.request.contextPath}/userinfo">修改信息</a></dd>
=======
            <dd><a href="${pageContext.request.contextPath}/info">修改信息</a></dd>
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
            <dd><a id="quit" style="cursor: pointer">退出登录</a></dd>
        </dl>
    </li>


</ul>
<<<<<<< HEAD
<%--搜索框--%>
<div id="search-bar" >
=======

<div id="search-bar" style="display: none;z-index: 998">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <div class="layui-input-block" id="search-input">
                <input id="search-bar-text" type="text" name="search" placeholder="搜索电影..." class="layui-input">
            </div>
        </div>
    </form>
</div>

<%--    登录页--%>
<div id="background" class="layui-anim" style="display: none">
    <div id="login-body" style="position: relative">
        <div id="close" class="hvr-buzz-out layui-icon layui-icon-close" style="cursor: pointer"></div>
        <div id="user" class="layui-icon layui-icon-username "></div>
        <h2>登录</h2>
        <br><br><br><br>
<<<<<<< HEAD
<%--    登录表单--%>
        <form id="form" class="layui-form" method="post">
=======
        <form id="form" class="layui-form" style="padding-top: 100px!important;" method="post">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input id="login-user" type="text" name="login-user" required lay-verify="required"
                           placeholder="请输入用户名或邮箱或手机"
<<<<<<< HEAD
                           autocomplete="off" class="hvr-glow layui-input">
=======
                           autocomplete="off" class="hvr-skew-forward layui-input">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input id="login-password" type="password" name="login-password" required lay-verify="required"
                           placeholder="请输入密码"
<<<<<<< HEAD
                           autocomplete="off" class="hvr-glow layui-input">
=======
                           autocomplete="off" class="hvr-skew-forward layui-input">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                </div>
            </div>
            <br><br>
            <div class="layui-form-item" id="submit">
                <div class="layui-input-block ">
<<<<<<< HEAD
                    <button type="button" class="layui-btn" lay-submit lay-filter="login1" id="submit-yes">登录</button>
=======
                    <button class="layui-btn" lay-submit lay-filter="login1" id="submit-yes">登录</button>
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                </div>
            </div>
            <div class="layui-form-item" id="rem">
                <label class="layui-form-label"><span style="color: #555555">记住我?</span></label>
                <div class="layui-input-block">
                    <input type="checkbox" name="switch" lay-skin="switch">
                </div>
            </div>
        </form>
    </div>
</div>

<%--layui-icon-file--%>
<%--    注册页--%>
<div id="background1" class="layui-anim layui-anim-scaleSpring" style="display: none">
    <div id="register-body" style="position: relative">

        <div id="close1" class="hvr-buzz-out layui-icon layui-icon-close" style="cursor: pointer"></div>
        <h1>注册</h1>
        <div id="progress-bar" class="layui-progress">
            <div id="progress-bar-inside" class="layui-progress-bar" lay-percent="1/2"></div>
        </div>
<<<<<<< HEAD
        <div id="front" class="layui-icon layui-icon-left hvr-backward" ></div>
        <div id="text" ><h4>欢迎加入，Assessment社区！</h4></div>
        <div id="text1" ><h6>首先你需要完善一些个人资料，<br/>填写完成后点击下一步哦!</h6></div>
        <div id="text2"><h6>加油，<br/>还差一步!</h6></div>
        <form id="form1" class="layui-form" method="post" onsubmit="return false">
=======
        <div id="front" class="layui-icon layui-icon-left hvr-backward" style="display: none;cursor: pointer"></div>
        <div id="text" style="color:grey;"><h4>欢迎加入，Assessment社区！</h4></div>
        <div id="text1" style="color:grey;display: block"><h6>首先你需要完善一些个人资料，<br/>填写完成后点击下一步哦!</h6></div>
        <div id="text2" style="color:grey;display: block"><h6>加油，<br/>还差一步!</h6></div>
        <form id="form1" class="layui-form" style="padding-top: 100px!important;" method="post" onsubmit="return false">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
            <div id="firstinfo">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input id="user-name" type="text" name="userName" lay-verify="required" placeholder="请输入用户名"
<<<<<<< HEAD
                               autocomplete="off" class="hvr-glow layui-input">
=======
                               autocomplete="off" class="hvr-skew-forward layui-input">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block ">
<<<<<<< HEAD
                        <select id="sex" name="sex" lay-verify="required" class="hvr-glow">
=======
                        <select id="sex" name="sex" lay-verify="required">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                            <option id="none" value="0">未知</option>
                            <option id="boy" value="1">男</option>
                            <option id="girl" value="2">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input id="age" type="text" name="age" lay-verify="required|number" placeholder="请输入年龄"
<<<<<<< HEAD
                               autocomplete="off" class="layui-input hvr-glow">
=======
                               autocomplete="off" class="layui-input hvr-skew-forward">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input id="email" type="text" name="email" lay-verify="required" placeholder="请输入邮箱"
<<<<<<< HEAD
                               autocomplete="off" class="layui-input hvr-glow">
=======
                               autocomplete="off" class="layui-input hvr-skew-forward">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input id="phone" type="text" name="phone" lay-verify="required" placeholder="请输入电话号码"
<<<<<<< HEAD
                               autocomplete="off" class="layui-input hvr-glow">
=======
                               autocomplete="off" class="layui-input hvr-skew-forward">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>
            </div>

            <div id="secondinfo" >
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input id="password" type="password" name="password" lay-verify="required" placeholder="请输入密码"
<<<<<<< HEAD
                               autocomplete="off" class="hvr-glow layui-input">
=======
                               autocomplete="off" class="hvr-skew-forward layui-input">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input id="repassword" type="password" name="repassword" lay-verify="required"
                               placeholder="请再次输入密码"
<<<<<<< HEAD
                               autocomplete="off" class="hvr-glow layui-input">
=======
                               autocomplete="off" class="hvr-skew-forward layui-input">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上传头像</label>
                    <div class="layui-input-block">
                        <input id="userImg" type="file" name="userImg"
<<<<<<< HEAD
                               class="layui-input hvr-glow layui-icon layui-icon-upload" style="cursor: pointer">
=======
                               class="layui-input hvr-skew-forward layui-icon layui-icon-upload">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                    </div>
                </div>
            </div>
            <div class="layui-form-item" id="submit1">
                <div class="layui-input-block">
<<<<<<< HEAD
                    <button type="button" class="layui-btn hvr-pulse-grow" lay-submit lay-filter="reg" id="submit-yes1"
=======
                    <button class="layui-btn hvr-pulse-grow" lay-submit lay-filter="reg" id="submit-yes1"
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                            style="display: none">提交
                    </button>
                    <br><br>
                    <button type="reset" class="layui-btn layui-btn-danger hvr-wobble-skew" id="submit-no">重置</button>
                </div>
            </div>
<<<<<<< HEAD
            <div id="next" class="layui-btn" >下一步</div>
=======
            <div id="next" class="layui-btn" style="display: block">下一步</div>
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
        </form>


    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/md5.min.js"/>
<script>
    //# sourceURL=dynamicScript.js
    var form = layui.form;
    //登录表单监听
    form.on('submit(login1)', function (data) {
        var loginusername = $('#login-user').val();
        console.log(loginusername);
        var loginpassword = $('#login-password').val();
        var md5pas = md5(loginpassword);
<<<<<<< HEAD
        var user = {};
        user.userName = loginusername;
        user.password = md5pas;
        var login = JSON.stringify(user);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/login",
            data: login,
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            processData: false,
            cache: false,
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#submit-yes1").attr({disabled: "disabled"});
                layer.load(0, 5000);
            },
            success: function (data) {
                console.log(data);
                if (data.code == 200) {
                    layer.msg(data.msg, {
                        icon: 0, time: 5000, end: function () {
                            location.href = "index.jsp";
                        }
                    })
                } else {
                    layer.msg(data.msg, {
                        icon: 2, time: 5000, end: function () {
                            location.href = "index.jsp";
                        }
                    })

                }
            },
        });
        return false;

    });

    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
</script>
<script>
    //注册表单监听
    var form = layui.form;
    $('#user-name').on('click', function () {
        var that = this;
        layer.tips('用户名不能全部为数字或者有特殊字符哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#password').on('click', function () {
        var that = this;
        layer.tips('密码必须6到12位，且不能出现空格!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#age').on('click', function () {
        var that = this;
        layer.tips('年龄在1-120之间哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });

    $('#phone').on('click', function () {
        var that = this;
        layer.tips('暂时只支持大陆手机号码哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#email').on('click', function () {
        var that = this;
        layer.tips('输入正确的email，可以用来登录!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#repassword').on('click', function () {
        var that = this;
        layer.tips('请确认两次输入密码要一样哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
=======
        console.log(md5pas);
        var user = {};
        user.userName = loginusername;
        user.password = md5pas;
        var formDatas = new FormData();
        formDatas.append('loginuser', JSON.stringify(user));

        $.ajax({
            type: "POST",
            url: "/filmos/user/login",
            data: formDatas,
            dataType: "json",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#submit-yes1").attr({disabled: "disabled"});
                layer.load(0, 5000);
            },
            success: function (data) {
                console.log(data);
                if (data.code == 200) {
                    layer.msg(data.msg, {icon: 0, time: 7000});
                    location.href = "index.jsp";
                } else {
                    layer.msg(data.msg, {icon: 2, time: 7000});
                    location.href = "index.jsp";
                }
            },
        });
        return false;

    });

</script>
<script>
    //注册表单监听
    var form = layui.form;
    $('#user-name').on('click', function () {
        var that = this;
        layer.tips('用户名不能全部为数字或者有特殊字符哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#password').on('click', function () {
        var that = this;
        layer.tips('密码必须6到12位，且不能出现空格!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#age').on('click', function () {
        var that = this;
        layer.tips('年龄在1-120之间哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });

    $('#phone').on('click', function () {
        var that = this;
        layer.tips('暂时只支持大陆手机号码哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#email').on('click', function () {
        var that = this;
        layer.tips('输入正确的email，可以用来登录!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
    $('#repassword').on('click', function () {
        var that = this;
        layer.tips('请确认两次输入密码要一样哦!', that); //在元素的事件回调体中，follow直接赋予this即可

    });
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7

    form.on('submit(reg)', function (data) {
        var userName = $('#user-name').val();
        var password = $('#password').val();
        var repassword = $('#repassword').val();
        var md5pas1 = md5(repassword);
        var age = $('#age').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var sex = $('#sex option:selected').val();
        /*获取的是上传图片的输入流*/
        var userImg = $('#userImg')[0].files[0];
        var user = {};

        //表单校验
        if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(userName)) {
            layer.msg('用户名不能有特殊字符！', {icon: 2});
            return false;

        }

        if (/(^\_)|(\__)|(\_+$)/.test(userName)) {
            layer.msg('用户名首尾不能出现下划线\'_\'！', {icon: 2});
            return false;
        }
        if (/^\d+\d+\d$/.test(userName)) {
            layer.msg('用户名不能全为数字！', {icon: 2});
            return false;
        }
        if (!/^[0-9]*[1-9][0-9]*$/.test(age)) {
            layer.msg('年龄输入不合法，不允许有小数！', {icon: 2});
            return false;
        }
        if (age <= 0) {
            layer.msg('年龄必须大于0！', {icon: 2});
            return false;
        }
        if (age > 120) {
            layer.msg('年龄输入太大了！', {icon: 2});
            return false;
        }
        if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email)) {
            layer.msg('请输入有效的邮箱!', {icon: 2});
            return false;
        }
        if (!/^1\d{10}$/.test(phone)) {
            layer.msg('请输入有效的手机号码!', {icon: 2});
            return false;
        }
        if (!/^[\S]{6,12}$/.test(password)) {
            layer.msg('密码必须6到12位，且不能出现空格!', {icon: 2});
            return false
        }
        if (password != repassword) {
            layer.msg('您输入的两次密码不一致，请仔细检查！', {icon: 2});
            return false;
        }
        user.userName = userName;
        user.password = md5pas1;
        user.age = age;
        user.email = email;
        user.phone = phone;
        user.sex = sex;
        var formData = new FormData();
        //参数的内容，分别是上面的user和userImg
        formData.append('userImg', userImg);
        formData.append('userString', JSON.stringify(user));
        $.ajax({
            type: "POST",
<<<<<<< HEAD
            url: "${pageContext.request.contextPath}/user/register",
=======
            url: "/filmos/user/register",
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
            data: formData,
            dataType: "json",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#submit-yes1").attr({disabled: "disabled"});
                layer.load(0, 5000);
            },
            success: function (data) {
                if (data.code == 200) {
<<<<<<< HEAD
                    layer.msg(data.msg, {
                        icon: 0, time: 3000, end: function () {
                            location.href = "index.jsp";
                        }
                    })

                } else {
                    layer.msg(data.msg, {
                        icon: 2, time: 3000, end: function () {
                        }
                    })

=======
                    location.href = "/filmos/success"
                } else {
                    layer.msg(data.msg, {icon: 2, time: 5000});
                    location.href = "index.jsp";
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                }
            },
        });
        return false;
    });


</script>


</body>

</html>
