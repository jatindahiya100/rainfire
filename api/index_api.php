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
            $response = array('message' => $output, 'status' => 'true');
            echo json_encode($response);
        } else {
            // Display Error
            echo json_encode(array('message' => 'No Products Found', 'status' => 'false'));
            die();
        }
    } else {
        // Display Error
        echo json_encode(array('message' => 'Connection Error', 'status' => 'false'));
        die();
    }
}

function findby($url_value)
{
    require 'config.php';
    switch ($url_value) {
        case 'New Arrivals':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`, `p_Price`, `discount`, `stock`, `description` FROM products WHERE `archieve` = '0' ORDER BY id DESC LIMIT 5";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'All':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE `archieve` = '0' ORDER BY id DESC";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Headphones':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE category = 'Headphones' AND `archieve` = '0'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;


        case 'Data Cables':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE category = 'Data Cables' AND `archieve` = '0'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;


        case 'Speakers':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE category = 'Speakers' AND `archieve` = '0'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Batteries':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE category = 'Batteries' AND `archieve` = '0'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'Others':
            $sql = "SELECT `p_ID` ,`p_Name`, `thumbnail`,`category`, `p_Price` FROM products WHERE category = 'Others' AND `archieve` = '0'";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
            break;

        case 'heroimage':
            $sql = "SELECT * FROM heroimage";
            getDataFromServer($link, $sql);
            // Close Connection to database
            mysqli_close($link);
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
    die();
}
