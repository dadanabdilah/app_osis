<?php
    include('../app/config/config.php');
    include('../app/config/variabel.php');
    //query tambahan WHERE `kelas`='$kelasPelanggar' AND month(tanggal_melanggar)='$bulanMelanggar' AND year(tanggal_melanggar)='$tahunMelanggar'
    $sql_query=mysqli_query($koneksi,"SELECT `siswa`.`nama`,`siswa`.`jk`,`siswa`.`kelas`,
                    `pelanggaran`.`input_at`,`pelanggaran`.`nama_pengurus`,`pelanggaran`.`nis_pelanggar`,
                    `pelanggaran`.`tanggal_melanggar`,`pelanggaran`.`poin_pelanggaran`
                    FROM `pelanggaran`
                    JOIN `siswa` ON  `nis_pelanggar` = `siswa`.`nis`
                    ORDER BY `nama` ASC") or die(mysqli_error($koneksi));
	include('../templates/header.php');
	include('../templates/menu.php');
?>

<div class="container-fluid">
	<h3 class="text-center">DATA PELANGGARAN SISWA</h3>
    <h3 class="text-center">SMK NEGERI 2 KUNINGAN</h3>
        <div class="row mt-5">
            <div class="col">
                <!--a class="btn btn-primary btn-sm mb-2 ml-2 text-white float-right" id="tombolExport" target="blank">Export EXCEL</a-->
                <button type="button" class="btn btn-primary btn-sm mb-2 float-right" data-toggle="modal" data-target="#laporanTampilModal">Export PDF</button>
            </div>
        </div>
        <table id="tabel_export" class="table table-hover table-striped">
            <thead>
                <tr>
                    <th class='text-center' scope="col" width=1%>No.</th>
                    <th class='text-center' scope="col">Nama Pelanggar</th>
                    <th class='text-center' scope="col">Jenis Kelamin</th>
                    <th class='text-center' scope="col">Tanggal Melanggar</th>
                    <th class='text-center' scope="col">Kelas</th>
                    <th class='text-center' scope="col">Poin</th>
                </tr>
                
            </thead>
            <tbody>
                <?php
                    $noUrut=0;
                    while($data=mysqli_fetch_array($sql_query)){
                        //membuat nomor urut
                        $noUrut++;
                        echo"<tr>
                                <td class='text-center'>$noUrut</td>
                                <td class='text-center'>".$data['nama']."</td>
                                <td class='text-center'>".$data['jk']."</td>
                                <td class='text-center'>".$data['tanggal_melanggar']."</td>
                                <td class='text-center'>".$data['kelas']."</td>
                                <td class='text-center'>".$data['poin_pelanggaran']."</td>
                            </tr>"
                        ;
                    }
                ?>
                
            </tbody>
        </table>
	</div>
<?php
	include('../templates/footer.php');
?>
<!--Modal Tampil Data-->
<div class="modal fade" id="laporanTampilModal" tabindex="-1" role="dialog" aria-labelledby="laporanTampilModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="laporanTampilModalLabel">Export Data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" target="blank" action="<?= base_url ?>/laporan/print.php">
            <p class="text">Silahkan pilih kelas bulan dan tahun!</p>
                <div class="form-group row ">
                    <div class="form-group col-3">
                        <select class="form-control" height=6% name="kelas">
                            <option selected disabled>Pilih Kelas</option>
                            <?php foreach(kelas as $kelas): ?>
                                <option value="<?= $kelas ?>"><?= $kelas ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <select class="form-control" name="bulan">
                            <option selected disabled>Bulan</option>
                                <?php
                                    for($awal=1; $awal<=12; $awal++){
                                        if($awal<=9){
                                            echo '<option value="0'.$awal.'">0'.$awal.'</option>';
                                        }else{
                                            echo '<option value="'.$awal.'">'.$awal.'</option>';
                                        }
                                    }
                                ?>
                        </select>
                    </div>

                    <div class="form-group col-3">
                        <select class="form-control" name="tahun">
                            <option selected disabled>Tahun</option>
                            <?php
                                for($awal=2020; $awal>=2015; $awal--){
                                    if($awal<=9){
                                        echo '<option value="0'.$awal.'">0'.$awal.'</option>';
                                    }else{
                                        echo '<option value="'.$awal.'">'.$awal.'</option>';
                                    }
                                }
                            ?>
                        </select>
                    </div>
                    <p>
                <button type="submit" class="btn  btn-info">Export</button></p>
            </div>
        </form>
    </div>
  </div>
</div>

