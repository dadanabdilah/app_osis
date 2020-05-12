<?php
    SESSION_START();
    include('../app/config/config.php');
    include('../app/config/variabel.php');
    $auth=$_POST['autentikasi'];
    $nama=$_POST['nama'];
    $pass=md5($_POST['password']);

 	$query="UPDATE user SET nama_user='$nama', password='$pass' WHERE autentikasi='$auth'";
    mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));
    echo '<script>alert("User berhasil di Update!")</script>';
    header("Location:" . base_url . "/user");
?>