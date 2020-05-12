<?php
	include ('../app/config/config.php');
	include ('../app/config/variabel.php');
	$nis=$_GET['nis'];

	$sqlHapusUser=mysqli_query($koneksi,"DELETE FROM pengurus WHERE nis='$nis'") or die(mysqli_error($koneksi));
	
	echo '<script>alert("Data berhasil dihapus!")</script>';
	header("Location:" . base_url . "/pengurus");
?>