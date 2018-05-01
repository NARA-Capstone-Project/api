<?php

// $phone   = $_POST['phone'];
// $message = "HIIII!!";

// // Authorisation details.
// $username = "nara.thesis@gmail.com";
// $hash     = "b823fa73dcedf7ee6635b0f492c295b266cbcbf958b450059034ee44ae4ccb0c";
// //$usename = "ltest7754@gmail.com";
// //$hash = "5b194992ca61f3a62ca5057c6e6d648659645549d4d1f255811b1d0d28006b80";

// // Config variables. Consult http://api.txtlocal.com/docs for more info.
// //testing
// $test = "1";

// // Data for text message. This is the text message data.
// $sender = "CP Scan"; // This is who the message appears to be from.
// //get from users table

// $numbers = $phone; // A single number or a comma-seperated list of numbers

// // 612 chars or less
// // A single number or a comma-seperated list of numbers
// $message = urlencode($message);
// $data    = "username=" . $username . "&hash=" . $hash . "&message=" . $message . "&sender=" . $sender . "&numbers=" . $numbers . "&test=" . $test;
// $ch      = curl_init('http://api.txtlocal.com/send/?');
// curl_setopt($ch, CURLOPT_POST, true);
// curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
// curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
// $result = curl_exec($ch); // This is the result from the API
// curl_close($ch);

// if ($result != "") {
//     $response = array();
//     $json     = json_decode($result);
//     $status   = $json->status;
//     if ($status == "success") {
//         echo true;
//     } else {
//         echo false;
//     }
// } else {
//     echo true; //no internet
// }
// Authorisation details.
$phone = array("09758145019","09758145019");
        $username = "nara.thesis@gmail.com";
        $hash     = "b823fa73dcedf7ee6635b0f492c295b266cbcbf958b450059034ee44ae4ccb0c";
        //$usename = "ltest7754@gmail.com";
        //$hash = "5b194992ca61f3a62ca5057c6e6d648659645549d4d1f255811b1d0d28006b80";

        // Config variables. Consult http://api.txtlocal.com/docs for more info.
        //testing
        $test = "1";

        // Data for text message. This is the text message data.
        $sender = "CP Scan"; // This is who the message appears to be from.
        //check if multiple recipient
        if (gettype($phone) == "array") {
            $numbers = implode(',', $phone);
        } else {
            $numbers = $phone; // A single number
        }


        // 612 chars or less
        // A single number or a comma-seperated list of numbers
        $message = urlencode("HII");
        $data    = "username=" . $username . "&hash=" . $hash . "&message=" . $message . "&sender=" . $sender . "&numbers=" . $numbers . "&test=" . $test;
        $ch      = curl_init('http://api.txtlocal.com/send/?');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch); // This is the result from the API
        curl_close($ch);

        if ($result != "") {
            $response = array();
            $json     = json_decode($result);
            $status   = $json->status;
            if ($status == "success") {
                echo true;
            } else {
                echo false;
            }
        } else {
            echo false; //no internet
        }
