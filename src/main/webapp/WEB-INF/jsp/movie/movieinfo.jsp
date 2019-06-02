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
    <html>
<body bgcolor="#f0f0f0">
<div id="nav"></div>
<div class="layui-container" id="container" style="width: 67%">
    <div class="layui-fluid">
        <div class="layui-row ">
            <div class="layui-col-md8 layui-col-md-offset2 movie">
                <div class="layui-row grid-demo layui-col-space30" id="themovieinfo" >
                    <!-- 修改部分 -->
                    <!-- 加入bgbox层 -->


            </div>
            </div>
        </div>
            <!-- 简介 -->
            <div class="layui-col-md8 layui-col-md-offset2 movieText" id="profile"
                 style="position: relative;background-color: #149688;color: #ffffff;top: -4px;width: 66.40%;left: 2px;box-shadow: 0 0 5px 0px #00000066;"></div>
            </div>
        <br>
        <br>

        <!-- 评论区 -->
        <div class="layui-row commentArea" style="width: 97%;position: relative;left: 1.5%;">
            <!-- 用户评论 -->
            <h1 style="margin-left: 18.5%; top: 46px!important;">影评区</h1>
            <div class="layui-col-md8 layui-col-md-offset2 commentCard" id="moviecomments">

                <%--插入影评--%>
            </div>


        </div>
        <br>
        <div class="">
            <div id="render" align="center"></div>
        </div>
        <br>
        <!-- 写影评 -->
        <div class="layui-row ">
            <div class="layui-col-md8 layui-col-md-offset2 TuserCommentArea">
                <form action="" method="post">
                    <textarea name="" required lay-verify="required" placeholder="请输入你的评论" id="TuserCommentText"
                              class="layui-textarea"></textarea>
                    <div class="btns">
                        <input class="btn" type="reset" value="清空"/>
                        <input class="btn" type="submit" value="发表"/>
                        <input class="btn" type="button" id="userScore" value="评分"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/movieinfo/movieinfo.js"></script>

<script>
    $ = layui.$
    var laypage = layui.laypage,
        layer = layui.layer;
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");


    // 评分弹出层
    $("#userScore").click(function () {
        layer.prompt({
            title: '给影片打打分',
        }, function (val, index) {

            layer.msg('您对该影片的评分为：' + val + '分');
            layer.close(index);
        });
    });


</script>

</body>
</html>