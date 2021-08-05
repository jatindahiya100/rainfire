<?php
header("Content-type: application/json");
header('Access-Control-Alow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header('Access-Control-Allow-Headers: Content-type,Access-Control-Alow-Origin,Access-Control-Allow-Methods');

// Check if search value is set in url
if (isset($_GET['get'])) {

    // Get search value from url
    $url_value = $_GET['get'];

    if ($url_value != '') {

        include 'config.php';

        if ($url_value == 'newarrivals') {

            $sql = "SELECT * FROM products ORDER BY S_No DESC LIMIT 5";

            if (mysqli_query($link, $sql)) {
                // If query and connection is successful

                $result = mysqli_query($link, $sql);

                if (mysqli_num_rows($result) > 0) {
                    $output = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    echo json_encode($output);
                } else {
                    // Display Error
                    echo json_encode(array('message' => 'No Search Results', 'status' => 'false'));
                }
            } else {
                // Display Error
                echo json_encode(array('message' => 'Connection Error', 'status' => 'false'));
            }
        } else {

            $sql = "SELECT * FROM products WHERE category = '{$url_value}' OR tag = '{$url_value}'";

            if (mysqli_query($link, $sql)) {
                // If query and connection is successful

                $result = mysqli_query($link, $sql);

                if (mysqli_num_rows($result) > 0) {
                    $output = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    echo json_encode($output);
                } else {
                    // Display Error
                    echo json_encode(array('message' => 'No Search Results', 'status' => 'false'));
                }
            } else {
                // Display Error
                echo json_encode(array('message' => 'Connection Error', 'status' => 'false'));
            }
        }
    } else {
        // Display Error
        echo json_encode(array('message' => 'Did Not Get Search Value', 'status' => 'false'));
    }
} else {
    // If search value is not set in url
    echo json_encode(array('message' => 'Bad Request', 'status' => 'false'));
}
// Close Connection to database
mysqli_close($link);
