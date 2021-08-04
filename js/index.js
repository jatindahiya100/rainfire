window.addEventListener('load', function () {

    $('#loader').slideUp(1000);
    $('.wrapper').delay(1000).fadeIn(1000);
});

$(document).ready(function(){

    // Loading header
    $('#header').load("header.html");

    // Loading Footer
    $('#footer').load("footer.html");


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
    
});