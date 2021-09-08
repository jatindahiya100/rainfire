// Loading header
$('#header').load("header.html");

$(document).on("click", "#minus", function () {
    var x = $('#qt').val();
    if (x > 1) {
        var minus = --x;
        $('#qt').val(minus);
    }
});

$(document).on("click", "#plus", function () {
    var x = $('#qt').val();
    var add = ++x;
    $('#qt').val(add);
});