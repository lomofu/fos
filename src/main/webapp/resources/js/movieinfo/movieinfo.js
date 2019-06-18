$ = layui.$;
var movieId = getQueryString('movieid');
var movieInfoUrl = '/filmos/movie/moviesinfo?movieid=' + movieId;

$.ajax({
    url: movieInfoUrl,
    type: 'get',
    data: 'json',
    success: function (data) {
        var movie = data.data;
        var tempHtml = '';
        var tempHtml2 = '';
        var tempHtml3 = '';
        var time = movie.onTime;
        var start = movie.start.toString();

        tempHtml += '<div class="bgbox">' +
            '        <!-- 插入bgpic的图片 -->' +
            '        <img class="bgpic" src="/img' + movie.movieImg + '"/>' +
            '<div class="layui-col-md4 ">' +
            '<div class="moviePic">' +
            '<span class="layui-icon layui-icon-play playbtn"></span>' +
            '<img id="pic" src="/img/' + movie.movieImg + '"></div></div>' +
            '<div class="layui-col-md7 layui-col-md-offset1"><div class="layui-row grid-demo layui-col-space20" style="margin-top: 17px"><br><div class="layui-col-md8">' +
            '    <span class="movieName">' + movie.movieName + '</span>' +
            '    <span class="year">(' + time.substring(0, 5) + ')</span>' +
            '    </div>' +
            '    <div class="score" id="score" style="display:block;">' + start.substring(0, 3) + '</div>' +
            '    <div class="layui-col-md8">' +
            '    <label>国家地区：</label>' +
            '<span class="country">' + movie.country + '</span>' +
            '    </div>' +
            '    <div class="layui-col-md8">' +
            '    <label>上映时间：</label>' +
            '<span class="movieDate">' + time.substring(0, 11) + '</span></div>' +
            '<div class="layui-col-md12"><label>语言：</label>' +
            '<span class="language">' + movie.language + '</span></div>' +
            '<div class="layui-col-md12"><label>类型：</label>' +
            '<span class="movieType">' + movie.typeName + '</span></div>' +
            '<div class="layui-col-md12"><label>时长：</label>' +
            '<span class=movieTime">' + movie.movieTime + '</span></div>' +
            '<div class="layui-col-md12"><label>导演：</label>' +
            '<span class="master">' + movie.director + '</span></div>' +
            '<div class="layui-col-md12"><label>主演：</label>' +
            '<div class="actors">' + movie.actor + '</div></div></div></div>';
        $('#themovieinfo').html(tempHtml);
        tempHtml2 += '<p style="position: relative;top: 15px;left: 25px;">剧情：</p>' +
            '<p id="movieInfo">' + movie.profile + '</p>';
        $('#profile').html(tempHtml2);

        if (start == 0) {
            document.getElementById("score").style.display = 'none';
        }

        $('.playbtn').click(function () {
            layer.open({
                type: 1,
                title: false,
                anim: 0,
                shade: 0.7,
                scrollbar: false,
                closeBtn: 0, //不显示关闭按钮
                area: ['1282px', '724px'], //宽高
                shadeClose: true, //开启遮罩关闭
                content: '<div  style="background: black"><video width="1280px" height="720px" controls preload="auto" autoplay="autoplay">' +
                    '<source src="/video' + movie.movieVideo + '"type="video/mp4"></video></div>'
            });
        });

    }
});

function getReply(commentId) {
    $.ajax({
        url: '/filmos/reply/replybycommentid?commentid=' + commentId,
        type: 'get',
        data: 'json',
        success: function (data) {
            var replyId;
            if (data.code == 200) {
                var list = data.data;
                var temp = '';
                $.each(list, function (i, item) {
                    temp += '<div class="layui-row grid-demo commentLoaction">' +
                        '<div class="layui-col-md9 layui-col-md-offset1 " style="background: rgba(255, 188, 4, 0.07)">' +
                        '<div class="layui-row grid-demo ">' +
                        '<div class="layui-col-md1 ">' +
                        '<div class="RuserPic"><a href="/filmos/page/otheruser?userid=' + item.userId + '"><img class="hvr-pulse" src="/img' + item.userImg + '" style="border-radius:100%;"></a></div>' +
                        '</div>' +
                        '<div class="layui-col-md9">' +
                        '<a href="/filmos/page/otheruser?userid=' + item.userId + '"><div class="RuserName">' + item.userName + '</div></a>' + '</div>' +
                        '<div class="layui-col-md9 ">' +
                        '<p class="RcommentText">' + item.rcontent + '</p>' +
                        '</div><br><br><br><br>' +
                        '<div class="layui-col-md9 layui-col-md-offset1">' +
                        '    <div class="RcommentInfo">' +
                        '    <span class="RcommentDate">' + item.createTime +
                        '    </span>' +
                        '    </div>' +
                        '    </div>' +
                        '    </div>' +
                        '    </div>' +
                        '    </div>' +
                        '    <br></div><br>';
                    $('.replys' + commentId).html(temp);
                });
            }else {
                $('.replys' + commentId).html('<div style="background: rgba(255, 188, 4, 0.07);text-align: center;padding: 4%;font-size: 14px;position: relative;top: -20px;color: grey">暂无评论！</div><br>');
            }
        }
    })
}




