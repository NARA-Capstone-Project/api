<?php

require_once 'include/cict_db_request_functions.php';
$db_req = new cict_db_request_functions();

$response = array();

//purpose, designation(name/room_name, room_id), jsonarray - qty, desc, unit
$purpose     = $_POST['purpose'];
$details     = json_decode($_POST['details'], true);
$designation = $_POST['designation'];
$room_id     = $_POST['room_id'];

//get tech_id and cust_id and dept_id
$req_id = $db_req->savePeripheralRequest($room_id, $purpose, $designation);
if ($req_id != 0) {
    //save details
    $save_details = false;
    foreach ((array) $details as $key) {
        $qty  = $key['qty'];
        $desc = $key['desc'];
        $unit = $key['unit'];

        if ($db_req->savePeripheralsDetails($req_id, $qty, $desc, $unit)) {
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
