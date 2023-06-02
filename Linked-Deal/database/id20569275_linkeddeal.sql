-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2023 at 07:02 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20569275_linkeddeal`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `Category_ID` varchar(11) NOT NULL,
  `Category_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`Category_ID`, `Category_Name`) VALUES
('A', 'Electronic'),
('B', 'Furnuture'),
('C', 'Garden'),
('D', 'Accessories'),
('E', 'HandBags'),
('F', 'Sports'),
('G', 'Toys'),
('H', 'Phones'),
('I', 'PC/Laptops'),
('J', 'Office'),
('K', 'Camera'),
('L', 'Tools'),
('M', 'Watches'),
('N', 'Jewlery'),
('O', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `POID` int(11) NOT NULL,
  `OID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `TotalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `OrderItems`
--

INSERT INTO `OrderItems` (`POID`, `OID`, `PID`, `qty`, `TotalPrice`) VALUES
(1, 1, 6, 4, 5800),
(2, 1, 8, 1, 3),
(3, 2, 7, 2, 2600),
(4, 3, 4, 4, 1540),
(5, 3, 2, 1, 1299),
(6, 5, 1, 1, 125),
(7, 6, 3, 3, 4197),
(8, 7, 5, 2, 2600),
(9, 8, 11, 5, 25),
(10, 9, 5, 1, 1300);

--
-- Triggers `OrderItems`
--
DELIMITER $$
CREATE TRIGGER `set_OID` BEFORE INSERT ON `OrderItems` FOR EACH ROW SET NEW.OID = (SELECT LAST_INSERT_ID())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_order_id` BEFORE INSERT ON `OrderItems` FOR EACH ROW SET NEW.OID = (SELECT LAST_INSERT_ID())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_order_id_new` BEFORE INSERT ON `OrderItems` FOR EACH ROW SET NEW.OID = (SELECT MAX(OID) FROM Orders)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OID` int(11) NOT NULL,
  `SellerID` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `PhoneNb` varchar(100) NOT NULL,
  `CAddress` varchar(255) NOT NULL,
  `OrderStatus` varchar(50) NOT NULL DEFAULT 'Pending',
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `Notes` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OID`, `SellerID`, `FullName`, `PhoneNb`, `CAddress`, `OrderStatus`, `Date`, `Notes`) VALUES
(1, 'Apple', 'Askary', '71975084', 'kamed al louz', 'Done', '2023-05-10', 'Please Hurry up'),
(2, 'Apple', 'Ahmad Azimeh ', '71095686', 'bekaa saadnayel ', 'Pending', '2023-05-14', 'Ahmad Azimeh '),
(3, 'samsung', 'Mohamad Chahine ', '96176932976', 'west Bekaa, sultan yaacoub', 'Pending', '2023-05-16', 'please take care while doing the package'),
(4, 'LaptopKing', 'Mohamad Chahine', '659567', 'hdiwhfoc', 'Done', '2023-05-24', 'udj2'),
(5, 'LaptopKing', 'Mohamad Chahine', '32954', 'bfidhw', 'Done', '2023-05-24', 'no'),
(6, 'LaptopKing', 'Mohamad', '655', 'bxks', 'Pending', '2023-05-24', ''),
(7, 'samsung', 'Mohamad Chahine ', '96176932976', 'sultan yaacoub el tahta, west bekaa', 'Done', '2023-05-31', 'pack the phone carefully'),
(8, 'cyrinecompany', 'Raghad', '123456', 'kifraya', 'Done', '2023-06-01', 'please pack it carefully'),
(9, 'samsung', 'Ahmad Azimeh king', '71095686', 'liu', 'Pending', '2023-06-01', 'Ahmad Azimeh king');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `PID` int(11) NOT NULL,
  `PName` varchar(255) NOT NULL,
  `SellerID` varchar(255) NOT NULL,
  `Category` varchar(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Image` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`PID`, `PName`, `SellerID`, `Category`, `Description`, `Quantity`, `Price`, `Image`) VALUES
(1, 'Gateway', 'LaptopKing', 'I', 'GWTN141-5BK /INTEL DC CPU\n/4GB RAM\n/64GB SSD STORAGE \n/14.1\" FHD SCREEN /SLIM DESIGN | LIGHT WEIGHT\n/UP TO 8.5 HRS BATTERY-LIFE \n/WITH FREE BAG & MOUSE ', 4, 125, '298756394_1683620275.jpeg'),
(2, 'Macbook Pro', 'LaptopKing', 'I', '\nMACBOOK PRO TOUCHBAR 15\" 2018\n/Core i9 CPU\n/32GB RAM \n/1TB SSD\n/15.4\" TRUE TONE (2880×1800)\n/VGA RADEON PRO 555X 4GB VRAM \n/BACKLIT KEYBOARD \n/TOUCHBAR + TOUCH ID \n/WITH FREE BAG & MOUSE \n', 2, 1299, '1084110898_1683620438.jpeg'),
(3, 'ASUS ROG', 'LaptopKing', 'I', 'G513QR-MB98Q\n/RYZEN 9 5900HX\n/32GB RAM\n/1TB SSD NVME \n/GEFORCE RTX 3070 8GB \n/15.6\" 2K SCREEN\n/RES. 2560x1440 \n/165HZ REFRESH RATE\n/RGB BACKLIT KEYBOARD\n/BOTTOM RGB LIGHTBAR \n/WITH FREE BAG & MOUSE \n', 2, 1399, '1159904556_1683621089.jpeg'),
(4, 'Samsung A54', 'samsung', 'H', '256gb /8 gb/ black/ 48mb camera', 11, 385, '37865525_1683622059.jpeg'),
(5, 'Samsung S23 Ultra', 'samsung', 'H', '258gb/12gb/200mb camera/ color:oil', 7, 1300, '1550309185_1683622133.jpeg'),
(6, 'Iphone 14 PRO MAX', 'Apple', 'H', '256 gb /6gb', 21, 1450, '1690049775_1683623329.jpeg'),
(7, 'Iphone 14 PRO ', 'Apple', 'H', '128/6 gb', 9, 1300, '483377339_1683623374.jpeg'),
(8, 'SEGWAY Ninebot KickScooter ', 'Abedtahan', 'A', '25 Km/h maximum speed, 23% climbing angle, 2 disc brakes:for up to 150KG ', 2, 2, '848399909_1683630039.jpeg'),
(10, 'Test123', 'abedtahan', 'G', '123356uhde', 12, 12, '128103727_1684417709.jpeg'),
(11, 'Mouse', 'cyrinecompany', 'I', 'mouse gaming black', 0, 5, '675321216_1685615903.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `ID` int(255) NOT NULL,
  `UserID` varchar(255) NOT NULL,
  `CName` varchar(100) NOT NULL DEFAULT 'TBA',
  `UserType` varchar(10) NOT NULL DEFAULT 'Seller',
  `Password` varchar(100) NOT NULL,
  `Logo` varchar(350) NOT NULL DEFAULT 'Logo.jpeg',
  `Email` varchar(300) NOT NULL DEFAULT 'TBA',
  `Phonenb` varchar(255) NOT NULL DEFAULT 'TBA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`ID`, `UserID`, `CName`, `UserType`, `Password`, `Logo`, `Email`, `Phonenb`) VALUES
(1, 'admin', 'Linked-Deal', 'Admin', 'admin', 'Logo.jpeg', 'linkeddeal23@gmail.com', '96176932976'),
(2, 'LaptopKing', 'Laptops Kings', 'Seller', 'abdowaked', '624347449_1683620142.jpeg', 'laptopasking@gmail.com', '03200198'),
(3, 'Samsung', 'Samsung Shops', 'Seller', 'samsung123', '2079878491_1683621789.jpeg', 'samsung@info.com.lb', '+962-7-97777421'),
(4, 'Apple', 'Apple', 'Seller', 'apple123', '1890361755_1683623103.jpeg', 'info@apple.com', '01 426 801'),
(5, 'Abedtahan', 'Abed Tahan ', 'Seller', 'abedtahan123', '1080526710_1683625819.jpeg', 'abedtahan@gmail.com', '961 1645 645'),
(8, 'Cyrinecompany', 'TBA', 'Seller', '1111', 'Logo.jpeg', 'TBA', 'TBA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`POID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `OID` (`OID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `SellerID` (`SellerID`),
  ADD KEY `Category` (`Category`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `OrderItems`
--
ALTER TABLE `OrderItems`
  MODIFY `POID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD CONSTRAINT `OrderItems_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `Products` (`PID`),
  ADD CONSTRAINT `OrderItems_ibfk_3` FOREIGN KEY (`OID`) REFERENCES `Orders` (`OID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`Category`) REFERENCES `Category` (`Category_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
