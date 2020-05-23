<?php
$auth = $_GET['auth'];
$sqlHapusUser = mysqli_query($koneksi, "DELETE FROM user WHERE autentikasi='$auth'") or die(mysqli_error($koneksi));
set_pesan('Data berhasil dihapus!');
redirect(base_url . '/user');
