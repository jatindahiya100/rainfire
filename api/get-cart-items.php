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
                       
                            <div class='prod_descp'>
                                <label for='item-name'>{$output['p_Name']}</label> 
                                <label for='description'>{$output['description']}</label>
                            </div>

                            <div class='prod_price'>
                                <label for='item-price'>Rs.  " .number_format($output['p_Price']) ."</label>
                                <input class='price_value' type='text' value='{$output['p_Price']}' disabled/>
                            </div>

                            <div class='product-quantity'>
                                <div>
                                    <button class='edit-qt' id='minus'>-</button>
                                    <input class='quantity_value' type='text' value='1'>
                                    <button class='edit-qt' id='plus'>+</button>
                                </div>

                                <div class='remove' id='{$output['p_ID']}'>Delete</div>
                            </div>
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
