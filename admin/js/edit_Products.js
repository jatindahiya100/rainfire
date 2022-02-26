
        var get = "Listed";
        function list_products(get) {
            $.ajax({
                url: "api/edit-Products.php",
                type: "POST",
                data: {
                    sendData: get
                },
                success: function (response) {
                    var products = '<tr>'+
                    '<th>Product ID</th>'+
                    '<th>Name</th>'+
                    '<th>Price</th>'+
                    '<th>Discount %</th>'+
                    '<th>Added On</th>'+
                    '<th>Category</th>'+
                    '<th>Rating</th>'+
                    '<th>Stock</th>'+
                    '<th colspan="2">Manage</th>'+
                '</tr>';
                    $.each(response, function (key, value) {
                        products += "<tr>" +
                            "<td><a href='../Details.html?ProductID=" + value.p_ID + "'>" + value.p_ID + "</a></td>" +
                            "<td>" + value.p_Name + "</td>" +
                            "<td>" + value.p_Price + "</td>" +
                            "<td>" + value.discount + "</td>" +
                            "<td>" + value.added_on + "</td>" +
                            "<td>" + value.category + "</td>" +
                            "<td>" + value.rating + "</td>" +
                            "<td>" + value.stock + "</td>" +
                            "<td><button class='archieve'>Archieve <i class='fa fa-trash'></i></button></td>" +
                            "<td><button class='edit' data-pid='" + value.p_ID + "'>Edit <i class='fa fa-edit'></i></button></td>" +
                            "</tr>"
                    });
                    $('table').html(products);
                }
            });
        }
        list_products(get);

        // Show Modal Box
        $(document).on("click", ".edit", function () {

            var product_Id = $(this).data("pid");

            $.ajax({
                url: "api/edit-Products.php",
                type: "POST",
                data: {
                    p_ID: product_Id,
                    sendData: "EditButtonClicked"
                },
                success: function (response) {
                    $('#store_p_ID').val(response[0]['p_ID']);
                    $('#pname').val(response[0]['p_Name']);
                    $('#price').val(response[0]['p_Price']);
                    $('#discount').val(response[0]['discount']);

                    $("#Category option").each(function () {
                        if ($(this).text() == response[0]['category']) {
                            $(this).prop("selected", "selected");
                        }
                    });

                    $("#Rating option").each(function () {
                        if ($(this).text() == response[0]['rating']) {
                            $(this).prop("selected", "selected");
                        }
                    });

                    $("#Stock option").each(function () {
                        if ($(this).text() == response[0]['stock']) {
                            $(this).prop("selected", "selected");
                        }
                    });

                    $('.modal-box').fadeIn();
                }
            });
        });
        $(document).on("click", "#update", function (e) {
            e.preventDefault();
            var product_ID = $('#store_p_ID').val();
            var pName = $('#pname').val();
            var price = $('#price').val();
            var discount = $('#discount').val();
            var category = $('#Category').val();
            var rating = $('#Rating').val();
            var stock = $('#Stock').val();

            const array = [product_ID,pName, price, discount, category, rating, stock];

            $.ajax({
                url: "api/update-data.php",
                type: "POST",
                dataType: "JSON",
                data: {
                    array: JSON.stringify(array)
                },
                success: function(response){
                    if(response == "Inserted"){
                        $('.modal-box').fadeOut();
                        list_products(get);
                    }
                }
            });
        });
        // Hide Modal Box
        $(document).on("click", "#close-modal", function () {
            $('.modal-box').fadeOut();
        });