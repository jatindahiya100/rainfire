function validate_user() {
    var x = JSON.parse(sessionStorage.getItem('key'));

    if (sessionStorage.getItem('key') === null) {
        window.location.href = 'index.html';
    } else {
        var id = window.atob(x[0]);
        var key = window.atob(x[1]);

        $.ajax({
            url: 'api/verify_user.php',
            type: 'POST',
            data: {
                id: id,
                password: key
            },
            success: function (data) {
                if (data != '1') {
                    window.location.href = 'index.html';
                }
            }
        });
    }
}
validate_user();




var x = 1;
$('#menu').on("click", function () {
    if (x == '1') {
        x = 0;
        $('nav').css("width", "0");
        $('.main').css('margin-left', '0');
        $('.nav-items').css('display', 'none');
        $('.main').css('width', '100%');
    } else if (x == '0') {
        x = 1;
        $('nav').css("width", "300px");
        $('.main').css('margin-left', '300px');
        setTimeout(() => {
            $('.nav-items').css('display', 'flex');
        }, 200);
        $('.main').css('width', 'calc(100% - 300px)');
    }

});

$('li').on("click", function () {
    $('li.active').removeClass('active');
    $(this).addClass('active');
    if ($(this).attr("id") == 'logout') {
        if (confirm("Do you want to log out")) {
            sessionStorage.clear();
            location.reload();
        }
    }
})