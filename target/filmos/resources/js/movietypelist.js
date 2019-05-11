$(function () {
    $('#login').click(function () {
        document.getElementById("background").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background").style.display = 'block';
    })
    $('#close').click(function () {
        document.getElementById("background").className = 'animated fadeOutUpBig';
    })

    $('#register').click(function () {
        document.getElementById("background1").className = 'layui-anim layui-anim-scaleSpring';
        document.getElementById("background1").style.display = 'block';
    })
    $('#close1').click(function () {
        document.getElementById("background1").className = 'animated fadeOutUpBig';

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
    })


});