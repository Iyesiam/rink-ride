-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 12:57 PM
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
(1, 17, 'test3', 'Nyabugogo', 'Kimironko', '2024-04-23 11:08:53', 'pending', 0),
(4, 17, 'test3', 'Nyabugogo', 'masaka', '2024-04-23 12:11:08', 'pending', 0),
(5, 17, 'test3', 'kimironko', 'masaka', '2024-04-23 12:17:54', 'pending', 15),
(6, 17, 'test3', 'kicukiro', 'remera', '2024-04-23 12:25:59', 'pending', 15),
(7, 17, 'test3', 'kicukiro', 'remera', '2024-04-28 15:17:26', 'pending', 17);

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
  `status` enum('active','disconnected') DEFAULT 'active',
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `session_token`, `status`, `start_time`, `end_time`) VALUES
(29, 15, 'b65a25afba3309166f534d41be08f6456ff10fa88fc21cf07da1ce8f195f9f8b', 'disconnected', '2024-04-25 09:28:18', NULL),
(30, 17, '9f0f866deeac1397ad9253d2aacbb43d25473361946daa19dadeb0fbb82a0696', 'disconnected', '2024-04-25 09:28:40', NULL),
(31, 15, '21321e107bc1fb221ca02e1fbb4648184dbff29c7412133ff5263a37b2f8918a', 'disconnected', '2024-04-25 13:14:01', NULL),
(32, 15, '717948faa16bd2aae546678d84ef37870f46ebb2e16fed6a2738f082da66492a', 'active', '2024-04-28 15:13:01', NULL),
(33, 15, 'ced85ab41211c31d69d81dd2a7961e53540541f4d2408022c22e8ab02382efc5', 'active', '2024-04-28 15:14:06', NULL),
(34, 17, '21b3fe6ada38dda7cf2cb31709f0a3df2b227ccf4e9887131c07da70c52e2382', 'disconnected', '2024-04-28 15:16:32', NULL),
(35, 15, '8336aee1cf26329be996ab1a664465df2bf0b1035cd3319a12e38df1b4e4f393', 'active', '2024-04-28 16:31:18', NULL),
(36, 17, '222558e33b1fd1e3258f06b40f0ce0f92fc0c91b4ce0ee000368c553a44f964c', 'disconnected', '2024-04-28 16:32:26', NULL);

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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
