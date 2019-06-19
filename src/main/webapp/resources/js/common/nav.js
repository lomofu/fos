$ = layui.$;
var userId;
var flag=0;
$(function () {

    $.ajax({
        url: "/filmos/movietype/allmovietype",
        type: "get",
        dataType: "json",
        success: function (data) {
            var list = data.data;
            var tempHtml = '';
            $.each(list, function (i, item) {
                tempHtml += '<dd><a href="/filmos/typelist.jsp?typeid=' + item.typeId + '" data-id="' + item.typeId + '">' + item.typeName + '</a></dd>';
            });
            $('#moivetype').html(tempHtml);
        }
    });

        $.ajax({
            url: "/filmos/user/islogin",
            type: 'get',
            dataType: "json",
            headers:{
                'Content-Type': 'application/json',
                'Authorization':localStorage.getItem('token')
            },
            success: function (data) {
                if (data.code==200){
                    $("#tourist").css('display','none');
                    $("#tourist1").css('display','none');
                    $("#customer").css('display', 'block');
                    $("#customer1").css('display','block');
                    userId=data.data;
                    console.log('启动推送监听');
                    $.ajax({
                        url: "/filmos/push/followid?userid=" + userId,
                        type: 'get',
                        dataType: "json",
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': localStorage.getItem('token')
                        },
                        success: function (data) {
                            //监听关注的频道
                            var list = data.data;
                            $.each(list, function (i, item) {
                                var channel = item.toString();
                                console.log(channel);
                                var goEasy = new GoEasy({
                                    appkey: "BC-696d48c8c9794fb6a2ad85230c12365a"
                                });
                                goEasy.subscribe({
                                    channel: channel,
                                    onMessage: function (message) {
                                        layer.open({
                                            type: 1,
                                            area: ['320px', '60px'],
                                            title: false,
                                            shade: 0,
                                            offset: 'rt',
                                            closeBtn: 0,
                                            anim: 3,
                                            time:3000,
                                            content: '<span style=" font-size: 18px;margin-top: 6%;position: absolute;margin-left: 6%;">' + message.content + '</span>'
                                        });
                                    }
                                });
                            })
                        }
                    });
                }else {
                    $("#tourist").css('display','block');
                    $("#tourist1").css('display','block');
                    $("#customer").css('display', 'none');
                    $("#customer1").css('display','none');
                }
            }
        });



    $('#quit').click(function () {
        $.ajax({
            url: "/filmos/user/quit",
            type: "get",
            dataType: "json",
            data: {},
            success: function (data) {
                if (data.code == 200) {
                    $("#tourist").css('display', 'block');
                    $("#tourist1").css('display', 'block');
                    $("#customer").css('display', 'none');
                    $("#customer1").css('display', 'none');
                    layer.msg(data.msg, {
                        icon: 0, time: 700, end: function () {
                            localStorage.removeItem('token');
                            location.reload();
                        }
                    })
                } else {
                    $("#tourist").css('display', 'none');
                    $("#tourist1").css('display', 'none');
                    $("#customer").css('display', 'block');
                    $("#customer1").css('display', 'block');
                }
            }
        });
    });


    $('#login').click(function () {
        document.getElementById("background").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background").style.display = 'block';
        $("#search-bar").css("display", "none");
        $("#search-bar").removeClass("yijingdianjile");
    });

    $('#close').click(function () {
        document.getElementById("background").className = 'animated fadeOutUpBig';
    });


    $('#register').click(function () {
        document.getElementById("background1").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background1").style.display = 'block';
        document.getElementById("text1").style.display = 'block';
        document.getElementById("text2").style.display = 'none';
        $("#search-bar").css("display", "none");
        $("#search-bar").removeClass("yijingdianjile");
    });

    $('#close1').click(function () {
        document.getElementById("background1").className = 'animated fadeOutUpBig';
        $('#firstinfo').removeClass()
        $('#secondinfo').removeClass()
        document.getElementById("secondinfo").style.display = 'none';
        document.getElementById("text1").style.display = 'block';
        document.getElementById("text2").style.display = 'none';
        $("#progress-bar-inside").css("width", "50%");
        document.getElementById("next").style.display = 'block';
        document.getElementById("submit-yes1").style.display = 'none';


    });

    $('#search').click(function () {
        if ($("#search-bar").hasClass("yijingdianjile")) {
            $("#search-bar").css("display", "none");
            // document.getElementById("#search-bar").style.display='none';
            $("#search-bar").removeClass("yijingdianjile");
        } else {
            document.getElementById("search-bar").className = 'animated flipInX';
            $("#search-bar").css("display", "block");
            $("#search-bar").addClass("yijingdianjile");

        }
    });

    $('#front').click(function () {
        document.getElementById("text1").style.display = 'block';
        document.getElementById("secondinfo").className = 'animated fadeOutLeft';
        document.getElementById("firstinfo").className = 'animated fadeInRight';
        document.getElementById("secondinfo").style.display = 'none';
        document.getElementById("front").style.display = 'none';
        document.getElementById("next").style.display = 'block';
        document.getElementById("submit-yes1").style.display = 'none';
        document.getElementById("text2").className = 'animated fadeOutLeft';
        document.getElementById("text2").style.display = 'none';
        document.getElementById("text1").className = 'animated fadeInRight';
        document.getElementById("text1").style.display = 'block';
        $("#progress-bar-inside").css("width", "50%");
    })

    $('#next').click(function () {
        document.getElementById("front").style.display = 'block';
        document.getElementById("firstinfo").className = 'animated fadeOutRight';
        document.getElementById("secondinfo").className = 'animated fadeInLeft';
        document.getElementById("secondinfo").style.display = 'block';
        document.getElementById("text1").className = 'animated fadeOutLeft';
        document.getElementById("text1").style.display = 'none';
        document.getElementById("text2").className = 'animated fadeInLeft';
        document.getElementById("text2").style.display = 'block';
        document.getElementById("next").style.display = 'none';
        document.getElementById("submit-yes1").style.display = 'block';
        $("#progress-bar-inside").css("width", "100%");
    });



});
