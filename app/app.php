<?php
session_start();

$url = parseURL();

// Default file dan folder
$folder = (isset($url[0])) ? $url[0] : $config['default']['file'];
$file = (isset($url[1])) ? $url[1] : $config['default']['folder'];

$path = $folder . '/' . $file;

$url = cleanURL($url);

if (is_auth($config, $path)) {
    if (is_process($config, $path)) {
        require_once '../htdocs/' . $path . '.php';
    } else {
        require_once '../htdocs/templates/header.php';
    
        if(!no_menu($config, $path)){
            require_once '../htdocs/templates/menu.php';
        }
        
        require_once '../htdocs/' . $path . '.php';
        require_once '../htdocs/templates/footer.php';
    }
} else {
    redirect(base_url . '/auth/login');
}