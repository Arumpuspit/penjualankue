-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.33 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table dbhaven.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table dbhaven.admin: ~1 rows (approximately)
INSERT INTO `admin` (`id`, `username`, `password`) VALUES
	(1, 'admin', '$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626');

-- Dumping structure for table dbhaven.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL,
  PRIMARY KEY (`kode_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbhaven.customer: ~4 rows (approximately)
INSERT INTO `customer` (`kode_customer`, `nama`, `email`, `username`, `password`, `telp`) VALUES
	('C0003', 'Nagita Silvana', 'bambang@gmail.com', 'Nagita', '$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C', '087804616097'),
	('C0004', 'Nadiya', 'nadiya@gmail.com', 'nadiya', '$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG', '0898765432'),
	('C0005', 'arum puspita', 'aparumpuspita@gmail.com', 'arum123', '$2y$10$AgR/I4NGSWI3C7N55XoTt.1wKkW4EWyjUjmj9W9A6y2KuLepL.z5K', '088666777888'),
	('C0006', 'Al humayroh', 'alhumayroh@gmail.com', 'humayroh', '$2y$10$ffVi4rhZQQ1XViq7M3VZCOH/VGBAKbgsjT.rVKgoqmBV/D5yIVCxe', '08876549999');

-- Dumping structure for table dbhaven.keranjang
DROP TABLE IF EXISTS `keranjang`;
CREATE TABLE IF NOT EXISTS `keranjang` (
  `id_keranjang` int NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `harga` int NOT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbhaven.keranjang: ~2 rows (approximately)
INSERT INTO `keranjang` (`id_keranjang`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`) VALUES
	(16, 'C0003', 'P0002', 'Maryam', 5, 15000),
	(17, 'C0003', 'P0003', 'Kue tart coklat', 2, 100000);

-- Dumping structure for table dbhaven.produk
DROP TABLE IF EXISTS `produk`;
CREATE TABLE IF NOT EXISTS `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int NOT NULL,
  PRIMARY KEY (`kode_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbhaven.produk: ~3 rows (approximately)
INSERT INTO `produk` (`kode_produk`, `nama`, `image`, `deskripsi`, `harga`) VALUES
	('P0002', 'Cup cake red velvet', '6677e1ef668cd.jpg', '									Cup cake red velvet\r\n												', 20000),
	('P0004', 'Soft Cookies Coklat', '6677e20588cf9.jpg', 'Soft Cookies rasa coklat dengan coklat premium tidak terlalu manis tapi penuh cinta.\r\n			', 25000),
	('P0005', 'Nastar', '6677e21891a89.jpg', 'Kue Lebaran Nastar\r\n			', 90000);

-- Dumping structure for table dbhaven.produksi
DROP TABLE IF EXISTS `produksi`;
CREATE TABLE IF NOT EXISTS `produksi` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int NOT NULL,
  `harga` int NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbhaven.produksi: ~14 rows (approximately)
INSERT INTO `produksi` (`id_order`, `invoice`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `status`, `tanggal`, `provinsi`, `kota`, `alamat`, `kode_pos`, `terima`, `tolak`, `cek`) VALUES
	(14, 'INV0005', 'C0005', 'P0002', 'Maryam', 1, 15000, '0', '2024-06-16', 'jawa timur', 'magetan', 'kinandang', '7777', '1', '0', 0),
	(15, 'INV0005', 'C0005', 'P0001', 'Roti Sobek', 1, 10000, '0', '2024-06-16', 'jawa timur', 'magetan', 'kinandang', '7777', '1', '0', 0),
	(16, 'INV0006', 'C0005', 'P0001', 'Roti Sobek', 1, 10000, 'Pesanan Baru', '2024-06-16', 'jawa timur', 'magetan', 'kinandang', '7777', '2', '1', 0),
	(17, 'INV0006', 'C0005', 'P0003', 'Kue tart coklat', 1, 100000, 'Pesanan Baru', '2024-06-16', 'jawa timur', 'magetan', 'kinandang', '7777', '2', '1', 0),
	(18, 'INV0006', 'C0005', 'P0002', 'Maryam', 1, 15000, 'Pesanan Baru', '2024-06-16', 'jawa timur', 'magetan', 'kinandang', '7777', '2', '1', 0),
	(19, 'INV0007', 'C0005', 'P0002', 'Maryam', 1, 15000, '0', '2024-06-16', '', '', '', '', '1', '0', 0),
	(20, 'INV0008', 'C0005', 'P0002', 'Cup cake red velvet', 0, 20000, '0', '2024-06-16', 'jabar', 'tanggerang', 'madiun', '88888', '1', '0', 0),
	(21, 'INV0009', 'C0005', 'P0002', 'Cup cake red velvet', 1, 20000, 'Pesanan Baru', '2024-06-16', 'jawa timur', 'Bekasi', 'Malang', '9999', '2', '1', 0),
	(22, 'INV0009', 'C0005', 'P0005', 'Nastar', 3, 90000, 'Pesanan Baru', '2024-06-16', 'jawa timur', 'Bekasi', 'Malang', '9999', '2', '1', 0),
	(23, 'INV0010', 'C0005', 'P0003', 'Kue tart coklat', 0, 100000, '0', '2024-06-17', 'jakarta', 'madiun', 'sulawesi', '8909', '1', '0', 0),
	(24, 'INV0010', 'C0005', 'P0004', 'Soft Cookies Coklat', 0, 25000, '0', '2024-06-17', 'jakarta', 'madiun', 'sulawesi', '8909', '1', '0', 0),
	(25, 'INV0011', 'C0005', 'P0002', 'Cup cake red velvet', 1, 20000, 'Pesanan Baru', '2024-06-23', 'jawa timur', 'magetan', 'sulawesi', '66789', '2', '1', 0),
	(26, 'INV0012', 'C0005', 'P0003', 'Kue tart coklat', 2, 100000, '0', '2024-06-23', 'jatim', 'magetan', 'kinandang', '7777', '1', '0', 0),
	(27, 'INV0013', 'C0005', 'P0002', 'Cup cake red velvet', 2, 20000, 'Pesanan Baru', '2024-06-23', 'jakarta', 'magetan', 'Malang', '66789', '0', '0', 0),
	(28, 'INV0014', 'C0006', 'P0004', 'Soft Cookies Coklat', 1, 25000, 'Pesanan Baru', '2024-06-23', 'jabar', 'bekasi', 'kinandang', '7777', '0', '0', 0),
	(29, 'INV0014', 'C0006', 'P0002', 'Cup cake red velvet', 2, 20000, 'Pesanan Baru', '2024-06-23', 'jabar', 'bekasi', 'kinandang', '7777', '0', '0', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
