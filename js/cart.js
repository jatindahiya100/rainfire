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

    $(document).on("click",".item-image",function(){
        window.location.href = "Details.html?ProductID="+$('.item-details').data("id");
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


    function checkout() {
        // Object
        let products = {};
        // Array
        const prod_array = [];
        // Getting Shipping Info
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var email = document.getElementById("email").value;
        var mobile = document.getElementById("mobile").value;
        var state = document.getElementById("state").value;
        var district = document.getElementById("district").value;

        const shipping_array = [fname,lname,email,mobile,state,district];

        $('.item-details').each(function () {
            var p_id = $(this).data("id");
            var qty = $(this).find('.quantity_value').val();
            products = {p_id:p_id,qty:qty};
            prod_array.push(products);
        });

        $.ajax({
            url: "api/place_order.php",
            type: "POST",
            dataType: "JSON",
            data: {
                shipping_array: JSON.stringify(shipping_array),
                prod_array: JSON.stringify(prod_array)
            },
            beforeSend: function(){

            },
            success: function(response){
                console.log(response);
            }

        });

    }

    $('#checkout').on("click", function () {
        checkout();
    });

}

