<?php
require_once 'include/cict_db_connect.php';
$db  = new cict_db_connect();
$con = $db->connect();

$st = $con->prepare("SELECT * FROM task_schedule WHERE tech_id = ?");
$st->bind_param("s", $_POST['user_id']);
$st->execute();
$st->bind_result($sched_id, $category, $desc, $room_pc_id, $tech_id, $date, $time, $task_status);

$response = array();

while ($st->fetch()) {
	//sched_id, cat, desc, room_pc_id, tech_id, data,time, name
    $temp               = array();
    $temp['sched_id']   = $sched_id;
    $temp['cat']        = $category;
    $temp['desc']       = $desc;
    $temp['room_pc_id'] = $room_pc_id;
    $temp['tech_id']    = $tech_id;
    $temp['date']		= $date;
    $temp['time'] 		= $time;
    $temp['status']		= $task_status;
    //get room details
    if ($category == 'Schedule Inventory') {
        require_once 'include/cict_db_room_functions.php';
        $db_room      = new cict_db_room_functions();
        $room_details = $db_room->getRooms();

        for ($i = 0; $i < count($room_details); $i++) {
            $room_id   = $room_details[$i]{'room_id'};
            $dept_id   = $room_details[$i]{'dept_id'};
            $dept_name = $room_details[$i]{'dept_name'};
            if ($room_id == $room_pc_id) {
                if (is_null($dept_id)) {
                    $temp['name'] = $room_details[$i]{'room_name'};
                } else {
                    $temp['name'] = $dept_name . " " . $room_details[$i]{'room_name'};
                }
                break;
            }
        }
    } else {
        //get pc details
        require_once 'include/cict_db_comp_functions.php';
        $db_comp = new cict_db_comp_functions();

        $comp_details = $db_comp->getComputerDetails($room_pc_id);
        $temp['name'] = $comp_details['pc_no'];
    }

    array_push($response, $temp);
}

    echo json_encode($response);
