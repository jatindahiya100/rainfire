-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2021 at 07:48 PM
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
  `banner_url` varchar(255) NOT NULL,
  `linked_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heroimage`
--

INSERT INTO `heroimage` (`id`, `heading`, `banner_url`, `linked_to`) VALUES
(1, 'Rainfire HyperX Cloud ', 'https://shopsellers.in/wp-content/uploads/2020/10/wireless-banner.jpg', 'https://shopsellers.in/wp-content/uploads/2020/10/wireless-banner.jpg'),
(2, 'Travel Accessories', 'https://cdn.shopify.com/s/files/1/0314/2193/t/7/assets/personal_audio_collection_banner.jpg?v=16427186628660576205', 'https://cdn.shopify.com/s/files/1/0314/2193/t/7/assets/personal_audio_collection_banner.jpg?v=16427186628660576205'),
(3, 'Rainfire wearable technology', 'https://www.pantrade.com.sg/image/pantrade/image/data/brand-page-sennheiser-20190614-featurebanner-small.jpg', 'https://www.pantrade.com.sg/image/pantrade/image/data/brand-page-sennheiser-20190614-featurebanner-small.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `S_No` int(11) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `p_Name` varchar(255) NOT NULL,
  `p_Price` int(11) NOT NULL,
  `original_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `money_saved` int(11) NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `added_on` date NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL,
  `rating` decimal(1,1) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`S_No`, `p_ID`, `p_Name`, `p_Price`, `original_price`, `discount`, `money_saved`, `thumbnail`, `added_on`, `category`, `rating`, `stock`) VALUES
(2, 'SU101', 'Rainfire HyperX Cloud', 2200, 0, 0, 0, 'https://p.globalsources.com/IMAGES/PDT/BIG/801/B1185071801.jpg', '2021-08-04', 'Headphones', '0.0', 0),
(3, 'SU103', 'Rainfire smart watch', 2200, 0, 0, 0, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80', '2021-08-04', 'Headphones', '0.0', 0),
(4, 'SU104', 'Rainfire smart watch', 2200, 0, 0, 0, 'https://images.unsplash.com/photo-1599669454699-248893623440?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhlYWRwaG9uZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80', '2021-08-04', 'Headphones', '0.0', 0),
(5, 'SU105', 'Rainfire smart watch', 2200, 0, 0, 0, 'https://cdn.shopify.com/s/files/1/0057/8938/4802/products/8f01d1e9-48f4-4e55-886d-0b255b9bbf24.png?v=1625046257', '2021-08-04', 'Headphones', '0.0', 0),
(6, 'SU106', 'Rainfire smart watch', 2200, 0, 0, 0, 'https://images.immediate.co.uk/production/volatile/sites/4/2020/09/Apple-AirPods-Pro-best-wireless-earbuds-712ddc5.jpg?quality=90&resize=400,357', '2021-08-04', 'Batteries', '0.0', 0),
(7, 'SU0010', 'iphone Data Cable', 2200, 2500, 20, 300, 'https://images.unsplash.com/photo-1599669454699-248893623440?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhlYWRwaG9uZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80', '2021-08-05', 'Data Cables', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heroimage`
--
ALTER TABLE `heroimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`S_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heroimage`
--
ALTER TABLE `heroimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `S_No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
