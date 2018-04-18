<?php
require_once 'include/cict_db_report_functions.php';
$rep = new cict_db_report_functions();

echo json_encode($rep->getInventoryDetailsWithId($_POST['rep_id']));

?>