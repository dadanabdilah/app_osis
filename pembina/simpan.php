<?php
    include('../app/config/config.php');
    include('../app/config/variabel.php');
    // menyimpan data kedalam variabel
    date_default_timezone_set('Asia/Jakarta');
    $nip   = $_POST['nip'];
    $nama  = $_POST['nama'];
    $jk    = $_POST['jk'];
    $jabatan   = 'J001';
	
    // query SQL untuk insert data
    $query="INSERT INTO pembina SET nip='$nip',nama='$nama',jk='$jk',jabatan='$jabatan',kelas='$kelas'";
    mysqli_query($koneksi, $query) or die(mysqli_error($koneksi)); 
    //mengalihkan ke halaman index.php
    echo '<script>alert("Data Berhasil Disimpan!")</script>';
    header("Location:" . base_url . "/pembina");
?>