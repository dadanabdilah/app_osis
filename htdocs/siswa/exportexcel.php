<?php
	// index.php
	require '../asset/phpspreadsheet/vendor/autoload.php';

	//ambildata
	$kelas=$_POST['kelas'];
	$data=mysqli_query($koneksi,"SELECT * FROM siswa WHERE kelas='$kelas' ORDER BY nama ASC");
	 
	use PhpOffice\PhpSpreadsheet\Spreadsheet;
	use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
	 
	$spreadsheet = new Spreadsheet();
	$sheet = $spreadsheet->getActiveSheet();
	 
	// buat nama sheetnya
	$sheet->setTitle('Sheet 1');
	// nama kolom dibaris pertama
	$sheet->setCellValue('A1', 'DATA SISWA');
	$sheet->setCellValue('A2', 'SMK NEGERI 2 KUNINGAN');
	$sheet->setCellValue('A4', 'NIS');
	$sheet->setCellValue('B4', 'Nama');
	$sheet->setCellValue('C4', 'Jenis Kelamin');
	$sheet->setCellValue('D4', 'Kelas');
	
	// mulai dari baris kedua
	// baris pertama untuk nama kolom
	$row = 5;
	while($record = mysqli_fetch_array($data))
	{
	    $sheet->setCellValue('A'.$row, $record['nis']);
	    $sheet->setCellValue('B'.$row, $record['nama']);
	    $sheet->setCellValue('C'.$row, $record['jk']);
	    $sheet->setCellValue('D'.$row, $record['kelas']);
	    $row++;
	}
	 
	$writer = new Xlsx($spreadsheet);
	// set header agar file di download
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header("Content-Transfer-Encoding: Binary");
	header('Content-disposition: attachment; filename="Data Siswa SCADA.xls"');
	header('Cache-Control: max-age=0');
	$writer->save("php://output");
	//$writer->download('jumlah penduduk indonesia.xlsx');
