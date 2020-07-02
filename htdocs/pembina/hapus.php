<?php
$nip = $_GET['nip'];

$sqlHapusUser = mysqli_query($koneksi, "DELETE FROM pembina WHERE nip='$nip'") or die(mysqli_error($koneksi));

set_pesan('Data berhasil dihapus!');
redirect(base_url . '/pembina');
