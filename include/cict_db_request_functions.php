<?php
class cict_db_request_functions
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function getRequestInventory()
    {
        $response = array();
        $stmt     = $this->con->prepare("SELECT * FROM request_inventory ORDER BY date_requested DESC, time_requested DESC");
        $stmt->execute();
        $stmt->bind_result($req_id, $rep_id, $room_id, $custodian, $technician, $date, $time, $msg, $date_req, $time_req, $status);

        require_once 'include/cict_db_users_functions.php';
        $db_users = new cict_db_users_functions();
         require_once 'include/cict_db_room_functions.php';
        $db_room = new cict_db_room_functions();

        while ($stmt->fetch()) {
            $temp = array();

            $cust_details = $db_users->getUserInfo($custodian);
            $tech_details = $db_users->getUserInfo($technician);
            $room_details = array();
            $room_details = $db_room->getRooms();

            for($i = 0; $i < count($room_details); $i++){
                $room = $room_details[$i]{'room_id'};
                $dept_id = $room_details[$i]{'dept_id'};
                $dept_name = $room_details[$i]{'dept_name'};
                if($room == $room_id){
                    if(is_null($dept_id)){
                        $temp['room_name'] = $room_details[$i]{'room_name'};
                    }else{
                        $temp['room_name'] = $dept_name ." ". $room_details[$i]{'room_name'};
                    }
                    break;
                }
            }
            $temp['req_id']         = $req_id;
            $temp['rep_id']         = $rep_id;
            $temp['room_id']        = $room_id;
            $temp['custodian']      = $custodian; //id
            $temp['technician']     = $technician; //id
            $temp['cust_name'] 		= $cust_details['name']; // cust_name
            $temp['tech_name'] 		= $tech_details['name']; // cust_name
            $temp['date']           = $date;
            $temp['time']           = $time;
            $temp['msg']            = $msg;
            $temp['req_status']     = $status;
            $temp['date_requested'] = $date_req;
            $temp['time_requested'] = $time_req;

            array_push($response, $temp);
        }
        return $response;
    }
}