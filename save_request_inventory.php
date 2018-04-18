<?php
//room_id cust_id tech_id date_req time_req set_time set_date message
$room_id  = $_POST['room_id'];
$date_req = $_POST['date_req']; //date na nagreq si user
$time_req = $_POST['time_req'];
$set_time = $_POST['set_time'];
$set_date = $_POST['set_date'];
$msg      = $_POST['message'];


require_once 'include/cict_db_request_functions.php';
$db       = new cict_db_request_functions();
$response = array();

date_default_timezone_set('Asia/Manila');

if (strlen($date_req) == 0) {
    $date_req = date_create('Y-m-d');
}

if (strlen($time_req) == 0) {
    $time_req = date_create('H:i:s');
}

$result = $db->saveInventoryRequest($room_id, $set_date, $set_time, $msg, $date_req, $time_req);

//get id
if ($result == 0) {
    $response['error'] = true;
} else {
    $response['error'] = false;
    $response['id']    = $result;

    //sms
    require_once 'include/cict_send_sms.php';
    $sms = new cict_send_sms();
    require_once 'include/cict_db_room_functions.php';
    $rooms = new cict_db_room_functions();
    require_once 'include/cict_db_users_functions.php';
    $users = new cict_db_users_functions();

    $room_details = $rooms->getRoomDetails($room_id);
    $cust = $room_details['room_custodian_id'];
    $tech = $room_details['room_technician_id'];

    //room details - room name
    if(is_null($room_details['dept_id'])){
    	$room_name = $room_details['room_name'];
    }else{
    	$dept_details = $rooms->getDeptdetails($room_details['dept_id']);
    	$room_name = $dept_details['dept_name'] ." ". $room_details['room_name'];
    }
    //user details
    $cust_details = $users->getUserInfo($cust);
    $tech_details = $users->getUserInfo($tech);

    $cust_name = $cust_details['name'];
    $tech_name = $tech_details['name'];
    $recipient = $tech_details['phone'];

    //msg body
    $msg_body = "Good Day! Mr./Ms. $cust_name requested an inventory of $room_name on: \nDate: $set_date \nTime: $set_time";

    $sms_result = $sms->send_sms($recipient, $msg_body);
    if($sms_result){
    	$response['sms'] = "Sent! msg: " .$msg_body; //sent!
    }else{
    	$response['sms'] = "Not Sent!"; //not sent!   
    }
}

echo json_encode($response);
