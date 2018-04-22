<?php

$purpose  = $_POST['purpose'];
$req_id   = $_POST['req_id'];
$details  = json_decode($_POST['details'], true);
$response = array();

//update purpose
require_once 'include/cict_db_connect.php';
$db  = new cict_db_connect();
$con = $db->connect();
$st  = $con->prepare("UPDATE request_peripherals SET purpose = ? where req_id = ?");
$st->bind_param("si", $purpose, $req_id);
if ($st->execute()) {

    require_once 'include/cict_db_request_functions.php';
    $db_req = new cict_db_request_functions();

    $save_details = null;

    //delete details
    if ($db_req->deletePeripheralDetails($req_id)) {
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
    } else {
        $response['error'] = true;
        $response['msg']   = "Cant delete details";
    }
    if ($save_details) {
        $response['error'] = false;
        $response['msg']   = "Saved!";
    } else if ($save_details === false){
        $response['error'] = true;
        $response['msg']   = "can't save request details";
    }

} else {
    $response['error'] = true;
    $response['msg']   = "cant update purpose";
}

echo json_encode($response);
