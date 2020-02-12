-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2020 at 07:52 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flasktest`
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationId` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationId`, `LocationName`, `LocationDescription`) VALUES
(4, 'Borivali', 'Borivali West, Next to goyal shopping center'),
(5, 'Kandivali', 'Kandivali east, charkop, hindustannaka, plot No.20'),
(6, 'Malad', 'Outside station, Next to Bechat Chemist'),
(7, 'Andheri', 'Sanki Naka Metro station, 1st floor'),
(8, 'Navi Mumbai', 'Mahape');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductDescription` varchar(255) NOT NULL,
  `ProductId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductName`, `ProductDescription`, `ProductId`) VALUES
('Amul Milk', 'largely procures milk from Gujrat which is buffalo dominated state except some small pockets. ', 26),
('Bread Spreads', 's made up of pure milk fat. It consists of 100g, 500g, 50g, 20g, and 8.1g packing.', 27),
('Amul Lite', 'is a low cholesterol, low calorie and low fat bread spread.', 28),
('Delicious Table Margarine', 'Delicious Table Margarine is the substitute of butter. ', 29),
('Amul Kool', 'Amul Kool is very tasty and healthy drink and come with five flavour i.e Kesar, Elaichi, Rose, Mango, and Strawberry.', 30);

-- --------------------------------------------------------

--
-- Table structure for table `productmovement`
--

CREATE TABLE `productmovement` (
  `MovementId` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `FromLocation` varchar(255) DEFAULT NULL,
  `ToLocation` varchar(255) DEFAULT NULL,
  `ProductId` int(11) NOT NULL,
  `ProductQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productmovement`
--

INSERT INTO `productmovement` (`MovementId`, `Timestamp`, `FromLocation`, `ToLocation`, `ProductId`, `ProductQuantity`) VALUES
(7, '2020-02-11 18:30:00', 'Borivali', 'Kandivali', 26, 50),
(8, '2020-02-12 18:30:00', '', 'Borivali', 27, 10),
(9, '2020-02-13 18:30:00', '', 'Malad', 28, 60),
(10, '2020-02-24 18:30:00', '', 'Andheri', 29, 80),
(11, '2020-02-28 18:30:00', '', 'Navi Mumbai', 30, 100),
(12, '2020-02-28 18:30:00', 'Kandivali', 'Malad', 26, 30),
(13, '2020-02-25 18:30:00', 'Borivali', 'Andheri', 27, 10),
(14, '2020-03-06 18:30:00', 'Malad', 'Borivali', 28, 55),
(15, '2020-02-14 18:30:00', '', 'Andheri', 29, 5),
(16, '2020-03-06 18:30:00', 'Andheri', 'Kandivali', 30, 70);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexes for table `productmovement`
--
ALTER TABLE `productmovement`
  ADD PRIMARY KEY (`MovementId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `productmovement`
--
ALTER TABLE `productmovement`
  MODIFY `MovementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
