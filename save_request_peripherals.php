<?php

require_once 'include/cict_db_request_functions.php';
$db_req = new cict_db_request_functions();
require_once 'include/cict_db_room_functions.php';
$db_room = new cict_db_room_functions();
require_once 'include/cict_db_users_functions.php';
$db_users = new cict_db_users_functions();

$response = array();

//purpose, designation(name/room_name, room_id), jsonarray - qty, desc, unit
$purpose     = $_POST['purpose'];
$details     = json_decode($_POST['details'], true);
$designation = $_POST['designation'];
$room_id     = $_POST['room_id'];

//get tech_id and cust_id and dept_id
$room_details = $db_room->getRoomDetails($room_id);
if (is_null($room_details['dept_id'])) {
    $room_name = $room_details['room_name'];
} else {
    $dept_details = $db_room->getDeptdetails($room_details['dept_id']);
    $room_name    = $dept_details['dept_name'] . " " . $room_details['room_name'];
}
list($cust_name, $room_name) = explode("/", $designation);

$msg    = "Good Day! Mr./Ms. $cust_name of $room_name is requesting for the following peripherals: ";
$req_id = $db_req->savePeripheralRequest($room_id, $purpose, $designation);
if ($req_id != 0) {
    //save details
    $save_details = false;
    foreach ((array) $details as $key) {
        $qty  = $key['qty'];
        $desc = $key['desc'];
        $unit = $key['unit'];

        if ($db_req->savePeripheralsDetails($req_id, $qty, $desc, $unit)) {
            $msg .= "\n\t$qty $desc";
            $save_details = true;
        } else {
            $save_details = false;
            break;
        }
    } //for loop

    if ($save_details) {
        $response['error'] = false;
        $response['msg']   = "Saved!";

        //sms here

        require_once 'include/cict_send_sms.php';
        $sms = new cict_send_sms();

        $tech_id = $room_details['room_technician_id'];

        $tech_details = $db_users->getUserInfo($tech_id);
        $recipient    = $tech_details['phone'];

        $sms_result = $sms->send_sms($recipient, $msg);
        if ($sms_result) {
            $response['sms'] = $msg; //sent!
        } else {
            $response['sms'] = "Not Sent!"; //not sent!
        }

    } else {
        //delete lahat ng details and request by req id
        $db_req->deletePeripheralRequest($req_id);
        $db_req->deletePeripheralDetails($req_id);
        $response['error'] = true;
        $response['msg']   = "can't save request details";
    }
} else {
    $response['error'] = true;
    $response['msg']   = "can't create reqid";
}

echo json_encode($response);
