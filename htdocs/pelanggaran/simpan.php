<?php
// menyimpan data kedalam variabel
date_default_timezone_set('Asia/Jakarta');
$tanggal    = date("Y-m-d H:i:s");
$nispel     = $_POST['nisPelanggar'];
$gtanggal   = $_POST['tanggalMelanggar'];
$poin_pel  = $_POST['poinPelanggaran'];
$nama_pengurus = $_SESSION['nama_pengurus'];

// query SQL untuk insert data
$query = "INSERT INTO pelanggaran VALUES(null,'$tanggal','$nama_pengurus',
    '$nispel','$gtanggal','$poin_pel')";
mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));

//mengalihkan ke halaman index.php
set_pesan('Data berhasil disimpan!');
redirect(base_url . '/pelanggaran');
