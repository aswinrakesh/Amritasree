-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2020 at 07:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amritasree`
--

-- --------------------------------------------------------

--
-- Table structure for table `clustertable`
--

CREATE TABLE `clustertable` (
  `ClusterID` int(11) NOT NULL,
  `ClusterName` varchar(255) DEFAULT NULL,
  `District` varchar(255) DEFAULT NULL,
  `Panchayath` varchar(255) DEFAULT NULL,
  `Block` varchar(255) DEFAULT NULL,
  `NumberOfGroups` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clustertable`
--

INSERT INTO `clustertable` (`ClusterID`, `ClusterName`, `District`, `Panchayath`, `Block`, `NumberOfGroups`) VALUES
(0, '', '', '', '', 0),
(3, 'clester1', 'Kannur', 'p1', 'b1', NULL),
(4, 'cluster2', 'Idukki', 'p2', 'b2', NULL),
(5, 'cluster3', 'Ernakulam', 'p3', 'b3', NULL),
(6, 'cluster4', 'Kollam', 'p4', 'b4', NULL),
(7, 'cluster5', 'Thiruvananthapuram', 'p5', 'b5', NULL),
(8, 'cluster6', 'Kasargod', 'p6', 'b6', NULL),
(9, 'cluster7', 'Kannur', 'p7', 'b7', NULL),
(10, 'cluster8', 'Thrissur', 'p8', 'b8', NULL),
(11, 'cluster9', 'Kottayam', 'p9', 'b9', NULL),
(12, 'cluster10', 'Kozhikode', 'p10', 'b10', NULL),
(13, 'cluster10', 'Palakkad', 'p10', 'b10', NULL),
(14, 'c12', 'Wayanad', 'p12', 'b12', NULL),
(15, 'c13', 'Thiruvananthapuram', 'p13', 'b13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deposittable`
--

CREATE TABLE `deposittable` (
  `DepositID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `WeeklyDeposit` int(11) DEFAULT NULL,
  `WithdrawnAmount` int(11) DEFAULT NULL,
  `LoanRepayAmt` int(11) DEFAULT NULL,
  `LoanAmountRemaining` int(11) DEFAULT NULL,
  `TotalDeposits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposittable`
--

INSERT INTO `deposittable` (`DepositID`, `MemberID`, `Date`, `WeeklyDeposit`, `WithdrawnAmount`, `LoanRepayAmt`, `LoanAmountRemaining`, `TotalDeposits`) VALUES
(6, 3, '2020-04-15', 120, 1000, 2000, 3000, 370),
(7, 1, '2020-04-22', 900, 500, 700, 8400, 600),
(8, 13, '2020-04-09', 600, 300, 100, 9000, 1000),
(9, 2, '2020-04-15', 120, 1000, 2000, 3500, 400),
(10, 4, '2020-04-22', 1000, 520, 6800, 3000, 200),
(11, 7, '2020-04-09', 800, 200, 100, 9600, 9000),
(12, 8, '2020-04-15', 120, 1000, 2000, 6500, 8000),
(13, 5, '2020-04-15', 120, 1000, 2000, 3500, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `grouptable`
--

CREATE TABLE `grouptable` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(255) DEFAULT NULL,
  `GroupRegisterNum` int(11) DEFAULT NULL,
  `district` text NOT NULL,
  `panchayath` text NOT NULL,
  `taluk` text NOT NULL,
  `block` text NOT NULL,
  `ward` text NOT NULL,
  `ClusterID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grouptable`
--

INSERT INTO `grouptable` (`GroupID`, `GroupName`, `GroupRegisterNum`, `district`, `panchayath`, `taluk`, `block`, `ward`, `ClusterID`) VALUES
(1, 'Default', 0, '', '', '', '', '', NULL),
(101, 'Group 1', 1, 'Thiruvananthapuram', '', '', '', '', 15),
(102, 'Group 2', 2, 'Thiruvananthapuram', '', '', '', '', 15),
(103, 'g3', 3, 'Thiruvananthapuram', 'p3', 't3', 'b3', 'w3', 15),
(104, 'g4', 4, 'Idukki', 'p4', 't4', 'b4', 'w4', 0),
(105, 'g5', 5, 'Pathanamthitta', 'p5', 't5', 'b5', 'w5', 0),
(106, 'g6', 6, 'Thiruvananthapuram', 'p6', 't6', 'b6', 'w6', 15),
(107, 'g7', 7, 'Thiruvananthapuram', 'p7', 't7', 'b7', 'w7', 15),
(108, 'g8', 8, 'Ernakulam', 'p8', 't8', 'b8', 'w8', 5),
(109, 'g9', 9, 'Ernakulam', 'p9', 't9', 'b9', 'w9', 5),
(110, 'g10', 10, 'Ernakulam', 'p10', 't10', 'b10', 'w10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `loandetailstable`
--

CREATE TABLE `loandetailstable` (
  `LoanID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `LoanAmount` int(11) DEFAULT NULL,
  `LoanStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loandetailstable`
--

INSERT INTO `loandetailstable` (`LoanID`, `MemberID`, `Date`, `LoanAmount`, `LoanStatus`) VALUES
(1, 1, '2020-04-02', 1000, 'ok'),
(2, 4, '2020-04-15', 850, 'yes'),
(3, 5, '2020-04-15', 500, 'okay'),
(4, 2, '2020-04-02', 1000, 'ok'),
(5, 3, '2020-04-15', 850, 'yes'),
(6, 7, '2020-04-15', 500, 'okay'),
(7, 8, '2020-04-15', 850, 'yes'),
(8, 13, '2020-04-15', 500, 'okay');

-- --------------------------------------------------------

--
-- Table structure for table `membertable`
--

CREATE TABLE `membertable` (
  `MemberID` int(11) NOT NULL,
  `MemberName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Age` varchar(3) DEFAULT NULL,
  `EducationalQualification` varchar(255) DEFAULT NULL,
  `APLorBPL` varchar(255) DEFAULT NULL,
  `PhNo` varchar(10) DEFAULT NULL,
  `GroupRole` varchar(255) DEFAULT NULL,
  `GroupID` int(11) NOT NULL,
  `Username` varchar(70) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `SecurityQuestion` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membertable`
--

INSERT INTO `membertable` (`MemberID`, `MemberName`, `Address`, `Age`, `EducationalQualification`, `APLorBPL`, `PhNo`, `GroupRole`, `GroupID`, `Username`, `Password`, `SecurityQuestion`, `Answer`) VALUES
(1, 'Rema', 'Pattichanthodi House, Thiruvilwamala', '60', '10', 'bpl', '654654351', 'admin', 1, 'rema123', 'weownit', '', ''),
(2, 'Sreeja', 'Kollam', '70', 'plus 2', 'bpl', '32136516', 'user', 1, 'sreeja123', 'helloworld', '', ''),
(3, 'Nileena', 'Smart City Kochi, Brahmauram Road\r\nKakkanad, Gadgeon, Level B, 2nd Floor', '50', 'degree', 'apl', '5154541', 'user', 1, 'nileena123', 'haripad', '', ''),
(4, 'Sarga', 'Kochi', '85', 'plus 2', 'apl', '5135321', 'admin', 1, 'sarga', 'sarga123', '', ''),
(5, 'Admin', 'Pattichanthodi House, Thiruvilwamala', '12', 'degree', 'apl', '968571332', 'admin', 101, 'admin', 'admin', '', ''),
(7, 'Anju', 'Pattichanthodi House, Thiruvilwamala', '12', 'degree', 'apl', '968571330', 'user', 102, 'anju', 'anju', '', ''),
(8, 'Riya', 'Kollam', '56', 'Engineer', 'APL', '9998745632', 'user', 1, 'riya', 'riya', '', ''),
(13, 'Divya', 'cherthala', '58', 'Plus two', 'APL', '4949898989', 'Admin', 1, 'divya', 'divya123', 'What is the name of your house ?', 'divya'),
(17, 'Ramya', 'Kochi', '65', 'Plus 2', 'APL', '9794694949', 'User', 1, 'ramya', 'ramya', 'What is the name of your house ?', 'Nikam'),
(21, 'adithya', 'a1', '20', 'btech', 'APL', '9947388822', 'Admin', 101, 'adithya', 'adithya', 'Name of your pet ?', 'rocky'),
(35, 'aswin', 'a2', '22', 'qq', 'APL', '9090909090', 'Admin', 1, 'aswin', 'aswin', 'What is the name of your house ?', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clustertable`
--
ALTER TABLE `clustertable`
  ADD PRIMARY KEY (`ClusterID`);

--
-- Indexes for table `deposittable`
--
ALTER TABLE `deposittable`
  ADD PRIMARY KEY (`DepositID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `grouptable`
--
ALTER TABLE `grouptable`
  ADD PRIMARY KEY (`GroupID`),
  ADD KEY `ClusterID` (`ClusterID`);

--
-- Indexes for table `loandetailstable`
--
ALTER TABLE `loandetailstable`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `membertable`
--
ALTER TABLE `membertable`
  ADD PRIMARY KEY (`MemberID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clustertable`
--
ALTER TABLE `clustertable`
  MODIFY `ClusterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `deposittable`
--
ALTER TABLE `deposittable`
  MODIFY `DepositID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `loandetailstable`
--
ALTER TABLE `loandetailstable`
  MODIFY `LoanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `membertable`
--
ALTER TABLE `membertable`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deposittable`
--
ALTER TABLE `deposittable`
  ADD CONSTRAINT `deposittable_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `membertable` (`MemberID`);

--
-- Constraints for table `grouptable`
--
ALTER TABLE `grouptable`
  ADD CONSTRAINT `grouptable_ibfk_1` FOREIGN KEY (`ClusterID`) REFERENCES `clustertable` (`ClusterID`);

--
-- Constraints for table `loandetailstable`
--
ALTER TABLE `loandetailstable`
  ADD CONSTRAINT `loandetailstable_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `membertable` (`MemberID`);

--
-- Constraints for table `membertable`
--
ALTER TABLE `membertable`
  ADD CONSTRAINT `membertable_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `grouptable` (`GroupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
