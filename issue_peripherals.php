<?php
require_once 'include/cict_db_connect.php';
$db  = new cict_db_connect();
$con = $db->connect();

$req_id  = $_POST['req_id'];
 $issued = json_decode($_POST['issued'], true);

require_once 'include/cict_db_request_functions.php';
$db_req   = new cict_db_request_functions();
$response = array();
$issue    = false;
foreach ((array) $issued as $key) {
    $qty  = $key['qty'];
    $desc = $key['desc'];

    if ($db_req->peripheralsIssuance($req_id, $desc, $qty)) {
        $issue = true;
    } else {
        $issue = false;
        break;
    }
} //for loop
if ($issue) {
    //update
    if ($db_req->updateReqStatusToIssued($req_id)) {
        $response['error'] = false;
        $response['msg']   = "success";
    } else {
        $response['error'] = true;
        $response['msg']   = "failed to update";
    }
} else {
    $response['error'] = true;
    $response['msg']   = "error issuing peripherals";
}
echo json_encode($response);
