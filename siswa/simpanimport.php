<?php
// Load file koneksi.php
include "../app/config.php";

if(isset($_POST['import'])){ // Jika user mengklik tombol Import
	$nama_file_baru = 'data.xlsx';

	// Load librari PHPExcel nya
	require_once '../asset/PHPExcel/PHPExcel.php';

	$excelreader = new PHPExcel_Reader_Excel2007();
	$loadexcel = $excelreader->load('../tmp/'.$nama_file_baru); // Load file excel yang tadi diupload ke folder tmp
	$sheet = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);

	$numrow = 1;
	foreach($sheet as $row){
		// Ambil data pada excel sesuai Kolom
		$nis = $row['A']; // Ambil data NIS
		$nama = $row['B']; // Ambil data nama
		$jk = $row['C']; // Ambil data jenis kelamin
		$kelas = $row['D']; // Ambil data telepon

		// Cek jika semua data tidak diisi
		if($nis == "" && $nama == "" && $jk == "" && $kelas == "")
			continue; // Lewat data pada baris ini (masuk ke looping selanjutnya / baris selanjutnya)

		// Cek $numrow apakah lebih dari 1
		// Artinya karena baris pertama adalah nama-nama kolom
		// Jadi dilewat saja, tidak usah diimport
		if($numrow > 1){
			// Buat query Insert
			$query = "INSERT INTO siswa VALUES('".$nis."','".$nama."','".$jk."','".$kelas."')";

			// Eksekusi $query
			mysqli_query($koneksi, $query);
		}

		$numrow++; // Tambah 1 setiap kali looping
	}
}

header('location: index.php'); // Redirect ke halaman awal
?>
