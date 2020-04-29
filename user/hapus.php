<?php
	include('../app/config/config.php');
	include('../app/config/variabel.php');
	
 	$auth=$_GET['auth'];
    $sqlHapusUser=mysqli_query($koneksi,"DELETE FROM user WHERE autentikasi='$auth'") or die(mysqli_error($koneksi));
	echo '<script>alert("Data berhasil dihapus!")</script>';
	header("Location:" . base_url . "/user");

?>