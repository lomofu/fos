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
            <div carousel-item id="headlinecontent">

            </div>
        </div>
    </div>
        <br><br><br> <br>

        <div style="background: black; width: 100%;height: auto; overflow: inherit; padding: 0 16.65%; position: relative; left:-16.7%; ">
            <br><br><br>
            <div class="layui-icon layui-icon-top top" style="font-weight: 800"></div>
            <a href="top.jsp"><div class="title1">院线热映</div></a>
        <br>
    <a href="top.jsp"><div class="More+1">排行榜</div></a>


    <!-- 图片排行榜 -->
    <div id="NoList">

        <!-- No.4 -->
        <div id="No4">

        </div>
        <!-- /No.4 -->

        <!-- No.2 -->
        <div id="No2">
            <!-- 动效 -->
           

        </div>
        <!-- /No.2 -->

        <!-- No.1 -->
        <div id="No1">

            <!-- 动效 -->
          

        </div>
        <!-- /No.1 -->

        <!-- No.3 -->
        <div id="No3">

            <!-- 动效 -->
           

        </div>
        <!-- /No.3 -->

        <!-- No.5 -->
        <div id="No5">

            <!-- 动效 -->
           
        </div>
        <!-- /No5 -->
    </div>

        </div>


        <br><br>
        <div class="layui-icon layui-icon-fire fire "></div>
        <br><br><br> <br><br><br> <br><br><br><br><br><br>
    <!-- /图片排行榜 -->

       <div class="title2 ">最新热点</div>
         <a href="infolist.jsp"><div class="More+2">更多</div></a>
    <%--最新热点--%>
    <div class="layui-cow" >
        <%--热点列表--%>

        <div class="layui-col-lg12" id="HTList">
            <div class="layui-cow" id="newscontent">
                
                
            </div>
        </div>
    </div>

    <%--/最新热点--%>


</div>

<div id="bottom"></div>
<%--<script !src=""></script>--%>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>

