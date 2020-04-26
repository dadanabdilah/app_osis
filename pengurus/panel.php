<?php
	if(!isset($_SESSION['is_login'])){
		header("Location:http://localhost/osis_app/login");
		exit;
	}
?>
<h5>Halaman Pengurus</h5>