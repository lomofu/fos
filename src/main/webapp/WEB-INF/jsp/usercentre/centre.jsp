<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usercentre/user.css">
</head>

<body bgcolor="#f0f0f0">
<div id="nav"></div>
<div id="main" class="layui-anim layui-anim-upbit">
    <!-- 顶部 -->
    <div id="top">
        <div id="blank"></div>
        <div id="head">
            <img src="/img/${user.userImg}">
        </div>
        <div id="userName">
            ${user.userName}
        </div>
        <div style="color: white">
            <div id="follow" style="position: relative;left: 780px;color: white;font-size: 16px;top: -6px;width:50px">
                关注数
            </div>
            <div id="write" style="position: relative;left: 941px;color: white;top:-28px;font-size: 17px;width: 53px">
                影评数
            </div>
            <div id="guanzhushu" style="position: relative;left: 796px;top: -23px;font-size: 30px;width: 20px">0</div>
            <div id="yingpingshu" style="position: relative;left: 956px;top: -58px;font-size: 31px;width: 20px">0</div>
        </div>
    </div>
    <!-- 左侧 -->
    <div id="left">
        <div class="layui-tab layui-tab-card " style="margin: 0;">
            <ul class="layui-tab-title">
                <li class="layui-this">我的影评</li>
                <li>回复我的</li>
                <li>写影评</li>
            </ul>
            <div class="layui-tab-content">

                <!-- 我的影评 -->
                <div class="layui-tab-item layui-show myComment  layui-anim layui-anim-upbit">
                    <!-- 时间线 -->
                    <ul class="layui-timeline" id="line">
                        <li class="layui-timeline-item" id="usercomment">

                        </li>
                    </ul>
                </div>

                <!-- 写影评 -->
                <div class="layui-tab-item layui-anim layui-anim-upbit">

                </div>
            </div>
        </div>


    </div>


    <!-- 右侧 -->
    <div id="right">
        <br>
        <h4><a href="">关注</a></h4>
        <hr>
        <div class="rightbox">
            <ul>
                <li>
                    <div class="follow">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
                <li>
                    <div class="follow">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
                <li>
                    <div class="follow">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
            </ul>
        </div>

        <br>

        <h4><a href="">收藏</a></h4>
        <hr>
        <div class="rightbox">
            <ul>
                <li>
                    <div class="collect">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
                <li>
                    <div class="collect">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
                <li>
                    <div class="collect">
                        <div class="movie">
                            <img src="">
                        </div>
                    </div>
                    <span class="movieName">电影名</span>
                </li>
            </ul>
        </div>
    </div>

</div>


<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/centre/centre.js"></script>

<!-- 选项卡 -->
<script>
    $ = layui.$
    $("#nav").load("/filmos/nav");
    var $ = layui.jquery, element = layui.element,layer=layui.layer; //Tab的切换功能，切换事件监听等，需要依赖element模块
    //触发事件
    var active = {
        tabChange: function () {
            //切换到指定Tab项
            element.tabChange('demo', '22');
        }
    };
    var currentToken = document.cookie.split(";")[0];
    var user = {};
    user.userId =${user.userId};
    function deleter(){
        layer.confirm('您确定要删除此评论？', {
            btn: ['是的','再想想'] //按钮
        }, function(){
            layer.msg('好的，方法还没写', {icon: 1});
        }, function(){
            layer.closeAll();
        });

    }



</script>
</body>
</html>
