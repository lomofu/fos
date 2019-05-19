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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
</head>
<body>

<ul class="layui-nav">
    <li class="layui-nav-item layui-this"><a href="">首页</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">分类</a>
        <dl class="layui-nav-child">
            <dd><a href=""></a></dd>
        </dl>
    </li>

    <li class="layui-nav-item"><a href="">资讯</a></li>

    <li class="layui-nav-item"><a href="">电影库</a></li>
    <li class="layui-nav-item" style="position:absolute;right: 360px;">
        <button id="login" class="hvr-pulse-grow layui-btn layui-btn-radius layui-btn-normal " style="width: 50px">登录
        </button>
    </li>
    <li class="layui-nav-item" style="position:absolute;right:300px">
        <button id="register" class="hvr-pulse-grow layui-btn layui-btn-radius layui-btn-warm ">注册</button>
    </li>
    <li class="layui-nav-item" style="position:absolute;right:100px">
        <div id="search" class="layui-icon layui-icon-search hvr-pulse-grow"
             style="cursor: pointer;font-size:25px"></div>
    </li>
</ul>

<div id="search-bar" style="display: none;z-index: 998">
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <div class="layui-input-block" style="background-color: black;left:0px">
                <input id="search-bar-text" type="text" name="search" placeholder="搜索电影..." class="layui-input">
            </div>
        </div>
    </form>
</div>
<div id="background" class="layui-anim" style="display: none">
    <div id="login-body" style="position: relative">
        <div id="close" class="hvr-buzz-out layui-icon layui-icon-close" style="cursor: pointer"></div>
        <div id="user" class="layui-icon layui-icon-username"></div>
        <h2>登录</h2>
        <br><br><br><br>
        <form id="form" class="layui-form" action="" style="padding-top: 100px!important;">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" name="title" required lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off" class="hvr-skew-forward layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="hvr-skew-forward layui-input">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item" id="submit">
                <div class="layui-input-block ">
                    <button class="layui-btn" lay-submit lay-filter="formDemo" id="submit-yes">登录</button>
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
<div id="background1" class="layui-anim layui-anim-scaleSpring" style="display: none">
    <div id="register-body" style="position: relative">

        <div id="close1" class="hvr-buzz-out layui-icon layui-icon-close" style="cursor: pointer"></div>
        <h1>注册</h1>
        <div id="progress-bar" class="layui-progress">
            <div id="progress-bar-inside" class="layui-progress-bar" lay-percent="1/2"></div>
        </div>
        <div id="front" class="layui-icon layui-icon-left hvr-backward" style="display: none;cursor: pointer"></div>
        <div id="text" style="color:grey;"><h4>欢迎加入，Assessment社区！</h4></div>
        <div id="text1" style="color:grey;display: block"><h6>首先你需要完善一些个人资料，<br/>填写完成后点击下一步哦!</h6></div>
        <div id="text2" style="color:grey;display: block"><h6>加油，<br/>还差一步!</h6></div>
        <form id="form1" class="layui-form"style="padding-top: 100px!important;" method="post" onsubmit="return false" >
            <div id="firstinfo">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input  id="user-name" type="text" name="userName"  lay-verify="required" placeholder="请输入用户名"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block ">
                        <select id="sex" name="sex" lay-verify="required">
                            <option id="none" value="0">未知</option>
                            <option id="boy" value="1">男</option>
                            <option id="girl" value="2">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input id="age" type="text" name="age"  lay-verify="required|number" placeholder="请输入年龄"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input id="email" type="text" name="email"  lay-verify="required" placeholder="请输入邮箱"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input id="phone" type="text" name="phone"  lay-verify="required" placeholder="请输入电话号码"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>
            </div>

            <div id="secondinfo" style="display: none">
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input id="password" type="password" name="password"  lay-verify="required" placeholder="请输入密码"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input  id="repassword" type="password" name="repassword"  lay-verify="required" placeholder="请再次输入密码"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上传头像</label>
                    <div class="layui-input-block">
                        <input id="userImg" type="file" name="userImg" class="layui-input hvr-skew-forward">
                    </div>
                </div>
            </div>
            <div  class="layui-form-item" id="submit1">
                <div class="layui-input-block">
                    <button class="layui-btn hvr-pulse-grow" lay-submit lay-filter="reg" id="submit-yes1" style="display: none">提交
                    </button>
                    <br><br>
                    <button type="reset" class="layui-btn layui-btn-danger hvr-wobble-skew" id="submit-no">重置</button>
                </div>
            </div>
            <div id="next" class="layui-btn" style="display: block">下一步</div>
        </form>


    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/movietypelist.js"></script>
<script>
    //# sourceURL=dynamicScript.js
        var form = layui.form;

        form.on('submit(reg)', function(data){
            var userName = $('#user-name').val();
            var password = $('#password').val();
            var repassword=$('#repassword').val();
            var age=$('#age').val();
            var email=$('#email').val();
            var phone=$('#phone').val();
            var sex=$('#sex option:selected') .val();
            /*获取的是上传图片的输入流*/
            var userImg = $('#userImg')[0].files[0];
            var user = {};

            //表单校验
            if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(userName)){
                layer.msg('用户名不能有特殊字符！', {icon: 2});
                return false;

            }

            if(/(^\_)|(\__)|(\_+$)/.test(userName)){
                layer.msg('用户名首尾不能出现下划线\'_\'！', {icon: 2});
                return false;
            }
            if(/^\d+\d+\d$/.test(userName)){
                layer.msg('用户名不能全为数字！', {icon: 2});
                return false;
            }
            if (!/^[0-9]*[1-9][0-9]*$/.test(age)){
                layer.msg('年龄输入不合法，不允许有小数！',{icon:2});
                return false;
            }
            if(age<=0){
                layer.msg('年龄必须大于0！', {icon: 2});
                return false;
            }
            if(age>120){
                layer.msg('年龄输入太大了！',{icon:2});
                return false;
            }
            if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email)){
                layer.msg('请输入有效的邮箱!',{icon:2});
                return false;
            }
            if(!/^1\d{10}$/.test(phone)){
                layer.msg('请输入有效的手机号码!', {icon: 2});
                return false;
            }
            if (!/^[\S]{6,12}$/.test(password)){
                layer.msg('密码必须6到12位，且不能出现空格!', {icon: 2});
                return false
            }
            if (password!=repassword){
                layer.msg('您输入的两次密码不一致，请仔细检查！', {icon: 2});
                return false;
            }
            user.userName = userName;
            user.password = repassword;
            user.age=age;
            user.email=email;
            user.phone=phone;
            user.sex=sex;
            var formData = new FormData();
            //参数的内容，分别是上面的user和userImg
            formData.append('userImg', userImg);
            formData.append('userString', JSON.stringify(user));
            $.ajax({
                type:"POST",
                url:"/filmos/user/register",
                data:formData,
                dataType:"json",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function () {
                    // 禁用按钮防止重复提交
                    $("#submit-yes1").attr({ disabled: "disabled" });
                    layer.load(2,6000);
                },
                success:function(data){
                    if (data.code==200) {
                        location.href = "/filmos/user/success"
                    } else {
                        layer.msg(data.msg, {icon: 2, time: 5000});
                    }
                },
            });
            return false;
        });




</script>


</body>

</html>
