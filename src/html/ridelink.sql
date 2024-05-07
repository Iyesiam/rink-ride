-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 09:42 PM
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
-- Database: `ridelink`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `booking_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `destination_location` varchar(255) DEFAULT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`booking_id`, `driver_id`, `driver_name`, `pickup_location`, `destination_location`, `booking_time`, `status`, `user_id`) VALUES
(1, 17, 'test3', 'Nyabugogo', 'Kimironko', '2024-04-23 11:08:53', 'accepted', 0),
(9, 17, 'test3', 'this ', 'that ', '2024-05-01 14:40:19', 'accepted', 15),
(16, 17, 'test3', 'kicukiro', 'that ', '2024-05-06 18:00:54', 'cancelled', 17),
(17, 17, 'test3', 'nyarugenge ', 'masaka', '2024-05-06 18:03:26', 'accepted', 17),
(18, 17, 'test3', 'this ', 'that ', '2024-05-06 18:57:27', 'accepted', 17);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `registration_date`) VALUES
(15, 'test', 'test@gmail.com', '$2y$10$/R.gjQ5HsFUAIeM0FM3Z7Ohx.mGM0sglpN50NmICk7v2nvlvd3kX6', 'passenger', '2024-04-16 13:46:39'),
(16, 'User2', 'Test2@gmail.com', '$2y$10$03k44jv49JtTeLzDfXAEm.Zea99nAbWHYfAkMA8VkVkfObCJCbukS', 'temporary_driver', '2024-04-16 14:11:30'),
(17, 'test3', 'test3@gmail.com', '$2y$10$wPLc5PKDzB0L3...nItfXuqqA4in.kM4NRaYMitLlySip2b5xMCYK', 'private_driver', '2024-04-16 18:18:26'),
(25, 'mybigbruh', 'mybigbruh@gmail.com', '$2y$10$jxFLxiukJkJmZ2cWcrm6B.za9aBI3UHw13CoTSPx1GEC.eSP7SY7G', 'temporary_driver', '2024-04-17 08:29:20'),
(26, 'yourbigbruh', 'yourbigbruh@gmail.com', '$2y$10$ZSD.1X4B7qZ31uNudCGJkO.k3muLi7QbpTq0wXMhVUurE/OdyURrW', 'temporary_driver', '2024-04-17 08:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `document_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_document` varchar(255) DEFAULT NULL,
  `driving_license` varchar(255) DEFAULT NULL,
  `vehicle_registration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_documents`
--

INSERT INTO `user_documents` (`document_id`, `user_id`, `id_document`, `driving_license`, `vehicle_registration`) VALUES
(1, 16, 'LINUX CERTIFICATE.pdf', 'SQL DATA SCIENCE CERTIFICATE.pdf', ''),
(2, 17, 'SQL DATA SCIENCE CERTIFICATE.pdf', 'LINUX CERTIFICATE.pdf', 'Data Monitoring and Troubleshooting  in Microsoft Azure CERTIFICATE.pdf'),
(4, 26, 'ID.pdf', 'RESULT SLIP.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_locations`
--

