$ = layui.$;

$(function () {


    var userId = getQueryString('userid');
    var userInfoUrl = '/filmos/comment/usercomment?userId=' + userId;
    var loginId;
    $.ajax({
        url: "/filmos/user/islogin",
        type: 'get',
        dataType: "json",
        async:false,
        headers: {
            'Content-Type': 'application/json',
            'Authorization': localStorage.getItem('token')
        },success:function (data) {
            loginId=data.data;
        }
    });

    if (loginId==userId){

        location.href='/filmos/page/centre';

    }



    $.ajax({
        url: "/filmos/push/follow?userid=" + userId,
        type: 'get',
        data: 'json',
        success: function (datas) {
            if (datas.code == 200) {
                $('#followCount').html('<label>关注数</label><br>' + datas.count)
                var list = datas.data;
                var tempHtml = '';
                $.each(list, function (i, item) {
                    tempHtml += '<li style="float: left;padding: 2%;margin-bottom: 9%">' +
                        '         <div class="LFuserPic hvr-grow-shadow" style="width: 48px;height: 48px" >' +
                        '                         <a href="/filmos/page/otheruser?userid=' + item.followId + '">' +
                        '                                <img src="/img' + item.userImg + '" class="">' +
                        '                           </a>' +
                        '                                    </div>' +
                        '                                    <div class="LFuserName">' +
                        '                                        <a href="/filmos/page/otheruser?userid=' + item.followId + '">' +
                        item.userName +
                        '                                        </a>' +
                        '                                    </div>' +
                        '                                    <div class="Goto">' +
                        '                                        <a href="/filmos/page/otheruser?userid=' + item.followId + '"' +
                        '                                           class="layui-btn layui-btn-sm GotoBtn">' +
                        '                                            主页' +
                        '                                        </a>' +
                        '                                    </div>' +
                        '                                </li>';
                    $('#hisfollow').html(tempHtml);

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
                })
            }else {
                $('#followCount').html('<label>关注数</label><br>0');
                $('#hisfollow').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">Ta暂时没有关注别人</div>')
                $('#rightbox').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">Ta暂时没有关注别人</div>');
            }
        }
    });


    $.ajax({
        url: "/filmos/stars/getstarsmovie?userid="+userId,
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
                $('#tastars').html(tempHtml);

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
                $('#collectCount').html('<label>收藏数</label><br>0')
                $('#tastars').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">Ta暂无收藏！</div>');
                $('#rightboxstar').html('<div style="height: 250px;text-align: -webkit-center;color: grey;margin-top: 20%;">Ta暂无收藏！</div>');
            }

        }

    })















});