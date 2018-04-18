<?php

require_once 'include/cict_db_request_functions.php';
$db = new cict_db_request_functions();
//comp_id cust_id tech_id date_req time_req set_time set_date message image rep_details
$comp_id     = $_POST['comp_id'];
$date_req    = $_POST['date_req']; //date na nagreq si user
$time_req    = $_POST['time_req'];
$set_time    = $_POST['set_time'];
$set_date    = $_POST['set_date'];
$msg         = $_POST['message'];
$image       = $_POST['image'];
$rep_details = $_POST['rep_details'];
$response    = array();

//image
$image_dir = 'images/repair_photos';

if (strlen($image) != 0) {
    if (!file_exists($image_dir)) {
        mkdir($image_dir, 0777, true);
    }

    $image_path = $image_dir . "/" . rand() . "_" . time() . ".jpeg";
} else {
    $image_path = "";
}

//date req
date_default_timezone_set('Asia/Manila');

if (strlen($date_req) == 0) {
    $date_req = date_create('Y-m-d');
}

if (strlen($time_req) == 0) {
    $time_req = date_create('H:i:s');
}

//save image first kung meron
if (strlen($image) != 0) {
    if ($db->uploadImage($image, $image_path)) {
        $response['image'] = 'Inserted';
    } else {
        $response['image'] = 'Not inserted';
    }
}

//save request
$result = $db->saveRepairRequest($set_date, $set_time, $date_req, $time_req, $rep_details, $msg, $comp_id, $image_path);

if ($result != 0) {
    $response['error'] = false;
    $response['id']    = $result;

    //sms

    require_once 'include/cict_send_sms.php';
    $db_sms = new cict_send_sms();
    require_once 'include/cict_db_room_functions.php';
    $db_rooms = new cict_db_room_functions();
    require_once 'include/cict_db_users_functions.php';
    $db_users = new cict_db_users_functions();
    require_once 'include/cict_db_comp_functions.php';
    $db_comp = new cict_db_comp_functions();


    $comp_details = $db_comp->getComputerDetails($comp_id);
    $room_id = $comp_details['room_id'];
    $pc_no = $comp_details['pc_no'];

    $room_details = $db_rooms->getRoomDetails($room_id);
    $cust = $room_details['room_custodian_id'];
    $tech = $room_details['room_technician_id'];

    //room details - room name
    if(is_null($room_details['dept_id'])){
    	$room_name = $room_details['room_name'];
    }else{
    	$dept_details = $db_rooms->getDeptdetails($room_details['dept_id']);
    	$room_name = $dept_details['dept_name'] ." ". $room_details['room_name'];
    }
    //user details
    $cust_details = $db_users->getUserInfo($cust);
    $tech_details = $db_users->getUserInfo($tech);

    $cust_name = $cust_details['name'];
    $tech_name = $tech_details['name'];
    $recipient = $tech_details['phone'];

    //msg body
    $msg_body = "Good Day! Mr./Ms. $cust_name requested for repair of PC $pc_no in $room_name on: \nDate: $set_date \nTime: $set_time";

    $sms_result = $db_sms->send_sms($recipient, $msg_body);
    if($sms_result){
    	$response['sms'] = "Sent! msg: " .$msg_body; //sent!
    }else{
    	$response['sms'] = "Not Sent!"; //not sent!   
    }


} else {
    $response['error'] = true;
}

echo json_encode($response);
