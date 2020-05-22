<div class="container-fluid">
    <h3 class="text-center">DATA PELANGGARAN HARI INI </br>
        <?php
        date_default_timezone_set('Asia/Jakarta');
        $tanggal = date("d/M/Y");
        echo "Tanggal $tanggal <p>";
        ?>
    </h3>
    <div class="row">
        <div class="col-2">
            <a href="<?= base_url ?>/pelanggaran/pilih" class="btn btn-primary btn-sm mb-2">Input Pelanggar</a>
        </div>
    </div>
    <?= tampil_pesan() ?>
    <?php /* ^^ Silahkan modifikasi tampilannya menggunakan bootstrap */ ?>
    <table id="tableExport" class="table table-hover table-striped">
        <thead>
            <tr>
                <th class='text-center' scope="col" width=1%>No.</th>
                <th class='text-center' scope="col">Tanggal Input</th>
                <th class='text-center' scope="col">Nama Pengurus</th>
                <th class='text-center' scope="col">Nama Pelanggar</th>
                <th class='text-center' scope="col">Jenis Kelamin</th>
                <th class='text-center' scope="col">Kelas</th>
                <th class='text-center' scope="col">Tanggal Melanggar</th>
                <th class='text-center' scope="col" width=2%>Poin</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $TglHariIni = date('Y-m-d');
            $sql_query = mysqli_query($koneksi, "SELECT `siswa`.`nama`,`siswa`.`jk`,`siswa`.`kelas`,
                    `pelanggaran`.`input_at`,`pelanggaran`.`nama_pengurus`,`pelanggaran`.`nis_pelanggar`,
                    `pelanggaran`.`tanggal_melanggar`,`pelanggaran`.`poin_pelanggaran`
                    FROM `pelanggaran`
                    JOIN `siswa` ON  `nis_pelanggar` = `siswa`.`nis`
                    WHERE `input_at`
                    LIKE '$TglHariIni%' 
                    ORDER BY `input_at` ASC") or die(mysqli_error($koneksi));
            ?>
            <?php
            $noUrut = 0;
            while ($data = mysqli_fetch_array($sql_query)) : ?>
                <tr>
                    <td class='text-center'><?= ++$noUrut ?></td>
                    <td class='text-center'><?= $data['input_at'] ?></td>
                    <td class='text-center'><?= $data['nama_pengurus'] ?></td>
                    <td class='text-center'><?= $data['nama'] ?></td>
                    <td class='text-center'><?= $data['jk'] ?></td>
                    <td class='text-center'><?= $data['kelas'] ?></td>
                    <td class='text-center'><?= $data['tanggal_melanggar'] ?></td>
                    <td class='text-center'><?= $data['poin_pelanggaran'] ?></td>
                </tr>
            <?php endwhile ?>
        </tbody>
    </table>
</div>