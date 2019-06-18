<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resultlist/resultlist.css">
</head>
<body>


<div id="nav"></div>
<div class="layui-container">

    <!-- 搜索框 -->
    <input id="S-bar-text" type="text" name="" placeholder="搜索电影..." class="layui-input" lay-verify="required" style="width: 90%">
    <button type="button" class="layui-btn layui-btn-normal" id="Btn" style="position: relative;top: -40px;left: 93%;width: 80px;" >搜索</button>

    <!-- 结果显示区域 -->
    <div id="resultArea">

        <!-- 电影列表 -->
        <table class="layui-table" id="resultList">

            <!-- 分配列宽 -->
            <colgroup>
                <col width="10%">
                <col width="30%">
                <col width="10%">
                <col width="14%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
            </colgroup>
            <!-- /分配列宽 -->

            <!-- 表头 -->
            <thead>
            <tr>
                <th>影片</th>
                <th>电影名</th>
                <th>年份</th>
                <th>国家/地区</th>
                <th>类型</th>
                <th>时长</th>
                <th>评分</th>
            </tr>
            </thead>
            <!-- /表头 -->

            <!-- 列表内容 -->
            <tbody id="content" class="layui-anim layui-anim-upbit">
            <tr>
                <td style="text-align: center;margin: auto 54%;position: relative;left: 47%;padding: 22px;">
            暂无结果
                </td>
            </tr>
            </tbody>

        </table>
        <!-- /电影列表 -->

    </div>
    <!-- /结果显示区域 -->

    <!-- 分页条 -->
    <div id="demo7" align="center" style="margin-top: 50px;"></div>

</div>
<br><br>
<br>
<br><br><br>

<div id="bottom"></div>

<script src="${pageContext.request.contextPath}/resources/layui.all.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script>
    $ = layui.$;
    //调用ajax实现页面的局部刷新,将iframe的页面加载出来
    $("#nav").load("/filmos/nav");
    $("#bottom").load("/filmos/bottom");
    var name=getQueryString('search');
    var laypage = layui.laypage,
        layer = layui.layer;


    laypage.render({
        elem: 'demo7',
        count: 6,
        limit: 5,
        layout: ['count', 'prev', 'page', 'next', 'skip'],
        jump: function(obj) {

            getList(name,obj.curr);

            $('#Btn').click(function () {
                name=$('#S-bar-text').val();
                getList(name,obj.curr);
            })


        }
    });


    function getList(name,page) {
        $.get('/filmos/movie/moviename?moviename=' + name+'&pagenum='+page, function (res) {
            var temp = '';
            if(res.code==200) {
                layui.each(res.data, function (index, item) {
                    if (item.start == null) {
                        item.start = '暂无'
                    }
                    temp += '     <tr class="layui-anim layui-anim-upbit">' +
                        '                <td>' +
                        '                    <a href="/filmos/movieinfo?movieid=' + item.movieId + '">' +
                        '                        <div class="moviePic">' +
                        '                            <img src="/img' + item.movieImg + '">' +
                        '                        </div>' +
                        '                    </a>' +
                        '                </td>' +
                        '                <td>' +
                        '                    <a href="/filmos/movieinfo?movieid=' + item.movieId + '">' +
                        '                        <div class="movieName">' +
                        item.movieName +
                        '                        </div>' +
                        '                    </a>' +
                        '                </td>' +
                        '                <td>' +
                        '                    <div class="year">' +
                        item.onTime.substring(0, 4) +
                        '                    </div>' +
                        '                </td>' +
                        '                <td>' +
                        '                    <div class="country">' +
                        item.country +
                        '                    </div>' +
                        '                </td>' +
                        '                <td>' +
                        '                    <div class="movieType">' +
                        item.typeName +
                        '                    </div>' +
                        '                </td>' +
                        '                <td>' +
                        '                    <div class="movieTime">' +
                        item.movieTime +
                        '                    </div>' +
                        '                </td>' +
                        '                <td style="background: #009E94;">' +
                        '                    <div class="movieScore">' +
                        item.start +
                        '                    </div>' +
                        '                </td>' +
                        '            </tr>'

                    $('#content').html(temp)

                })
            }else {
                $('#content').html( '<tr class="layui-anim layui-anim-upbit"><td style="text-align: center;margin: auto 54%;position: relative;left: 47%;padding: 22px;">暂无结果 </td> </tr>');
            }
        })
    }


</script>

</body>
</html>

