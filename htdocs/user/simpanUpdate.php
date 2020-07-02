<?php
$auth = $_POST['autentikasi'];
$nama = $_POST['nama'];
$pass = md5($_POST['password']);

$query = "UPDATE user SET nama_user='$nama', password='$pass' WHERE autentikasi='$auth'";
mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));
set_pesan('User berhasil di Update!');
redirect(base_url . '/user');
