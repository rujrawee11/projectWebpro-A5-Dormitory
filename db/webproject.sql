-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2022 at 10:01 PM
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
-- Database: `webproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `status` enum('01','02') NOT NULL DEFAULT '01',
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `like` int(11) NOT NULL DEFAULT 0,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `status`, `pinned`, `like`, `create_date`, `create_by_id`) VALUES
(1, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '01', 0, 23, '2021-03-08 22:12:58', 1),
(2, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '02', 0, 4, '2021-03-08 22:13:38', 2),
(3, 'Where does it come from?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '01', 0, 3, '2021-03-08 22:14:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `like` int(11) NOT NULL DEFAULT 0,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blog_id`, `comment`, `like`, `comment_date`, `comment_by_id`) VALUES
(1, 1, 'I love your blog!', 0, '2021-03-08 22:14:41', 1),
(2, 1, 'Cool :)', 0, '2021-03-08 22:14:54', 1),
(3, 2, 'new', 1, '2022-04-21 13:21:35', 2),
(5, 2, 'new2', 0, '2022-04-22 01:55:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` int(10) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `room_price` float(8,2) DEFAULT NULL,
  `room_number` char(4) DEFAULT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `status` enum('rent','move_out') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract_id`, `tenant_id`, `first_name`, `last_name`, `address`, `phone`, `start_date`, `end_date`, `room_price`, `room_number`, `room_type`, `status`) VALUES
(1, 1, 'Admin', 'Webpro', 'บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง เขตลาดกระบัง', '0998887777', '2022-04-04', '2023-04-04', 5500.00, 'E201', 'medium', 'rent'),
(2, 2, 'Author', 'First', 'บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง เขตลาดกระบัง', '098948658', '2022-04-05', '2023-04-05', 5500.00, 'E205', 'medium', 'rent'),
(3, 3, 'Por', 'Aphatsara', 'บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง เขตลาดกระบัง', '0622108493', '2022-04-05', '2023-04-05', 6500.00, 'A201', 'large', 'rent'),
(4, 4, 'Rujrawee', 'Meela', 'บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง เขตลาดกระบัง', '0804005019', '2022-04-05', '2024-04-05', 5500.00, 'B202', 'medium', 'rent'),
(5, 5, 'Por', 'Por', 'บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง เขตลาดกระบัง', '0254888589', '2022-05-06', '2023-05-06', 6500.00, 'A206', 'large', 'rent');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `follow_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `news_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `file_path`, `upload_date`, `news_id`) VALUES
(1, '/uploads/bill2.png', '2022-04-30 18:23:27', 1),
(2, '/uploads/user.png', '2022-04-30 18:48:21', 1),
(3, '/uploads/user2.png', '2022-04-30 18:54:52', 1),
(4, '/uploads/user3.png', '2022-04-30 19:03:43', 1),
(5, '/uploads/invoice2.png', '2022-04-30 19:09:51', 1),
(6, '/uploads/img1.png', '2022-04-30 20:01:09', 0),
(7, '/uploads/img2.png', '2022-04-30 20:01:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `file_path` varchar(200) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by_id` int(11) DEFAULT NULL,
  `main` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `blog_id`, `comment_id`, `file_path`, `upload_date`, `update_by_id`, `main`) VALUES
(1, 1, NULL, '/uploads/cats1.png', '2021-03-16 14:03:36', NULL, 1),
(2, 2, NULL, '/uploads/cats2.jpeg', '2021-03-16 14:04:27', 0, 1),
(3, 2, NULL, '/uploads/cats3.jpeg', '2021-03-16 14:51:56', NULL, 0),
(4, 3, NULL, '/uploads/cats3.jpeg', '2022-03-27 22:45:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_number` int(10) NOT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `room_number` char(4) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `common_fee` float(8,2) DEFAULT NULL,
  `dorm_fee` float(8,2) DEFAULT NULL,
  `electricity_fee` float(8,2) DEFAULT NULL,
  `water_fee` float(8,2) DEFAULT NULL,
  `expenses` double DEFAULT NULL,
  `fine` float(8,2) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total` float(8,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` enum('UNAPPROVED_BILL','APPROVED_BILL','EXPIRED_BILL','SENT') DEFAULT NULL,
  `tenant_id` int(10) NOT NULL,
  `emp_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_number`, `month`, `year`, `room_number`, `invoice_date`, `common_fee`, `dorm_fee`, `electricity_fee`, `water_fee`, `expenses`, `fine`, `discount`, `total`, `note`, `status`, `tenant_id`, `emp_id`) VALUES
