<?php
header("Content-type: application/json");
header('Access-Control-Alow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header('Access-Control-Allow-Headers: Content-type,Access-Control-Alow-Origin,Access-Control-Allow-Methods');


function getDataFromServer($conn, $query)
{
    if (mysqli_query($conn, $query)) {
        // If query and connection is successful

        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $output = mysqli_fetch_all($result, MYSQLI_ASSOC);
            echo json_encode($output);
        } else {
            // Display Error
            echo json_encode(array('message' => 'No Products Found', 'status' => 'false'));
        }
    } else {
        // Display Error
        echo json_encode(array('message' => 'Connection Error', 'status' => 'false'));
    }
}


function find($value,$p_ID)
{
    require 'config.php';
    switch ($value) {
        case 'Listed':
            $sql = "SELECT * FROM products ORDER BY id DESC";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Archieved':
            $sql = "SELECT * FROM products";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'EditButtonClicked':
            $sql = "SELECT * FROM products WHERE p_ID = '{$p_ID}' LIMIT 1";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;
    }
}

// Check if search value is set
if (!empty($_POST['sendData'])) {

    // Get value
    $value = $_POST['sendData'];
    $p_ID = $_POST['p_ID'];
    find($value,$p_ID);
} else {
    // If search value is not set in url
    echo json_encode(array('message' => 'Bad Request', 'status' => 'false'));
}
