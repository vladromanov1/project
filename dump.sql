-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.55 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных bd_vlad
CREATE DATABASE IF NOT EXISTS `bd_vlad` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_vlad`;


-- Дамп структуры для таблица bd_vlad.tbl_mark
CREATE TABLE IF NOT EXISTS `tbl_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(10) NOT NULL,
  `factory_number` varchar(20) NOT NULL,
  `board_number` varchar(20) DEFAULT NULL,
  `data` date NOT NULL,
  `data_last_inspection` date DEFAULT NULL,
  `pass` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_mark_tbl_pass_auto` (`pass`),
  CONSTRAINT `FK_tbl_mark_tbl_pass_auto` FOREIGN KEY (`pass`) REFERENCES `tbl_pass_auto` (`state_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bd_vlad.tbl_mark: ~20 rows (приблизительно)
/*!40000 ALTER TABLE `tbl_mark` DISABLE KEYS */;
INSERT INTO `tbl_mark` (`id`, `color`, `factory_number`, `board_number`, `data`, `data_last_inspection`, `pass`) VALUES
	(1, 'Blue', 'WBAKM21050C22YC45', NULL, '2010-01-01', '2017-05-20', 'A001AA'),
	(2, 'Gray', 'WDD2120831A10AH72', NULL, '2012-01-01', '2017-04-15', 'B011BB'),
	(3, 'Black', 'WB372J501CV22YC45', NULL, '2014-01-01', '2017-03-25', 'K111KK'),
	(4, 'Gray', 'WVWWWW1K0BWN97G10', NULL, '2011-01-01', '2017-05-14', 'T207AB'),
	(5, 'Gray', 'XW8AJ6NE7EN123U72', NULL, '2014-01-01', '2017-01-17', 'K826AT'),
	(6, 'Silver', 'WM0AB53E78H64KL72', NULL, '2012-01-01', '2017-05-07', 'E666KT'),
	(7, 'Green', 'SAJAA06M29F01RT82', NULL, '2008-01-01', '2017-04-12', 'B100AK'),
	(8, 'Silver', 'X9FDXXEE5DE834U54', NULL, '2014-01-01', '2017-03-21', 'T012EO'),
	(9, 'Silver', 'NCJBA95FD4FG5TY74', NULL, '2008-01-01', '2017-04-28', 'K720TO'),
	(10, 'Gray', 'ZH1VI13SA65P99R01', NULL, '2010-01-01', '2017-05-05', 'A352OK'),
	(11, 'Black', 'Z94CT41D3FR44WO59', NULL, '2015-01-01', '2017-02-11', 'M708HK'),
	(12, 'Black', '1C4PJMCB0EW11JL01', NULL, '2014-01-01', '2017-04-17', 'H807MT'),
	(13, 'White', '1C4HJWBG5GL08RW11', NULL, '2016-01-01', '2017-04-30', 'A055MB'),
	(14, 'Red', 'V64TY83H065WE1X89', NULL, '2013-01-01', '2017-05-01', 'B066AO'),
	(15, 'Blue', 'X7LLSRB23CH890F52', NULL, '2016-01-01', '2017-03-31', 'A077EO'),
	(16, 'Beige', 'SB1BP56L50E67JK55', NULL, '2008-01-01', '2017-03-27', 'E120TO'),
	(17, 'Black', 'BW23LF6HJ957C16Y78', NULL, '2008-01-01', '2017-05-13', 'T132HM'),
	(18, 'Black', 'WAUZZZ4H1EN348N65', NULL, '2014-01-01', '2017-05-23', 'M321AB'),
	(19, 'White', 'XWEFU411UD0K7QE20', NULL, '2008-01-01', '2017-04-09', 'K564TK'),
	(20, 'Black', 'SALWA2EF2EA90IO12', NULL, '2014-01-01', '2017-04-21', 'B765AB');
/*!40000 ALTER TABLE `tbl_mark` ENABLE KEYS */;


