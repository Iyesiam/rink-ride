-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 02:06 PM
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
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`booking_id`, `driver_id`, `driver_name`, `pickup_location`, `destination_location`, `booking_time`, `status`) VALUES
(1, 17, 'test3', 'Nyabugogo', 'Kimironko', '2024-04-23 11:08:53', 'pending');

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
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `latitude` decimal(10,8) DEFAULT 0.00000000,
  `longitude` decimal(11,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `registration_date`, `latitude`, `longitude`) VALUES
(15, 'test', 'test@gmail.com', '$2y$10$/R.gjQ5HsFUAIeM0FM3Z7Ohx.mGM0sglpN50NmICk7v2nvlvd3kX6', 'passenger', '2024-04-16 13:46:39', 0.00000000, 0.00000000),
(16, 'User2', 'Test2@gmail.com', '$2y$10$03k44jv49JtTeLzDfXAEm.Zea99nAbWHYfAkMA8VkVkfObCJCbukS', 'temporary_driver', '2024-04-16 14:11:30', 0.00000000, 0.00000000),
(17, 'test3', 'test3@gmail.com', '$2y$10$wPLc5PKDzB0L3...nItfXuqqA4in.kM4NRaYMitLlySip2b5xMCYK', 'private_driver', '2024-04-16 18:18:26', 0.00000000, 0.00000000),
(25, 'mybigbruh', 'mybigbruh@gmail.com', '$2y$10$jxFLxiukJkJmZ2cWcrm6B.za9aBI3UHw13CoTSPx1GEC.eSP7SY7G', 'temporary_driver', '2024-04-17 08:29:20', 0.00000000, 0.00000000),
(26, 'yourbigbruh', 'yourbigbruh@gmail.com', '$2y$10$ZSD.1X4B7qZ31uNudCGJkO.k3muLi7QbpTq0wXMhVUurE/OdyURrW', 'temporary_driver', '2024-04-17 08:32:28', 0.00000000, 0.00000000);

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
  `user_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `session_token`, `start_time`, `end_time`) VALUES
(1, 17, 'da0b056fab88af046277543da46af10a14d5c8cbb4125cd6b3544ba29ce53e78', '2024-04-22 10:43:34', NULL),
(9, 15, '2f3233ebacde7b95595335c12a804ecd8697d7a6f4cd0fd94f8890d315198109', '2024-04-22 18:13:03', NULL),
(10, 15, '0974ce5aad644445f28747a2fb79c9c281b54a9ca383d108b39735d53c279a7d', '2024-04-23 09:55:22', NULL),
(11, 15, '761eb29a5a02f0b8e663a001e964474a352dddc0860ccee2eb9094db71922180', '2024-04-23 10:36:31', NULL),
(12, 17, '7dfe07182006d9d96e3e6f7fc0b8d3890ac7817c0806589217f92c8b76a8764f', '2024-04-23 11:19:48', NULL);

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
  ADD PRIMARY KEY (`location_id`);

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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD CONSTRAINT `user_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
