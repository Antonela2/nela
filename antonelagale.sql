-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2020 at 07:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antonelagale`
--

-- --------------------------------------------------------

--
-- Table structure for table `prodavaonica`
--

CREATE TABLE `prodavaonica` (
  `Prodavaonica_id` int(11) NOT NULL,
  `imeArtikla` varchar(255) NOT NULL,
  `cijenaArtikla` int(11) NOT NULL,
  `velicinaArtikla` varchar(255) DEFAULT 'STANDARDNO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodavaonica`
--

INSERT INTO `prodavaonica` (`Prodavaonica_id`, `imeArtikla`, `cijenaArtikla`, `velicinaArtikla`) VALUES
(1, 'WC papir', 25, 'VELIK'),
(2, 'Dezinfekcijsko sredstvo', 100, 'MALEN'),
(3, 'Zastitne maske', 150, 'STANDARDNO');

-- --------------------------------------------------------

--
-- Table structure for table `skladiste`
--

CREATE TABLE `skladiste` (
  `Skladiste_id` int(11) NOT NULL,
  `Prodavaonica_id` int(11) NOT NULL,
  `kolicinaArtikla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skladiste`
--

INSERT INTO `skladiste` (`Skladiste_id`, `Prodavaonica_id`, `kolicinaArtikla`) VALUES
(1, 1, 1000),
(2, 2, 150),
(3, 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `prodavaonica`
--
ALTER TABLE `prodavaonica`
  ADD PRIMARY KEY (`Prodavaonica_id`);

--
-- Indexes for table `skladiste`
--
ALTER TABLE `skladiste`
  ADD PRIMARY KEY (`Skladiste_id`),
  ADD KEY `Prodavaonica_id` (`Prodavaonica_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prodavaonica`
--
ALTER TABLE `prodavaonica`
  MODIFY `Prodavaonica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `skladiste`
--
ALTER TABLE `skladiste`
  ADD CONSTRAINT `skladiste_ibfk_1` FOREIGN KEY (`Prodavaonica_id`) REFERENCES `prodavaonica` (`Prodavaonica_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
