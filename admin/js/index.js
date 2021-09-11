$('#login').on("click", function () {
    login();
});

function login() {
    var id = $('#user_id').val();
    var password = $('#password').val();
    var array = [];

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
                if(data=='0'){
                    setTimeout(() => {
                        $('#alert').removeClass('success').html("Access Denied").show("slow").delay(2000).fadeOut();
                    }, 1000);
                } else if(data=='1') {
                    array.push(id,password);
                    var $credentials = window.btoa(array);
                    sessionStorage.setItem('key', JSON.stringify($credentials));
                    setTimeout(() => {
                        $('#alert').addClass('success').html("Access Granted").show("slow").delay(2000).fadeOut();
                    }, 1000);
                   setTimeout(() => {
                        window.location.href = 'dashboard.html';
                   }, 2000);
                }
            }
        });

    } else {
        $('#alert').removeClass('success').html("Empty Fields").show("slow").delay(2000).fadeOut();
    }
}