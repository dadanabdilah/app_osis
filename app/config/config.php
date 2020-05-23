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

    // halaman yang dikategorikan sebagai proses atau tidak membutuhkan template
    'process' => [
        'auth/proses',
        'pelanggaran/simpan',
        'siswa/print',
        'siswa/hapusAll',
        'pembina/hapusAll',
        'pembina/hapus',
        'pembina/update',
        'pembina/simpan',
        'pengurus/hapusAll',
        'pengurus/hapus',
        'pengurus/simpan',
        'user/hapus',
        'user/simpan',
        'user/simpanUpdate',
        'user/simpanAktivasi',
        'laporan/print',
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
        'siswa/index' => [
            'siswa/index',
            'jquery.dataTables.min',
            'dataTables.bootstrap4.min'
        ]
    ],
];
