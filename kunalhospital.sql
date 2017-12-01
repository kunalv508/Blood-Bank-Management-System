-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2017 at 02:53 PM
-- Server version: 5.6.35-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kunalhospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_banks`
--

CREATE TABLE IF NOT EXISTS `blood_banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blood_bank_name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0=manger,1=receptionist',
  `email` varchar(50) DEFAULT NULL,
  `password` text NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `blood_banks`
--

INSERT INTO `blood_banks` (`id`, `employee_id`, `name`, `address`, `phone`, `created_date`, `blood_bank_name`, `type`, `email`, `password`, `parent_id`) VALUES
(10, '100288451', 'John mark', '', '7786325478', '2017-11-28 00:00:20', 'Canadian Blood Service', 0, 'kunalv506@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(12, '100288452', 'Langara College', '', '8765432109', '2017-11-30 21:21:45', 'Langara Blood Bank', 0, 'langaracollege@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(13, '123456789', 'Haroop Kang', '', '7783255009', '2017-11-30 21:51:21', 'Kang Blood Bank', 0, 'hskang01@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(14, '123456', 'RBB', '', '9988832667', '2017-12-01 03:10:14', 'Richmond Blood Bank', 0, 'richmond@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blood_groups`
--

CREATE TABLE IF NOT EXISTS `blood_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(4) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blood_groups`
--

INSERT INTO `blood_groups` (`id`, `blood_group`, `status`, `created_date`) VALUES
(1, 'A+', 1, '2017-11-25 18:14:36'),
(2, 'A-', 1, '2017-11-25 18:14:36'),
(3, 'B+', 1, '2017-11-25 18:14:48'),
(4, 'B-', 1, '2017-11-25 18:14:48'),
(5, 'AB+', 1, '2017-11-25 18:14:59'),
(6, 'AB-', 1, '2017-11-25 18:14:59'),
(7, 'O+', 1, '2017-11-25 18:15:10'),
(8, 'O-', 1, '2017-11-25 18:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `blood_requests`
--

CREATE TABLE IF NOT EXISTS `blood_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) NOT NULL,
  `blood_group_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `units_require` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=active;1=closed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `blood_requests`
--

INSERT INTO `blood_requests` (`id`, `hospital_id`, `blood_group_id`, `city_id`, `create_date`, `units_require`, `status`) VALUES
(25, 9, 1, 4, '2017-12-01 03:13:10', 10, 0),
(26, 7, 3, 3, '2017-12-01 03:59:19', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blood_responses`
--

CREATE TABLE IF NOT EXISTS `blood_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_request_id` int(11) NOT NULL,
  `blood_bank_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `units` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `blood_responses`
--

INSERT INTO `blood_responses` (`id`, `blood_request_id`, `blood_bank_id`, `created_date`, `units`) VALUES
(8, 25, 14, '2017-12-01 03:14:21', 1),
(9, 26, 12, '2017-12-01 04:00:41', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `status`, `created_date`) VALUES
(1, 'Toronto', 1, '2017-11-25 18:18:30'),
(2, 'Vancouver', 1, '2017-11-25 18:18:30'),
(3, 'Surrey', 1, '2017-11-25 18:18:30'),
(4, 'Richmond', 1, '2017-11-25 18:18:30'),
(5, 'New Westminister', 1, '2017-11-25 18:18:30'),
(6, 'Coquitlum', 1, '2017-11-25 18:18:30'),
(8, 'Abbotsford', 1, '2017-11-25 18:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `phone`, `create_date`, `password`) VALUES
(5, 'Surrey Memorial Hospital', '90 Ave, King George Blvd, Surrey, BC, Canada, V4C2M4', '6041234567', '2017-11-27 23:57:25', 'e10adc3949ba59abbe56e057f20f883e'),
(6, 'city care', '13,abc', '7775556622', '2017-11-28 11:19:20', '4297f44b13955235245b2497399d7a93'),
(7, 'Vancouver Memorial Hospital', 'Downtown, Vancouver', '9876543210', '2017-11-30 17:34:43', 'e10adc3949ba59abbe56e057f20f883e'),
(8, 'kang hospital', 'new', '7783255009', '2017-11-30 21:50:05', 'e10adc3949ba59abbe56e057f20f883e'),
(9, 'Richmond Hospital', 'Richmond', '9988832668', '2017-12-01 03:09:26', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `blood_group_id` int(11) NOT NULL,
  `password` text NOT NULL,
  `blood_bank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `sex`, `age`, `phone`, `created_date`, `address`, `city_id`, `blood_group_id`, `password`, `blood_bank_id`) VALUES
(26, 'Kunal', 'Male', 24, '7654321098', '2017-11-30 14:26:13', 'kunal@gmail.com', 3, 3, 'e10adc3949ba59abbe56e057f20f883e', 12),
(29, 'Richmond Donor', 'Male', 25, '9988832666', '2017-11-30 20:11:07', 'richmonddonor@gmail.com', 4, 1, 'e10adc3949ba59abbe56e057f20f883e', 14);

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE IF NOT EXISTS `user_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `blood_bank_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=active;1=closed',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blood_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `request_id`, `blood_bank_id`, `status`, `create_date`, `blood_group_id`) VALUES
(38, 25, 14, 0, '2017-12-01 03:13:33', 1),
(39, 26, 12, 0, '2017-12-01 03:59:49', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_responses`
--

CREATE TABLE IF NOT EXISTS `user_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_request_id` int(11) NOT NULL,
  `blood_request_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_responses`
--

INSERT INTO `user_responses` (`id`, `user_id`, `user_request_id`, `blood_request_id`) VALUES
(9, 29, 38, 25),
(10, 26, 39, 26);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
