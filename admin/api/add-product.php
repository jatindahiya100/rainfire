<?php

require 'config.php';

// Get input values from user
$p_details = $_POST['productDetails'];
$p_specs = json_decode($_POST['specifications']);

 // Set the new timezone
 date_default_timezone_set('Asia/Kolkata');
$prod_ID = date("dmyhis");

// Extracting Product details from $p_details array
$pname = $p_details['pname'];
$price = $p_details['price'];
$discount_percentage = $p_details['discount_percentage'];
$description = $p_details['description'];
$product_color = $p_details['product_color'];
$category = $p_details['category'];

$sql .= "INSERT INTO products (p_ID, p_Name, thumbnail, p_Price, discount, category, rating, description) VALUES ('{$prod_ID}','{$pname}','https://www.cnet.com/a/img/-e95qclc6pwSnGE2YccC2oLDW_8=/1200x675/2020/04/16/7d6d8ed2-e10c-4f91-b2dd-74fae951c6d8/bazaart-edit-app.jpg',{$price},{$discount_percentage},'{$category}','4','{$description}');";

// Extracting all values of specifications from array
for ($i = 0; $i < count($p_specs); $i++) {
  $spec_key = $p_specs[$i][0];
  $spec_value = $p_specs[$i][1];
  $sql .= "INSERT INTO `specificaions` (`product_ID`, `p_Spec`, `spec_Value`) VALUES ('{$prod_ID}','{$spec_key}','{$spec_value}');";
}


// Function To Send Data to Server
uploadSpecs($link, $sql);

function uploadSpecs($link, $sql)
{
  if (mysqli_multi_query($link, $sql)) {
    echo "Inserted";
  } else {
    echo "Failed";
  }
}
