<?php


require 'config.php';

$id = json_decode($_GET['itemID']);

function axd($link, $sql)
{

    if (mysqli_query($link, $sql)) {

        $result = mysqli_query($link, $sql);

        if (mysqli_num_rows($result) == 1) {

            $output = mysqli_fetch_assoc($result);

            echo "
                <div class='item-details'> 
                    <div class='item-image'>
                       
                            <img src='{$output['thumbnail']}' alt=''>
                        
                    </div>
                    <div class='item-info'> 
                       
                            <label for='item-name'>{$output['p_Name']}</label> 
                            <label for='description'>{$output['description']}</label>
                      
                        <label for='item-price'>Rs. {$output['p_Price']} </label> 
                        <label for='item-quantity'> 
                            <div class='quantity' id='minus'>-</div> 
                            <input class='current_qt' type='text' id='qt' value='1'> 
                            <div class='quantity' id='plus'>+</div> 
                        </label> 
                    </div> 
                </div>";
        } else {
            echo "No Products Found";
        }
    } else {
        // Display Error
        echo 'Connection Error';
    }
}

foreach ($id as $value) {
    # code...
    $sql = "SELECT p_ID,p_Name,thumbnail,p_Price,description FROM products WHERE p_ID = '{$value}'";
    axd($link, $sql);
}

mysqli_close($link);
