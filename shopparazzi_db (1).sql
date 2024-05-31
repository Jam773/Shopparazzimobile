-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 06:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopparazzi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productprices`
--

CREATE TABLE `productprices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `scraped_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productprices`
--

INSERT INTO `productprices` (`id`, `product_id`, `store_id`, `price`, `scraped_at`) VALUES
(1, 4, 1, 3.80, '2024-05-26 02:04:06'),
(2, 5, 1, 3.80, '2024-05-26 02:04:06'),
(3, 6, 1, 3.80, '2024-05-26 02:04:06'),
(4, 7, 1, 3.80, '2024-05-26 02:04:06'),
(5, 8, 1, 3.80, '2024-05-26 02:04:06'),
(6, 9, 1, 3.80, '2024-05-26 02:04:06'),
(7, 10, 1, 3.80, '2024-05-26 02:04:06'),
(8, 11, 1, 3.80, '2024-05-26 02:04:06'),
(9, 12, 1, 3.80, '2024-05-26 02:04:06'),
(10, 13, 1, 3.80, '2024-05-26 02:04:06'),
(11, 14, 1, 3.80, '2024-05-26 02:04:06'),
(12, 15, 1, 3.80, '2024-05-26 02:04:06'),
(13, 16, 1, 3.80, '2024-05-26 02:04:06'),
(14, 17, 1, 3.80, '2024-05-26 02:04:06'),
(15, 18, 1, 3.80, '2024-05-26 02:04:06'),
(16, 19, 1, 3.80, '2024-05-26 02:04:06'),
(17, 20, 1, 3.80, '2024-05-26 02:04:06'),
(18, 21, 1, 3.79, '2024-05-26 02:04:06'),
(19, 22, 1, 0.80, '2024-05-26 02:04:06'),
(20, 23, 1, 0.80, '2024-05-26 02:04:06'),
(21, 24, 1, 0.80, '2024-05-26 02:04:06'),
(22, 25, 1, 0.80, '2024-05-26 02:04:06'),
(23, 26, 1, 0.80, '2024-05-26 02:04:06'),
(24, 27, 1, 0.80, '2024-05-26 02:04:06'),
(25, 28, 1, 2.99, '2024-05-26 02:04:06'),
(26, 29, 1, 2.99, '2024-05-26 02:04:06'),
(27, 30, 1, 2.99, '2024-05-26 02:04:06'),
(28, 31, 1, 2.99, '2024-05-26 02:04:06'),
(29, 32, 1, 2.99, '2024-05-26 02:04:06'),
(30, 33, 1, 2.99, '2024-05-26 02:04:06'),
(31, 34, 1, 2.99, '2024-05-26 02:04:06'),
(32, 35, 1, 2.99, '2024-05-26 02:04:06'),
(33, 36, 1, 2.99, '2024-05-26 02:04:06'),
(34, 37, 1, 2.99, '2024-05-26 02:04:06'),
(35, 38, 1, 2.99, '2024-05-26 02:04:06'),
(36, 39, 1, 2.49, '2024-05-26 02:04:06'),
(37, 40, 1, 2.49, '2024-05-26 02:04:06'),
(38, 41, 1, 0.00, '2024-05-26 02:04:06'),
(39, 42, 1, 3.28, '2024-05-26 02:04:06'),
(40, 43, 1, 2.99, '2024-05-26 02:04:06'),
(41, 44, 1, 2.99, '2024-05-26 02:04:06'),
(42, 45, 1, 3.29, '2024-05-26 02:04:06'),
(43, 46, 1, 5.00, '2024-05-26 02:04:06'),
(44, 47, 1, 5.00, '2024-05-26 02:04:06'),
(45, 48, 1, 5.00, '2024-05-26 02:04:06'),
(46, 49, 1, 3.79, '2024-05-26 02:04:06'),
(47, 50, 1, 4.98, '2024-05-26 02:04:06'),
(48, 51, 1, 4.00, '2024-05-26 02:04:06'),
(49, 52, 1, 4.00, '2024-05-26 02:04:06'),
(50, 53, 2, 3.00, '2024-05-26 02:07:38'),
(51, 54, 2, 3.00, '2024-05-26 02:07:38'),
(52, 55, 2, 6.00, '2024-05-26 02:07:38'),
(53, 56, 2, 6.00, '2024-05-26 02:07:38'),
(54, 57, 2, 6.00, '2024-05-26 02:07:38'),
(55, 58, 2, 6.00, '2024-05-26 02:07:38'),
(56, 59, 2, 6.00, '2024-05-26 02:07:38'),
(57, 60, 2, 6.00, '2024-05-26 02:07:38'),
(58, 61, 2, 3.80, '2024-05-26 02:07:38'),
(59, 62, 2, 3.80, '2024-05-26 02:07:38'),
(60, 63, 2, 6.00, '2024-05-26 02:07:38'),
(61, 64, 2, 6.00, '2024-05-26 02:07:38'),
(62, 65, 2, 3.25, '2024-05-26 02:07:38'),
(63, 66, 2, 3.25, '2024-05-26 02:07:38'),
(64, 67, 2, 3.25, '2024-05-26 02:07:38'),
(65, 68, 2, 3.25, '2024-05-26 02:07:38'),
(66, 69, 2, 3.25, '2024-05-26 02:07:38'),
(67, 70, 2, 3.25, '2024-05-26 02:07:38'),
(68, 71, 2, 6.00, '2024-05-26 02:07:38'),
(69, 72, 2, 6.00, '2024-05-26 02:07:38'),
(70, 73, 2, 6.00, '2024-05-26 02:07:38'),
(71, 74, 2, 6.00, '2024-05-26 02:07:38'),
(72, 75, 2, 3.00, '2024-05-26 02:07:38'),
(73, 76, 2, 3.00, '2024-05-26 02:07:38'),
(74, 77, 2, 7.00, '2024-05-26 02:07:38'),
(75, 78, 2, 7.00, '2024-05-26 02:07:38'),
(76, 79, 2, 3.00, '2024-05-26 02:07:38'),
(77, 80, 2, 3.00, '2024-05-26 02:07:38'),
(78, 81, 2, 3.25, '2024-05-26 02:07:38'),
(79, 82, 2, 3.25, '2024-05-26 02:07:38'),
(80, 83, 2, 3.25, '2024-05-26 02:07:38'),
(81, 84, 2, 3.25, '2024-05-26 02:07:38'),
(82, 85, 2, 3.00, '2024-05-26 02:07:38'),
(83, 86, 2, 3.00, '2024-05-26 02:07:38'),
(84, 87, 2, 6.00, '2024-05-26 02:07:38'),
(85, 88, 2, 6.00, '2024-05-26 02:07:38'),
(86, 89, 2, 6.00, '2024-05-26 02:07:38'),
(87, 90, 2, 6.00, '2024-05-26 02:07:38'),
(88, 91, 2, 6.00, '2024-05-26 02:07:38'),
(89, 92, 2, 6.00, '2024-05-26 02:07:38'),
(90, 93, 2, 3.25, '2024-05-26 02:07:38'),
(91, 94, 2, 3.25, '2024-05-26 02:07:38'),
(92, 95, 2, 3.00, '2024-05-26 02:07:38'),
(93, 96, 2, 3.00, '2024-05-26 02:07:38'),
(94, 97, 2, 7.00, '2024-05-26 02:07:38'),
(95, 98, 2, 7.00, '2024-05-26 02:07:38'),
(96, 99, 2, 3.00, '2024-05-26 02:07:38'),
(97, 100, 2, 3.00, '2024-05-26 02:07:38'),
(98, 101, 2, 3.25, '2024-05-26 02:07:38'),
(99, 102, 2, 3.25, '2024-05-26 02:07:38'),
(100, 103, 2, 3.25, '2024-05-26 02:07:38'),
(101, 104, 2, 3.25, '2024-05-26 02:07:38'),
(102, 105, 2, 3.00, '2024-05-26 02:07:38'),
(103, 4, 1, 3.80, '2024-05-26 02:13:31'),
(104, 5, 1, 3.80, '2024-05-26 02:13:31'),
(105, 6, 1, 3.80, '2024-05-26 02:13:31'),
(106, 7, 1, 3.80, '2024-05-26 02:13:31'),
(107, 8, 1, 3.80, '2024-05-26 02:13:31'),
(108, 9, 1, 3.80, '2024-05-26 02:13:31'),
(109, 10, 1, 3.80, '2024-05-26 02:13:31'),
(110, 11, 1, 3.80, '2024-05-26 02:13:31'),
(111, 12, 1, 3.80, '2024-05-26 02:13:31'),
(112, 13, 1, 3.80, '2024-05-26 02:13:31'),
(113, 14, 1, 3.80, '2024-05-26 02:13:31'),
(114, 15, 1, 3.80, '2024-05-26 02:13:31'),
(115, 16, 1, 3.80, '2024-05-26 02:13:31'),
(116, 17, 1, 3.80, '2024-05-26 02:13:31'),
(117, 18, 1, 3.80, '2024-05-26 02:13:31'),
(118, 19, 1, 3.80, '2024-05-26 02:13:31'),
(119, 20, 1, 3.80, '2024-05-26 02:13:31'),
(120, 21, 1, 3.79, '2024-05-26 02:13:31'),
(121, 22, 1, 0.80, '2024-05-26 02:13:31'),
(122, 23, 1, 0.80, '2024-05-26 02:13:31'),
(123, 24, 1, 0.80, '2024-05-26 02:13:31'),
(124, 25, 1, 0.80, '2024-05-26 02:13:31'),
(125, 26, 1, 0.80, '2024-05-26 02:13:31'),
(126, 27, 1, 0.80, '2024-05-26 02:13:31'),
(127, 28, 1, 2.99, '2024-05-26 02:13:31'),
(128, 29, 1, 2.99, '2024-05-26 02:13:31'),
(129, 30, 1, 2.99, '2024-05-26 02:13:31'),
(130, 31, 1, 2.99, '2024-05-26 02:13:31'),
(131, 32, 1, 2.99, '2024-05-26 02:13:31'),
(132, 33, 1, 2.99, '2024-05-26 02:13:31'),
(133, 34, 1, 2.99, '2024-05-26 02:13:31'),
(134, 35, 1, 2.99, '2024-05-26 02:13:31'),
(135, 36, 1, 2.99, '2024-05-26 02:13:31'),
(136, 37, 1, 2.99, '2024-05-26 02:13:31'),
(137, 38, 1, 2.99, '2024-05-26 02:13:31'),
(138, 39, 1, 2.49, '2024-05-26 02:13:31'),
(139, 40, 1, 2.49, '2024-05-26 02:13:31'),
(140, 41, 1, 0.00, '2024-05-26 02:13:31'),
(141, 42, 1, 3.28, '2024-05-26 02:13:31'),
(142, 43, 1, 2.99, '2024-05-26 02:13:31'),
(143, 44, 1, 2.99, '2024-05-26 02:13:31'),
(144, 45, 1, 3.29, '2024-05-26 02:13:31'),
(145, 46, 1, 5.00, '2024-05-26 02:13:31'),
(146, 47, 1, 5.00, '2024-05-26 02:13:31'),
(147, 48, 1, 5.00, '2024-05-26 02:13:31'),
(148, 49, 1, 3.79, '2024-05-26 02:13:31'),
(149, 50, 1, 4.98, '2024-05-26 02:13:31'),
(150, 51, 1, 4.00, '2024-05-26 02:13:31'),
(151, 52, 1, 4.00, '2024-05-26 02:13:31'),
(152, 53, 2, 3.00, '2024-05-26 02:13:48'),
(153, 54, 2, 3.00, '2024-05-26 02:13:48'),
(154, 55, 2, 6.00, '2024-05-26 02:13:48'),
(155, 56, 2, 6.00, '2024-05-26 02:13:48'),
(156, 57, 2, 6.00, '2024-05-26 02:13:48'),
(157, 58, 2, 6.00, '2024-05-26 02:13:48'),
(158, 59, 2, 6.00, '2024-05-26 02:13:48'),
(159, 60, 2, 6.00, '2024-05-26 02:13:48'),
(160, 61, 2, 3.80, '2024-05-26 02:13:48'),
(161, 62, 2, 3.80, '2024-05-26 02:13:48'),
(162, 63, 2, 6.00, '2024-05-26 02:13:48'),
(163, 64, 2, 6.00, '2024-05-26 02:13:48'),
(164, 65, 2, 3.25, '2024-05-26 02:13:48'),
(165, 66, 2, 3.25, '2024-05-26 02:13:48'),
(166, 67, 2, 3.25, '2024-05-26 02:13:48'),
(167, 68, 2, 3.25, '2024-05-26 02:13:48'),
(168, 69, 2, 3.25, '2024-05-26 02:13:48'),
(169, 70, 2, 3.25, '2024-05-26 02:13:48'),
(170, 71, 2, 6.00, '2024-05-26 02:13:48'),
(171, 72, 2, 6.00, '2024-05-26 02:13:48'),
(172, 73, 2, 6.00, '2024-05-26 02:13:48'),
(173, 74, 2, 6.00, '2024-05-26 02:13:48'),
(174, 75, 2, 3.00, '2024-05-26 02:13:48'),
(175, 76, 2, 3.00, '2024-05-26 02:13:48'),
(176, 77, 2, 7.00, '2024-05-26 02:13:48'),
(177, 78, 2, 7.00, '2024-05-26 02:13:48'),
(178, 79, 2, 3.00, '2024-05-26 02:13:48'),
(179, 80, 2, 3.00, '2024-05-26 02:13:48'),
(180, 81, 2, 3.25, '2024-05-26 02:13:48'),
(181, 82, 2, 3.25, '2024-05-26 02:13:48'),
(182, 83, 2, 3.25, '2024-05-26 02:13:48'),
(183, 84, 2, 3.25, '2024-05-26 02:13:48'),
(184, 85, 2, 3.00, '2024-05-26 02:13:48'),
(185, 86, 2, 3.00, '2024-05-26 02:13:49'),
(186, 87, 2, 6.00, '2024-05-26 02:13:49'),
(187, 88, 2, 6.00, '2024-05-26 02:13:49'),
(188, 89, 2, 6.00, '2024-05-26 02:13:49'),
(189, 90, 2, 6.00, '2024-05-26 02:13:49'),
(190, 91, 2, 6.00, '2024-05-26 02:13:49'),
(191, 92, 2, 6.00, '2024-05-26 02:13:49'),
(192, 93, 2, 3.25, '2024-05-26 02:13:49'),
(193, 94, 2, 3.25, '2024-05-26 02:13:49'),
(194, 95, 2, 3.00, '2024-05-26 02:13:49'),
(195, 96, 2, 3.00, '2024-05-26 02:13:49'),
(196, 97, 2, 7.00, '2024-05-26 02:13:49'),
(197, 98, 2, 7.00, '2024-05-26 02:13:49'),
(198, 99, 2, 3.00, '2024-05-26 02:13:49'),
(199, 100, 2, 3.00, '2024-05-26 02:13:49'),
(200, 101, 2, 3.25, '2024-05-26 02:13:49'),
(201, 102, 2, 3.25, '2024-05-26 02:13:49'),
(202, 103, 2, 3.25, '2024-05-26 02:13:49'),
(203, 104, 2, 3.25, '2024-05-26 02:13:49'),
(204, 105, 2, 3.00, '2024-05-26 02:13:49'),
(205, 79, 1, 2.00, '2024-05-27 16:13:28'),
(206, 80, 1, 2.90, '2024-05-27 16:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `volume`, `image_url`, `category`, `created_at`, `updated_at`) VALUES
(4, 'Choceur Crunchy Salted Caramel Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/a/3/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_8_7bc76997eb.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(5, 'Choceur Dark Caramel Sea Salt Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/9/c/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_4_e392dca6a6.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(6, 'Choceur Milk Coconut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/1/3/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_1_RET_R_3e5c21c533.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(7, 'Choceur White Coconut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/8/a/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_2_RET_R_c9c3345954.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(8, 'Choceur Caramel Filled Milk Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/7/f/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_5_fdc935047d.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(9, 'Choceur Milk & White Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/d/8/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_3_af48d29400.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(10, 'Choceur Salted Pretzel Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/9/c/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_9_5bf0c70128.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(11, 'Choceur Coffee & Cream Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/e/d/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_6_59516ad41c.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(12, 'Choceur Milk Hazelnut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/7/9/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_11_b39736bd16.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(13, 'Choceur Dark Hazelnut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/d/4/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_10_02f6e4fe6b.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(14, 'Choceur Fruit & Nut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/5/4/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_1_803f15b074.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(15, 'Choceur White Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/d/7/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_7_e6e5c1c4bf.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(16, 'Choceur Rum Raisin & Nut Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/a/d/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_2_7c8eec3e50.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(17, 'Choceur Milk Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/4/9/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_12_af9d1c65e3.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(18, 'Choceur Dark Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/8/e/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_13_fd3d84b56c.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(19, 'Choceur Milk Almond Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/7/3/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_14_4515daa2f1.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(20, 'Choceur Dark Almond Chocolate Block', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/0/7/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_3_RET_R_ea8d408093.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(21, 'Choceur Dark Peppermint Chocolate Block', '205g', 'https://www.aldi.com.au/fileadmin/_processed_/7/9/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_15_beda922fa1.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(22, 'Choceur Hazelnut Crème Mini Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/c/e/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_20_f58d7e96f5.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(23, 'Choceur Milk Mini Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/a/e/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_18_3bbae05cf8.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(24, 'Choceur Dark Mini Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/d/7/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_17_9cdf713975.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(25, 'Choceur White Mini Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/d/7/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_19_9f2b878d10.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(26, 'Choceur Hazelnut Mini Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/d/3/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_16_36efc30d1c.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(27, 'Choceur Mini Marzipan Chocolate Bars 5 x', '40g', 'https://www.aldi.com.au/fileadmin/_processed_/7/0/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_21_077af7e25c.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(28, 'Moser Roth Orange & Almond Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/2/e/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_22_e56962c589.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(29, 'Moser Roth Dark Hazelnut Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/6/5/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_23_1737128457.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(30, 'Moser Roth Dark 70% Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/e/e/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_24_86f990c533.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(31, 'Moser Roth Dark 85% Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/7/4/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_25_7d47626ad4.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(32, 'Moser Roth Dark Sea Salt Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/b/5/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_26_7d5bee5ffd.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(33, 'Moser Roth Dark Mint Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/6/3/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_8_RET_a46ff2f196.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(34, 'Moser Roth Dark Raspberry Almond Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/8/1/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_9_RET_96b909009b.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(35, 'Moser Roth Dark Sea Salt Caramel Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/5/d/csm_1001605-8_1x1_Q4_WEB-AUDIT_CHOCOLATE_228x128_29_a3b07db43f.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(36, 'Moser Roth Milk Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/e/a/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_10_RET_d27ee0e1ac.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(37, 'Moser Roth Madagascan Vanilla Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/3/c/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_11_RET_9c72f5ea60.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(38, 'Moser Roth Dark 90% Chocolate Block', '125g', 'https://www.aldi.com.au/fileadmin/_processed_/b/f/csm_1002370-4_Q3_WEB_AUDIT_1x1_228x128_55_RET_8a97ae2648.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(39, 'Just Organic Dark Chocolate with Sea Salt', '100g', 'https://www.aldi.com.au/fileadmin/_processed_/3/3/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_5_RET_e05ac5f8f1.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(40, 'Just Organic Dark Chocolate', '100g', 'https://www.aldi.com.au/fileadmin/_processed_/1/3/csm_1001829-3_Q1-WEB-AUDIT_CHOCO_1x1_228x128_4_RET_b3ce6e8242.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(41, 'Knoppers 8pk/', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/1/3/csm_ALN3708_Q4-WEB_NEW-1x1_228x128_1_e1f507bf36.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(42, 'Dairy Fine Titan Chocolate Bar Sharepack', '216g', 'https://www.aldi.com.au/fileadmin/_processed_/b/9/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_20_RET_db113ce387.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(43, 'Dairy Fine Chocolate Munchers', '180g', 'https://www.aldi.com.au/fileadmin/_processed_/9/7/csm_ALN3708_Q4-WEB_NEW-1x1_228x128_4_20bc38647c.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(44, 'Dairy Fine Peanut Munchers', '180g', 'https://www.aldi.com.au/fileadmin/_processed_/3/9/csm_ALN3708_Q4-WEB_NEW-1x1_228x128_5_b8b13d8cf2.jpg', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(45, 'Dairy Fine Double Time Sharepack', '180g', 'https://www.aldi.com.au/fileadmin/_processed_/a/8/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_23_RET_78be478695.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(46, 'Merci Milk & Creamy Chocolate Mix', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/f/3/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_55_RET_fd299348cd.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(47, 'Merci Milk & Dark Chocolate Mix', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/8/5/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_56_RET_f97cc71875.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(48, 'Merci Chocolate Mousse Mix', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/6/4/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_57_RET_60a0033c47.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(49, 'Choceur Liviano Milk Hazelnut Crème', '150g', 'https://www.aldi.com.au/fileadmin/_processed_/e/b/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_58_RET_7b5efb3b70.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(50, 'Belmont Biscuit Co. Choc Biscuit Bars – Milk & Cappuccino', '300g', 'https://www.aldi.com.au/fileadmin/_processed_/0/e/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_59_RET_d669120ec6.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(51, 'Choceur Cookies & Milk Sticks 11pk/', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/c/7/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_60_RET_263b308b59.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(52, 'Choceur Chocolate Milk Sticks 11pk/', '200g', 'https://www.aldi.com.au/fileadmin/_processed_/3/0/csm_1002179-1_Q2_WEB_AUDIT_1x1_228x128_61_RET_9b37b7d5f4.png', 'Chocolate', '2024-05-26 02:04:06', '2024-05-26 02:04:06'),
(53, 'Cadbury Dairy Milk Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351709.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(54, 'Darrell Lea Milk Chocolate Raspberry Rocklea Road Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3759635.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(55, 'Darrell Lea Peppermint Whip Dark Block', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5556650.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(56, 'Darrell Lea Cheesecake Shop Caramel Milk Chocolate Block', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F6%2F6329574.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(57, 'Darrell Lea Milk Chocolate Rocklea Road Raspberry Slab', '145g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F4%2F4253325.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(58, 'Darrell Lea Milk Chocolate Traditional Rocklea Road Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3919844.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(59, 'Lindt Extra Creamy Excellence Milk Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7152448.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(60, 'Lindt Excellence 70% Cocoa Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7152550.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(61, 'Lindt Excellence Mint Intense Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5460267.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(62, 'KitKat Milk Chocolate Block', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5872479.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(63, 'Milkybar White Choc Block', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7767770.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(64, 'Cadbury  Dairy Milk Hazelnut Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351720.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(65, 'Cadbury Dairy Milk Large Chocolate Block', '360g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F4%2F4229444.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(66, 'Cadbury Dairy Milk Marvellous Creations Jelly Popping Candy Chocol ... 190g', 'Unknown', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2898997.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(67, 'Lindt Excellence 85% Cocoa Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F9%2F9524521.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(68, 'Lindt Excellence Orange Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F4%2F4194827.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(69, 'Cadbury Dairy Milk Fruit and Nut Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351651.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(70, 'KitKat Cookie Dough Block Chocolate', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7524247.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(71, 'Aero Peppermint Milk Chocolate Block', '118g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7157168.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(72, 'KitKat Packed With Milo Milk Chocolate Block', '165g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5389720.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(73, 'Lindt Excellence 95% Cocoa Ultimate Dark Chocolate Block', '80g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3501374.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(74, 'Cadbury Dairy Milk Caramello Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351662.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(75, 'Lindt Les Grandes Milk chocolate & Hazelnut Block', '150g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3759238.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(76, 'Cadbury Dairy Milk Roast Almond Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351630.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(77, 'Lindt Excellence 90% Cocoa Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F1%2F1735589.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(78, 'Lindt Excellence Raspberry Intense Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2221383.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(79, 'Cadbury Dairy Milk Snack Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351618.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(80, 'Cadbury Dairy Milk Peanut Caramel Slice Chocolate Block', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7864686.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(81, 'Lindt Lindor Milk Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5379952.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(82, 'KitKat Smooth Hazelnut Milk Chocolate Block', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5822062.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(83, 'KitKat Dark Chocolate Block', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2799259.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(84, 'Cadbury Dairy Milk Black Forest Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351673.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(85, 'Lindt Excellence Sea Salt Caramel Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2024495.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(86, 'KitKat Honeycomb Buzz Block Chocolate', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7866014.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(87, 'Lindt Excellence Salty Liquorice Block Chocolate', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7865995.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(88, 'Cadbury Old Gold Jamaica Rum N Raisin Dark Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2350557.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(89, 'KitKat Tasmanian Mint Dark Chocolate Block', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F4%2F4150162.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(90, 'Cadbury Old Gold Roast Almond Dark Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2350535.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(91, 'Cadbury Caramilk Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3613130.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(92, 'Lindt Excellence 78% Cocoa Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2876349.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(93, 'Lindt Les Grandes Dark Chocolate & Hazelnut Block', '150g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3759260.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(94, 'Cadbury Dairy Milk Top Deck Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351607.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(95, 'KitKat Gold Crush Block Chocolate', '160g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7866036.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(96, 'Coles Belgian Milk Chocolate Block', '200g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F3%2F3446651.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(97, 'Cadbury Dairy Milk Raspberry Slices Chocolate Block', '178g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7864664.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(98, 'Cadbury Old Gold Original Dark Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2350568.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(99, 'Cadbury Dairy Milk Peppermint Milk Chocolate Block', '180g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2351640.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(100, 'Lindt Excellence 70% Smooth Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2652159.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(101, 'Milkybar Cookies & Cream White Choc Block', '170g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F8%2F8189705.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(102, 'Lindt Excellence Sea Salt  Dark Chocolate Block', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F7%2F7581841.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(103, 'Whittaker\'s Block Chocolate Creamy Milk Block', '250g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F5%2F5365459.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(104, 'Coles Finest Belgian Dark Block 85%', '100g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F2%2F2618037.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38'),
(105, 'Hershey Chocolate Block Cookies \'N\' Creme', '184g', 'https://www.coles.com.au/_next/image?url=https%3A%2F%2Fproductimages.coles.com.au%2Fproductimages%2F6%2F6313847.jpg&w=640&q=90', 'Chocolate', '2024-05-26 02:07:38', '2024-05-26 02:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Aldi', 'https://www.aldi.com.au', '2024-05-26 01:58:54', '2024-05-26 01:58:54'),
(2, 'Coles', 'https://www.coles.com.au', '2024-05-26 01:58:54', '2024-05-26 01:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'kalpani', 'kalpani@gmail.com', '123456789', '2024-05-24 09:31:13', '2024-05-24 09:31:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `productprices`
--
ALTER TABLE `productprices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productprices`
--
ALTER TABLE `productprices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `productprices`
--
ALTER TABLE `productprices`
  ADD CONSTRAINT `productprices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productprices_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
