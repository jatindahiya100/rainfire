<?php
function filter_data($value)
{
    $value = trim($value);
    return $value;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $id = filter_data($_POST['id']);
    $password = filter_data($_POST['password']);

    // Reading the data 
    $passtxt = file_get_contents('../../login.txt');
    $info = unserialize($passtxt);

    if($info['username'] == $id && $info['password']==$password){
        echo 1;
    } else {
        echo 0;
    }
}
?>