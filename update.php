<?php
	require_once 'include/cict_db_connect.php';
	$db = new cict_db_connect();
	$con = $db->connect();

	$query = $_POST['query'];
	$response = array();

	$st = $con->prepare($query);
	if($st->execute()){
		$response['error'] = false;
		$response['message'] = 'Successfully Updated!';
	}else{
		$response['error'] = true;
		$response['message'] = "Something went wrong, please try again later";
	}

	echo json_encode($response);

?>