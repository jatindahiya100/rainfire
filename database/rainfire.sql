-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2021 at 04:22 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rainfire`
--

-- --------------------------------------------------------

--
-- Table structure for table `heroimage`
--

CREATE TABLE `heroimage` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `banner_url` longtext NOT NULL,
  `linked_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heroimage`
--

INSERT INTO `heroimage` (`id`, `heading`, `banner_url`, `linked_to`) VALUES
(1, '', 'images/banner1.jpg', 'Details.html?ProductID=SEPT04'),
(2, '', 'images/banner2.jpg', 'https://cdn.shopify.com/s/files/1/0314/2193/t/7/assets/personal_audio_collection_banner.jpg?v=16427186628660576205'),
(3, '', 'images/banner3.jpg', 'https://www.pantrade.com.sg/image/pantrade/image/data/brand-page-sennheiser-20190614-featurebanner-small.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` varchar(255) NOT NULL,
  `placed_on` datetime NOT NULL DEFAULT current_timestamp(),
  `order_Amt` float NOT NULL,
  `payment_Status` char(20) NOT NULL DEFAULT 'Pending',
  `cName` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cMobile` varchar(50) NOT NULL,
  `cState` varchar(255) NOT NULL,
  `cDistrict` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `shipping_Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_Details`
--

CREATE TABLE `order_Details` (
  `unique_ID` int(11) NOT NULL,
  `order_ID` varchar(255) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `p_Name` varchar(255) NOT NULL,
  `thumbnail` longtext NOT NULL,
  `p_Price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `added_on` date NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL,
  `rating` int(11) NOT NULL,
  `stock` varchar(20) NOT NULL DEFAULT 'In Stock',
  `description` longtext NOT NULL,
  `archieve` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_ID`, `p_Name`, `thumbnail`, `p_Price`, `discount`, `added_on`, `category`, `rating`, `stock`, `description`, `archieve`) VALUES
(1, '180921105239', 'Rainfire Helio Comet', 'products_gallery/HP-BH10_TT_2_From_TPS_technologies_1024x1024.webp', 12999, 45, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(2, '180921105638', 'Comet-X Hemisphere', 'products_gallery/sennheiser-hd-350bt-on-ear-wireless-headphones-black-1_1.jpg', 19000, 25, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(3, '180921105955', 'Rainfire Beast', 'products_gallery/61zrP+qT7EL._SL1500_.jpg', 9999, 12, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(4, '180921110335', 'Stylo mafia thunder', 'products_gallery/rPWYcTBnCS3PRBSgf7Fkam-1200-80.jpg', 12900, 12, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(5, '180921110623', 'Rainfire-HeX Handsfree', 'products_gallery/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg', 2200, 45, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(6, '180921111032', 'Axe Stormbreaker - Rainfire', 'products_gallery/784dee9669f28275a21d24655f87a31d.jpeg', 5500, 22, '2021-09-18', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0),
(7, '180921111320', 'Rainfire Bettle Box', 'products_gallery/860a3eee-482d-41b3-8b45-fbfd73199fac1623844708853-realme-Buds-Air-2-with-Active-Noise-Cancellation-ANC-Bluetoo-1.webp', 12000, 30, '2021-09-18', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo rem non odio voluptas ab neque tempora reprehenderit velit dolores ipsam ipsum beatae adipisci, earum necessitatibus illo. Doloribus, nobis provident ratione nihil quo ullam? Vel illum architecto natus quis ea atque quasi est, possimus velit unde qui! Incidunt accusantium dignissimos quos.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_images`
--

