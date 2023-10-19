-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Okt 2023 pada 07.56
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek_pratama`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL,
  `khasiat` varchar(255) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama`, `harga`, `stok`, `kategory`, `khasiat`, `expired`) VALUES
(1, 'Antimo', 5000, 5, 'obat bebas', 'Untuk mabuk perjalanan', '2023-10-31'),
(2, 'Tramadol', 1500, 10, 'obat keras', 'Untuk penenang saat gelisah', '2024-01-26'),
(3, 'Intisari', 55000, 20, 'jamu', 'obat penghangat', '2024-03-02'),
(4, 'Bodrex anggur', 2000, 25, 'obat bebas', 'pusing', '2023-11-11'),
(5, 'Oralit', 2500, 15, 'obat bebas', 'untuk sakit perut', '2024-01-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_obat`, `tanggal`, `jumlah_obat`) VALUES
(13, 1, '2023-10-18 06:22:29', 3),
(14, 2, '2023-10-18 06:22:37', 5),
(15, 3, '2023-10-18 06:22:46', 2),
(16, 4, '2023-10-18 06:22:53', 10),
(17, 5, '2023-10-18 06:23:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `level` enum('pegawai','apoteker','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(1, 'Sultan Abrar', 'pegawai4', 'ee11cbb19052e40b07aac0ca060c23ee', 'pegawai'),
(2, 'Aproy', 'pegawai3', 'ee11cbb19052e40b07aac0ca060c23ee', 'pegawai'),
(3, 'Baim Lazuardi', 'pegawai2', 'ee11cbb19052e40b07aac0ca060c23ee', 'pegawai'),
(4, 'Rizky Banyak Duit', 'pegawai1', 'ee11cbb19052e40b07aac0ca060c23ee', 'pegawai'),
(5, 'Jeremiahh', 'apoteker', 'ee11cbb19052e40b07aac0ca060c23ee', 'apoteker'),
(6, 'Supri Ramadhani', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
