<?php

require_once 'include/cict_db_connect.php';
$db = new cict_db_connect();
$con = $db->connect();

$serial = $_POST['serial'];
$st = $con->prepare("SELECT * FROM temporary WHERE pc_serial = ?");
$st->bind_param("s", $serial);

$response = array();

if($st->execute()){
	$details = $st->get_result()->fetch_assoc();
	$response['error'] = false;
	$response['pc_serial'] = $details['pc_serial'];
	$response['mb_serial'] = $details['mb_serial'];
	$response['ram'] = $details['ram'];
	$response['hdd'] = $details['hdd'];
	$response['kboard'] = $details['keyboard'];
	$response['mouse'] = $details['mouse'];
}else{
	$response['error'] = true;
}

	echo json_encode($response);

?>