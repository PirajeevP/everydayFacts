-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 10, 2019 at 10:00 PM
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
  `Type` varchar(50) DEFAULT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`CategoryID`, `Type`, `Image`) VALUES
(1, 'Science', 'science'),
(2, 'Literature', 'literature'),
(3, 'Art', 'art'),
(4, 'History', 'history'),
(5, 'Miscellaneous', 'miscellaneous');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Comment` longtext NOT NULL,
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
(19, 1, 41, 'Wow I never thought that would be the rarest blood type', '2019-04-01 00:39:02'),
(20, 2, 1, 'Wow, what a great post!', '2019-04-03 05:36:09'),
(21, 33, 1, 'Wow!', '2019-04-03 05:46:25'),
(29, 2, 1, 'I just commented on my own post.', '2019-04-10 05:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Title` longtext,
  `PostDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CategoryID` int(11) DEFAULT NULL,
  `Content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `UserID`, `Title`, `PostDate`, `CategoryID`, `Content`) VALUES
(1, 35, 'TIL that rh-null, the rarest blood type of the world, has been called the \"Golden Blood\". This blood type is so rare that only 43 people in the world have it, and there are only 9 active donor.', '2019-03-31 02:50:03', 1, 'Rhnull phenotype. Rhnull individuals have no Rh antigens (no Rh or RhAG) on their red blood cells. This condition is rare.'),
(2, 1, 'TIL in ancient Egypt, under the decree of Ptolemy II, all ships visiting the city were obliged to surrender their books to the library of Alexandria and be copied. The original would be kept in the library and the copy given back to the owner.                      ', '2019-03-31 02:50:03', 1, 'Ptolemy II Philadelphus, (Philadelphus in Greek: “Brother-Loving”) (born 308 bce, Cos—died 246), king of Egypt (285–246 bce), second king of the Ptolemaic dynasty, who extended his power by skillful diplomacy, developed agriculture and commerce, and made Alexandria a leading centre of the arts and sciences...'),
(3, 35, 'TIL Australia\'s first cops were all criminals. Their first police force was made up of 12 of the best behaved convicts.', '2019-03-31 02:50:03', 5, 'When you think of the police force, you probably think of exceptional men and women. Pillars of society. But that wasn’t always the case.\r\n\r\nIn fact, Australia’s first police force was made up entirely of convicts.\r\n\r\nAfter the First Fleet arrived in New South Wales in January of 1788, the Marines of the Royal Navy was put in charge of law enforcement, laying down the rules set by Governor Arthur Phillip.\r\n\r\nWith the pain of reduced rations hitting hard, crime began to rise steadily throughout the colony.\r\n\r\nIt was soon decided that the new settlement needed a police force of its own, so Governor Phillip created the Night Watch.\r\n\r\nWith little manpower available, the Governor decided to populate the Night Watch with 12 of the best behaved convicts.'),
(4, 3, 'TIL if you won the lottery in Australia, you had to go public with your win, turning into an overnight celebrity. This was until the abduction & murder of Graeme Thorne, 8, whose family won the lottery leading to Graeme being abducted for ransom but killed.', '2019-03-31 02:50:03', 5, 'It was the 7th of July, 1960, when Freda Thorne kissed her son, 8-year-old Graeme Thorne, goodbye and sent him off to school. Graeme lived in a two-bedroom ground floor flat in Edward St., Bondi, Australia, with his mother, his father, Bazil, and his 3-year-old sister, Belinda.\r\n\r\nTragically, this was the last time Freda would ever see her son alive. Moments after leaving their home, he would become the very first victim of kidnap for ransom in Australia’s history.\r\n\r\nThat morning, Graeme walked the short distance to Wellington and O’Brien Streets to wait for family friend, Phyllis Smith, who would routinely collect him from this spot to take him to school along with her own two sons. When she arrived as the designated spot, Graeme wasn’t there. Phyllis drove to the Thorne residence to check if Graeme was there. He wasn’t. Freda immediately called police to report her son missing.\r\n\r\n'),
(5, 5, 'TIL the last victim of the 1966 University of Texas at Austin shooting died in 2001 after having to undergo dialysis for 35 years, 3 times a week, 5 hours each time. His death was ruled a homicide.', '2019-03-31 02:50:03', 4, 'It took 35 painful years, but a rifle bullet fired by Charles Whitman on Aug. 1, 1966, from the observation deck of the University of Texas Tower finally killed its victim this week.\r\n\r\nDavid Gunby, 58, died Monday at Harris Hospital in Fort Worth, and the Tarrant County medical examiner, Dr. Nizam Peerwani, ruled the death a homicide, given the chronic kidney problems he suffered because of the gunshot wound.'),
(6, 1, 'TIL NASA calculated that you only need 40 digits of Pi to calculate the circumference of the observable universe, to the accuracy of 1 hydrogen atom ', '2019-03-31 02:50:03', 1, '\r\nEarlier this week, we received this question from a fan on Facebook who wondered how many decimals of the mathematical constant pi (π) NASA-JPL scientists and engineers use when making calculations:\r\n\r\nDoes JPL only use 3.14 for its pi calculations? Or do you use more decimals like say: 3.14159265358979...'),
(7, 30, 'TIL Smoking Areas existed in Public High Schools back in the 1980’s. Students could smoke cigarettes on school grounds between classes in designated lounges', '2019-03-31 05:36:28', 4, 'Legislation to eliminate student smoking areas on public high school campuses gained final legislative passage Wednesday night and was sent to Gov. George Deukmejian.'),
(9, 1, 'TIL Slave Bible, an abridged version of the bible made for slaves, in which the enslaved Israelites never left Egypt and lines that condemn slave owners were removed.', '2019-04-02 21:10:45', 4, 'testing post content'),
(11, 1, 'TIL Deep-Sea Gigantism is the tendency for species to be larger than their shallower-water relatives. Proposed explanations include: scarcer resources; greater pressure; and colder temperatures.', '2019-04-02 21:12:34', 1, 'In zoology, deep-sea gigantism, also known as abyssal gigantism, is the tendency for species of invertebrates and other deep-sea dwelling animals to be larger than their shallower-water relatives. Proposed explanations involve adaptation to scarcer food resources, greater pressure or colder temperature at depth.'),
(13, 1, 'TIL Southern California Edison plans to bury 3.6 million pounds of lethal radioactive waste at the closed San Onofre nuclear power plant, about 100 feet from the ocean and just a few feet above the water table.', '2019-04-02 21:13:07', 5, 'he current plan for storing the plant\'s radioactive waste is ... Southern California Edison is keeping 3.6 million pounds of lethal radioactive waste at the shuttered San Onofre nuclear plant in ... The idea is to bury the spent fuel on site, about 100 feet from the ocean and just a few feet above the water table.\r\n'),
(15, 1, 'TIL Pigeons can understand when a flock leader is doing a poor job and course correct. The poor leader will also spend less time as head bird and lose flock mates due to poor performance.', '2019-04-02 21:13:49', 5, 'Speed wins over competence in the pigeon world: The fastest, not the smartest, pigeons become leaders of the flock. But a new study published in the Royal Society journal Biology Letters shows potential for a coup in the coop when the head pigeon flies astray.\r\n\r\nResearchers at the University of Oxford confused pigeons using \"clock-shifting,\" to mix up their navigational abilities. This is essentially intentional jet-lagging: Homing pigeons are kept in a light-sealed room, where artificial lights are turned on and off at intervals out of phase with the sun\'s natural light. When they\'re released, they\'ve been calibrated to head in the direction you want them to fly.\r\n\r\nTaking eight GPS-tracked flocks of five birds each, they clock-shifted either the whole flock, none of the birds, or only the lead bird. In those where the whole flock was on the same, wrong page, they tended to deviate away from their homeward path. When just the leader was confused, however, the rest of the birds course-corrected, despite the leader\'s incorrect path. The head bird spent less time at the top, and lost more followers when the rest of the flock knew what was up.\r\n\r\n\"The exact mechanism by which a flock is able to correct for misinformation coming from its leader is still unclear,\" lead author Isobel Watts told Phys.org. \"However, we can speculate that it may be due to either misinformed flock leaders doubting their own abilities and paying more attention to what their flockmates appear to be doing, or the flock members recognising weakness in the leader and taking more control themselves.\"\r\n\r\ntags:  pigeons  animals  intelligence \r\nYou May Like\r\nHigh Speed WiFi Booster Takes Canada By Storm\r\nWiFi Booster\r\nU.S. Cardiologist: It\'s Like a Pressure Wash for Your Insides\r\nTotal Restore Supplement\r\nSponsored Links\r\nMost Of The Web Is Invisible To Google. Here\'s What It Contains\r\nWant to know more about the dark web and what’s available? Check out this roadmap to learn all about the deep web and its darkest alleys.\r\nYou May Like\r\nA Simple Fix For Snoring And Sleep Apnea\r\nPurch Expert\r\nDo You Know What Your Irish Surname Means?\r\nAncestry™\r\nSponsored Links\r\nSeasoning your cast iron pan isn’t enough\r\nCast iron is strange mixture of incredibly durable and unusually delicate—especially for a cooking implement. The metal is physically sturdy, but also highly reactive, which means even a droplet of water left in the pan can leave a rust spot. To protect that nice black surface, you must coat it with\r\nLATEST NEWS\r\nHEALTH\r\nWhat we know about the polio-like illness paralyzing children—and what we don\'t\r\nTECHNOLOGY\r\nMegapixels: An epic wildebeest crossing, a really hungry fox, and more Smithsonian Photo Contest finalists\r\nHEALTH\r\nThese charts will help you visualize just how unhealthy diets are around the world\r\nTECHNOLOGY\r\nNot all of us can ride a scooter. Here\'s a plan to get everyone where they need to go.\r\nHEALTH\r\nSleeping with your screens on is bad for you, whether you know it or not\r\nGADGETS\r\nThe best lightweight setup for a traveling guitarist\r\nENVIRONMENT\r\nAir pollution from corn production might contribute to thousands of deaths each year\r\nDIY\r\nHow to build a thriving indoor garden\r\nENVIRONMENT\r\nWind turbines do not cause cancer\r\n\r\nPOPSCI SHOP\r\nThis music-oriented app can help you learn a new language\r\nCheck out the Earworms Musical Brain Trainer app.\r\nBy Stack Commerce\r\n\r\nENVIRONMENT\r\nPretty soon we\'ll have to stop blaming China for global carbon emissions\r\nThe United States is lagging behind.\r\nBy Kat Eschner\r\n\r\nPOPSCI SHOP\r\nName your price on 65 hours of beginner-friendly design tutorials\r\nYour new creative career starts here.\r\nBy Stack Commerce\r\n\r\nSCIENCE\r\nDinosaur extinction is an unsolved mystery. This ancient fish may have swallowed some crucial evidence.\r\nBut the findings are not without their fair share of critics.\r\nBy Neel V. Patel\r\n\r\nGADGETS\r\nApple\'s AR headset, Amazon streaming news, and the rest of the current tech rumors\r\nCatch up on all the technology gossip without all the hype.\r\nBy PopSci Staff\r\n\r\nHEALTH\r\nMillennials want spirits—with none of the alcohol. Here\'s how distilleries make it work.\r\nThe science behind the latest (non-)drinking trend.\r\nBy Eleanor Cummins\r\n\r\nTECHNOLOGY\r\nThis experimental airplane will change shape while flying\r\nThe wing is strong but light.\r\nBy Rob Verger\r\n\r\nGADGETS\r\n40 percent off office supplies and other deals worth highlighting\r\nA quick guide to getting the goods for cheaper.\r\nBy Billy Cadden\r\nWant more news like this?\r\nSign up to receive our email newsletter and never miss an update!\r\n\r\nEnter email address\r\nBy submitting above, you agree to our privacy policy.\r\n\r\n \r\n          \r\nSUBSCRIBE RENEW CUSTOMER SERVICE PRIVACY POLICY TERMS OF USE ABUSE MASTHEAD CONTACT US GDPR\r\nMany products featured on this site were editorially chosen. Popular Science may receive financial compensation for products purchased through this site.\r\n\r\nCopyright © 2019 Popular Science. A Bonnier Corporation Company. All rights reserved. Reproduction in whole or in part without permission is prohibited.\r\n\r\n\r\n'),
(16, 1, 'TIL Nearly half of all airline pilots admit to falling asleep during a flight. 29 percent of these reported waking up and seeing everyone else in the cabin asleep as well.', '2019-04-02 21:14:45', 5, 'Poll also finds 49 per cent of flight-deck crew believe tiredness to be biggest threat to safety'),
(17, 1, 'TIL Noisestorm earned 50 thousand dollars from Epic Games for using their Unreal 4 game engine to create the music video for Crab Rave, \"for having the most creative and original use of their software. \"', '2019-04-02 21:26:13', 3, '\"Crab Rave\" was initially released as a small April Fool\'s Day joke,[3] although it soon gained popularity after becoming an internet meme due to the music video\'s uplifting theme and dancing crabs. In an interview with Suzana Palyan of Billboard, O\'Broin expressed his appreciation for its growing popularity, writing \"It\'s incredibly cool to see people enjoying it for the humour and video, as well as for the music itself. I really didn\'t anticipate the wave of new listeners and the plethora of memes based on the original; it\'s very fun to see the new creative variations being made every day.\" The music video was developed by O\'Broin using the program Unreal Engine.[4][3]'),
(18, 1, 'TIL Geese mate for life. When a hunter kills a goose, it\'s partner will mourn and generally refuse to mate again.', '2019-04-02 21:26:50', 1, 'Geese are especially fastidious when it comes to their loyalty. They\'re well known for the long-term pair bonds they form. So what\'s their secret? What makes these water birds so successful in their relationships, and why would geese mate for life?'),
(19, 1, 'TIL a majority of the \"snakes\" from the snake pit scene in Indiana Jones aren\'t actually snakes. The film used a species of legless lizards known as the sheltopusik.', '2019-04-02 21:29:07', 2, 'Our favourite ophidiophobe encounters snakes twice in the first of the three Indiana Jones movies. First, in South America, he finds himself in Jock’s plane, sharing a seat with Jock’s pet snake. You’d think that, being in South America, they’d use something South American, like a Boa Constrictor, which isn’t exactly hard to find. But no: they used a Burmese Python (Python molurus bivittatus) instead.'),
(20, 1, 'TIL That malaria has killed more than half of all humans since they were created.', '2019-04-02 21:29:56', 1, 'Long before Thanos snapped his fingers in Avengers: Infinity War, another villain successfully killed half of humanity.\r\n\r\nMalaria is a simple parasite, transmitted by a mosquito bite. But this deadly disease, which has been around as long as homo sapiens, has killed more than all wars and natural disasters combined. It has wiped out cities, destroyed empires, ruined colonies, and may be responsible for 50 billion deaths, among them Alexander the Great and Marcus Aurelius (allegedly).'),
(22, 1, 'TIL Amish people end formal education at the 8th grade. This is mainly because they value apprenticeship and hands-on learning, and that more advanced learning can foster anti-Christian beliefs and counter their values.', '2019-04-02 21:30:19', 3, 'Amish are well-known for their approach to schooling.  Most Amish children attend school in one- or two-room private schools, and end their formal education at the eighth grade.   Some observers criticize the Amish approach to education, seeing it as a means of restricting the individual.'),
(23, 1, 'TIL about Hart Island in NY, one of the largest cemeteries in the U.S. About one million people have been buried there since 1869, mostly children and stillborn babies. Very few people have even been allowed to visit, and taking pictures or videos is illegal.', '2019-04-02 21:30:35', 4, 'Hart Island, sometimes referred to as Hart\'s Island, is an island in the northeast Bronx.'),
(24, 1, 'TIL Groundhogs and Woodchucks are the same animal', '2019-04-02 21:32:46', 5, 'Groundhogs and woodchucks are the same animal. “Woodchuck” is just another name for “groundhog.”'),
(25, 1, 'TIL about William R. King, who was the 13th Vice President. He died of tuberculosis after only 6 weeks in office. He was also likely President Buchanan’s same sex partner.', '2019-04-02 21:33:31', 4, 'William Rufus DeVane King (April 7, 1786 – April 18, 1853) was an American politician and diplomat. '),
(26, 25, 'TIL American President Jimmy Carter issued complete pardons for draft avoiders and contentious objectors during the Vietnam War.', '2019-04-02 21:33:42', 4, 'On this day in 1977, U.S. President Jimmy Carter grants an unconditional pardon to hundreds of thousands of men who evaded the draft during the Vietnam War. '),
(27, 1, 'Til that Harvard student and seminarian Jonathan Daniels traveled to the south to aid the civil rights movement. He was walking with a black girl when a deputy pointed his shotgun at her. Daniels jumped in front of her, sacrificing his life so that she could live.', '2019-04-02 21:36:22', 4, 'Jonathan Myrick Daniels (March 20, 1939 – August 20, 1965) was an Episcopal seminarian and civil rights activist. In 1965, he was murdered by a shotgun-wielding construction worker, Tom Coleman, who was a special county deputy, in Hayneville, Alabama, while in the act of shielding 17-year-old Ruby Sales'),
(30, 1, 'TIL that cats have accents. Phonetics researchers have suggested that cats and their humans develop a “pidgin language” together to communicate, which may influence regional variations in cat vocalizations.', '2019-04-02 21:56:08', 1, 'Meow, miaou, yaong, nyan, näu: Humans say ‘meow’ in different ways, depending on what part of the world they’re from, but do cats? This is the question researchers at Lund University in Sweden are trying to answer in a new study on feline communication.'),
(31, 1, 'TIL during the 1936 Berlin Olympics, Jesse Owens fouled his first two attempts at long jump, but before the final attempt his Nazi rival, Luz Long, gave him some friendly advice that helped Owens qualify and win gold', '2019-04-03 05:40:07', 1, 'The Track and Field World Championships begin Saturday in Berlin — and they\'re surrounded by symbolism. It\'s the first time an American team has returned to the German city for a major international championship since the infamous 1936 Berlin Olympics. American team members will wear a patch honoring Jesse Owens, the star of the \'36 games.'),
(32, 1, 'TIL that Chicago\'s Field Museum has 10 colonies of flesh-eating beetles, who live and work at the museum cleaning animal bones for display.', '2019-04-03 05:44:46', 1, 'Not long ago, the thing in the tank was a living animal—a bobcat that prowled and hunted the way bobcats do, and then eventually died. What’s in the tank doesn’t resemble a bobcat, though. It’s just a mass that looks a little bit like jerky meat still on the bone. And the bobcat isn\'t alone, either: Little black beetles and setae-studded larvae are swarming all over the meat, devouring it. Put an ear to the top of the tank, and you’ll hear something akin to the snap-crackle-pop of Rice Krispies just drenched in milk—the sound of thousands of dermestid beetles hard at work.'),
(33, 1, 'TIL an alcoholic court stenographer in Manhattan repeatedly typed I hate my job instead of documenting speech during cases', '2019-04-03 05:46:14', 1, 'The actions of Kochanski, who has since been fired, have jeopardised several cases by giving felons the opportunity to claim crucial evidence is missing.'),
(39, 1, 'TIL in 2007, a 12 year old Norwegian boy named Hans Jorgen Olsen saved both himself and his sister from a vicious moose attack using skills he learned from playing World of Warcraft; taunt and feign death.', '2019-04-04 23:29:08', 1, 'Gaming skills are clearly transferable to real-life situations as one Norwegian boy will tell you. 12-year-old Hans Jorgen Olsen called upon skills gained through playing World of Warcraft to save himself and his sister from a moose attack.'),
(45, 1, 'TIL of Saitō Musashibō Benkei, a Japanese warrior who is said to have killed in excess of 300 trained soldiers by himself while defending a bridge. He was so fierce in close quarters that his enemies were forced to kill him with a volley of arrows. He died standing upright.', '2019-04-05 02:30:22', 2, 'Benkei was said to have wandered around Kyoto every night on a personal quest to take 1000 swords from samurai warriors, whom he believed were arrogant and unworthy. After collecting 999 swords through duels and looking for his final prize, he met a young man playing a flute at Gojotenjin Shrine in Kyoto. The much shorter man supposedly carried a gilded sword around his waist. Instead of dueling at the shrine itself, the two walked to Gojo Bridge in the city where the bigger Benkei ultimately lost to the smaller warrior, who happened to be Minamoto no Yoshitsune, a son of Minamoto no Yoshitomo. Some sources claim that the fight took place not at the Gojo Bridge, but instead at Matsubara Bridge.[3] Not long after the duel, Benkei, frustrated and looking for revenge, waited for Yoshitsune at the Buddhist temple of Kiyomizu, where he lost yet again.[4] Henceforth, he became Yoshitsune\'s retainer and fought with him in the Genpei War against the Taira clan.'),
(61, 57, 'TIL In the early 20th century the term \"Muggles\" meant someone who smoked marijuana. Louis Armstrong and some bandmates would get high before recording sessions and even recorded a song called \"Muggles\".', '2019-04-10 21:46:20', 5, '<br>');

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
(368, 1, 1, 1),
(374, 1, 6, 1),
(375, 1, 4, 1),
(376, 1, 5, 0),
(379, 30, 1, 0),
(383, 30, 5, 1),
(384, 41, 5, 0),
(389, 41, 3, 1),
(390, 41, 1, 1),
(391, 41, 2, 1),
(392, 1, 24, 1),
(393, 1, 25, 1),
(394, 1, 26, 1),
(395, 1, 27, 1),
(397, 13, 23, 1),
(399, 13, 1, 1),
(400, 13, 2, 1),
(401, 13, 4, 1),
(402, 13, 3, 1),
(403, 13, 5, 1),
(404, 13, 6, 1),
(405, 13, 7, 1),
(406, 13, 9, 1),
(407, 13, 11, 1),
(408, 13, 13, 1),
(409, 13, 15, 1),
(410, 13, 16, 1),
(411, 13, 17, 1),
(412, 13, 18, 1),
(413, 13, 19, 1),
(414, 13, 20, 1),
(415, 13, 22, 1),
(421, 1, 18, 1),
(424, 1, 30, 1),
(434, 1, 31, 1),
(435, 1, 32, 1),
(436, 1, 33, 1),
(439, 1, 3, 1),
(452, 1, 45, 1),
(453, 1, 9, 1),
(454, 1, 7, 1),
(467, 57, 61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `UserDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserName`, `Password`, `UserDate`, `Email`) VALUES
(1, 'Giraffe', '$2y$10$JkLf8rOEsgDfbsGFziJ5o.3HeXAxNuuPd0rOEYu7r0R0t5Vrwt7Ny', '2019-03-31 02:45:36', 'giraffe@gmail.com'),
(3, 'ThiccBrain', '1234', '2019-03-31 02:46:23', 'bah@gmail.com'),
(4, 'guest3', '1234', '2019-03-31 02:46:23', 'why@gmail.com'),
(5, 'TurtleSnekAttac', '1234', '2019-03-31 02:46:23', 'sneksnek@gmail.com'),
(10, 'michelle', '12345', '2019-03-31 04:45:17', 'whsy@gmail.com'),
(11, 'coldwhipsza', '1234', '2019-03-31 04:47:10', 'idontwannabhere@gmail.com'),
(12, 'jaiga99', '$2y$10$FfY0beoYkDwTUI4Yx7aZBOcwIX8vsKeGTn3reaQI86bRC250O0Asu', '2019-03-31 04:47:30', 'idunwona@gmail.com'),
(13, 'bingingwithbaggins', '$2y$10$xr5RZ9cFTRjSavVIlH7c5OEboEwjQkKZEvvDMhAf2hKDpHLtJv1CG', '2019-03-31 04:47:44', 'kilef@gmail.com'),
(22, 'thepresident', '$2y$10$lQLFzUxHxEAJf/2YAg4OZuAq0i8.tac5muyHFRIC1YWIFnRYVqeLm', '2019-03-31 04:53:57', 'helslo@gmail.com'),
(25, 'IndyScent', 'asdf', '2019-03-31 04:55:28', 'byebye@gmail.com'),
(27, 'pixxelZombie', '1234', '2019-03-31 05:05:31', 'whywhy@gmail.com'),
(28, 'LucaRedWood', '$2y$10$7w6T09kTTHlDKGV5.LiUVu41VwF5UxllqENF8.fyfK1t5X4eq.27y', '2019-03-31 05:06:08', 'mustbelove@gmail.com'),
(29, 'Zachar3', '$2y$10$JfSe2GWjcJUhbGEdLv25yerZVgLdupjNAO97sqxdEa5fGZ16Y3ere', '2019-03-31 05:30:55', 'tesin@gmail.com'),
(30, 'FineMantine', '$2y$10$i1AGGB5e8/ngFJv0hPvHtePTzeAXh4wu1rAM.53blv9k7ywE.pfrq', '2019-03-31 05:31:19', 'justtogetclo@gmail.com'),
(31, 'Thinker123', '$2y$10$rAV7xW2lnDji4NSimMN.eeQ2wNbpY74dEJxiP5JzYMeZgC49EgP4G', '2019-03-31 05:45:32', 'neyo@gmail.com'),
(32, 'Yarbles', '$2y$10$h25YiQDg49K2KG6pf7kFhuNkTfT5fBsgHPc9KDU6PebxBVWApOpcC', '2019-03-31 05:57:42', 'rihan@gmail.com'),
(33, 'Heeb', '$2y$10$DmpP.2mDlrCSerFJLkKtKujPYIgljHRMfdSVxVvkAsjOpA.sd4IH.', '2019-03-31 06:00:39', 'meepmorp@gmail.com'),
(34, 'TylerDurden', '$2y$10$GlWArJL9ACK10PV8HstEpOYKxDMXgy27jXBpmkI8XTLsfIV6kZbQm', '2019-03-31 06:00:55', 'meepmeep@gmail.com'),
(35, 'MonsierGrev', '$2y$10$D6ZQ03kf51WaP0ZH.6gdO.m2u.MIgDam1eKftq68XZGhFZ.3Wnol.', '2019-03-31 06:01:10', 'hehehehe@gmail.com'),
(37, 'brehMons', '$2y$10$u6g/.As9roXcnfGCOL0QRecJ.5MI0cn5vgz4f1IsgRZ6HNnE7Bqnu', '2019-03-31 19:33:19', 'whysbyesmsamerican@gmail.com'),
(38, 'harry_ki', '$2y$10$RXK2I3wQaubo5R5.G.XFOOsKC9oxQGdzrFQJTNOMQ2a.0DAf9LX8u', '2019-03-31 20:07:37', 'heeb@gmail.com'),
(39, 'kasey', '$2y$10$T8agyNrwPOTU6kPbinXPluAfV3Z/609Hd.z42Pp5bkAaLmVfRJ9.6', '2019-03-31 20:08:00', 'howculdthishappentome@gmail.com'),
(40, 'vicky', '$2y$10$V2BwyOQPhjO41gfGW23wA.OTn0ysrX439KiY/5hzM7qs2/w.DkiIO', '2019-03-31 20:08:51', 'brahplease@gmail.com'),
(41, 'guest1', '$2y$10$bjQcN.WqYfeqvC7cKaqyVOkJMti1/N8vUOB/a.4eUAFXhdPsNj5Ei', '2019-04-01 00:12:15', 'ihateyou@gmail.com'),
(52, 'Ithink', '$2y$10$VlYnCRMRDugM8nm.46ybkek7MoiDjG3bDkGLAI/y.qKy94ivsosXe', '2019-04-04 23:30:16', 'wong_michelle@rogers.com'),
(53, '1234', '$2y$10$ming.S4PhFHiRvFqoIgZEe6.jQA.xBg/fQ2xojbP9B2TOQpiH/V1O', '2019-04-04 23:30:35', 'a@hotmail.com'),
(54, 'Janice', '$2y$10$oiVHIlm2FiDFYw93hIO.7e1l2uurZXoGVg1jV0ObFC.DljsttvtU6', '2019-04-10 04:38:47', 'Janice@hotmail.com'),
(55, 'Test', '$2y$10$jqAXiPQ8tCSVQdsV0Pl6teChV0vFcUhvgB2DzNzbXoidJ7Lo1/D9W', '2019-04-10 05:49:53', '1@hotmail.com'),
(56, 'ZarqaMac', '$2y$10$uo6em7iPMx/2TPQyUyV0/es5snFfp4yfjprxVZ8NoY1JiIzX9jprS', '2019-04-10 21:42:56', 'ZarqaMac@hotmail.com'),
(57, 'MacDonald', '$2y$10$rQsgLGkRsSRjrwULbMfLIOaarCsYr8FklvzngvzIqfP7lV6cIHwGS', '2019-04-10 21:45:00', 'MacDonald@live.com');

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
  ADD KEY `comments_ibfk_2` (`PostID`);

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
  ADD KEY `rank_ibfk_2` (`PostID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`) USING BTREE,
  ADD UNIQUE KEY `Email` (`Email`) USING BTREE,
  ADD UNIQUE KEY `User` (`UserName`,`Password`,`Email`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `Rank`
--
ALTER TABLE `Rank`
  MODIFY `RankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `rank_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`) ON DELETE CASCADE;
