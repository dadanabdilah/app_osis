<?php
    include('../app/config/config.php');
    include('../app/config/variabel.php');
    include('../templates/header.php');
    include('../templates/menu.php');
?>
<div class="container-fluid">
    <h2 class="text-center">Form Rekap Pelanggaran</h2>
    <h6 class="text-center">
        <?php
            date_default_timezone_set('Asia/Jakarta');
            $tanggal= date("d-m-Y");
            $jam= date("H:i:s");
            echo "Pukul $jam WIB. Tanggal $tanggal <p>";
        ?>
    </h6>
    <hr>
        <form method="POST">
            <p>Untuk menampilkan data nya, pilih kelas terlebih dahulu!</p>
                <div class="form-group row">
                    <div class="form-group col-3">
                        <select class="form-control" name="kelasPelanggar">
                            <option selected disabled>Pilih kelas</option>
                            <?php foreach(kelas as $kelas):?>
                                <option value="<?= $kelas ?>" <?= (isset($_POST['kelasPelanggar'])) ? ($_POST['kelasPelanggar'] == $kelas) ? 'selected' : '' : '' ?>><?= $kelas ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <div class="col-2"> 
                        <button type="submit" class="btn btn-info">Tampilkan</button>
                    </div>
                </div>
        </form>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th class="text-center" width=2% scope="col">No</th>
                    <th class="text-center" scope="col">NIS</th>
                    <th class="text-center" scope="col">Nama</th>
                    <th class="text-center" scope="col">Jenis Kelamin</th>
                    <th class="text-center" scope="col">Kelas</th>
                    <th class="text-center" scope="col">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if(isset($_POST['kelasPelanggar'])):
                    $kelasSiswa = $_POST['kelasPelanggar'];
                    $sql_query = mysqli_query($koneksi,"SELECT * FROM siswa WHERE kelas='$kelasSiswa' ORDER BY nama ASC");
                    $noUrut=0;
                    while($data=mysqli_fetch_array($sql_query)):
                        //membuat nomor urut
                        $noUrut++ ?>
                        <tr>
                            <td class="text-center" scope="row"><?= $noUrut ?></td>
                            <td class="text-center"><?= $data['nis'] ?></td>
                            <td class="text-center"><?= $data['nama'] ?></td>
                            <td class="text-center"><?= $data['jk'] ?></td>
                            <td class="text-center"><?= $data['kelas'] ?></td>
                            <th class="text-center">
                                <a href="<?= base_url ?>/pelanggaran/tambah?nis=<?= $data['nis'] ?>" class="btn btn-primary btn-sm">Input Poin</a>
                            </th>
                        </tr>
                    <?php endwhile ?>
                </tbody>
            </table>
        <?php endif ?>
</div>
<?php
    include('../templates/footer.php');
?>