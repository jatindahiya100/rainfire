window.addEventListener('load', function () {
    $('.loading-content').fadeOut();
    $('.wrapper').fadeIn();
    // Loading header
    $('#header').load("header.html");
    // Loading Footer
    $('#footer').load("footer.html");
});

// Calling Fetch New Arrivals
fetchNewArrival();

// Declaring Fetch New Arrivals function
function fetchNewArrival() {
    var category = "New Arrivals";
    $.ajax({
        url: 'api/index_api.php?get=' + category,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data['status'] == 'true') {
                var arrivals = "";
                $.each(data['message'], function (key, value) {
                    arrivals += "<div class='flex-box' data-id='" + value.p_ID + "'>" +

                        "<div class='flex50'>" +
                        "<div class='p_image'>" +
                        "<img src='" + value.thumbnail + "' alt=''>" +
                        "</div>" +
                        "</div>" +

                        "<div class='flex50'>" +
                        "<div class='product-info'>" +
                        "<label for='p_Name'>" + value.p_Name + "</label>" +
                        "<div class='section'>" +
                        "<label for='p_Price'>Rs. " + parseInt(value.p_Price).toLocaleString('en-IN') + "</label>" +
                        "<label for='discount'>" + value.discount + "% OFF</label>" +
                        "</div>" +
                        "<label for='featured-tag'>" + value.stock + "</label>" +
                        "<label for='description'><strong>Description: </strong>" + value.description + "</label>" +
                        "<button class='buy'>Buy now</button>" +
                        "</div>" +
                        "</div>" +
                        "</div>";
                });
                $('.featured-holder').html(arrivals);
            } else {
                console.log(data.msg)
            }
        }
    });
}

// Fetch Products By Category
var category = "All";
GetDataByCategory(category);

function GetDataByCategory(category) {
    $.ajax({
        url: 'api/index_api.php?get=' + category,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data['status'] == 'true') {
                var products = "<div class='product-holder'>";
                $.each(data['message'], function (key, value) {
                    products += "<a href=Details.html?ProductID=" + value.p_ID + ">" +
                        "<div class='item'>" +
                        "<img src='" + value.thumbnail + "' alt=''>" +
                        "<label for='pName'>" + value.p_Name + "</label>" +
                        "<label for='category'>" + value.category + "</label>" +
                        "<label for='pPrice'>" + "Rs. " + parseInt(value.p_Price).toLocaleString('en-IN') + "</label>" +
                        "</div>" +
                        "</a>";

                });
                products += "</div>";
                $('.Products_from_database').html(products);
            } else {
                $('.Products_from_database').html("");
            }
        }
    });
}

$('li').on("click", function () {
    $('li.clicked').removeClass("clicked");
    category = $(this).attr("id");
    $(this).addClass("clicked");
    GetDataByCategory(category);
});

$(document).on("click", ".flex-box", function () {
    $id = $(this).data("id");
    window.location.href = "Details.html?ProductID=" + $id;
});

$(document).on("click", ".slide_left", function () {
    // To get actual position
    var actualScroll = $(".product-holder").scrollLeft();
    // To set new position
    $(".product-holder").scrollLeft(actualScroll - 250);
});

$(document).on("click", ".slide_right", function () {
    // To get actual position
    var actualScroll = $(".product-holder").scrollLeft();
    // To set new position
    $(".product-holder").scrollLeft(actualScroll + 250);
});
