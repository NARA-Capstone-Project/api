<?php
		require_once 'include/cict_db_request_functions.php';
		$req = new cict_db_request_functions();

		$response =array();
		$response = $req->getPeripheralRequests();
		echo json_encode($response);

?>