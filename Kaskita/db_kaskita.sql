-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2026 at 10:07 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kaskita`
--

-- --------------------------------------------------------

--
-- Table structure for table `bendahara`
--

CREATE TABLE `bendahara` (
  `id_bendahara` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_bendahara` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bendahara`
--

INSERT INTO `bendahara` (`id_bendahara`, `id_user`, `nama_bendahara`) VALUES
(1, 1, 'Bendahara');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `id_user` int NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `id_user`, `nim`, `nama_mahasiswa`, `no_hp`, `status`) VALUES
(2, 3, '2530521009', 'Raihannisa Fadhilah', '087814993781', 'Aktif'),
(3, 4, '2530521002', 'M. Alif Al-Qirsyi', '087814993781', 'Aktif'),
(4, 5, '2530521024', 'Muhammad Farell Pahlepy', '08123457907', 'Aktif'),
(5, 6, '2530521008', 'Ahmad Gabriel Omar Surya Aranzadi', '0987654322', 'Aktif'),
(6, 7, '2530521001', 'Azizah Hadiqatul Islam', '0908973t273', 'Aktif'),
(7, 8, '2530521007', 'khaila salinaza', '0978637823', 'Aktif'),
(10, 11, '2530521013', 'Suci Aulia Supriatna', '08789238402', 'Aktif'),
(11, 12, '2530521010', 'Yunanda', '087856749273', 'Aktif'),
(12, 13, '2530521014', 'Nurrifani', '09638938778', 'Aktif'),
(13, 14, '2530521026', 'Mohamad Arya zulhaz', '083879704089', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `metode`
--

CREATE TABLE `metode` (
  `id_metode` int NOT NULL,
  `nama_metode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `metode`
--

