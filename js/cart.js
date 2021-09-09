// Loading header
$('#header').load("header.html");

// Check If cart is empty
var check = localStorage.getItem('cart_items');
if(check != null){
  var x = document.getElementsByClassName("flex-box");
  x[0].style.display = "flex";
} else {
    var x = document.getElementsByClassName("empty-cart");
    x[0].style.display = "flex";
}

$(document).on("click", '.edit-qt', function () {
    var $clicked_id = $(this).attr("id");
    if ($clicked_id == "plus") {
        var $qty = $(this).closest('.product-quantity').find('.quantity_value');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal)) {
            $qty.val(currentVal + 1);
        }
    } else if ($clicked_id == "minus") {
        var $qty = $(this).closest('.product-quantity').find('.quantity_value');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1);
        }
    }
});


function show_Cart_Items() {
    
        $.ajax({
            url: 'api/get-cart-items.php',
            type: 'GET',
            // dataType: "JSON",
            data: {
                itemID: localStorage.getItem('cart_items')
            },
            success: function (data) {
               $('#left-flex').html(data);
            }
        });
    
}
show_Cart_Items();