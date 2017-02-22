-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2017 at 09:08 AM
-- Server version: 5.6.34
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fantacalcio`
--

-- --------------------------------------------------------

--
-- Table structure for table `calciatore`
--

CREATE TABLE `calciatore` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ruolo` varchar(50) NOT NULL,
  `squadra_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calciatore`
--

INSERT INTO `calciatore` (`id`, `nome`, `ruolo`, `squadra_id`) VALUES
(1, 'Mattia Perin', 'Portiere', 1),
(2, 'Edenilson', 'Difensore', 1),
(3, 'Izzo', 'Difensore', 1),
(4, 'Burdisso', 'Difensore', 1),
(5, 'Cofie', 'Centrocampista', 1),
(6, 'Veloso', 'Centrocampista', 1),
(7, 'Laxalt', 'Centrocampista', 1),
(8, 'Simeone', 'Attaccante', 1),
(9, 'Pinilla', 'Attaccante', 1),
(10, 'Pandev', 'Attacante', 1),
(11, 'Palladino', 'Attaccante', 1),
(12, 'Viviano', 'Portiere', 2),
(13, 'Regini', 'Difensore', 2),
(14, 'Pavlovic', 'Difensore', 2),
(15, 'Silvestre', 'Difensore', 2),
(16, 'Alvarez', 'Centrocampista', 2),
(17, 'Palombo', 'Centrocampista', 2),
(18, 'Praet', 'Centrocampista', 2),
(19, 'Muriel', 'Attaccante', 2),
(20, 'Quagliarella', 'Attaccante', 2),
(21, 'Budimir', 'Attaccante', 2),
(22, 'Torreira', 'Attaccante', 2);

-- --------------------------------------------------------

--
-- Table structure for table `calendario`
--

CREATE TABLE `calendario` (
  `id` int(11) UNSIGNED NOT NULL,
  `data` datetime NOT NULL,
  `goal_casa` int(11) NOT NULL,
  `goal_ospite` int(11) NOT NULL,
  `squadra_id` int(11) UNSIGNED NOT NULL,
  `ospite_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendario`
--

INSERT INTO `calendario` (`id`, `data`, `goal_casa`, `goal_ospite`, `squadra_id`, `ospite_id`) VALUES
(1, '2016-10-22 15:00:00', 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `squadra`
--

CREATE TABLE `squadra` (
  `id` int(11) UNSIGNED NOT NULL,
  `allenatore` varchar(50) NOT NULL,
  `denominazione` varchar(50) NOT NULL,
  `datafondazione` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `squadra`
--

INSERT INTO `squadra` (`id`, `allenatore`, `denominazione`, `datafondazione`) VALUES
(1, 'Mandorlini', 'Genoa', '1893-09-07 00:00:00'),
(2, 'Giampaolo', 'Sampdoria', '1946-08-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `votazione`
--

CREATE TABLE `votazione` (
  `id` int(11) NOT NULL,
  `calciatore_id` int(11) UNSIGNED NOT NULL,
  `calendario_id` int(11) UNSIGNED NOT NULL,
  `voto` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `votazione`
--

INSERT INTO `votazione` (`id`, `calciatore_id`, `calendario_id`, `voto`) VALUES
(1, 1, 1, '7'),
(2, 2, 1, '5'),
(3, 3, 1, '5'),
(4, 4, 1, '6'),
(5, 5, 1, '4'),
(6, 6, 1, '7'),
(7, 7, 1, '8'),
(8, 8, 1, '5'),
(9, 9, 1, '6'),
(10, 10, 1, '6'),
(11, 11, 1, '6'),
(12, 12, 1, '7'),
(13, 13, 1, '7'),
(14, 14, 1, '6'),
(15, 15, 1, '6'),
(16, 16, 1, '7'),
(17, 17, 1, '7'),
(18, 18, 1, '7'),
(19, 19, 1, '7'),
(20, 20, 1, '7'),
(21, 21, 1, '7'),
(22, 22, 1, '8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calciatore`
--
ALTER TABLE `calciatore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `squadra_id` (`squadra_id`),
  ADD KEY `squadra_id_2` (`squadra_id`);

--
-- Indexes for table `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `squadra_id` (`squadra_id`),
  ADD UNIQUE KEY `ospite_id` (`ospite_id`),
  ADD UNIQUE KEY `data` (`data`,`ospite_id`);

--
-- Indexes for table `squadra`
--
ALTER TABLE `squadra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votazione`
--
ALTER TABLE `votazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendario_id` (`calendario_id`),
  ADD KEY `calciatore_id` (`calciatore_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calciatore`
--
ALTER TABLE `calciatore`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `squadra`
--
ALTER TABLE `squadra`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `votazione`
--
ALTER TABLE `votazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calciatore`
--
ALTER TABLE `calciatore`
  ADD CONSTRAINT `calciatore_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`);

--
-- Constraints for table `calendario`
--
ALTER TABLE `calendario`
  ADD CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`),
  ADD CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`ospite_id`) REFERENCES `squadra` (`id`);

--
-- Constraints for table `votazione`
--
ALTER TABLE `votazione`
  ADD CONSTRAINT `votazione_ibfk_1` FOREIGN KEY (`calciatore_id`) REFERENCES `calciatore` (`id`),
  ADD CONSTRAINT `votazione_ibfk_2` FOREIGN KEY (`calendario_id`) REFERENCES `calendario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
