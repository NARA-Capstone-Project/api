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

            for ($i = 0; $i < count($room_details); $i++) {
                $room      = $room_details[$i]{'room_id'};
                $dept_id   = $room_details[$i]{'dept_id'};
                $dept_name = $room_details[$i]{'dept_name'};
                if ($room == $room_id) {
                    if (is_null($dept_id)) {
                        $temp['room_name'] = $room_details[$i]{'room_name'};
                    } else {
                        $temp['room_name'] = $dept_name . " " . $room_details[$i]{'room_name'};
                    }
                    break;
                }
            }
            $temp['req_id']         = $req_id;
            $temp['rep_id']         = $rep_id;
            $temp['room_id']        = $room_id;
            $temp['custodian']      = $custodian; //id
            $temp['technician']     = $technician; //id
            $temp['cust_name']      = $cust_details['name']; // cust_name
            $temp['tech_name']      = $tech_details['name']; // cust_name
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

    public function saveInventoryRequest($room_id, $set_date, $set_time, $msg, $date_req, $time_req)
    {
        require_once 'include/cict_db_room_functions.php';
        $room    = new cict_db_room_functions();
        $details = $room->getRoomDetails($room_id);
        $tech_id = $details['room_technician_id'];
        $cust_id = $details['room_custodian_id'];

        $stmt = $this->con->prepare("INSERT into request_inventory values(null, null, ?,?,?,?,?,?,?,?,'Pending')");
        $stmt->bind_param("ssssssss", $room_id, $cust_id, $tech_id, $set_date, $set_time, $msg, $date_req, $time_req);

        if ($stmt->execute()) {
            $last_id = $this->con->insert_id;
            return $last_id;
        } else {
            return 0;
        }

    }

    public function saveRepairRequest($set_date, $set_time, $date_req, $time_req, $rep_details, $msg, $comp_id, $image_path)
    {
        require_once 'include/cict_db_room_functions.php';
        $room = new cict_db_room_functions();
        require_once 'include/cict_db_comp_functions.php';
        $comps        = new cict_db_comp_functions();
        $comp_details = $comps->getComputerDetails($comp_id);
        $room_id      = $comp_details['room_id'];
        $details      = $room->getRoomDetails($room_id);
        $tech_id      = $details['room_technician_id'];
        $cust_id      = $details['room_custodian_id'];

        if (strlen($image_path) != 0) {
            $query = "INSERT INTO request_repair VALUES(null, ?,null,?,?,?,?,?,'$image_path','$date_req', '$time_req','Pending',?)";
        } else {
            $query = "INSERT INTO request_repair VALUES(null, ?,null,?,?,?,?,?,null,'$date_req', '$time_req','Pending',?)";
        }

        $st = $this->con->prepare($query);
        $st->bind_param("issssss", $comp_id, $msg, $cust_id, $tech_id, $set_date, $set_time, $rep_details);

        if ($st->execute()) {
            return $this->con->insert_id;
        } else {
            return 0;
        }

    }

    public function uploadImage($image, $image_path)
    {
        if (file_put_contents($image_path, base64_decode($image))) {
            return true;
        } else {
            return false;
        }
    }

    public function getRepairRequest()
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * FROM request_repair ORDER BY date_requested DESC, time_requested DESC");
        $st->bind_result($req_id, $comp_id, $rep_id, $msg, $cust_id, $tech_id, $date, $time, $image, $date_req, $time_req, $req_status, $rep_details);
        $st->execute();
        require_once 'include/cict_db_comp_functions.php';
        $db_comp = new cict_db_comp_functions();

        while ($st->fetch()) {
            $temp                = array();
            $temp['req_id']      = $req_id;
            $temp['comp_id']     = $comp_id;
            $temp['rep_id']      = $rep_id;
            $temp['msg']         = $msg;
            $temp['cust_id']     = $cust_id;
            $temp['tech_id']     = $tech_id;
            $temp['set_date']    = $date;
            $temp['set_time']    = $time;
            $temp['image']       = $image;
            $temp['date_req']    = $date_req;
            $temp['time_req']    = $time_req;
            $temp['req_status']  = $req_status;
            $temp['req_details'] = $rep_details;
            $temp['image']       = $image;
            array_push($response, $temp);
        }
        require_once 'include/cict_db_users_functions.php';
        $db_users = new cict_db_users_functions();
        for ($i = 0; $i < count($response); $i++) {
            $details                 = $db_comp->getComputerDetails($response[$i]{'comp_id'});
            $response[$i]{'pc_no'}   = $details['pc_no'];
            $response[$i]{'room_id'} = $details['room_id'];

            //user functions
            $cust_id = $response[$i]{'cust_id'};
            $tech_id = $response[$i]{'tech_id'};

            $cust_details = $db_users->getUserInfo($cust_id);
            $tech_details = $db_users->getUserInfo($tech_id);

            $cust_name                 = $cust_details['name'];
            $tech_name                 = $tech_details['name'];
            $response[$i]{'cust_name'} = $cust_name;
            $response[$i]{'tech_name'} = $tech_name;
        }

        return $response;
    }

    public function getPendingInventoryRequest($room_id)
    {
        $accepted = 'Accepted';
        $pending  = 'Pending';
        $response = array();

        $st = $this->con->prepare("SELECT * FROM request_inventory WHERE room_id = ? and (req_status = 'Pending' or req_status = 'Accepted') ORDER BY date DESC, time DESC LIMIT 1");
        $st->bind_param("i", $room_id);

        if ($st->execute()) {
            $result = $st->get_result()->fetch_assoc();

            if (count($result) > 0) {
                $response['error']          = false;
                $response['pending']        = true;
                $response['req_id']         = $result['req_id'];
                $response['rep_id']         = $result['rep_id'];
                $response['room_id']        = $result['room_id'];
                $response['custodian']      = $result['custodian'];
                $response['technician']     = $result['technician'];
                $response['date']           = $result['date'];
                $response['time']           = $result['time'];
                $response['msg']            = $result['message'];
                $response['req_status']     = $result['req_status'];
                $response['date_requested'] = $result['date_requested'];
                $response['time_requested'] = $result['time_requested'];
            } else {
                $response['pending'] = false;
                $response['error']   = false;
            }
        } else {
            $response['error']   = true;
            $response['message'] = "An error occured";
        }

        return $response;
    }

    public function saveRequestInventoryReport($rep_id, $req_id)
    {
        $st = $this->con->prepare("UPDATE request_inventory set req_status = 'Done', rep_id = ? where req_id = ?");
        $st->bind_param("ii", $rep_id, $req_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }
    }

    public function saveRequestRepairReport($rep_id, $req_id)
    {
        $st = $this->con->prepare("UPDATE request_repair set req_status = 'Done', rep_id = ? where req_id = ?");
        $st->bind_param("ii", $rep_id, $req_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }
    }

    public function savePeripheralRequest($room_id, $purpose, $designation)
    {
        require_once 'include/cict_db_room_functions.php';
        $room = new cict_db_room_functions();

        date_default_timezone_set('Asia/Manila');
        $date_req     = date('Y-m-d');
        $room_details = $room->getRoomDetails($room_id);
        $dept_id      = $room_details['dept_id'];
        $tech_id      = $room_details['room_technician_id'];
        $cust_id      = $room_details['room_custodian_id'];

        $st = $this->con->prepare("INSERT INTO request_peripherals VALUES (NULL, ?,?,?,?,?,NULL,'Pending',?)");
        $st->bind_param("sissss", $cust_id, $dept_id, $designation, $purpose, $date_req, $tech_id);
        if ($st->execute()) {
            //return id
            return $this->con->insert_id;
        } else {
            return 0;
        }
    }

    public function savePeripheralsDetails($req_id, $qty, $desc, $unit)
    {
        $st = $this->con->prepare("INSERT INTO request_peripherals_details VALUES (?,?,?,?,0)");
        $st->bind_param("iiss", $req_id, $qty, $unit, $desc);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }
    }

    public function deletePeripheralRequest($req_id)
    {
        $st = $this->con->prepare("DELETE FROM request_peripherals WHERE req_id = ?");
        $st->bind_param("i", $req_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }

    }
    public function deletePeripheralDetails($req_id)
    {
        $st = $this->con->prepare("DELETE FROM request_peripherals_details WHERE req_id = ?");
        $st->bind_param("i", $req_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }

    }

    public function getPeripheralRequests()
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * FROM request_peripherals ORDER BY date_requested DESC");

        $st->bind_result($req_id, $cust_id, $dept_id, $designation, $purpose, $date_req, $date_approved, $req_status, $tech_id);
        $st->execute();

        while ($st->fetch()) {
            $temp                  = array();
            $temp['req_id']        = $req_id;
            $temp['cust_id']       = $cust_id;
            $temp['dept_id']       = $dept_id;
            $temp['designation']   = $designation;
            $temp['purpose']       = $purpose;
            $temp['date_req']      = $date_req;
            $temp['date_approved'] = $date_approved;
            $temp['req_status']    = $req_status;
            $temp['tech_id']       = $tech_id;

            array_push($response, $temp);
        }

        //get further details
        for ($i = 0; $i < count($response); $i++) {
            $id = $response[$i]{'req_id'};

            //tech details
            require_once 'include/cict_db_users_functions.php';
            $users        = new cict_db_users_functions();
            $tech_details = $users->getUserInfo($response[$i]{'tech_id'});
            //name
            $tech_name = $tech_details['name'];
            //save to response
            $response[$i]{'tech_name'} = $tech_name;

            //room details = department and room name
            list($cust_name, $room_name) = explode("/", $response[$i]{'designation'});
            $response[$i]{'cust_name'}   = $cust_name;
            $response[$i]{'room_name'}   = $room_name;
        }

        return $response;
    }

    public function getPeripheralDetails($req_id)
    {
        $st = $this->con->prepare("SELECT * FROM request_peripherals_details WHERE req_id = ?");
        $st->bind_param("i", $req_id);  
        $st->bind_result($req_id, $qty, $unit, $desc, $qty_issued);
        $st->execute();
        $response = array();

        while ($st->fetch()) {
            $temp = array();    

            $temp['req_id']     = $req_id;
            $temp['qty']        = $qty;
            $temp['unit']       = $unit;
            $temp['desc']       = $desc;
            $temp['qty_issued'] = $qty_issued;

            array_push($response, $temp);
        }

        return $response;
    }
}
