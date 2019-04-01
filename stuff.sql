-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 01, 2019 at 01:21 AM
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
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Comment` longtext,
  `CommentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`CommentID`, `PostID`, `UserID`, `Comment`, `CommentDate`) VALUES
(1, 1, 1, 'I would imagine that 9 donors for 43 people is a much higher ratio than average', '2019-03-30 15:53:41'),
(2, 1, 3, 'I think that\'s 43 people in the entire 49 years since the discovery of the type. Some among those 43 may very well be dead by now.', '2019-03-31 21:53:41'),
(3, 1, 4, 'That\'s 43 that we know of. I\'m sure many humans lived their entire lives without knowing their blood type. Hell, I\'m doing that right now. I could be #44 and I\'d have no idea.', '2019-03-31 21:53:41'),
(4, 1, 35, 'I\'m sure many humans lived their entire lives without knowing their blood type. Hell, I\'m doing that right now.\r\n\r\njust because you don\'t know your blood type doesn\'t mean it isn\'t known (ie in your medical record).\r\n\r\nsuper rare stuff like this gets reported by doctors, not the patients.', '2019-03-31 21:53:41'),
(5, 1, 5, 'they don\'t just test for blood type if they don\'t have to.\r\n\r\nthey could test you for all kinds of diseases but that is not how things are done. it is rather specific when they draw blood for a test.', '2019-03-31 21:53:41'),
(7, 1, 1, 'I\'m sorry to have to tell you about the sinister situation in your country but the reason why you guys have your blood type written everywhere is because of the large yet hidden population of vampires in your country. They changed the laws to make the blood types of people easily accessible because deaths due to blood type allergies were too common', '2019-03-31 21:54:02'),
(8, 1, 3, 'I live in Canada and I don\'t have it on my drivers license AFAIK. I didn\'t know my blood type until last year and that\'s only because I decided to ask my parents out of curiosity.\r\n\r\nI never knew because I had never been very ill, never broke a bone in my body or got a serious injury, never needed some kind of blood transfusion and I haven\'t donated blood yet as well. So it never occured to me. ', '2019-03-31 21:54:02'),
(9, 1, 4, 'O- here. Everyone wants my blood but no one wants to give me any :c', '2019-03-31 21:54:02'),
(10, 1, 35, 'There was an episode of the blacklist about this.', '2019-03-31 21:54:02'),
(11, 1, 5, 'According to the article they are. That\'s why it\'s called golden blood bc it\'s worth its weight in gold. They say it\'s important for medical research but managed to not go into any details on that. Despite going over the entire history of blood, lol.', '2019-03-31 21:54:02'),
(13, 1, 1, 'It\'s ironic though. Everything else in the medical world costs an arm and a leg but the average folks with the good blood can\'t get in on that action.', '2019-03-31 21:54:19'),
(14, 1, 3, 'I think the same thing about organ donations. The person getting that organ is going to pay a crazy amount of money for it (or at least the insurance will), but the person who donated (or more likely their family) won\'t see a penny of it.', '2019-03-31 21:54:19'),
(15, 1, 4, 'I think they may be confusing Rh null with Rh negative. Just googled, and the latter occurs in about 15% of Caucasian people. It’s also something that gets found out because it can cause a problem when having kids because if a Rh- woman gets pregnant with a Rh+ baby, there’s a danger that if any of the baby’s blood gets into the mother’s, her immune system will kick off. There are ways to protect her nowadays so it’s not as dangerous as it was, but you might get told about it, and confuse it with Rh null, which I’d never heard of before.', '2019-03-31 21:54:19'),
(16, 1, 35, '\"Golden blood\"? Sounds like natural selection.\r\n\r\nYou have a blood type that only 42 other members of your species have (out of billions). O- is the real \"golden blood\"- it can be given to ANYBODY. (and, yes, I realize that Rh is different than blood type)', '2019-03-31 21:54:19'),
(17, 1, 5, 'Is it 43 known ones? I\'m assuming not everyone in the world had their blood tested so there are probably more of them out there or am i missing something?', '2019-03-31 21:54:19'),
(18, 2, 10, 'That\'s not how natural selection works. The vast majority of people will never need a blood transfusion. These people have been living perfectly normal, healthy lives as had their ancestors before them. Having a rare biological thing doesn\'t mean that that person is automatically on the \"wrong end of natural selection\" both as an individual and also given how natural selection actually works.', '2019-03-31 21:54:19'),
(19, 1, 41, 'Wow I never thought that would be the rarest blood type', '2019-04-01 00:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Title` text,
  `PostDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `UserID`, `Title`, `PostDate`, `CategoryID`) VALUES
(1, 35, 'TIL that rh-null, the rarest blood type of the world, has been called the \"Golden Blood\". This blood type is so rare that only 43 people in the world have it, and there are only 9 active donor.', '2019-03-31 02:50:03', 1),
(2, 1, 'TIL in ancient Egypt, under the decree of Ptolemy II, all ships visiting the city were obliged to surrender their books to the library of Alexandria and be copied. The original would be kept in the library and the copy given back to the owner.', '2019-03-31 02:50:03', 2),
(3, 35, 'TIL Australia\'s first cops were all criminals. Their first police force was made up of 12 of the best behaved convicts.', '2019-03-31 02:50:03', 1),
(4, 3, 'TIL if you won the lottery in Australia, you had to go public with your win, turning into an overnight celebrity. This was until the abduction & murder of Graeme Thorne, 8, whose family won the lottery leading to Graeme being abducted for ransom but killed.', '2019-03-31 02:50:03', 3),
(5, 5, 'TIL the last victim of the 1966 University of Texas at Austin shooting died in 2001 after having to undergo dialysis for 35 years, 3 times a week, 5 hours each time. His death was ruled a homicide.', '2019-03-31 02:50:03', 2),
(6, 1, 'TIL NASA calculated that you only need 40 digits of Pi to calculate the circumference of the observable universe, to the accuracy of 1 hydrogen atom', '2019-03-31 02:50:03', 1),
(7, 30, 'TIL Smoking Areas existed in Public High Schools back in the 1980’s. Students could smoke cigarettes on school grounds between classes in designated lounges', '2019-03-31 05:36:28', 3);

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
(185, 35, 1, 1),
(213, 4, 1, 1),
(214, 3, 2, 1),
(215, 1, 2, 1),
(216, 3, 5, 1),
(217, 3, 4, 0),
(220, 5, 5, 1),
(255, 3, 1, 1),
(259, 3, 3, 1),
(260, 4, 2, 1),
(261, 5, 1, 0),
(266, 3, 6, 1),
(269, 35, 3, 1),
(368, 1, 1, 0),
(374, 1, 6, 1),
(375, 1, 4, 1),
(376, 1, 5, 1),
(379, 30, 1, 0),
(383, 30, 5, 1),
(384, 41, 5, 0),
(389, 41, 3, 1),
(390, 41, 1, 1),
(391, 41, 2, 1);

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
(1, 'Giraffe', '$2y$10$JkLf8rOEsgDfbsGFziJ5o.3HeXAxNuuPd0rOEYu7r0R0t5Vrwt7Ny', '2019-03-31 02:45:36'),
(3, 'ThiccBrain', '1234', '2019-03-31 02:46:23'),
(4, 'guest3', '1234', '2019-03-31 02:46:23'),
(5, 'TurtleSnekAttac', '1234', '2019-03-31 02:46:23'),
(10, 'michelle', '12345', '2019-03-31 04:45:17'),
(11, 'coldwhipsza', '1234', '2019-03-31 04:47:10'),
(12, 'jaiga99', '$2y$10$FfY0beoYkDwTUI4Yx7aZBOcwIX8vsKeGTn3reaQI86bRC250O0Asu', '2019-03-31 04:47:30'),
(13, 'bingingwithbaggins', '$2y$10$xr5RZ9cFTRjSavVIlH7c5OEboEwjQkKZEvvDMhAf2hKDpHLtJv1CG', '2019-03-31 04:47:44'),
(22, 'thepresident', '$2y$10$lQLFzUxHxEAJf/2YAg4OZuAq0i8.tac5muyHFRIC1YWIFnRYVqeLm', '2019-03-31 04:53:57'),
(25, 'IndyScent', 'asdf', '2019-03-31 04:55:28'),
(27, 'pixxelZombie', '1234', '2019-03-31 05:05:31'),
(28, 'LucaRedWood', '$2y$10$7w6T09kTTHlDKGV5.LiUVu41VwF5UxllqENF8.fyfK1t5X4eq.27y', '2019-03-31 05:06:08'),
(29, 'Zachar3', '$2y$10$JfSe2GWjcJUhbGEdLv25yerZVgLdupjNAO97sqxdEa5fGZ16Y3ere', '2019-03-31 05:30:55'),
(30, 'FineMantine', '$2y$10$i1AGGB5e8/ngFJv0hPvHtePTzeAXh4wu1rAM.53blv9k7ywE.pfrq', '2019-03-31 05:31:19'),
(31, 'Thinker123', '$2y$10$rAV7xW2lnDji4NSimMN.eeQ2wNbpY74dEJxiP5JzYMeZgC49EgP4G', '2019-03-31 05:45:32'),
(32, 'Yarbles', '$2y$10$h25YiQDg49K2KG6pf7kFhuNkTfT5fBsgHPc9KDU6PebxBVWApOpcC', '2019-03-31 05:57:42'),
(33, 'Heeb', '$2y$10$DmpP.2mDlrCSerFJLkKtKujPYIgljHRMfdSVxVvkAsjOpA.sd4IH.', '2019-03-31 06:00:39'),
(34, 'TylerDurden', '$2y$10$GlWArJL9ACK10PV8HstEpOYKxDMXgy27jXBpmkI8XTLsfIV6kZbQm', '2019-03-31 06:00:55'),
(35, 'MonsierGrev', '$2y$10$D6ZQ03kf51WaP0ZH.6gdO.m2u.MIgDam1eKftq68XZGhFZ.3Wnol.', '2019-03-31 06:01:10'),
(37, 'brehMons', '$2y$10$u6g/.As9roXcnfGCOL0QRecJ.5MI0cn5vgz4f1IsgRZ6HNnE7Bqnu', '2019-03-31 19:33:19'),
(38, 'harry_ki', '$2y$10$RXK2I3wQaubo5R5.G.XFOOsKC9oxQGdzrFQJTNOMQ2a.0DAf9LX8u', '2019-03-31 20:07:37'),
(39, 'kasey', '$2y$10$T8agyNrwPOTU6kPbinXPluAfV3Z/609Hd.z42Pp5bkAaLmVfRJ9.6', '2019-03-31 20:08:00'),
(40, 'vicky', '$2y$10$V2BwyOQPhjO41gfGW23wA.OTn0ysrX439KiY/5hzM7qs2/w.DkiIO', '2019-03-31 20:08:51'),
(41, 'guest1', '$2y$10$bjQcN.WqYfeqvC7cKaqyVOkJMti1/N8vUOB/a.4eUAFXhdPsNj5Ei', '2019-04-01 00:12:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PostID` (`PostID`);

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
  ADD UNIQUE KEY `URANK` (`UserID`,`PostID`),
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
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Rank`
--
ALTER TABLE `Rank`
  MODIFY `RankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`);

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
