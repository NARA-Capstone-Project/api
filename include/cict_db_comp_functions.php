<?php

class cict_db_comp_functions
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function getCompDetails($id)
    {
        $response = array();

        $st = $this->con->prepare("SELECT * from comp_details WHERE room_id = ?");
        $st->bind_param("i", $id);
        $st->execute();
        $st->bind_result($c_id, $r_id, $pc_no, $comp_status);
        while ($st->fetch()) {
            $temp = array();

            $temp['pc_no']       = $pc_no;
            $temp['comp_status'] = $comp_status;

            array_push($response, $temp);

        }
        return $response;
    }

    public function getComputerDetails($comp_id)
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * from (select comp.*, details.pc_no, details.room_id from computers as comp, comp_details as details where comp.comp_id = details.comp_id) as details where details.comp_id = ?");
        $st->bind_param("i", $comp_id);
        $st->execute();
        return $st->get_result()->fetch_assoc();
    }

    public function getComputers()
    {
        $response = array();
        // $st       = $this->con->prepare("SELECT * from (select comp.*, d.pc_no, d.comp_status, d.room_id from computers as comp, comp_details as d where d.comp_id = comp.comp_id) as comp_details");
        $st = $this->con->prepare("SELECT * from computers");
        $st->execute();
        $st->bind_result($comp_id, $os, $model,$comp_serial, $pr, $mb, $monitor, $ram, $kboard, $mouse, $vga, $hdd);

        while ($st->fetch()) {
            $temp            = array();
            $temp['comp_id'] = $comp_id;
            $temp['os']      = $os;
            $temp['model']   = $model;
            $temp['comp_serial']     = $comp_serial;
            $temp['mb']      = $mb;
            $temp['pr']      = $pr;
            $temp['monitor'] = $monitor;
            $temp['ram']     = $ram;
            $temp['kboard']  = $kboard;
            $temp['mouse']   = $mouse;
            $temp['vga']     = $vga;
            $temp['hdd']     = $hdd;

            array_push($response, $temp);
        }
        require_once 'include/cict_db_room_functions.php';
        $db_room = new cict_db_room_functions();

        //comp_details
        for ($i = 0; $i < count($response); $i++) {
            $id      = $response[$i]{'comp_id'};
            $details = $this->computerDetails($id);
            if (is_null($details['comp_status'])) {
                $response[$i]{'comp_status'} = 'No Status';
            } else {
                $response[$i]{'comp_status'} = $details['comp_status'];
            }

            $response[$i]{'pc_no'} = $details['pc_no'];
            $response[$i]{'room_id'} = $details['room_id'];

//room_details
            $r_id = $details['room_id'];
            if (!is_null($r_id)) {
                $r_details = $db_room->getRoomDetails($r_id);
                $dept    = $db_room->getDeptdetails($r_details['dept_id']);
                if (is_null($r_details['dept_id'])) {
                    $response[$i]{'room_name'} = $r_details['room_name'];
                } else {
                    $dept_name                 = $dept['dept_name'];
                    $response[$i]{'room_name'} = $dept_name . " " . $r_details['room_name'];
                }
            } else {
                $response[$i]{'room_name'} = "Not Assigned To a Room";
            }
        }

        return $response;
    }

    public function computerDetails($comp_id)
    {
        $st = $this->con->prepare("SELECT * from comp_details where comp_id= ? ");
        $st->bind_param("i", $comp_id);
        $st->execute();
        return $st->get_result()->fetch_assoc();
    }
    public function updateComputers($comp_status, $comp_id, $kboard, $mouse, $vga)
    {
        $stmt = $this->con->prepare("UPDATE comp_details set comp_status = ? where comp_id = ?");
        $stmt->bind_param("si", $comp_status, $comp_id);
        if ($stmt->execute()) {
            $stmt->close();
            $stmt = $this->con->prepare("UPDATE computers set kboard = ?, mouse = ?, vga = ? where comp_id = ?");
            $stmt->bind_param("sssi", $kboard, $mouse, $vga, $comp_id);
            if ($stmt->execute()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}
