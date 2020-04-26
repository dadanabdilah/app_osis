<?php
	include('../templates/header.php');
	include('../templates/menu.php');
?>
<div class="container-fluid">
    <h2 class="text-center">Form Rekap Pelanggaran</h2>
    <h6 class="text-center">
        <?php
            date_default_timezone_set('Asia/Jakarta');
            $tanggal= date("d-m-Y");$jam= date("H:i:s");
            echo "Pukul $jam WIB. Tanggal $tanggal <label>";
        ?>
    </h6>
    <hr>
    <p class="text-center">Masukan data pelanggaran dengan benar!</p>
    <div class="row justify-content-center ml-2 mr-2">
        <div class="col-lg-6">
        	<?php
				$nis=$_GET['nis'];
			    include('../app/config/config.php');
			    $result=mysqli_query($koneksi,"SELECT * FROM siswa WHERE nis='$nis'");
			    $data=mysqli_fetch_array($result, MYSQLI_ASSOC);
			    $data_jenis_planggaran = mysqli_query($koneksi, "SELECT * FROM jenis_pelanggaran");
			?>
            <form method="POST" action="simpan.php">
                <p class="">NIS Siswa Yang Melanggar Adalah :</br>
                    <div class="form-group">
                        <input type="text" class="form-control" name="nisPelanggar" id="nisPelanggar" value="<?php echo $data['nis'];?>" size="30" readonly/>
                    </div>
                </p>
                
                <p class="">Nama Siswa Tersebut Adalah :</br>
                    <div class="form-group">
                        <input type="text" class="form-control" name="namaPelanggar" id="namaPelanggar" value="<?php echo $data['nama'];?>" size="30" readonly/>
                    </div>
                </p>
                
                <p class="">Jenis Kelamin Nya Adalah :</br>
                    <div class="form-group">
                        <input type="text" class="form-control" name="jenisKelamin" id="namaPelanggar" value="<?php echo $data['jk'];?>" size="30" readonly/>
                    </div>
                </p>

                <p class="">Kelas Siswa Tersebut Adalah :</br>
                    <div class="form-group">
                        <input type="text" class="form-control" name="kelasPelanggar" id="kelasPelanggar" value="<?php echo $data['kelas'];?>" size="30" readonly/>
                    </div>
                </p>

                <p class="">Tanggal Siswa Tersebut Melanggar :</br>
                    <div class="form-group">
                        <input type="date" class="form-control" name="tanggalMelanggar" id="tanggalMelanggar" size="30" placeholder="Nama Pelanggar"/>
                    </div>
                </p>
                
                <p class="">Poin Pelanggaran :</br>
                    <div class="form-group">
                        <input type="text" class="form-control" name="poinPelanggaran" id="poinPelanggaran" size="30" placeholder="Poin Pelanggaran"/>
                    </div>
                </p>

                <div class="form-group text-center">
                    <button type="submit" class="btn btn-info" name="tmblSimpan" id="tmblSimpan">SIMPAN</button>
                </div>
            
            </form>
        </div>
    </div>
</div>
<?php
	include('../templates/footer.php');
?>