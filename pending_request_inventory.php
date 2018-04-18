<?php

require_once 'include/cict_db_request_functions.php';
$db = new cict_db_request_functions();
$result = array();

$result = $db->getPendingInventoryRequest($_POST['room_id']);

echo json_encode($result);
