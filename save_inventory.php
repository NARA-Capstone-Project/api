<?php

require_once 'include/cict_db_connect.php';
$db  = new cict_db_connect();
$con = $db->connect();

$response = array();
//date time room_id cust_id tech_id remarks jsonarray
$req_id = $_POST['req_id'];
// $date_report = $_POST['date'];
// $time_report = $_POST['time'];
$room_id = $_POST['room_id'];
$remarks = $_POST['remarks'];
$cat     = 'Inventory Report';
$details = json_decode($_POST['details'], true); //jsonarray
// if (strlen($date_report) == 0 and strlen($time_report) == 0) {
//     date_default_timezone_set('Asia/Manila');
//     $date_report = date_create('Y-m-d');
//     $time_report = date_create('H:i:s');
// }
date_default_timezone_set('Asia/Manila');
$date_report = date('Y-m-d');
$time_report = date('H:i:s');

require_once 'include/cict_db_report_functions.php';
$db_rep = new cict_db_report_functions();
require_once 'include/cict_db_comp_functions.php';
$db_comp = new cict_db_comp_functions();
require_once 'include/cict_db_request_functions.php';
$db_req = new cict_db_request_functions();

require_once 'include/cict_send_sms.php';
$db_sms = new cict_send_sms();
require_once 'include/cict_db_room_functions.php';
$db_rooms = new cict_db_room_functions();
require_once 'include/cict_db_users_functions.php';
$db_users = new cict_db_users_functions();

$rep_id = $db_rep->saveInventoryReport($room_id, $date_report, $time_report, $remarks, $cat);

$save_details = false;
if ($rep_id != 0) {
    foreach ((array) $details as $key) {
        $comp_id     = $key['comp_id'];
        $pc_no       = $key['pc_no'];
        $model       = $key['model'];
        $pr          = $key['pr'];
        $mb          = $key['mb'];
        $mb_serial   = $key['mb_serial'];
        $monitor     = $key['monitor'];
        $mon_serial  = $key['mon_serial'];
        $ram         = $key['ram'];
        $kboard      = $key['kb'];
        $mouse       = $key['mouse'];
        $vga         = $key['vga'];
        $hdd         = $key['hdd'];
        $comp_status = $key['comp_status'];

        $result = $db_rep->saveReportDetails($rep_id, $comp_id, $pc_no, $model, $pr, $mb, $mb_serial, $monitor, $mon_serial, $ram, $kboard, $mouse, $vga, $hdd, $comp_status);
        if ($result) {
            $detailsSaved = $db_comp->updateComputers($comp_status, $comp_id, $kboard, $mouse, $vga);
            if ($detailsSaved) {
                $save_details = true;
            } else {
                $save_details = false;
                break;
            }

        } else {
            $save_details = false;
            break;
        }
    } //for loop
    if ($save_details == false) {
        $response['error']   = true;
        $response['message'] = 'Something went wrong in saving report';
        //delete report
        $delete = $db_rep->deleteReport($rep_id);
        if ($delete) {
            $response['del'] = 'Deleted';
        } else {
            $response['del'] = 'Not Deleted';
        }

    } else {
        //save report id to request_inventory
        if ($db_req->saveRequestInventoryReport($rep_id, $req_id)) {
            $response['error']   = false;
            $response['message'] = 'Report successfully saved!';

            //sms
            $room_details = $db_rooms->getRoomDetails($room_id);
            $cust         = $room_details['room_custodian_id'];
            $tech         = $room_details['room_technician_id'];

            //room details - room name
            if (is_null($room_details['dept_id'])) {
                $room_name = $room_details['room_name'];
            } else {
                $dept_details = $db_rooms->getDeptdetails($room_details['dept_id']);
                $room_name    = $dept_details['dept_name'] . " " . $room_details['room_name'];
            }
            //user details
            $cust_details = $db_users->getUserInfo($cust);
            $tech_details = $db_users->getUserInfo($tech);

            $cust_name = $cust_details['name'];
            $tech_name = $tech_details['name'];
            $recipient = $cust_details['phone'];

            //msg body
            
            $msg_body = "Good Day!  Technician $tech_name finished assessing your room $room_name inventory, please check and sign the report.";

            $sms_result = $db_sms->send_sms($recipient, $msg_body);
            if ($sms_result) {
                $response['sms'] = $msg_body; //sent!
            } else {
                $response['sms'] = "Not Sent!"; //not sent!
            }
        } else {
            $delete = $db_rep->deleteReport($rep_id);
            if ($delete) {
                $response['del'] = 'Deleted';
            } else {
                $response['del'] = 'Not Deleted';
            }
            $response['error']   = true;
            $response['message'] = 'Something went wrong in saving report';
        }
    }
} else {
    $response['error']   = true;
    $response['message'] = 'Something went wrong in saving report';
    $response['del']     = 'Error creating report id';
}
echo json_encode($response);
