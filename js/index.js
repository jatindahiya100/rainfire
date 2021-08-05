window.addEventListener('load', function () {

    $('#loader').slideUp(1000);
    $('.wrapper').delay(1000).fadeIn(1000);
    // Loading header
    $('#header').load("header.html");
    // Loading Footer
    $('#footer').load("footer.html");


});
// Fetch New Arrivals
function fetchNewArrival() {
    var category = "New Arrivals";
    $.ajax({
        url: 'api/fetchdata-api.php?get=' + category,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data.status != 'false') {

                var arrivals = "";
                $.each(data, function (key, value) {
                    arrivals += "<a href=productDetails.html?ProductID=" + value.p_ID + ">" +
                        "<div class='item'>" +
                        "<img src=" + value.thumbnail + "alt=''>" +
                        "<label for='pName'>" + value.p_Name + "</label>" +
                        "<label for='pPrice'>" +"₹ "+ value.p_Price + "</label>" +
                        "</div>" +
                        "</a>";

                });

                $('.new-arrivals-holder').html(arrivals);
            } else {
                console.log(data.msg)
            }
        }
    });
}
fetchNewArrival();

// Fetch Products By Category
var category = "All";
GetDataByCategory(category);

$('li').on("click", function () {
    $('li.active').removeClass("active");
    category = $(this).attr("id");
    $(this).addClass("active");
    GetDataByCategory(category);
});

function GetDataByCategory(category) {
    $.ajax({
        url: 'api/fetchdata-api.php?get=' + category,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data.status != 'false') {

                var products = "";
                $.each(data, function (key, value) {
                    products += "<a href=productDetails.html?ProductID=" + value.p_ID + ">" +
                        "<div class='item'>" +
                        "<img src=" + value.thumbnail + "alt=''>" +
                        "<label for='pName'>" + value.p_Name + "</label>" +
                        "<label for='pPrice'>" + "₹ "+ value.p_Price + "</label>" +
                        "</div>"+
                        "</a>";

                });

                $('.product-holder').html(products);
            } else {
                $('.product-holder').html("");
            }
        }
    });
}


// Slideshow Function
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("slide-parts");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "block";
}

$('.prev').on("click",function(){
    plusSlides(-1);
});
$('.next').on("click",function(){
    plusSlides(1);
});




