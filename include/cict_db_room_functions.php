<?php
class cict_db_room_functions
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function getRooms()
    {

        require_once 'include/cict_db_comp_functions.php';
        $comp = new cict_db_comp_functions();
        require_once 'include/cict_db_users_functions.php';
        $user = new cict_db_users_functions();

        $response = array();
        $st       = $this->con->prepare("SELECT * FROM room");
        $st->bind_result($room_id, $dept_id, $cust_id, $tech_id, $room_name, $building, $flr, $room_image);
        $st->execute();
        while ($st->fetch()) {
            $temp = array();

            //$temp['projector'] = $projector
            $temp['room_id']    = $room_id;
            $temp['dept_id']    = $dept_id;
            $temp['cust_id']    = $cust_id;
            $temp['tech_id']    = $tech_id;
            $temp['room_name']  = $room_name;
            $temp['building']   = $building;
            $temp['flr']        = $flr;
            $temp['room_image'] = $room_image;
            array_push($response, $temp);
        }
        $st->close();

        for ($i = 0; $i < count($response); $i++) {
            $room_id = $response[$i]{'room_id'};
            $dept_id = $response[$i]{'dept_id'};

            //get last inventory
            require_once 'include/cict_db_report_functions.php';
            $rep = new cict_db_report_functions();
            $result = $rep->getLastInventory($room_id);
            if($result > 0){
                $response[$i]{'last_assess'}  = $result['date'];
            }else{
                $response[$i]{'last_assess'} = '---';
            }

            //user
            $tech_name                 = $user->getUserInfo($response[$i]{'tech_id'});
            $cust_name                 = $user->getUserInfo($response[$i]{'cust_id'});
            $response[$i]{'tech_name'} = $tech_name['name'];
            $response[$i]{'cust_name'} = $cust_name['name'];
            $response[$i]{'cust_phone'} = $cust_name['phone'];
            $response[$i]{'tech_phone'} = $tech_name['phone'];

            //department details
            $dept_details              = $this->getDeptdetails($dept_id);
            $response[$i]{'dept_name'} = $dept_details['dept_name'];

            //comp_details
            $pc_working   = 0;
            $comp_details = $comp->getCompDetails($room_id);
            $pc_count     = count($comp_details);
            if ($pc_count > 0) {

                for ($x = 0; $x < count($comp_details); $x++) {
                    if ($comp_details[$x]{'comp_status'} == 'Working') {
                        $pc_working = $pc_working + 1;
                    }
                }
            }
            $response[$i]{'pc_count'}   = $pc_count;
            $response[$i]{'pc_working'} = $pc_working;
        }
        return $response;
    } //function

    public function getDeptdetails($dept_id)
    {
        $st = $this->con->prepare("SELECT * from department WHERE dept_id = ?");
        $st->bind_param("i", $dept_id);
        $st->execute();
        return $st->get_result()->fetch_assoc();
    }

    public function getRoomDetails($room_id)
    {
        $st = $this->con->prepare("SELECT * FROM room WHERE room_id = ?");
        $st->bind_param("i", $room_id);
        $st->execute();

        return $st->get_result()->fetch_assoc();
    }
}
