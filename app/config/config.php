<?php
return [
    // Halaman default
    'default' => [
        'folder' => 'home',
        'file' => 'index',
    ],

    // Halaman yang tidek perlu di cek sudah login atau tidaknya
    'no_auth' => [
        'auth/login',
        'auth/proses',
    ],

    // halaman yang dikategorikan sebagai proses
    'process' => [
        'auth/proses',
    ],

    // Halaman yang tidak memerlukan menu bar
    'no_menu' => [
        'auth/login',
    ],

    // Halaman yang memerlukan css
    'css' => [
        'auth/login' => [
            'css-nya'
        ],
    ],

    // Halaman yang memerlukan js
    'js' => [
        'auth/login' => [
            'js-nya'
        ],
    ],
];