CREATE TABLE `user_locations` (
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_locations`
--

INSERT INTO `user_locations` (`location_id`, `user_id`, `latitude`, `longitude`, `timestamp`) VALUES
(4, 17, -1.951883, 30.054957, '2024-05-02 14:21:24'),
(5, 17, -1.951883, 30.054957, '2024-05-02 14:24:02'),
(6, 17, -1.951883, 30.054957, '2024-05-02 14:24:04'),
(7, 17, -1.951883, 30.054957, '2024-05-02 14:29:41'),
(8, 17, -1.951883, 30.054957, '2024-05-02 14:29:43'),
(9, 17, -1.951883, 30.054957, '2024-05-02 14:29:43'),
(10, 17, -1.958579, 30.062848, '2024-05-02 14:39:30'),
(11, 17, -1.958579, 30.062848, '2024-05-02 14:39:31'),
(12, 17, -1.958579, 30.062848, '2024-05-02 14:39:34'),
(13, 17, -1.958583, 30.062884, '2024-05-02 14:42:57'),
(14, 17, -1.958583, 30.062884, '2024-05-02 14:42:59'),
(15, 17, -1.951883, 30.054957, '2024-05-02 14:48:20'),
(16, 17, -1.951883, 30.054957, '2024-05-02 14:48:22'),
(17, 17, -1.961864, 30.064284, '2024-05-02 15:12:28'),
(18, 17, -1.961864, 30.064284, '2024-05-02 15:12:28'),
(19, 17, -1.961864, 30.064284, '2024-05-02 15:19:28'),
(20, 17, -1.965972, 30.054957, '2024-05-02 15:22:17'),
(21, 17, -1.965972, 30.054957, '2024-05-02 15:25:39'),
(22, 17, -1.965972, 30.054957, '2024-05-02 15:25:41'),
(23, 17, -1.961864, 30.064284, '2024-05-02 17:17:04'),
(24, 17, -1.961864, 30.064284, '2024-05-02 17:17:06'),
(25, 17, -1.961864, 30.064284, '2024-05-02 17:17:12'),
(26, 17, -1.961864, 30.064284, '2024-05-02 17:17:14'),
(27, 17, -1.961864, 30.064284, '2024-05-02 17:19:51'),
(28, 17, -1.961864, 30.064284, '2024-05-02 17:19:53'),
(29, 17, -1.961864, 30.064284, '2024-05-02 17:30:17'),
(30, 17, -1.961864, 30.064284, '2024-05-02 17:32:13'),
(31, 17, -1.961864, 30.064284, '2024-05-02 17:32:15'),
(32, 17, -1.965972, 30.054957, '2024-05-05 18:44:03'),
(33, 17, -1.965972, 30.054957, '2024-05-05 18:44:05'),
(34, 17, -1.965972, 30.054957, '2024-05-05 19:53:10'),
(35, 17, -1.965972, 30.054957, '2024-05-05 19:53:10'),
(36, 17, -1.965972, 30.054957, '2024-05-05 19:59:10'),
(37, 17, -1.965972, 30.054957, '2024-05-05 19:59:15'),
(38, 15, -1.965972, 30.054957, '2024-05-05 20:19:04'),
(39, 15, -1.965972, 30.054957, '2024-05-05 20:19:07'),
(40, 17, -1.965972, 30.054957, '2024-05-05 20:20:18'),
(41, 17, -1.965972, 30.054957, '2024-05-05 20:20:20'),
(42, 17, -1.965972, 30.054957, '2024-05-05 20:20:24'),
(43, 17, -1.965972, 30.054957, '2024-05-05 20:20:25'),
(44, 17, -1.965972, 30.054957, '2024-05-05 20:20:31'),
(45, 17, -1.965972, 30.054957, '2024-05-05 20:21:29'),
(46, 17, -1.965972, 30.054957, '2024-05-05 20:21:31'),
(47, 17, -1.965972, 30.054957, '2024-05-05 20:21:37'),
(48, 17, -1.965972, 30.054957, '2024-05-05 20:22:08'),
(49, 17, -1.965972, 30.054957, '2024-05-05 20:22:10'),
(50, 17, -1.965972, 30.054957, '2024-05-05 20:22:27'),
(51, 17, -1.965972, 30.054957, '2024-05-05 20:22:29'),
(52, 17, -1.961859, 30.064286, '2024-05-05 20:27:25'),
(53, 17, -1.961859, 30.064286, '2024-05-05 20:27:26'),
(54, 17, -1.961859, 30.064286, '2024-05-05 20:27:47'),
(55, 17, -1.961859, 30.064286, '2024-05-05 20:27:49'),
(56, 17, -1.965972, 30.054957, '2024-05-05 20:37:21'),
(57, 17, -1.965972, 30.054957, '2024-05-05 20:38:32'),
(58, 17, -1.965972, 30.054957, '2024-05-05 20:38:41'),
(59, 17, -1.965972, 30.054957, '2024-05-05 20:38:42'),
(60, 17, -1.965972, 30.054957, '2024-05-05 20:39:10'),
(61, 17, -1.965972, 30.054957, '2024-05-05 20:42:57'),
(62, 17, -1.961859, 30.064286, '2024-05-05 20:44:08'),
(63, 17, -1.961859, 30.064286, '2024-05-05 20:44:47'),
(64, 17, -1.961859, 30.064286, '2024-05-05 20:44:49'),
(65, 17, -1.965972, 30.054957, '2024-05-05 20:51:06'),
(66, 17, -1.965972, 30.054957, '2024-05-05 20:51:07'),
(67, 17, -1.965972, 30.054957, '2024-05-05 20:51:08'),
(68, 17, -1.965972, 30.054957, '2024-05-05 20:51:10'),
(69, 17, -1.965972, 30.054957, '2024-05-05 20:54:27'),
(70, 17, -1.965972, 30.054957, '2024-05-05 20:57:13'),
(71, 17, -1.961859, 30.064286, '2024-05-05 21:03:44'),
(72, 17, -1.961859, 30.064286, '2024-05-05 21:03:46'),
(73, 17, -1.961859, 30.064286, '2024-05-05 21:03:48'),
(74, 17, -1.961859, 30.064286, '2024-05-05 21:04:35'),
(75, 17, -1.961859, 30.064286, '2024-05-05 21:04:36'),
(76, 17, -1.961859, 30.064286, '2024-05-05 21:04:38'),
(77, 17, -1.949696, 30.100685, '2024-05-06 17:10:30'),
(78, 17, -1.949696, 30.100685, '2024-05-06 17:10:31'),
(79, 17, -1.949696, 30.100685, '2024-05-06 17:10:32'),
(80, 17, -1.949696, 30.100685, '2024-05-06 17:10:34'),
(81, 17, -1.949696, 30.100685, '2024-05-06 17:42:55'),
(82, 17, -1.949696, 30.100685, '2024-05-06 17:49:24'),
(83, 17, -1.949696, 30.100685, '2024-05-06 17:49:26'),
(84, 17, -1.949696, 30.100685, '2024-05-06 18:02:11'),
(85, 17, -1.949696, 30.100685, '2024-05-06 18:02:13'),
(86, 17, -1.949696, 30.100685, '2024-05-06 18:03:43'),
(87, 17, -1.949696, 30.100685, '2024-05-06 18:03:46'),
(88, 17, -1.949696, 30.100685, '2024-05-06 18:03:48'),
(89, 17, -1.949696, 30.100685, '2024-05-06 18:05:02'),
(90, 17, -1.949696, 30.100685, '2024-05-06 18:05:04'),
(91, 17, -1.949696, 30.100685, '2024-05-06 18:05:09'),
(92, 17, -1.949696, 30.100685, '2024-05-06 18:10:25'),
(93, 17, -1.949696, 30.100685, '2024-05-06 18:15:39'),
(94, 17, -1.949696, 30.100685, '2024-05-06 18:15:41'),
(95, 17, -1.949696, 30.100685, '2024-05-06 18:26:24'),
(96, 17, -1.949696, 30.100685, '2024-05-06 18:26:26'),
(97, 17, -1.949696, 30.100685, '2024-05-06 18:27:04'),
(98, 17, -1.949696, 30.100685, '2024-05-06 18:32:45'),
(99, 17, -1.949696, 30.100685, '2024-05-06 18:32:47'),
(100, 17, -1.949696, 30.100685, '2024-05-06 18:51:55'),
(101, 17, -1.949696, 30.100685, '2024-05-06 18:57:32'),
(102, 17, -1.949696, 30.100685, '2024-05-06 18:57:34'),
(103, 17, -1.949696, 30.100685, '2024-05-06 18:57:39'),
(104, 17, -1.949696, 30.100685, '2024-05-06 18:57:40'),
(105, 17, -1.949696, 30.100685, '2024-05-06 18:57:41'),
(106, 17, -1.949696, 30.100685, '2024-05-06 18:57:44'),
(107, 17, -1.949696, 30.100685, '2024-05-06 18:57:48'),
(108, 17, -1.949696, 30.100685, '2024-05-06 18:57:50'),
(109, 17, -1.949696, 30.100685, '2024-05-06 18:57:50'),
(110, 17, -1.949696, 30.100685, '2024-05-06 18:59:20'),
(111, 17, -1.949696, 30.100685, '2024-05-06 18:59:22'),
(112, 17, -1.949696, 30.100685, '2024-05-06 18:59:30'),
(113, 17, -1.949696, 30.100685, '2024-05-06 19:32:01'),
(114, 17, -1.949696, 30.100685, '2024-05-06 19:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `status` enum('active','disconnected') DEFAULT 'active',
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `session_token`, `status`, `start_time`, `end_time`) VALUES
(69, 17, '66466f0f81a146551f8362eb3e1824c5002ad809b939eebcffad0ac3a5c790a1', 'disconnected', '2024-05-05 20:22:26', NULL),
(70, 15, '5edf88b8762008a832d84fa0590a5826ce0409f1ceba68b0620f58f979bd7864', 'active', '2024-05-06 18:01:45', NULL),
(71, 17, '5ff523b4c21f27f8bfb43067880f6e46cfc5755a441bfe014b7021c9f724578f', 'active', '2024-05-06 18:02:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_locations`
--
ALTER TABLE `user_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_locations`
--
ALTER TABLE `user_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD CONSTRAINT `user_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_locations`
--
ALTER TABLE `user_locations`
  ADD CONSTRAINT `user_locations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
