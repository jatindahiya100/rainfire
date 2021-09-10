<?php
function filter_data($value) {
    $value = trim($value);
    return $value;
}

if($_SERVER['REQUEST_METHOD']=='POST'){

    $id = filter_data($_POST['id']);
    $password = filter_data($_POST['password']);
    
    echo $id;
}
