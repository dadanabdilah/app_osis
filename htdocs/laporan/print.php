<?php
$kelas = $_POST['kelas'];
$bulan = $_POST['bulan'];
$tahun = $_POST['tahun'];
//query tambahan WHERE `kelas`='$kelasPelanggar' AND month(tanggal_melanggar)='$bulanMelanggar' AND year(tanggal_melanggar)='$tahunMelanggar'
$query = mysqli_query($koneksi, "SELECT `siswa`.`nama`,`siswa`.`jk`,`siswa`.`kelas`,
                    `pelanggaran`.`input_at`,`pelanggaran`.`nama_pengurus`,`pelanggaran`.`nis_pelanggar`,
                    `pelanggaran`.`tanggal_melanggar`,`pelanggaran`.`poin_pelanggaran`
                    FROM `pelanggaran`
                    JOIN `siswa` ON  `nis_pelanggar` = `siswa`.`nis`
                     WHERE `kelas`='$kelas' AND month(tanggal_melanggar)='$bulan' AND year(tanggal_melanggar)='$tahun'
                    ORDER BY `nama` ASC") or die(mysqli_error($koneksi));

$mpdf = new \Mpdf\Mpdf();
$mpdf = new \Mpdf\Mpdf(['orientation' => 'P']);
$html = '
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
		                        <th class="text-center">No</th>
		                        <th class="text-center">NIS</th>
		                        <th class="text-center">Nama Siswa</th>
		                        <th class="text-center">Jenis Kelamin</th>
		                        <th class="text-center">Kelas</th>
		                        <th class="text-center">Tanggal Melanggar</th>
		                        <th class="text-center">Poin Pelanggaran</th>
		                    </tr>
		                </thead>
		                <tbody>';
$i = 1;
foreach ($query as $data) {
	$html .= '<tr>
                                    <td class="text-center">' . $i++ . '</td>
                                    <td class="text-center">' . $data['nis_pelanggar'] . '</td>
                                    <td class="text-center">' . $data['nama'] . '</td>
                                    <td class="text-center">' . $data['jk'] . '</td>
	                                <td class="text-center">' . $data['kelas'] . '</td>
                                    <td class="text-center">' . $data['tanggal_melanggar'] . '</td>
	                                <td class="text-center">' . $data['poin_pelanggaran'] . '</td>
                                </tr>';
}

$html .= '</tbody>
		            </table>
				</body>
			</html>';

$mpdf->WriteHTML('<h2 align="center">DAFTAR SISWA</h2>');
$mpdf->WriteHTML('<h2 align="center" class="mb-4">YANG MELANGGAR TATA TERTIB</h2>');
$mpdf->WriteHTML($html);
$mpdf->Output('Daftar Siswa SMK Negeri 2 Kuningan.pdf', \Mpdf\Output\Destination::INLINE);
