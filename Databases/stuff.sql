-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 04, 2019 at 10:34 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `everydayfactsDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Title` text,
  `PostDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CategoryID` int(11) DEFAULT NULL,
  `Content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `UserID`, `Title`, `PostDate`, `CategoryID`, `Content`) VALUES
(1, 35, 'TIL that rh-null, the rarest blood type of the world, has been called the \"Golden Blood\". This blood type is so rare that only 43 people in the world have it, and there are only 9 active donor.', '2019-03-31 02:50:03', 1, ''),
(2, 1, 'TIL in ancient Egypt, under the decree of Ptolemy II, all ships visiting the city were obliged to surrender their books to the library of Alexandria and be copied. The original would be kept in the library and the copy given back to the owner.', '2019-03-31 02:50:03', 2, ''),
(3, 35, 'TIL Australia\'s first cops were all criminals. Their first police force was made up of 12 of the best behaved convicts.', '2019-03-31 02:50:03', 1, ''),
(4, 3, 'TIL if you won the lottery in Australia, you had to go public with your win, turning into an overnight celebrity. This was until the abduction & murder of Graeme Thorne, 8, whose family won the lottery leading to Graeme being abducted for ransom but killed.', '2019-03-31 02:50:03', 3, ''),
(5, 5, 'TIL the last victim of the 1966 University of Texas at Austin shooting died in 2001 after having to undergo dialysis for 35 years, 3 times a week, 5 hours each time. His death was ruled a homicide.', '2019-03-31 02:50:03', 2, ''),
(6, 1, 'TIL NASA calculated that you only need 40 digits of Pi to calculate the circumference of the observable universe, to the accuracy of 1 hydrogen atom', '2019-03-31 02:50:03', 1, ''),
(7, 30, 'TIL Smoking Areas existed in Public High Schools back in the 1980’s. Students could smoke cigarettes on school grounds between classes in designated lounges', '2019-03-31 05:36:28', 3, ''),
(9, 1, 'TIL Slave Bible, an abridged version of the bible made for slaves, in which the enslaved Israelites never left Egypt and lines that condemn slave owners were removed.', '2019-04-02 21:10:45', 1, 'testing post content'),
(11, 1, 'TIL Deep-Sea Gigantism is the tendency for species to be larger than their shallower-water relatives. Proposed explanations include: scarcer resources; greater pressure; and colder temperatures.', '2019-04-02 21:12:34', 1, ''),
(13, 1, 'TIL Southern California Edison plans to bury 3.6 million pounds of lethal radioactive waste at the closed San Onofre nuclear power plant, about 100 feet from the ocean and just a few feet above the water table.', '2019-04-02 21:13:07', 2, ''),
(15, 1, 'TIL Pigeons can understand when a flock leader is doing a poor job and course correct. The poor leader will also spend less time as head bird and lose flock mates due to poor performance.', '2019-04-02 21:13:49', 3, ''),
(16, 1, 'TIL Nearly half of all airline pilots admit to falling asleep during a flight. 29 percent of these reported waking up and seeing everyone else in the cabin asleep as well.', '2019-04-02 21:14:45', 2, 'test post'),
(17, 1, 'TIL Noisestorm earned 50 thousand dollars from Epic Games for using their Unreal 4 game engine to create the music video for Crab Rave, \"for having the most creative and original use of their software. \"', '2019-04-02 21:26:13', 3, 'dfgsdfgsdfgsdfg'),
(18, 1, 'TIL Geese mate for life. When a hunter kills a goose, it\'s partner will mourn and generally refuse to mate again.', '2019-04-02 21:26:50', 1, 'sdfsdf'),
(19, 1, 'TIL a majority of the \"snakes\" from the snake pit scene in Indiana Jones aren\'t actually snakes. The film used a species of legless lizards known as the sheltopusik.', '2019-04-02 21:29:07', 2, 'sdf'),
(20, 1, 'TIL That malaria has killed more than half of all humans since they were created.', '2019-04-02 21:29:56', 1, 'sdf'),
(22, 1, 'TIL Amish people end formal education at the 8th grade. This is mainly because they value apprenticeship and hands-on learning, and that more advanced learning can foster anti-Christian beliefs and counter their values.', '2019-04-02 21:30:19', 3, ''),
(23, 1, 'TIL about Hart Island in NY, one of the largest cemeteries in the U.S. About one million people have been buried there since 1869, mostly children and stillborn babies. Very few people have even been allowed to visit, and taking pictures or videos is illegal.', '2019-04-02 21:30:35', 1, 'sdfsdfdsf'),
(24, 1, 'TIL Groundhogs and Woodchucks are the same animal', '2019-04-02 21:32:46', 1, '<br>'),
(25, 1, 'TIL about William R. King, who was the 13th Vice President. He died of tuberculosis after only 6 weeks in office. He was also likely President Buchanan’s same sex partner.', '2019-04-02 21:33:31', 1, '<br>'),
(26, 1, 'TIL American President Jimmy Carter issued complete pardons for draft avoiders and contentious objectors during the Vietnam War.', '2019-04-02 21:33:42', 2, 'sdfdgdfgdsfg'),
(27, 1, 'Til that Harvard student and seminarian Jonathan Daniels traveled to the south to aid the civil rights movement. He was walking with a black girl when a deputy pointed his shotgun at her. Daniels jumped in front of her, sacrificing his life so that she could live.', '2019-04-02 21:36:22', 1, 'sdfsdf'),
(30, 1, 'TIL that cats have accents. Phonetics researchers have suggested that cats and their humans develop a “pidgin language” together to communicate, which may influence regional variations in cat vocalizations.', '2019-04-02 21:56:08', 1, 'Does it work'),
(31, 1, 'TIL during the 1936 Berlin Olympics, Jesse Owens fouled his first two attempts at long jump, but before the final attempt his Nazi rival, Luz Long, gave him some friendly advice that helped Owens qualify and win gold', '2019-04-03 05:40:07', 1, 'Yes, it is true'),
(32, 1, 'TIL In Peru guinea pigs are such a large part of the traditional cuisine that the Cathedral Basilica has a rendition of the last supper that depicts Jesus dining on guinea pig', '2019-04-03 05:44:46', 1, 'I really did'),
(33, 1, 'TIL In 2006, Kink.com purchased the San Francisco Armory for $14.5 million, for use as a production studio. Supporters welcomed Kink.com\'s preservation of the historic building as part of an overall attempt to revitalize and bring back business to the area while opponents protested', '2019-04-03 05:46:14', 1, 'It is true.'),
(34, 1, 'TIL that I needed to present this in class', '2019-04-03 05:53:05', 1, 'I am presenting it.'),
(35, 1, 'Does this work?', '2019-04-04 19:44:18', 1, 'sdfsdf'),
(36, 1, 'asd', '2019-04-04 19:59:12', 1, 'Hey'),
(37, 1, 'asd', '2019-04-04 21:28:45', 2, 'dsfdsfsdf'),
(38, 1, 'asdfff', '2019-04-04 21:28:53', 3, 'dssdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`);
