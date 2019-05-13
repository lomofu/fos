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
    <form class="layui-form layui-form-pane" action="">
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
        <form id="form1" class="layui-form" action="" style="padding-top: 100px!important;">
            <div id="firstinfo">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" required lay-verify="required" placeholder="请输入用户名"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block ">
                        <select name="sex" lay-verify="required">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input type="text" name="age" required lay-verify="required" placeholder="请输入年龄"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" required lay-verify="required" placeholder="请输入邮箱"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" required lay-verify="required" placeholder="请输入电话号码"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>
            </div>

            <div id="secondinfo" style="display: none">
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请再次输入密码"
                               autocomplete="off" class="hvr-skew-forward layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上传头像</label>
                    <div class="layui-input-block">
                        <input type="file" name="img" required lay-verify="required" placeholder="请再次输入密码"
                               autocomplete="off" class="layui-input hvr-skew-forward">
                    </div>
                </div>
            </div>


            <div class="layui-form-item" id="submit1">
                <div class="layui-input-block">
                    <button class="layui-btn hvr-pulse-grow" id="submit-yes1">下一步
                    </button>
                    <br><br>
                    <button type="reset" class="layui-btn layui-btn-danger hvr-wobble-skew" id="submit-no">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/movietypelist.js"></script>
<script type="text/javascript">
    ;!function () {
        //无需再执行layui.use()方法加载模块，直接使用即可
        var form = layui.form
        var layer = layui.layer;
        $ = layui.$
        var element = layui.element;


        var html = ""
        $.ajax({
            url: "/filmos/movietype/getallmovietype",
            type: "get",
            dataType: "json",
            data: {},
            success: function (data) {
                var list = data.data;
                var tempHtml = '';
                $.each(list, function (i, item) {
                    tempHtml += '<dd><a href="#" data-id="' + item.typeId + '">' + item.typeName + '</a></dd>';
                });
                $('.layui-nav-child').html(tempHtml);
            }
        })
    }();
</script>

</body>

</html>
