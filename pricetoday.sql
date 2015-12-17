-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2015 at 01:33 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pricetoday`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryNAME`) VALUES
(1, 'Gulay'),
(2, 'Meat');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeFIRSTNAME` varchar(50) NOT NULL,
  `employeeLASTNAME` varchar(50) NOT NULL,
  `employeeMIDDLENAME` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `ContactNUMBER` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `employeeFIRSTNAME`, `employeeLASTNAME`, `employeeMIDDLENAME`, `Address`, `Birthdate`, `ContactNUMBER`) VALUES
(1, 'Vallecera', 'Chejei', 'Denoso', 'CDO', '1994-01-26', 2147483647);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latestupdates_view`
--
CREATE TABLE IF NOT EXISTS `latestupdates_view` (
`LAST_INSERT_ID(priceupdateheaderID)` bigint(11) unsigned
);
-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
  `marketID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) NOT NULL DEFAULT '0',
  `latitude` varchar(50) NOT NULL DEFAULT '0',
  `longitude` varchar(50) NOT NULL DEFAULT '0',
  `marketNAME` varchar(50) NOT NULL DEFAULT '0',
  `placeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`marketID`),
  KEY `FK__city/province` (`placeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `placeNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`ID`, `placeNAME`) VALUES
(1, 'Cagayan de Oro City');

-- --------------------------------------------------------

--
-- Table structure for table `priceupdate`
--

