<?php
    SESSION_START();
    include('app/config/config.php');
    $nis=$_POST['nis'];
    $pass=md5($_POST['password']);

    $result = mysqli_query($koneksi, "SELECT * FROM `user` WHERE RIGHT(autentikasi,7)='$nis'");
    //$data=mysqli_query($result,MYSQLI_ASSOC));
    
    if($data = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        if($data['password'] == $pass){
            if($data['is_active']){
                    $_SESSION['nis'] = $data['autentikasi'];
                    $_SESSION['nama_pengurus'] = $data['nama_user'];
                    $_SESSION['level'] = $data['id_level'];
                    $_SESSION['is_login'] = true;
                    echo '<script>alert("Selamat datang '.$data['nama_user'].'")</script>';
                    echo '<meta http-equiv="refresh" content="0;url=index.php">';
            }else {
                echo '<script>alert("Akun non aktif!")</script>';
                echo '<meta http-equiv="refresh" content="0;url=login.php">';
            }
        }else{
            echo '<script>alert("Login password salah!")</script>';
            echo '<meta http-equiv="refresh" content="0;url=login.php">';
        }
    }else{
        echo '<script>alert("Akun kamu tidak terdaftar!")</script>';
        echo '<meta http-equiv="refresh" content="0;url=login.php">';
    }
?>
