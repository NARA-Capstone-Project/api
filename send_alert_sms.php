<?php
$response = array();

$room_name = $_POST['room_name'];
$pc_room_name = $_POST['pc_room_name'];
$pc_room_id = $_POST['pc_room_id'];
$pc_no = $_POST['pc_no'];
$room_cust = $_POST['room_cust']; //custoian name
$room_cust_phone = $_POST['room_cust_phone']; //cust phone

require_once 'include/cict_send_sms.php';
$db_sms = new cict_send_sms();
require_once 'include/cict_db_room_functions.php';
$db_rooms = new cict_db_room_functions();
require_once 'include/cict_db_users_functions.php';
$db_users = new cict_db_users_functions();

$pc_room_details = $db_rooms->getRoomDetails($pc_room_id);
$cust1         = $pc_room_details['room_custodian_id'];

//room details - room name
if (is_null($pc_room_details['dept_id'])) {
    $pc_room_name = $pc_room_details['room_name'];
} else {
    $dept_details = $db_rooms->getDeptdetails($pc_room_details['dept_id']);
    $pc_room_name    = $dept_details['dept_name'] . " " . $pc_room_details['room_name'];
}
//user details
$cust_details = $db_users->getUserInfo($cust1);

$recipient2 = $room_cust_phone;
$recipient1 = $cust_details['phone'];

//msg body
$msg_body = "Good Day! PC $pc_no of $pc_room_name found in $room_name.";

$sms_result = $db_sms->send_sms($recipient1, $msg_body);
if ($sms_result) {
    $response['sms'] = $msg_body; //sent!
} else {
    $response['sms'] = "Not Sent!"; //not sent!
}
echo json_encode($response);
