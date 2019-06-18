$ = layui.$;
var rate = layui.rate;
var userid=$('#userId').val();

    $.ajax({
        url: "/filmos/stars/getstarsmovie?userid="+userid,
        type: 'get',
        data: 'json',
        success: function (datas) {
            if (datas.code==200){
                $('#collectCount').html('<label>收藏数</label><br>'+datas.count)
                var list = datas.data;
                var tempHtml = '';
                $.each(list,function (i,item){
                    tempHtml+='  <li>' +
                        '           <div class="LCollectPic hvr-grow-shadow">' +
                        '                   <a href="/filmos/movieinfo?movieid='+item.movieId+'">' +
                        '                        <img class="" src="/img/' + item.movieImg + '">' +
                        '                   </a>' +
                        '            </div>' +
                        '              <div class="LCollectName">' +
                        '                  <a href="/filmos/movieinfo?movieid='+item.movieId+'">' +
                                                item.movieName+
                        '                    </a>' +
                        '             </div>' +
                        '              <div class="LCollectDate">' +
                        '                  收藏于' +
                        '                 <span style="float: right;">' +
                                                    item.createTime.substring(0,11) +
                        '</span>' +
                        '   </div>' +
                        '   </li>'
                })
                $('#mystar').html(tempHtml);

                var tempHtml1='';
                for(j = 0,len=3; j < len; j++) {
                    tempHtml1+=' <li>' +
                        '                    <div class="collect">' +
                        '                        <a href="/filmos/movieinfo?movieid='+list[j].movieId+'">' +
                        '                            <div class="movie">' +
                        '                                <img src="/img'+list[j].movieImg+'">' +
                        '                            </div>' +
                        '                        </a>' +
                        '                    </div>' +
                        '                    <div class="movieName">' +
                        '                        <a href="/filmos/movieinfo?movieid='+list[j].movieId+'">' +
                        list[j].movieName +
                        '                        </a>' +
                        '                    </div>' +
                        '                </li>';

                    $('#rightboxstar').html(tempHtml1);
                }
                
            }else {
                $('#collectCount').html('<label>收藏数</label><br>0');
                $('#mystar').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">您暂时还没收藏，去看看有什么喜欢的电影吧！</div>');
                $('#rightboxstar').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">您暂时还没收藏</div>');
            }
            
        }

    });


    $.ajax({
        url: "/filmos/push/follow?userid="+userid,
        type: 'get',
        data: 'json',
        success: function (datas) {
            if (datas.code==200){
                $('#followCount').html('<label>关注数</label><br>'+datas.count)
                var list = datas.data;
                var tempHtml = '';
                $.each(list,function (i,item){
                    tempHtml+='<li id="myfollower'+item.followId+'">' +
                        '         <div class="LFuserPic hvr-grow-shadow" style="height: 48px;width: 48px" >' +
                        '                         <a href="/filmos/page/otheruser?userid=' + item.followId + '">' +
                        '                                <img src="/img'+item.userImg +'">' +
                        '                           </a>' +
                        '                                    </div>' +
                        '                                    <div class="LFuserName">' +
                        '                                        <a href="/filmos/page/otheruser?userid=' + item.followId + '">' +
                                                                        item.userName +
                        '                                        </a>' +
                        '                                    </div>' +
                        '                                    <div class="Goto">' +
                        '                                        <a href="/filmos/page/otheruser?userid='+ item.followId + '"' +
                        '                                           class="layui-btn layui-btn-sm GotoBtn">' +
                        '                                            主页' +
                        '                                        </a>' +
                        '                                    </div>' +
                        '                                    <div class="Cancel">' +
                        '                                        <button id="'+item.followId+'" type="button" class="layui-btn layui-btn-sm layui-btn-danger CancelBtn" onclick="cancelfollow(this)">取消关注</button>' +
                        '                                    </div>' +
                        '                                </li>'

                });
                $('#myfollow').html(tempHtml);

                var tempHtml1='';
                for(j = 0,len=3; j < len; j++) {
                    tempHtml1+='<li>' +
                        '          <div class="follow">' +
                        '                     <a href="/filmos/page/otheruser?userid=' + list[j].followId + '">' +
                        '                          <div class="Fuser">' +
                        '                                <img src="/img'+list[j].userImg+'">' +
                        '                            </div>' +
                        '                        </a>' +
                        '                    </div>' +
                        '                    <div class="FuserName">' +
                        '                        <a href="/filmos/page/otheruser?userid=' + list[j].followId + '">' +
                                                        list[j].userName +
                        '                        </a>' +
                        '                    </div>' +
                        '                </li>'

                    $('#rightbox').html(tempHtml1);
                }

            }else {
                $('#followCount').html('<label>关注数</label><br>0');
                $('#myfollow').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">您还有关注别人，快去看看可以关注谁吧！</div>');
                $('#rightbox').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">您还有关注别人</div>');
            }

        }

    });









