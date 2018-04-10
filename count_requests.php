<?php

require_once 'include/cict_db_connect.php';
$db = new cict_db_connect();
$con = $db->connect();

	$st = $con->prepare("SELECT * FROM (SELECT COUNT(*) AS inv_count FROM request_inventory WHERE req_status = 'Pending' AND (custodian = '123456' OR technician = '123456')) AS inventory,(SELECT COUNT(*) AS rep_count FROM request_repair WHERE req_status = 'Pending' AND (custodian = '123456' OR technician = '123456')) AS repair,(SELECT COUNT(*) AS per_count FROM request_peripherals WHERE req_status = 'Pending' AND (requisitioner = '123456' OR tech_id = '123456')) AS peripherals");

	$st->execute();
	$result = $st->get_result()->fetch_assoc();


	$response = array();

	$response['inventory'] = $result['inv_count'];
	$response['repair'] =  $result['rep_count'];
	$response['peripherals'] = $result['per_count'];;

	echo json_encode($response);

?>