<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $id = $_POST['id'];
    $password = $_POST['password'];

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