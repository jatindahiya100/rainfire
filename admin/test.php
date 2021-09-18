<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    body > div {
        width: 500px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    input{
        margin:5%;
    }
</style>

<body>
    <div>
    <input type="file" name="files[]" id="files" multiple accept="image/*">
    <input type="text" name="fname" id="fname" value="Jatin">
    <input type="text" name="lname" id="lname" value="Dahiya">
    <input type="text" name="address" id="address" value="Old mahavir colony">
    <input type="submit" value="Submit" id="submit">
    </div>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $("#submit").on("click", function() {
            var form_data = new FormData();
            var fname = $('#fname').val();
            var lname = $('#lname').val();
            var address = $('#address').val();

            var array = [fname,lname,address];

            // Read selected files
            var totalfiles = document.getElementById('files').files.length;
            for (var index = 0; index < totalfiles; index++) {
                form_data.append("files[]", document.getElementById('files').files[index]);
            }
            form_data.append("data", JSON.stringify(array));


            // AJAX request
            $.ajax({
                url: 'testapi.php',
                type: 'post',
                data: form_data,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function(response) {
                    console.log(response);
                }
            });
        })
    </script>
</body>

</html>