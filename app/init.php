<?php
// Autoload composer
if (file_exists('../vendor/autoload.php')) {
    require_once '../vendor/autoload.php';
}

require_once 'config/variabel.php';
$config = require_once 'config/config.php';
require_once 'config/database.php';
require_once 'function/function.php';
require_once 'app.php';