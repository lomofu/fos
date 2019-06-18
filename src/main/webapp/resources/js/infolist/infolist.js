
    function getInfoList(page) {
        $.ajax({
            url: "/filmos/info/infolist?pagenum="+page,
            type: 'get',
            data: '',
            success: function (data) {
                var list = data.data;
                var tempHtml = '';
                var tempHtml1='';
                $.each(list, function (i, item) {
                    var profile = item.infoContent;
                    tempHtml += ' <!-- 插入标注 -->' +
                        '                        <div class="news ">' +
                        '                            <div class="layui-row grid-demo ">' +
                        '                                <!-- 新闻图片 -->' +
                        '                                <div class="layui-col-md4">' +
                        '                                    <a href="/filmos/info?infoid=' + item.infoId + '"><div class="newsPic hvr-grow" >' +
                        '                                       <img src="/news' + item.infoImg + '" style="margin: 0 -90%;width: auto">' +
                        '                                    </div><a>' +
                        '                                </div>' +
                        '                                <!-- 相关信息 -->' +
                        '                                <div class="layui-col-md8">' +
                        '                                    <!-- 标题 -->' +
                        '                                    <a href="/filmos/info?infoid=' + item.infoId + '">' +
                        '                                        <div class="newsTitile">' + item.title +
                        '                                        </div>' +
                        '                                    </a>' +
                        '                                    <!-- 摘要 -->' +
                        '                                    <div class="newsInfo">' +
                        '                                        <p>' + profile.substring(0, 79) +
                        '                                        ...</p>' +
                        '                                    </div>' +
                        '                                    <!-- 详情按钮 -->' +
                        '                                    <a href="/filmos/info?infoid=' + item.infoId + '"><button  class="newsBtn layui-btn">阅读详情</button><a>' +
                        '                                    <!-- 日期 -->' +
                        '                                    <div class="newsDate">' + item.createTime +
                        '                                    </div>' +
                        '                                    <!-- 来源 -->' +
                        '                                        <div class="newsAuthor">' + item.infoFrom +
                        '                                        </div>' +
                        '                                </div>' +
                        '                            </div>' +
                        '                        </div>' +
                        '                        <br>' +
                        '                        <!-- /单个新闻 -->';
                    $('.layui-col-md12').html(tempHtml);
                });

                for(j = 0,len=3; j < len; j++) {
                    tempHtml1+=' <div class="HT">' +
                        '                    <div class="layui-row">' +
                        '                        <div class="layui-col-lg9 ">' +
                        '                            <a href="/filmos/info?infoid=' + list[j].infoId + '">' +
                        '                                <div class="HTkeyword">#' +
                        list[j].title.substring(0,11) +
                        '                                ...#</div>' +
                        '                            </a>' +
                        '                            <a href="/filmos/info?infoid=' + list[j].infoId + '">' +
                        '                                <div class="HTinfo">' +
                        list[j].infoContent.substring(0,20) +
                        '                                </div>' +
                        '                            </a>' +
                        '                        </div>' +
                        '                    </div>' +
                        '                </div>';
                    $('.hottopiccontext').html(tempHtml1);
                }

            }

        });

    }
