
<?php
require_once 'include/cict_db_users_functions.php';
$users = new cict_db_users_functions();

$response = array();


//check if existed, check if active, check expiration date
$username = $_POST['username'];
$password = $_POST['password'];

$verify = $users->verifyLogin($username, $password);

if($verify["error"]){
	$response["error"] = true;
	$response["message"] = $verify['message'];
}else{
	$response = $users->getUserInfo($verify["id"]);
	$response{'error'} = false;
}

echo json_encode($response);

?>