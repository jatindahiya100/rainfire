var x = 1;
$('#menu').on("click", function () {
    if (x == '1') {
        x = 0;
        $('nav').css("width", "0");
        $('.main').css('margin-left', '0');
        $('.nav-items').css('display', 'none');
        $('.main').css('width','100%');
    } else if (x == '0') {
        x = 1;
        $('nav').css("width", "300px");
        $('.main').css('margin-left', '300px');
        setTimeout(() => {
            $('.nav-items').css('display', 'flex');
        }, 200);
        $('.main').css('width','calc(100% - 300px)');
    }

});

$('li').on("click",function(){
    $('li.active').removeClass('active');
    $(this).addClass('active');
})