<?php
	if(!isset($_SESSION['is_login'])){
		header("Location:http://localhost/ngacakan/login.php");
		exit;
	}
?>
<h5>Halaman Admin</h5>