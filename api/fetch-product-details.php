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

function findby($p_ID,$findby)
{
    require 'config.php';
    switch ($findby) {
        case 'Case1':
            $sql = "SELECT p_Name,p_Price,discount,rating,stock,description FROM products WHERE p_ID = '{$p_ID}'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'specs':
            $sql = "SELECT * FROM specificaions WHERE product_ID = '{$p_ID}'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

            case 'product_images':
                $sql = "SELECT * FROM p_images WHERE p_ID = '{$p_ID}'";
                getDataFromServer($link, $sql);
                // Close Connection to database
                mysqli_close($link);
                break;
    }
}
// Check if search value is set in url
if (!empty($_GET['p_id']) && !empty($_GET['findby'])) {

    // Get search value from url
    $p_ID = $_GET['p_id'];
    $findby = $_GET['findby'];
    findby($p_ID,$findby);
} else {
    // If search value is not set in url
    echo json_encode(array('message' => 'Bad Request', 'status' => 'false'));
}
