<?php
	SESSION_START();
	if(!isset($_SESSION['is_login'])){
		header("Location:http://localhost/ngacakan/login.php");
		exit;
	}

	require_once __DIR__ . '/../vendor/autoload.php';
   	include('../app/config.php');
   	$kelas=$_POST['kelas'];
    $query=mysqli_query($koneksi,"SELECT * FROM siswa WHERE kelas='$kelas' ORDER BY nama ASC");

	$mpdf = new \Mpdf\Mpdf();
	$mpdf = new \Mpdf\Mpdf(['orientation' => 'P']);
		$html ='
			<html lang="en">
				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>Aplikasi Rekap Data Pelanggaran</title>
					<link href="../asset/css/bootstrap.css" rel="stylesheet"/>
				</head>
				<body>
		            <table class="table table-bordered">
		                <thead class="text-center">
		                    <tr>
		                        <th>No.</th>
		                        <th>NIS</th>
		                        <th>Nama Siswa</th>
		                        <th>Jenis Kelamin</th>
		                        <th>Kelas</th>
		                    </tr>
		                </thead>
		                <tbody>';
		                $i=0;
		                foreach ($query as $data) {
		                	$html .= '<tr>
                                    <td class="text-center">'.$i++.'</td>
                                    <td class="text-center">'.$data['nis'].'</td>
                                    <td>'.$data['nama'].'</td>
                                    <td class="text-center">'.$data['jk'].'</td>
                                    <td class="text-center">'.$data['kelas'].'</td>
                                </tr>';
		                }

		     $html .= '</tbody>
		            </table>
				</body>
			</html>';

	$mpdf->WriteHTML('<h1 align="center">DAFTAR SISWA</h1> 
			<h1 align="center">SMK NEGERI 2 KUNINGAN</h1>');
	$mpdf->WriteHTML($html);
	$mpdf->Output('Daftar Siswa SMK Negeri 2 Kuningan.pdf',\Mpdf\Output\Destination::INLINE);

?>