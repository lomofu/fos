<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>电影详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/movieinfo/moviePage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">

</head>
<body class="layui-anim layui-anim-upbit">
<div id="nav"></div>

<div class="layui-container" id="container" style="width: 75%">
    <div class="layui-fluid">
        <div class="layui-row ">
            <div class="layui-icon layui-icon-star" id="toCollect" style="z-index: 8"></div>
            <div class="layui-col-md8 layui-col-md-offset2 movie">

                <div class="layui-row grid-demo layui-col-space30" id="themovieinfo">


                </div>
            </div>
        </div>
        <!-- 简介 -->
        <div class="layui-col-md8 layui-col-md-offset2 movieText" id="profile"
             style="position: relative;background-color: #149688;color: #ffffff;top: -4px;width: 67%;left: -2px;box-shadow: 0 0 5px 0px #00000066;"></div>
    </div>
    <br>
    <br>

    <!-- 评论区 -->
    <div class="layui-row commentArea" style="width: 97%;position: relative;left: 1.5%;">
        <!-- 用户评论 -->
        <h1 style="margin-left: 17.5%; top: 46px!important;">影评区</h1>
        <div class="layui-col-md8 layui-col-md-offset2 commentCard" >
            <ul id="moviecomments">

            </ul>
            <%--插入影评--%>
        </div>


    </div>
    <br>
    <div class="">
        <div id="render" align="center"></div>
    </div>
    <br>
    <!-- 写影评 -->
    <h1 style="font-size: 24px;padding: 8px;margin-left: 17.5%;top: 51px!important;color: #0000008c;background-color: #ffe7c48a;width: 9%;">发表影评</h1>
    <br>
    <div class="layui-row " style="margin: 3% auto">
        <div class="layui-col-md8 layui-col-md-offset2 TuserCommentArea" >
            <div id="mustlogin"
                 style="background: rgba(0, 0, 0, 0.71);height: 94%; width: 97%;z-index: 15;position: absolute;display: none">
                <button id="tologin" class="hvr-pulse-grow layui-btn layui-btn-radius layui-btn-normal "
                        style="width: 80px;position: relative;margin-left: 44%;margin-top: 13%;">
                    登录
                </button>
            </div>
            <form id="mycomment" method="post" onsubmit="false">
                <div id="userScore" value=""></div>
                <textarea required lay-verify="required" placeholder="请输入你的评论（500字）" id="TuserCommentText"
                          class="layui-textarea"></textarea>
                <div class="btns">
                    <input class="btn" type="reset" value="清空"/>
                    <input class="btn" type="submit" value="发表" onclick="submitmycomment()"/>
                    <input type="hidden" value="${user.userId}" id="myid">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/movieinfo/movieinfo.js"></script>
