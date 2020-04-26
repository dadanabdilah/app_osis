<?php
	include('../app/config.php');
	$nip=$_GET['nip'];
	
	$sqlHapusUser=mysqli_query($koneksi,"DELETE FROM pembina WHERE nip='$nip'") or die(mysqli_error($koneksi));
	
	header("Location:http://localhost/ngacakan/pembina");
?>