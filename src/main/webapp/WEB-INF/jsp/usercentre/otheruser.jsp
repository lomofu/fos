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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usercentre/otheruser.css">

    <style type="text/css">
        /*关注按钮*/
        #followBtn {
            width: 70px !important;
            height: 30px !important;
            line-height: 30px !important;
            position: relative;
            top: 20px;
            left: -70px;
        }
    </style>
</head>

<body>
<%--引入导航栏--%>
<div id="nav"></div>

<div id="main" class="layui-anim layui-anim-upbit">

    <!-- 顶部 -->
    <div id="top">
        <!--空白框-->
        <div id="blank"></div>

        <!--用户头像-->
        <div id="Ohead">
            <!--插入头像-->

        </div>

        <!-- 用户名-->
        <div id="OuserName">
            <!-- 插入用户名-->
        </div>

        <%-- 关注按钮--%>
        <button type="button" class="layui-btn layui-btn-normal" id="followBtn">关注Ta</button>

        <!-- 关注数,收藏数,影评数-->
        <div id="FCC">
            <!--关注数-->
            <div id="followCount">
                <label>关注数</label><br>
                <!--插入关注数-->

            </div>

            <!--收藏数-->
            <div id="collectCount">
                <label>收藏数</label><br>
                <!--插入收藏数-->

            </div>

            <!--影评数-->
            <div id="commentCount">
                <label>影评数</label><br>
                <!--插入影评数-->

            </div>

        </div>
        <!-- /关注数，收藏数，影评数-->

    </div>
    <!-- /顶部-->

    <!-- 左侧(影评相关，收藏关注列表) -->
    <div id="left">
        <!--功能选项卡-->
        <div class="layui-tab layui-tab-card " style="margin: 0;">

            <!--选项卡列表-->
            <ul class="layui-tab-title" style="background: #45acffe0;color: white" >
                <li class="layui-this">Ta的影评</li>
                <li>Ta的关注</li>
                <li>Ta的收藏</li>
            </ul>
            <!--各选项卡功能块-->
            <div class="layui-tab-content">

                <!-- Ta的影评 -->
                <div class="layui-tab-item layui-show layui-anim layui-anim-upbit">
                    <br><br>
                    <!-- 时间线 -->
                    <ul class="layui-timeline" id="line">

                        <li class="layui-timeline-item" id="TaComment">
                            <!--  插入影评 id=TaComment-->
                        </li>
                    </ul>
                </div>
                <!-- /Ta的影评-->

                <!-- Ta的关注-->
                <div class="layui-tab-item  layui-anim layui-anim-upbit">

                    <!--关注列表 -->
                    <div id="Tafollow">
                        <div id="LfollowList">
                            <!-- 左侧关注列表 -->
                            <ul id="hisfollow">

                                <!-- 单个关注 -->
                                <li>
                                    <!-- 关注用户的头像 -->
                                    <div class="LFuserPic">
                                        <!-- 插入超链接 -->
                                        <a href="">
                                            <!-- 插入用户头像 -->
                                            <img src="">
                                        </a>
                                    </div>

                                    <!-- 关注用户的用户名 -->
                                    <div class="LFuserName">
                                        <!-- 插入超链接 -->
                                        <a href="">
                                            <!-- 插入用户名 -->
                                            用户名
                                        </a>
                                    </div>

                                    <!--访问主页按钮 -->
                                    <div class="Goto">
                                        <!-- 插入超链接 -->
                                        <a href=""
                                           class="layui-btn layui-btn-sm GotoBtn">
                                            个人主页
                                        </a>
                                    </div>

                                </li>
                                <!-- /单个关注 -->

                            </ul>
                            <!-- /左侧关注列表 -->
                        </div>
                    </div>
                    <!-- /关注列表-->
                </div>
                <!-- /Ta的关注-->

                <!-- Ta的收藏-->
                <div class="layui-tab-item  layui-anim layui-anim-upbit">

                    <!-- 收藏列表-->
                    <div id="Tacollect">
                        <div id="LcollectList">
                            <!-- 左侧收藏列表 -->
                            <ul id="tastars">

                                <!-- 单个收藏 -->
                                <li>
                                    <!-- 收藏电影的海报图片(竖图) -->
                                    <div class="LCollectPic">
                                        <!-- 插入超链接 -->
                                        <a href="">
                                            <!-- 插入海报图片 -->
                                            <img src="">
                                        </a>
                                    </div>

                                    <!-- 收藏电影的电影名 -->
                                    <div class="LCollectName">
                                        <!-- 插入超链接 -->
                                        <a href="">
                                            <!-- 插入电影名 -->
                                            电影名
                                        </a>
                                    </div>

                                    <!-- 收藏日期 -->
                                    <div class="LCollectDate">
                                        收藏于
                                        <span style="float: right;">
											<!-- 插入收藏日期 -->
											2019-06-08
										</span>
                                    </div>

                                </li>
                                <!-- /单个收藏 -->

                            </ul>
                            <!-- /左侧收藏列表 -->
                        </div>
                    </div>
                    <!-- /收藏列表-->

                </div>
                <!-- /Ta的收藏-->

            </div>
            <!--各选项卡功能块-->

        </div>
        <!--/功能选项卡-->
    </div>
    <!-- /左侧-->

    <!-- 右侧(最近的关注与收藏) -->
    <div id="right">
        <br>
        <!--最近关注的三个用户-->
        <h4 class="h4">最近关注</h4>
        <br>
        <div class="rightbox">
            <!--关注列表 -->
            <ul id="rightbox">

                <!--单个关注 -->
                <li>
                    <div class="Ofollow">
                        <!--插入超链接 -->
                        <a href="">
                            <!--关注用户的头像 -->
                            <div class="Fuser">
                                <!-- 插入用户头像-->
                                <img src="">
                            </div>
                        </a>
                    </div>
                    <!--关注用户的用户名 -->
                    <div class="FuserName">
                        <!-- 插入超链接 -->
                        <a href="">
                            <!--插入用户名 -->
                            用户名
                        </a>
                    </div>
                </li>
                <!--单个关注 -->

            </ul>
            <!--关注列表 -->
        </div>
        <!--/最近关注-->

        <br>

        <!--最近收藏的三部影片-->
        <h4 class="h4">最近收藏</h4>
        <br>
        <div class="rightbox">
            <!--收藏列表-->
            <ul id="rightboxstar">

                <!--单个收藏-->
                <li>
                    <div class="Ocollect">
                        <!--插入链接 -->
                        <a href="">
                            <!--收藏的电影海报图片 -->
                            <div class="movie">
                                <!--插入电影图片-->
                                <img src="">
                            </div>
                        </a>
                    </div>
                    <!-- 电影名-->
                    <div class="movieName">
                        <!-- 插入超链接 -->
                        <a href="">
                            <!--插入电影名 -->
                            电影名
                        </a>
                    </div>
                </li>
                <!--/单个收藏 -->

            </ul>
            <!--/收藏列表-->
        </div>
        <!--/最近收藏-->

    </div>
    <!--/右侧 -->

