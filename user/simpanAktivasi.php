<?php
    SESSION_START();
    include('../app/config.php');
    $auth=$_POST['autentikasi'];
    $nama=$_POST['nama_user'];
    $level=$_POST['level'];
    $status=$_POST['is_active'];

    $query="UPDATE user SET id_level='$level', is_active='$status' WHERE autentikasi='$auth'";
    mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));
    echo '<script>alert("User berhasil diaktivasi!")</script>';
    header("Location:http://localhost/ngacakan/user");
?>?>