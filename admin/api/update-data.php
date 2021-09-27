<?php

$dataArray = json_decode($_POST['array']);

if (count($dataArray) > 0) {
    
    $p_ID = $dataArray[0];
    $pname = $dataArray[1];
    $price = $dataArray[2];
    $discount = $dataArray[3];
    $category = $dataArray[4];
    $rating = $dataArray[5];
    $stock = $dataArray[6];
    $original_price = ($discount / 100) * $price + $price;
    $money_saved = ($original_price - $price);



    try {

        //Establish Connection to Server
        $db_name = "mysql:host=localhost;dbname=rainfire";
        $username = "root";
        $password = "";

        $conn = new PDO($db_name, $username, $password);

        $sql = $conn->prepare("UPDATE products SET p_Name=?, p_Price=?, discount=?, category=?, rating=?, stock=?, original_price=?, money_saved=? WHERE p_ID=?");

        $sql->execute(array($pname, $price, $discount, $category, $rating, $stock, $original_price, $money_saved, $p_ID));
        if ($sql) {
            echo json_encode("Inserted");
        }
    } catch (PDOException $error) {
        echo json_encode($error->getMessage());
    }
}