<script>
    $ = layui.$;
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");
    var carousel = layui.carousel;
    //建造实例



    var ins=carousel.render({
        elem: '#headline'
        , width: '100%' //设置容器宽度
        , height: '525px'//设置容器高度
        , arrow: 'hover' //始终显示箭头
        , indicator: 'none'//指示器不显示
        , anim: 'fade' //切换动画方式
        ,indicator:'outside'
    });


    $.get('/filmos/info/infolist?pagenum=1', function(res) {
        var tempHtml='';
        var tempHtml2=''
        var list=res.data;
        $.each(list,function (i,item){
            tempHtml+='<a href="/filmos/info?infoid='+item.infoId+'"><div><img src="resources/images/headline/bgG.png" style="width: 161px;height: auto;position: absolute;"><span style="text-align: center;font-size: 15px;font-size: 45px;position: absolute;top: 76%;left: 12%;font-weight: bold;color: white;background: #00000087;padding: -5%;width: 80%;height: 13%">'+item.title.substring(0,18)+'</span><img src="/news'+item.infoImg +'" style="width: 100%;height: 100%"></div></a>';
            $('#headlinecontent').html(tempHtml);
            ins.reload({elem: '#headline'});
        });

        for(j = 0,len=3; j < len; j++) {

            tempHtml2 += '<div class="layui-col-md4">' +
                '                    <div class="Nnews ">' +
                '                       <a href="/filmos/info?infoid='+list[j].infoId+'"> <div class="NnewsPic hvr-grow-shadow">' +
                '                            <img src="/news'+ list[j].infoImg+ '">' +
                '                        </div></a>' +
                '                        <a href="/filmos/info?infoid='+list[j].infoId+'">' +
                '                            <div class="NnewsTitle">' +
                list[j].title.substring(0,5)+
                '                            </div>' +
                '                        </a>' +
                '                        <div class="NnewsInfo">' +
                list[j].infoContent.substring(0,9)+
                '                        </div>' +
                '                    </div>' +
                '                </div>';
                $('#newscontent').html(tempHtml2);

        }

    });
    $.ajaxSettings.async = false;

        $.get('/filmos/rank/rank5', function(res) {
            var list=res.data;
            var top1='';
            var top2='';
            var top3='';
            var top4='';
            var top5='';
            for (j=0;j<4;j++){
                if(list[j].avgStart==null){

                    list[j].avgStart=0;
                    if (list[j].count==null){
                        list[j].count=0;
                    }
                }
            }
             top1 +='' +
                 '<a href="/filmos/movieinfo?movieid='+list[3].movieId+'"><figure class="imghvr-slide-right hvr-grow-shadow TPic">' +
                 '' +
                 '    <!-- 海报图 -->' +
                 '  <div class="TPic">' +
                 '        <!-- 插入电影海报图片 -->' +
                 '          <img src="/img/'+list[3].movieImg+'">' +
                 '    </div>' +
                 '' +
                 '    <figcaption>' +
                 '        <!-- 内容 -->' +
                 '        <div id="No4info">' +
                 '            <!-- 排行 -->' +
                 '' +
                 '            <div id="T4">Top4</div>' +
                 '            <!-- 电影信息 -->' +
                 '            <div id="Tmovie4">' +
                 '                <!-- 电影名 -->' +
                 '                <span class="TmovieName">' +
                 '<!-- 插入电影名 -->' +
                 list[3].movieName +
                 '</span>' +
                 '                <!-- 年份 -->' +
                 '                <span class="Tyear">' +
                 '<!-- 插入年份 -->' +
                 '('+list[3].onTime.substring(0,4)+')' +
                 '</span>' +
                 '            </div>' +
                 '' +
                 '            <!-- 评分 -->' +
                 '            <div class="TS">' +
                 '                <label class="label">评分:</label><br>' +
                 '                <span id="score4">' +
                 '<!-- 插入评分 -->' +
                 list[3].avgStart +
                 '</span>' +
                 '            </div>' +
                 '            <!-- 热度 -->' +
                 '            <div class="TH">' +
                 '                <label class="label">热度:</label><br><br>' +
                 '                <span id="hot4">' +
                 '<!-- 热度 -->' +
                 list[3].count +
                 '</span>' +
                 '            </div>' +
                 '        </div>' +
                 '' +
                 '    </figcaption>' +
                 '</figure></a>';

            $('#No4').html(top1);

            top2+='<a href="/filmos/movieinfo?movieid='+list[1].movieId+'"> <figure class="imghvr-slide-left hvr-grow-shadow TPic">' +
                '                <div class="TPic">' +
                '                    <img src="/img/'+list[1].movieImg+'">' +
                '                </div>' +
                '                <figcaption>' +
                '                    <!-- 内容 -->' +
                '                    <div id="No2info">' +
                '                        <!-- 排名 -->' +
                '                        <div id="T2">Top2</div>' +
                '' +
                '                        <!-- 电影信息 -->' +
                '                        <div id="Tmovie2">' +
                '                            <!-- 电影名 -->' +
                '                            <span class="TmovieName">' +
                '<!-- 插入电影名 -->' +
                list[1].movieName +
                '</span>' +
                '                            <!-- 年份 -->' +
                '                            <span class="Tyear">' +
                '<!-- 插入年份 -->' +
                '('+list[1].onTime.substring(0,4)+')' +
                '</span>' +
                '                        </div>' +
                '' +
                '                        <!-- 评分 -->' +
                '                        <div class="TS">' +
                '                            <label class="label">评分:</label><br>' +
                '                            <span id="score2">' +
                '<!--插入评分 -->' +
                list[1].avgStart +
                '</span>' +
                '                        </div>' +
                '                        <!-- 热度 -->' +
                '                        <div class="TH">' +
                '                            <label class="label">热度:</label><br><br>' +
                '                            <span id="hot2">' +
                '<!-- 插入热度 -->' +
                list[1].count +
                '</span>' +
                '                        </div>' +
                '                    </div>' +
                '                </figcaption>' +
                '            </figure></a>'

            $('#No2').html(top2);

            top3+='<a href="/filmos/movieinfo?movieid='+list[0].movieId+'"> <figure class="imghvr-slide-up hvr-grow-shadow TPic">' +
                '                <div class="TPic">' +
                '                    <img src="/img/'+list[0].movieImg+'">' +
                '                </div>' +
                '                <figcaption>' +
                '                    <div id="No1info">' +
                '                        <div id="T1">Top1</div>' +
                '                        <!-- 电影信息 -->' +
                '                        <div id="Tmovie1">' +
                '                            <!-- 电影名 -->' +
                '                            <span class="TmovieName">' +
                list[0].movieName +
                '</span>' +
                '                            <!-- 年份 -->' +
                '                            <span class="Tyear">' +
                '<!-- 插入年份 -->' +
                '('+list[0].onTime.substring(0,4)+')' +
                '</span>' +
                '                        </div>' +
                '' +
                '                        <!-- 评分 -->' +
                '                        <div class="TS">' +
                '                            <label class="label">评分:</label><br>' +
                '                            <span id="score1">' +
                '<!--插入评分 -->' +
                list[0].avgStart +
                '</span>' +
                '                        </div>' +
                '                        <!-- 热度 -->' +
                '                        <div class="TH">' +
                '                            <label class="label">热度:</label><br><br>' +
                '                            <span id="hot1">' +
                '<!-- 插入热度 -->' +
                list[0].count +
                '</span>' +
                '                        </div>' +
                '                    </div>' +
                '' +
                '                </figcaption>' +
                '            </figure></a>'

        $('#No1').html(top3);

        top4+='<a href="/filmos/movieinfo?movieid='+list[2].movieId+'"> <figure class="imghvr-slide-right hvr-grow-shadow TPic">' +
            '' +
            '                <!-- 海报图 -->' +
            '                <div class="TPic">' +
            '                    <!-- 插入电影海报图 -->' +
            '                    <img src="/img/'+list[2].movieImg+'">' +
            '                </div>' +
            '' +
            '                <figcaption>' +
            '                    <!-- 内容 -->' +
            '                    <div id="No3info">' +
            '                        <!-- 排名 -->' +
            '                        <div id="T3">Top3</div>' +
            '' +
            '                        <!-- 电影信息 -->' +
            '                        <div id="Tmovie3">' +
            '                            <!-- 电影名 -->' +
            '                            <span class="TmovieName">' +
            '<!-- 插入电影名 -->' +
            list[2].movieName +
            '</span>' +
            '                            <!-- 年份 -->' +
            '                            <span class="Tyear">' +
            '<!-- 插入年份 -->' +
            '('+list[2].onTime.substring(0,4)+')' +
            '</span>' +
            '                        </div>' +
            '' +
            '                        <!-- 评分 -->' +
            '                        <div class="TS">' +
            '                            <label class="label">评分:</label><br>' +
            '                            <span id="score3">' +
            '<!--插入评分 -->' +
            list[2].avgStart +
            '</span>' +
            '                        </div>' +
            '                        <!-- 热度 -->' +
            '                        <div class="TH">' +
            '                            <label class="label">热度:</label><br><br>' +
            '                            <span id="hot3">' +
            '<!-- 插入热度 -->' +
            list[2].count +
            '</span>' +
            '                        </div>' +
            '                    </div>' +
            '' +
            '                </figcaption>' +
            '            </figure></a>';

            $('#No3').html(top4);

            top5+='<a href="/filmos/movieinfo?movieid='+list[4].movieId+'"> <figure class="imghvr-slide-left hvr-grow-shadow TPic">' +
                '                <div class="TPic">' +
                '                    <img src="/img/'+list[4].movieImg+'">' +
                '                </div>' +
                '                <figcaption>' +
                '                    <div id="No5info">' +
                '                        <div id="T5">Top5</div>' +
                '                        <div id="Tmovie5">' +
                '                            <span class="TmovieName">' +
                list[4].movieName +
                '</span>' +
                '                            <!-- 年份 -->' +
                '                            <span class="Tyear">' +
                '<!-- 插入年份 -->' +
                '('+list[4].onTime.substring(0,4)+')' +
                '</span>' +
                '                        </div>' +
                '                        <!-- 评分 -->' +
                '                        <div class="TS">' +
                '                            <label class="label">评分:</label><br>' +
                '                            <span id="score5">' +
                '<!--插入评分 -->' +
                list[4].avgStart +
                '</span>' +
                '                        </div>' +
                '                        <!-- 热度 -->' +
                '                        <div class="TH">' +
                '                            <label class="label">热度:</label><br><br>' +
                '                            <span id="hot5">' + list[4].count +
                '</span>' +
                '                        </div>' +
                '                    </div>' +
                '' +
                '                </figcaption>' +
                '            </figure></a>';
                $('#No5').html(top5);

    });
</script>
</body>
</html>









