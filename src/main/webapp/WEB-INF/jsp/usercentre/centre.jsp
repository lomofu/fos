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

    <%--修改  将删除按钮写为类并从js分离出来，但写入外联css则无效果--%>
    <%-- 删除按钮的样式 --%>
    <style type="text/css">

    </style>
</head>

<body>
<%--引入导航栏--%>
<div id="nav"></div>
<div id="main" class="layui-anim layui-anim-upbit">
    <!-- 顶部 -->
    <div id="top">
        <%--空白框--%>
        <div id="blank"></div>

        <%--用户头像--%>
        <div id="head">
            <%-- 插入用户头像--%>
            <img src="/img/${user.userImg}">
        </div>

        <%-- 用户名--%>
        <input type="hidden" id="userId" value="${user.userId}">
        <div id="userName">

            <%-- 插入用户名--%>
            ${user.userName}

        </div>

        <%--修改  修改了显示的样式，并新加了收藏数的显示--%>
        <%-- 关注数,收藏数,影评数--%>
        <div id="FCC">
            <%--关注数--%>
            <div id="followCount">
                <%--  插入关注数--%>

            </div>

            <%--收藏数--%>
            <div id="collectCount">
                <label>收藏数</label><br>
            </div>

            <%--影评数--%>
            <div id="commentCount">

            </div>

        </div>

    </div>

    <!-- 左侧(影评相关，收藏关注列表) -->
    <div id="left">
        <%--功能选项卡--%>
        <div class="layui-tab layui-tab-card " style="margin: 0;">
            <ul class="layui-tab-title" style="background: #4bb04fdb;color: white;">
                <li class="layui-this">我的影评</li>
                <li>回复我的</li>
                <li>我的关注</li>
                <li>我的收藏</li>
            </ul>

            <div class="layui-tab-content">

                <!-- 我的影评 -->
                <div class="layui-tab-item layui-show layui-anim layui-anim-upbit">
                    <!-- 时间线 -->
                    <ul class="layui-timeline" id="line">

                    </ul>
                </div>


                <!-- 回复我的 -->
                <div class="layui-tab-item layui-anim layui-anim-upbit">
                    <li class="layui-timeline-item" id="userreply">

                    </li>
                </div>


                <!-- 我的关注-->
                <div class="layui-tab-item  layui-anim layui-anim-upbit">

                    <!--关注列表 -->
                    <div id="Tafollow">
                        <div id="LfollowList">
                            <!-- 左侧关注列表 -->
                            <ul id="myfollow">

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

                                    <!-- 取消关注按钮 -->
                                    <div class="Cancel">
                                        <button type="button" class="layui-btn layui-btn-sm layui-btn-danger CancelBtn">
                                            取消关注
                                        </button>
                                    </div>

                                </li>
                                <!-- /单个关注 -->

                            </ul>
                            <!-- /左侧关注列表 -->
                        </div>
                    </div>
                    <!-- /关注列表-->
                </div>
                <!-- /我的关注-->

                <!-- 我的收藏-->
                <div class="layui-tab-item  layui-anim layui-anim-upbit">

                    <!-- 收藏列表-->
                    <div id="Tacollect">
                        <div id="LcollectList">
                            <!-- 左侧收藏列表 -->
                            <ul id="mystar">

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
                <!-- /我的收藏-->

            </div>
            <!--/各选项卡功能块-->

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
                    <div class="follow">
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
                    <div class="collect">
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
<div id="buttom"></div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/centre/centre.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/islogin.js"></script>


