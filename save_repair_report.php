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
$cat     = 'Repair Report';
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
        if ($db_req->saveRequestRepairReport($rep_id, $req_id)) {
            $response['error']   = false;
            $response['message'] = 'Report successfully saved!';


            //sms

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
