<?php
	
	require_once 'include/cict_db_request_functions.php';
	$db_req = new cict_db_request_functions();

	echo json_encode($db_req->getRequestInventory());
?>

<!-- sync  = sync sya sa mysql
toggle = 0 kapag hindi pa nagagalaw

set lahat ng col toggle as 0

SQLITE TO MYSQL
function
	select lahat ng column sync na 0
		set sync == 1 and toggle to 1

	pag tapos na anther function

MYSQL TO SQLITE
function
	get lahat ng data from server
		select lahat ng toggle == 0 then check id
		if meron sa sqlite 
			update
		else
			add -->



