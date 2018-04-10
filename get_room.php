<?php
require_once 'include/cict_db_room_functions.php';
$rooms = new cict_db_room_functions();

$response = array();

$response = $rooms->getRooms();

echo json_encode($response);

?>