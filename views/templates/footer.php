		<script src="<?= base_url;?>/asset/js/jquery.min.js"></script>
		<script src="<?= base_url;?>/asset/js/bootstrap.min.js" ></script>
		<!--script import data dengan excel-->
		<script>
		$(document).ready(function(){
			// Sembunyikan alert validasi kosong
			$("#kosong").hide();
		});
		</script>
		<!--data tables-->
		<script src="<?= base_url;?>/asset/datatables/js/jquery.dataTables.min.js"></script> <!--jquery untuk export ke excel-->
		<script src="<?= base_url;?>/asset/datatables/js/dataTables.bootstrap4.min.js"></script> <!--jquery untuk export ke excel-->
		<script>
			$(document).ready(function() {
			    $('#tabel_export').DataTable();
			} );
		</script>
	</body>
</html>