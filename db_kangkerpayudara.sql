-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kangkerpayudara`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `gejala`) VALUES
(1, 'MUNCULNYA BENJOLAN'),
(2, 'PENEBALAN DI PAYUDARA ATAU KETIAK'),
(3, 'PERUBAHAN UKURAN ATAU BENTUK'),
(4, 'KELUARNYA CAIRAN DARI KUPING'),
(5, 'PERUBAHAN WARNA PAYUDARA'),
(6, 'KULIT PAYUDARA BERLESUNG, MENGERUT, ATAU MENEBAL'),
(7, 'BENJOLAN BISA DIGERAKAN DENGAN MUDAH'),
(8, 'PEMBENGKAKAN SALAH SATU PAYUDARA'),
(9, 'UKURAN BENJOLAN MELEBIHI 2CM TAPI KURANG DARI 5CM '),
(10, 'PENYEBARAN KANKER KEKELENJAR GETAH BENING DAERAH LENGAN'),
(11, 'BENJOLAN BERUKURAN LEBIH DARI 5CM'),
(12, 'PENYEBARAN KANKER KEKELENJAR GETAH BENING DI SKITAR PAYUDARA'),
(13, 'METASTASIS TULANG '),
(14, 'METASTASIS PARU-PARU'),
(15, 'METASTASIS HATI'),
(16, 'METASTASIS OTAK'),
(17, 'METASTASIS KELENJAR GETAH BENING');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `penyakit` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `penyakit`) VALUES
(1, 'Kanker payudara invasive sel kanker telah menyebar ke luar saluran ke jaringan sekitar payudara'),
(2, 'Kanker payudara noninvasif kondisi ketika sel kanker tumbuh dan menetap di lokasi asalnya, yakni payudara dan tidak menyebar.'),
(3, 'Stadium 1 Stadium awal kanker payudara adalah ketika sel kanker belum menyebar luas ke area lain. Pada tahap ini, kanker sudah menyebar ke jaringan sekitar tapi masih di area yang relatif kecil.'),
(4, 'Stadium 2 Kanker payudara stadium 2 berarti kanker berada di payudara atau di kelenjar getah bening di dekatnya, atau keduanya.'),
(5, 'Stadium 3 Kanker stadium 3 berarti kanker payudara telah meluas melampaui area tumor  dan  mungkin telah menyerang kelenjar getah bening dan otot di dekatnya, namun belum menyebar ke organ yang jauh.'),
(6, 'Stadium 4 kanker payudara stadium IV, adalah bentuk kanker payudara stadium akhir di mana sel-sel kanker telah menyebar (bermetastasis) ke luar payudara.');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_gejala` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_gejala`, `id_penyakit`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 3, 1),
(7, 3, 2),
(8, 3, 3),
(9, 4, 2),
(10, 4, 3),
(11, 5, 2),
(12, 5, 3),
(13, 6, 2),
(14, 6, 3),
(15, 7, 3),
(16, 8, 3),
(17, 9, 4),
(18, 10, 3),
(19, 11, 5),
(20, 12, 4),
(21, 13, 6),
(22, 14, 6),
(23, 15, 6),
(24, 16, 6),
(25, 17, 6),
(26, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `solusi` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_penyakit`, `solusi`) VALUES
(1, 1, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI\r\n- TERAPI PENYINARAN\r\n- KEMOTRAPIS\r\n_ OBAT PENGHAMBAT HORMON'),
(2, 2, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI\r\n- TERAPI PENYINARAN\r\n- KEMOTRAPIS\r\n_ OBAT PENGHAMBAT HORMON'),
(3, 3, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI\r\n- TERAPI PENYINARAN\r\n- KEMOTRAPIS\r\n_ OBAT PENGHAMBAT HORMON'),
(4, 4, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI\r\n- TERAPI PENYINARAN\r\n- KEMOTRAPIS\r\n_ OBAT PENGHAMBAT HORMON'),
(5, 5, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI- TERAPI PENYINARAN- KEMOTRAPIS_ OBAT PENGHAMBAT HORMON'),
(6, 6, '- OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI\r\n- TERAPI PENYINARAN\r\n- KEMOTRAPIS\r\n_ OBAT PENGHAMBAT HORMON');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `nama`, `email`, `alamat`, `tgl_lahir`, `password`) VALUES
(2, 0, 'admin', 'admin@gmail.com', 'Tabanan', '2020-04-17', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS7jTDSD4ufe'),
(15, 1, 'sapta', 'sapta1111@gmail.com', 'cilegon', '2024-02-01', '$2y$10$J6MpkDCjA5y2gDpiOmkWlOuGbKS7syiJW3GwvBJ6s/e7NFUKAqmZO'),
(16, 2, 'Dokter sapta', 'sapta1111@gmail.com', 'cilegon', '2024-04-10', '$2y$10$jAEsfuSs9fuA6su5DdB5A.I7yE3iout2aDL/ADvoz.UavzVKRKqt6'),
(17, 1, 'danu', 'danu@gamil.com', 'serang', '2024-07-12', '$2y$10$ccyP/dBCi/zIEdOFQVKCQuMzsdRiAoOrHgP0qCYlnWG85gP4Z3RQS'),
(18, 1, 'munawir', 'munawir@gmail.COM', 'mancak', '2024-07-25', '$2y$10$567Moek.6UF/Kbcj3mobvuVpsMCW4RAEcxJjdjHTTSBpw3AFDm9T.'),
(19, 1, 'zeus', 'zeus@gmail.com', 'serang', '2024-07-10', '$2y$10$bDl14H0WNtWjgfF.jB8byekOz4Ls7EGNOhNV2R4C7GPTndo0c5xuK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`),
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);

--
-- Constraints for table `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
