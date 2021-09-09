// Loading header
$('#header').load("header.html");

// Check If cart is empty
var check = localStorage.getItem('cart_items');
if (check != null) {
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
            Generate_Order_Summary();
        }
    } else if ($clicked_id == "minus") {
        var $qty = $(this).closest('.product-quantity').find('.quantity_value');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1);
            Generate_Order_Summary();
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

$(document).on("click", ".remove", function () {
    $item_id = $(this).attr("id");
    alert($item_id);
});


// Order Summary
function Generate_Order_Summary() {

    // Calculating Total Amount
    var total = 0;
    $('.item-details').each(function () {
        var price = $(this).find('.price_value').val();
        var qty = $(this).find('.quantity_value').val();
        total += (price * qty);
    });
    $('#amt2bepaid').text('Rs. '+ total.toLocaleString('en-IN'));

    // Calculating Total Products
    var cart_items = JSON.parse(localStorage.getItem('cart_items'));

    var total_items = cart_items.length;
    $('#total_items').text(total_items);
}


setTimeout(() => {
    Generate_Order_Summary();
}, 1000);