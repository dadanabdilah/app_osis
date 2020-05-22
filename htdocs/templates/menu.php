<nav class="navbar fixed-top navbar-expand-md bg-info navbar-dark">
	<a class="navbar-brand" href="<?= base_url ?>">
		<!--img class="img-responsive img-thumbnail" src="images/logo.jpg" width="64" height="64" alt="Not Image"-->
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#daftar-menu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="daftar-menu">
		<ul class="navbar-nav">
			<li class="navbar-item">
				<a class="nav-link" href="<?= base_url ?>">Home</a>
			</li>
			<?php if ($_SESSION['level'] == 'UL001' || $_SESSION['level'] == 'UL002') : ?>
				<li class="navbar-item">
					<a class="nav-link" href="<?= base_url ?>/pelanggaran">Input Pelanggar</a>
				</li>
			<?php endif ?>

			<?php if ($_SESSION['level'] == 'UL001') : ?>

				<li class="navbar-item">
					<a class="nav-link" href="<?= base_url ?>/laporan">Laporan</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link data dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Data</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<?= base_url ?>/siswa">Data Siswa</a>
						<a class="dropdown-item" href="<?= base_url ?>/pembina">Data Pembina OSIS</a>
						<a class="dropdown-item" href="<?= base_url ?>/pengurus">Data Pengurus OSIS</a>
						<a class="dropdown-item" href="<?= base_url ?>/user">Data User Aplikasi</a>
					</div>
				</li>

			<?php endif ?>

			<li class="nav-item">
				<a class="nav-link" href="<?= base_url ?>/auth/logout">Logout</a>
			</li>
		</ul>
	</div>
</nav>