</div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/centre/otheruser.js"></script>


<script>
    $ = layui.$;
    var layer = layui.layer;
    var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    var flow=layui.flow;
    //加载导航栏
    $("#nav").load("/filmos/nav");

    // 选项卡
    //触发事件
    var active = {
        tabChange: function () {
            //切换到指定Tab项
            element.tabChange('demo', '22');
        }
    };


    var followId = getQueryString("userid");
    var index = false;
    var userId;
    $.ajax({
        url: "/filmos/user/islogin",
        type: 'get',
        dataType: "json",
        async: false,
        headers: {
            'Content-Type': 'application/json',
            'Authorization': localStorage.getItem('token')
        }, success: function (data) {
            if (data.code == 200) {
                userId = data.data;
                index = true;
                $.ajax({
                    url: '/filmos/push/isfollow?userid=' + userId + '&followid=' + followId,
                    type: 'get',
                    data: 'json',
                    success: function (data) {
                        console.log(data.msg);
                        if (data.code == 200) {
                            document.getElementById("followBtn").className = "layui-btn layui-btn-danger";
                            document.getElementById("followBtn").textContent = "已关注";

                        } else {
                            document.getElementById("followBtn").className = "layui-btn layui-btn-normal";
                            document.getElementById("followBtn").textContent = "关注Ta";
                        }
                    }

                });
            }
        },
        error: function () {
            console.log('当前没有登录')
        }
    });



    $("#followBtn").click(function () {
    if (index == true) {
        //关注按钮
            var push = {};
            push.userId = userId;
            push.followId = followId;
            if (this.className == "layui-btn layui-btn-normal") {
                $.ajax({
                    url: '${pageContext.request.contextPath}/push/addfollow',
                    type: "POST",
                    data: JSON.stringify(push),
                    dataType: "json",
                    contentType: "application/json;charset=UTF-8",
                    processData: false,
                    cache: false,
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': localStorage.getItem('token')
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            document.getElementById("followBtn").className = "layui-btn layui-btn-danger";
                            document.getElementById("followBtn").textContent = "已关注";
                            layer.msg(data.msg);
                        } else {
                            layer.msg(data.msg);
                        }

                    }
                });

            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/push/deletefollow',
                    type: "POST",
                    data: JSON.stringify(push),
                    dataType: "json",
                    contentType: "application/json;charset=UTF-8",
                    processData: false,
                    cache: false,
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': localStorage.getItem('token')
                    },
                    success: function (data) {
                        if (data.code==200) {
                            document.getElementById("followBtn").className = "layui-btn layui-btn-normal";
                            document.getElementById("followBtn").textContent = "关注Ta";
                            layer.msg(data.msg);
                        }else {
                            layer.msg(data.msg);
                        }

                    }
                });

            }

    } else {
        layer.msg("你还没有登录，登录后关注Ta吧~");
    }
    });

    var userId = getQueryString('userid');
    var commentCount=document.getElementById("commentCount")
    $.ajaxSettings.async = false;
    $.get('/filmos/comment/usercommentcount?userid=' + userId, function (res) {
        $('#commentCount').html('<label>影评数</label><br>' + res.data);
        commentCount.dataset.count=res.data;
    });
    $.ajaxSettings.async = true;


    if (commentCount.dataset.count > 0) {
        flow.load({
            elem: '#TaComment' //指定列表容器
            , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/filmos/comment/usercomment?userid=' + userId + '&pagenum=' + page, function (res) {


                    layui.each(res.data, function (index, item) {
                        $('#Ohead').html('<img src="/img/' + item.userImg + '">');
                        $('#OuserName').html(item.userName);
                        var movieId = item.movieId.toString()
                        lis.push('<li class="layui-timeline-item">' + '<i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                            '<div class="layui-timeline-content layui-text" >' +
                            '<br><br><h3 class="layui-timeline-title">' + item.createTime + '</h3>' + '<p style="overflow: hidden">' + item.content +
                            ' </p><br><a href="/filmos/movieinfo?movieid=' + item.movieId + '"><img class="hvr-grow-shadow" style="width: 27%;" src="/img' + item.movieImg + '"></a>' +
                            '<h1 style="position: relative;top: -134px;left: 82%;font-size: 60px;width: 41px;height: -1px;color: #5FB878">' + item.start + '</h1>' +
                            '<h3 style="position: relative;top: -134px;left: 87%;font-size: 20px;width: 41px;height: -1px;color: #5FB878">分</h3>' +
                            '</div>' + '<div style="position:relative;left: 44%"></div></li>')
                    });

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.count);
                });
            }
        })

    }else {
        $('#Ohead').html('<img src="/img/' + res.data[0].userImg + '">');
        $('#OuserName').append(res.data[0].userName);
        $('#TaComment').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">Ta暂时还没有写评论哦！</div>');
    }









</script>
</body>
</html>