-- Дамп структуры для таблица bd_vlad.tbl_pass_auto
CREATE TABLE IF NOT EXISTS `tbl_pass_auto` (
  `state_number` varchar(9) NOT NULL,
  `mark` varchar(15) NOT NULL,
  `year_release` date NOT NULL,
  `date_registation` date DEFAULT NULL,
  `master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`state_number`),
  KEY `FK_tbl_pass_auto_tbl_pass_driver` (`master_id`),
  CONSTRAINT `FK_tbl_pass_auto_tbl_pass_driver` FOREIGN KEY (`master_id`) REFERENCES `tbl_pass_driver` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bd_vlad.tbl_pass_auto: ~20 rows (приблизительно)
/*!40000 ALTER TABLE `tbl_pass_auto` DISABLE KEYS */;
INSERT INTO `tbl_pass_auto` (`state_number`, `mark`, `year_release`, `date_registation`, `master_id`) VALUES
	('A001AA', 'BMW', '2010-01-01', '2010-05-07', 1),
	('A055MB', 'Jeep', '2016-01-01', '2016-07-28', 13),
	('A077EO', 'Kia', '2016-01-01', '2016-08-20', 15),
	('A352OK', 'Volvo', '2010-01-01', '2010-06-04', 10),
	('B011BB', 'Mercedes-Benz', '2012-01-01', '2012-03-15', 2),
	('B066AO', 'Mazda', '2013-01-01', '2016-05-23', 14),
	('B100AK', 'Jaguar', '2008-01-01', '2008-09-30', 7),
	('B765AB', 'Land Rover', '2014-01-01', '2014-08-03', 20),
	('E120TO', 'Toyota', '2008-01-01', '2008-10-18', 16),
	('E666KT', 'Chevrolet', '2012-01-01', '2012-04-11', 6),
	('H807MT', 'Jeep', '2014-01-01', '2014-12-22', 12),
	('K111KK', 'AUDI', '2014-01-01', '2014-11-06', 3),
	('K564TK', 'BMW', '2008-01-01', '2008-10-24', 19),
	('K720TO', 'Honda', '2008-01-01', '2008-10-17', 9),
	('K826AT', 'Skoda', '2014-01-01', '2014-10-01', 5),
	('M321AB', 'AUDI', '2014-01-01', '2014-07-09', 18),
	('M708HK', 'Hyundai', '2015-01-01', '2017-05-23', 11),
	('T012EO', 'Ford', '2014-01-01', '2014-05-21', 8),
	('T132HM', 'Mitsubishi', '2008-01-01', '2008-02-22', 17),
	('T207AB', 'Volkswagen', '2011-01-01', '2011-02-25', 4);
/*!40000 ALTER TABLE `tbl_pass_auto` ENABLE KEYS */;


-- Дамп структуры для таблица bd_vlad.tbl_pass_driver
CREATE TABLE IF NOT EXISTS `tbl_pass_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `father_name` varchar(20) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `home` varchar(5) DEFAULT NULL,
  `rooms` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы bd_vlad.tbl_pass_driver: ~20 rows (приблизительно)
/*!40000 ALTER TABLE `tbl_pass_driver` DISABLE KEYS */;
INSERT INTO `tbl_pass_driver` (`id`, `family_name`, `first_name`, `father_name`, `city`, `mobile`, `street`, `home`, `rooms`) VALUES
	(1, 'Romanov', 'Vladislav', 'Viktorovich', 'Glazov', 1, 'Sulimova', '89', 47),
	(2, 'Chibyshev', 'Dmitriry', 'Nikolaevich', 'Glazov', 2, 'Sulimova', '77', 30),
	(3, 'Ivanov', 'Ivan', 'Ivanovich', 'Glazov', 3, 'Pryazhenikova', '23', 50),
	(4, 'Sidorov', 'Sergey', 'Alekseevich', 'Glazov', 1, 'Revolyucii', '29', 5),
	(5, 'Petrov', 'Petr', 'Dmitrievich', 'Glazov', 0, 'Dragunova', '40', 62),
	(6, 'Dekteryov', 'Andrey', 'Vladimirovich', 'Glazov', 2, 'Karla Marksa', '27', 78),
	(7, 'Gagarina', 'Vera', 'Alekseevna', 'Glazov', 2, 'Revolyucii', '20', 1),
	(8, 'Bazhenov', 'Grigoriy', 'Viktorovich', 'Glazov', 22, 'Kalinina', '5', 27),
	(9, 'Lekomceva', 'Marina', 'Viktorovna', 'Glazov', 33, 'Pervomiskaya', '25', 18),
	(10, 'Babikov', 'Anton', 'Ivanovich', 'Glazov', 11, 'Pehtina', '18', 3),
	(11, 'Ivanov', 'Nikita', 'Alekseevich', 'Glazov', 7, 'Udmurtskaya', '86', 2),
	(12, 'Ananasov', 'Anton', 'Valereevich', 'Glazov', 8, 'Novaya', '2', 77),
	(13, 'Persik', 'Alex', 'Abrikosovich', 'Glazov', 77, 'Dragunova', '56', 29),
	(14, 'Navalniy', 'Dmitriry', 'Sergeevich', 'Glazov', 11, 'Sovetskaya', '30', 3),
	(15, 'Ivanov', 'Artemiy', 'Nikitich', 'Glazov', 32, 'Kalinina', '69', 96),
	(16, 'Romanov', 'Akakiy', 'Vladislavovich', 'Glazov', 23, 'Kirova', '40', 19),
	(17, 'Petrov', 'Alexandr', 'Olegovich', 'Glazov', 66, 'Pryazhenikova', '42', 50),
	(18, 'Anoshina', 'Liza', 'Anatolevna', 'Glazov', 55, 'Tolstova', '128', 81),
	(19, 'Chuvashov', 'Mihail', 'Sergeevich', 'Glazov', 0, 'Karla Marksa', '51', 63),
	(20, 'Danilova', 'Sonya', 'Pavlovna', 'Glazov', 89, 'Korolenka', '77', 82);
/*!40000 ALTER TABLE `tbl_pass_driver` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
