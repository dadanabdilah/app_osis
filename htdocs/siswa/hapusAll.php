<?php
$sqlHapusUser = mysqli_query($koneksi, "DELETE FROM siswa") or die(mysqli_error($koneksi));

set_pesan('Semua data berhasil dihapus!');
redirect(base_url . '/siswa');
