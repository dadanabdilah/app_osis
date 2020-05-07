<?php
    // konfigurasi database
    $host       =   "localhost";
    $user       =   "root";
    $password   =   "123";
    $database   =   "app_osis";
    // perintah php untuk akses ke database
    $koneksi = mysqli_connect($host, $user, $password, $database)or die("Gagal koneksi ke database");
?>