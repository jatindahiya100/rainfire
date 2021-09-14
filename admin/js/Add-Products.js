$('#thumb-image').on("click", function () {
    $('input[type="file"]').click();
});

$("#selected_photos").on("change",function(){
    displayImage(this);
});

function displayImage(e) {
    if (e.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            document.querySelector('#thumb-image').setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(e.files[0]);
    }
}


$('#add_more').on("click",function(){
    var addition = "<div class='spec-div'>"+
                "<input type='text' class='key' placeholder='Key'> "+
                "<input type='text' class='value' placeholder='Value'>"+
            "</div>";
        $('.specification').append(addition);

});


$('#add-product').on("click",function(){
    get_pDetails_From_User();
    get_Specs_from_user();
});

function get_pDetails_From_User() {
    var pname = $('#pname').val();
    var price = $('input[name="price"]').val();
    var discount_percentage = $('input[name="discount"]').val();
    var description = $('textarea[name="description"]').val();
    var product_color  = $('input[name="color-select"]').val();
    var category = $('input[name="category"]').val();
}

function get_Specs_from_user() {
    var array = [];
    $('.spec-div').each(function(){
        var spec_key = $(this).find('.key').val();
        var spec_val = $(this).find('.value').val();
        const obj = {key:spec_key,value:spec_val};
        array.push(obj);
    });
    console.log(array);
}