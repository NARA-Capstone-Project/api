<?php
	
	require_once 'include/cict_db_report_functions.php';
	$db_rep = new cict_db_report_functions();

	echo json_encode($db_rep->getInventoryReports());
?>