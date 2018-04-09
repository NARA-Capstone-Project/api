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
        while($st->fetch()){
        	$temp = array();

        	$temp['pc_no'] = $pc_no;
        	$temp['comp_status'] = $comp_status;

        	array_push($response, $temp);

        }
        return $response;
    }

}
