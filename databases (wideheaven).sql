-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 07:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wideheaven`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin-login`
--

CREATE TABLE `admin-login` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `brand_description` text NOT NULL,
  `brand_image` text NOT NULL,
  `brand_product` varchar(20) NOT NULL,
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `user_id` int(20) NOT NULL,
  `sho_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` datetime NOT NULL,
  `cart_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(50) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `user_id` int(20) NOT NULL,
  `category_description` text NOT NULL,
  `category_image` text NOT NULL,
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `city` char(20) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `disc_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `disc_name` varchar(20) NOT NULL,
  `disc_percent` decimal(20,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` datetime NOT NULL,
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `user_id` int(20) NOT NULL,
  `order_id` int(30) NOT NULL,
  `payment_id` int(20) NOT NULL,
  `total` decimal(20,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `order_id` int(20) NOT NULL,
  `amount` int(20) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `price` int(20) NOT NULL,
  `discount` int(10) NOT NULL,
  `actualprice` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `description` varchar(500) NOT NULL,
  `productstock` float NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping _session`
--

CREATE TABLE `shopping _session` (
  `user_id` int(20) NOT NULL,
  `shop_id` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_no` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_phone-no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `user_id` int(11) NOT NULL,
  `user_email` int(11) NOT NULL,
  `user_password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin-login`
--
ALTER TABLE `admin-login`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`disc_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shopping _session`
--
ALTER TABLE `shopping _session`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `disc_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopping _session`
--
ALTER TABLE `shopping _session`
  MODIFY `shop_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `discount_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `payment_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_items` (`order_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
