<?php
	include('../app/config/config.php');
	include('../app/config/variabel.php');
	include('../templates/header.php');
	include('../templates/menu.php')
?>
<div class="container-fluid">
	<h3 class="text-center">DATA PEMBINA OSIS</h3>
    <h3 class="text-center">SMK NEGERI 2 KUNINGAN</h3>
    <h3 class="text-center">TAHUN <?= date('Y');?></h3>
    <p class="mt-5">
      <button type="button" class="btn btn-primary btn-sm mb-2 float-right" data-toggle="modal" data-target="#pembinaTambahModal">Tambah</button>
      <a href="<?= base_url ?>/pembina/hapusAll.php"class="btn btn-danger btn-sm mb-2 float-right mr-2">Hapus Semua</a>
    </p>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th class="text-center" scope="col" width=1% width=1%>No.</th>
                <th class="text-center" scope="col">NIP</th>
                <th class="text-center" scope="col">Nama</th>
                <th class="text-center" scope="col" width=15%>Jenis Kelamin</th>
                <th class="text-center" width=10%>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql_query=mysqli_query($koneksi,"SELECT * FROM pembina ORDER BY nama ASC");
                $noUrut=0;
                while($data=mysqli_fetch_array($sql_query)){
                    //membuat nomor urut
                    $noUrut++;
                    echo'<tr>';
                        echo '<td align="center">'.$noUrut.'</td>';
                        echo '<td align="center">'.$data['nip'].'</td>';
                        echo '<td align="center">'.$data['nama'].'</td>';
                        echo '<td align="center">'.$data['jk'].'</td>';
                        echo '<th class="text-center">';
                            echo'<a href="update?nip='.$data['nip'].'" class="badge badge-primary mr-1">Update</a>';
                            echo'<a href="hapus?nip='.$data['nip'].'" class="badge badge-danger">Hapus</a>';
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
<div class="modal fade" id="pembinaTambahModal" tabindex="-1" role="dialog" aria-labelledby="pembinaTambahModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pembinaTambahModalLabel">Tambah Data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="POST" action="simpan.php">
            <p class="">NIP</br>
                <div class="form-group">
                    <input type="text" class="form-control" name="nip" size="30" placeholder="NIP"/>
                </div>
            </p>
            
            <p class="">Nama</br>
                <div class="form-group">
                    <input type="text" class="form-control" name="nama" size="30" placeholder="Nama Lengkap"/>
                </div>
            </p>

            <p>Jenis Kelamin</br>
                <input type="radio" value="L" checked name="jk">Laki-Laki
                <input type="radio" value="P" name="jk">Perempuan
            </p>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Simpan</button>
          </div>
      </form>
    </div>
  </div>
</div>