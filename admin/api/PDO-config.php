<?php

try {

    //Establish Connection to Server
    $db_name = "mysql:host=localhost;dbname=rainfire";
    $username = "root";
    $password = "";

    $conn = new PDO($db_name, $username, $password);


    // Get input values from user
    $p_details = json_decode($_POST['productDetails']);
    $p_specs = json_decode($_POST['specifications']);

    // -----------------------------------------------------------------------------------------------------------------
    // Uploading Files To Server

    // Count total files selected by user
    $countfiles = count($_FILES['files']['name']);

    // Upload directory
    $upload_location = "../../products_gallery/";

    // To store uploaded files path
    $files_arr = array();

    if ($countfiles > 0 && count($p_details) > 0 && count($p_specs) > 0) {

        // Loop all files
        for ($index = 0; $index < $countfiles; $index++) {

            if (isset($_FILES['files']['name'][$index]) && $_FILES['files']['name'][$index] != '') {
                // File name
                $filename = $_FILES['files']['name'][$index];

                // Get extension
                $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

                // Valid image extension
                $valid_ext = array("png", "jpeg", "jpg");

                // Check extension
                if (in_array($ext, $valid_ext)) {

                    // File path
                    $path = $upload_location . $filename;

                    // Upload file
                    if (move_uploaded_file($_FILES['files']['tmp_name'][$index], $path)) {
                        $files_arr[] = "products_gallery/" . $filename;
                    }
                }
            }
        }

        // echo json_encode($files_arr);

        // If $countfiles = $index then it means all files are uploaded then we will start inserting data into database
        if ($countfiles == $index) {

            // Set the new timezone
            date_default_timezone_set('Asia/Kolkata');
            // Generating Product ID
            $prod_ID = date("dmyhis");

            $conn->beginTransaction();

           

            // Extracting Product details from $p_details array and inserting into database as entries
            $pname = $p_details[0];
            $price = $p_details[1];
            $discount_percentage = $p_details[2];
            $description = $p_details[3];
            $product_color = $p_details[4];
            $category = $p_details[5];
            $original_price = ($price * $discount_percentage) / 100 + $price;
            $money_saved = ($original_price - $price);
            $rating = 4;
            $thumbnail = 'https://idestiny.in/wp-content/uploads/2020/12/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg';


            $sql1 = $conn->prepare("INSERT INTO products (p_ID, p_Name, thumbnail, p_Price, original_price, discount, money_saved, category, rating, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            $sql1->execute(array($prod_ID, $pname, $thumbnail, $price, $original_price, $discount_percentage, $money_saved, $category, $rating, $description));


            // Extracting all values of specifications from array
            for ($i = 0; $i < count($p_specs); $i++) {
                $spec_key = $p_specs[$i][0];
                $spec_value = $p_specs[$i][1];
                $sql2 = $conn->prepare("INSERT INTO specificaions (product_ID, p_Spec, spec_Value) VALUES (?, ?, ?)");
                $sql2->execute(array($prod_ID, $spec_key, $spec_value));
            }

             // Inserting Product photos entries into p_images table
             for ($i = 0; $i < $countfiles; $i++) {
                $url = $files_arr[$i];
                $sql3 = $conn->prepare("INSERT INTO p_images (p_ID, url) VALUES (?, ?)");
                $sql3->execute(array($prod_ID, $url));
            }

            if ($sql1 && $sql2 && $sql3) {
                $conn->commit();
                echo json_encode("Inserted");
            } else {
                $conn->rollBack();
                throw new Exception("Sql query Failed", 1);
            }
        }
    }

    // ----------------------------------------------------------------------------------------------------------------




} catch (PDOException $error) {
    echo json_encode($error->getMessage());
}
