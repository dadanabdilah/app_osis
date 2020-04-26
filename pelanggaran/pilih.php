<?php
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
            <p class="">Untuk menampilkan data nya, pilih kelas terlebih dahulu!</p>
                <div class="form-group row ">
                    <div class="form-group col-3">
                        <select class="form-control" height=6% name="kelasPelanggar">\
                            <?= kelas;?>
                        </select>
                    </div>
                    <p>
                <button type="submit" class="btn  btn-info" name="btnTampil">Tampilkan</button></p>
            </div>
        </form>

        <form method="POST" action="tampilPDF.php">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                      <th class='text-center' width=2% scope="col">No</th>
                      <th class='text-center' scope="col">NIS</th>
                      <th class='text-center' scope="col">Nama</th>
                      <th class='text-center' scope="col">Jenis Kelamin</th>
                      <th class='text-center' scope="col">Kelas</th>
                      <th class='text-center' scope="col">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include('../app/config/config.php');
                    if(isset($_POST['btnTampil'])){
                        $kelasSiswa=$_POST['kelasPelanggar'];
                        $sql_query=mysqli_query($koneksi,"SELECT * FROM siswa WHERE kelas='$kelasSiswa' ORDER BY nama ASC");
                    ?>
                    <?php
                        $noUrut=0;
                        while($data=mysqli_fetch_array($sql_query)){
                            //membuat nomor urut
                            $noUrut++;
                            echo"
                                <tr>
                                    <td class='text-center' scope='row'>$noUrut</td>
                                    <td class='text-center'>".$data['nis']."</td>
                                    <td class='text-center'>".$data['nama']."</td>
                                    <td class='text-center'>".$data['jk']."</td>
                                    <td class='text-center'>".$data['kelas']."</td>
                                    <th class='text-center'>
                                        <a href='http://localhost/ngacakan/pelanggaran/tambah?nis=".$data['nis']."' class='btn btn-primary btn-sm'>Input Poin</a>
                                    </th>
                                </tr>"
                            ;
                        }
                    ?>
                   
                </tbody>
            </table>
        </form>
     <?php
        }//end isset
    ?>
</div>
<?php
    include('../templates/footer.php');
?>