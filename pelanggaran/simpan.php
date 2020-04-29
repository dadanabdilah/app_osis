<?php
    session_start();
    include('../app/config/config.php');
    include('../app/config/variabel.php');
    // menyimpan data kedalam variabel
    date_default_timezone_set('Asia/Jakarta');
    $tanggal    = date("Y-m-d H:i:s");
    $nispel     = $_POST['nisPelanggar'];
    $gtanggal   = $_POST['tanggalMelanggar'];
    $poin_pel  = $_POST['poinPelanggaran'];

    // query SQL untuk insert data
    $query="INSERT INTO pelanggaran VALUES(null,'$tanggal','". $_SESSION['nama_pengurus'] ."',
    '$nispel','$gtanggal','$poin_pel')";
    mysqli_query($koneksi, $query) or die(mysqli_error($koneksi)); 
    //mengalihkan ke halaman index.php
    echo '<script>alert("Data Berhasil Disimpan!")</script>';
    header("Location:" . base_url . "/pelanggaran");
    //echo '<meta http-equiv="refresh" content="0;url=">';
?>