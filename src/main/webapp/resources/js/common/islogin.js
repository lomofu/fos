$ = layui.$;
$.ajax({
    url: "/filmos/user/islogin",
    type: 'get',
    dataType: "json",
    async:false,
    headers: {
        'Content-Type': 'application/json',
        'Authorization': localStorage.getItem('token')
    },
    error: function () {
        window.location = "/filmos/nologin"
    }
});


