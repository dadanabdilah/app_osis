<?php
$nis = $url[0];

$sqlHapusUser = mysqli_query($koneksi, "DELETE FROM pengurus WHERE nis='$nis'") or die(mysqli_error($koneksi));

set_pesan('Data berhasil dihapus!');
redirect(base_url . '/pengurus');
