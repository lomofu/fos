<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Movie</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css">
    <html>
<body>
<!--加载导航栏-->
<div id="nav"></div>

<!--加载页面主题-->
<div class="layui-container" id="container">
    <div class="layui-fluid">
        <table id="movieList">
            <tr>
                <th style="width: 80px">ID</th>
                <th style="width: 250px">电影海报</th>
                <th style="width: 250px">电影名</th>
                <th style="width: 150px">上映时间</th>
                <th style="width: 200px">国家</th>
                <th style="width: 200px">语言</th>
                <th style="width: 80px">评分</th>
            </tr>
        </table>
    </div>
</div>

<%--<script !src=""></script>--%>
<script src="${pageContext.request.contextPath}/resources/layui.all.js"></script>


<%--<script>--%>
<%--    layui.use('table', function(){--%>
<%--        var table = layui.table;--%>

<%--        //第一个实例--%>
<%--        table.render({--%>
<%--            elem: '#movieList'--%>
<%--            ,height: 1000--%>
<%--            ,url: '/movietList/table/user/' //数据接口--%>
<%--            ,page: true //开启分页--%>
<%--            ,cols: [[ //表头--%>
<%--                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}--%>
<%--                ,{field: 'moviePic', title: '电影海报', width:250}--%>
<%--                ,{field: 'movieName', title: '电影名', width:250}--%>
<%--                ,{field: 'uoDate', title: '上映时间', width:150, sort: true}--%>
<%--                ,{field: 'country', title: '国家', width:200}--%>
<%--                ,{field: 'language', title: '语言', width: 200}--%>
<%--                ,{field: 'score', title: '评分', width: 80, sort: true}--%>
<%--            ]]--%>
<%--        });--%>

<%--    });--%>
<%--</script>--%>

<script type="text/javascript">
    $ = layui.$
    ;!function () {
        $(function () {
            //调用ajax实现页面的局部刷新,将iframe的页面加载出来
            $("#nav").load("nav");
        });
    }();
</script>
</body>
</html>
