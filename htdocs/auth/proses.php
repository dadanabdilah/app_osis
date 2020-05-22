<?php
$nis = $_POST['nis'];
$pass = md5($_POST['password']);

$result = mysqli_query($koneksi, "SELECT * FROM `user` WHERE RIGHT(autentikasi,7)='$nis'");
//$data=mysqli_query($result,MYSQLI_ASSOC));

if ($data = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    if ($data['password'] == $pass) {
        if ($data['is_active']) {
            $_SESSION['nis'] = $data['autentikasi'];
            $_SESSION['nama_pengurus'] = $data['nama_user'];
            $_SESSION['level'] = $data['id_level'];
            $_SESSION['is_login'] = true;
            set_pesan('Selamat datang ' . $data['nama_user']);
            redirect(base_url . '/home');
        } else {
            set_pesan('Akun non aktif!');
            redirect(base_url . '/auth/login');
        }
    } else {
        set_pesan('Login password salah!');
        redirect(base_url . '/auth/login');
    }
} else {
    set_pesan('Akun anda tidak terdaftar');
    redirect(base_url . '/auth/login');
}
