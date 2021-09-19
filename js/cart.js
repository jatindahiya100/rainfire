// Loading header
$('#header').load("header.html");

// Check If cart is empty
function check_empty_cart() {
    var empty;
    var check = JSON.parse(localStorage.getItem('cart_items'));
    if (localStorage.getItem("cart_items") !== null) {
        empty = 'false';
        if (check.length >= 1) {
            $('.flex-box').css('display', "flex");
            $('.empty-cart').css('display', "none");
        } else {
            $('.flex-box').css('display', "none");
            $('.empty-cart').css('display', "flex");
        }
        return empty;
    } else {
        empty = 'true';
        $('.flex-box').css('display', "none");
        $('.empty-cart').css('display', "flex");
        return empty;
    }

}
check_empty_cart();


if (check_empty_cart() == 'false') {
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
                Generate_Order_Summary();
            }
        });

    }
    show_Cart_Items();

    $(document).on("click", ".remove", function () {
        if (confirm("Remove item from cart")) {
            $item_id = $(this).attr("id");
            var cart_items = JSON.parse(localStorage.getItem('cart_items'));
            if (cart_items.includes($item_id)) {
                var index = cart_items.indexOf($item_id);
                if (index > -1) {
                    cart_items.splice(index, 1);
                    localStorage.setItem('cart_items', JSON.stringify(cart_items));
                    $(this).closest('.item-details').slideUp();
                    // count_cart_items function is defined in header
                    count_cart_items();
                    show_Cart_Items();
                    check_empty_cart();
                }
            } else {
                // count_cart_items function is defined in header
                count_cart_items();
                console.log("Does't exist");
            }
        }
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
        $('#amt2bepaid').text('Rs. ' + total.toLocaleString('en-IN'));

        // Calculating Total Products
        var cart_items = JSON.parse(localStorage.getItem('cart_items'));

        var total_items = cart_items.length;
        $('#total_items').text(total_items);
    }

}