INSERT INTO `metode` (`id_metode`, `nama_metode`) VALUES
(1, 'Transfer'),
(2, 'QRIS'),
(3, 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_tagihan_mahasiswa` int NOT NULL,
  `id_metode` int NOT NULL,
  `nominal_pembayaran` decimal(12,2) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `status_pembayaran` enum('menunggu','disetujui','ditolak') DEFAULT 'menunggu',
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `status` enum('menunggu','disetujui','ditolak') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_tagihan_mahasiswa`, `id_metode`, `nominal_pembayaran`, `tanggal_pembayaran`, `status_pembayaran`, `bukti_pembayaran`, `status`) VALUES
(1, 5, 3, 6000.00, '2026-11-14', 'disetujui', 'bukti_6af7bd5492fc0.png', 'disetujui'),
(2, 3, 3, 6000.00, '2026-11-28', 'disetujui', NULL, 'disetujui'),
(3, 21, 3, 6000.00, '2026-11-12', 'disetujui', 'bukti_6af8d88185623.png', 'disetujui'),
(4, 9, 2, 6000.00, '2026-11-16', 'disetujui', 'bukti_6af8ff10f2dfc.png', 'disetujui'),
(5, 8, 2, 6000.00, '2026-11-16', 'disetujui', 'bukti_6af9002674646.png', 'disetujui'),
(6, 23, 3, 6000.00, '2026-11-05', 'disetujui', NULL, 'disetujui'),
(7, 30, 1, 6000.00, '2026-12-02', 'disetujui', NULL, 'disetujui'),
(8, 31, 2, 6000.00, '2026-11-15', 'disetujui', 'bukti_6af92ad43b2ce.png', 'disetujui'),
(9, 34, 2, 5000.00, '2026-11-11', 'disetujui', NULL, 'disetujui'),
(10, 48, 3, 6000.00, '2026-11-15', 'disetujui', 'bukti_6af93adad9713.png', 'disetujui'),
(11, 70, 3, 6000.00, '2026-11-15', 'disetujui', NULL, 'disetujui'),
(12, 92, 2, 6000.00, '2026-11-15', 'menunggu', NULL, 'menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int NOT NULL,
  `nama_tagihan` varchar(100) NOT NULL,
  `nominal_tagihan` decimal(12,2) NOT NULL,
  `tanggal_tagihan` date NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `status` enum('aktif','selesai') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nama_tagihan`, `nominal_tagihan`, `tanggal_tagihan`, `jatuh_tempo`, `status`) VALUES
(1, 'Kas Desember 2026', 6000.00, '2026-12-01', '2026-12-25', 'aktif'),
(2, 'Kas Januari 2027', 6000.00, '2027-01-01', '2027-01-25', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_kas`
--

CREATE TABLE `tagihan_kas` (
  `id_tagihan` int NOT NULL,
  `nama_tagihan` varchar(100) NOT NULL,
  `nominal_tagihan` decimal(12,2) NOT NULL,
  `tanggal_tagihan` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `status_tagihan` enum('aktif','selesai') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tagihan_kas`
--

INSERT INTO `tagihan_kas` (`id_tagihan`, `nama_tagihan`, `nominal_tagihan`, `tanggal_tagihan`, `tanggal_jatuh_tempo`, `status_tagihan`) VALUES
(1, 'Kas November 2026', 6000.00, '2026-11-25', '2026-11-25', 'aktif'),
(2, 'Kas Desember 2026', 6000.00, '2026-12-25', '2026-12-25', 'aktif'),
(3, 'Kas Januari 2027', 6000.00, '2027-01-25', '2027-01-25', 'aktif'),
(5, 'Ngeliwet', 5000.00, '2026-11-15', '2026-11-30', 'aktif'),
(6, 'Kas Februari 2027', 6000.00, '2026-11-15', '2027-02-25', 'aktif'),
(7, 'Iuran Wisuda', 10000.00, '2026-11-15', '2026-11-30', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_mahasiswa`
--

CREATE TABLE `tagihan_mahasiswa` (
  `id_tagihan_mahasiswa` int NOT NULL,
  `id_mahasiswa` int NOT NULL,
  `id_tagihan` int NOT NULL,
  `status_tagihan` enum('Belum Dibayar','Sudah Dibayar') DEFAULT 'Belum Dibayar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tagihan_mahasiswa`
--

INSERT INTO `tagihan_mahasiswa` (`id_tagihan_mahasiswa`, `id_mahasiswa`, `id_tagihan`, `status_tagihan`) VALUES
(3, 2, 1, 'Belum Dibayar'),
(4, 3, 1, 'Belum Dibayar'),
(5, 4, 1, 'Belum Dibayar'),
(8, 2, 3, 'Belum Dibayar'),
(9, 2, 2, 'Belum Dibayar'),
(10, 3, 3, 'Belum Dibayar'),
(11, 3, 2, 'Belum Dibayar'),
(12, 4, 3, 'Belum Dibayar'),
(13, 4, 2, 'Belum Dibayar'),
(21, 5, 1, 'Belum Dibayar'),
(22, 5, 2, 'Belum Dibayar'),
(23, 5, 3, 'Belum Dibayar'),
(24, 6, 2, 'Belum Dibayar'),
(25, 6, 1, 'Belum Dibayar'),
(30, 10, 1, 'Belum Dibayar'),
(31, 10, 2, 'Belum Dibayar'),
(32, 10, 3, 'Belum Dibayar'),
(34, 2, 5, 'Belum Dibayar'),
(35, 3, 5, 'Belum Dibayar'),
(36, 4, 5, 'Belum Dibayar'),
(37, 5, 5, 'Belum Dibayar'),
(38, 6, 5, 'Belum Dibayar'),
(39, 7, 5, 'Belum Dibayar'),
(42, 10, 5, 'Belum Dibayar'),
(48, 11, 1, 'Belum Dibayar'),
(49, 11, 2, 'Belum Dibayar'),
(50, 11, 3, 'Belum Dibayar'),
(51, 11, 5, 'Belum Dibayar'),
(55, 2, 6, 'Belum Dibayar'),
(56, 3, 6, 'Belum Dibayar'),
(57, 4, 6, 'Belum Dibayar'),
(58, 5, 6, 'Belum Dibayar'),
(59, 6, 6, 'Belum Dibayar'),
(60, 7, 6, 'Belum Dibayar'),
(61, 10, 6, 'Belum Dibayar'),
(62, 11, 6, 'Belum Dibayar'),
(70, 12, 1, 'Belum Dibayar'),
(71, 12, 2, 'Belum Dibayar'),
(72, 12, 3, 'Belum Dibayar'),
(73, 12, 5, 'Belum Dibayar'),
(74, 12, 6, 'Belum Dibayar'),
(77, 2, 7, 'Belum Dibayar'),
(78, 3, 7, 'Belum Dibayar'),
(79, 4, 7, 'Belum Dibayar'),
(80, 5, 7, 'Belum Dibayar'),
(81, 6, 7, 'Belum Dibayar'),
(82, 7, 7, 'Belum Dibayar'),
(83, 10, 7, 'Belum Dibayar'),
(84, 11, 7, 'Belum Dibayar'),
(85, 12, 7, 'Belum Dibayar'),
(92, 13, 1, 'Belum Dibayar'),
(93, 13, 2, 'Belum Dibayar'),
(94, 13, 3, 'Belum Dibayar'),
(95, 13, 5, 'Belum Dibayar'),
(96, 13, 6, 'Belum Dibayar'),
(97, 13, 7, 'Belum Dibayar');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_kas`
--

CREATE TABLE `transaksi_kas` (
  `id_transaksi` int NOT NULL,
  `id_pembayaran` int DEFAULT NULL,
  `nominal_transaksi` decimal(12,2) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jenis_transaksi` enum('pemasukan','pengeluaran') NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_kas`
--

INSERT INTO `transaksi_kas` (`id_transaksi`, `id_pembayaran`, `nominal_transaksi`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan`) VALUES
(1, NULL, 60000.00, '2026-11-12', 'pengeluaran', 'jajan'),
(2, NULL, 200000.00, '2026-11-14', 'pemasukan', 'Dana Hibah'),
(3, 4, 6000.00, '2026-11-16', 'pemasukan', 'Pembayaran Kas Desember 2026 - Raihannisa Fadhilah'),
(4, 5, 6000.00, '2026-11-16', 'pemasukan', 'Pembayaran Kas Januari 2027 - Raihannisa Fadhilah'),
(5, 6, 6000.00, '2026-11-05', 'pemasukan', 'Pembayaran Kas Januari 2027 - Ahmad Gabriel Omar Surya Aranzadi'),
(6, 8, 6000.00, '2026-11-15', 'pemasukan', 'Pembayaran Kas Desember 2026 - Suci Aulia Supriatna'),
(7, 7, 6000.00, '2026-12-02', 'pemasukan', 'Pembayaran Kas November 2026 - Suci Aulia Supriatna'),
(8, 9, 5000.00, '2026-11-11', 'pemasukan', 'Pembayaran Ngeliwet - Raihannisa Fadhilah'),
(9, 10, 6000.00, '2026-11-15', 'pemasukan', 'Pembayaran Kas November 2026 - Yunanda'),
(10, 11, 6000.00, '2026-11-15', 'pemasukan', 'Pembayaran Kas November 2026 - Nurrifani'),
(11, NULL, 100000.00, '2026-11-15', 'pemasukan', 'bayar kas setahun');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('bendahara','mahasiswa') NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `nama`) VALUES
(1, 'bendahara', '12345', 'bendahara', 'Bendahara'),
(3, '2530521009', 'nisa3227', 'mahasiswa', 'Raihannisa Fadhilah'),
(4, '2530521002', 'alif123', 'mahasiswa', 'M. Alif Al-Qirsyi'),
(5, '2530521024', 'apenn', 'mahasiswa', 'Muhammad Farell Pahlepy'),
(6, '2530521008', 'anjay', 'mahasiswa', 'Ahmad Gabriel Omar Surya Aranzadi'),
(7, '2530521001', 'jijah', 'mahasiswa', 'Azizah Hadiqatul Islam'),
(8, '2530521007', NULL, 'mahasiswa', 'khaila salinaza'),
(11, '2530521013', 'suci123', 'mahasiswa', 'Suci Aulia Supriatna'),
(12, '2530521010', '1234567', 'mahasiswa', 'Yunanda'),
(13, '2530521014', '09876', 'mahasiswa', 'Nurrifani'),
(14, '2530521026', 'Aryayaya', 'mahasiswa', 'Mohamad Arya zulhaz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bendahara`
--
ALTER TABLE `bendahara`
  ADD PRIMARY KEY (`id_bendahara`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `metode`
--
ALTER TABLE `metode`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_tagihan_mahasiswa` (`id_tagihan_mahasiswa`),
  ADD KEY `id_metode` (`id_metode`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tagihan_kas`
--
ALTER TABLE `tagihan_kas`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  ADD PRIMARY KEY (`id_tagihan_mahasiswa`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_tagihan` (`id_tagihan`);

--
-- Indexes for table `transaksi_kas`
--
ALTER TABLE `transaksi_kas`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bendahara`
--
ALTER TABLE `bendahara`
  MODIFY `id_bendahara` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `metode`
--
ALTER TABLE `metode`
  MODIFY `id_metode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tagihan_kas`
--
ALTER TABLE `tagihan_kas`
  MODIFY `id_tagihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  MODIFY `id_tagihan_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `transaksi_kas`
--
ALTER TABLE `transaksi_kas`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bendahara`
--
ALTER TABLE `bendahara`
  ADD CONSTRAINT `bendahara_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_tagihan_mahasiswa`) REFERENCES `tagihan_mahasiswa` (`id_tagihan_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_metode`) REFERENCES `metode` (`id_metode`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  ADD CONSTRAINT `tagihan_mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tagihan_mahasiswa_ibfk_2` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan_kas` (`id_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_kas`
--
ALTER TABLE `transaksi_kas`
  ADD CONSTRAINT `transaksi_kas_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