CREATE TABLE `p_images` (
  `id` int(11) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_images`
--

INSERT INTO `p_images` (`id`, `p_ID`, `url`) VALUES
(1, '180921105239', 'products_gallery/HP-BH10_TT_2_From_TPS_technologies_1024x1024.webp'),
(2, '180921105239', 'products_gallery/bh10-2.webp'),
(3, '180921105239', 'products_gallery/51uogu0uxXL._SL1500_.jpg'),
(4, '180921105638', 'products_gallery/sennheiser-hd-350bt-on-ear-wireless-headphones-black-1_1.jpg'),
(5, '180921105638', 'products_gallery/LCD-1_PS3_2000x.webp'),
(6, '180921105638', 'products_gallery/046UyKcU86Megq3Eenq0sbo-1.webp'),
(7, '180921105955', 'products_gallery/61zrP+qT7EL._SL1500_.jpg'),
(8, '180921110335', 'products_gallery/rPWYcTBnCS3PRBSgf7Fkam-1200-80.jpg'),
(9, '180921110623', 'products_gallery/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg'),
(10, '180921111032', 'products_gallery/784dee9669f28275a21d24655f87a31d.jpeg'),
(11, '180921111320', 'products_gallery/860a3eee-482d-41b3-8b45-fbfd73199fac1623844708853-realme-Buds-Air-2-with-Active-Noise-Cancellation-ANC-Bluetoo-1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `specificaions`
--

CREATE TABLE `specificaions` (
  `serial_no` int(11) NOT NULL,
  `product_ID` varchar(255) NOT NULL,
  `p_Spec` varchar(255) NOT NULL,
  `spec_Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specificaions`
--

INSERT INTO `specificaions` (`serial_no`, `product_ID`, `p_Spec`, `spec_Value`) VALUES
(1, '180921105239', 'Audio Jack', '3mm'),
(2, '180921105239', 'Charger', 'Yes'),
(3, '180921105239', 'Volume Control', 'Manual'),
(4, '180921105239', 'Battery Life', '8 hrs'),
(5, '180921105239', 'Battery Capacity', '2200 mah'),
(6, '180921105638', 'Connectivity', 'Bluetooth / Wifi'),
(7, '180921105638', 'Charging', 'Wireless'),
(8, '180921105638', 'Battery', '2200 mah'),
(9, '180921105638', 'Standby Capacity', '24 hrs'),
(10, '180921105955', 'Connectivity', 'wireless'),
(11, '180921105955', 'controls', 'volume up, down, play, pause etc'),
(12, '180921105955', 'material', 'leather coated foam'),
(13, '180921105955', 'led light', 'turn on/OFF indicator'),
(14, '180921110335', 'Sound', 'dolby atmos'),
(15, '180921110335', 'charging', 'wireless'),
(16, '180921110335', 'voice', 'hD 3.0 ultra mike'),
(17, '180921110335', 'battery life', '28 hrs'),
(18, '180921110335', 'battery capacity', '4000 mah'),
(19, '180921110623', 'audio jack', '3.0 mm'),
(20, '180921110623', 'sound', 'surround sound'),
(21, '180921110623', 'packing', 'Hard case covering'),
(22, '180921111032', 'sound', 'dolby atmos'),
(23, '180921111032', 'charging', 'wireless'),
(24, '180921111032', 'connectivity', 'wireless'),
(25, '180921111032', 'battery', '6000 mah'),
(26, '180921111032', 'bass boost', 'yes'),
(27, '180921111032', 'controls', 'volume up & down, oN/OFF'),
(28, '180921111320', 'connectivity', 'wireless'),
(29, '180921111320', 'charging', 'fast charging'),
(30, '180921111320', 'charger', '2 ampere'),
(31, '180921111320', 'standy', '30 hrs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heroimage`
--
ALTER TABLE `heroimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`);

--
-- Indexes for table `order_Details`
--
ALTER TABLE `order_Details`
  ADD PRIMARY KEY (`unique_ID`),
  ADD KEY `order_ID` (`order_ID`),
  ADD KEY `p_ID` (`p_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_ID`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `p_images`
--
ALTER TABLE `p_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_ID` (`p_ID`);

--
-- Indexes for table `specificaions`
--
ALTER TABLE `specificaions`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `product_ID` (`product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heroimage`
--
ALTER TABLE `heroimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_Details`
--
ALTER TABLE `order_Details`
  MODIFY `unique_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `p_images`
--
ALTER TABLE `p_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `specificaions`
--
ALTER TABLE `specificaions`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_Details`
--
ALTER TABLE `order_Details`
  ADD CONSTRAINT `order_Details_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`),
  ADD CONSTRAINT `order_Details_ibfk_2` FOREIGN KEY (`p_ID`) REFERENCES `products` (`p_ID`);

--
-- Constraints for table `p_images`
--
ALTER TABLE `p_images`
  ADD CONSTRAINT `p_images_ibfk_1` FOREIGN KEY (`p_ID`) REFERENCES `products` (`p_ID`);

--
-- Constraints for table `specificaions`
--
ALTER TABLE `specificaions`
  ADD CONSTRAINT `specificaions_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `products` (`p_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
