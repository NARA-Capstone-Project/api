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
        $st       = $this->con->prepare("SELECT * from (select comp.*, d.pc_no, d.comp_status, d.room_id from computers as comp, comp_details as d where d.comp_id = comp.comp_id) as comp_details");
        $st->execute();
        $st->bind_result($comp_id, $os, $model, $pr, $mb, $monitor, $ram, $kboard, $mouse, $vga, $hdd, $pc_no, $status, $room_id);

        while ($st->fetch()) {
            $temp                = array();
            $temp['comp_id']     = $comp_id;
            $temp['room_id']     = $room_id;
            $temp['os']          = $os;
            $temp['model']       = $model;
            $temp['mb']          = $mb;
            $temp['pr']          = $pr;
            $temp['monitor']     = $monitor;
            $temp['ram']         = $ram;
            $temp['kboard']      = $kboard;
            $temp['mouse']       = $mouse;
            $temp['vga']         = $vga;
            $temp['hdd']         = $hdd;
            $temp['comp_status'] = $status;
            $temp['pc_no']       = $pc_no;

            array_push($response, $temp);
        }

        return $response;
    }
}
