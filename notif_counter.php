
   <?php

// $user_id = $_POST['user_id'];

require_once 'include/cict_db_connect.php';
$db  = new cict_db_connect();
$con = $db->connect();

date_default_timezone_set('Asia/Manila');
$date_today = date('Y-m-d');

$st = $con->prepare("SELECT * FROM (select count(*) as missed_inv_count, req_id from request_inventory where (custodian = $user_id OR technician = $user_id) and (req_status = 'Pending' or req_status = 'Accepted') and (DATE(NOW()) > DATE(date))) as missed");
// 
// DATE(NOW()) > DATE(date)

$st->bind_result($count, $id, $set_date);
$st->execute();
while ($st->fetch()) {
	$temp = 
}

?>