CREATE TABLE IF NOT EXISTS `priceupdate` (
  `priceupdateID` int(11) NOT NULL AUTO_INCREMENT,
  `priceupdateheaderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `price` float NOT NULL,
  `unitofmeasureID` int(11) NOT NULL,
  PRIMARY KEY (`priceupdateID`),
  KEY `FK_priceupdate_priceupdateheader` (`priceupdateheaderID`),
  KEY `FK_priceupdate_product` (`productID`),
  KEY `FK_priceupdate_unitofmeasure` (`unitofmeasureID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `priceupdate`
--

INSERT INTO `priceupdate` (`priceupdateID`, `priceupdateheaderID`, `productID`, `price`, `unitofmeasureID`) VALUES
(2, 1, 1, 10, 1),
(3, 1, 2, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `priceupdateheader`
--

CREATE TABLE IF NOT EXISTS `priceupdateheader` (
  `priceupdateheaderID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `PlaceID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`priceupdateheaderID`),
  KEY `FK_priceupdateheader_city/province` (`PlaceID`),
  KEY `FK_priceupdateheader_user` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `priceupdateheader`
--

INSERT INTO `priceupdateheader` (`priceupdateheaderID`, `Date`, `PlaceID`, `userID`) VALUES
(1, '2015-11-15', 1, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `price_update_view`
--
CREATE TABLE IF NOT EXISTS `price_update_view` (
`priceupdateheaderID` int(11)
,`Date` date
,`price` float
,`unitofmeasure` varchar(50)
,`name` char(50)
,`imageURL` varchar(100)
,`placeName` varchar(50)
);
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `imageURL` varchar(100) DEFAULT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `FK_product_category` (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `description`, `imageURL`, `categoryID`) VALUES
(1, 'Kamatis', 'Hinog', 'http://ascientistinthekitchen.net/wp-content/uploads/2010/06/kamatis.jpg', 1),
(2, 'Talong', 'fdkikk', 'https://c1.staticflickr.com/7/6197/6034753654_45d95eb44d.jpg', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_category_place_view`
--
CREATE TABLE IF NOT EXISTS `product_category_place_view` (
`name` char(50)
,`description` varchar(50)
,`categoryNAME` varchar(50)
,`placeName` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `province_market_view`
--
CREATE TABLE IF NOT EXISTS `province_market_view` (
`marketNAME` varchar(50)
,`Address` varchar(50)
,`latitude` varchar(50)
,`longitude` varchar(50)
,`placeName` varchar(50)
);
-- --------------------------------------------------------

--
-- Table structure for table `unitofmeasure`
--

CREATE TABLE IF NOT EXISTS `unitofmeasure` (
  `unitofmeasureID` int(11) NOT NULL AUTO_INCREMENT,
  `unitofmeasure` varchar(50) NOT NULL,
  PRIMARY KEY (`unitofmeasureID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `unitofmeasure`
--

INSERT INTO `unitofmeasure` (`unitofmeasureID`, `unitofmeasure`) VALUES
(1, 'Kilo'),
(2, 'gallon'),
(3, 'gallon'),
(4, 'gallon'),
(5, 'gallon'),
(6, 'gallon'),
(7, 'hvkbjlb'),
(8, 'hvkbjlb'),
(9, 'grams'),
(10, 'grams'),
(11, 'grams'),
(12, 'sdjjhld'),
(13, 'sdfdds'),
(14, 'hvkbjlb'),
(15, 'hvkbjlb'),
(16, 'hvkbjlbdsdsdd'),
(17, 'sdfdds'),
(18, 'sasdsds'),
(19, 'sasdsds'),
(20, 'kldsllldas'),
(21, 'dssfff'),
(22, 'dssfff'),
(23, 'asfsadf'),
(24, 'asfsadf'),
(25, 'sfdsdf'),
(26, 'dsdsdf'),
(27, 'dfsdds'),
(28, 'chejei'),
(29, 'ssss'),
(30, 'xxxx'),
(31, 'Gina'),
(32, 'sdfsf'),
(33, 'dxcxcxcv'),
(34, 'fhghgfh'),
(35, 'rubs'),
(36, 'love'),
(37, 'hahaha'),
(38, 'again'),
(39, 'again'),
(40, 'hahaha');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userNAME` varchar(50) NOT NULL,
  `userPASSWORD` varchar(100) NOT NULL,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `FK_user_employee` (`employeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userNAME`, `userPASSWORD`, `employeeID`) VALUES
(3, 'admin', '123456', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_update_view`
--
CREATE TABLE IF NOT EXISTS `user_update_view` (
`userNAME` varchar(50)
,`employeeLASTNAME` varchar(50)
,`employeeFIRSTNAME` varchar(50)
,`Date` date
,`placeName` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `latestupdates_view`
--
DROP TABLE IF EXISTS `latestupdates_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latestupdates_view` AS select last_insert_id(`priceupdateheader`.`priceupdateheaderID`) AS `LAST_INSERT_ID(priceupdateheaderID)` from `priceupdateheader`;

-- --------------------------------------------------------

--
-- Structure for view `price_update_view`
--
DROP TABLE IF EXISTS `price_update_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `price_update_view` AS select `priceupdateheader`.`priceupdateheaderID` AS `priceupdateheaderID`,`priceupdateheader`.`Date` AS `Date`,`priceupdate`.`price` AS `price`,`unitofmeasure`.`unitofmeasure` AS `unitofmeasure`,`product`.`name` AS `name`,`product`.`imageURL` AS `imageURL`,`place`.`placeNAME` AS `placeName` from (`place` join (`unitofmeasure` join (`product` join (`priceupdateheader` join `priceupdate` on((`priceupdateheader`.`priceupdateheaderID` = `priceupdate`.`priceupdateheaderID`))) on((`product`.`productID` = `priceupdate`.`productID`))) on((`unitofmeasure`.`unitofmeasureID` = `priceupdate`.`unitofmeasureID`))) on((`place`.`ID` = `priceupdateheader`.`PlaceID`)));

-- --------------------------------------------------------

--
-- Structure for view `product_category_place_view`
--
DROP TABLE IF EXISTS `product_category_place_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_category_place_view` AS select `product`.`name` AS `name`,`product`.`description` AS `description`,`category`.`categoryNAME` AS `categoryNAME`,`place`.`placeNAME` AS `placeName` from (`place` join (`category` join `product` on((`category`.`categoryID` = `product`.`categoryID`))));

-- --------------------------------------------------------

--
-- Structure for view `province_market_view`
--
DROP TABLE IF EXISTS `province_market_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `province_market_view` AS select `market`.`marketNAME` AS `marketNAME`,`market`.`Address` AS `Address`,`market`.`latitude` AS `latitude`,`market`.`longitude` AS `longitude`,`place`.`placeNAME` AS `placeName` from (`place` join `market` on((`place`.`ID` = `market`.`placeID`)));

-- --------------------------------------------------------

--
-- Structure for view `user_update_view`
--
DROP TABLE IF EXISTS `user_update_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_update_view` AS select `user`.`userNAME` AS `userNAME`,`employee`.`employeeLASTNAME` AS `employeeLASTNAME`,`employee`.`employeeFIRSTNAME` AS `employeeFIRSTNAME`,`priceupdateheader`.`Date` AS `Date`,`place`.`placeNAME` AS `placeName` from (`place` join ((`employee` join `user` on((`employee`.`employeeID` = `user`.`employeeID`))) join `priceupdateheader` on((`user`.`userID` = `priceupdateheader`.`userID`))) on((`place`.`ID` = `priceupdateheader`.`PlaceID`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `market`
--
ALTER TABLE `market`
  ADD CONSTRAINT `FK__city/province` FOREIGN KEY (`placeID`) REFERENCES `place` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `priceupdate`
--
ALTER TABLE `priceupdate`
  ADD CONSTRAINT `FK_priceupdate_priceupdateheader` FOREIGN KEY (`priceupdateheaderID`) REFERENCES `priceupdateheader` (`priceupdateheaderID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_priceupdate_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_priceupdate_unitofmeasure` FOREIGN KEY (`unitofmeasureID`) REFERENCES `unitofmeasure` (`unitofmeasureID`) ON UPDATE CASCADE;

--
-- Constraints for table `priceupdateheader`
--
ALTER TABLE `priceupdateheader`
  ADD CONSTRAINT `FK_priceupdateheader_city/province` FOREIGN KEY (`PlaceID`) REFERENCES `place` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_priceupdateheader_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_employee` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
