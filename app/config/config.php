<?php
    // konfigurasi database
    $host       =   "localhost";
    $user       =   "root";
    $password   =   "";
    $database   =   "app_osis";
    // perintah php untuk akses ke database
    $koneksi = mysqli_connect($host, $user, $password, $database);
    
    if($koneksi->connect_error){
        die("Koneksi gagal");
    }

?>