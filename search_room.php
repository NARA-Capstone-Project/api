<?php
require_once 'include/cict_db_connect.php';
$db       = new cict_db_connect();
$con      = $db->connect();
$response = array();

if (isset($_POST['query'])) {
    $st = $con->prepare($_POST['query']);
    $st->bind_result($id, $dept_name, $cust_id, $tech_id, $room_name, $building, $custodian, $technician, $room);

    if ($st->execute()) {
        while ($st->fetch()) {
            $temp = array();

            $temp['room_id']         = $id;
            $temp['dept_name']  = $dept_name;
            $temp['room_name']  = $room_name;
            $temp['building']   = $building;
            $temp['cust_name']  = $custodian;
            $temp['tech_name'] = $technician;

            array_push($response, $temp);
        }
    } else {
        $response['error'] = true;
    }

    echo json_encode($response);
}
