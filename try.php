<?php

require_once 'include/cict_db_room_functions.php';
$db = new cict_db_room_functions();
require_once 'include/cict_db_room_functions.php';
$db_room = new cict_db_room_functions();


$response = array();
$response = $db_room->getRooms();

for($i = 0; $i < count($response); $i++){
	$id = $response[$i]{'room_id'};
	$room_name = $response[$i]{'dept_name'};
	echo $id ." dept name ". $room_name;
}

