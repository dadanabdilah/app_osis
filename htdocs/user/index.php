<div class="container-fluid">
    <div class="row justify-content-center mb-5">
        <h3 class="text-center">DATA USER</h3>
    </div>
    <P>Untuk user yang status nya Non Aktif artinya user tersebut tidak bisa login ke aplikasi ini. Dan user yang status nya aktif artinya user tersebut bisa login aplikasi ini. <button type="button" class="btn btn-primary btn-sm mb-2 float-right" data-toggle="modal" data-target="#userTambahModal">Tambah</button></P>
    <p><?= tampil_pesan() ?></p>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th class='text-center' scope="col" width=1%>No.</th>
                <th class='text-center' scope="col">Email</th>
                <th class='text-center' scope="col">Nama User</th>
                <th class='text-center' scope="col">Level User</th>
                <th class='text-center' scope="col">Status Akun</th>
                <th class='text-center' scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql_query = mysqli_query($koneksi, "SELECT `user`.*, `user_level`.`level`
                                                  FROM `user`
                                                  JOIN `user_level` ON `id_level` = `user_level`.`id`");
            $noUrut = 0;
            while ($data = mysqli_fetch_array($sql_query, MYSQLI_ASSOC)) : ?>
                <tr>
                    <td align="center"><?= ++$noUrut ?></td>
                    <td align="center"><?= $data['autentikasi'] ?></td>
                    <td align="center"><?= $data['nama_user'] ?></td>
                    <td align="center"><?= $data['level'] ?></td>
                    <td align="center">
                        <?php // cek status
                        if ($data['is_active'] == '1') : ?>
                            <div class="font-weight-bold text-success">Aktif.</div>
                        <?php else : ?>
                            <div class="font-weight-bold text-danger">Non Aktif.</div>
                        <?php endif ?>
                    </td>
                    <th class="text-center">
                        <a href="<?= base_url ?>/user/aktivasi/<?= $data['autentikasi'] ?>" class="badge badge-success">Aktivasi</a>
                        <a href="<?= base_url ?>/user/update/<?= $data['autentikasi'] ?>" class="badge badge-primary">Update</a>
                        <a href="<?= base_url ?>/user/hapus/<?= $data['autentikasi'] ?>" class="badge badge-danger">Hapus</a>
                    </th>
                </tr>
            <?php endwhile ?>
        </tbody>
    </table>
</div>
<div class="modal fade" id="userTambahModal" tabindex="-1" role="dialog" aria-labelledby="userTambahModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userTambahModalLabel">Tambah Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="<?= base_url ?>/user/simpan">
                    <p class="">Autentikasi :</br>
                        <div class="form-group">
                            <input type="text" class="form-control" name="auth" id="autentikasi" size="30" placeholder="Autentikasi" />
                        </div>
                    </p>

                    <p class="">Nama User :</br>
                        <div class="form-group">
                            <input type="text" class="form-control" name="namaUser" id="namaUser" size="30" placeholder="Nama User" />
                        </div>
                    </p>

                    <p class="">Password :</br>
                        <div class="form-group">
                            <input type="text" class="form-control" name="password" id="password" size="30" placeholder="Password" />
                        </div>
                    </p>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Kelas :</label>
                        <select class="form-control" name="TxtKelas">
                            <option selected disabled>Pilih Kelas</option>
                            <?php foreach (kelas as $kelas) : ?>
                                <option value="<?= $kelas ?>"><?= $kelas ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>