<?php
	include '../app/config/config.php';
	include '../app/config/variabel.php';
	$sqlHapusUser=mysqli_query($koneksi,"DELETE FROM pembina") or die(mysqli_error($koneksi));
	
	echo '<script>alert("Semua data berhasil dihapus!")</script>';
	header("Location:" . base_url . "/pembina");
?>