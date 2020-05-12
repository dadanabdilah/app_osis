<?php
  include('../app/config/config.php');
  include('../app/config/variabel.php');
	include('../templates/header.php');
	include('../templates/menu.php')
?>
<div class="container-fluid">
	<h3 class="text-center">DATA KEPENGURUSAN</h3>
    <h3 class="text-center">OSIS SMK NEGERI 2 KUNINGAN</h3>
    <h3 class="text-center"><?= tahun_ajaran ?></h3>
    <p class="mt-5">
      <button type="button" class="btn btn-primary btn-sm mb-2 float-right" data-toggle="modal" data-target="#pengurusTambahModal">Tambah</button>
      <a href="hapusAll.php"class="btn btn-danger btn-sm mb-2 float-right mr-2">Hapus Semua</a>
    </p>
    <table class="table table-hover table-striped">
        <thead class="text-center">
            <tr>
                <th width=1%>No.</th>
                <th>NIS</th>
                <th>Nama</th>
                <th>Jenis Kelamin</th>
                <th>Jabatan</th>
                <th>Kelas</th>
                <th width=8%>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql_query=mysqli_query($koneksi,"SELECT `jabatan`.`nama_jabatan`,
                                             `pengurus`.`nis`,`pengurus`.`nama`,`pengurus`.`jk`,`pengurus`.`id_jabatan`,`pengurus`.`kelas`
                                              FROM `pengurus`
                                              JOIN `jabatan` ON id_jabatan = `jabatan`.`id`
                                              ORDER BY id_jabatan ASC") or die(mysqli_error($koneksi));
                $noUrut=0;
                while($data=mysqli_fetch_array($sql_query)){
                    //membuat nomor urut
                    $noUrut++;
                    echo'<tr>';
                        echo '<td align="center">'.$noUrut.'</td>';
                        echo '<td align="center">'.$data['nis'].'</td>';
                        echo '<td align="center">'.$data['nama'].'</td>';
                        echo '<td align="center">'.$data['jk'].'</td>';
                        echo '<td align="center">'.$data['nama_jabatan'].'</td>';
                        echo '<td align="center">'.$data['kelas'].'</td>';
                        echo '<th class="text-center">';
                            echo'<a href="hapus?nis='.$data['nis'].'"class="badge badge-danger mr-1">Hapus</a>';
                        echo '</th>';
                    echo '</tr>';
                }
            ?>
        </tbody>
    </table>
<?php
	include('../templates/footer.php');
?>
<!-- Modal -->
<div class="modal fade" id="pengurusTambahModal" tabindex="-1" role="dialog" aria-labelledby="pengurusTambahModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pengurusTambahModalLabel">Tambah Data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" action="simpan.php">
            <p class="">NIS</br>
                <div class="form-group">
                    <input type="text" class="form-control" name="TxtNis" size="30" placeholder="NIS Pengurus"/>
                </div>
            </p>
            
            <p class="">Nama</br>
                <div class="form-group">
                    <input type="text" class="form-control" name="TxtNama" size="30" placeholder="Nama Pengurus"/>
                </div>
            </p>

            <p>Jenis Kelamin</br>
                <input type="radio" value="L" checked name="TxtJenisKelamin">Laki-Laki
                <input type="radio" value="P" name="TxtJenisKelamin">Perempuan
            </p>
            
            <div class="form-group">
                <label for="exampleFormControlSelect1">Jabatan</label>
                <select class="form-control"name="TxtJabatan">
                  <option selected disabled>Jabatan</option>
                  <?php foreach(jabatan as $jabatan): ?>
                    <option value="<?= str_replace('Sekbid ','', $jabatan) ?>"><?= $jabatan ?></option>
                  <?php endforeach ?>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Kelas</label>
                <select class="form-control"name="TxtKelas">
                  <option selected disabled>Pilih Kelas</option>
                    <?php foreach(kelas as $kelas):?>
                      <option value="<?= $kelas ?>"><?= $kelas ?></option>
                    <?php endforeach ?>
                </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Simpan</button>
          </div>
      </form>
    </div>
  </div>
</div>