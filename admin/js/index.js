function validate_user() {

    var x = JSON.parse(sessionStorage.getItem('key'));

    if (sessionStorage.getItem('key') !== null) {
        var id = window.atob(x[0]);
        var key = window.atob(x[1]);

        $.ajax({
            url: 'api/verify_user.php',
            type: 'POST',
            data: {
                id: id,
                password: key
            },
            success: function (data) {
                if (data == '1') {
                    window.location.href = 'dashboard'
                }
            }
        });
    }
}
validate_user();

function login() {
    var id = $('#user_id').val();
    var password = $('#password').val();
    var array = [];

    if (id.length > 0 && password.length > 0) {
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
                if (data == '0') {
                    setTimeout(() => {
                        $('#alert').removeClass('success').html("Access Denied").show("slow").delay(2000).fadeOut();
                    }, 1000);
                } else if (data == '1') {
                    array.push(window.btoa(id), window.btoa(password));
                    sessionStorage.setItem('key', JSON.stringify(array));
                    setTimeout(() => {
                        $('#alert').addClass('success').html("Access Granted").show("slow").delay(2000).fadeOut();
                    }, 1000);
                    setTimeout(() => {
                        window.location.href = 'dashboard';
                    }, 2000);
                }
            }
        });

    } else {
        $('#alert').removeClass('success').html("Empty Fields").show("slow").delay(2000).fadeOut();
    }
}

$('#login').on("click", function () {
    login();
});