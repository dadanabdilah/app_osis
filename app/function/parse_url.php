<?php
function parseURL(){
    if (isset($_GET['module'])) {
        $url = rtrim($_GET['module'], '/');
        $url = filter_var($url, FILTER_SANITIZE_URL);
        $url = explode('/', $url);
        return $url;
    }
}