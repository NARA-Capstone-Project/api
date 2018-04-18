<?php

require_once 'include/cict_db_users_functions.php';
$db_user = new cict_db_users_functions();

echo json_encode($db_user->getUserInfo($_POST['user_id']));
?>