<?php
$sqlHapusUser = mysqli_query($koneksi, "DELETE FROM pengurus") or die(mysqli_error($koneksi));

set_pesan('Semua data berhasil dihapus!');
redirect(base_url . '/pengurus');
