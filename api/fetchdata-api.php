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

function findby($url_value)
{
    require 'config.php';
    switch ($url_value) {
        case 'New Arrivals':
            $sql = "SELECT DISTINCT FROM products ORDER BY date DESC LIMIT 5";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'All':
            $sql = "SELECT * FROM products";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Best Selling':
            $sql = "SELECT * FROM products WHERE tag = 'Best Selling'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Headphones':
            $sql = "SELECT * FROM products WHERE category = 'Headphones'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;


        case 'Data Cables':
            $sql = "SELECT * FROM products WHERE category = 'Data Cables'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;


        case 'Speakers':
            $sql = "SELECT * FROM products WHERE category = 'Speakers'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Batteries':
            $sql = "SELECT * FROM products WHERE category = 'Batteries'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        default:

            break;
    }
}
// Check if search value is set in url
if (!empty($_GET['get'])) {

    // Get search value from url
    $url_value = $_GET['get'];
    findby($url_value);
} else {
    // If search value is not set in url
    echo json_encode(array('message' => 'Bad Request', 'status' => 'false'));
}
