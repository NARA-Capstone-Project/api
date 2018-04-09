<?php
require_once 'include/cict_db_room_functions.php';
$rooms = new cict_db_room_functions();

$response = array();

$response = $rooms->getRoomDetails($_POST['user_id']);

echo json_encode($response);

?>