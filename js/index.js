window.addEventListener('load', function () {

    $('#loader').slideUp(1000);
    $('.wrapper').fadeIn(1000);
});

$(document).ready(function(){

    // Loading header
    $('#header').load("header.html");

    // Loading Footer
    $('#footer').load("footer.html");
    
});