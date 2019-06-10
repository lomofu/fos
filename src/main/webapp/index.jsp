<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <head>
        <meta charset="utf-8">
        <title>首页</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/imagehover.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css">

        <style type="text/css">
            .imghvr-slide-right figcaption {
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%);
            }
        </style>

    </head>

<body>

<%--导航栏--%>
<div id="nav"></div>

<div class="layui-container" id="container">
    <%--轮播图--%>
    <div class="layui-fluid">
        <div class="layui-carousel" id="headline">
            <div carousel-item>
                <div><img src="resources/images/headline/1.jpg" ></div>
                <div><img src="resources/images/headline/2.jpg" ></div>
                <div><img src="resources/images/headline/3.jpg" ></div>
                <div><img src="resources/images/headline/4.jpg"></div>
            </div>
        </div>
    </div>
        <br><br> <br><br><br><br>
        <hr>
        <br><br><br><br><br><br>
        <div class="layui-icon layui-icon-top top"></div><div class="title1">院线热映</div>
        <br>
    <a href=""><div class="More+1">更多</div></a>


    <!-- 图片排行榜 -->
    <div id="NoList">

        <!-- No.4 -->
        <div id="No4">
            <!-- 动效 -->
            <figure class="imghvr-slide-right hvr-grow-shadow TPic">

                <!-- 海报图 -->
                <div class="TPic">
                    <!-- 插入电影海报图片 -->
                    <img src="resources/images/TOP5/top4.jpg">
                </div>

                <figcaption>
                    <!-- 内容 -->
                    <div id="No4info">
                        <!-- 排行 -->

                        <div id="T4">Top4</div>
                        <!-- 电影信息 -->
                        <div id="Tmovie4">
                            <!-- 电影名 -->
                            <span class="TmovieName">
										<!-- 插入电影名 -->
										电影名
									</span>
                            <!-- 年份 -->
                            <span class="Tyear">
										<!-- 插入年份 -->
										(2019)
									</span>
                        </div>

                        <!-- 评分 -->
                        <div class="TS">
                            <label class="label">评分:</label><br>
                            <span id="score4">
										<!-- 插入评分 -->
										4.9
									</span>
                        </div>
                        <!-- 热度 -->
                        <div class="TH">
                            <label class="label">热度:</label><br><br>
                            <span id="hot4">
										<!-- 热度 -->
										1W+
									</span>
                        </div>
                    </div>

                </figcaption>
            </figure>

        </div>
        <!-- /No.4 -->

        <!-- No.2 -->
        <div id="No2">
            <!-- 动效 -->
            <figure class="imghvr-slide-bottom-left hvr-grow-shadow TPic">

                <!-- 海报图 -->
                <div class="TPic">
                    <!-- 插入电影海报图 -->
                    <img src="resources/images/TOP5/top2.jpg">
                </div>

                <figcaption>
                    <!-- 内容 -->
                    <div id="No2info">
                        <!-- 排名 -->
                        <div id="T2">Top2</div>

                        <!-- 电影信息 -->
                        <div id="Tmovie2">
                            <!-- 电影名 -->
                            <span class="TmovieName">
										<!-- 插入电影名 -->
										电影名
									</span>
                            <!-- 年份 -->
                            <span class="Tyear">
										<!-- 插入年份 -->
										(2019)
									</span>
                        </div>

                        <!-- 评分 -->
                        <div class="TS">
                            <label class="label">评分:</label><br>
                            <span id="score2">
										<!--插入评分 -->
										4.9
									</span>
                        </div>
                        <!-- 热度 -->
                        <div class="TH">
                            <label class="label">热度:</label><br><br>
                            <span id="hot2">
										<!-- 插入热度 -->
										1W+
									</span>
                        </div>
                    </div>

                </figcaption>
            </figure>

        </div>
        <!-- /No.2 -->

        <!-- No.1 -->
        <div id="No1">

            <!-- 动效 -->
            <figure class="imghvr-slide-up hvr-grow-shadow TPic">

                <!-- 海报图 -->
                <div class="TPic">
                    <!-- 插入电影海报图 -->
                    <img src="resources/images/TOP5/top1.jpg">
                </div>

                <figcaption>
                    <!-- 内容 -->
                    <div id="No1info">
                        <!-- 排名 -->
                        <div id="T1">Top1</div>

                        <!-- 电影信息 -->
                        <div id="Tmovie1">
                            <!-- 电影名 -->
                            <span class="TmovieName">
										<!-- 插入电影名 -->
										电影名
									</span>
                            <!-- 年份 -->
                            <span class="Tyear">
										<!-- 插入年份 -->
										(2019)
									</span>
                        </div>

                        <!-- 评分 -->
                        <div class="TS">
                            <label class="label">评分:</label><br>
                            <span id="score1">
										<!--插入评分 -->
										5
									</span>
                        </div>
                        <!-- 热度 -->
                        <div class="TH">
                            <label class="label">热度:</label><br><br>
                            <span id="hot1">
										<!-- 插入热度 -->
										1W+
									</span>
                        </div>
                    </div>

                </figcaption>
            </figure>

        </div>
        <!-- /No.1 -->

        <!-- No.3 -->
        <div id="No3">

            <!-- 动效 -->
            <figure class="imghvr-slide-bottom-right hvr-grow-shadow TPic">

                <!-- 海报图 -->
                <div class="TPic">
                    <!-- 插入电影海报图 -->
                    <img src="resources/images/TOP5/top3.jpg">
                </div>

                <figcaption>
                    <!-- 内容 -->
                    <div id="No3info">
                        <!-- 排名 -->
                        <div id="T3">Top3</div>

                        <!-- 电影信息 -->
                        <div id="Tmovie3">
                            <!-- 电影名 -->
                            <span class="TmovieName">
										<!-- 插入电影名 -->
										电影名
									</span>
                            <!-- 年份 -->
                            <span class="Tyear">
										<!-- 插入年份 -->
										(2019)
									</span>
                        </div>

                        <!-- 评分 -->
                        <div class="TS">
                            <label class="label">评分:</label><br>
                            <span id="score3">
										<!--插入评分 -->
										4.9
									</span>
                        </div>
                        <!-- 热度 -->
                        <div class="TH">
                            <label class="label">热度:</label><br><br>
                            <span id="hot3">
										<!-- 插入热度 -->
										1W+
									</span>
                        </div>
                    </div>

                </figcaption>
            </figure>

        </div>
        <!-- /No.3 -->

        <!-- No.5 -->
        <div id="No5">

            <!-- 动效 -->
            <figure class="imghvr-slide-left hvr-grow-shadow TPic">

                <!-- 海报图 -->
                <div class="TPic">
                    <!-- 插入电影海报图 -->
                    <img src="resources/images/TOP5/top5.jpg">
                </div>

                <figcaption>
                    <!-- 内容 -->
                    <div id="No5info">
                        <!-- 排名 -->
                        <div id="T5">Top5</div>

                        <!-- 电影信息 -->
                        <div id="Tmovie5">
                            <!-- 电影名 -->
                            <span class="TmovieName">
										<!-- 插入电影名 -->
										电影名
									</span>
                            <!-- 年份 -->
                            <span class="Tyear">
										<!-- 插入年份 -->
										(2019)
									</span>
                        </div>

                        <!-- 评分 -->
                        <div class="TS">
                            <label class="label">评分:</label><br>
                            <span id="score5">
										<!--插入评分 -->
										4.8
									</span>
                        </div>
                        <!-- 热度 -->
                        <div class="TH">
                            <label class="label">热度:</label><br><br>
                            <span id="hot5">
										<!-- 插入热度 -->
										1W+
									</span>
                        </div>
                    </div>

                </figcaption>
            </figure>

        </div>
        <!-- /No5 -->
    </div>

        <br><br><br><br>
        <hr>
        <br><br><br><br>
        <div class="layui-icon layui-icon-fire fire "></div>
        <br><br><br> <br><br><br> <br><br><br><br><br><br>
    <!-- /图片排行榜 -->

       <div class="title2 ">最新热点</div>
         <a href=""><div class="More+2">更多</div></a>
    <%--最新热点--%>
    <div class="layui-cow" >
        <%--热点列表--%>

        <div class="layui-col-lg12" id="HTList">
            <div class="layui-cow">

                <%--单个新闻--%>
                <div class="layui-col-md4">
                    <div class="Nnews">

                        <%--新闻图片--%>
                        <div class="NnewsPic">
                            <%--插入新闻图片--%>
                            <img src="resources/images/headline/1.jpg" alt="">
                        </div>

                        <%--新闻标题--%>
                        <a href="">
                            <div class="NnewsTitle">
                                <%--插入新闻标题--%>
                                新闻标题
                            </div>
                        </a>

                        <%--新闻简述--%>
                        <div class="NnewsInfo">
                            <%--新闻简述--%>
                            新闻简述
                        </div>

                    </div>
                </div>
                <%--/单个新闻--%>

                <%--单个新闻--%>
                <div class="layui-col-md4">
                    <div class="Nnews">

                        <%--新闻图片--%>
                        <div class="NnewsPic">
                            <%--插入新闻图片--%>
                            <img src="resources/images/headline/4.jpg" alt="">
                        </div>

                        <%--新闻标题--%>
                        <a href="">
                            <div class="NnewsTitle">
                                <%--插入新闻标题--%>
                                新闻标题
                            </div>
                        </a>

                        <%--新闻简述--%>
                        <div class="NnewsInfo">
                            <%--新闻简述--%>
                            新闻简述
                        </div>

                    </div>
                </div>
                <%--/单个新闻--%>

                <%--单个新闻--%>
                <div class="layui-col-md4">
                    <div class="Nnews">

                        <%--新闻图片--%>
                        <div class="NnewsPic">
                            <%--插入新闻图片--%>
                            <img src="resources/images/headline/3.jpg" alt="">
                        </div>

                        <%--新闻标题--%>
                        <a href="">
                            <div class="NnewsTitle">
                                <%--插入新闻标题--%>
                                新闻标题
                            </div>
                        </a>

                        <%--新闻简述--%>
                        <div class="NnewsInfo">
                            <%--新闻简述--%>
                            新闻简述
                        </div>

                    </div>
                </div>
                <%--/单个新闻--%>

            </div>
        </div>
    </div>

    <%--/最新热点--%>


</div>
<div id="bottom"></div>
<%--<script !src=""></script>--%>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>

<script>
    $ = layui.$
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");
    var carousel = layui.carousel;
    //建造实例
    carousel.render({
        elem: '#headline'
        , width: '100%' //设置容器宽度
        , height: '500px'//设置容器高度
        , arrow: 'hover' //始终显示箭头
        , indicator: 'none'//指示器不显示
        , anim: 'fade' //切换动画方式
    });
</script>

</body>
</html>