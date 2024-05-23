-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 08:11 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `email`, `password`, `created_at`) VALUES
(2, 'admin', 'admin@example.com', '$2y$10$e1RixKc1F2yG2z/6Kz9rduRIPBLT7wqxTBwTS92.6mNHl3bZiN5CG', '2024-05-20 10:03:45');

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
(33, 17, 'test3', 'Nyabugogo', 'remera', '2024-05-21 09:52:31', 'accepted', 15);

-- --------------------------------------------------------

--
-- Table structure for table `car_owners`
--

CREATE TABLE `car_owners` (
  `car_owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vehicle_make` varchar(100) NOT NULL,
  `vehicle_model` varchar(100) NOT NULL,
  `vehicle_year` int(11) NOT NULL,
  `vehicle_registration` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_owners`
--

INSERT INTO `car_owners` (`car_owner_id`, `user_id`, `vehicle_make`, `vehicle_model`, `vehicle_year`, `vehicle_registration`) VALUES
(1, 28, 'Tesla', 'Teesla140', 2023, '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_locations`
--

CREATE TABLE `passenger_locations` (
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger_locations`
--

INSERT INTO `passenger_locations` (`location_id`, `user_id`, `latitude`, `longitude`, `timestamp`) VALUES
(255, 15, -1.951883, 30.054957, '2024-05-22 16:25:09'),
(256, 15, -1.951883, 30.054957, '2024-05-22 16:25:11'),
(257, 15, -1.951883, 30.054957, '2024-05-22 17:16:52'),
(258, 15, -1.951883, 30.054957, '2024-05-22 17:21:39'),
(259, 15, -1.951883, 30.054957, '2024-05-22 17:23:44'),
(260, 15, -1.951883, 30.054957, '2024-05-22 17:23:46'),
(261, 15, -1.951883, 30.054957, '2024-05-22 17:28:50'),
(262, 15, -1.951883, 30.054957, '2024-05-22 17:28:59'),
(263, 15, -1.951883, 30.054957, '2024-05-22 17:29:00'),
(264, 15, -1.951883, 30.054957, '2024-05-22 17:29:01'),
(265, 15, -1.951883, 30.054957, '2024-05-22 17:36:13'),
(266, 15, -1.951883, 30.054957, '2024-05-22 17:36:15'),
(267, 15, -1.951883, 30.054957, '2024-05-22 17:37:00'),
(268, 15, -1.951883, 30.054957, '2024-05-22 17:37:02'),
(269, 15, -1.951883, 30.054957, '2024-05-22 17:38:32'),
(270, 15, -1.951883, 30.054957, '2024-05-22 17:38:34'),
(271, 15, -1.951883, 30.054957, '2024-05-22 17:57:43'),
(272, 15, -1.951883, 30.054957, '2024-05-22 17:57:45'),
(273, 15, -1.951883, 30.054957, '2024-05-22 18:04:45'),
(274, 15, -1.951883, 30.054957, '2024-05-22 18:04:48'),
(275, 15, -1.951883, 30.054957, '2024-05-22 18:04:50'),
(276, 15, -1.951883, 30.054957, '2024-05-22 18:04:55'),
(277, 15, -1.951883, 30.054957, '2024-05-22 18:05:14'),
(278, 15, -1.951883, 30.054957, '2024-05-22 18:07:21'),
(279, 15, -1.951883, 30.054957, '2024-05-22 18:07:23'),
(280, 15, -1.951883, 30.054957, '2024-05-22 18:07:24'),
(281, 15, -1.951883, 30.054957, '2024-05-22 18:07:26'),
(282, 15, -1.951883, 30.054957, '2024-05-22 18:07:31'),
(283, 15, -1.951883, 30.054957, '2024-05-22 18:08:32'),
(284, 15, -1.951883, 30.054957, '2024-05-22 18:08:37'),
(285, 15, -1.951883, 30.054957, '2024-05-22 18:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `password`, `role`, `registration_date`, `profile_picture`) VALUES
(15, 'test', 'test@gmail.com', '', '$2y$10$/R.gjQ5HsFUAIeM0FM3Z7Ohx.mGM0sglpN50NmICk7v2nvlvd3kX6', 'passenger', '2024-04-16 13:46:39', 'uploads/table.jpg'),
(17, 'test3', 'test3@gmail.com', '0782040639', '$2y$10$wPLc5PKDzB0L3...nItfXuqqA4in.kM4NRaYMitLlySip2b5xMCYK', 'private_driver', '2024-04-16 18:18:26', 'uploads/logo.png'),
(27, 'yourbigbruh', 'yourbigbro@gmail.com', '', '$2y$10$qSH4FEPoak6wOeVDiWUEe.QMGLsVN1LPXwz015D2q4XfJMzqFJUxO', 'temporary_driver', '2024-05-08 14:50:51', NULL),
(28, 'mybigbruh', 'mybigbro@gmail.com', '', '$2y$10$cicSz5F6EST6fvFY3Q/6zuyUC7XL5QtMo6Jnr1dRmU/HU1hcYvnGi', 'car_owner', '2024-05-09 10:22:26', NULL),
(29, 'thisistempdriver', 'thisistempdriver@gmail.com', '', '$2y$10$Zur9f/nQAKxAww3YZrk/B.1nxCI846QP852KZwXUD7bl2OXtRFp9u', 'temporary_driver', '2024-05-09 15:33:47', NULL),
(33, 'Mucyo', 'mucyoolivier2002@gmail.com', '', '$2y$10$iNUvdRCpQzs6lTmlFQFSIOebUrk26WWLMrgbEGbBYML.7c.2ARS.S', 'private_driver', '2024-05-20 08:06:16', NULL),
(34, 'Test4', 'test4@gmail.com', '', '$2y$10$z9CZk8ax1UBV6PCfrRx9Jesz8Lp3GbofpZy5zCuOTMWvm7goxoiXe', 'private_driver', '2024-05-20 14:39:15', NULL),
(36, 'photest', 'photest@gmail.com', '0798298909', '$2y$10$vWkcxhfyrC5QYzHcBo20wO.e5/GxO5P8tsPzaUGTkFS9/d17jydRO', 'passenger', '2024-05-21 11:41:27', NULL);

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
(805, 17, -1.951883, 30.054957, '2024-05-22 15:34:11'),
(806, 17, -1.951883, 30.054957, '2024-05-22 15:34:13'),
(807, 17, -1.951883, 30.054957, '2024-05-22 15:36:51'),
(808, 17, -1.951883, 30.054957, '2024-05-22 15:37:01'),
(809, 17, -1.951883, 30.054957, '2024-05-22 15:37:18'),
(810, 17, -1.951883, 30.054957, '2024-05-22 15:37:23'),
(811, 17, -1.951883, 30.054957, '2024-05-22 15:43:04'),
(812, 17, -1.951883, 30.054957, '2024-05-22 15:43:10'),
(813, 17, -1.951883, 30.054957, '2024-05-22 15:44:10'),
(814, 17, -1.951883, 30.054957, '2024-05-22 15:44:15'),
(815, 17, -1.951883, 30.054957, '2024-05-22 15:46:02'),
(816, 17, -1.951883, 30.054957, '2024-05-22 15:46:14'),
(817, 17, -1.951883, 30.054957, '2024-05-22 15:46:52'),
(818, 17, -1.951883, 30.054957, '2024-05-22 15:47:24'),
(819, 17, -1.951883, 30.054957, '2024-05-22 15:51:10'),
(820, 17, -1.951883, 30.054957, '2024-05-22 15:51:44'),
(821, 17, -1.951883, 30.054957, '2024-05-22 15:51:49'),
(822, 17, -1.951883, 30.054957, '2024-05-22 15:52:43'),
(823, 17, -1.951883, 30.054957, '2024-05-22 15:52:45'),
(824, 17, -1.951883, 30.054957, '2024-05-22 15:52:51'),
(825, 17, -1.951883, 30.054957, '2024-05-22 15:54:00'),
(826, 17, -1.951883, 30.054957, '2024-05-22 15:58:09'),
(827, 17, -1.951883, 30.054957, '2024-05-22 16:06:16'),
(828, 17, -1.951883, 30.054957, '2024-05-22 16:06:20'),
(829, 17, -1.951883, 30.054957, '2024-05-22 16:06:24'),
(830, 17, -1.951883, 30.054957, '2024-05-22 16:07:42'),
(831, 17, -1.951883, 30.054957, '2024-05-22 16:13:50'),
(832, 17, -1.951883, 30.054957, '2024-05-22 16:14:06'),
(833, 17, -1.951883, 30.054957, '2024-05-22 16:17:50'),
(834, 17, -1.951883, 30.054957, '2024-05-22 16:18:23'),
(835, 17, -1.951883, 30.054957, '2024-05-22 16:18:29'),
(836, 17, -1.951883, 30.054957, '2024-05-22 16:18:29'),
(837, 17, -1.951883, 30.054957, '2024-05-22 16:18:50'),
(838, 17, -1.951883, 30.054957, '2024-05-22 16:18:56'),
(839, 17, -1.951883, 30.054957, '2024-05-22 16:19:51'),
(840, 17, -1.951883, 30.054957, '2024-05-22 16:20:09'),
(841, 17, -1.951883, 30.054957, '2024-05-22 16:20:25'),
(842, 17, -1.951883, 30.054957, '2024-05-22 16:21:19'),
(843, 17, -1.951883, 30.054957, '2024-05-22 16:21:59'),
(844, 17, -1.951883, 30.054957, '2024-05-22 16:21:59'),
(845, 17, -1.951883, 30.054957, '2024-05-22 16:22:53'),
(846, 17, -1.951883, 30.054957, '2024-05-22 16:23:34'),
(847, 17, -1.951883, 30.054957, '2024-05-22 16:24:14'),
(848, 17, -1.951883, 30.054957, '2024-05-22 17:16:31'),
(849, 17, -1.951883, 30.054957, '2024-05-22 17:16:36'),
(850, 17, -1.951883, 30.054957, '2024-05-22 17:16:38'),
(851, 17, -1.951883, 30.054957, '2024-05-22 17:16:40'),
(852, 17, -1.951883, 30.054957, '2024-05-22 17:36:59');

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
(154, 15, '3a221c2bbd58865a07b928eeb2c8941e', 'active', '2024-05-22 08:42:19', NULL),
(158, 17, '7542fe6393556ca672775f8e0db98aa6', 'active', '2024-05-22 15:34:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `car_owners`
--
ALTER TABLE `car_owners`
  ADD PRIMARY KEY (`car_owner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `passenger_locations`
--
ALTER TABLE `passenger_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_passenger_user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `car_owners`
--
ALTER TABLE `car_owners`
  MODIFY `car_owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passenger_locations`
--
ALTER TABLE `passenger_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_locations`
--
ALTER TABLE `user_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=853;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_owners`
--
ALTER TABLE `car_owners`
  ADD CONSTRAINT `car_owners_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `passenger_locations`
--
ALTER TABLE `passenger_locations`
  ADD CONSTRAINT `fk_passenger_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
