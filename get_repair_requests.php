<?php
require_once 'include/cict_db_request_functions.php';
$db = new cict_db_request_functions();

echo json_encode($db->getRepairRequest());
?>