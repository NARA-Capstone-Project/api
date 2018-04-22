<?php

require_once 'include/cict_db_connect.php';
$db = new cict_db_connect();
$con = $db->connect();
$user_id = $_POST['user_id'];

	$st = $con->prepare("SELECT * FROM (SELECT COUNT(*) AS inv_count FROM request_inventory WHERE req_status = 'Pending' AND (custodian = ? OR technician = ?)) AS inventory,(SELECT COUNT(*) AS rep_count FROM request_repair WHERE req_status = 'Pending' AND (custodian = ? OR technician = ?)) AS repair,(SELECT COUNT(*) AS per_count FROM request_peripherals WHERE NOT (req_status = 'Received' OR req_status = 'Issued') AND (requisitioner = ? OR tech_id = ?)) AS peripherals");
$st->bind_param("ssssss", $user_id,$user_id,$user_id,$user_id,$user_id,$user_id);
	$st->execute();
	$result = $st->get_result()->fetch_assoc();


	$response = array();

	$response['inventory'] = $result['inv_count'];
	$response['repair'] =  $result['rep_count'];
	$response['peripherals'] = $result['per_count'];;

	echo json_encode($response);

?>