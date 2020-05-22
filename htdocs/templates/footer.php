		<script src="<?= base_url ?>/js/jquery.min.js"></script>
		<script src="<?= base_url ?>/js/bootstrap.min.js"></script>

		<?php /*
		<!--script import data dengan excel-->
		<script>
			$(document).ready(function() {
				// Sembunyikan alert validasi kosong
				$("#kosong").hide();
			});
		</script>
		<!--data tables-->
		<script src="<?= base_url; ?>/asset/datatables/js/jquery.dataTables.min.js"></script>
		<!--jquery untuk export ke excel-->
		<script src="<?= base_url; ?>/asset/datatables/js/dataTables.bootstrap4.min.js"></script>
		*/ ?>

		<?php /* <script src="<?= base_url ?>/js/js-nya.js"></script> */ ?>
		<?php /* ^^ Contoh pemanggilan script yang benar */ ?>

		<?php foreach ($config['js'][$path] as $value) : ?>
			<script src="<?= base_url . '/js/' . $value ?>.js"></script>
		<?php endforeach ?>

		<?php /*
		<!--jquery untuk export ke excel-->
		<script>
			$(document).ready(function() {
				$('#tabel_export').DataTable();
			});
		</script>
		*/ ?>

		</body>

		</html>