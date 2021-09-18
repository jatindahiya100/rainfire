// Loading header
$('#header').load("header.html");

// hero Image
function products_Images() {
    //  Get Value from Url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const p_ID = urlParams.get('ProductID');
    var findby = "product_images"
    $.ajax({
        url: 'api/fetch-product-details.php?p_id=' + p_ID + '&&findby=' + findby,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data[0].status != "false") {
                var banner = "";
                $.each(data, function (key, value) {
                    banner += "<div class='product-photos fade'>" +
                        "<img src=" + value.url + ">" +
                        "</div>";
                });

                banner += "<a class='prev'>&#10094;</a>" +
                    "<a class='next'>&#10095;</a>";
                $('.product-gallery').html(banner);
                showSlides(slideIndex);
            } else {
                console.log(data);
            }
        }
    });
}
// Slideshow Function
var slideIndex = 1;


function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = $(".product-photos");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "block";
}

$(document).on("click", ".prev", function () {
    plusSlides(-1);
});
$(document).on("click", ".next", function () {
    plusSlides(1);
});

products_Images();


function product_basic_Info() {
    //  Get Value from Url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const p_ID = urlParams.get('ProductID');
    var findby = "Case1"
    $.ajax({
        url: 'api/fetch-product-details.php?p_id=' + p_ID + '&&findby=' + findby,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data[0].status != 'false') {
                $('title').html(data[0].p_Name);
                $('#product-name').html(data[0].p_Name);
                $('label[for=ratings]').html(data[0].rating);
                $('label[for=stock]').html(data[0].stock);
                $('label[for=dprice]').html("Rs. " + parseInt(data[0].p_Price).toLocaleString('en-IN'));
                $('label[for=discount]').html(data[0].discount + "% Off");
                $('label[for=deleted-price]').html("<del> Rs. " + parseInt(data[0].original_price).toLocaleString('en-IN') + "</del>");
                $('label[for=usaved]').html("Money Saved Rs. " + "<strong>" + parseInt(data[0].money_saved).toLocaleString('en-IN') + "</strong>");
                $('#description').append(data[0].description);
                $('.basic_info').show();
            }
        }
    });
}
product_basic_Info();

function productSpecs() {
    //  Get Value from Url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const p_ID = urlParams.get('ProductID');
    var findby = "specs"
    $.ajax({
        url: 'api/fetch-product-details.php?p_id=' + p_ID + '&&findby=' + findby,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data.status != 'false') {
                var specs = "<tr><th colspan='2'>Specifications</th></tr>"
                $.each(data, function (key, value) {
                    specs += "<tr>" +
                        "<td>" + value.p_Spec + "</td>" +
                        "<td>" + value.spec_Value + "</td>" +
                        "</tr>"
                });
                $('table').html(specs);
            }
        }
    });
}
productSpecs();

let cart_items = [];

$(document).on("click", "#buy", function () {
    //  Get Value from Url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const p_ID = urlParams.get('ProductID');

    if (localStorage.getItem('cart_items')) {
        cart_items = JSON.parse(localStorage.getItem('cart_items'));
    }
    if (cart_items.includes(p_ID)) {
        alert("Already in cart");
        window.location.href = 'Cart.html';
    } else {
        cart_items.push(p_ID);
        localStorage.setItem('cart_items', JSON.stringify(cart_items));
        alert("Product Added To Cart");
        window.location.href = 'Cart.html';
    }
});