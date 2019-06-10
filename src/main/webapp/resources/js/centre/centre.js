$ = layui.$;
var rate = layui.rate;
var userid=$('#userId').val();
console.log(userid);
$(function () {
    $.ajax({
        url: "/filmos/comment/usercomment",
        type: 'get',
        data: user,
        success: function (datas) {
            var list = datas.data;
            var tempHtml = '';
           $('#commentCount').html('<label>影评数</label><br>'+datas.count);
           if (datas.code==200) {
               $.each(list, function (i, item) {

                   tempHtml += '<li class="layui-timeline-item">' + '<i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                       '<div class="layui-timeline-content layui-text" >' +
                       '<br><br><h3 class="layui-timeline-title">' + item.createTime + '</h3>' + '<p style="overflow: hidden">' + item.content +
                       ' </p><br><img style="width: 27%;" src="/img/' + item.movieImg + '">' +
                       '<h1 style="position: relative;top: -134px;left: 82%;font-size: 60px;width: 41px;height: -1px;color: #5FB878">' + item.start + '</h1>' +
                       '<h3 style="position: relative;top: -134px;left: 87%;font-size: 20px;width: 41px;height: -1px;color: #5FB878">分</h3>' +
                       '</div>' + '<div style="position:relative;left: 44%"></div><a style="position: relative;left: 94%;top: 10px;color: crimson;cursor: pointer" onclick="deleter();">删除</a></li>';

                   $('#usercomment').html(tempHtml);


               });
           }else {
               $('#usercomment').html('<span style="margin-left: 37%;color:grey ">你还没有影评，快去发表吧！</span>');
           }
        }
    });

    $.ajax({
        url: "/filmos/reply/replybyuserid?userid="+userid,
        type: 'get',
        data: 'json',
        success: function (datas) {
            var list = datas.data;
            var tempHtml = '';
            if (datas.code==200) {
                $.each(list, function (i, item) {
                    tempHtml += '<li class="layui-timeline-item">' +
                        '<i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                        '<div class="layui-timeline-content layui-text" >' +
                        '<br><br>' +
                        '<h3 class="layui-timeline-title">' + item.createTime + '</h3>' +
                        '<a href="/filmos/page/otheruser?userid=' + item.userId + '"><img src="/img' + item.userImg + '" style="background-color: #0F9E5E;width: 50px;height: 50px"></a>' +
                        '<a href="/filmos/page/otheruser?userid=' + item.userId + '"><span style="font-size: 17px;position: absolute;margin-left: 1%;margin-top: 2.5%;color: black">' +
                        item.userName +
                        ': </span></a>' +
                        '<p style="overflow: hidden;margin-left: 16%;margin-top: -5%;font-size: 17px">' +
                        item.rcontent +
                        ' </p><br>' +
                        '<i><p style="overflow: hidden;margin-left: 17%;margin-top: 0%;font-size: 14px;background-color:#c9c9c961">' +
                        item.content + '</p></i>' +
                        '</div></li>';

                    $('#userreply').html(tempHtml);

                });

            }else {
                $('#userreply').html('<span style="margin-left: 37%;color:grey ">暂时还没有人回复你哦~</span>');
            }
        }
    });










});