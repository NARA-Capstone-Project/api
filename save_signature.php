<?php
require_once 'include/cict_db_request_functions.php';
$db = new cict_db_request_functions();
require_once 'include/cict_db_users_functions.php';
$db_users = new cict_db_users_functions();
require_once 'include/cict_db_connect.php';
$db_con = new cict_db_connect();
$con = $db_con->connect();

$query       = $_POST['query'];
$imageString = $_POST['image'];
$user_id     = $_POST['user_id'];

//image
$image_dir = 'images/signatures';

if (strlen($imageString) != 0) {
    if (!file_exists($image_dir)) {
        mkdir($image_dir, 0777, true);
    }

    $image_path = $image_dir . "/" . rand() . "_" . time() . ".jpeg";
} else {
    $image_path = "";
}

$response = array();

$st = $con->prepare($query);
$st->bind_param("ss", $image_path, $user_id);

if ($st->execute()) {
    $response['error'] = false;
    //save image pag meron
    if (strlen($imageString) != 0) {
        if ($db->uploadImage($imageString, $image_path)) {
            $response['image'] = 'Inserted';
        } else {
            $response['image'] = 'Not inserted';
        }
    } else {
        if ($db_users->deleteSignature($user_id)) {
            $response['image'] = 'No Image, signature deleted';
        }else{
            $response['image'] = 'No Image, signature NOT deleted';
        }
    }

    $response['message'] = 'Successfully Updated!';
} else {
    $response['error']   = true;
    $response['message'] = "Something went wrong, please try again later";
}

echo json_encode($response);
