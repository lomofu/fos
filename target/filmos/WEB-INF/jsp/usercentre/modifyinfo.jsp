<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
</head>

<body bgcolor="#f0f0f0" class="layui-anim layui-anim-upbit">

<div id="nav"></div>
<div class="layui-container" style="position: relative;top: 20px">
    <div class="layui-row layui-col-space30">
        <div class="layui-col-md8">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px">
                    <div class="layui-icon layui-icon-form" style="font-size: 43px;position: relative;top: 6px;"></div>
                    <h3 style="position: relative;top: -33px;left: 58px;">个人资料</h3></div>
                <div class="layui-card-body">
                    <div class="layui-bg layui-bg-green"
                         style="height: 35px;position: relative;top:30px;text-align: center;font-size: 14px"><span
                            style="position:relative;top: 5px;">基本资料</span></div>
                    <form id="form1" class="layui-form" style="padding-top: 100px!important;" method="post"
                          onsubmit="return false">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户ID</label>
                            <div class="layui-input-block">
                                ${user.userId}
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input id="user-name" type="text" name="userName" value="${user.userName}"
                                       placeholder="请输入用户名"
                                       autocomplete="off" class=" layui-input hvr-glow">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block ">
                                <select id="sex" name="sex" value="${user.sex}">
                                    <option id="none" value="0">未知</option>
                                    <option id="boy" value="1">男</option>
                                    <option id="girl" value="2">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-block">
                                <input id="age" type="text" name="age" value="${user.age}" lay-verify="number"
                                       placeholder="请输入年龄"
                                       autocomplete="off" class="layui-input hvr-glow">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input id="email" type="text" name="email" value="${user.email}" placeholder="请输入邮箱"
                                       autocomplete="off" class="layui-input hvr-glow">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">电话</label>
                            <div class="layui-input-block">
                                <input id="phone" type="text" name="phone" value="${user.phone}" lay-verify="number"
                                       placeholder="请输入电话号码"
                                       autocomplete="off" class="layui-input hvr-glow">
                            </div>
                        </div>
                        <hr>
                        <div class="layui-form-item" >
                            <div class="layui-input-block">
                                <button class="layui-btn hvr-pulse-grow" lay-submit lay-filter="reg" style="width: 80px;position:relative;bottom: -14px;left: -180px;">提交
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-col-md5" style="position: absolute;top: 17px;right: 67px;width: 310px;">
        <div class="layui-card" style="height: 300px">
            <div class="layui-card-header" style="height: 60px;text-align: center">
                <div class="layui-icon layui-icon-picture" style="font-size: 30px;position: relative;top: 6px;"></div>
                <h3 style="position: relative;top: -12px;left: 1px;font-size: 15px;color: white">修改头像</h3></div>
            <div class="layui-card-body">
                <img src="" class="layui-upload-img" id="user-img"
                     style="width: 100px;height: 100px;position: relative;left: 88px;background-color: #0F9E5E">
                <hr>
                <div class="layui-upload" style="text-align: center">
                    <button type="button" class="layui-btn" id="choose" style="width: 80px">选择图片</button>
                    <button type="button" class="layui-btn  layui-btn-danger layui-anim layui-anim-upbit" id="upload"
                            style="width: 80px;display: none;position: relative;left: 100px;top: 20px;">开始上传
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>

<!-- 选项卡 -->
<script>
    $ = layui.$;
    $("#nav").load("/filmos/nav");
    var $ = layui.jquery;
    var upload = layui.upload;
    var form = layui.form;
    //普通图片上传

    var userImg = upload.render({
        elem: '#choose'
        , auto: false
        , bindAction: '#upload'
        , choose: function (obj) {//选择文件的回调，obj为选中的文件
            //将每次选择的文件追加到文件队列
            var files = obj.pushFile();
            //预览选中的文件（本地文件）
            obj.preview(function (index, file, result) {
                $('#user-img').attr('src', result);
                $('#upload').css('display', 'block');

            });
        }
        , before: function (obj) {//文件上传前的回调


        }
        , done: function (res) {
            //如果上传失败
            if (res.code > 0) {
                return layer.msg('上传失败');
            }
            //上传成功
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    })


</script>
</body>
</html>
