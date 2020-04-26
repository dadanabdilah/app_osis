-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2020 at 12:35 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_osis`
--

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` char(6) NOT NULL,
  `nama_jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`) VALUES
('J001', 'Pembina'),
('J002', 'Ketua Umum'),
('J003', 'Ketua 1'),
('J004', 'Ketua 2'),
('J005', 'Sekertaris 1'),
('J006', 'Sekertaris 2'),
('J007', 'Bendahara 1'),
('J008', 'Bendahara 2'),
('J009', 'Sekbid 1'),
('J010', 'Sekbid 2'),
('J011', 'Sekbid 3'),
('J012', 'Sekbid 4'),
('J013', 'Sekbid 5'),
('J014', 'Sekbid 6'),
('J015', 'Sekbid 7'),
('J016', 'Sekbid 8'),
('J017', 'Sekbid 9'),
('J018', 'Sekbid 10');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` int(11) NOT NULL,
  `input_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_pengurus` varchar(100) NOT NULL,
  `nis_pelanggar` varchar(15) NOT NULL,
  `tanggal_melanggar` date NOT NULL,
  `poin_pelanggaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `input_at`, `nama_pengurus`, `nis_pelanggar`, `tanggal_melanggar`, `poin_pelanggaran`) VALUES
(22, '2020-03-03 01:50:23', 'Admin Dadan Abdilah', '1819.10.065.095', '2020-03-03', 1),
(23, '2020-03-03 01:56:03', 'Admin Dadan Abdilah', '1819.10.065.057', '2020-03-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembina`
--

CREATE TABLE `pembina` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `id_jabatan` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `pembina`
--
DELIMITER $$
CREATE TRIGGER `ADD_USER_PEMBINA` AFTER INSERT ON `pembina` FOR EACH ROW INSERT INTO user (autentikasi,nama_user,password,id_level,is_active)
VALUES (NEW.nip,new.nama,MD5('#admin.osis$%'),'UL001','1')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DELETE_USER_PEMBINA` AFTER DELETE ON `pembina` FOR EACH ROW DELETE FROM user WHERE autentikasi=OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE `pengurus` (
  `nis` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `id_jabatan` char(6) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengurus`
--

INSERT INTO `pengurus` (`nis`, `nama`, `jk`, `id_jabatan`, `kelas`) VALUES
('1819.10.065.021', 'Reza Ramadhan Kusumajaya', 'L', 'J017', 'XI RPL 2'),
('1819.10.065.040', 'David Reynaldi', 'L', 'J012', 'XI RPL 2'),
('1819.10.065.046', 'Fadly Dwi Saputra', 'L', 'J016', 'XI RPL 3'),
('1819.10.065.051', 'Lisa Suci Wulandari', 'P', 'J017', 'XI RPL 3'),
('1819.10.065.075', 'Dadan Abdilah', 'L', 'J010', 'XI RPL 1'),
('1819.10.065.076', 'Dadi Ramdani', 'L', 'J015', 'XI RPL 1'),
('1819.10.065.090', 'Muhammad Dimasputra Esa Anugrah Wibawa', 'L', 'J018', 'XI RPL 1'),
('1819.10.065.093', 'Reza Nurajizah', 'P', 'J011', 'XI RPL 1'),
('1819.10.066.107', 'Agum Pratama', 'L', 'J011', 'XI TKJ 1'),
('1819.10.066.131', 'Rio Reynaldo Alfian', 'L', 'J003', 'XI TKJ 2'),
('1819.10.066.174', 'Windia Suwaltifah', 'P', 'J015', 'XI TKJ 1'),
('1819.10.108.180', 'Dea Ardiya', 'L', 'J014', 'XI PN 1'),
('1819.10.108.234', 'Nida Aidatu Rohmah', 'P', 'J014', 'XI PN 3'),
('1819.10.110.304', 'Putri Eka Pratiwi', 'P', 'J005', 'XI AP 2'),
('1819.10.111.406', 'Faizal Akbar Maulana', 'L', 'J009', 'XI AK 2'),
('1819.10.111.407', 'Jajang Riana', 'L', 'J013', 'XI AK 2'),
('1819.10.111.477', 'Hana Dewi Riana Putri', 'P', 'J013', 'XI AK 4'),
('1819.10.111.486', 'Nela Nailus Syarifah', 'P', 'J007', 'XI AK 1'),
('1819.10.111.487', 'Nova Sofia', 'P', 'J016', 'XI AK 1'),
('1819.10.111.488', 'Nur Indah Lestari', 'P', 'J002', 'XI AK 1'),
('1819.10.111.500', 'Amelia Rahmah', 'P', 'J009', 'XI AK 4'),
('1819.10.111.507', 'Divani Nurbaity', 'P', 'J010', 'XI AK 4'),
('1819.10.115.549', 'Intan Dwi Puspita', 'P', 'J018', 'XI UPW 2'),
('1819.10.115.558', 'Rahayu', 'P', 'J012', 'XI UPW 1'),
('1819075', 'Dadan Abdilah', 'L', 'J010', 'XI AK 1'),
('1920.10.065.032', 'Tirania Agustin', 'P', 'J016', 'X RPL 1'),
('1920.10.065.039', 'Alrefae Aditya Nugraha', 'L', 'J011', 'X RPL 2'),
('1920.10.065.047', 'Dinda Maharani', 'P', 'J014', 'X RPL 2'),
('1920.10.065.058', 'Luki Aryanto', 'L', 'J017', 'X RPL 2'),
('1920.10.065.065', 'Salsa Agustin', 'P', 'J017', 'X RPL 2'),
('1920.10.065.070', 'Tio Azzam Aminudin', 'L', 'J012', 'X RPL 2'),
('1920.10.065.100', 'Rizky Aranda Putra Fauza', 'L', 'J013', 'X RPL 3'),
('1920.10.066.123', 'Muhammad Rizalul Fauzan', 'L', 'J015', 'X TKJ 1'),
('1920.10.066.124', 'Naufal Farik Anugrah', 'L', 'J011', 'X TKJ 1'),
('1920.10.066.129', 'Rafi Zaidan Rabbani', 'L', 'J009', 'X TKJ 2'),
('1920.10.066.166', 'Muhamad  Naufal', 'L', 'J016', 'X TKJ 2'),
('1920.10.066.168', 'Nandu Alviansyah', 'L', 'J018', 'X TKJ 2'),
('1920.10.108.202', 'Nawang Wulan Ratnasari', 'P', 'J015', 'X PN 1'),
('1920.10.110.345', 'Najla Haya Huwaida', 'P', 'J006', 'X AP 2'),
('1920.10.111.397', 'Agiet Fierdha Dwi Rahma', 'P', 'J011', 'X AK 1'),
('1920.10.111.398', 'Alinda Dewi', 'P', 'J010', 'X AK 1'),
('1920.10.111.402', 'Bagus Kirana', 'L', 'J014', 'X AK 1'),
('1920.10.111.446', 'Dewi Rahmahwati', 'P', 'J013', 'X AK 2'),
('1920.10.111.454', 'Nining Musni', 'P', 'J008', 'X AK 2'),
('1920.10.111.488', 'Nur\'aeni', 'P', 'J009', 'X AK 3'),
('1920.10.115.563', 'Novi Sofiyanti', 'P', 'J004', 'X UPW 1'),
('1920.10.115.584', 'Febrianisa Khanna', 'P', 'J018', 'X UPW 2'),
('1920.10.115.588', 'Ira Irwanti', 'P', 'J012', 'X UPW 2');

--
-- Triggers `pengurus`
--
DELIMITER $$
CREATE TRIGGER `ADD_USER_PENGURUS` AFTER INSERT ON `pengurus` FOR EACH ROW INSERT INTO user (autentikasi,nama_user,password,id_level,is_active)
VALUES (NEW.nis,new.nama,MD5('#pengurus.osis,'),'UL002','1')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DELETE_USER_PENGURUS` AFTER DELETE ON `pengurus` FOR EACH ROW DELETE FROM user WHERE
autentikasi=OLD.nis
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `jk`, `kelas`) VALUES
('1819.10.065.001', 'A`I Fitriyani', 'P', 'XI RPL 1'),
('1819.10.065.002', 'Ade Bagas Kusumah', 'L', 'XI RPL 1'),
('1819.10.065.003', 'Adinda Alviani', 'P', 'XI RPL 1'),
('1819.10.065.004', 'Amanda Wulandari', 'P', 'XI RPL 1'),
('1819.10.065.005', 'Anidya Putri Lestari', 'P', 'XI RPL 1'),
('1819.10.065.006', 'Desi Delima Wati', 'P', 'XI RPL 1'),
('1819.10.065.007', 'Dimas Anugrah', 'L', 'XI RPL 1'),
('1819.10.065.008', 'Dini Marliani', 'P', 'XI RPL 1'),
('1819.10.065.009', 'Elin Herlina', 'P', 'XI RPL 1'),
('1819.10.065.010', 'Eva Nurfaizah', 'P', 'XI RPL 1'),
('1819.10.065.011', 'Fathia Sekar Fadhilah', 'P', 'XI RPL 1'),
('1819.10.065.012', 'Fitri Fathurrohmah', 'P', 'XI RPL 1'),
('1819.10.065.013', 'Fuji Indah Cahyani', 'P', 'XI RPL 2'),
('1819.10.065.014', 'Ima Rahmawati', 'P', 'XI RPL 2'),
('1819.10.065.015', 'Iman Mansyur', 'L', 'XI RPL 2'),
('1819.10.065.016', 'Lala Karmila', 'P', 'XI RPL 2'),
('1819.10.065.017', 'Leli Kurniawati', 'P', 'XI RPL 2'),
('1819.10.065.018', 'Meri Inayatu Solihah', 'P', 'XI RPL 2'),
('1819.10.065.019', 'Rakha Aditya Wirawan', 'L', 'XI RPL 2'),
('1819.10.065.020', 'Ranti Amellia Hardini', 'P', 'XI RPL 2'),
('1819.10.065.021', 'Reza Ramadhan Kusumajaya', 'L', 'XI RPL 2'),
('1819.10.065.022', 'Riski Rismawan', 'L', 'XI RPL 3'),
('1819.10.065.023', 'Salsa Putri Meilani', 'P', 'XI RPL 2'),
('1819.10.065.024', 'Sela Permata', 'P', 'XI RPL 2'),
('1819.10.065.025', 'Shilvia Wanda Putri Syachrani', 'P', 'XI RPL 2'),
('1819.10.065.026', 'Shindi Shalsabila Putri', 'P', 'XI RPL 3'),
('1819.10.065.027', 'Sopiani', 'P', 'XI RPL 3'),
('1819.10.065.028', 'Syahrul Ramdany', 'L', 'XI RPL 3'),
('1819.10.065.029', 'Syifa Fadillah', 'P', 'XI RPL 3'),
('1819.10.065.030', 'Tiara Maulida Hidayati', 'P', 'XI RPL 3'),
('1819.10.065.031', 'Tiara Puspita Sari', 'P', 'XI RPL 3'),
('1819.10.065.032', 'Vera Kholipah', 'P', 'XI RPL 3'),
('1819.10.065.033', 'Vivi Yuniarti Fitria', 'P', 'XI RPL 3'),
('1819.10.065.034', 'Yasinta Nurhamidah', 'P', 'XI RPL 3'),
('1819.10.065.035', 'Zaka Ardiansyah', 'L', 'XI RPL 3'),
('1819.10.065.036', 'Ahmad Danu', 'L', 'XI RPL 2'),
('1819.10.065.037', 'Anisa Agustina', 'P', 'XI RPL 2'),
('1819.10.065.038', 'Arif Nugraha', 'L', 'XI RPL 2'),
('1819.10.065.039', 'Cucu Rukmawati', 'P', 'XI RPL 2'),
('1819.10.065.040', 'David Reynaldi', 'L', 'XI RPL 2'),
('1819.10.065.041', 'Dea Apriliya', 'P', 'XI RPL 2'),
('1819.10.065.042', 'Devi Nurintan', 'P', 'XI RPL 2'),
('1819.10.065.043', 'Dewi Candrawati', 'P', 'XI RPL 2'),
('1819.10.065.044', 'Diki Paturohman', 'L', 'XI RPL 3'),
('1819.10.065.045', 'Dina Marlina', 'P', 'XI RPL 2'),
('1819.10.065.046', 'Fadly Dwi Saputra', 'L', 'XI RPL 3'),
('1819.10.065.047', 'Fitria', 'P', 'XI RPL 2'),
('1819.10.065.048', 'Fitria Indriani', 'P', 'XI RPL 2'),
('1819.10.065.049', 'Ii Handini', 'P', 'XI RPL 2'),
('1819.10.065.050', 'Inggit Agustin', 'P', 'XI RPL 3'),
('1819.10.065.051', 'Lisa Suci Wulandari', 'P', 'XI RPL 3'),
('1819.10.065.052', 'Megan Prayata Nugraha', 'L', 'XI RPL 3'),
('1819.10.065.053', 'Mei Pramesti', 'P', 'XI RPL 3'),
('1819.10.065.054', 'Meta Amelia Puspita', 'P', 'XI RPL 3'),
('1819.10.065.055', 'Nabilla Hanifa Septemya', 'P', 'XI RPL 3'),
('1819.10.065.056', 'Namira Nuramallah', 'P', 'XI RPL 3'),
('1819.10.065.057', 'Nida Nurhalimah', 'P', 'XI RPL 3'),
('1819.10.065.058', 'Noni Apriliyani', 'P', 'XI RPL 3'),
('1819.10.065.059', 'Novia Anjani', 'P', 'XI RPL 3'),
('1819.10.065.060', 'Rendy Prayoga', 'L', 'XI RPL 1'),
('1819.10.065.061', 'Riska Deliani Pratiwi', 'P', 'XI RPL 1'),
('1819.10.065.062', 'Risma Melinda Lestari', 'P', 'XI RPL 1'),
('1819.10.065.063', 'Santi Nurasih', 'P', 'XI RPL 1'),
('1819.10.065.064', 'Shafa Tsara Shafiyyah', 'P', 'XI RPL 1'),
('1819.10.065.065', 'Sifa Fauziah Triana', 'P', 'XI RPL 1'),
('1819.10.065.066', 'Susi Nurlaela', 'P', 'XI RPL 1'),
('1819.10.065.067', 'Susi Susilawati', 'P', 'XI RPL 1'),
('1819.10.065.068', 'Wisnu Adi Saputra', 'L', 'XI RPL 1'),
('1819.10.065.070', 'Yumi Susanti', 'P', 'XI RPL 1'),
('1819.10.065.071', 'Agis Nugraha', 'L', 'XI RPL 3'),
('1819.10.065.072', 'Akbar Maulana', 'L', 'XI RPL 3'),
('1819.10.065.073', 'Amanda Putri Amelia', 'P', 'XI RPL 3'),
('1819.10.065.074', 'Chintana', 'P', 'XI RPL 3'),
('1819.10.065.075', 'Dadan Abdilah', 'L', 'XI RPL 1'),
('1819.10.065.076', 'Dadi Ramdani', 'L', 'XI RPL 1'),
('1819.10.065.077', 'Denasri Jaiba Wahyudin', 'P', 'XI RPL 3'),
('1819.10.065.079', 'Diki Dharmawan', 'L', 'XI RPL 2'),
('1819.10.065.080', 'Dila Damayanti', 'P', 'XI RPL 3'),
('1819.10.065.081', 'Dini Pitraeni', 'P', 'XI RPL 3'),
('1819.10.065.083', 'Fitria  Sindy Dewanti', 'P', 'XI RPL 3'),
('1819.10.065.084', 'Ii Risnawati', 'P', 'XI RPL 3'),
('1819.10.065.085', 'Ilham Barkah Octavanzis', 'L', 'XI RPL 1'),
('1819.10.065.087', 'Maya Kusmaya', 'P', 'XI RPL 3'),
('1819.10.065.088', 'Mayang Puspita Sari', 'P', 'XI RPL 3'),
('1819.10.065.089', 'Mia Audina', 'P', 'XI RPL 1'),
('1819.10.065.090', 'Muhammad Dimasputra Esa Anugrah Wibawa', 'L', 'XI RPL 1'),
('1819.10.065.091', 'Nida Afianti', 'P', 'XI RPL 1'),
('1819.10.065.092', 'Ranih Apriliani Pauzi', 'P', 'XI RPL 1'),
('1819.10.065.093', 'Reza Nurajizah', 'P', 'XI RPL 1'),
('1819.10.065.094', 'Rifa Isma Azzahra', 'P', 'XI RPL 1'),
('1819.10.065.095', 'Risa Rismayanti', 'P', 'XI RPL 1'),
('1819.10.065.096', 'Risma Yanti', 'P', 'XI RPL 1'),
('1819.10.065.097', 'Runidah', 'P', 'XI RPL 1'),
('1819.10.065.098', 'Silva Seti Nurjanah', 'P', 'XI RPL 2'),
('1819.10.065.099', 'Sinta Karlina', 'P', 'XI RPL 2'),
('1819.10.065.100', 'Siska Suci Lestari', 'P', 'XI RPL 2'),
('1819.10.065.101', 'Siti Mutiara', 'P', 'XI RPL 2'),
('1819.10.065.102', 'Syifa Nur Syamsiah', 'P', 'XI RPL 2'),
('1819.10.065.103', 'Tia Yanuariska', 'P', 'XI RPL 2'),
('1819.10.065.104', 'Tina Marccela', 'P', 'XI RPL 2'),
('1819.10.065.105', 'Vida Kharisma Lestari', 'P', 'XI RPL 2'),
('1819.10.065.106', 'Yuyun Wahyuningsih', 'P', 'XI RPL 2'),
('1819.10.066.107', 'Agum Pratama', 'L', 'XI TKJ 1'),
('1819.10.066.108', 'Aida Melati Husnaini', 'P', 'XI TKJ 1'),
('1819.10.066.109', 'Debi Silfia Nugraha', 'P', 'XI TKJ 1'),
('1819.10.066.110', 'Della Komalasari', 'P', 'XI TKJ 1'),
('1819.10.066.111', 'Dewi Susilawati', 'P', 'XI TKJ 1'),
('1819.10.066.112', 'Diah Halimatul Sadiah', 'P', 'XI TKJ 1'),
('1819.10.066.113', 'Dila Seliana', 'P', 'XI TKJ 2'),
('1819.10.066.114', 'Dwi Kharismawati', 'P', 'XI TKJ 2'),
('1819.10.066.116', 'Fera Putri Rahayu', 'P', 'XI TKJ 1'),
('1819.10.066.117', 'Fuzi Maelani', 'P', 'XI TKJ 1'),
('1819.10.066.118', 'Ihsan Falih', 'L', 'XI TKJ 2'),
('1819.10.066.119', 'Imas Nuraisah', 'P', 'XI TKJ 2'),
('1819.10.066.120', 'Intan Nurani', 'P', 'XI TKJ 2'),
('1819.10.066.121', 'Nafa Mustikasari', 'P', 'XI TKJ 2'),
('1819.10.066.122', 'Nani Sumarni', 'P', 'XI TKJ 2'),
('1819.10.066.123', 'Nunu Nugraha', 'L', 'XI TKJ 1'),
('1819.10.066.124', 'Nuril Wani Qistina', 'P', 'XI TKJ 1'),
('1819.10.066.125', 'Nurkholis Ahyad', 'L', 'XI TKJ 1'),
('1819.10.066.126', 'Pipit Pitria Fauziah', 'P', 'XI TKJ 1'),
('1819.10.066.127', 'Rani Siti Nurhayani', 'P', 'XI TKJ 1'),
('1819.10.066.128', 'Reni Komalaelani', 'P', 'XI TKJ 1'),
('1819.10.066.129', 'Resma Malinha Rhao', 'P', 'XI TKJ 1'),
('1819.10.066.130', 'Reva Putri Zahnia', 'P', 'XI TKJ 1'),
('1819.10.066.131', 'Rio Reynaldo Alfian', 'L', 'XI TKJ 2'),
('1819.10.066.132', 'Risma Rahmawati', 'P', 'XI TKJ 2'),
('1819.10.066.133', 'Sandika Virgi Wanti Komala', 'P', 'XI TKJ 2'),
('1819.10.066.134', 'Selvi Febriyanti', 'P', 'XI TKJ 2'),
('1819.10.066.135', 'Silfina Wardah', 'P', 'XI TKJ 2'),
('1819.10.066.136', 'Sindi Aprilia', 'P', 'XI TKJ 2'),
('1819.10.066.137', 'Sintia Nuraulia Putri', 'P', 'XI TKJ 2'),
('1819.10.066.138', 'Siti Rohmah Fauziah', 'P', 'XI TKJ 2'),
('1819.10.066.139', 'Susi Sulistilawati', 'P', 'XI TKJ 2'),
('1819.10.066.140', 'Vina Luciana', 'P', 'XI TKJ 2'),
('1819.10.066.141', 'Ajeng Fanty Fatimah Tribuana Tunggal Dewi', 'P', 'XI TKJ 2'),
('1819.10.066.142', 'Ananda Gabriella', 'P', 'XI TKJ 2'),
('1819.10.066.143', 'Anisa Nurhalisa', 'P', 'XI TKJ 2'),
('1819.10.066.144', 'Dita Tri Aprilyani', 'P', 'XI TKJ 2'),
('1819.10.066.145', 'Doni Candra Putra Pratama', 'L', 'XI TKJ 2'),
('1819.10.066.146', 'Eros Rosnani', 'P', 'XI TKJ 2'),
('1819.10.066.147', 'Erwin Eriyawan', 'L', 'XI TKJ 2'),
('1819.10.066.148', 'Febby Febriani', 'P', 'XI TKJ 2'),
('1819.10.066.149', 'Ilah Amelisa', 'P', 'XI TKJ 1'),
('1819.10.066.150', 'Ina Kurnia', 'P', 'XI TKJ 1'),
('1819.10.066.151', 'Intan Trianita', 'P', 'XI TKJ 1'),
('1819.10.066.152', 'Izzy Raenaldy', 'L', 'XI TKJ 1'),
('1819.10.066.153', 'Jesica Giovanny', 'P', 'XI TKJ 1'),
('1819.10.066.154', 'Johan Trijasa', 'L', 'XI TKJ 1'),
('1819.10.066.156', 'Kesya Syaffa Nabillanova', 'P', 'XI TKJ 1'),
('1819.10.066.157', 'Lisna', 'P', 'XI TKJ 1'),
('1819.10.066.158', 'Lisna Restiani', 'P', 'XI TKJ 1'),
('1819.10.066.159', 'Muhammad Farhan', 'L', 'XI TKJ 2'),
('1819.10.066.160', 'Nina Febriani', 'P', 'XI TKJ 2'),
('1819.10.066.161', 'Nunung Nurhasanah', 'P', 'XI TKJ 2'),
('1819.10.066.162', 'Pipit Prihati', 'P', 'XI TKJ 2'),
('1819.10.066.163', 'Rismawati Yuniar', 'P', 'XI TKJ 2'),
('1819.10.066.164', 'Silva Septiani', 'P', 'XI TKJ 1'),
('1819.10.066.165', 'Siti Rojanah', 'P', 'XI TKJ 1'),
('1819.10.066.166', 'Siti Rosliana', 'P', 'XI TKJ 1'),
('1819.10.066.167', 'Susilawati', 'P', 'XI TKJ 1'),
('1819.10.066.168', 'Tanti Purwanti', 'P', 'XI TKJ 1'),
('1819.10.066.169', 'Tina Agustin', 'P', 'XI TKJ 2'),
('1819.10.066.170', 'Tita Henita', 'P', 'XI TKJ 2'),
('1819.10.066.171', 'Vani Sekarsari', 'P', 'XI TKJ 1'),
('1819.10.066.172', 'Vitara Julianda', 'P', 'XI TKJ 1'),
('1819.10.066.173', 'Windi Ananda', 'P', 'XI TKJ 1'),
('1819.10.066.174', 'Windia Suwaltifah', 'P', 'XI TKJ 1'),
('1819.10.066.175', 'Wulan Anggraeni', 'P', 'XI TKJ 2'),
('1819.10.066.176', 'Yani Pebriani', 'P', 'XI TKJ 2'),
('1819.10.108.177', 'Adelia Yuke Nabilah', 'P', 'XI PN 1'),
('1819.10.108.178', 'Alfiani Intan Nurjanah', 'P', 'XI PN 1'),
('1819.10.108.179', 'Dea Ananda', 'P', 'XI PN 1'),
('1819.10.108.180', 'Dea Ardiya', 'L', 'XI PN 1'),
('1819.10.108.181', 'Della Amanda Putri', 'P', 'XI PN 1'),
('1819.10.108.182', 'Dena Daniati', 'P', 'XI PN 1'),
('1819.10.108.183', 'Dhira Nada Azahra', 'P', 'XI PN 1'),
('1819.10.108.184', 'Eleonora Indah Mulyani', 'P', 'XI PN 1'),
('1819.10.108.185', 'Fanny Sri Rahayu', 'P', 'XI PN 1'),
('1819.10.108.186', 'Fitri Alifiah', 'P', 'XI PN 1'),
('1819.10.108.187', 'Halimah Nur Hasanah', 'P', 'XI PN 1'),
('1819.10.108.188', 'Hilwa Nur Zulfatul Karimah', 'P', 'XI PN 1'),
('1819.10.108.189', 'Iis Apriyani', 'P', 'XI PN 2'),
('1819.10.108.190', 'Ike Trisnawati', 'P', 'XI PN 2'),
('1819.10.108.191', 'Indri Lestari', 'P', 'XI PN 2'),
('1819.10.108.192', 'Junayah Sri Wijayanti', 'P', 'XI PN 2'),
('1819.10.108.193', 'Lesa Almulyati', 'P', 'XI PN 2'),
('1819.10.108.194', 'Lilis Suryani', 'P', 'XI PN 2'),
('1819.10.108.195', 'Linda Putri Mahendra', 'P', 'XI PN 2'),
('1819.10.108.196', 'Lis Nur Anisah', 'P', 'XI PN 2'),
('1819.10.108.197', 'Lisna Meilani', 'P', 'XI PN 2'),
('1819.10.108.198', 'Maspuroh Komalasari', 'P', 'XI PN 2'),
('1819.10.108.199', 'Nida Naelul Amali', 'P', 'XI PN 2'),
('1819.10.108.200', 'Ninda Hamidah', 'P', 'XI PN 3'),
('1819.10.108.201', 'Nisa Restia Sucy', 'P', 'XI PN 3'),
('1819.10.108.202', 'Nita Rahmawati', 'P', 'XI PN 3'),
('1819.10.108.203', 'Novi Nurkholifah', 'P', 'XI PN 3'),
('1819.10.108.204', 'Nur Annisah', 'P', 'XI PN 3'),
('1819.10.108.205', 'Putri Aoliya', 'P', 'XI PN 3'),
('1819.10.108.206', 'Putri Oktaviani', 'P', 'XI PN 3'),
('1819.10.108.207', 'Salsana Mutiara', 'P', 'XI PN 3'),
('1819.10.108.208', 'Sinta Aulia', 'P', 'XI PN 3'),
('1819.10.108.209', 'Winda Ayu Lestari', 'P', 'XI PN 3'),
('1819.10.108.210', 'Winda Setiawati', 'P', 'XI PN 3'),
('1819.10.108.211', 'Yuli Yuliyanti', 'P', 'XI PN 3'),
('1819.10.108.212', 'Aas Siti Sofiyah', 'P', 'XI PN 2'),
('1819.10.108.213', 'Ade Susilawati', 'P', 'XI PN 2'),
('1819.10.108.214', 'Ainun Nafisah', 'P', 'XI PN 2'),
('1819.10.108.215', 'Alvina Nurfadilah', 'P', 'XI PN 2'),
('1819.10.108.216', 'Andini', 'P', 'XI PN 2'),
('1819.10.108.217', 'Anisa', 'P', 'XI PN 2'),
('1819.10.108.218', 'Ayu Yuliawati', 'P', 'XI PN 2'),
('1819.10.108.219', 'Choirunnisa', 'P', 'XI PN 2'),
('1819.10.108.220', 'Cindy Alfina Febriyani', 'P', 'XI PN 2'),
('1819.10.108.221', 'Cindy Angelina', 'P', 'XI PN 2'),
('1819.10.108.222', 'Dela Agustiani', 'P', 'XI PN 2'),
('1819.10.108.223', 'Diana Putri Nurhaliza', 'P', 'XI PN 3'),
('1819.10.108.224', 'Efin Nurhafidhzah', 'P', 'XI PN 3'),
('1819.10.108.225', 'Fitri Nurimaniah', 'P', 'XI PN 3'),
('1819.10.108.227', 'Iis Nurliah', 'P', 'XI PN 3'),
('1819.10.108.228', 'Indri Widia Wati', 'P', 'XI PN 3'),
('1819.10.108.229', 'Inggi Yusanti', 'P', 'XI PN 3'),
('1819.10.108.230', 'Leni Meilani', 'P', 'XI PN 3'),
('1819.10.108.231', 'Maisa Rahma Mardiyah', 'P', 'XI PN 3'),
('1819.10.108.232', 'Mila Triviska', 'P', 'XI PN 3'),
('1819.10.108.233', 'Mira Barbara Rafhaeli', 'P', 'XI PN 3'),
('1819.10.108.234', 'Nida Aidatu Rohmah', 'P', 'XI PN 3'),
('1819.10.108.235', 'Novi Wulandari', 'P', 'XI PN 1'),
('1819.10.108.236', 'Nurul Afifah', 'P', 'XI PN 1'),
('1819.10.108.237', 'Putri Maulani', 'P', 'XI PN 1'),
('1819.10.108.238', 'Rahayu Melati Agustina', 'P', 'XI PN 1'),
('1819.10.108.239', 'Rani Rahmawati', 'P', 'XI PN 1'),
('1819.10.108.240', 'Rika Yusviana Dewi', 'P', 'XI PN 1'),
('1819.10.108.241', 'Selpy Maulidhani', 'P', 'XI PN 1'),
('1819.10.108.242', 'Sopi Sopiani', 'P', 'XI PN 1'),
('1819.10.108.243', 'Syifa Silfana', 'P', 'XI PN 1'),
('1819.10.108.244', 'Tia Liskianti', 'P', 'XI PN 1'),
('1819.10.108.245', 'Tine Agustiani', 'P', 'XI PN 1'),
('1819.10.108.247', 'Yulia Indriani', 'P', 'XI PN 1'),
('1819.10.108.248', 'Adilah Fauziah', 'P', 'XI PN 3'),
('1819.10.108.249', 'Aminah', 'P', 'XI PN 3'),
('1819.10.108.250', 'Chaerunnisa', 'P', 'XI PN 3'),
('1819.10.108.251', 'Dea Pitri Diana', 'P', 'XI PN 3'),
('1819.10.108.252', 'Desiana Zahra Aullyah', 'P', 'XI PN 3'),
('1819.10.108.253', 'Devina Nurdiani', 'P', 'XI PN 3'),
('1819.10.108.254', 'Elsa Nur Malah', 'P', 'XI PN 3'),
('1819.10.108.255', 'Emalia Putri', 'P', 'XI PN 3'),
('1819.10.108.256', 'Fitrya Destiantani', 'P', 'XI PN 3'),
('1819.10.108.257', 'Gita Luvita Sari', 'P', 'XI PN 3'),
('1819.10.108.258', 'Hera Safana Kanta Praja', 'P', 'XI PN 3'),
('1819.10.108.259', 'Husnul Khotimah', 'P', 'XI PN 1'),
('1819.10.108.260', 'Iis Triyani', 'P', 'XI PN 1'),
('1819.10.108.261', 'Ike Nurjanah', 'P', 'XI PN 1'),
('1819.10.108.262', 'Indah Damayanti', 'P', 'XI PN 1'),
('1819.10.108.263', 'Isce Pebriyanti', 'P', 'XI PN 1'),
('1819.10.108.264', 'Khairun Nisa Rosweliawaty', 'P', 'XI PN 1'),
('1819.10.108.265', 'Lilis Sri Yulianingsih', 'P', 'XI PN 1'),
('1819.10.108.266', 'Lilis Sulistiyani', 'P', 'XI PN 1'),
('1819.10.108.267', 'Lusi Hermawati', 'P', 'XI PN 1'),
('1819.10.108.268', 'Mila Nurhalimah', 'P', 'XI PN 1'),
('1819.10.108.269', 'Mira Nuraeni', 'P', 'XI PN 1'),
('1819.10.108.271', 'Nonih Dwi Nurmaya', 'P', 'XI PN 1'),
('1819.10.108.272', 'Putri Fauziah', 'P', 'XI PN 2'),
('1819.10.108.273', 'Ranie Triesnawati', 'P', 'XI PN 2'),
('1819.10.108.274', 'Refi Rahmawati', 'P', 'XI PN 2'),
('1819.10.108.275', 'Risa Purnama Sari', 'P', 'XI PN 2'),
('1819.10.108.276', 'Rosa Pauziah', 'P', 'XI PN 2'),
('1819.10.108.277', 'Salsandita Putri', 'P', 'XI PN 2'),
('1819.10.108.278', 'Tiara Putri Nabilah', 'P', 'XI PN 2'),
('1819.10.108.279', 'Tita Marlina', 'P', 'XI PN 2'),
('1819.10.108.280', 'Titin Triani', 'P', 'XI PN 2'),
('1819.10.108.281', 'Vina Nur Apriana', 'P', 'XI PN 2'),
('1819.10.108.282', 'Yusi Setia Asih', 'P', 'XI PN 2'),
('1819.10.108.283', 'Zia Azahra Abida', 'P', 'XI PN 2'),
('1819.10.110.284', 'Aam Amelia', 'P', 'XI AP 1'),
('1819.10.110.285', 'Adnin Sania', 'P', 'XI AP 1'),
('1819.10.110.286', 'Anggun Dwi Permata', 'P', 'XI AP 1'),
('1819.10.110.287', 'Bagas Wijaya', 'L', 'XI AP 1'),
('1819.10.110.288', 'Dilla Cantika Dewi', 'P', 'XI AP 1'),
('1819.10.110.289', 'Dirsha Prestika Putra Pratama', 'L', 'XI AP 3'),
('1819.10.110.290', 'Indri Agustiani', 'P', 'XI AP 1'),
('1819.10.110.291', 'Irma Siti Nurmala', 'P', 'XI AP 1'),
('1819.10.110.292', 'Ismi Felicia', 'P', 'XI AP 1'),
('1819.10.110.293', 'Linda Lidiawati', 'P', 'XI AP 1'),
('1819.10.110.294', 'Mandha Puspitasari', 'P', 'XI AP 1'),
('1819.10.110.295', 'Merlin Triana', 'P', 'XI AP 1'),
('1819.10.110.296', 'Mila Kamilah', 'P', 'XI AP 1'),
('1819.10.110.297', 'Mona Riantika', 'P', 'XI AP 2'),
('1819.10.110.298', 'Mustika Nuraini', 'P', 'XI AP 2'),
('1819.10.110.299', 'Nabila Nurul Zahrah', 'P', 'XI AP 2'),
('1819.10.110.300', 'Nazar Rafly Zuan', 'L', 'XI AP 2'),
('1819.10.110.301', 'Nida Hoerunisa', 'P', 'XI AP 2'),
('1819.10.110.302', 'Nida Sri Juliana', 'P', 'XI AP 2'),
('1819.10.110.303', 'Novi Ramandhani', 'P', 'XI AP 2'),
('1819.10.110.304', 'Putri Eka Pratiwi', 'P', 'XI AP 2'),
('1819.10.110.305', 'Resti Yuniar', 'P', 'XI AP 2'),
('1819.10.110.306', 'Revi Anggraeni', 'P', 'XI AP 2'),
('1819.10.110.307', 'Rifa Fitria', 'P', 'XI AP 2'),
('1819.10.110.308', 'Santi Rahmawati', 'P', 'XI AP 2'),
('1819.10.110.309', 'Selly Selviana Wulandari', 'P', 'XI AP 3'),
('1819.10.110.310', 'Shelpy Fitrian', 'P', 'XI AP 3'),
('1819.10.110.311', 'Silvia Juliani', 'P', 'XI AP 3'),
('1819.10.110.312', 'Siti Zahra Nadilah', 'P', 'XI AP 3'),
('1819.10.110.313', 'Tia Suhartati', 'P', 'XI AP 3'),
('1819.10.110.314', 'Vivi Ivania', 'P', 'XI AP 3'),
('1819.10.110.315', 'Widayanti', 'P', 'XI AP 3'),
('1819.10.110.316', 'Winda Ayunanda', 'P', 'XI AP 3'),
('1819.10.110.317', 'Winda Meylani', 'P', 'XI AP 3'),
('1819.10.110.318', 'Yola Salsabila', 'P', 'XI AP 3'),
('1819.10.110.319', 'Yuliani', 'P', 'XI AP 3'),
('1819.10.110.320', 'Aida Permatasari', 'P', 'XI AP 2'),
('1819.10.110.321', 'Ainin Nur Alpiah', 'P', 'XI AP 2'),
('1819.10.110.322', 'Astri Apriliani', 'P', 'XI AP 2'),
('1819.10.110.323', 'Dede Putri Ani Nanndillah', 'P', 'XI AP 2'),
('1819.10.110.324', 'Dedeh Sadiyah', 'P', 'XI AP 2'),
('1819.10.110.325', 'Diana Maudy Lestari', 'P', 'XI AP 2'),
('1819.10.110.326', 'Endang Paramita', 'P', 'XI AP 2'),
('1819.10.110.327', 'Fani Dea Alffani', 'P', 'XI AP 2'),
('1819.10.110.328', 'Fitria Ayuningtyas', 'P', 'XI AP 2'),
('1819.10.110.329', 'Ira Nafisa', 'P', 'XI AP 2'),
('1819.10.110.330', 'Khalisa Ariananda', 'P', 'XI AP 2'),
('1819.10.110.331', 'Lala Marcela', 'P', 'XI AP 2'),
('1819.10.110.332', 'Melli Misliawati', 'P', 'XI AP 3'),
('1819.10.110.333', 'Mia Maudi', 'P', 'XI AP 3'),
('1819.10.110.334', 'Milda Marliana Hayati', 'P', 'XI AP 3'),
('1819.10.110.335', 'Mira Triana', 'P', 'XI AP 3'),
('1819.10.110.336', 'Nabilah Nada Cita', 'P', 'XI AP 3'),
('1819.10.110.337', 'Nashel Alleynisha', 'P', 'XI AP 3'),
('1819.10.110.338', 'Nayla Nafisha', 'P', 'XI AP 3'),
('1819.10.110.339', 'Nezla Nurfadila', 'P', 'XI AP 3'),
('1819.10.110.340', 'Nur Elis Juwantini', 'P', 'XI AP 3'),
('1819.10.110.342', 'Rena Renita', 'P', 'XI AP 3'),
('1819.10.110.343', 'Rini Oktaviani', 'P', 'XI AP 1'),
('1819.10.110.345', 'Rossania Anggraeni', 'P', 'XI AP 1'),
('1819.10.110.346', 'Rovhi Sonika', 'P', 'XI AP 1'),
('1819.10.110.347', 'Selviani', 'P', 'XI AP 1'),
('1819.10.110.348', 'Serli Marselinda', 'P', 'XI AP 1'),
('1819.10.110.349', 'Silvi Okta Helviani', 'P', 'XI AP 1'),
('1819.10.110.350', 'Sinta Mustika', 'P', 'XI AP 1'),
('1819.10.110.351', 'Sri Asih Lestari', 'P', 'XI AP 1'),
('1819.10.110.352', 'Sri Desvitasari', 'P', 'XI AP 1'),
('1819.10.110.353', 'Sri Setya Dewi', 'P', 'XI AP 1'),
('1819.10.110.354', 'Wildan Pratiwi', 'P', 'XI AP 1'),
('1819.10.110.355', 'Yuli Rahmawati', 'P', 'XI AP 1'),
('1819.10.110.356', 'Alvy Aulya Hasanah', 'P', 'XI AP 3'),
('1819.10.110.357', 'Amanda Humul Fhadillah', 'P', 'XI AP 3'),
('1819.10.110.358', 'Angellica Susanto', 'P', 'XI AP 3'),
('1819.10.110.359', 'Anggia Annisa Dewi', 'P', 'XI AP 3'),
('1819.10.110.360', 'Debi Sintia', 'P', 'XI AP 3'),
('1819.10.110.361', 'Devina Fitri Apriliani', 'P', 'XI AP 3'),
('1819.10.110.362', 'Elsi Sepriawati', 'P', 'XI AP 3'),
('1819.10.110.363', 'Euis Istiqomah', 'P', 'XI AP 3'),
('1819.10.110.364', 'Fitri Yani', 'P', 'XI AP 3'),
('1819.10.110.365', 'Fitriyani Komalasari', 'P', 'XI AP 3'),
('1819.10.110.367', 'Hani Rahma Wati', 'P', 'XI AP 3'),
('1819.10.110.368', 'Hany Widyasari', 'P', 'XI AP 1'),
('1819.10.110.369', 'Hikmah Fauziyah', 'P', 'XI AP 1'),
('1819.10.110.370', 'Ines Pebriani', 'P', 'XI AP 1'),
('1819.10.110.371', 'Lia Amelia', 'P', 'XI AP 1'),
('1819.10.110.372', 'Mega Patma Sari Amanah', 'P', 'XI AP 1'),
('1819.10.110.373', 'Niken Ayu Oktavia', 'P', 'XI AP 1'),
('1819.10.110.374', 'Nisa Nurfani', 'P', 'XI AP 1'),
('1819.10.110.375', 'Novia Sri Rakhmayani', 'P', 'XI AP 1'),
('1819.10.110.376', 'Nur Fitri Deani', 'P', 'XI AP 1'),
('1819.10.110.377', 'Odetha Julia', 'P', 'XI AP 1'),
('1819.10.110.378', 'Reni Anggraeni', 'P', 'XI AP 1'),
('1819.10.110.379', 'Reni Sri Rahayu', 'P', 'XI AP 1'),
('1819.10.110.380', 'Rina Maulina', 'P', 'XI AP 2'),
('1819.10.110.381', 'Riska Rohmawati', 'P', 'XI AP 2'),
('1819.10.110.382', 'Rosvina', 'P', 'XI AP 2'),
('1819.10.110.383', 'Silva Miraci', 'P', 'XI AP 2'),
('1819.10.110.384', 'Siska Nurfadilah', 'P', 'XI AP 2'),
('1819.10.110.385', 'Siti Chairunnissa', 'P', 'XI AP 2'),
('1819.10.110.386', 'Siti Mutia Rahmawati', 'P', 'XI AP 2'),
('1819.10.110.387', 'Syifa Siti Nurjannah', 'P', 'XI AP 2'),
('1819.10.110.388', 'Syifah Holifah', 'P', 'XI AP 2'),
('1819.10.110.389', 'Vina Aprilia', 'P', 'XI AP 2'),
('1819.10.110.391', 'Yanti Yulianti', 'P', 'XI AP 2'),
('1819.10.111.392', 'Adinda Putri Adhellya', 'P', 'XI AK 1'),
('1819.10.111.393', 'Ahmad Nurmansyah', 'L', 'XI AK 1'),
('1819.10.111.394', 'Aina Musyaffa', 'P', 'XI AK 1'),
('1819.10.111.395', 'Ainul Rahmawati', 'P', 'XI AK 1'),
('1819.10.111.396', 'Aliyah Nuraeni', 'P', 'XI AK 1'),
('1819.10.111.397', 'Astri Siti Fatonah', 'P', 'XI AK 2'),
('1819.10.111.398', 'Ayu Lestari', 'P', 'XI AK 2'),
('1819.10.111.399', 'Ayu Ratnasari', 'P', 'XI AK 4'),
('1819.10.111.400', 'Bella Putri Lestari', 'P', 'XI AK 1'),
('1819.10.111.401', 'Berliana Silvia Dewi', 'P', 'XI AK 1'),
('1819.10.111.402', 'Cucu Cuhaya', 'P', 'XI AK 1'),
('1819.10.111.403', 'Dena Fitriana', 'L', 'XI AK 1'),
('1819.10.111.404', 'Diniyah Azzahra', 'P', 'XI AK 1'),
('1819.10.111.405', 'Elza Fitriyani', 'P', 'XI AK 2'),
('1819.10.111.406', 'Faizal Akbar Maulana', 'L', 'XI AK 2'),
('1819.10.111.407', 'Jajang Riana', 'L', 'XI AK 2'),
('1819.10.111.408', 'Khoirunisa', 'P', 'XI AK 2'),
('1819.10.111.409', 'Lesa Fitriyani', 'P', 'XI AK 2'),
('1819.10.111.410', 'Levi Rahmawati', 'P', 'XI AK 2'),
('1819.10.111.411', 'Neneng Nurma Isna Safitri', 'P', 'XI AK 2'),
('1819.10.111.412', 'Niya Maryani', 'P', 'XI AK 2'),
('1819.10.111.413', 'Nur Adhijah Suhada', 'P', 'XI AK 3'),
('1819.10.111.414', 'Pepi Nurhasanah', 'P', 'XI AK 3'),
('1819.10.111.415', 'Pipit Septiani', 'P', 'XI AK 3'),
('1819.10.111.417', 'Rika Fauziah', 'P', 'XI AK 3'),
('1819.10.111.418', 'Rosnawati', 'P', 'XI AK 3'),
('1819.10.111.419', 'Salsabilla Sofani', 'P', 'XI AK 3'),
('1819.10.111.420', 'Seli Pahira', 'P', 'XI AK 3'),
('1819.10.111.421', 'Shellin Nur Maulidyah', 'P', 'XI AK 3'),
('1819.10.111.422', 'Silvia Komalasari', 'P', 'XI AK 4'),
('1819.10.111.423', 'Siska Ayu Anjani', 'P', 'XI AK 4'),
('1819.10.111.424', 'Siti Rodiyah', 'P', 'XI AK 4'),
('1819.10.111.425', 'Siti Sopiyaturrohmah', 'P', 'XI AK 4'),
('1819.10.111.426', 'Sri Nur Kholipah', 'P', 'XI AK 4'),
('1819.10.111.427', 'Windy Gustina', 'P', 'XI AK 4'),
('1819.10.111.428', 'Adinda', 'P', 'XI AK 2'),
('1819.10.111.429', 'Agnes Agustriani', 'P', 'XI AK 2'),
('1819.10.111.430', 'Anita Gustianingrum', 'P', 'XI AK 2'),
('1819.10.111.431', 'Beti Julianti Handoko', 'P', 'XI AK 2'),
('1819.10.111.432', 'Caecilia Dina Rosaline', 'P', 'XI AK 2'),
('1819.10.111.433', 'Dela Adharani', 'P', 'XI AK 2'),
('1819.10.111.434', 'Desti', 'P', 'XI AK 2'),
('1819.10.111.435', 'Diah Parwati', 'P', 'XI AK 2'),
('1819.10.111.437', 'Dila Sri Fadilah', 'P', 'XI AK 2'),
('1819.10.111.438', 'Eiva Nurcahyani', 'P', 'XI AK 3'),
('1819.10.111.439', 'Fitriani', 'P', 'XI AK 3'),
('1819.10.111.440', 'Gita Lindiyawati', 'P', 'XI AK 3'),
('1819.10.111.441', 'Hesty Dwi Rismayanty', 'P', 'XI AK 3'),
('1819.10.111.442', 'Imas Damayanti', 'P', 'XI AK 3'),
('1819.10.111.443', 'Laela Fitriani', 'P', 'XI AK 3'),
('1819.10.111.444', 'Liana Agustin', 'P', 'XI AK 3'),
('1819.10.111.445', 'Lutfi Meisanti', 'P', 'XI AK 3'),
('1819.10.111.446', 'Mimi Minarti', 'P', 'XI AK 3'),
('1819.10.111.447', 'Mira Lesmana', 'P', 'XI AK 3'),
('1819.10.111.448', 'Mulyati Gustina', 'P', 'XI AK 4'),
('1819.10.111.449', 'Nada Restu Alisya', 'P', 'XI AK 4'),
('1819.10.111.450', 'Nadilla Bintang Maharani', 'P', 'XI AK 4'),
('1819.10.111.451', 'Neng Ratna Sari', 'P', 'XI AK 4'),
('1819.10.111.453', 'Risa Rahmatini', 'P', 'XI AK 4'),
('1819.10.111.454', 'Sayidatul Ahlam', 'P', 'XI AK 4'),
('1819.10.111.455', 'Septia Dewi Rahayu', 'P', 'XI AK 4'),
('1819.10.111.456', 'Silfa Aril Lianti', 'P', 'XI AK 1'),
('1819.10.111.457', 'Sri Nurhayati', 'P', 'XI AK 1'),
('1819.10.111.458', 'Sri Sulastri', 'P', 'XI AK 1'),
('1819.10.111.459', 'Wimpi Wiarman', 'P', 'XI AK 1'),
('1819.10.111.460', 'Winda Apriliani', 'P', 'XI AK 1'),
('1819.10.111.461', 'Wulan Aprianti', 'P', 'XI AK 1'),
('1819.10.111.462', 'Yolanda Nur Afifah', 'P', 'XI AK 1'),
('1819.10.111.463', 'Yulisnawati', 'P', 'XI AK 1'),
('1819.10.111.464', 'Adelia Damayanti', 'P', 'XI AK 3'),
('1819.10.111.465', 'Ajeung Ayustina Prihatini', 'P', 'XI AK 3'),
('1819.10.111.466', 'Ana Lutfiah', 'P', 'XI AK 3'),
('1819.10.111.467', 'Asih Kurniasari', 'P', 'XI AK 3'),
('1819.10.111.468', 'Ati Sumiati', 'P', 'XI AK 3'),
('1819.10.111.469', 'Ayu Tri Adzhari', 'P', 'XI AK 4'),
('1819.10.111.470', 'Devina Ezar Bidari', 'P', 'XI AK 3'),
('1819.10.111.471', 'Dhea Novita Romdona', 'P', 'XI AK 3'),
('1819.10.111.472', 'Dwi Putri Nabilah', 'P', 'XI AK 3'),
('1819.10.111.473', 'Echa Natasha', 'P', 'XI AK 3'),
('1819.10.111.474', 'Egin Regina', 'P', 'XI AK 3'),
('1819.10.111.475', 'Emay Siti Maesaroh', 'P', 'XI AK 4'),
('1819.10.111.476', 'Eva Siti Nurhasanah', 'P', 'XI AK 4'),
('1819.10.111.477', 'Hana Dewi Riana Putri', 'P', 'XI AK 4'),
('1819.10.111.478', 'Hani Rohaeni', 'P', 'XI AK 4'),
('1819.10.111.479', 'Hellyda Anggaena', 'P', 'XI AK 4'),
('1819.10.111.480', 'Inka Cantika', 'P', 'XI AK 4'),
('1819.10.111.481', 'Karisma Agustin', 'P', 'XI AK 4'),
('1819.10.111.482', 'Leny Nurkhasanah', 'P', 'XI AK 4'),
('1819.10.111.483', 'Lidia Agustina', 'P', 'XI AK 4'),
('1819.10.111.484', 'Maria Annisa Fitri', 'P', 'XI AK 1'),
('1819.10.111.485', 'Maria Fatima Meylani', 'P', 'XI AK 1'),
('1819.10.111.486', 'Nela Nailus Syarifah', 'P', 'XI AK 1'),
('1819.10.111.487', 'Nova Sofia', 'P', 'XI AK 1'),
('1819.10.111.488', 'Nur Indah Lestari', 'P', 'XI AK 1'),
('1819.10.111.489', 'Pegi Kurnia', 'P', 'XI AK 1'),
('1819.10.111.490', 'Puzi Amelia', 'P', 'XI AK 1'),
('1819.10.111.491', 'Risa Marisatul Qibtiyah', 'P', 'XI AK 1'),
('1819.10.111.492', 'Sonia Nur Fariza', 'P', 'XI AK 2'),
('1819.10.111.493', 'Tini Kustini', 'P', 'XI AK 2'),
('1819.10.111.494', 'Vahra Yustiaraningsih', 'P', 'XI AK 2'),
('1819.10.111.495', 'Vinka Lutviani', 'P', 'XI AK 2'),
('1819.10.111.496', 'Vivi Lufiana Sari', 'P', 'XI AK 2'),
('1819.10.111.497', 'Wulan Suryati Ningsih', 'P', 'XI AK 2'),
('1819.10.111.498', 'Yossi Permata Sari', 'P', 'XI AK 2'),
('1819.10.111.499', 'Zidni Hidayanti', 'P', 'XI AK 2'),
('1819.10.111.500', 'Amelia Rahmah', 'P', 'XI AK 4'),
('1819.10.111.501', 'Anggun Safitri', 'P', 'XI AK 4'),
('1819.10.111.502', 'Cucun Sentari', 'P', 'XI AK 4'),
('1819.10.111.503', 'Dewi Safitri', 'P', 'XI AK 4'),
('1819.10.111.504', 'Dila Ayuningsih', 'P', 'XI AK 4'),
('1819.10.111.505', 'Dila Putriyani', 'P', 'XI AK 4'),
('1819.10.111.506', 'Dina Agustin', 'P', 'XI AK 4'),
('1819.10.111.507', 'Divani Nurbaity', 'P', 'XI AK 4'),
('1819.10.111.508', 'Dwi Apriyanti Fauziyah', 'P', 'XI AK 4'),
('1819.10.111.509', 'Effie Rahma Apratias', 'P', 'XI AK 3'),
('1819.10.111.510', 'Fitri Wulan Sari', 'P', 'XI AK 1'),
('1819.10.111.511', 'Fransiska Nita Penotalia', 'P', 'XI AK 1'),
('1819.10.111.512', 'Gebby Maulani Putri', 'P', 'XI AK 1'),
('1819.10.111.513', 'Ian Setiani', 'P', 'XI AK 1'),
('1819.10.111.514', 'Indah Purnamasari', 'P', 'XI AK 1'),
('1819.10.111.515', 'Jenita Nur Sazuany', 'P', 'XI AK 1'),
('1819.10.111.516', 'Kinanti Rhaka Dhiya Khamila', 'P', 'XI AK 1'),
('1819.10.111.517', 'Lala Nurmala', 'P', 'XI AK 1'),
('1819.10.111.518', 'Lili Suti Halimah', 'P', 'XI AK 1'),
('1819.10.111.519', 'Maya Maesaroh', 'P', 'XI AK 1'),
('1819.10.111.520', 'Mega Silvia', 'P', 'XI AK 2'),
('1819.10.111.521', 'Melli Nur Barkah', 'P', 'XI AK 2'),
('1819.10.111.522', 'Nisrina Nur Fitriyani', 'P', 'XI AK 2'),
('1819.10.111.523', 'Nur Lisnawati', 'P', 'XI AK 2'),
('1819.10.111.524', 'Putri Destilawati', 'P', 'XI AK 2'),
('1819.10.111.525', 'Putri Maharani', 'P', 'XI AK 2'),
('1819.10.111.527', 'Ria Lestari', 'P', 'XI AK 2'),
('1819.10.111.528', 'Rika Widayanti', 'P', 'XI AK 2'),
('1819.10.111.529', 'Rishma Pebrianty', 'P', 'XI AK 3'),
('1819.10.111.530', 'Sely Marsel Octafiani', 'P', 'XI AK 3'),
('1819.10.111.531', 'Sri Mulyani Safitri', 'P', 'XI AK 3'),
('1819.10.111.532', 'Tri Sri Mulyani', 'P', 'XI AK 3'),
('1819.10.111.533', 'Yolanda', 'P', 'XI AK 3'),
('1819.10.111.534', 'Yunita Almaida', 'P', 'XI AK 3'),
('1819.10.111.535', 'Yusi Nurfatimah', 'P', 'XI AK 3'),
('1819.10.115.536', 'Alifia Nur Hikmah', 'P', 'XI UPW 1'),
('1819.10.115.537', 'Ayi Nurul Husna', 'P', 'XI UPW 1'),
('1819.10.115.538', 'Cyndika Maharani', 'P', 'XI UPW 1'),
('1819.10.115.539', 'Dara Rahma Illahiya', 'P', 'XI UPW 1'),
('1819.10.115.540', 'Dea Ajeng Saputri', 'P', 'XI UPW 1'),
('1819.10.115.541', 'Dilla Nur Fadillah', 'P', 'XI UPW 1'),
('1819.10.115.542', 'Dinda Lola Nurkhodijah', 'P', 'XI UPW 1'),
('1819.10.115.543', 'Evika Amelia', 'P', 'XI UPW 2'),
('1819.10.115.544', 'Febriyanti Nur Aisyah', 'P', 'XI UPW 2'),
('1819.10.115.545', 'Gina Anggraeni', 'P', 'XI UPW 2'),
('1819.10.115.546', 'Giska Oktaviola Eltafani', 'P', 'XI UPW 2'),
('1819.10.115.547', 'Ineu Oktaviana', 'P', 'XI UPW 2'),
('1819.10.115.549', 'Intan Dwi Puspita', 'P', 'XI UPW 2'),
('1819.10.115.550', 'Juju Juhinah', 'P', 'XI UPW 1'),
('1819.10.115.551', 'Lia Prisilia', 'P', 'XI UPW 1'),
('1819.10.115.552', 'Mita Pebriyani', 'P', 'XI UPW 1'),
('1819.10.115.553', 'Mitta Rosadi', 'P', 'XI UPW 1'),
('1819.10.115.554', 'Nafa Choirotun Syahida', 'P', 'XI UPW 1'),
('1819.10.115.556', 'Nurul Haerunisa', 'P', 'XI UPW 1'),
('1819.10.115.557', 'Qanita Nurul Qolbu', 'P', 'XI UPW 1'),
('1819.10.115.558', 'Rahayu', 'P', 'XI UPW 1'),
('1819.10.115.559', 'Rani Rahmawati', 'P', 'XI UPW 1'),
('1819.10.115.560', 'Regita Amelia Yasa', 'P', 'XI UPW 2'),
('1819.10.115.561', 'Rini Annisya', 'P', 'XI UPW 2'),
('1819.10.115.562', 'Ririn Maelasari', 'P', 'XI UPW 2'),
('1819.10.115.563', 'Ritasari', 'P', 'XI UPW 2'),
('1819.10.115.564', 'Selli Suraiyyah Susandi', 'P', 'XI UPW 2'),
('1819.10.115.565', 'Siti Herlina', 'P', 'XI UPW 2'),
('1819.10.115.566', 'Suci Wulansari', 'P', 'XI UPW 2'),
('1819.10.115.567', 'Susi Meilani', 'P', 'XI UPW 2'),
('1819.10.115.568', 'Syifa Maulida', 'P', 'XI UPW 2'),
('1819.10.115.570', 'Wilda Anggraeni', 'P', 'XI UPW 2'),
('1819.10.115.571', 'Ai Emah Siti Rohimah', 'P', 'XI UPW 2'),
('1819.10.115.572', 'Aksal Haerul Cholif', 'L', 'XI UPW 2'),
('1819.10.115.573', 'Alinda Agis Ramdani', 'P', 'XI UPW 2'),
('1819.10.115.574', 'Alipah Rahmawati', 'P', 'XI UPW 1'),
('1819.10.115.575', 'Alpi Siti Nurasyah', 'P', 'XI UPW 1'),
('1819.10.115.576', 'Chika Noviana', 'P', 'XI UPW 2'),
('1819.10.115.577', 'Dea Andini', 'P', 'XI UPW 2'),
('1819.10.115.578', 'Diah Ayu Sulistianingsih', 'P', 'XI UPW 2'),
('1819.10.115.579', 'Dinda Al-Azkiah', 'P', 'XI UPW 2'),
('1819.10.115.580', 'Dinna Hanny Nuraini', 'P', 'XI UPW 2'),
('1819.10.115.581', 'Fidia Pebriani', 'P', 'XI UPW 1'),
('1819.10.115.582', 'Gina Ramdani', 'P', 'XI UPW 1'),
('1819.10.115.583', 'Iin Winabela', 'P', 'XI UPW 1'),
('1819.10.115.584', 'Iiq Nur Hikmah', 'P', 'XI UPW 1'),
('1819.10.115.585', 'Indy Fiona Susanita', 'P', 'XI UPW 1'),
('1819.10.115.586', 'Jastin Alika Chayatunnisa', 'P', 'XI UPW 1'),
('1819.10.115.587', 'Leni Juliany', 'P', 'XI UPW 2'),
('1819.10.115.588', 'Lili Rosita', 'P', 'XI UPW 2'),
('1819.10.115.589', 'Lulu Nurfalah', 'P', 'XI UPW 2'),
('1819.10.115.590', 'Luthfi Nurul Aini', 'P', 'XI UPW 2'),
('1819.10.115.591', 'Mia Azmiyah', 'P', 'XI UPW 2'),
('1819.10.115.592', 'Puspa Cinta Aby', 'P', 'XI UPW 2'),
('1819.10.115.593', 'Revi Melia', 'P', 'XI UPW 2'),
('1819.10.115.594', 'Salma Az-Zahra', 'P', 'XI UPW 2'),
('1819.10.115.595', 'Salsabila Azahra', 'P', 'XI UPW 2'),
('1819.10.115.596', 'Sandi Seftian Nugraha', 'L', 'XI UPW 2'),
('1819.10.115.597', 'Selvina', 'P', 'XI UPW 1'),
('1819.10.115.598', 'Sely Putri Dariyatni', 'P', 'XI UPW 1'),
('1819.10.115.599', 'Septian Jaelani Sidik', 'L', 'XI UPW 1'),
('1819.10.115.600', 'Silsi Tarningsih', 'P', 'XI UPW 1'),
('1819.10.115.601', 'Siti Jubaedah', 'P', 'XI UPW 1'),
('1819.10.115.602', 'Siti Nurholifah', 'P', 'XI UPW 1'),
('1819.10.115.603', 'Sri Rahayu', 'P', 'XI UPW 1'),
('1819.10.115.604', 'Tesa Aditiya', 'P', 'XI UPW 1'),
('1819.10.115.605', 'Vivi Rosa Alviani', 'P', 'XI UPW 1'),
('1819.10.115.606', 'Widya Sri Wulan', 'P', 'XI UPW 1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `autentikasi` varchar(50) NOT NULL,
  `password` char(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `id_level` char(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`autentikasi`, `password`, `nama_user`, `id_level`, `is_active`) VALUES
('1819.10.065.021', 'eb699678607c8041f465fb19ec2de4d5', 'Reza Ramadhan Kusumajaya', 'UL002', 1),
('1819.10.065.040', 'eb699678607c8041f465fb19ec2de4d5', 'David Reynaldi', 'UL002', 1),
('1819.10.065.046', 'eb699678607c8041f465fb19ec2de4d5', 'Fadly Dwi Saputra', 'UL002', 1),
('1819.10.065.051', 'eb699678607c8041f465fb19ec2de4d5', 'Lisa Suci Wulandari', 'UL002', 1),
('1819.10.065.075', 'eb699678607c8041f465fb19ec2de4d5', 'Dadan Abdilah', 'UL002', 1),
('1819.10.065.076', 'eb699678607c8041f465fb19ec2de4d5', 'Dadi Ramdani', 'UL002', 1),
('1819.10.065.090', 'eb699678607c8041f465fb19ec2de4d5', 'Muhammad Dimasputra Esa Anugrah Wibawa', 'UL002', 1),
('1819.10.065.093', 'eb699678607c8041f465fb19ec2de4d5', 'Reza Nurajizah', 'UL002', 1),
('1819.10.066.107', 'eb699678607c8041f465fb19ec2de4d5', 'Agum Pratama', 'UL002', 1),
('1819.10.066.131', 'eb699678607c8041f465fb19ec2de4d5', 'Rio Reynaldo Alfian', 'UL002', 1),
('1819.10.066.174', 'eb699678607c8041f465fb19ec2de4d5', 'Windia Suwaltifah', 'UL002', 1),
('1819.10.108.180', 'eb699678607c8041f465fb19ec2de4d5', 'Dea Ardiya', 'UL002', 1),
('1819.10.108.234', 'eb699678607c8041f465fb19ec2de4d5', 'Nida Aidatu Rohmah', 'UL002', 1),
('1819.10.110.304', 'eb699678607c8041f465fb19ec2de4d5', 'Putri Eka Pratiwi', 'UL002', 1),
('1819.10.111.406', 'eb699678607c8041f465fb19ec2de4d5', 'Faizal Akbar Maulana', 'UL002', 1),
('1819.10.111.407', 'eb699678607c8041f465fb19ec2de4d5', 'Jajang Riana', 'UL002', 1),
('1819.10.111.477', 'eb699678607c8041f465fb19ec2de4d5', 'Hana Dewi Riana Putri', 'UL002', 1),
('1819.10.111.486', 'eb699678607c8041f465fb19ec2de4d5', 'Nela Nailus Syarifah', 'UL002', 1),
('1819.10.111.487', 'eb699678607c8041f465fb19ec2de4d5', 'Nova Sofia', 'UL002', 1),
('1819.10.111.488', 'eb699678607c8041f465fb19ec2de4d5', 'Nur Indah Lestari', 'UL002', 1),
('1819.10.111.500', 'eb699678607c8041f465fb19ec2de4d5', 'Amelia Rahmah', 'UL002', 1),
('1819.10.111.507', 'eb699678607c8041f465fb19ec2de4d5', 'Divani Nurbaity', 'UL002', 1),
('1819.10.115.549', 'eb699678607c8041f465fb19ec2de4d5', 'Intan Dwi Puspita', 'UL002', 1),
('1819.10.115.558', 'eb699678607c8041f465fb19ec2de4d5', 'Rahayu', 'UL002', 1),
('1819075', '202cb962ac59075b964b07152d234b70', 'Pengurus Dadan Abdilah', 'UL002', 1),
('1920.10.065.032', 'eb699678607c8041f465fb19ec2de4d5', 'Tirania Agustin', 'UL002', 1),
('1920.10.065.039', 'eb699678607c8041f465fb19ec2de4d5', 'Alrefae Aditya Nugraha', 'UL002', 1),
('1920.10.065.047', 'eb699678607c8041f465fb19ec2de4d5', 'Dinda Maharani', 'UL002', 1),
('1920.10.065.058', 'eb699678607c8041f465fb19ec2de4d5', 'Luki Aryanto', 'UL002', 1),
('1920.10.065.065', 'eb699678607c8041f465fb19ec2de4d5', 'Salsa Agustin', 'UL002', 1),
('1920.10.065.070', 'eb699678607c8041f465fb19ec2de4d5', 'Tio Azzam Aminudin', 'UL002', 1),
('1920.10.065.100', 'eb699678607c8041f465fb19ec2de4d5', 'Rizky Aranda Putra Fauza', 'UL002', 1),
('1920.10.066.123', 'eb699678607c8041f465fb19ec2de4d5', 'Muhammad Rizalul Fauzan', 'UL002', 1),
('1920.10.066.124', 'eb699678607c8041f465fb19ec2de4d5', 'Naufal Farik Anugrah', 'UL002', 1),
('1920.10.066.129', 'eb699678607c8041f465fb19ec2de4d5', 'Rafi Zaidan Rabbani', 'UL002', 1),
('1920.10.066.166', 'eb699678607c8041f465fb19ec2de4d5', 'Muhamad  Naufal', 'UL002', 1),
('1920.10.066.168', 'eb699678607c8041f465fb19ec2de4d5', 'Nandu Alviansyah', 'UL002', 1),
('1920.10.108.202', 'eb699678607c8041f465fb19ec2de4d5', 'Nawang Wulan Ratnasari', 'UL002', 1),
('1920.10.110.345', 'eb699678607c8041f465fb19ec2de4d5', 'Najla Haya Huwaida', 'UL002', 1),
('1920.10.111.397', 'eb699678607c8041f465fb19ec2de4d5', 'Agiet Fierdha Dwi Rahma', 'UL002', 1),
('1920.10.111.398', 'eb699678607c8041f465fb19ec2de4d5', 'Alinda Dewi', 'UL002', 1),
('1920.10.111.402', 'eb699678607c8041f465fb19ec2de4d5', 'Bagus Kirana', 'UL002', 1),
('1920.10.111.446', 'eb699678607c8041f465fb19ec2de4d5', 'Dewi Rahmahwati', 'UL002', 1),
('1920.10.111.454', 'eb699678607c8041f465fb19ec2de4d5', 'Nining Musni', 'UL002', 1),
('1920.10.111.488', 'eb699678607c8041f465fb19ec2de4d5', 'Nur\'aeni', 'UL002', 1),
('1920.10.115.563', 'eb699678607c8041f465fb19ec2de4d5', 'Novi Sofiyanti', 'UL002', 1),
('1920.10.115.584', 'eb699678607c8041f465fb19ec2de4d5', 'Febrianisa Khanna', 'UL002', 1),
('1920.10.115.588', 'eb699678607c8041f465fb19ec2de4d5', 'Ira Irwanti', 'UL002', 1),
('@admins', 'd0ea19b44ee85d420d0f6ccdbfae4773', 'Admin-Dadan Abdilah', 'UL001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` char(6) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `level`) VALUES
('UL001', 'Admin'),
('UL002', 'Pengurus');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nis_pelanggar` (`nis_pelanggar`);

--
-- Indexes for table `pembina`
--
ALTER TABLE `pembina`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`autentikasi`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD CONSTRAINT `pelanggaran_ibfk_1` FOREIGN KEY (`nis_pelanggar`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembina`
--
ALTER TABLE `pembina`
  ADD CONSTRAINT `pembina_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`);

--
-- Constraints for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD CONSTRAINT `pengurus_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `user_level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
