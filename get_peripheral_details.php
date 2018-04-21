<?php
		require_once 'include/cict_db_request_functions.php';
		$req = new cict_db_request_functions();

		$response = array();

		$response = $req->getPeripheralDetails($_POST['req_id']);

		echo json_encode($response);
?>