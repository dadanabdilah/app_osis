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
		*/ ?>

		<?php /* <script src="<?= base_url ?>/js/js-nya.js"></script> */ ?>
		<?php /* ^^ Contoh pemanggilan script yang benar */ ?>
		<?php if (isset($config['js'][$path])) : ?>
			<?php foreach ($config['js'][$path] as $value) : ?>
				<script src="<?= base_url . '/js/' . $value ?>.js"></script>
			<?php endforeach ?>
		<?php endif ?>

		</body>

		</html>