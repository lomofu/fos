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
<<<<<<< HEAD
            <img src="/img/${user.userImg}">
=======
            <img src="//t.cn/RCzsdCq">
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
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
            <div style="position: relative;left: 796px;top: -23px;font-size: 30px;width: 20px">0</div>
            <div style="position: relative;left: 956px;top: -58px;font-size: 31px;width: 20px">0</div>
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
                        <li class="layui-timeline-item">
                            <!-- 小圆圈 -->
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <!-- 主体 -->
                            <div class="layui-timeline-content layui-text">
                                <!-- 日期 -->
                                <h3 class="layui-timeline-title">8月20日</h3>
                                <!-- 正文 -->
                                <p>
                                    layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                                    <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                    <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <!-- 小圆圈 -->
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <!-- 主体 -->
                            <div class="layui-timeline-content layui-text">
                                <!-- 日期 -->
                                <h3 class="layui-timeline-title">8月18日</h3>
                                <!-- 正文 -->
                                <p>
                                    layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                                    <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                    <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">8月16日</h3>
                                <p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>
                                <ul>
                                    <li>《登高》</li>
                                    <li>《茅屋为秋风所破歌》</li>
                                </ul>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">8月15日</h3>
                                <p>
                                    中国人民抗日战争胜利72周年
                                    <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                    <br>铭记、感恩
                                    <br>所有为中华民族浴血奋战的英雄将士
                                    <br>永垂不朽
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title">过去</div>
                            </div>
                        </li>
                    </ul>

                </div>

                <!-- 回复我的 -->
                <div class="layui-tab-item replyMe layui-anim layui-anim-upbit">
                    <!-- 时间线 -->
                    <ul class="layui-timeline">
                        <li class="layui-timeline-item">
                            <!-- 小圆圈 -->
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <!-- 主体 -->
                            <div class="layui-timeline-content layui-text">
                                <!-- 日期 -->
                                <h3 class="layui-timeline-title">8月19日</h3>
                                <!-- 正文 -->
                                <p>
                                    layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                                    <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                    <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">8月16日</h3>
                                <p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>
                                <ul>
                                    <li>《登高》</li>
                                    <li>《茅屋为秋风所破歌》</li>
                                </ul>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">8月15日</h3>
                                <p>
                                    中国人民抗日战争胜利72周年
                                    <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                    <br>铭记、感恩
                                    <br>所有为中华民族浴血奋战的英雄将士
                                    <br>永垂不朽
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title">过去</div>
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- 写影评 -->
                <div class="layui-tab-item layui-anim layui-anim-upbit">
<<<<<<< HEAD
                    <form action="" method="post">
                        <input name="title" required lay-verify="required" placeholder="请输入影评标题" autocomplete="off" class="layui-input">
                        <br>
                        <textarea name="" required lay-verify="required" placeholder="请输入你的影评" class="layui-textarea"></textarea>
                        <div class="btns">
                            <input class="btn" type="reset" value="清空" onclick="" />
                            <input class="btn" type="button" value="存为草稿" onclick="" />
                            <input class="btn" type="submit" value="发表" />
                        </div>
                    </form>
=======

>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                </div>
            </div>
        </div>

<<<<<<< HEAD
=======

>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
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

<!-- 选项卡 -->
<script>
    $ = layui.$
    $("#nav").load("/filmos/nav");
    var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    //触发事件
    var active = {
        tabChange: function () {
            //切换到指定Tab项
            element.tabChange('demo', '22');
        }
    };

</script>
</body>
</html>
