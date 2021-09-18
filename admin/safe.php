<?php

try {

    //Establish Connection to Server
    $db_name = "mysql:host=localhost;dbname=rainfire";
    $username = "root";
    $password = "";

    $conn = new PDO($db_name, $username, $password);

    // Get input values from user
    $p_details = $_POST['productDetails'];
    $p_specs = json_decode($_POST['specifications']);

    // Set the new timezone
    date_default_timezone_set('Asia/Kolkata');
    $prod_ID = date("dmyhis");

    // Extracting Product details from $p_details array
    $pname = $p_details['pname'];
    $thumbnail = 'https://idestiny.in/wp-content/uploads/2020/12/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg';
    $price = $p_details['price'];
    $discount_percentage = $p_details['discount_percentage'];
    $original_price = ($price * $discount_percentage) / 100 + $price;
    $money_saved = ($original_price - $price);
    $product_color = $p_details['product_color'];
    $category = $p_details['category'];
    $rating = 4;
    $description = $p_details['description'];

    $conn->beginTransaction();

    $sql1 = $conn->prepare("INSERT INTO products (p_ID, p_Name, thumbnail, p_Price, original_price, discount, money_saved, category, rating, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $sql1->execute(array($prod_ID, $pname, $thumbnail, $price, $original_price, $discount_percentage, $money_saved, $category, $rating, $description));

    if ($sql1) {
        // Extracting all values of specifications from array
        for ($i = 0; $i < count($p_specs); $i++) {
            $spec_key = $p_specs[$i][0];
            $spec_value = $p_specs[$i][1];
            $sql2 = $conn->prepare("INSERT INTO specificaions (product_ID, p_Spec, spec_Value) VALUES (?, ?, ?)");
            $sql2->execute(array($prod_ID, $spec_key, $spec_value));
        }
        if ($sql2) {
            $conn->commit();
            echo "Inserted";
        } else {
            throw new Exception("Sql 2 Failed", 1);
        }
    } else {
        throw new Exception("Sql 1 Failed", 1);
    }
} catch (PDOException $error) {
    //throw $error;
    $conn->rollBack();
    echo $error->getMessage();
}
