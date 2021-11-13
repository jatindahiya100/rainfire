-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2021 at 07:16 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
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
-- Database: `rainfire`
--

-- --------------------------------------------------------

--
-- Table structure for table `heroimage`
--

CREATE TABLE `heroimage` (
  `id` int NOT NULL,
  `heading` varchar(255) NOT NULL,
  `banner_url` longtext NOT NULL,
  `linked_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `heroimage`
--

INSERT INTO `heroimage` (`id`, `heading`, `banner_url`, `linked_to`) VALUES
(1, 'rainfireX Mini', 'images/banner1.jpg', 'https://rainfire.in/Details.html?ProductID=251021042657'),
(2, 'Premium Products', 'images/banner2.jpg', 'Details.html?ProductID=180921111032'),
(3, 'Thunderstorm hellfire NEO', 'images/banner3.jpg', 'Details.html?ProductID=180921105239');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` varchar(255) NOT NULL,
  `placed_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_Amt` float NOT NULL,
  `payment_Status` char(20) NOT NULL DEFAULT 'Pending',
  `cName` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cMobile` varchar(50) NOT NULL,
  `cState` varchar(255) NOT NULL,
  `cDistrict` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `shipping_Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_Details`
--

CREATE TABLE `order_Details` (
  `unique_ID` int NOT NULL,
  `order_ID` varchar(255) NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `qty` int NOT NULL,
  `item_price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `p_Name` varchar(255) NOT NULL,
  `thumbnail` longtext NOT NULL,
  `p_Price` int NOT NULL,
  `discount` int NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(50) NOT NULL,
  `rating` int NOT NULL,
  `stock` varchar(20) NOT NULL DEFAULT 'In Stock',
  `description` longtext NOT NULL,
  `archieve` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_ID`, `p_Name`, `thumbnail`, `p_Price`, `discount`, `added_on`, `category`, `rating`, `stock`, `description`, `archieve`) VALUES
(1, '211021023720', 'Metal Phone Holder', 'products_gallery/rainfire_desk_phone_holder(1)-min.jpg', 120, 45, '2021-10-21 09:07:20', 'Others', 4, 'In Stock', 'Free your hands, rainfire phone stand provide the most comfortable viewing position to prevent back, neck and wrist pain.Perfect for watching videos, browsing recipe,viewing photos, reading, typing, video recording, playing game ,speech and so on.', 0),
(2, '211021031016', 'Hellbox Wireless BT Speaker', 'products_gallery/Hellbox_Wireless_BT_Speakers.jpg', 240, 30, '2021-10-21 09:40:16', 'Speakers', 4, 'In Stock', 'The rainfire brings hellbox. Your all-in-one speaker solution, the hellbox streams music via Bluetooth from smartphones and tablets, powered by a rechargeable battery with up to 5 hours of playtime. It is also equipped with a convenient noise-cancelling speakerphone, allowing you to pick up calls without turning your speaker off. Available with a smooth and durable double-injection finishing, the rainfire hellbox provides exciting, eye-catching contrast wherever it goes and easily compliments anyone’s style. A built-in strap-hook and optional carrying strap, allows you to bring your music everywhere. In a world where style and audio go hand in hand, the rainfire hellbox is everyone’s durable companion.', 0),
(3, '211021032902', 'Wireless Mini Speaker V5.0 -Rainfire', 'products_gallery/rainfire_wireless_mini_speaker(1).jpg', 270, 25, '2021-10-21 09:59:02', 'Speakers', 4, 'In Stock', 'Take your music everywhere you go. This pocket-sized wonder is the perfect companion for your music. Enjoy an immersive and vivid musical experience with enhanced bass delivery. From house parties to streaming movies, make this your go-to device! The durable and rugged material ensures your device always ready for some musical action!', 0),
(4, '211021035657', 'R-207 Wireless Earbuds -Rainfire', 'products_gallery/rainfire_wireless_earbuds_model_R207(1)-min.jpg', 660, 35, '2021-10-21 10:26:57', 'Headphones', 4, 'In Stock', 'Better sound. Better control.\r\n\r\nWhether you’re in the mood for calming tunes or crave some thrilling beats, the bespoke drivers of the R-207 True Wireless deliver high-fidelity sound with deep bass, natural mids and a clear treble.\r\n\r\nPremium sound. Any device.\r\n\r\nNo matter where you stand – iOS or Android – you’ll always get to enjoy the R-207 True Wireless earbuds. Thanks to our wide range of audio codec support including SBC, AAC and aptX, premium sound is guaranteed and with any mobile device.', 0),
(5, '211021043048', 'R-204 True Wireless Earbuds', 'products_gallery/rainfire_r204_wireless_earbuds(1).jpg', 455, 30, '2021-10-21 11:00:48', 'Headphones', 4, 'In Stock', 'True Wireless Stereo Earbuds with deep bass, touch control, and dual HD mic for stereo phone calls.\n\nAdvanced Bluetooth 5.0; Quick Pairing; Strong 10M Wireless Range; Auto-reconnect with Last Paired Device; 12Hrs Total Playback with Case (4hrs earbuds+8hrs from the charging case); 1.5Hrs Charge Time\nPowerful 8mm Dynamic Driver; Ergonomic & Lightweight Earbuds; Passive Noise Cancellation; Ear Wings for Snug-fit; Stereo/Mono Capability; Stereo Phone Calls; Compact & Magnetic Charging Case\n\nFully Integrated Call & Music Controls; Instant Access to Device\'s Voice Assistant; Sweat & Water-resistant Buds; Widely Compatible with Bluetooth Enabled Devices', 0),
(6, '251021032424', 'R-206 Wireless Earbuds -Rainfire', 'products_gallery/rainfire_R206_earbuds(1).jpg', 430, 25, '2021-10-25 09:54:24', 'Headphones', 4, 'In Stock', 'Better sound. Better control. Whether you’re in the mood for calming tunes or crave some thrilling beats, the bespoke drivers of the R-206 True Wireless deliver high-fidelity sound with deep bass, natural mids and a clear treble. Premium sound. Any device. No matter where you stand – iOS or Android – you’ll always get to enjoy the R-206 True Wireless earbuds. Thanks to our wide range of audio codec support including SBC, AAC and aptX, premium sound is guaranteed and with any mobile device.', 0),
(7, '251021033710', 'rainfire Y7 wireless earpods', 'products_gallery/rainfire_earbuds_model_Y7(1).jpg', 450, 35, '2021-10-25 10:07:10', 'Headphones', 4, 'In Stock', 'rainfire Y7 is a premium product with surround sound and Unbelievable performance. High quality audio output with noise cancellation and bass boost. It supports all type of audio formats.', 0),
(8, '251021042657', 'Wireless portable speaker -rainfire', 'products_gallery/rainfire_Portable_wireless_Speaker(1).jpg', 260, 50, '2021-10-25 10:56:57', 'Speakers', 4, 'In Stock', 'Wireless portable speaker brought to you by rainfire. This comes with 10W Stereo Sound that gives excellent stereo sound designed, the right bass and clarity to your music. With its lightweight design, feel the comfort as you carry it everywhere.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_images`
--

CREATE TABLE `p_images` (
  `id` int NOT NULL,
  `p_ID` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_images`
--

INSERT INTO `p_images` (`id`, `p_ID`, `url`) VALUES
(1, '211021023720', 'products_gallery/rainfire_desk_phone_holder(1)-min.jpg'),
(2, '211021023720', 'products_gallery/rainfire_desk_phone_holder(2)-min.jpg'),
(3, '211021023720', 'products_gallery/rainfire_desk_phone_holder(3)-min.jpg'),
(4, '211021031016', 'products_gallery/Hellbox_Wireless_BT_Speakers.jpg'),
(5, '211021032902', 'products_gallery/rainfire_wireless_mini_speaker(1).jpg'),
(6, '211021032902', 'products_gallery/rainfire_wireless_mini_speaker(2).jpg'),
(7, '211021035657', 'products_gallery/rainfire_wireless_earbuds_model_R207(1)-min.jpg'),
(8, '211021035657', 'products_gallery/rainfire_wireless_earbuds_model_R207(2)-min.jpg'),
(9, '211021043048', 'products_gallery/rainfire_r204_wireless_earbuds(1).jpg'),
(10, '211021043048', 'products_gallery/rainfire_r204_wireless_earbuds(2).jpg'),
(11, '251021032424', 'products_gallery/rainfire_R206_earbuds(1).jpg'),
(12, '251021032424', 'products_gallery/rainfire_R2026_earbuds(2).jpg'),
(13, '251021033710', 'products_gallery/rainfire_earbuds_model_Y7(1).jpg'),
(14, '251021033710', 'products_gallery/rainfire_earbuds_model_Y7(2).jpg'),
(15, '251021042657', 'products_gallery/rainfire_Portable_wireless_Speaker(1).jpg'),
(16, '251021042657', 'products_gallery/rainfire_Portable_wireless_Speaker(2).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `specificaions`
--

CREATE TABLE `specificaions` (
  `serial_no` int NOT NULL,
  `product_ID` varchar(255) NOT NULL,
  `p_Spec` varchar(255) NOT NULL,
  `spec_Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specificaions`
--

INSERT INTO `specificaions` (`serial_no`, `product_ID`, `p_Spec`, `spec_Value`) VALUES
(1, '211021023720', 'Brand', 'Rainfire'),
(2, '211021023720', 'Compatible Devices', 'Smartphones, Tablets, Gaming Consoles'),
(3, '211021023720', 'Special Features', 'Adjustable'),
(4, '211021023720', 'Batteries Included', 'No'),
(5, '211021023720', 'Batteries Required', 'No'),
(6, '211021023720', 'Material', 'Aluminium'),
(7, '211021023720', 'Mounting Type', 'Tabletop, Floor Stand'),
(8, '211021023720', 'Has Auto Focus', 'No'),
(9, '211021023720', 'Programmable Buttons', 'No'),
(10, '211021031016', 'Brand Name', 'Rainfire'),
(11, '211021031016', 'Speaker Type', 'Home Theatre'),
(12, '211021031016', 'Connectivity', 'Bluetooth'),
(13, '211021032902', 'Brand', 'rainfire'),
(14, '211021032902', 'Batteries', '‎1 Lithium Polymer batteries required. (included)'),
(15, '211021032902', 'Speaker Connectivity', 'Wireless'),
(16, '211021032902', 'Power Source', 'Battery Powered'),
(17, '211021032902', 'Battery Average Life', '5 Hours'),
(18, '211021032902', 'Mounting Type', 'Tabletop'),
(19, '211021032902', 'Battery Cell Composition', 'Lithium Ion'),
(20, '211021035657', 'Brand', 'Rainfire'),
(21, '211021035657', 'Model Year', '2021'),
(22, '211021035657', 'Batteries', '3 Lithium Polymer batteries required. (included)'),
(23, '211021035657', 'Special Features', 'Android Phone Control, IOS Phone Control, Microphone Feature'),
(24, '211021035657', 'Mounting Hardware', 'R-207 True Wireless earbuds'),
(25, '211021035657', 'Microphone Form Factor', 'Built-In'),
(26, '211021035657', 'Power Source', 'Battery-Powered'),
(27, '211021035657', 'Connector Type', 'Wireless'),
(28, '211021035657', 'Rechargable Battery', 'Yes'),
(29, '211021043048', 'Brand', 'Rainfire'),
(30, '211021043048', 'Batteries', '3 Lithium Polymer batteries required. (included)'),
(31, '211021043048', 'Special Features', 'Sweatproof, Microphone Included, Fast Charging'),
(32, '211021043048', 'Connector Type', 'Wireless'),
(33, '251021032424', 'Brand', 'Rainfire'),
(34, '251021032424', 'Model Year', '2021'),
(35, '251021032424', 'Special Features', 'Android Phone Control, IOS Phone Control, Microphone Feature'),
(36, '251021032424', 'Mounting Hardware', 'R-206 True Wireless earbuds'),
(37, '251021032424', 'Microphone Form Factor', 'Built-In'),
(38, '251021032424', 'Power Source', 'Battery-Powered'),
(39, '251021033710', 'Brand', 'Rainfire'),
(40, '251021033710', 'Color', 'Black'),
(41, '251021033710', 'Bass Boost', 'Yes'),
(42, '251021033710', 'Surround Sound', 'Yes'),
(43, '251021033710', 'Standby time', '36 hours'),
(44, '251021033710', 'playtime', '8 hours'),
(45, '251021042657', 'Speakers', '3Ω'),
(46, '251021042657', 'Battery', '800mA, 3.7V'),
(47, '251021042657', 'Wireless version', '4.1'),
(48, '251021042657', 'Wireless Profiles', 'HFP, HSP.A2DP/AVPCP'),
(49, '251021042657', 'input power', 'dC 5V, 800mA'),
(50, '251021042657', 'Frequency Response', '20Hz - 20kHz'),
(51, '251021042657', 'Signal To noise ratio', '75db - 95db'),
(52, '251021042657', 'Distortion degree', '≤ 1%'),
(53, '251021042657', 'Playtime', 'approx. 2hrs'),
(54, '251021042657', 'Accessories', 'Charging cable, AUX cable'),
(55, '251021042657', 'Charging interface', 'micro USB');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_Details`
--
ALTER TABLE `order_Details`
  MODIFY `unique_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `p_images`
--
ALTER TABLE `p_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `specificaions`
--
ALTER TABLE `specificaions`
  MODIFY `serial_no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
