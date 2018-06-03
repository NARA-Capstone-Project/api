<?php

class cict_send_sms
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function send_sms($phone, $message)
    {
        // Authorisation details.
        // $username = "nara.thesis@gmail.com";
        // $hash     = "b823fa73dcedf7ee6635b0f492c295b266cbcbf958b450059034ee44ae4ccb0c";
        // $username = "another.thesis.sms@gmail.com";
        // $hash = "4c3cb9b961194a6777c561597cd567c8e8d2808731d0565f253336c7822593ba";
        $username = "ltest7754@gmail.com";
        $hash     = "5b194992ca61f3a62ca5057c6e6d648659645549d4d1f255811b1d0d28006b80";

        // Config variables. Consult http://api.txtlocal.com/docs for more info.
        //testing
        $test = "0";

        // Data for text message. This is the text message data.
        $sender = "CP Scan"; // This is who the message appears to be from.
        //check if multiple recipient
        $recipient_phone = $phone;
        if (gettype($phone) == "array") {
            $numbers = implode(',', $phone); //multiple number
        } else {
            if ($recipient_phone[0] == '0') {
                $phone = preg_replace('/^0/', '63', $recipient_phone);
            } else {
                $phone = $recipient_phone;
            }
            $numbers = $phone; // A single number
        }

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

        if ($result != "") {
            $response = array();
            $json     = json_decode($result);
            $status   = $json->status;
            if ($status == "success") {
                return true;
            } else {
                return false;
            }
        } else {
            return false; //no internet
        }
    }
}
