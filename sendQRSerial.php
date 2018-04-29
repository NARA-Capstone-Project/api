<?php

require_once 'include/cict_db_connect.php';
$db = new cict_db_connect();
$con = $db->connect();
$serial = $_POST['serial'];
$st = $con->prepare("INSERT INTO temporary (pc_serial) VALUES(?)");
$st->bind_param("s", $serial);
$response = array();

if($st->execute()){
	$response['error'] =false;
}else{
	$response['error'] =true;
}

echo json_encode($response);
?>