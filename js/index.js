window.addEventListener("load", function () {
  $(".loading-content").fadeOut();
  $(".wrapper").fadeIn();
  // Loading Footer
  $("#footer").load("footer");
});

// Calling Fetch New Arrivals
// fetchNewArrival();

// Declaring Fetch New Arrivals function
function fetchNewArrival() {
  var category = "New Arrivals";
  $.ajax({
    url: "api/index_api.php?get=" + category,
    type: "GET",
    beforeSend: function () {},
    success: function (data) {
      if (data["status"] == "true") {
        var arrivals = "";
        $.each(data["message"], function (key, value) {
          arrivals +=
            "<div class='flex-box' data-id='" +
            value.p_ID +
            "'>" +
            "<div class='flex50'>" +
            "<div class='p_image'>" +
            "<img src='" +
            value.thumbnail +
            "' alt=''>" +
            "</div>" +
            "</div>" +
            "<div class='flex50'>" +
            "<div class='product-info'>" +
            "<label for='p_Name'>" +
            value.p_Name +
            "</label>" +
            "<div class='section'>" +
            "<label for='p_Price'>Rs. " +
            parseInt(value.p_Price).toLocaleString("en-IN") +
            "</label>" +
            "<label for='discount'>" +
            value.discount +
            "% OFF</label>" +
            "</div>" +
            "<label for='featured-tag'>" +
            value.stock +
            "</label>" +
            "<label for='description'><strong>Description: </strong>" +
            value.description +
            "</label>" +
            "<button class='buy'>Buy now</button>" +
            "</div>" +
            "</div>" +
            "</div>";
        });
        $(".featured-holder").html(arrivals);
      } else {
        console.log(data.msg);
      }
    },
  });
}

// Fetch Products By Category
var category = "Headphones";
// GetDataByCategory(category);

function GetDataByCategory(category) {
  $.ajax({
    url: "api/index_api.php?get=" + category,
    type: "GET",
    beforeSend: function () {},
    success: function (data) {
      if (data["status"] == "true") {
        var products = "<div class='product-holder'>";
        $.each(data["message"], function (key, value) {
          products +=
            "<a href=" +
            value.p_Name.replace(/ /g, "-") +
            "-" +
            value.p_ID +
            ">" +
            "<div class='item'>" +
            "<img src='" +
            value.thumbnail +
            "' alt=''>" +
            "<label for='pName'>" +
            value.p_Name +
            "</label>" +
            "<label for='category'>" +
            value.category +
            "</label>" +
            "<label for='pPrice'>" +
            "Rs. " +
            parseInt(value.p_Price).toLocaleString("en-IN") +
            "</label>" +
            "</div>" +
            "</a>";
        });
        products += "</div>";
        $(".Products_from_database").html(products).fadeOut().fadeIn();
      } else {
        $(".Products_from_database").html("");
      }
    },
  });
}

$("li").on("click", function () {
  $("li.clicked").removeClass("clicked");
  category = $(this).attr("id");
  $(this).addClass("clicked");
  $(this)
    .closest("ul")
    .css({
      "flex-wrap": "nowrap",
      "justify-content": "start",
      transition: "1s",
    });
  GetDataByCategory(category);
});

$(document).on("click", ".flex-box", function () {
  $id = $(this).data("id");
  window.location.href = "Product?ProductID=" + $id;
});

$(document).on("click", "#openSidebar", function () {
  $("aside").toggle();
});
