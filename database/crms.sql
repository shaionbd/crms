-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2018 at 07:36 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accused`
--

CREATE TABLE `accused` (
  `accused_id` int(11) NOT NULL,
  `lockup_id` int(11) NOT NULL,
  `accused_name` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `status` text,
  `contact_no` int(11) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `street_no` int(11) DEFAULT NULL,
  `house_no` int(11) DEFAULT NULL,
  `photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `case_id` int(11) NOT NULL,
  `io_id` int(11) DEFAULT NULL,
  `fir_no` int(11) DEFAULT NULL,
  `other_details` text,
  `case_status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fir`
--

CREATE TABLE `fir` (
  `FIR_no` int(11) NOT NULL,
  `petitioner_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL,
  `petitioner_name` varchar(30) DEFAULT NULL,
  `victim_name` varchar(30) DEFAULT NULL,
  `date_file` date DEFAULT NULL,
  `time_filled` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_incident` date DEFAULT NULL,
  `time_incident` time DEFAULT NULL,
  `place_incident` varchar(20) DEFAULT NULL,
  `accused_name` varchar(30) DEFAULT NULL,
  `accused_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_officer`
--

CREATE TABLE `investigation_officer` (
  `io_id` int(11) NOT NULL,
  `io_name` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_of_hire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petitioner`
--

CREATE TABLE `petitioner` (
  `petitioner_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `father_name` varchar(40) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `street_no` int(11) DEFAULT NULL,
  `house_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE `victim` (
  `victim_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `father_name` varchar(20) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `victim_condition` text,
  `state` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `street_no` int(11) DEFAULT NULL,
  `house_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accused`
--
ALTER TABLE `accused`
  ADD PRIMARY KEY (`accused_id`),
  ADD UNIQUE KEY `accused_id` (`accused_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`case_id`),
  ADD KEY `io_id` (`io_id`),
  ADD KEY `fir_no` (`fir_no`);

--
-- Indexes for table `fir`
--
ALTER TABLE `fir`
  ADD PRIMARY KEY (`FIR_no`),
  ADD UNIQUE KEY `FIR_no` (`FIR_no`),
  ADD KEY `petitioner_id` (`petitioner_id`),
  ADD KEY `victim_id` (`victim_id`),
  ADD KEY `accused_id` (`accused_id`);

--
-- Indexes for table `investigation_officer`
--
ALTER TABLE `investigation_officer`
  ADD PRIMARY KEY (`io_id`),
  ADD UNIQUE KEY `io_id` (`io_id`);

--
-- Indexes for table `petitioner`
--
ALTER TABLE `petitioner`
  ADD PRIMARY KEY (`petitioner_id`),
  ADD UNIQUE KEY `petitioner_id` (`petitioner_id`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`victim_id`),
  ADD UNIQUE KEY `victim_id` (`victim_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`io_id`) REFERENCES `investigation_officer` (`io_id`),
  ADD CONSTRAINT `cases_ibfk_2` FOREIGN KEY (`fir_no`) REFERENCES `fir` (`FIR_no`);

--
-- Constraints for table `fir`
--
ALTER TABLE `fir`
  ADD CONSTRAINT `fir_ibfk_1` FOREIGN KEY (`petitioner_id`) REFERENCES `petitioner` (`petitioner_id`),
  ADD CONSTRAINT `fir_ibfk_2` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`),
  ADD CONSTRAINT `fir_ibfk_3` FOREIGN KEY (`accused_id`) REFERENCES `accused` (`accused_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
