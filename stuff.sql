-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 31, 2019 at 07:49 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `everydayfactsDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `CategoryID` int(11) NOT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`CategoryID`, `Type`) VALUES
(1, 'Science'),
(2, 'Literature'),
(3, 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `PostDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `UserID`, `Title`, `PostDate`, `CategoryID`) VALUES
(1, 35, 'TIL I LEARNED NOTHING spectacular about myself you know wha i mean bra', '2019-03-31 02:50:03', 1),
(2, 1, 'TIL I AM OKAY', '2019-03-31 02:50:03', 2),
(3, 35, 'TIL I AM FINE', '2019-03-31 02:50:03', 1),
(4, 3, 'TIL I BREATHE', '2019-03-31 02:50:03', 3),
(5, 5, 'TIL I AWESOME', '2019-03-31 02:50:03', 2),
(6, 1, 'TIL I MEOW', '2019-03-31 02:50:03', 1),
(7, 30, 'hi', '2019-03-31 05:36:28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Rank`
--

CREATE TABLE `Rank` (
  `RankID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PostID` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Rank`
--

INSERT INTO `Rank` (`RankID`, `UserID`, `PostID`, `Number`) VALUES
(1, 1, 6, 1),
(2, 3, 6, 1),
(3, 3, 6, 1),
(4, 4, 6, 1),
(5, 3, 6, 1),
(6, 3, 4, 1),
(7, 3, 5, 1),
(8, 4, 1, 1),
(9, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `UserDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserName`, `Password`, `UserDate`) VALUES
(1, 'guest1', '$2y$10$JkLf8rOEsgDfbsGFziJ5o.3HeXAxNuuPd0rOEYu7r0R0t5Vrwt7Ny', '2019-03-31 02:45:36'),
(3, 'guest2', '1234', '2019-03-31 02:46:23'),
(4, 'guest3', '1234', '2019-03-31 02:46:23'),
(5, 'guest4', '1234', '2019-03-31 02:46:23'),
(10, 'michelle', '12345', '2019-03-31 04:45:17'),
(11, 'lol', '1234', '2019-03-31 04:47:10'),
(12, 'guest0', '$2y$10$FfY0beoYkDwTUI4Yx7aZBOcwIX8vsKeGTn3reaQI86bRC250O0Asu', '2019-03-31 04:47:30'),
(13, 'michellew', '$2y$10$xr5RZ9cFTRjSavVIlH7c5OEboEwjQkKZEvvDMhAf2hKDpHLtJv1CG', '2019-03-31 04:47:44'),
(22, 'bruhhh', '$2y$10$lQLFzUxHxEAJf/2YAg4OZuAq0i8.tac5muyHFRIC1YWIFnRYVqeLm', '2019-03-31 04:53:57'),
(25, 'asdf', 'asdf', '2019-03-31 04:55:28'),
(27, 'cards', '1234', '2019-03-31 05:05:31'),
(28, 'me', '$2y$10$7w6T09kTTHlDKGV5.LiUVu41VwF5UxllqENF8.fyfK1t5X4eq.27y', '2019-03-31 05:06:08'),
(29, 'hello', '$2y$10$JfSe2GWjcJUhbGEdLv25yerZVgLdupjNAO97sqxdEa5fGZ16Y3ere', '2019-03-31 05:30:55'),
(30, 'bye', '$2y$10$i1AGGB5e8/ngFJv0hPvHtePTzeAXh4wu1rAM.53blv9k7ywE.pfrq', '2019-03-31 05:31:19'),
(31, 'u', '$2y$10$rAV7xW2lnDji4NSimMN.eeQ2wNbpY74dEJxiP5JzYMeZgC49EgP4G', '2019-03-31 05:45:32'),
(32, 'why', '$2y$10$h25YiQDg49K2KG6pf7kFhuNkTfT5fBsgHPc9KDU6PebxBVWApOpcC', '2019-03-31 05:57:42'),
(33, 'w', '$2y$10$DmpP.2mDlrCSerFJLkKtKujPYIgljHRMfdSVxVvkAsjOpA.sd4IH.', '2019-03-31 06:00:39'),
(34, 'o', '$2y$10$GlWArJL9ACK10PV8HstEpOYKxDMXgy27jXBpmkI8XTLsfIV6kZbQm', '2019-03-31 06:00:55'),
(35, 'a', '$2y$10$D6ZQ03kf51WaP0ZH.6gdO.m2u.MIgDam1eKftq68XZGhFZ.3Wnol.', '2019-03-31 06:01:10'),
(36, '', '$2y$10$Gk9S1AcworvemCtG..rPEOISuAmja6bS2umKiJsORQKdGMOeL2GUy', '2019-03-31 19:30:23'),
(37, 'breh', '$2y$10$u6g/.As9roXcnfGCOL0QRecJ.5MI0cn5vgz4f1IsgRZ6HNnE7Bqnu', '2019-03-31 19:33:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `Rank`
--
ALTER TABLE `Rank`
  ADD PRIMARY KEY (`RankID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PostID` (`PostID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Rank`
--
ALTER TABLE `Rank`
  MODIFY `RankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`);

--
-- Constraints for table `Rank`
--
ALTER TABLE `Rank`
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `rank_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`);
