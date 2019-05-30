<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/imagehover.min.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/movie_list/movie_list.css">--%>
    <html>
<body bgcolor="#f0f0f0">
<div id="nav"></div>

<div class="layui-container" id="container">
    <div class="layui-fluid">
        <div id="filter">
            <div class="select-result clearfix">
                <!-- 选中的筛选条件列表 -->
                <ul>
                </ul>
                <input type="reset" class="btn" value="重置"/>
                <input type="button" class="btn" value="筛选"/>
                <input type="button" class="btn" value="搜索"/>
            </div>

        </div>
        <!-- 搜索框 -->
        <div id="search-bar1">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input id="search-bar-text1" type="text" name="search" placeholder="搜索电影..." class="layui-input">
                    </div>
                </div>
            </form>
        </div>

        <!-- 筛选框 -->
        <div id="select">
            <!-- 年份 -->
            <div id="year">
                <div class="label">年份：</div>
                <div class="choose">
                    <ul>
                        <a href="javascript:;">
                            <li date-type="1">2019</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="2">2018</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="3">2017</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="4">2016</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="5">2015</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="6">2014</li>
                        </a>
                    </ul>
                </div>
            </div>
            <!-- 地区 -->
            <div id="location">
                <div class="label">地区：</div>
                <div class="choose">
                    <ul>
                        <a href="javascript:;">
                            <li date-type="1">中国</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="2">美国</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="3">英格兰及北爱尔兰联合王国</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="4">日本</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="5">韩国</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="6">保加利亚</li>
                        </a>
                    </ul>
                </div>
            </div>
            <!-- 类型 -->
            <div id="type">
                <div class="label">类型：</div>
                <div class="choose">
                    <ul>
                        <a href="javascript:;">
                            <li date-type="1">喜剧</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="2">冒险</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="3">恐怖</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="4">爱情</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="5">动作</li>
                        </a>
                        <a href="javascript:;">
                            <li date-type="6">文艺</li>
                        </a>
                    </ul>
                </div>
            </div>
        </div>


        <h1>电影库</h1>
        <hr>
        <div class="layui-container">
            <div id="movieList">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="resources/images/headline/1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        类型：喜剧
                                    </div>
                                    <div class="movieTime">
                                        时长：108mins
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-lg3">
                        <div class="movie">
                            <!-- 动效 -->
                            <figure class="imghvr-shutter-out-vert hvr-grow-shadow">
                                <img src="img/c1.jpg">
                                <figcaption>
                                    <div class="movieName">
                                        Kevin Hart<span class="year">(2019)</span>
                                    </div>
                                    <br>
                                    <div class="movieType">
                                        喜剧
                                    </div>
                                    <div class="movieTime">
                                        108分钟
                                    </div>
                                    <div class="actors">
                                        主演：<br>
                                        Jack
                                        Tim
                                    </div>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                            <!-- 简单信息 -->
                            <div class="movieName">
                                Kevin Hart
                            </div>
                            <div class="movieScore">
                                评分：<span class="score">9.2</span>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div id="demo7" align="center"></div>
        </div>


    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>
<script>
    $ = layui.$
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");

</script>

</body>
</html>




