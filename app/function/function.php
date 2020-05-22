<?php

/**Mengecek Apakah User sudah login */
function is_auth($config, $path)
{
    return in_array($path, $config['no_auth']) || isset($_SESSION['is_login']);
}

function redirect($url)
{
    header("Location:$url");
    exit;
}

/**Apakah halaman yang diakses adalah proses */
function is_process($config, $path)
{
    return in_array($path, $config['process']);
}

/**Apakah halaman yang diakses membutuhkan menu */
function no_menu($config, $path)
{
    return in_array($path, $config['no_menu']);
}

function parseURL()
{
    if (isset($_GET['module'])) {
        $url = rtrim($_GET['module'], '/');
        $url = filter_var($url, FILTER_SANITIZE_URL);
        $url = explode('/', $url);
        return $url;
    }
}

function cleanURL($url)
{
    unset($url[0]);
    unset($url[1]);

    return array_values($url);
}

/** Set pesan flasher */
function set_pesan(String $pesan)
{
    $_SESSION['pesan'] = $pesan;
}

/** Tampil pesan flasher */
function tampil_pesan()
{
    (isset($_SESSION['pesan'])) ? $pesan = $_SESSION['pesan'] : $pesan = '';
    unset($_SESSION['pesan']);
    return $pesan;
}
