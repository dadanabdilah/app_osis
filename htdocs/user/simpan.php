<?php
$auth = $_POST['auth'];
$nama = $_POST['namaUser'];
$pass = md5($_POST['password']);

$query = "INSERT INTO user SET autentikasi='$auth',nama='$nama',password='$pass'";
mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));
set_pesan('User berhasil ditambahkan');
redirect(base_url . '/user');
