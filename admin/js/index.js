function login() {
    var id = $('#user_id').val();
    var password = $('#password').val();

    if (id.length > 0 && password.length > 0) {

        // $('#alert').addClass('success').html("Checking").show("slow").delay(2000).fadeOut();

        $.ajax({
            url: 'api/login.php',
            type: 'POST',
            data: {
                id: id,
                password: password
            },
            beforeSend: function () {
                $('#alert').addClass('success').html("Checking...").show("slow");
            },
            success: function (data) {
                alert(data);
            }
        });

    } else {
        $('#alert').removeClass('success').html("Empty Fields").show("slow").delay(2000).fadeOut();
    }
}


$('#login').on("click", function () {
    login();
});