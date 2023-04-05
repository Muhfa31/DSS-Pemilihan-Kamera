-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk dss_pemilihankamera
CREATE DATABASE IF NOT EXISTS `dss_pemilihankamera` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dss_pemilihankamera`;

-- membuang struktur untuk table dss_pemilihankamera.alternatif
CREATE TABLE IF NOT EXISTS `alternatif` (
  `idalternatif` int NOT NULL AUTO_INCREMENT,
  `nmalternatif` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idalternatif`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dss_pemilihankamera.alternatif: ~5 rows (lebih kurang)
INSERT INTO `alternatif` (`idalternatif`, `nmalternatif`) VALUES
	(1, 'Canon 80D'),
	(2, 'Canon 760D'),
	(3, 'Canon 6D'),
	(4, 'Sony Alpha 5100L'),
	(5, 'Fujifilm X-A2');

-- membuang struktur untuk table dss_pemilihankamera.bobot
CREATE TABLE IF NOT EXISTS `bobot` (
  `idbobot` int NOT NULL AUTO_INCREMENT,
  `idkriteria` int DEFAULT NULL,
  `valuebobot` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idbobot`),
  KEY `FK_bobot_kriteria` (`idkriteria`),
  CONSTRAINT `FK_bobot_kriteria` FOREIGN KEY (`idkriteria`) REFERENCES `kriteria` (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dss_pemilihankamera.bobot: ~6 rows (lebih kurang)
INSERT INTO `bobot` (`idbobot`, `idkriteria`, `valuebobot`) VALUES
	(1, 1, '0.408'),
	(2, 2, '0.241'),
	(3, 3, '0.158'),
	(4, 4, '0.102'),
	(5, 5, '0.061'),
	(6, 6, '0.027');

-- membuang struktur untuk table dss_pemilihankamera.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `idkriteria` int NOT NULL AUTO_INCREMENT,
  `nmkriteria` varchar(50) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dss_pemilihankamera.kriteria: ~6 rows (lebih kurang)
INSERT INTO `kriteria` (`idkriteria`, `nmkriteria`, `tipe`) VALUES
	(1, 'Resolusi', 'Benefit'),
	(2, 'Shutter Speed', 'Benefit'),
	(3, 'ISO Sensitivity', 'Benefit'),
	(4, 'Harga', 'Cost'),
	(5, 'Daya Tahan Baterai', 'Benefit'),
	(6, 'Berat', 'Cost');

-- membuang struktur untuk view dss_pemilihankamera.multimoora_1
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `multimoora_1` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`pra` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_2
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `multimoora_2` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`pra` DOUBLE NULL,
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_3
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `multimoora_3` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`pra` DOUBLE NULL,
	`normalisasi` DOUBLE NULL,
	`normalisasibobot` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_4
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `multimoora_4` (
	`idalternatif` INT(10) NOT NULL,
	`hasil` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.nilaimax
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `nilaimax` (
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`maksimum` INT(10) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.nilaimin
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `nilaimin` (
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`minimum` INT(10) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk table dss_pemilihankamera.penilaian
CREATE TABLE IF NOT EXISTS `penilaian` (
  `idnilai` int NOT NULL AUTO_INCREMENT,
  `idalternatif` int DEFAULT NULL,
  `idbobot` int DEFAULT NULL,
  `idskala` int DEFAULT NULL,
  PRIMARY KEY (`idnilai`),
  KEY `FK_penilaian_alternatif` (`idalternatif`),
  KEY `FK_penilaian_bobot` (`idbobot`),
  KEY `FK_penilaian_skala` (`idskala`),
  CONSTRAINT `FK_penilaian_alternatif` FOREIGN KEY (`idalternatif`) REFERENCES `alternatif` (`idalternatif`),
  CONSTRAINT `FK_penilaian_bobot` FOREIGN KEY (`idbobot`) REFERENCES `bobot` (`idbobot`),
  CONSTRAINT `FK_penilaian_skala` FOREIGN KEY (`idskala`) REFERENCES `skala` (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dss_pemilihankamera.penilaian: ~29 rows (lebih kurang)
INSERT INTO `penilaian` (`idnilai`, `idalternatif`, `idbobot`, `idskala`) VALUES
	(1, 1, 1, 3),
	(2, 1, 2, 3),
	(3, 1, 3, 3),
	(4, 1, 4, 2),
	(5, 1, 5, 3),
	(6, 1, 6, 2),
	(7, 2, 1, 3),
	(8, 2, 2, 2),
	(9, 2, 3, 2),
	(10, 2, 4, 2),
	(11, 2, 5, 2),
	(12, 2, 6, 2),
	(13, 3, 1, 3),
	(14, 3, 2, 3),
	(15, 3, 3, 2),
	(16, 3, 4, 2),
	(17, 3, 5, 2),
	(18, 3, 6, 2),
	(19, 4, 1, 2),
	(20, 4, 2, 2),
	(21, 4, 3, 2),
	(22, 4, 4, 2),
	(23, 4, 5, 1),
	(24, 4, 6, 2),
	(25, 5, 1, 2),
	(26, 5, 2, 1),
	(27, 5, 3, 1),
	(28, 5, 4, 2),
	(29, 5, 5, 1),
	(30, 5, 6, 2);

-- membuang struktur untuk table dss_pemilihankamera.skala
CREATE TABLE IF NOT EXISTS `skala` (
  `idskala` int NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `skala` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dss_pemilihankamera.skala: ~3 rows (lebih kurang)
INSERT INTO `skala` (`idskala`, `value`, `skala`) VALUES
	(1, 1, 'Tidak Direkomendasikan'),
	(2, 2, 'Direkomendasikan'),
	(3, 3, 'Sangat Direkomendasikan');

-- membuang struktur untuk view dss_pemilihankamera.topsis_maxmin
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_maxmin` (
	`idnilai` INT(10) NOT NULL,
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`maximum` DOUBLE NULL,
	`minimum` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.topsis_nilaiv
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_nilaiv` (
	`idalternatif` INT(10) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL,
	`nilaiv` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.topsis_normalisasi
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_normalisasi` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.topsis_pembagi
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_pembagi` (
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`bagi` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.topsis_sipsin
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_sipsin` (
	`idalternatif` INT(10) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.topsis_terbobot
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `topsis_terbobot` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`normalisasi` DOUBLE NULL,
	`terbobot` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.vnormalisasi
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vnormalisasi` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`normalisasi` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.vpenilaian
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vpenilaian` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.vprarangking
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vprarangking` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`normalisasi` DECIMAL(14,4) NULL,
	`prarangking` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.vrangking
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vrangking` (
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`rangking` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_jumbobot
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_jumbobot` (
	`jumlah` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_nilais
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_nilais` (
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilais` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_nilaiv
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_nilaiv` (
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilaiv` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_normalisasibobot
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_normalisasibobot` (
	`idbobot` INT(10) NOT NULL,
	`idkriteria` INT(10) NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`jumlah` DOUBLE NULL,
	`normalisasi_w` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_pangkat
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_pangkat` (
	`idnilai` INT(10) NOT NULL,
	`idalternatif` INT(10) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idkriteria` INT(10) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipe` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idbobot` INT(10) NOT NULL,
	`valuebobot` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nilai` INT(10) NULL,
	`skala` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`normalisasi_w` DOUBLE NULL,
	`pangkat` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.wp_sums
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `wp_sums` (
	`jum` DOUBLE NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_1
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `multimoora_1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `multimoora_1` AS select `vpenilaian`.`idnilai` AS `idnilai`,`vpenilaian`.`idalternatif` AS `idalternatif`,`vpenilaian`.`nmalternatif` AS `nmalternatif`,`vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,`vpenilaian`.`tipe` AS `tipe`,`vpenilaian`.`idbobot` AS `idbobot`,`vpenilaian`.`valuebobot` AS `valuebobot`,`vpenilaian`.`nilai` AS `nilai`,`vpenilaian`.`skala` AS `skala`,sqrt(sum(pow(`vpenilaian`.`nilai`,2))) AS `pra` from `vpenilaian` group by `vpenilaian`.`idkriteria`;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_2
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `multimoora_2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `multimoora_2` AS select `vpenilaian`.`idnilai` AS `idnilai`,`vpenilaian`.`idalternatif` AS `idalternatif`,`vpenilaian`.`nmalternatif` AS `nmalternatif`,`vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,`vpenilaian`.`tipe` AS `tipe`,`vpenilaian`.`idbobot` AS `idbobot`,`vpenilaian`.`valuebobot` AS `valuebobot`,`vpenilaian`.`nilai` AS `nilai`,`vpenilaian`.`skala` AS `skala`,`multimoora_1`.`pra` AS `pra`,(`vpenilaian`.`nilai` / `multimoora_1`.`pra`) AS `normalisasi` from (`vpenilaian` join `multimoora_1`) where (`multimoora_1`.`idkriteria` = `vpenilaian`.`idkriteria`) group by `vpenilaian`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_3
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `multimoora_3`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `multimoora_3` AS select `multimoora_2`.`idnilai` AS `idnilai`,`multimoora_2`.`idalternatif` AS `idalternatif`,`multimoora_2`.`nmalternatif` AS `nmalternatif`,`multimoora_2`.`idkriteria` AS `idkriteria`,`multimoora_2`.`nmkriteria` AS `nmkriteria`,`multimoora_2`.`tipe` AS `tipe`,`multimoora_2`.`idbobot` AS `idbobot`,`multimoora_2`.`valuebobot` AS `valuebobot`,`multimoora_2`.`nilai` AS `nilai`,`multimoora_2`.`skala` AS `skala`,`multimoora_2`.`pra` AS `pra`,`multimoora_2`.`normalisasi` AS `normalisasi`,(`multimoora_2`.`normalisasi` * `multimoora_2`.`valuebobot`) AS `normalisasibobot` from `multimoora_2` group by `multimoora_2`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.multimoora_4
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `multimoora_4`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `multimoora_4` AS select `multimoora_3`.`idalternatif` AS `idalternatif`,sum(`multimoora_3`.`normalisasibobot`) AS `hasil` from `multimoora_3` group by `multimoora_3`.`idalternatif`;

-- membuang struktur untuk view dss_pemilihankamera.nilaimax
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `nilaimax`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nilaimax` AS select `vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,max(`vpenilaian`.`nilai`) AS `maksimum` from `vpenilaian` group by `vpenilaian`.`idkriteria`;

-- membuang struktur untuk view dss_pemilihankamera.nilaimin
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `nilaimin`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nilaimin` AS select `vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,min(`vpenilaian`.`nilai`) AS `minimum` from `vpenilaian` group by `vpenilaian`.`idkriteria`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_maxmin
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_maxmin`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_maxmin` AS select `topsis_terbobot`.`idnilai` AS `idnilai`,`topsis_terbobot`.`idkriteria` AS `idkriteria`,`topsis_terbobot`.`nmkriteria` AS `nmkriteria`,max(`topsis_terbobot`.`terbobot`) AS `maximum`,min(`topsis_terbobot`.`terbobot`) AS `minimum` from `topsis_terbobot` group by `topsis_terbobot`.`idkriteria`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_nilaiv
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_nilaiv`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_nilaiv` AS select `topsis_sipsin`.`idalternatif` AS `idalternatif`,`topsis_sipsin`.`dplus` AS `dplus`,`topsis_sipsin`.`dmin` AS `dmin`,(`topsis_sipsin`.`dmin` / (`topsis_sipsin`.`dplus` + `topsis_sipsin`.`dmin`)) AS `nilaiv` from `topsis_sipsin` group by `topsis_sipsin`.`idalternatif`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_normalisasi
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_normalisasi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_normalisasi` AS select `vpenilaian`.`idnilai` AS `idnilai`,`vpenilaian`.`idalternatif` AS `idalternatif`,`vpenilaian`.`nmalternatif` AS `nmalternatif`,`vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,`vpenilaian`.`tipe` AS `tipe`,`vpenilaian`.`idbobot` AS `idbobot`,`vpenilaian`.`valuebobot` AS `valuebobot`,`vpenilaian`.`nilai` AS `nilai`,`vpenilaian`.`skala` AS `skala`,(`vpenilaian`.`nilai` / `topsis_pembagi`.`bagi`) AS `normalisasi` from (`vpenilaian` join `topsis_pembagi`) where (`topsis_pembagi`.`idkriteria` = `vpenilaian`.`idkriteria`) group by `vpenilaian`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_pembagi
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_pembagi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_pembagi` AS select `vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,sqrt(sum(pow(`vpenilaian`.`nilai`,2))) AS `bagi` from `vpenilaian` group by `vpenilaian`.`idkriteria`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_sipsin
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_sipsin`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_sipsin` AS select `topsis_terbobot`.`idalternatif` AS `idalternatif`,sqrt(sum(pow((`topsis_maxmin`.`maximum` - `topsis_terbobot`.`terbobot`),2))) AS `dplus`,sqrt(sum(pow((`topsis_maxmin`.`minimum` - `topsis_terbobot`.`terbobot`),2))) AS `dmin` from (`topsis_terbobot` join `topsis_maxmin`) where (`topsis_terbobot`.`idkriteria` = `topsis_maxmin`.`idkriteria`) group by `topsis_terbobot`.`idalternatif`;

-- membuang struktur untuk view dss_pemilihankamera.topsis_terbobot
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `topsis_terbobot`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `topsis_terbobot` AS select `topsis_normalisasi`.`idnilai` AS `idnilai`,`topsis_normalisasi`.`idalternatif` AS `idalternatif`,`topsis_normalisasi`.`nmalternatif` AS `nmalternatif`,`topsis_normalisasi`.`idkriteria` AS `idkriteria`,`topsis_normalisasi`.`nmkriteria` AS `nmkriteria`,`topsis_normalisasi`.`tipe` AS `tipe`,`topsis_normalisasi`.`idbobot` AS `idbobot`,`topsis_normalisasi`.`valuebobot` AS `valuebobot`,`topsis_normalisasi`.`nilai` AS `nilai`,`topsis_normalisasi`.`skala` AS `skala`,`topsis_normalisasi`.`normalisasi` AS `normalisasi`,(`bobot`.`valuebobot` * `topsis_normalisasi`.`normalisasi`) AS `terbobot` from (`topsis_normalisasi` join `bobot`) where (`bobot`.`idkriteria` = `topsis_normalisasi`.`idkriteria`) group by `topsis_normalisasi`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.vnormalisasi
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vnormalisasi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vnormalisasi` AS select `vpenilaian`.`idnilai` AS `idnilai`,`vpenilaian`.`idalternatif` AS `idalternatif`,`vpenilaian`.`nmalternatif` AS `nmalternatif`,`vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,`vpenilaian`.`tipe` AS `tipe`,`vpenilaian`.`idbobot` AS `idbobot`,`vpenilaian`.`valuebobot` AS `valuebobot`,`vpenilaian`.`nilai` AS `nilai`,`vpenilaian`.`skala` AS `skala`,(`vpenilaian`.`nilai` / `nilaimax`.`maksimum`) AS `normalisasi` from (`vpenilaian` join `nilaimax`) where (`nilaimax`.`idkriteria` = `vpenilaian`.`idkriteria`) group by `vpenilaian`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.vpenilaian
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vpenilaian`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vpenilaian` AS select `penilaian`.`idnilai` AS `idnilai`,`alternatif`.`idalternatif` AS `idalternatif`,`alternatif`.`nmalternatif` AS `nmalternatif`,`kriteria`.`idkriteria` AS `idkriteria`,`kriteria`.`nmkriteria` AS `nmkriteria`,`kriteria`.`tipe` AS `tipe`,`bobot`.`idbobot` AS `idbobot`,`bobot`.`valuebobot` AS `valuebobot`,`skala`.`value` AS `nilai`,`skala`.`skala` AS `skala` from ((((`penilaian` join `skala`) join `bobot`) join `kriteria`) join `alternatif`) where ((`penilaian`.`idalternatif` = `alternatif`.`idalternatif`) and (`penilaian`.`idbobot` = `bobot`.`idbobot`) and (`penilaian`.`idskala` = `skala`.`idskala`) and (`kriteria`.`idkriteria` = `bobot`.`idkriteria`));

-- membuang struktur untuk view dss_pemilihankamera.vprarangking
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vprarangking`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vprarangking` AS select `vnormalisasi`.`idnilai` AS `idnilai`,`vnormalisasi`.`idalternatif` AS `idalternatif`,`vnormalisasi`.`nmalternatif` AS `nmalternatif`,`vnormalisasi`.`idkriteria` AS `idkriteria`,`vnormalisasi`.`nmkriteria` AS `nmkriteria`,`vnormalisasi`.`tipe` AS `tipe`,`vnormalisasi`.`idbobot` AS `idbobot`,`vnormalisasi`.`valuebobot` AS `valuebobot`,`vnormalisasi`.`nilai` AS `nilai`,`vnormalisasi`.`skala` AS `skala`,`vnormalisasi`.`normalisasi` AS `normalisasi`,(`vnormalisasi`.`valuebobot` * `vnormalisasi`.`normalisasi`) AS `prarangking` from `vnormalisasi` group by `vnormalisasi`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.vrangking
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vrangking`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vrangking` AS select `vprarangking`.`idalternatif` AS `idalternatif`,`vprarangking`.`nmalternatif` AS `nmalternatif`,sum(`vprarangking`.`prarangking`) AS `rangking` from `vprarangking` group by `vprarangking`.`idalternatif`;

-- membuang struktur untuk view dss_pemilihankamera.wp_jumbobot
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_jumbobot`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_jumbobot` AS select sum(`bobot`.`valuebobot`) AS `jumlah` from `bobot`;

-- membuang struktur untuk view dss_pemilihankamera.wp_nilais
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_nilais`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_nilais` AS select `wp_pangkat`.`idalternatif` AS `idalternatif`,`wp_pangkat`.`nmalternatif` AS `nmalternatif`,exp(sum(log(`wp_pangkat`.`pangkat`))) AS `nilais` from `wp_pangkat` group by `wp_pangkat`.`idalternatif`;

-- membuang struktur untuk view dss_pemilihankamera.wp_nilaiv
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_nilaiv`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_nilaiv` AS select `wp_nilais`.`idalternatif` AS `idalternatif`,`wp_nilais`.`nmalternatif` AS `nmalternatif`,(`wp_nilais`.`nilais` / `wp_sums`.`jum`) AS `nilaiv` from (`wp_nilais` join `wp_sums`);

-- membuang struktur untuk view dss_pemilihankamera.wp_normalisasibobot
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_normalisasibobot`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_normalisasibobot` AS select `bobot`.`idbobot` AS `idbobot`,`bobot`.`idkriteria` AS `idkriteria`,`bobot`.`valuebobot` AS `valuebobot`,`wp_jumbobot`.`jumlah` AS `jumlah`,(`bobot`.`valuebobot` / `wp_jumbobot`.`jumlah`) AS `normalisasi_w` from (`bobot` join `wp_jumbobot`);

-- membuang struktur untuk view dss_pemilihankamera.wp_pangkat
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_pangkat`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_pangkat` AS select `vpenilaian`.`idnilai` AS `idnilai`,`vpenilaian`.`idalternatif` AS `idalternatif`,`vpenilaian`.`nmalternatif` AS `nmalternatif`,`vpenilaian`.`idkriteria` AS `idkriteria`,`vpenilaian`.`nmkriteria` AS `nmkriteria`,`vpenilaian`.`tipe` AS `tipe`,`vpenilaian`.`idbobot` AS `idbobot`,`vpenilaian`.`valuebobot` AS `valuebobot`,`vpenilaian`.`nilai` AS `nilai`,`vpenilaian`.`skala` AS `skala`,`wp_normalisasibobot`.`normalisasi_w` AS `normalisasi_w`,pow(`vpenilaian`.`nilai`,`wp_normalisasibobot`.`normalisasi_w`) AS `pangkat` from (`vpenilaian` join `wp_normalisasibobot`) where (`wp_normalisasibobot`.`idkriteria` = `vpenilaian`.`idkriteria`) group by `vpenilaian`.`idnilai`;

-- membuang struktur untuk view dss_pemilihankamera.wp_sums
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `wp_sums`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_sums` AS select sum(`wp_nilais`.`nilais`) AS `jum` from `wp_nilais`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
