//# sourceURL=dynamicScript.js
$ = layui.$
$(function () {

    $.ajax({
        url: "/filmos/movietype/getallmovietype",
        type: "get",
        dataType: "json",
        data: {},
        success: function (data) {
            var list = data.data;
            var tempHtml = '';
            $.each(list, function (i, item) {
                tempHtml += '<dd><a href="#" data-id="' + item.typeId + '">' + item.typeName + '</a></dd>';
            });
            $('.layui-nav-child').html(tempHtml);
        }
    })

    $('#login').click(function () {
        document.getElementById("background").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background").style.display = 'block';
        $("#search-bar").css("display","none");
        $("#search-bar").removeClass("yijingdianjile");
    })
    $('#close').click(function () {
        document.getElementById("background").className = 'animated fadeOutUpBig';
    })

    $('#register').click(function () {
        document.getElementById("background1").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background1").style.display = 'block';
        document.getElementById("text1").style.display = 'block';
        document.getElementById("text2").style.display = 'none';
        $("#search-bar").css("display","none");
        $("#search-bar").removeClass("yijingdianjile");
    })
    $('#close1').click(function () {
        document.getElementById("background1").className = 'animated fadeOutUpBig';
        $('#firstinfo').removeClass()
        $('#secondinfo').removeClass()
        document.getElementById("secondinfo").style.display = 'none';
        document.getElementById("text1").style.display = 'block';
        document.getElementById("text2").style.display = 'none';
        $("#progress-bar-inside").css("width","50%");
        document.getElementById("next").style.display='block';
        document.getElementById("submit-yes1").style.display='none';


    });
    $('#search').click(function () {


       if($("#search-bar").hasClass("yijingdianjile")){
           $("#search-bar").css("display","none");
           $("#search-bar").removeClass("yijingdianjile");
       }else {
           document.getElementById("search-bar").className = 'animated flipInX';
           $("#search-bar").css("display","block");
           $("#search-bar").addClass("yijingdianjile");

       }
    });
    $('#front').click(function () {
        document.getElementById("text1").style.display = 'block';
        document.getElementById("secondinfo").className = 'animated fadeOutLeft';
        document.getElementById("firstinfo").className = 'animated fadeInRight';
        document.getElementById("secondinfo").style.display = 'none';
        document.getElementById("front").style.display = 'none';
        document.getElementById("next").style.display='block';
        document.getElementById("submit-yes1").style.display='none';
        document.getElementById("text2").className = 'animated fadeOutLeft';
        document.getElementById("text2").style.display = 'none';
        document.getElementById("text1").className = 'animated fadeInRight';
        document.getElementById("text1").style.display = 'block';
        $("#progress-bar-inside").css("width","50%");
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
        document.getElementById("next").style.display='none';
        document.getElementById("submit-yes1").style.display='block';
        $("#progress-bar-inside").css("width","100%");
    })


});