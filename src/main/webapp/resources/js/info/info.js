    $=layui.$;
    var infoId = getQueryString('infoid');
    var movieInfoUrl = '/filmos/info/info?infoid=' + infoId;

        $.ajax({
            url: movieInfoUrl,
            type: 'get',
            data: 'json',
            success: function (data) {
                var info = data.data
                var tempHtml = '';
                tempHtml += ' <!-- 新闻标题 -->' +
                    '                <blockquote class="layui-elem-quote">' +
                    '                    <div class="newsTitile">' +
                    '                        <!-- 插入新闻标题 -->' + info.title +
                    '                    </div>' +
                    '                </blockquote>' +
                    '                <!-- 发布日期 -->' +
                    '                <div class="newsDate">' + info.createTime +
                    '                </div>' +
                    '                <!-- 消息来源 -->' +
                    '                    <div class="newsAuthor">' + info.infoFrom +
                    '                    </div>' +
                    '                <br><br>' +
                    '                <!-- 新闻图片 -->' +
                    '                <div class="newsPic">' +
                    '                    <!-- 插入新闻图片 -->' +
                    '                    <img src="/news/' + info.infoImg + '">' +
                    '                </div>' +
                    '                <!-- 新闻内容 -->' +
                    '                <div class="newsText">' +
                    '                    <!-- 插入新闻内容 -->' +
                    '                    <p style="font-size: 16px;line-height: 29px;font-family: "Arial", "Microsoft YaHei", "黑体", "宋体", sans-serif">' + info.infoContent + '</p>' +
                    '                </div>';

                $('#news').html(tempHtml);

            }

        });


        $.ajax({
            url: '/filmos/info/three',
            type: 'get',
            data: 'json',
            async:false,
            success: function (data) {
                var lists = data.data;
                var tempHtml1 = '';

                for (j = 0, len = 3; j < len; j++) {
                    tempHtml1 += ' <div class="HT">' +
                        '                    <div class="layui-row">' +
                        '                        <div class="layui-col-lg9 ">' +
                        '                            <a href="/filmos/info?infoid=' + lists[j].infoId+ '">' +
                        '                                <div class="HTkeyword">#' +
                        lists[j].title.substring(0, 8) +
                        '                                ...#</div>' +
                        '                            </a>' +
                        '                            <a href="/filmos/info?infoid=' + lists[j].infoId + '">' +
                        '                                <div class="HTinfo">' +
                        lists[j].infoContent.substring(0, 20) +
                        '                                </div>' +
                        '                            </a>' +
                        '                        </div>' +
                        '                    </div>' +
                        '                </div>';
                    $('.hottopiccontext').html(tempHtml1);
                }

            }
        });

    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURIComponent(r[2]);
        }
        return '';
    }



































