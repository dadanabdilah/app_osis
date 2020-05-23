<?php
$auth = $url[0];
$sql_query = mysqli_query($koneksi, "SELECT * FROM user WHERE autentikasi='$auth'");
$dataUser = mysqli_fetch_array($sql_query, MYSQLI_ASSOC);
?>
<div class="container-fluid">
	<h2 class="text-center">User Aktivasi</h2>
	<hr>
	<form method="POST" action="<?= base_url ?>/user/simpanAktivasi">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<p>Pilih level dan status untuk aktivasi user!</p>
				<div class="form-group">
					<label>Autentikasi</label>
					<input type="text" class="form-control" value="<?= $dataUser['autentikasi']; ?>" name="autentikasi" readonly />
				</div>
				<div class="form-group">
					<label>Nama User</label>
					<input type="text" class="form-control" value="<?= $dataUser['nama_user']; ?>" name="nama_user" autocomplete="off" readonly />
				</div>
				<div class="form-group mt-4">
					<label>Level User</label>
					<div>
						<input type="radio" value="UL001" name="level">Admin
						<input type="radio" value="UL002" name="level">Pengurus
					</div>
				</div>
				<div class="form-group mt-4">
					<label>Status Akun</label>
					<div>
						<input type="radio" value="1" name="is_active" <?= ($dataUser['is_active']) ? 'checked' : '' ?>>Aktif
						<input type="radio" value="0" name="is_active" <?= (!$dataUser['is_active']) ? 'checked' : '' ?>>Non Aktif
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-danger">Simpan</button>
				</div>
			</div>
		</div>
	</form>
</div>