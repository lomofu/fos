<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <head>
        <meta charset="utf-8">
        <title>Top排行榜</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/hover-min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/top/top20.css">
        <style type="text/css">
            .imghvr-slide-right figcaption {
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%);
            }
        </style>

    </head>

<body>

<div id="nav" style="z-index: 99!important;"></div>
<br><br>
<h1 style="text-align: center;font-size: 40px;color: #555555;z-index: 10!important;">Top 排行榜</h1>
<br>
<div id="iconss" class="layui-icon layui-icon-find-fill"
     style="text-align: center;font-size: 50px;color: #ff0000;margin: 36px"></div>
<br>

<div class="layui-container">

    <div class="layui-cow">

        <!-- Top20榜 -->
        <div class="layui-col-lg10 layui-col-lg-offset1" id="TopList">

            <!-- 前三图片榜 -->
            <div class="layui-cow ">
                <p style="text-align: center;color: rgba(0,0,0,0.51)">*此榜单更新为一周一次</p>
                <!-- Top1 -->
                <div id="Top1">
                    <!-- Top1的电影信息 -->


                </div>
                <!-- /Top1 -->

                <!-- Top20标题 -->
                <div id="Top20">TOP20榜单</div>
                <br>

                <!-- Top2,Top3的区域 -->
                <div id="Top2and3">

                    <!-- Top2 -->
                    <div id="Top2">
                        <!-- 电影海报图(竖图) -->
                        

                    </div>
                    <!-- /Top2 -->


                    <!-- Top3 -->
                    <div id="Top3">

                        <!-- 电影海报图(横图) -->
                        

                    </div>
                    <!-- /Top3 -->

                </div>
                <!-- /Top2,Top3及标题的区域 -->

            </div>
            <!-- /前三图片榜 -->

            <!-- 分割标题 -->
            <div class="layui-cow">
                <div id="Top420">
                    Top4~Top20
                </div>
            </div>

            <!-- 需插入数据 -->
            <!-- Top4~Top20文字榜 -->
            <div class="layui-cow">

                
                <span id="4-20">

              
                </span>
            </div>
            <!-- Top4~Top20文字榜 -->
       
        </div>
        <!-- /Top20榜 -->

    </div>

</div>


<script src="${pageContext.request.contextPath}/resources/layui.all.js" type="text/javascript" charset="utf-8"></script>
<script>
    $ = layui.$
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");


    $.get('/filmos/rank/rank20', function(res) {
         var list=res.data;
        $('#Top1').html(' <div id="Top1Name"><img src="resources/images/top/top1.png"' +
            '                             style="z-index: 999; position: absolute;width: 65px;height: auto;left: 88%;top: 75px;">' +
            '                        <span style="font-size: 5em; font-weight: 900;color: black;text-shadow: 1px 0px 2px #00000047">1</span>' +
            '                        <span style="font-size: 4em;">.</span>' +
            '' +
            '                        <!-- 电影名 -->' +
            '                        <span class="movieName" style="font-size: 2.5em;">' +
            '<!-- 插入电影名 -->' +
            list[0].movieName +
            '</span>' +
            '' +
            '                        <!-- 年份 -->' +
            '                        <span class="movieYear" style="font-size: 2em;">' +
            '<!-- 插入年份 -->' +
            '('+list[0].onTime.substring(0,4)+')' +
            '</span></div>' +
            '                    <br>' +
            '                    <!-- Top1海报图(横图) -->' +
            '                    <a href="/filmos/movieinfo?movieid='+list[0].movieId+'"><div id="Top1Pic">' +
            '                        <!-- 插入超链接 -->' +
            '                       ' +
            '                            <!-- 插入海报图片(横图) -->' +
            '                            <img src="/img'+list[0].movieImg+'"></div></a>' +
            '                        ');
        
        
        $('#Top2').html('<img src="resources/images/top/top2.png"' +
            '                             style="z-index: 999; position: absolute;width: 50px;height: auto;left: 10%;top: 1140px;">' +
            '                        <div id="Top2Pic">' +
            '                            <!-- 插入超链接 -->' +
            '                          <a href="/filmos/movieinfo?movieid='+list[1].movieId+'">' +
            '                                <!-- 插入海报图(竖图) -->' +
            '                                <img src="/img'+list[1].movieImg+'">' +
            '                            </a>' +
            '                        </div>' +
            '' +
            '                        <!-- Top2的电影信息 -->' +
            '                        <div id="Top2Name">' +
            '                            <div class="text">' +
            '                                <span style="font-size: 3.5em; font-weight: 900;color: black;text-shadow: 1px 0px 2px #00000047">2</span>' +
            '                                <span style="font-size: 3em;">.</span>' +
            '' +
            '                                <!-- 电影名 -->' +
            '                                <span style="font-size: 2.5em;">' +
            list[1].movieName +
            '</span>' +
            '' +
            '                                <!-- 年份 -->' +
            '                                <span style="font-size: 2.2em;">' +
            '<!-- 插入年份 -->' +
            '('+list[1].onTime.substring(0,4)+')' +
            '</span>' +
            '' +
            '                            </div>' +
            '                        </div>')
        
        
        
        $('#Top3').html('<div id="Top3Pic">' +
            '                            <img src="resources/images/top/top3.png"' +
            '                                 style="z-index: 999; position: absolute;width: 50px;height: auto;left: 52%;top: 1140px;">' +
            '                            <!-- 插入超链接 -->' +
            '                             <a href="/filmos/movieinfo?movieid='+list[2].movieId+'">' +
            '                                <!-- 插入海报图片(横图) -->' +
            '                        <img src="/img'+list[2].movieImg+'">       ' +
            '                            </a>' +
            '                        </div>' +
            '' +
            '                        <!-- Top3的电影信息 -->' +
            '                        <div id="Top3Name">' +
            '                            <div class="text">' +
            '                                <span style="font-size: 3.5em; font-weight: 900;color: black;text-shadow: 1px 0px 2px #00000047">3</span>' +
            '                                <span style="font-size: 3em;">.</span>' +
            '' +
            '                                <!-- 电影名 -->' +
            '                                <span style="font-size: 2.5em;">' +
            '<!-- 插入电影名 -->' +
            list[2].movieName +
            '</span>' +
            '' +
            '                                <!-- 年份 -->' +
            '                                <span style="font-size: 2.2em;">' +
            '<!-- 插入年份 -->' +
            '('+list[2].onTime.substring(0,4)+')' +
            '</span>' +
            '' +
            '                            </div>' +
            '                        </div>')
        
        
        
            var temp='';

        for(j = 3,len=19; j < len; j++) {

            var num=j+1;
            temp+='<div class="layui-col-lg12">' +
                '' +
                '                    <!-- 插入超链接 -->' +
                '                   <a href="/filmos/movieinfo?movieid='+list[j].movieId+'">' +
                '                        <div class="TopO">' +
                '' +
                '                            <!-- 电影名 -->' +
                '                            <span class="movieName">' +
                '<!-- 插入电影名 -->' +
                list[j].movieName +
                '</span>' +
                '' +
                '                            <!-- 年份 -->' +
                '                            <span class="movieYear">' +
                '<!-- 插入年份 -->' +
                '('+list[j].onTime.substring(0,4)+')' +
                '</span>' +
                '' +
                '                        </div>' +
                '                    </a>' +
                '                    <!-- 排名数 -->' +
                '                    <div class="TopNum">'+num+'</div>' +
                '                </div>'


            $('#4-20').html(temp);
        }















        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</script>

</body>
</html>
