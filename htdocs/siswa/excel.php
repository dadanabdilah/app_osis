<?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Data Siswa.xls");
include('../app/config.php');
   	$kelas=$_POST['kelas'];
    $query=mysqli_query($koneksi,"SELECT * FROM siswa WHERE kelas='$kelas' ORDER BY nama ASC");
?>

			<html lang="en">
				<head>
					<title>Aplikasi Rekap Data Pelanggaran</title>
				</head>
				<body>
					<h1 align="center">DAFTAR SISWA</h1> 
					<h1 align="center">SMK NEGERI 2 KUNINGAN</h1>
		            <table border="1" class="table table-bordered">
		                <thead class="text-center">
		                    <tr>
		                        <th>No.</th>
		                        <th>NIS</th>
		                        <th>Nama Siswa</th>
		                        <th>Jenis Kelamin</th>
		                        <th>Kelas</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<?php
				                $i=0;
				                foreach ($query as $data) {
			                		echo'
			                		<tr>
		                                <td class="text-center">'.$i++.'</td>
		                                <td class="text-center">'.$data['nis'].'</td>
		                                <td>'.$data['nama'].'</td>
		                                <td class="text-center">'.$data['jk'].'</td>
		                                <td class="text-center">'.$data['kelas'].'</td>
		                            </tr>';
				                }
				            ?>
		     			</tbody>
		            </table>
				</body>
			</html>';