(1, 'มกราคม', 2021, 'E201', '2022-04-28', 500.00, 6500.00, 636.00, 34.00, 100, NULL, 300, 8013.90, 'ได้รับส่วนลด 200 บาท', 'APPROVED_BILL', 1, 1),
(32, 'มกราคม', 2022, 'A201', '2022-04-28', 500.00, 6500.00, 660.00, 85.00, 500, NULL, 399, 8247.15, '', 'UNAPPROVED_BILL', 3, 0),
(33, 'มกราคม', 2022, 'E205', '2022-04-28', 500.00, 5500.00, 1200.00, 51.00, 100, NULL, 0, 7865.57, '', 'UNAPPROVED_BILL', 2, 0),
(34, 'มกราคม', 2022, 'B202', NULL, 500.00, 5500.00, 660.00, 17.00, 0, NULL, 0, 7144.39, '', 'UNAPPROVED_BILL', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meter`
--

CREATE TABLE `meter` (
  `meter_id` int(10) UNSIGNED NOT NULL,
  `utilities_type` enum('ELECTRICITY_FEE','WATER_FEE') DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `consumpttion` float(8,2) DEFAULT NULL,
  `used_unit` int(11) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `tenant_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meter`
--

INSERT INTO `meter` (`meter_id`, `utilities_type`, `month`, `year`, `consumpttion`, `used_unit`, `price`, `tenant_id`) VALUES
(1, 'ELECTRICITY_FEE', 'มกราคม', 2022, 6.00, 106, 636.00, 1),
(2, 'WATER_FEE', 'มกราคม', 2022, 17.00, 2, 34.00, 1),
(3, 'ELECTRICITY_FEE', 'มกราคม', 2022, 6.00, 200, 1200.00, 2),
(4, 'WATER_FEE', 'มกราคม', 2022, 17.00, 3, 51.00, 2),
(5, 'ELECTRICITY_FEE', 'มกราคม', 2022, 6.00, 110, 660.00, 3),
(6, 'WATER_FEE', 'มกราคม', 2022, 17.00, 5, 85.00, 3),
(7, 'ELECTRICITY_FEE', 'มกราคม', 2022, 6.00, 110, 660.00, 4),
(8, 'WATER_FEE', 'มกราคม', 2022, 17.00, 1, 17.00, 4),
(9, 'ELECTRICITY_FEE', 'มกราคม', 2022, 6.00, 110, 660.00, 5),
(10, 'WATER_FEE', 'มกราคม', 2022, 17.00, 1, 17.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `detail_news` text DEFAULT NULL,
  `date_news` date DEFAULT NULL,
  `emp_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE `parcel` (
  `parcel_id` bigint(20) UNSIGNED NOT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `room_number` char(4) DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `receive_date` date DEFAULT NULL,
  `transport_name` varchar(255) DEFAULT NULL,
  `status` enum('not_received','received') DEFAULT 'not_received',
  `tenant_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`parcel_id`, `p_name`, `room_number`, `sent_date`, `receive_date`, `transport_name`, `status`, `tenant_id`) VALUES
(1, 'May', 'E205', '2022-03-28', '2022-04-28', 'Shopee', 'received', 1),
(3, 'May', 'E205', '2022-04-15', '2022-04-28', 'Flash', 'received', 1),
(4, 'May', 'E205', '2022-04-15', '0000-00-00', 'Kerry', 'not_received', 2),
(5, 'May', 'E205', '2022-04-15', '0000-00-00', 'Kerry', 'not_received', 2),
(6, 'May', 'E205', '2022-04-15', '2022-04-28', 'Flash', 'received', 1),
(7, 'May', 'E205', '2022-04-15', '2022-04-28', 'Flash', 'received', 1),
(8, 'May', 'E205', '2022-04-15', '2022-04-28', 'Flash', 'received', 1),
(9, 'May', 'E205', '2022-04-15', '2022-04-28', 'Flash', 'received', 1),
(10, 'May', 'E205', '2022-04-03', NULL, 'Kerry', 'not_received', 2),
(11, 'May', 'E205', '2022-04-15', '2022-04-27', 'Flash', 'received', 1),
(12, 'May', 'E205', '2022-04-15', '2022-04-27', 'Flash', 'received', 1),
(13, 'Por', 'E201', '2022-04-20', '2022-04-28', 'Kerry', 'received', 2),
(14, 'Por', 'E201', '2022-04-20', NULL, 'Kerry', 'not_received', 2),
(15, 'Por', 'E201', '2022-04-26', NULL, 'Flash', 'not_received', 2),
(16, 'Por', 'E201', '2022-04-27', NULL, 'Flash', 'not_received', 2),
(17, 'Por', 'E201', '2022-04-27', NULL, 'Flash', 'not_received', 2),
(28, 'Por', 'E201', '2022-04-26', NULL, 'Flash', 'not_received', 2),
(37, 'Por', 'E201', '2022-04-27', '2022-04-28', 'Flash', 'received', 1),
(38, 'May', 'E205', '2022-04-27', '2022-04-28', 'Kerry', 'received', 1),
(40, 'Por', 'E201', '2022-04-27', '2022-04-28', 'Kerry', 'received', 1),
(44, 'Por', 'E201', '2022-04-14', '2022-04-28', 'Kerry', 'received', 1),
(45, 'May', 'E205', '2022-04-06', '2022-04-28', 'Kerry', 'received', 1),
(46, 'Por', 'ไม่ร', '2022-04-27', '2022-04-28', 'Flash', 'received', 1),
(47, 'May', 'E205', '2022-04-21', '2022-04-28', 'Kerry', 'received', 1),
(48, 'Por', 'E201', '2022-04-21', '2022-04-28', 'Kerry', 'received', 1),
(49, 'May', 'E205', '2022-04-28', '2022-05-01', 'Kerry', 'received', 1),
(50, 'Por', 'E201', '2022-04-29', '2022-04-28', 'Kerry', 'received', 1),
(51, 'May', 'E201', '2022-04-28', '2022-05-01', 'Flash', 'received', 1),
(52, 'May', 'E201', '2022-04-28', '2022-04-29', 'Kerry', 'received', 1),
(53, 'Por', 'E201', '2022-04-27', '2022-04-28', 'Kerry', 'received', 1),
(54, 'May', 'E201', '2022-04-28', '2022-04-28', 'Flash', 'received', 1),
(55, 'Por', 'E201', '2022-04-28', '2022-05-01', 'Kerry', 'received', 1),
(56, 'Por', 'E205', '2022-04-28', NULL, 'Kerry', 'not_received', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_bank` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `invoice_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_image`
--

CREATE TABLE `payment_image` (
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `invoice_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile_image`
--

CREATE TABLE `profile_image` (
  `img_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `tenant_id` int(10) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `lossor_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_image`
--

INSERT INTO `profile_image` (`img_id`, `file_path`, `upload_date`, `tenant_id`, `emp_id`, `lossor_id`) VALUES
(1, '/uploads/cats1.png', '2022-04-14 17:44:14', 1, 0, 0),
(2, '/uploads/cats1.png', '2022-04-15 18:18:26', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rent_detail`
--

CREATE TABLE `rent_detail` (
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `room_number` char(4) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `build` char(1) DEFAULT NULL,
  `room_price` float(8,2) DEFAULT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `common_fee` double DEFAULT NULL,
  `room_status` enum('available','reserve','unavailable') DEFAULT 'available',
  `tenant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rent_detail`
--

INSERT INTO `rent_detail` (`room_id`, `room_number`, `floor`, `build`, `room_price`, `room_type`, `common_fee`, `room_status`, `tenant_id`) VALUES
(1, 'A201', 2, 'A', 6500.00, 'large', 500, 'unavailable', 3),
(2, 'A202', 2, 'A', 5500.00, 'medium', 500, 'available', NULL),
(3, 'A203', 2, 'A', 5500.00, 'medium', 500, 'available', NULL),
(4, 'A204', 2, 'A', 5500.00, 'medium', 500, 'available', NULL),
(5, 'A205', 2, 'A', 5500.00, 'medium', 500, 'reserve', NULL),
(6, 'A206', 2, 'A', 6500.00, 'large', 500, 'unavailable', 5),
(7, 'A301', 3, 'A', 6500.00, 'large', 500, 'reserve', NULL),
(8, 'A302', 3, 'A', 6500.00, 'large', 500, 'reserve', NULL),
(9, 'A303', 3, 'A', 5500.00, 'medium', 500, 'reserve', NULL),
(10, 'A304', 3, 'A', 5500.00, 'medium', 500, 'available', NULL),
(11, 'A305', 3, 'A', 5500.00, 'medium', 500, 'reserve', NULL),
(12, 'A306', 3, 'A', 5500.00, 'medium', 500, 'available', NULL),
(13, 'B201', 2, 'B', 5500.00, 'medium', 500, 'available', NULL),
(14, 'B202', 2, 'B', 5500.00, 'medium', 500, 'unavailable', 4),
(15, 'B203', 2, 'B', 5500.00, 'medium', 500, 'available', NULL),
(16, 'B204', 2, 'B', 5500.00, 'medium', 500, 'available', NULL),
(17, 'B205', 2, 'B', 5500.00, 'medium', 500, 'available', NULL),
(18, 'B206', 2, 'B', 5500.00, 'medium', 500, 'available', NULL),
(19, 'B301', 3, 'B', 5500.00, 'medium', 500, 'available', NULL),
(20, 'B302', 3, 'B', 5500.00, 'medium', 500, 'reserve', NULL),
(21, 'B303', 3, 'B', 5500.00, 'medium', 500, 'available', NULL),
(22, 'B304', 3, 'B', 5500.00, 'medium', 500, 'reserve', NULL),
(23, 'B305', 3, 'B', 6500.00, 'large', 500, 'available', NULL),
(24, 'E201', 2, 'E', 6500.00, 'large', 500, 'unavailable', 1),
(25, 'E202', 2, 'E', 6500.00, 'large', 500, 'reserve', 0),
(26, 'E203', 2, 'E', 5500.00, 'medium', 500, 'available', NULL),
(27, 'E204', 2, 'E', 5500.00, 'medium', 500, 'available', NULL),
(28, 'E205', 2, 'E', 5500.00, 'medium', 500, 'unavailable', 2),
(29, 'E206', 2, 'E', 5500.00, 'medium', 500, 'available', NULL),
(30, 'E301', 3, 'E', 5500.00, 'medium', 500, 'available', NULL),
(31, 'E302', 3, 'E', 5500.00, 'medium', 500, 'available', NULL),
(32, 'E303', 3, 'E', 5500.00, 'medium', 500, 'reserve', NULL),
(33, 'E304', 3, 'E', 5500.00, 'medium', 500, 'available', NULL),
(34, 'E305', 3, 'E', 5500.00, 'medium', 500, 'available', NULL),
(35, 'E306', 3, 'E', 5500.00, 'medium', 500, 'reserve', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reported_information`
--

CREATE TABLE `reported_information` (
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `reporter_name` varchar(255) DEFAULT NULL,
  `problem_detail` varchar(255) DEFAULT NULL,
  `tenant_id` int(10) NOT NULL,
  `emp_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `sex` enum('FEMALE','MALE') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `phone1` char(10) DEFAULT NULL,
  `phone2` char(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `room_id` int(10) NOT NULL,
  `role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenant_id`, `f_name`, `l_name`, `sex`, `birth_date`, `age`, `phone1`, `phone2`, `email`, `username`, `password`, `room_id`, `role`) VALUES
(1, 'Por2', 'Na', 'MALE', '2001-12-12', 20, '191', '212', 'Dormitory2@gmail.com', 'E201', 'po170644', 201, 'EMPLOYEE'),
(2, 'May', 'Ja', 'FEMALE', '2001-12-12', 20, '191', '', 'May@gmail.com', 'E205', 'Po170644', 205, 'TENANT');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`) VALUES
(1, 1, '@HvkYP-wv5Gh6vUnsHlFsDyu0STFB91Sp9TxlxrQG1yyIXPuIs!gdnql^wZBET@H2JnKFHl2K!aog@*CToRt!DF@IXUlpyNNCgz#'),
(2, 3, 'hVYuY@Yru*XnpIZ27t0fw0lQT1gkK6e@MsbDHILeQpu=C6GRhCJI9Q^soQD@#eV*9xp0T20$Q#o3VfDNK-IBMARXJSDBeo0B/wt!'),
(3, 4, 'ohzsd-999mZEN0w8Vx7sZJf^U$BkQHiO#GuGVbK4Qanyvt-mSz203e4VFMJbp6vg4KC70F6^^SFk*=3a3kPcy8/OOZAol8Z@@rbA'),
(4, 5, 'H!4N@#R9g-8hsgtb#WGYON^N&H^X1NSDPdCXRfX-F9KKpAX4LwH2Wuelbt=KDKmV4jCwidE#-ZpJuEGHP/0*pRLnHuDK^DaAEgUs');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `sex` enum('FEMALE','MALE') DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `room_id` char(4) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(10) NOT NULL DEFAULT 'tenant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `sex`, `birth_day`, `age`, `room_id`, `email`, `mobile`, `picture`, `phone2`, `address`, `username`, `password`, `join_date`, `role`) VALUES
(1, 'Admin', 'Webpro', 'MALE', '1996-02-01', 26, 'E201', 'admin@webpro.com', '0998887777', NULL, '191', 'กรุงเทพ', 'admin', '$2b$05$ZuF5bL8EVjt8XgfCnWTsCeWQq0hp.UkjG3t9jf2CXC1u7RTw4zpY2', '2022-04-16 07:31:40', 'tenant'),
(2, 'Author', 'First', 'MALE', '2003-01-01', 19, 'E205', 'author1@webpro.com', '098948658', NULL, '191', 'กรุงเทพ', 'author1', '$2b$05$ZuF5bL8EVjt8XgfCnWTsCeWQq0hp.UkjG3t9jf2CXC1u7RTw4zpY2', '2022-04-16 07:31:40', 'normal'),
(3, 'Por', 'Aphatsara', 'FEMALE', '2001-06-17', 20, 'A201', '63070188@gmail.com', '0622108493', NULL, '191', 'กรุงเทพ', 'hello', '$2b$05$ysKvXCtHMwm1X2BM.aFSBerbrsLjoriU0SZEhfy/T9yBxe0XLM6vu', '2022-04-29 16:55:49', 'employee'),
(4, 'Rujrawee', 'Meela', 'FEMALE', '2001-06-17', 20, 'B202', '63070151@kmitl.ac.th', '0804005019', NULL, '191', 'กรุงเทพ', 'Neay', '$2b$05$dKzl29KgBQOUuyuqV6ldLOFyFQI4RNYT2JAlxSfiheTESfvkSFY9q', '2022-04-30 06:08:43', 'employee'),
(5, 'Por', 'Por', 'FEMALE', '2001-06-17', 20, 'A206', '191@kmitl.ac.th', '0254888589', NULL, '191', 'กรุงเทพ', 'Test22', '$2b$05$BWTzqcShlzdU/wMMKdl0O.YWQPD/KwB/htgmhZoXYbNxIXpas/OD6', '2022-04-30 09:15:20', 'tenant');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `license_plate` varchar(7) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `tenant_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `license_plate`, `color`, `tenant_id`) VALUES
(1, 'กท5698', 'ดำ', 3),
(2, 'ดน8526', 'ขาว', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`user_id`,`follower_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_number`);

--
-- Indexes for table `meter`
--
ALTER TABLE `meter`
  ADD PRIMARY KEY (`meter_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `parcel`
--
ALTER TABLE `parcel`
  ADD PRIMARY KEY (`parcel_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_image`
--
ALTER TABLE `payment_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `profile_image`
--
ALTER TABLE `profile_image`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `rent_detail`
--
ALTER TABLE `rent_detail`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `reported_information`
--
ALTER TABLE `reported_information`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenant_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_UN` (`token`),
  ADD KEY `token_FK` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `contract_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_number` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `meter`
--
ALTER TABLE `meter`
  MODIFY `meter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel`
--
ALTER TABLE `parcel`
  MODIFY `parcel_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_image`
--
ALTER TABLE `payment_image`
  MODIFY `image_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_image`
--
ALTER TABLE `profile_image`
  MODIFY `img_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rent_detail`
--
ALTER TABLE `rent_detail`
  MODIFY `room_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `reported_information`
--
ALTER TABLE `reported_information`
  MODIFY `report_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `tenant_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `token_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
