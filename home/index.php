<?php
	include('../templates/header.php');
	include('../templates/menu.php');
?>
<div class="container-fluid">
	<div class="container">
		<h2 class="text-center">Aplikasi Rekap Data Pelanggaran</h2>
	</div>
	<div class="container-fluid mt-2">
		<?php
			include'../app/config/config.php';
			if(isset($_GET['modul'])){
				include($_GET['modul'].'.php');
			}else{
				if($_SESSION['level']=='UL001'){
					include('../admin/panel.php');
				} else if($_SESSION['level']=='UL002') {
					include('../pengurus/panel.php'); 
				}else{
					header("Location:http://localhost/app_osis/login");
				}
			}
	  	?>
	</div> <!--container fluid-->
<?php
	include('../templates/footer.php');
?>