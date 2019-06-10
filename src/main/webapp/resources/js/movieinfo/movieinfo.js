$ = layui.$;

$(function () {

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
                '    <div class="score" id="score" style="display:block;">' + start.substring(0,3) + '</div>' +
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
                    scrollbar:false,
                    closeBtn: 0, //不显示关闭按钮
                    area: ['1282px', '724px'], //宽高
                    shadeClose: true, //开启遮罩关闭
                    content: '<div  style="background: black"><video width="1280px" height="720px" controls preload="auto" autoplay="autoplay">' +
                        '<source src="/video' + movie.movieVideo + '"type="video/mp4"></video></div>'
                });
            });

            $.ajax({
                url: '/filmos/comment/moviecomment?movieid=' + data.data.movieId,
                type: 'get',
                data: 'json',
                success: function (data) {
                    if (data.code == 200) {
                        var list = data.data;
                        $.each(list, function (i, item) {
                            var img = item.userImg;

                            tempHtml3 += '<br><br><br><br><br><div class="layui-row grid-demo commentLoaction" id="comment'+item.userId+'" >' +
                                '<div class="layui-col-md1 ">' +
                                '<div class="CuserPic"   >' +
                                '<a  href="/filmos/page/otheruser?userid=' + item.userId + '">' +
                                '<img class="hvr-grow"  id="imgs" src="/img' + img + '" style="border-radius:100%;box-shadow: 0 0 6px 0px #33333369;display: block">' +
                                '</a>' +
                                '</div>' +
                                '</div>' +
                                '<span style="position: relative;left: 2%;font-size: 26px;background: #009688;color: white;">' + item.start + '分' +
                                '</span>' +
                                '<div class="layui-col-md9">' +
                                '<div class="CuserName">' +
                                '<a href="/filmos/page/otheruser?userid=' + item.userId + '">' + item.userName +
                                '</a>' +
                                '</div>' +
                                '</div><br><br><br>' +
                                '<div class="layui-col-md9 ">' +
                                '<p class="commentText">' + item.content +
                                '</p>' +
                                '</div>' +
                                '<br>' +
                                '<br>' +
                                '<br>' +
                                '<br>' +
                                '<br>' +
                                '<div class="layui-col-md9 layui-col-md-offset1">' +
                                '<div class="commentInfo">' +
                                '<span class="layui-icon layui-icon-reply-fill showcomment" style="cursor: pointer" >' +
                                '</span>' +
                                '<span class="replyBtn" style="position: relative;left: 48%;">回复' +
                                '</span>' +
                                '<span class="commentDate" >' + item.createTime + '' +
                                '</span>' +
                                '</div><br><br>' +
                                '<span  id="replys'+item.commentId+'">' +
                                '</span><DIV style="BORDER-TOP: #99999970 1px dashed;margin-left: -14%;width: 131%"></DIV></div></div><br>';

                            $('#moviecomments').html(tempHtml3);



                            var commentId=item.commentId;
                            $.ajax({
                                url: '/filmos/reply/replybycommentid?commentid=' + commentId,
                                type: 'get',
                                data: 'json',
                                success: function (data) {
                                    if (data.code == 200) {
                                        var list = data.data;
                                        $.each(list, function (i, item) {
                                            $('#replys'+commentId).html('<div class="layui-row grid-demo commentLoaction">' +
                                            '<div class="layui-col-md9 layui-col-md-offset1 ">' +
                                            '<div class="layui-row grid-demo ">' +
                                            '<div class="layui-col-md1 ">' +
                                            '<div class="RuserPic"><img src="/img'+item.userImg+'" style="border-radius:100%;box-shadow: 0 0 6px 0px #33333369;"></div>' +
                                            '</div>' +
                                            '<div class="layui-col-md9">' +
                                            '<div class="RuserName">'+item.userName+ '</div>' + '</div>' +
                                            '<div class="layui-col-md9 ">' +
                                            '<p class="RcommentText">'+item.rcontent + '</p>' +
                                            '</div><br><br><br><br>' +
                                            '<div class="layui-col-md9 layui-col-md-offset1">' +
                                            '    <div class="RcommentInfo">' +
                                            '    <span class="RcommentDate">' + item.createTime+
                                            '    </span>' +
                                            '    </div>' +
                                            '    </div>' +
                                            '    </div>' +
                                            '    </div>' +
                                            '    </div>' +
                                            '    <br><br><br><br><br></div>');
                                        });

                                    }else {
                                        $('#replys'+commentId).html('<span class="replys" style="margin-left: 37%;color:grey;">暂时还没有回复哦~</span>');
                                    }

                                    $('.showcomment').click(function () {
                                        if ($('#replys'+commentId).hasClass('yijingdianji')){
                                            $('#replys'+commentId).css('display', 'none');
                                            $('#replys'+commentId).removeClass('yijingdianji');
                                        } else {
                                            $('#replys'+commentId).css('display', 'block');
                                            $('#replys'+commentId).addClass('yijingdianji');
                                        }

                                    });
                                }
                            });

                            $("#replyBtn").click(function () {
                                layer.prompt({
                                    title: '写下你的回复',
                                    formType: 2
                                }, function (text, index) {
                                    layer.close(index);
                                    layer.msg('已回复');
                                });
                            });
                        });



                    } else {
                        tempHtml3 += '<br><br><br><div class="layui-row grid-demo commentLoaction" >' +
                            '<div class="layui-col-md1 ">' +
                            '    <div class="layui-col-md9">' +
                            '    </div><br><br><br>' +
                            '    <div class="layui-col-md9 ">' +
                            '    <p class="commentText" style="margin-left: 300%!important;text-indent: -17px!important;left: 400%!important;line-height: 20px!important;">暂无评论</p></div><br><br><br><br><br><br><br>';
                        $('#moviecomments').html(tempHtml3);
                    }
                }
            })
        }
    });




});
