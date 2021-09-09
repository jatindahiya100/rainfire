// Loading header
$('#header').load("header.html");

$(document).on("click", '.quantity', function () {
    var $clicked_id = $(this).attr("id");
    if ($clicked_id == "plus") {
        var $qty = $(this).closest('label').find('.current_qt');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal)) {
            $qty.val(currentVal + 1);
        }
    } else if ($clicked_id == "minus") {
        var $qty = $(this).closest('label').find('.current_qt');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1);
        }
    }

});


function show_Cart_Items() {
    var items_array = JSON.parse(localStorage.getItem('cart_items'));
    var items = '';

    items_array.forEach(Display_All_items_from_WebStorage);
    $('#left-flex').html(items);

    function Display_All_items_from_WebStorage(item,index) {
        items += "<div class='item-details'>" +
            "<img src='"+ items_array[index]['productImage'] +"' alt=''>" +
            " <div class='item-info'>" +
            "<label for='item-name'>"+items_array[index]['productName']+"</label>" +
            "<label for='item-price'>"+ items_array[index]['productPrice'] +"</label>" +
            "<label for='item-quantity'>" +
            "<div class='quantity' id='minus'>-</div>" +
            "<input class='current_qt' type='text' id='qt' value='1'>" +
            "<div class='quantity' id='plus'>+</div>" +
            "</label>" +
            "</div>" +
            "</div>"

    }
}
show_Cart_Items();