-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 05:42 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `photo-management-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `img_url` text DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `img_url`, `description`, `username`, `comment`, `created`) VALUES
(1, 'Rock Music', 'images/new/1.jpg', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.\r', 'Ahmad Adnan', 'So Relaxing', '2021-11-25 01:23:18'),
(2, 'Natural Forest', 'images/new/2.jpg', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.\r', 'Ahmad Adnan', 'Excited to be there', '2021-11-25 01:23:18'),
(3, 'Cool Weather', 'images/new/3.png', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.\r', 'Ahmad Adnan', 'Involved ', '2021-11-25 01:23:18'),
(5, 'Rock Music', 'images/new/5.jpg', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.\r', 'Ahmad Adnan', 'Miss it', '2021-11-25 01:23:18'),
(21, 'Home of Mathematics', 'images/new/6.jpg', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.\r', 'Ahmad Adnan', 'Tough Calculations', '2021-11-26 07:15:52'),
(27, 'Cooling your self with cool music', 'images/new/1.jpg', 'Love is a many-flavoured thing: it can go from vanilla to rainbow sprinkles in the blink of an eye.', 'Ahmad Adnan', NULL, '2021-11-26 07:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `img_url` text NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `img_url`, `password`, `created`) VALUES
(1, 'Admin', 'admin@gmail.com', 'user/i', '$2b$10$du61KAHeKiXhs1U1AlN2rOTvpUWLPtVZHc0UCZqY4Ffn./Z4pxGy2', '2021-11-26 03:46:54'),
(2, 'ggdgdf', 'fdfd@hfgf.com', '', '$2b$10$rmPuSo7QyLci6TmbT2g2yukb4JyEe/YEsRMdzBHtkW9eDVMkudXgG', '2021-11-26 05:44:17'),
(3, 'kama', 'kama@gmail.com', '', '$2b$10$wORA8NMb3AlYkWylluPUSu.t6mCXEO3KGORCvCoWdWFcKV/pgr2r.', '2021-11-26 05:45:38'),
(4, 'sgsf', 'gdfdf@gff.co', '', '$2b$10$du61KAHeKiXhs1U1AlN2rOTvpUWLPtVZHc0UCZqY4Ffn./Z4pxGy2', '2021-11-26 05:46:40'),
(5, 'gdfdf', 'fdgdf', '', '$2b$10$7hLnhpRySBSWmWNVHirjTONa9MNVBYuM8xKoOqYxlVUtxnZkGfKCu', '2021-11-26 07:37:56'),
(6, 'hfhfgg', 'hfgfg@gmail.om', '', '$2b$10$eR./Hjm9ZoKAQGJJDzCoFeFtstzszDXLPsrgpJwJ6dQuZuIQifHHC', '2021-11-26 07:43:22'),
(7, 'admina', 'student@gmail.com', '', '$2b$10$DTkCdX1.wVItByp4x6YUqeivid4ABOhbeaOalFn2YRwaER82n9/Zy', '2021-11-27 08:31:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
