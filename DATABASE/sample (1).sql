-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2024 at 10:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `costumer_info`
--

CREATE TABLE `costumer_info` (
  `costumer_info_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `mi` char(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `gender` char(1) NOT NULL,
  `birthday` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `costumer_info`
--

INSERT INTO `costumer_info` (`costumer_info_id`, `first_name`, `last_name`, `mi`, `address`, `contact_number`, `gender`, `birthday`) VALUES
(1, 'Anton Mar', 'Herrera', 'O', 'Guinobatan, Albay', '09511745907', 'm', '2024-10-11 08:49:14'),
(2, 'Romeo', 'Bongais', 'M', 'Legazpi City, Albay', '09928130887', 'm', '2024-10-11 08:49:14'),
(3, 'Christopher', 'D Castro', 'N', 'Legazpi City, Albay', '09637107982', 'm', '2024-10-11 08:53:27'),
(4, 'Ana Jaine', 'Olayta', 'O', 'Guinobatan, Albay', '0997665474', 'f', '2024-10-11 08:55:00'),
(5, 'Joanne ', 'Mendonez', 'M', 'Daraga, Albay', '09567746290', 'f', '2024-10-11 08:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(35) NOT NULL,
  `item_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_price`) VALUES
(1, 'Strawberry Girl\'s Dinner(whole)', 550.00),
(2, 'Chocolate Midnight Madness(whole)', 500.00),
(3, 'Vanilla Angel\'s Cake(whole)', 490.00),
(4, 'Coconut Da Coconut Nut(whole)', 450.00),
(5, 'Ube Heart of Mary(whole)', 450.00),
(6, 'Blueberry Blue_Very(whole)', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_ordered` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `user_id`, `qty`, `date_ordered`) VALUES
(2, 6, 3, 22, '2024-10-11 07:55:20'),
(3, 4, 2, 5, '2024-10-11 08:00:30'),
(4, 5, 1, 2, '2024-10-11 08:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `pass_word` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `costumer_info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_ID`, `username`, `pass_word`, `date`, `costumer_info_id`) VALUES
(1, 'squid_cat', '123456789', '2024-10-11 07:01:08', 1),
(2, 'MatCho', '1234567dggww', '2024-10-11 07:01:08', 2),
(3, 'highnoon457', 'buemailkopre', '2024-10-11 07:03:29', 3),
(4, 'jaxgomi', '123456789', '2024-10-11 07:03:29', 4),
(5, 'joowie_donut', '123456789', '2024-10-11 07:03:56', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `costumer_info`
--
ALTER TABLE `costumer_info`
  ADD PRIMARY KEY (`costumer_info_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `item_order_list` (`item_id`),
  ADD KEY `users_order_ist` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `costumer_info_list` (`costumer_info_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `costumer_info`
--
ALTER TABLE `costumer_info`
  MODIFY `costumer_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `item_order_list` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `users_order_ist` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `costumer_info_list` FOREIGN KEY (`costumer_info_id`) REFERENCES `costumer_info` (`costumer_info_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
