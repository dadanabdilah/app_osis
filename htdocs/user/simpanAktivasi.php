<?php
$auth = $_POST['autentikasi'];
$nama = $_POST['nama_user'];
$level = $_POST['level'];
$status = $_POST['is_active'];

$query = "UPDATE user SET id_level='$level', is_active='$status' WHERE autentikasi='$auth'";
mysqli_query($koneksi, $query) or die(mysqli_error($koneksi));

set_pesan('User berhasil diaktivasi!');
redirect(base_url . '/user');
