<?php
session_start();

$url = parseURL();
$group = 'home';
$file = 'index';

if (isset($url[0])) {
    $group = $url[0];
}

if (isset($url[1])) {
    $file = $url[1];
}

require_once '../views/templates/header.php';

if(!in_array($group . '.' . $file ,$config['no_auth'])){
    if(!isset($_SESSION['is_login'])){
        header("Location:" . base_url . "/auth/login");
        exit;
    }
    require_once '../views/templates/menu.php';
}

require_once '../views/' . $group . '/' . $file . '.php';

require_once '../views/templates/footer.php';
