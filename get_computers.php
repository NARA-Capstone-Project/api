<?php
require_once 'include/cict_db_comp_functions.php';
$comp = new cict_db_comp_functions();

echo json_encode($comp->getComputers());

?>