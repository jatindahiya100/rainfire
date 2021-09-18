-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 18, 2021 at 01:40 PM
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `p_Name` varchar(255) NOT NULL,
  `thumbnail` longtext NOT NULL,
  `p_Price` int(11) NOT NULL,
  `original_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `money_saved` int(11) NOT NULL,
  `added_on` date NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL,
  `rating` int(11) NOT NULL,
  `stock` varchar(10) NOT NULL DEFAULT 'In Stock',
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_ID`, `p_Name`, `thumbnail`, `p_Price`, `original_price`, `discount`, `money_saved`, `added_on`, `category`, `rating`, `stock`, `description`) VALUES
(58, '180921050216', 'beats', 'https://idestiny.in/wp-content/uploads/2020/12/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg', 12000, 15840, 32, 3840, '2021-09-18', 'Headphones', 4, 'In Stock', 'rainfire/products_gallery/Admin-Dashboard.pngrainfire/products_gallery/Admin-Dashboard.png'),
(2, 'SEPT01', 'Beats EP On-Ear Headphones', 'https://i.pcmag.com/imagery/reviews/046UyKcU86Megq3Eenq0sbo-1.1597063431.fit_lpad.size_625x365.jpg', 2200, 3400, 35, 1200, '2021-09-03', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(3, 'SEPT02', 'HP Headphones', 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/b/h/bh10-2.jpg', 3800, 4800, 30, 1000, '2021-09-03', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(4, 'SEPT03', 'Combo pack', 'https://cf.shopee.ph/file/784dee9669f28275a21d24655f87a31d', 5800, 6800, 45, 1800, '2021-09-03', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(5, 'SEPT04', 'Rainfire Comet-X', 'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/14444014/2021/6/16/860a3eee-482d-41b3-8b45-fbfd73199fac1623844708853-realme-Buds-Air-2-with-Active-Noise-Cancellation-ANC-Bluetoo-1.jpg', 5200, 5600, 10, 400, '2021-09-03', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(6, 'SEPT05', 'Rainfire Stylo Girl', 'https://cdn.mos.cms.futurecdn.net/rPWYcTBnCS3PRBSgf7Fkam-1200-80.jpg', 2400, 3800, 40, 1400, '2021-09-03', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(7, 'SEPT06', 'Rainfire Meteor Hellfire', 'https://m.media-amazon.com/images/I/61zrP+qT7EL._SL1500_.jpg', 8200, 12000, 42, 4200, '2021-09-03', 'Headphones', 5, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!'),
(8, 'SEPT07', 'Rainfire wired babypod', 'https://idestiny.in/wp-content/uploads/2020/12/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg', 1200, 1600, 20, 400, '2021-09-03', 'Headphones', 4, 'In Stock', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque accusamus harum, quasi ipsam, quam aspernatur sint nisi, fugit omnis consequuntur voluptates. Tempora tenetur corporis eos eius voluptates, velit exercitationem labore!');

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
(1, 'SEPT01', 'https://i.pcmag.com/imagery/reviews/046UyKcU86Megq3Eenq0sbo-1.1597063431.fit_lpad.size_625x365.jpg'),
(2, 'SEPT01', 'https://azcd.harveynorman.com.au/media/catalog/product/s/e/sennheiser-hd-350bt-on-ear-wireless-headphones-black-1_1.jpg'),
(3, 'SEPT01', 'https://cdn.shopify.com/s/files/1/3013/1908/products/LCD-1_PS3_2000x.jpg?v=1584599044'),
(4, 'SEPT02', 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/b/h/bh10-2.jpg'),
(5, 'SEPT02', 'https://m.media-amazon.com/images/I/51uogu0uxXL._SL1500_.jpg'),
(6, 'SEPT02', 'https://cdn.shopify.com/s/files/1/1780/7915/products/HP-BH10_TT_2_From_TPS_technologies_1024x1024.jpg?v=1604516506'),
(7, 'SEPT03', 'https://cf.shopee.ph/file/784dee9669f28275a21d24655f87a31d'),
(8, 'SEPT04', 'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/14444014/2021/6/16/860a3eee-482d-41b3-8b45-fbfd73199fac1623844708853-realme-Buds-Air-2-with-Active-Noise-Cancellation-ANC-Bluetoo-1.jpg'),
(9, 'SEPT05', 'https://cdn.mos.cms.futurecdn.net/rPWYcTBnCS3PRBSgf7Fkam-1200-80.jpg\r\n'),
(10, 'SEPT06', 'https://m.media-amazon.com/images/I/61zrP+qT7EL._SL1500_.jpg'),
(11, 'SEPT07', 'https://idestiny.in/wp-content/uploads/2020/12/Clean-Living-EarPods-with-3-SDL934922275-1-d49eb.jpeg'),
(29, '180921050216', '/opt/lampp/htdocs/rainfire/products_gallery/Admin-Dashboard.png');

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
(1, 'SEPT01', 'Color', 'Black'),
(2, 'SEPT01', 'Connectivity', 'Wireless'),
(3, 'SEPT01', 'Battery', '2200 mAh'),
(4, 'SEPT01', 'Battery Life', '22 hours'),
(5, 'SEPT01', 'Dolby Atmos', 'Yes'),
(6, 'SEPT01', 'Charger', 'Yes'),
(7, 'SEPT01', 'Audio Controls', 'Yes'),
(8, 'SEPT01', 'Water Resistant', 'No'),
(9, 'SEPT02', 'Color', 'black'),
(10, 'SEPT02', 'Connectivity', 'Bluetooth-Wireless'),
(11, 'SEPT02', 'Battery Capacity', '1100 mAh'),
(12, 'SEPT02', 'Battery Life', '28 hrs'),
(13, 'SEPT02', 'Dolby Atmos', 'Yes'),
(136, '180921050216', 's', 'sd');

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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `p_images`
--
ALTER TABLE `p_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `specificaions`
--
ALTER TABLE `specificaions`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Constraints for dumped tables
--

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