<script>
    $ = layui.$;
    var laypage = layui.laypage;
    var layer = layui.layer;
    var rate = layui.rate;
    var $=layui.jquery;
    var flow=layui.flow;
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");

    var start = '';
    var userId = $('#myid').val();
    var movieId = getQueryString('movieid');
    var index = false;
    var words;

    rate.render({
        elem: '#userScore'
        , value: 0 //初始值
        , half: true
        , choose: function (value) {
            layer.tips(value + '  分', '#userScore', {
                tips: [1, '#16a580'],
                time: 3000
            });
            start = value;
        }

    });

    $.ajax({
        url: "/filmos/user/islogin",
        type: 'get',
        dataType: "json",
        async:false,
        headers: {
            'Content-Type': 'application/json',
            'Authorization': localStorage.getItem('token')
        }, success: function () {
           index=true
        }
    });

    var movieComment=document.getElementById("moviecomments");
    $.ajaxSettings.async = false;
    $.get('/filmos/comment/moviecommentcount?movieid='+movieId, function(res){
        movieComment.dataset.count=res.data;
    });
    $.ajaxSettings.async = true;

    if (movieComment.dataset.count>0){
        flow.load({
            elem: '#moviecomments' //指定列表容器
            , isAuto: false
            , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                $.get('/filmos/comment/moviecomment?movieid=' + movieId + '&pagenum=' + page, function (res) {
                            layui.each(res.data, function (index, item) {
                                var img = item.userImg;
                                lis.push('<li><br><br><br><br><br><div class="layui-row grid-demo commentLoaction" id="comment' + item.userId + '" >' +
                                    '<div class="layui-col-md1 ">' +
                                    '<div class="CuserPic"   >' +
                                    '<a  href="/filmos/page/otheruser?userid=' + item.userId + '">' +
                                    '<img class="hvr-grow"  id="imgs" src="/img' + img + '" style="border-radius:100%;box-shadow: 0 0 6px 0px #33333369;display: block">' +
                                    '</a>' +
                                    '</div>' +
                                    '</div>' +
                                    '<span style="position: relative;left: 1%;font-size: 23px;background: #009688;color: white;padding: 1%">' + item.start + '分' +
                                    '</span>' +
                                    '<div class="layui-col-md9">' +
                                    '<div class="CuserName">' +
                                    '<a href="/filmos/page/otheruser?userid=' + item.userId + '">' + item.userName +
                                    '</a>' +
                                    '</div>' +
                                    '</div><br><br><br>' +
                                    '<div class="layui-col-md9 ">' +
                                    '<p class="commentText">' + item.content +
                                    '</p>' +
                                    '</div>' +
                                    '<br>' +
                                    '<br>' +
                                    '<br>' +
                                    '<br>' +
                                    '<br>' +
                                    '<div class="layui-col-md9 layui-col-md-offset1">' +
                                    '<div class="commentInfo">' +
                                    '<span id="' + item.commentId + '" class="layui-icon layui-icon-reply-fill" style="cursor: pointer;position: relative;left: 40%" onclick="shows(this)" >' +
                                    '</span>' +
                                    '<span id="' + item.commentId + '" class="replyBtn" style="position: relative;left: 48%;" name="' + item.userId + '" onclick="replyBtn(this)">回复' +
                                    '</span>' +
                                    '<span class="commentDate" >' + item.createTime + '' +
                                    '</span>' +
                                    '</div><br><br>' +
                                    '<span class="replys' + item.commentId +' layui-anim layui-anim-upbit " style="display: none"></span>' +
                                    '<DIV style="BORDER-TOP: #99999970 1px dashed;margin-left: -15%;width: 131%"></DIV></div></div></li><br>');
                                    getReply(item.commentId);

                            });
                            next(lis.join(''), page < res.count);
                   
                });
            }
        });



        function shows(element) {
            console.log(element.id)
            if ($('.replys' + element.id).hasClass('yijingdianji')) {
                $('.replys' + element.id).css('display', 'none');
                $('.replys' + element.id).removeClass('yijingdianji');

            } else {
                $('.replys' + element.id).addClass('yijingdianji');
                $('.replys' + element.id).css('display', 'block');
            }
        }

        function replyBtn(e) {
            if(index==true) {
                words = 100;
                var commentId=e.id;
                var parentId=e.getAttribute('name');
                layer.prompt({
                    title: '回复Ta' + '(' + words + '字)',
                    formType: 2,
                    offset: '900px',
                    moveOut: 'true',
                    maxlength: 100
                }, function (text, index) {
                    var movieReply={};

                    movieReply.userId=userId;
                    movieReply.commentId=commentId;
                    movieReply.parentId=parentId;
                    movieReply.rcontent=text;

                    $.ajax({
                        url: '${pageContext.request.contextPath}/reply/addreply',
                        type: "POST",
                        data: JSON.stringify(movieReply),
                        dataType: "json",
                        contentType: "application/json;charset=UTF-8",
                        processData: false,
                        cache: false,
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': localStorage.getItem('token')
                        },
                        success: function (data) {
                            if (data.code==200){
                                layer.msg(data.msg,{icon:6,offset:'b',end:function () {
                                        location.reload();
                                    }
                                });
                            }else {
                                layer.msg(data.msg,{icon:5});
                            }
                        }
                    });
                    layer.close(index);
                });
            }else {
                layer.msg('先登录后再回复Ta吧~',{offset:'800px'});
            }


        };





    }else {
        $('#moviecomments').html('<br><br><br>' +
            '                <div class="layui-row grid-demo commentLoaction" >' +
            '                <div class="layui-col-md1 ">' +
            '                    <div class="layui-col-md9">' +
            '                    </div>' +
            '                    <br><br><br>' +
            '                    <div class="layui-col-md9 ">' +
            '                      <p class="commentText" style="margin-left: 300%!important;text-indent: -17px!important;left: 400%!important;line-height: 20px!important;">' +
            '                          暂无评论' +
            '                      </p>' +
            '                    </div>' +
            '                </div>' +
            '                </div>' +
            '                <br><br><br><br><br><br><br>')
    }



    if (index == true) {

        $.ajax({
            url: '/filmos/stars/isstar?userId=' + userId + '&movieId=' + movieId,
            type: 'get',
            data: 'json',
            success: function (data) {
                if (data.code == 200) {
                    document.getElementById("toCollect").className = "layui-icon layui-icon-star-fill";
                }
            }


        });

        $("#toCollect").click(function () {
            var stars={};
            stars.userId=userId;
            stars.movieId=movieId;
            if (this.className == "layui-icon layui-icon-star") {
                $.ajax({
                    url: '${pageContext.request.contextPath}/stars/addstarmovie',
                    type: "POST",
                    data: JSON.stringify(stars),
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
                                document.getElementById("toCollect").className = "layui-icon layui-icon-star-fill";
                                layer.msg(data.msg,{icon:6});
                            }else {
                                layer.msg(data.msg,{icon:5});
                            }

                    }
                });

            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/stars/deletestarmovie',
                    type: "POST",
                    data: JSON.stringify(stars),
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
                            document.getElementById("toCollect").className = "layui-icon layui-icon-star";
                            layer.msg(data.msg,{icon:6});
                        }else {
                            layer.msg(data.msg,{icon:5});
                        }

                    }
                });

            }
        });

    } else {
        $("#toCollect").click(function () {
            layer.msg("你还没有登录！");
        })
    }


    if (userId == "") {
        document.getElementById("mustlogin").style.display = 'block';
        $('#tologin').click(function () {
            document.body.scrollTop = document.documentElement.scrollTop = 0;
            document.getElementById("background").className = 'layui-anim layui-anim-scaleSpring';
            document.getElementById("background").style.display = 'block';
            $("#search-bar").css("display", "none");
            $("#search-bar").removeClass("yijingdianjile");
        })
    }



    function submitmycomment() {
        var movieId = getQueryString('movieid');
        var content = $('#TuserCommentText').val();
        var user = {};
        var movie = {};
        movie.movieId = movieId;
        user.userId = userId;
        var movieComment = {};
        movieComment.content = content;
        movieComment.start = start;
        movieComment.movie = movie;
        movieComment.user = user;
        var result = JSON.stringify(movieComment);
        $.ajax({
            url: '${pageContext.request.contextPath}/comment/addcomment',
            type: "POST",
            data: result,
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            processData: false,
            cache: false,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': localStorage.getItem('token')
            },
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $(".btn").attr({disabled: "disabled"});

                layer.msg('正在发布中', {
                    icon: 16
                    ,shade: 0.03
                    ,time:2000
                    ,offset:'b'
                });
            },
            success: function (data) {
                if (data.code == 200) {
                    layer.msg(data.msg, {icon: 1})
                    location.reload();
                } else {
                    layer.tips('插入失败 , 似乎你已经发表过影评了！', '#TuserCommentText', {
                        tips: [4, '#ff3f27'],
                        time:800
                        ,shadeClose:true
                    });
                    $(".btn").removeAttr("disabled");
                }
                $(".btn").removeAttr("disabled");
            }
        });
        return false;
    }

    $('#TuserCommentText').keyup(function(){
        words=500;
        var L = $(this).val().length;
        var my=words-L;

        if (my>0){
            layer.tips('已经输入：<span>'+L+'</span>个字 , 还剩：'+my+'个字', '#TuserCommentText', {
                tips: [4, '#009a5f']
            });
        } else {
            layer.tips('已经输入：'+L+'个字 , 请删减内容！', '#TuserCommentText', {
                tips: [4, '#ff3f27']
            });
        }

    });



</script>

</body>
</html>