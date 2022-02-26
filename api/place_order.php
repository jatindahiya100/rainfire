<?php

$shipping_array = json_decode($_POST['shipping_array']);
$cFname = $shipping_array[0];
$cLname = $shipping_array[1];
$cMail = $shipping_array[2];
$cMobile = $shipping_array[3];
$cState = $shipping_array[4];
$cDistrict = $shipping_array[5];
$pincode = $shipping_array[6];
$shipping_Address = $shipping_array[7];
$prod_array = json_decode($_POST['prod_array']);

try {

    //Establish Connection to Server
    $db_name = "mysql:host=localhost;dbname=rainfire";
    $username = "rainfire";
    $password = "Rainfire@123";

    $conn = new PDO($db_name, $username, $password);


    $conn->beginTransaction();

    // Set the new timezone
    date_default_timezone_set('Asia/Kolkata');
    $Generate_order_ID = strtoupper($shipping_array[0]) . date("his") . mt_rand(10, 100);
    $order_ID = str_shuffle($Generate_order_ID);

    $total_price = 0;
    $price_array = array();
    for ($i = 0; $i < count($prod_array); $i++) {
        # Loop...
        $sql = $conn->prepare("SELECT p_Price FROM products WHERE p_ID = ?");
        $sql->execute([$prod_array[$i]->p_id]);
        $result = $sql->fetch();
        array_push($price_array, $result['p_Price']);
        $total_price += ($result['p_Price'] * $prod_array[$i]->qty);
    }

    $sql1 = $conn->prepare("INSERT INTO `orders`(`order_ID`, `order_Amt`, `cName`, `cMail`, `cMobile`, `cState`, `cDistrict`, `pincode`, `shipping_Address`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $sql1->execute(array($order_ID, $total_price, $cFname . " " . $cLname, $cMail, $cMobile, $cState, $cDistrict, $pincode, $shipping_Address));

    for ($i = 0; $i < count($prod_array); $i++) {
        # Loop...
        $sql2 = $conn->prepare("INSERT INTO `order_Details`(`order_ID`, `p_ID`, `qty`, `item_price`) VALUES (?, ?, ?, ?)");
        $sql2->execute(array($order_ID, $prod_array[$i]->p_id, $prod_array[$i]->qty, $price_array[$i]));
    }

    if ($sql1 && $sql2) {
        echo json_encode(array("message" => "Order Placed", "status" => "true"));
        $conn->commit();
    } else {
        echo json_encode(array("message" => "Order Placed", "status" => "false"));
        $conn->rollBack();
    }
} catch (PDOException $error) {
    echo json_encode($error->getMessage());
    die();
}
