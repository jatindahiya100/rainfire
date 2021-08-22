 // Loading header
 $('#header').load("header.html");
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
     var slides = document.getElementsByClassName("product-photos");
     if (n > slides.length) { slideIndex = 1 }
     if (n < 1) { slideIndex = slides.length }
     for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";
     }
     slides[slideIndex - 1].style.display = "block";
 }

 function productDetails() {
    //  Get Value from Url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const p_ID = urlParams.get('ProductID');
    var findby = "Case1"
    $.ajax({
        url: 'api/index.php?p_id=' + p_ID + '&&findby=' + findby,
        type: "GET",
        beforeSend: function () {

        },
        success: function (data) {
            if (data.status != 'false') {

               
                $.each(data, function (key, value) {
                    $('#product-name').html(value.p_Name);
                    $('label[for=ratings]').html(value.rating);
                    $('label[for=stock]').html(value.stock);
                    $('label[for=dprice]').html("₹ "+value.p_Price);
                    $('label[for=discount]').html(value.discount+"% Off");
                    $('label[for=deleted-price]').html("<del> ₹ "+value.original_price+"</del>");
                    $('label[for=usaved]').html("Money Saved ₹" + "<strong>"+value.money_saved+"</strong>");
                });
                

            } else {
                $('.product-holder').html("");
            }
        }
    });
 }
 productDetails();

 function productSpecs() {
     
 }
 productSpecs()