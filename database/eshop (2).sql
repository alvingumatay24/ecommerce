-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2023 at 06:18 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21130274_eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`, `updated_at`) VALUES
(50, '1', '23', '1', '2023-07-30 05:42:48', '2023-07-30 05:42:48'),
(51, '1', '18', '1', '2023-07-30 07:57:48', '2023-07-30 07:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_descrip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_descrip`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(21, 'XIAOMI PHONE', '1', 'Redmi Android Phone', 0, 1, '1687789096.jpg', 'Android Phones', 'Lolipop OS, High Speed Android Phone w/ maximum  5g data', 'Mi', '2023-06-26 06:18:16', '2023-07-19 07:00:57'),
(23, 'HP LAPTOP', '2', 'mini computer', 0, 1, '1688647549.png', 'Hawlett - Packard', 'Laptop', 'HP', '2023-07-06 04:45:49', '2023-07-19 07:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_23_085423_create_products_table', 1),
(6, '2023_04_23_090302_create_categories_table', 2),
(7, '2023_04_23_091716_create_products_table', 3),
(9, '2023_06_27_161124_create_carts_table', 4),
(10, '2023_07_16_091451_create_orders_table', 5),
(11, '2023_07_16_092431_create_order_items_table', 5),
(12, '2023_07_30_113149_create_wishlists_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fname`, `lname`, `email`, `address1`, `address2`, `phone`, `city`, `state`, `country`, `pincode`, `total_price`, `status`, `message`, `tracking_no`, `created_at`, `updated_at`) VALUES
(13, '1', 'Als Deped T', 'Pherist', 'alsdeped13@gmail.com', 'sdsds', 'dsds', '08976564646', 'Millwowky', 'CA', 'America', '3797797', '1207437', 0, NULL, 'sharma3641', '2023-07-24 04:49:32', '2023-07-27 06:46:59'),
(14, '1', 'Als Deped T', 'Pherist', 'alsdeped13@gmail.com', 'sdsds', 'dsds', '08976564646', 'Millwowky', 'CA', 'America', '3797797', '14399', 0, NULL, 'sharma7998', '2023-07-30 05:37:52', '2023-07-30 05:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(12, '6', '18', '1', '6700', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(13, '6', '19', '1', '7699', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(14, '6', '20', '1', '8900', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(15, '6', '23', '1', '100049', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(16, '6', '24', '1', '84099', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(17, '6', '25', '1', '999990', '2023-07-23 01:17:51', '2023-07-23 01:17:51'),
(18, '7', '18', '1', '6700', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(19, '7', '19', '1', '7699', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(20, '7', '20', '1', '8900', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(21, '7', '23', '1', '100049', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(22, '7', '24', '1', '84099', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(23, '7', '25', '1', '999990', '2023-07-23 01:58:42', '2023-07-23 01:58:42'),
(24, '8', '18', '1', '6700', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(25, '8', '19', '1', '7699', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(26, '8', '20', '1', '8900', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(27, '8', '23', '1', '100049', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(28, '8', '24', '1', '84099', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(29, '8', '25', '1', '999990', '2023-07-23 02:14:43', '2023-07-23 02:14:43'),
(30, '9', '18', '1', '6700', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(31, '9', '19', '1', '7699', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(32, '9', '20', '1', '8900', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(33, '9', '23', '1', '100049', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(34, '9', '24', '1', '84099', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(35, '9', '25', '1', '999990', '2023-07-23 03:49:11', '2023-07-23 03:49:11'),
(36, '10', '18', '1', '6700', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(37, '10', '19', '1', '7699', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(38, '10', '20', '1', '8900', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(39, '10', '23', '1', '100049', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(40, '10', '24', '1', '84099', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(41, '10', '25', '1', '999990', '2023-07-23 03:49:41', '2023-07-23 03:49:41'),
(42, '11', '18', '1', '6700', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(43, '11', '19', '1', '7699', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(44, '11', '20', '1', '8900', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(45, '11', '23', '1', '100049', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(46, '11', '24', '1', '84099', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(47, '11', '25', '1', '999990', '2023-07-23 03:50:22', '2023-07-23 03:50:22'),
(48, '12', '18', '1', '6700', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(49, '12', '19', '1', '7699', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(50, '12', '20', '1', '8900', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(51, '12', '23', '1', '100049', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(52, '12', '24', '1', '84099', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(53, '12', '25', '1', '999990', '2023-07-24 04:42:48', '2023-07-24 04:42:48'),
(54, '13', '18', '1', '6700', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(55, '13', '19', '1', '7699', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(56, '13', '20', '1', '8900', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(57, '13', '23', '1', '100049', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(58, '13', '24', '1', '84099', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(59, '13', '25', '1', '999990', '2023-07-24 04:49:32', '2023-07-24 04:49:32'),
(60, '14', '18', '1', '6700', '2023-07-30 05:37:52', '2023-07-30 05:37:52'),
(61, '14', '19', '1', '7699', '2023-07-30 05:37:52', '2023-07-30 05:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cate_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cate_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `tax`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(18, 21, 'RedMi Note 10', '1', 'Mi XIAOMI Phone', 'Android Phone', '7800', '6700', '1687789205.png', '1', '1', 0, 1, 'Android Phone OS Candy', 'XIAOMI', 'China Phone', '2023-06-26 06:20:05', '2023-07-30 05:37:52'),
(19, 21, 'RedMi 9T', '2', 'RedMi Note 11 5G', 'android Phone', '7866', '7699', '1687877200.jpg', '1', '3', 0, 1, 'XIAOMI PHONE', 'MI2', 'Android 9T', '2023-06-27 06:46:40', '2023-07-30 05:37:52'),
(20, 21, 'RedMi Note 11 5G', '3', 'RedMi Note 11 5G', 'China Phone', '9900', '8900', '1687877811.jpg', '1', '6', 0, 1, 'Android Phone OS Gelly Ace', 'Xiaomi3', 'Android Phone', '2023-06-27 06:56:51', '2023-07-24 04:49:32'),
(23, 23, 'HP Spectre x360 16', '4', 'HP Spectre x360 16', 'Packed with premium features', '120000', '100049', '1688649211.png', '1', '1200', 0, 1, 'Hawlett - Packard', 'HP1', 'Latop', '2023-07-06 05:13:31', '2023-07-24 04:49:32'),
(24, 23, 'OMEN 16', '5', 'OMEN 16', 'Ultimate gaming performance', '999000', '84099', '1688649350.png', '1', '1200', 0, 1, 'Hawlett - Packard', 'HP 2', 'Laptop', '2023-07-06 05:15:50', '2023-07-24 04:49:32'),
(25, 23, 'Dragonfly Pro', '6', 'Dragonfly Pro', 'The power to simply', '10002021', '999990', '1688649500.png', '1', '1200', 0, 1, 'Hawlett - Packard', 'HP3', 'Laptop', '2023-07-06 05:18:20', '2023-07-24 04:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `lname`, `phone`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `role_as`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Als Deped T', 'alsdeped13@gmail.com', NULL, '$2y$10$3zS2581Ylwl1ax3fJyLExe/77bubCiNHSL.FKQQl7Py0xuAF2NEWO', 'Pherist', '08976564646', 'sdsds', 'dsds', 'Millwowky', 'CA', 'America', '3797797', 1, NULL, '2023-04-23 01:10:04', '2023-07-17 06:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `prod_id`, `created_at`, `updated_at`) VALUES
(2, '1', '23', '2023-07-30 07:46:28', '2023-07-30 07:46:28'),
(3, '1', '18', '2023-07-30 07:57:50', '2023-07-30 07:57:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
