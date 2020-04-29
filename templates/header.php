<?php
	SESSION_START();
	if(!isset($_SESSION['is_login'])){
		header("Location:" . base_url . "/login");
		exit;
	}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Aplikasi Rekap Data Pelanggaran</title>
		<link href="<?= base_url ?>/asset/css/bootstrap.css" rel="stylesheet"/>
		<link href="<?= base_url ?>/asset/datatables/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
		<style>
			.container-fluid{
				margin-top:70px;
			}

			@media print{
				.text, .btn, .hr{
					display: none;
				}
			}
			
	        #loading{
				background: whitesmoke;
				position: absolute;
				top: 140px;
				left: 82px;
				padding: 5px 10px;
				border: 1px solid #ccc;
			}
		</style>
	</head>
	<body>
