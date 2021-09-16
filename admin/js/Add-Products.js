$('#thumb-image').on("click", function () {
    $('input[type="file"]').click();
});

$("#selected_photos").on("change", function () {
    displayImage(this);
});

function displayImage(e) {
    if (e.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.querySelector('#thumb-image').setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(e.files[0]);
    }
}


$('#add_more').on("click", function () {
    var addition = "<div class='spec-div'>" +
        "<input type='text' class='key' placeholder='Key'> " +
        "<input type='text' class='value' placeholder='Value'>" +
        "</div>";
    $('.specification').append(addition);

});


$('#add-product').on("click", function () {
    var details = get_pDetails_From_User();
    var specs = get_Specs_from_user();

    if (details != "100" && details != "102" && specs != "101") {

        // AJAX Call to transfer data
        $.ajax({
            url: 'api/PDO-config.php',
            type: 'POST',
            data: {
                productDetails: details,
                specifications: JSON.stringify(specs)
            },
            success: function (response) {
                console.log(response);
               $('.product-image-preview').html(response);
            }
        });

    } else if (details == "100") {
        alert("Some Product Details Have Empty Fields");
    } else if (details == "102") {
        alert("Price or Discount is not numeric");
    } else if (specs == "101") {
        alert("No Specifications Are Given")
    }
});

function get_pDetails_From_User() {
    var pname = $('#pname').val().trim();
    var price = $('input[name="price"]').val().trim();
    var discount_percentage = $('input[name="discount"]').val().trim();
    var description = $('textarea[name="description"]').val().trim();
    var product_color = $('input[name="color-select"]').val().trim();
    var category = $('input[name="category"]:checked').val().trim();

    if (pname.length > 0 && price.length > 0 && discount_percentage.length > 0 && description.length > 0 && product_color.length > 0 && category.length > 0) {

        if (!isNaN(price) && !isNaN(discount_percentage)) {
            const obj = { pname: pname, price: price, discount_percentage: discount_percentage, description: description, product_color: product_color, category: category };

            return obj;
        } else {
            var error = 102;
            return error;
        }
    } else {
        var error = 100;
        return error;
    }
}


function get_Specs_from_user() {
    var spec_array = [];
    $('.spec-div').each(function () {
        var spec_key = $(this).find('.key').val().trim();
        var spec_val = $(this).find('.value').val().trim();

        if (spec_key.length > 0 && spec_val.length > 0) {
            var arr = [spec_key,spec_val];
            spec_array.push(arr);
        }
    });

    if (spec_array.length > 0) {
        return spec_array;
    } else {
        var error = 101;
        return error;
    }

}
// Errors
// 100 => Some Product Details Have Empty Fields
// 101 => No Specs Are Given
// 102 => Price or Discount is not numeric