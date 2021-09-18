<?php
// Count total files
$countfiles = count($_FILES['files']['name']);
$inputs = json_decode($_POST['data']);

echo json_encode($inputs[0]);

?>