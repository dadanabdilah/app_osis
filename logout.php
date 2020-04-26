<?php
    //memulai session
    session_start();

    //membuaang session
    session_destroy();
    
    //mengarahkan ke index.php
    header('location:index.php');
?>