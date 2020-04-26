<?php
	include '../app/config.php';
	$sqlHapusUser=mysqli_query($koneksi,"DELETE FROM pembina") or die(mysqli_error($koneksi));
	
	echo '<script>alert("Semua data berhasil dihapus!")</script>';
	header("Location:http://localhost/ngacakan/pembina");
?>