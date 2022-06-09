-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 12:32 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsblogcrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `blogid` varchar(150) NOT NULL,
  `userid` varchar(150) NOT NULL,
  `title` varchar(69) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `status` varchar(36) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_blog`
--

INSERT INTO `tbl_blog` (`blogid`, `userid`, `title`, `content`, `status`, `createtime`, `updatetime`) VALUES
('0a596dba-0bfa-4699-9b82-2762dc4ac54b', '22838aae-2602-4fd2-9ead-0edf2d021829', 'Exercise & Fitness', 'Exercising regularly, every day if possible, is the single most important thing you can do for your health. In the short term, exercise helps to control appetite, boost mood, and improve sleep. In the long term, it reduces the risk of heart disease, stroke, diabetes, dementia, depression, and many cancers.', 'published', '2022-06-08 16:22:58.265000', '2022-06-08 16:22:58.265000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tags`
--

CREATE TABLE `tbl_tags` (
  `blogid` varchar(150) DEFAULT NULL,
  `tags` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` varchar(150) NOT NULL,
  `name` varchar(36) NOT NULL,
  `email` varchar(69) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(69) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `name`, `email`, `username`, `password`) VALUES
('22838aae-2602-4fd2-9ead-0edf2d021829', 'Abu salman hossain', 'salman@gmail.com', 'salmanBokachoda69', 'EUX7H@hcDWWJwqT'),
('54da43c7-f660-49ec-a33f-e0fa26924871', 'MD Mahmudur Rahman', 'mahmudur69@student.sust.edu', 'mahmud', 'fu@2YMJQA43VZLn'),
('7ab452f0-8fae-43ec-af04-d8dc5444cd21', 'Fahim Mia', 'fahim1194@gmail.com', 'fahimmia', 'sdk9vB@BkiykVsw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`blogid`),
  ADD KEY `fk_tbl_user_userid` (`userid`);

--
-- Indexes for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD KEY `fk_tbl_blog_blogid` (`blogid`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `userName` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `username_3` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD CONSTRAINT `fk_tbl_user_id` FOREIGN KEY (`userId`) REFERENCES `tbl_user` (`userId`),
  ADD CONSTRAINT `fk_tbl_user_userid` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`userid`);

--
-- Constraints for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD CONSTRAINT `fk_tbl_blog_blogid` FOREIGN KEY (`blogid`) REFERENCES `tbl_blog` (`blogid`),
  ADD CONSTRAINT `fk_tbl_post_id` FOREIGN KEY (`blogId`) REFERENCES `tbl_blog` (`blogId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