<script>
    $ = layui.$;
    flow = layui.flow;
    //加载导航栏
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");
    var userid = $('#userId').val();
    // 选项卡
    var $ = layui.jquery, element = layui.element, layer = layui.layer; //Tab的切换功能，切换事件监听等，需要依赖element模块
    //触发事件
    var active = {
        tabChange: function () {
            //切换到指定Tab项
            element.tabChange('demo', '22');
        }
    };

    var commentCount=document.getElementById("commentCount")
    $.ajaxSettings.async = false;
    $.get('/filmos/comment/usercommentcount?userid=' + userid, function (res) {
        $('#commentCount').html('<label>影评数</label><br>' + res.data);
        commentCount.dataset.count=res.data;
    });
    $.ajaxSettings.async = true;


    if (commentCount.dataset.count > 0) {
        flow.load({
            elem: '#line' //指定列表容器
            ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/filmos/comment/usercomment?userid=' + userid + '&pagenum=' + page, function(res){

                    layui.each(res.data, function(index, item){
                        var movieId=item.movieId.toString()
                        lis.push('<li class="layui-timeline-item">' + '<i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                            '<div class="layui-timeline-content layui-text" >' +
                            '<br><br><h3 class="layui-timeline-title">' + item.createTime + '</h3>' + '<p style="overflow: hidden">' + item.content +
                            ' </p><br><a href="/filmos/movieinfo?movieid=' + item.movieId + '"><img class="hvr-grow-shadow" style="width: 27%;" src="/img' + item.movieImg + '"></a>' +
                            '<h1 style="position: relative;top: -134px;left: 82%;font-size: 60px;width: 41px;height: -1px;color: #5FB878">' + item.start + '</h1>' +
                            '<h3 style="position: relative;top: -134px;left: 87%;font-size: 20px;width: 41px;height: -1px;color: #5FB878">分</h3>' +
                            '</div>' + '<div style="position:relative;left: 44%"></div><a id="'+item.commentId+'" style="position: relative;left: 94%;top: 10px;color: crimson;cursor: pointer" onclick="deleter(this);">删除</a></li>')
                    });

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.count);
                });
            }
        })
        function deleter(element) {
            movieComment.commentId = element.id;
            movieComment.user = user;
            layer.confirm('您确定要删除此评论？', {
            btn: ['是的', '再想想']
            }, function () {
                //确定的方法
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/comment/delectcomment",
                    data: JSON.stringify(movieComment),
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
                            layer.msg(data.msg, {
                                icon: 1, time: 1000, end: function () {
                                    location.reload();
                                }
                            });
                        } else {
                            layer.msg(data.msg, {icon: 2});

                        }

                    }
                });

            }, function () {
                layer.closeAll();
            });

        }

    } else {
        $('#line').html('<li class="layui-timeline-item" id="usercomment"><div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">你还没有影评，快去发表吧！</div></li>')
    }




    var userreply=document.getElementById("userreply");
    $.ajaxSettings.async = false;
    $.get('/filmos/comment/usercommentcount?userid=' + userid, function (res) {
        userreply.dataset.count=res.data;
    });

    console.log(userreply.dataset.count);
    if (userreply.dataset.count>0){
        flow.load({
            elem: '#userreply' //指定列表容器
            ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/filmos/reply/replybyuserid?userid='+userid+'&pagenum='+page, function(res){
                    //假设你的列表返回在data集合中
                    layui.each(res.data, function(index, item){
                        lis.push('<li class="layui-timeline-item">' +
                            '<i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                            '<div class="layui-timeline-content layui-text" >' +
                            '<br><br>' +
                            '<h3 class="layui-timeline-title">' + item.createTime + '</h3>' +
                            '<a href="/filmos/page/otheruser?userid=' + item.userId + '"><img src="/img' + item.userImg + '" style="width: 50px;height: 50px"></a>' +
                            '<a href="/filmos/page/otheruser?userid=' + item.userId + '"><span style="font-size: 17px;position: absolute;margin-left: 1%;margin-top: 2.5%;color: black">' +
                            item.userName +
                            ': </span></a>' +
                            '<p style="overflow: hidden;margin-left: 17%;font-size: 17px">' +
                            item.rcontent +
                            ' </p><br>' +
                            '<i><p style="overflow: hidden;margin-left: 17%;margin-top: 0%;font-size: 14px;background-color:#c9c9c961">' +
                            item.content + '</p></i>' +
                            '</div></li>');
                    });

                    next(lis.join(''), page < res.pages);
                });
            }
        });

    }else {
        $('#userreply').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">暂时还没有人回复你哦~</div>');
    }






















    var user = {};
    var movieComment = {};
    user.userId = $('#userId').val();

    function cancelfollow(element) {
        var push = {};
        push.userId = $('#userId').val();
        push.followId = element.id;
        layer.confirm('确定要取消关注Ta？将不会再收到Ta的动态推送！', {
            btn: ['是的', '不了'] //按钮
        }, function () {
            //确定的方法
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/push/deletefollow",
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
                        layer.msg(data.msg, {
                            icon: 1, time: 800, end: function () {
                                document.getElementById('myfollower' + element.id.toString()).className = 'layui-anim layui-anim-fadeout';
                            }
                        });
                    } else {
                        layer.msg(data.msg, {icon: 2});

                    }

                }
            });
        }, function () {
            layer.closeAll();
        });

    }
</script>
</body>
</html>
