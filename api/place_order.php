<?php

$shipping_array = json_decode($_POST['shipping_array']);
$prod_array = json_decode($_POST['prod_array']);

try {

    //Establish Connection to Server
    $db_name = "mysql:host=localhost;dbname=rainfire";
    $username = "root";
    $password = "";

    $conn = new PDO($db_name, $username, $password);


    $total_price = 0;

    for ($i = 0; $i < count($prod_array); $i++) {
        # Loop...
        $sql = $conn->prepare("SELECT p_Price FROM products WHERE p_ID = ?");
        $sql->execute([$prod_array[$i]->p_id]);
        $result = $sql->fetch();
        $total_price += ($result['p_Price'] *  $prod_array[$i]->qty);
    }

    echo json_encode($total_price);

} catch (PDOException $error) {
    echo json_encode($error->getMessage());
    die();
}
