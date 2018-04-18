<?php

class cict_db_report_functions
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function getInventoryRequests($user_id)
    {
        $st = $this->con->prepare("SELECT * FROM request_inventory WHERE custodian =? or technician = ? ORDER BY date_requested DESC, time_requested DESC");
        $st->bind_param("ss", $user_id, $user_id);
        $stmt->execute();
        $stmt->bind_result($req_id, $rep_id, $room_id, $custodian, $technician, $date, $time, $msg, $date_req, $time_req, $status);

        while ($stmt->fetch()) {
            $temp = array();

            $temp['req_id']         = $req_id;
            $temp['rep_id']         = $rep_id;
            $temp['room_id']        = $room_id;
            $temp['custodian']      = $custodian;
            $temp['technician']     = $technician;
            $temp['date']           = $date;
            $temp['time']           = $time;
            $temp['msg']            = $msg;
            $temp['req_status']     = $status;
            $temp['date_requested'] = $date_req;
            $temp['time_requested'] = $time_req;

            array_push($response, $temp);
        }

    }

    private function genId()
    {
        $rep_id = rand(1000, 99999);
        return $rep_id;
    }
    private function checkRepId($rep_id)
    {
        $stmt = $this->con->prepare("SELECT * FROM assessment_reports WHERE rep_id = ?");
        $stmt->bind_param("i", $rep_id);
        $stmt->store_result();
        if ($stmt->num_rows() > 0) {
            return false;
        } else {
            return true;
        }
    }

    public function saveInventoryReport($room_id, $date, $time, $remarks, $cat)
    {

        while (true) {
            $rep_id = $this->genId();
            if ($this->checkRepId($rep_id)) {
                break;
            }
        }
        require_once 'include/cict_db_room_functions.php';
        $room    = new cict_db_room_functions();
        $details = $room->getRoomDetails($room_id);
        $tech_id = $details['room_technician_id'];
        $cust_id = $details['room_custodian_id'];

        $stmt = $this->con->prepare("INSERT INTO assessment_reports VALUES(?,?,?,?,?,?,?,0,0,0,?)");
        $stmt->bind_param("iissssss", $rep_id, $room_id, $cust_id, $tech_id, $cat, $date, $time, $remarks);

        if ($stmt->execute()) {
            return $rep_id;
        } else {
            echo 'ERROR ';
            return 0;
        }
    }
    public function saveReportDetails($rep_id, $comp_id, $pc_no, $model, $processor, $mb, $mb_serial, $monitor, $mon_serial, $ram, $kboard, $mouse, $vga, $hdd, $status)
    {
        $stmt = $this->con->prepare("INSERT into assessment_details values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param("iiissssssssssss", $rep_id, $comp_id, $pc_no, $model, $processor, $mb, $mb_serial, $monitor, $mon_serial, $ram, $kboard, $mouse, $vga, $hdd, $status);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }

    }

    public function deleteReport($rep_id)
    {
        $st = $this->con->prepare("DELETE FROM assessment_reports WHERE rep_id = ?");
        $st->bind_param("i", $rep_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }

    }

    public function getLastInventory($room_id)
    {
        $st = $this->con->prepare("SELECT * FROM assessment_reports WHERE room_id = ? ORDER BY date DESC, time DESC LIMIT 1");
        $st->bind_param("i", $room_id);
        $st->execute();

        return $st->get_result()->fetch_assoc();
    }

    public function getInventoryReports()
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * FROM assessment_reports ORDER BY date DESC, time DESC");
        $st->execute();
        $st->bind_result($rep_id, $room_id, $cust_id, $tech_id, $cat, $date, $time, $cust_signed, $tech_signed, $admin_signed, $remarks);
        while ($st->fetch()) {
            $temp = array();

            $temp['rep_id']       = $rep_id;
            $temp['room_id']      = $room_id;
            $temp['cust_id']      = $cust_id;
            $temp['tech_id']      = $tech_id;
            $temp['cat']          = $cat;
            $temp['date']         = $date;
            $temp['time']         = $time;
            $temp['cust_signed']  = $cust_signed;
            $temp['tech_signed']  = $tech_signed;
            $temp['admin_signed'] = $admin_signed;
            $temp['remarks']      = $remarks;

            array_push($response, $temp);
        }

        require_once 'include/cict_db_users_functions.php';
        require_once 'include/cict_db_room_functions.php';
        $db_room  = new cict_db_room_functions();
        $db_users = new cict_db_users_functions();

        for ($i = 0; $i < count($response); $i++) {
            $cust_id = $response[$i]{'cust_id'};
            $tech_id = $response[$i]{'tech_id'};
            $r_id    = $response[$i]{'room_id'};
            $report  = $response[$i]{'rep_id'};

            $room_details = $db_room->getRoomDetails($r_id);
            $cust_details = $db_users->getUserInfo($cust_id);
            $tech_details = $db_users->getUserInfo($tech_id);

            $cust_name                 = $cust_details['name'];
            $tech_name                 = $tech_details['name'];
            $response[$i]{'cust_name'} = $cust_name;
            $response[$i]{'tech_name'} = $tech_name;
            if (is_null($room_details['dept_id'])) {
                $response[$i]{'room_name'} = $room_details['room_name'];
            } else {
                $dept_details              = $db_room->getDeptdetails($room_details['dept_id']);
                $response[$i]{'room_name'} = $dept_details['dept_name'] . " " . $room_details['room_name'];
            }

            //if repair report
            if ($response[$i]{'cat'} == 'Repair Report') {
                $comp_details          = $this->getInventoryDetailsWithId($report);
                $response[$i]{'pc_no'} = $comp_details[0]{'pc_no'};
            }
        } //for loop

        return $response;
    } //function

    public function getInventoryDetailsWithId($rep_id)
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * FROM assessment_details WHERE rep_id = ?");
        $st->bind_param("i", $rep_id);
        $st->bind_result($rep_id, $comp_id, $pc_no, $model, $processor, $mb, $mb_serial, $monitor, $mon_serial, $ram, $kboard, $mouse, $vga, $hdd, $comp_status);
        $st->execute();

        while ($st->fetch()) {
            $key                = array();
            $key['rep_id']      = $rep_id;
            $key['comp_id']     = $comp_id;
            $key['pc_no']       = $pc_no;
            $key['model']       = $model;
            $key['pr']          = $processor;
            $key['mb']          = $mb;
            $key['mb_serial']   = $mb_serial;
            $key['mon']         = $monitor;
            $key['mon_serial']  = $mon_serial;
            $key['ram']         = $ram;
            $key['kb']          = $kboard;
            $key['mouse']       = $mouse;
            $key['vga']         = $vga;
            $key['hdd']         = $hdd;
            $key['comp_status'] = $comp_status;

            array_push($response, $key);
        }

        return $response;
    }
}
