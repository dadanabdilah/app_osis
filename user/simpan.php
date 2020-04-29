<?php
    SESSION_START();
    include('../app/config/config.php');
    include('../app/config/config.php');
    $auth=$_POST['autentikasi'];
    $nama=$_POST['namaUser'];
    $pass=md5($_POST['password']);

    $query="INSERT INTO user SET autentikasi='$auth',nama='$nama',password='$pass'";
    mysqli_query($koneksi, $query);
    echo '<script>alert("User berhasil ditambahkan!")</script>';
    header("Location:" . base_url . "/user");
?>