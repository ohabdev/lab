-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 02:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(6) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `products_id`, `category_name`) VALUES
(1, 7, 'Appliances'),
(2, 4, 'Apps & Games'),
(3, 1, 'Arts, Crafts, & Sewing'),
(4, 2, 'Automotive Parts & Accessories'),
(5, 5, 'Baby'),
(6, 8, 'Beauty & Personal Care'),
(7, 9, 'Books'),
(8, 10, 'Computers'),
(9, 6, 'Electronics'),
(10, 3, 'Garden & Outdoor');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(6) UNSIGNED NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `variants_id` int(11) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `name`, `title`, `description`, `price`, `quantity`, `variants_id`, `insert_date`) VALUES
(1, 1, 'Mens Stop', 'product title', 'description here', 54.45, 100, 1, '2022-03-14 10:37:17'),
(2, 2, 'Orbital Keys', 'product title', 'description here', 567, 100, 2, '2022-03-14 10:37:17'),
(3, 5, 'XPress Bottle', 'product title', 'description here', 545, 100, 5, '2022-03-14 10:37:17'),
(4, 4, 'Uno Wear', 'product title', 'description here', 785, 100, 5, '2022-03-14 12:46:36'),
(5, 7, 'Allure Kit', 'product title', 'description here', 678, 100, 5, '2022-03-14 12:46:40'),
(6, 8, 'Swish Wallet', 'product title', 'description here', 87854, 100, 8, '2022-03-14 10:37:17'),
(7, 3, 'Onovo Supply', 'product title', 'description here', 45, 100, 3, '2022-03-14 10:37:17'),
(8, 10, 'Rhino Case', 'product title', 'description here', 69, 100, 10, '2022-03-14 10:37:17'),
(9, 9, 'Terra Shsave', 'product title', 'description here', 978, 100, 9, '2022-03-14 10:37:17'),
(10, 6, 'Lovin Eye', 'product title', 'description here', 67, 100, 6, '2022-03-14 10:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(6) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `users_id`, `role_name`) VALUES
(1, 7, 'marketer'),
(2, 4, 'users'),
(3, 1, 'admin'),
(4, 2, 'accountant'),
(5, 5, 'data_entery_operator'),
(6, 8, 'visitor'),
(7, 9, 'super_admin'),
(8, 10, 'reporter'),
(9, 6, 'vp'),
(10, 3, 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `roles_id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `roles_id`, `firstname`, `lastname`, `email`, `password`, `mobile`, `reg_date`) VALUES
(1, 1, 'Abdul', 'Ohab', 'ohabdev@gamil.com', 'dsf68sda68f8das58f5ds8a58fa', '01640191679', '2022-03-14 10:00:50'),
(2, 2, 'Minhaz', 'Hossain', 'mihaz@gamil.com', 'fdsajfosdajfldasyfdsf997', '01740191679', '2022-03-14 10:00:50'),
(3, 5, 'Sajib', 'Pagla', 'sajib@gamil.com', 'isdyfisayifydiyfsdysifysdi', '01940191679', '2022-03-14 10:00:50'),
(4, 4, 'Viral', 'Chahca', 'viralchacha@gamil.com', 'ekwrhkwhkrhkwehrkhewkrweyoyoey', '01540191679', '2022-03-14 10:00:50'),
(5, 7, 'Mosharof', 'Karim', 'mosharof@gamil.com', 'sdyfisyifysif86986f9sdysf', '01340191679', '2022-03-14 10:00:50'),
(6, 8, 'Rabeya', 'Pagli', 'rabeya@gamil.com', 'sdfisdyifyisdyifysdiyfiysd', '015440191679', '2022-03-14 10:00:50'),
(7, 3, 'Bijli', 'Chomkaitese', 'bijli@gamil.com', 'yvisyfydayfopyyreioiapy', '01140191679', '2022-03-14 10:00:50'),
(8, 10, 'Awlad', 'hossain', 'awlad@gamil.com', 'yfsdoygosygt9a989yfdsoayfodas', '01140191679', '2022-03-14 10:00:50'),
(9, 9, 'Ritu', 'Ponna', 'ritu@gamil.com', 'yfyasyfdsyoifydosayfodsyoosyfebreb', '01640191679', '2022-03-14 10:00:50'),
(10, 6, 'Neon', 'Khan', 'neon@gamil.com', 'cxztviosatifebkreorebrehreh', '01640191679', '2022-03-14 10:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(6) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `color` varchar(64) NOT NULL,
  `size` varchar(64) NOT NULL,
  `materials` varchar(2000) NOT NULL,
  `weight` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `products_id`, `color`, `size`, `materials`, `weight`) VALUES
(1, 7, 'red', 's', 'Wood', 2),
(2, 4, 'blue', 'm', 'Paper', 15),
(3, 1, 'yellow', 'l', 'Natural Textile', 52),
(4, 2, 'purple', 'xs', 'Synthetic Textiles', 36),
(5, 5, 'gray', 'xm', 'Leather', 9),
(6, 8, 'white', 'xl', 'Fibers', 6),
(7, 9, 'whiteblue', 'xxl', ' Stone and Rock', 7),
(8, 10, 'green', 'xxl', 'Timber', 11),
(9, 6, 'purplegreen', 'xxl', 'Plastics', 19),
(10, 3, 'deepred', 'xxxl', 'Plastics ', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
