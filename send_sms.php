<?php
$response = array();
$phone    = $_POST['phone'];
$message  = $_POST['msg_body'];
// Authorisation details.
$username = "nara.thesis@gmail.com"; //thesis.messenger@gmail.com // wala ng text
$hash     = "b823fa73dcedf7ee6635b0f492c295b266cbcbf958b450059034ee44ae4ccb0c";

// Config variables. Consult http://api.txtlocal.com/docs for more info.
//testing
$test = "1";

// Data for text message. This is the text message data.
$sender = "CP Scan"; // This is who the message appears to be from.
//get from users table

$numbers = $phone; // A single number or a comma-seperated list of numbers

// 612 chars or less
// A single number or a comma-seperated list of numbers
$message = urlencode($message);
$data    = "username=" . $username . "&hash=" . $hash . "&message=" . $message . "&sender=" . $sender . "&numbers=" . $numbers . "&test=" . $test;
$ch      = curl_init('http://api.txtlocal.com/send/?');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$result = curl_exec($ch); // This is the result from the API
curl_close($ch);

$json     = json_decode($result);
$status   = $json->status;
if ($status == "success") {
    $response['error'] = false;
} else {
    $response['error'] = true;
}
echo json_encode($response);