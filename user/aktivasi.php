<?php
	include('../app/config/config.php');
	include('../app/config/variabel.php');
    $auth=$_GET['auth'];
    $sql_query=mysqli_query($koneksi,"SELECT * FROM user WHERE autentikasi='$auth'");
    $dataUser=mysqli_fetch_array($sql_query, MYSQLI_ASSOC);

    include('../templates/header.php');
    include('../templates/menu.php');
?>

<div class="container-fluid">
	<h2 class="text-center">User Aktivasi</h2>
	<hr>
    <form method="POST" action="simpanAktivasi.php">
		<div class="row justify-content-center">
			<div class="col-lg-8">
			<p>Pilih level dan status untuk aktivasi user!</p>
				<div class="form-group">
					<label>Autentikasi</label>
					<input type="text" class="form-control" value="<?php echo $dataUser['autentikasi'];?>" name="autentikasi" readonly/>
				</div>
				<div class="form-group">
					<label>Nama User</label>
					<input type="text" class="form-control" value="<?php echo $dataUser['nama_user'];?>" name="nama_user" autocomplete="off" readonly/>
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
						<input type="radio" value="1" name="is_active">Aktif
						<input type="radio" value="0" name="is_active">Non Aktif
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-danger">Simpan</button>
				</div>
			</div>
		</div>
	</form>
</div>
<?php
    include('../templates/footer.php');
?>