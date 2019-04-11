-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2019 at 11:09 PM
-- Server version: 5.7.25
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wong2580`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`wong2580`@`%` PROCEDURE `delete_movie` (IN `n_movie_year` YEAR, IN `n_movie_title` VARCHAR(50))  BEGIN 
	IF EXISTS (SELECT 1 FROM movie m WHERE m.movie_title = n_movie_title AND m.movie_year = n_movie_year) THEN
		DELETE FROM movie WHERE (movie.movie_title = n_movie_title AND movie.movie_year = n_movie_year);
	END IF;
END$$

CREATE DEFINER=`wong2580`@`%` PROCEDURE `insert_movie` (IN `n_movie_title` VARCHAR(50), IN `n_movie_year` YEAR)  BEGIN 
	IF EXISTS (SELECT 1 FROM movie m WHERE m.movie_title = n_movie_title AND m.movie_year = n_movie_year) THEN
		SELECT 0;
	ELSE
		INSERT INTO movie (movie_title, movie_year) VALUES (n_movie_title, n_movie_year);
	END IF;
END$$

CREATE DEFINER=`wong2580`@`%` PROCEDURE `update_movie_desc` (IN `n_movie_title` VARCHAR(50), IN `n_movie_year` YEAR, IN `n_movie_desc` LONGTEXT)  BEGIN 
	IF EXISTS (SELECT 1 FROM movie m WHERE m.movie_title = n_movie_title AND m.movie_year = n_movie_year) THEN
		UPDATE movie m SET m.movie_desc = n_movie_desc;
	END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`wong2580`@`%` FUNCTION `movie_count` (`movie_type_id` CHAR(50)) RETURNS INT(11) BEGIN
   DECLARE answer INT;
   Set answer = 0;
   If movie_type_id = "" THEN
   	SELECT COUNT(movie_id) INTO answer FROM movie m;
   ELSE
		SELECT COUNT(movie_id) INTO answer FROM movie m WHERE m.m_type_id = movie_type_id ;
	END IF;
	RETURN answer;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actor_id` tinyint(4) NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of actors/actresses that have starred in movies in this database';

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `first_name`, `last_name`, `created`) VALUES
(1, 'Liam', 'Hemsworth', '2018-03-20 22:10:39'),
(2, 'Leonardo', 'Dicaprio', '2018-03-20 22:10:54'),
(3, 'Ellen', 'Page', '2018-03-20 22:11:03'),
(4, 'Tom', 'Hiddleston', '2018-03-20 22:10:45'),
(5, 'Joseph-Gordon', 'Levitt', '2018-03-20 22:17:04'),
(6, 'Kate', 'Winslet', '2018-03-20 22:44:02'),
(9, 'David', 'Attenborough', '2018-03-21 23:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `Artists`
--

CREATE TABLE `Artists` (
  `ArtistID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) NOT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT 'M',
  `YearOfBirth` int(11) DEFAULT '0',
  `YearOfDeath` int(11) DEFAULT '0',
  `Details` longtext,
  `ArtistLink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Artists`
--

INSERT INTO `Artists` (`ArtistID`, `FirstName`, `LastName`, `Nationality`, `Gender`, `YearOfBirth`, `YearOfDeath`, `Details`, `ArtistLink`) VALUES
(1, 'Pablo', 'Picasso', 'Spain', 'M', 1881, 1973, 'Pablo Diego José Francisco de Paula Juan Nepomuceno María de los Remedios Cipriano de la Santísima Trinidad Ruiz y Picasso known as Pablo Ruiz Picasso was a Spanish painter, draughtsman, and sculptor who lived most of his life in France. He is widely known for co-founding the Cubist movement and for the wide variety of styles that he helped develop and explore. Among his most famous works are the proto-Cubist Les Demoiselles d\'Avignon (1907) and Guernica (1937), a portrayal of the German bombing of Guernica during the Spanish Civil War.', 'http://en.wikipedia.org/wiki/Picasso'),
(2, 'Henri', 'Matisse', 'France', 'M', 1869, 1954, 'Henri Matisse was a French artist, known for his use of colour and his fluid and original draughtsmanship. He was a draughtsman, printmaker, and sculptor, but is known primarily as a painter. Matisse is commonly regarded, along with Picasso and Marcel Duchamp, as one of the three artists who helped to define the revolutionary developments in the plastic arts in the opening decades of the 20th century, responsible for significant developments in painting and sculpture. Although he was initially labelled a Fauve (wild beast), by the 1920s he was increasingly hailed as an upholder of the classical tradition in French painting. His mastery of the expressive language of colour and drawing, displayed in a body of work spanning over a half-century, won him recognition as a leading figure in modern art', 'http://en.wikipedia.org/wiki/Matisse'),
(5, 'Jacques-Louis', 'David', 'France', 'M', 1748, 1825, 'Jacques-Louis David was a French painter in the Neoclassical style, considered to be the preeminent painter of the era. In the 1780s his cerebral brand of history painting marked a change in taste away from Rococo frivolity toward a classical austerity and severity, heightened feeling chiming with the moral climate of the final years of the Ancien Régime.\r\nDavid later became an active supporter of the French Revolution and friend of Maximilien Robespierre (1758–1794), and was effectively a dictator of the arts under the French Republic. Imprisoned after Robespierre\'s fall from power, he aligned himself with yet another political regime upon his release, that of Napoleon I. It was at this time that he developed his Empire style, notable for its use of warm Venetian colours. David had a huge number of pupils, making him the strongest influence in French art of the early 19th century, especially academic Salon painting.', 'http://en.wikipedia.org/wiki/Jacques-Louis_David'),
(6, 'Jean-Auguste-Dominique', 'Ingres', 'France', 'M', 1780, 1867, 'Jean-Auguste-Dominique Ingres was a French Neoclassical painter. Although he considered himself to be a painter of history in the tradition of Nicolas Poussin and Jacques-Louis David, by the end of his life it was Ingres\'s portraits, both painted and drawn, that were recognized as his greatest legacy.', 'http://en.wikipedia.org/wiki/Ingres'),
(7, 'Eugene', 'Delacroix', 'France', 'M', 1798, 1863, 'Eugène Delacroix was a French Romantic artist regarded from the outset of his career as the leader of the French Romantic school. Delacroix\'s use of expressive brushstrokes and his study of the optical effects of colour profoundly shaped the work of the Impressionists, while his passion for the exotic inspired the artists of the Symbolist movement. A fine lithographer, Delacroix illustrated various works of William Shakespeare, the Scottish writer Walter Scott and the German writer Johann Wolfgang von Goethe.', 'http://en.wikipedia.org/wiki/Eug%C3%A8ne_Delacroix'),
(8, 'Francisco', 'Goya', 'Spain', 'M', 1746, 1828, 'Francisco José de Goya y Lucientes was a Spanish romantic painter and printmaker regarded both as the last of the Old Masters and the first of the moderns. Goya was a court painter to the Spanish Crown, and through his works was both a commentator on and chronicler of his era. The subversive and imaginative element in his art, as well as his bold handling of paint, provided a model for the work of later generations of artists, notably Manet, Picasso and Francis Bacon.', 'http://en.wikipedia.org/wiki/Goya'),
(10, 'Gustave', 'Courbet', 'France', 'M', 1818, 1877, 'Jean Désiré Gustave Courbet was a French painter who led the Realist movement in 19th-century French painting. The Realist movement bridged the Romantic movement (characterized by the paintings of Théodore Géricault and Eugène Delacroix), with the Barbizon School and the Impressionists. Courbet occupies an important place in 19th century French painting as an innovator and as an artist willing to make bold social commentary in his work.', 'http://en.wikipedia.org/wiki/Courbet'),
(12, 'Edouard', 'Manet', 'France', 'M', 1832, 1883, 'Édouard Manet was a French painter. One of the first 19th-century artists to approach modern-life subjects, he was a pivotal figure in the transition from Realism to Impressionism.', 'http://en.wikipedia.org/wiki/Manet'),
(13, 'James Abbott', 'Whistler', 'USA', 'M', 1834, 1903, 'James Abbott McNeill Whistler was an American-born, British-based artist. Averse to sentimentality and moral allusion in painting, he was a leading proponent of the credo \"art for art\'s sake\". His famous signature for his paintings was in the shape of a stylized butterfly possessing a long stinger for a tail. The symbol was apt, for it combined both aspects of his personality—his art was characterized by a subtle delicacy, while his public persona was combative. Finding a parallel between painting and music, Whistler titled many of his paintings \"arrangements\", \"harmonies\", and \"nocturnes\", emphasizing the primacy of tonal harmony. His most famous painting is Whistler\'s Mother (1871), the revered and oft parodied portrait of motherhood. Whistler influenced the art world and the broader culture of his time with his artistic theories and his friendships with leading artists and writers.', 'http://en.wikipedia.org/wiki/James_Abbott_McNeill_Whistler'),
(14, 'Pierre Auguste', 'Renoir', 'France', 'M', 1841, 1919, 'Pierre-Auguste Renoir was a French artist who was a leading painter in the development of the Impressionist style. As a celebrator of beauty, and especially feminine sensuality, it has been said that \"Renoir is the final representative of a tradition which runs directly from Rubens to Watteau.\"', 'http://en.wikipedia.org/wiki/Renoir'),
(15, 'Edgar', 'Degas', 'France', 'M', 1834, 1917, 'Edgar Degas, born Hilaire-Germain-Edgar De Gas, was a French artist famous for his work in painting, sculpture, printmaking and drawing. He is regarded as one of the founders of Impressionism although he rejected the term, and preferred to be called a realist. A superb draughtsman, he is especially identified with the subject of the dance, and over half of his works depict dancers. These display his mastery in the depiction of movement, as do his racecourse subjects and female nudes. His portraits are notable for their psychological complexity and depiction of human isolation.', 'http://en.wikipedia.org/wiki/Degas'),
(16, 'Mary', 'Cassatt', 'USA', 'F', 1845, 1926, 'Mary Stevenson Cassatt was an American painter and printmaker. She lived much of her adult life in France, where she first befriended Edgar Degas and later exhibited among the Impressionists. Cassatt often created images of the social and private lives of women, with particular emphasis on the intimate bonds between mothers and children.', 'http://en.wikipedia.org/wiki/Mary_Cassatt'),
(17, 'Claude', 'Monet', 'France', 'M', 1840, 1926, 'Claude Monet was a founder of French impressionist painting, and the most consistent and prolific practitioner of the movement\'s philosophy of expressing one\'s perceptions before nature, especially as applied to plein-air landscape painting. The term Impressionism is derived from the title of his painting Impression, Sunrise (Impression, soleil levant).', 'http://en.wikipedia.org/wiki/Claude_Monet'),
(18, 'Paul', 'Gauguin', 'France', 'M', 1848, 1903, 'Eugène Henri Paul Gauguin was a leading French Post-Impressionist artist. He was an important figure in the Symbolist movement as a painter, sculptor, print-maker, ceramist, and writer. His bold experimentation with coloring led directly to the Synthetist style of modern art while his expression of the inherent meaning of the subjects in his paintings, under the influence of the cloisonnist style, paved the way to Primitivism and the return to the pastoral. He was also an influential proponent of wood engraving and woodcuts as art forms.', 'http://en.wikipedia.org/wiki/Gauguin'),
(19, 'Vincent', 'Van Gogh', 'Netherlands', 'M', 1853, 1890, 'Vincent Willem van Gogh was a Dutch post-Impressionist painter whose work, notable for its rough beauty, emotional honesty, and bold color, had a far-reaching influence on 20th-century art. After years of painful anxiety and frequent bouts of mental illness, he died at the age of 37 from a self-inflicted gunshot wound. His work was then known to only a handful of people and appreciated by fewer still.', 'http://en.wikipedia.org/wiki/Van_Gogh'),
(20, 'Georges', 'Seurat', 'France', 'M', 1859, 1891, 'Georges-Pierre Seurat was a French Post-Impressionist painter and draftsman. He is noted for his innovative use of drawing media and for devising a technique of painting known as pointillism. His large-scale work A Sunday Afternoon on the Island of La Grande Jatte (1884–1886), Seurat\'s most famous painting, altered the direction of modern art by initiating Neo-impressionism, and is one of the icons of 19th century painting.', 'http://en.wikipedia.org/wiki/Seurat'),
(21, 'Paul', 'Cezanne', 'France', 'M', 1839, 1906, 'Paul Cézanne was a French artist and Post-Impressionist painter whose work laid the foundations of the transition from the 19th century conception of artistic endeavour to a new and radically different world of art in the 20th century. Cézanne can be said to form the bridge between late 19th century Impressionism and the early 20th century\'s new line of artistic enquiry, Cubism. The line attributed to both Matisse and Picasso that Cézanne \"is the father of us all\" cannot be easily dismissed.', 'http://en.wikipedia.org/wiki/C%C3%A9zanne'),
(24, 'Edvard', 'Munch', 'Norway', 'M', 1863, 1944, 'Edvard Munch was a Norwegian Symbolist painter, printmaker and an important forerunner of expressionist art. His best-known composition, The Scream, is part of a series The Frieze of Life, in which Munch explored the themes of love, fear, death, melancholia, and anxiety.', 'http://en.wikipedia.org/wiki/Edvard_Munch'),
(28, 'Henri', 'Toulouse-Lautrec', 'France', 'M', 1864, 1901, 'Henri Marie Raymond de Toulouse-Lautrec-Monfa or simply Henri de Toulouse-Lautrec was a French painter, printmaker, draughtsman, and illustrator, whose immersion in the colourful and theatrical life of fin de siècle Paris yielded an œuvre of exciting, elegant and provocative images of the modern and sometimes decadent life of those times. Toulouse-Lautrec is known along with Cézanne, Van Gogh, and Gauguin as one of the greatest painters of the Post-Impressionist period. In a 2005 auction at Christie\'s auction house a new record was set when \"La blanchisseuse\", an early painting of a young laundress, sold for $22.4 million U.S.', 'http://en.wikipedia.org/wiki/Toulouse-Lautrec'),
(29, 'Gustav', 'Klimt', 'Austria', 'M', 1862, 1918, 'Gustav Klimt was an Austrian Symbolist painter and one of the most prominent members of the Vienna Secession movement. His major works include paintings, murals, sketches, and other art objects. Klimt\'s primary subject was the female body, and his works are marked by a frank eroticism—nowhere is this more apparent than in his numerous drawings in pencil', 'http://en.wikipedia.org/wiki/Klimt'),
(32, 'Andre', 'Derain', 'France', 'M', 1880, 1919, 'André Derain  was a French artist, painter, sculptor and co-founder of Fauvism with Henri Matisse', 'http://en.wikipedia.org/wiki/Andr%C3%A9_Derain'),
(40, 'Vasily', 'Kandinsky', 'Russia', 'M', 1866, 1944, 'Wassily Wassilyevich Kandinsky was a Russian painter and art theorist. He is credited with painting the first purely-abstract works. Born in Moscow, Kandinsky spent his childhood in Odessa. He enrolled at the University of Moscow, studying law and economics. Successful in his profession—he was offered a professorship (chair of Roman Law) at the University of Dorpat—he began painting studies (life-drawing, sketching and anatomy) at the age of 30.', 'http://en.wikipedia.org/wiki/Kandinsky'),
(41, 'Giacomo', 'Balla', 'Italy', 'M', 1871, 1958, 'Giacomo Balla was an Italian painter.', 'http://en.wikipedia.org/wiki/Giacomo_Balla'),
(45, 'Salvidor', 'Dali', 'Spain', 'M', 1904, 1989, 'Salvador Domènec Felip Jacint Dalí i Domènech, Marquis de Púbol, commonly known as Salvador Dalí was a prominent Spanish Catalan surrealist painter born in Figueres.', 'http://en.wikipedia.org/wiki/Salvador_Dal%C3%AD'),
(49, 'Georgia', 'O\'Keefe', 'USA', 'F', 1887, 1986, 'Georgia Totto O\'Keeffe was an American artist. Born near Sun Prairie, Wisconsin, O\'Keeffe first came to the attention of the New York art community in 1916, several decades after women had gained access to art training in America’s colleges and universities, and before any of its women artists were well known or highly celebrated. Within a decade, she had distinguished herself as one of America\'s most important modern artists, a position she maintained throughout her life. As a result, O’Keeffe not only carved out a significant place for women painters in an area of the American art community that had been exclusive to and is still dominated by men, but also she had become one of America’s most celebrated cultural icons well before her death at age 98 in 1986.', 'http://en.wikipedia.org/wiki/Georgia_O%27Keefe'),
(60, 'Paul', 'Klee', 'Switzerland', 'M', 1879, 1940, 'Paul Klee was born in Münchenbuchsee, Switzerland, and is considered both a German and a Swiss painter. His highly individual style was influenced by movements in art that included expressionism, cubism, and surrealism. He was, as well, a student of orientalism. Klee was a natural draftsman who experimented with and eventually mastered color theory, and wrote extensively about it; his lectures Writings on Form and Design Theory (Schriften zur Form und Gestaltungslehre), published in English as the Paul Klee Notebooks, are considered so important for modern art that they are compared to the importance that Leonardo da Vinci\'s A Treatise on Painting had for Renaissance. He and his colleague, the Russian painter Wassily Kandinsky, both taught at the German Bauhaus school of art, design and architecture. His works reflect his dry humour and his sometimes childlike perspective, his personal moods and beliefs, and his musicality.', 'http://en.wikipedia.org/wiki/Paul_Klee'),
(63, 'Henri', 'Rousseau', 'France', 'M', 1844, 1910, 'Henri Julien Félix Rousseau was a French Post-Impressionist painter in the Naive or Primitive manner. He was also known as Le Douanier (the customs officer), a humorous description of his occupation as a tax collector. Ridiculed during his life, he came to be recognized as a self-taught genius whose works are of high artistic quality.', 'http://en.wikipedia.org/wiki/Henri_Rousseau'),
(64, 'Marc', 'Chagall', 'Russia', 'M', 1887, 1985, 'Marc Chagall was a Belorussian-French artist associated with several major artistic styles and one of the most successful artists of the 20th century. He was an early modernist, and created works in virtually every artistic medium, including painting, book illustrations, stained glass, stage sets, ceramic, tapestries and fine art prints.', 'http://en.wikipedia.org/wiki/Chagall'),
(73, 'Piet', 'Mondrian', 'Netherlands', 'M', 1872, 1944, 'Pieter Cornelis \"Piet\" Mondriaan, after 1912 Mondrian, was a Dutch painter. He was an important contributor to the De Stijl art movement and group, which was founded by Theo van Doesburg. He evolved a non-representational form which he termed Neo-Plasticism. This consisted of white ground, upon which was painted a grid of vertical and horizontal black lines and the three primary colors.', 'http://en.wikipedia.org/wiki/Piet_Mondrian'),
(85, 'Jackson', 'Pollock', 'USA', 'M', 1912, 1959, 'Paul Jackson Pollock , known as Jackson Pollock, was an influential American painter and a major figure in the abstract expressionist movement. During his lifetime, Pollock enjoyed considerable fame and notoriety. He was regarded as a mostly reclusive artist. He had a volatile personality, and struggled with alcoholism for most of his life. In 1945, he married the artist Lee Krasner, who became an important influence on his career and on his legacy.', 'http://en.wikipedia.org/wiki/Jackson_pollock'),
(92, 'Filippo', 'Lippi', 'Italy', 'M', 1406, 1469, 'Filippo Lippi, also called Lippo Lippi, was an Italian painter of the Italian Quattrocento (15th century).', 'http://en.wikipedia.org/wiki/Filippo_Lippi'),
(93, 'Piero della', 'Francesca', 'Italy', 'M', 1412, 1492, '<strong>Piero della Francesca</strong> was a painter of the Early Renaissance. As testified by Giorgio Vasari in his <em>Lives of the Artists</em>, to contemporaries he was also known as a mathematician and geometer. Nowadays Piero della Francesca is chiefly appreciated for his art. His painting was characterized by its serene humanism, its use of geometric forms and perspective. His most famous work is the cycle of frescoes \"The Legend of the True Cross\" in the church of San Francesco in the Tuscan town of Arezzo.', 'http://en.wikipedia.org/wiki/Piero_della_Francesca'),
(94, 'Andrea', 'Mantegna', 'Italy', 'M', 1431, 1506, '<strong>Andrea Mantegna</strong> was an Italian painter, a student of Roman archeology, and son in law of Jacopo Bellini. Like other artists of the time, Mantegna experimented with perspective, e.g., by lowering the horizon in order to create a sense of greater monumentality. His flinty, metallic landscapes and somewhat stony figures give evidence of a fundamentally sculptural approach to painting. He also led a workshop that was the leading producer of prints in Venice before 1500.', 'http://en.wikipedia.org/wiki/Andrea_Mantegna'),
(95, 'Sandro', 'Botticelli', 'Italy', 'M', 1445, 1510, 'Alessandro di Mariano di Vanni Filipepi, better known as <strong>Sandro Botticelli</strong> was an Italian painter of the Early Renaissance. He belonged to the Florentine school under the patronage of Lorenzo de\' Medici, a movement that Giorgio Vasari would characterize less than a hundred years later as a \"golden age\", a thought, suitably enough, he expressed at the head of his Vita of Botticelli. Botticelli\'s posthumous reputation suffered until the late 19th century; since then his work has been seen to represent the linear grace of Early Renaissance painting. Among his best known works are The Birth of Venus and Primavera.', 'http://en.wikipedia.org/wiki/Sandro_Botticelli'),
(96, 'Pietro', 'Perugino', 'Italy', 'M', 1446, 1524, '<strong>Pietro Perugino</strong>, born Pietro Vannucci, was an Italian Renaissance painter of the Umbrian school, who developed some of the qualities that found classic expression in the High Renaissance. Raphael was his most famous pupil.', 'http://en.wikipedia.org/wiki/Pietro_Perugino'),
(97, 'Leonardo', 'da Vinci', 'Italy', 'M', 1452, 1519, '<strong>Leonardo di ser Piero da Vinci</strong> was an Italian Renaissance polymath: painter, sculptor, architect, musician, mathematician, engineer, inventor, anatomist, geologist, cartographer, botanist, and writer. His genius, perhaps more than that of any other figure, epitomized the Renaissance humanist ideal. Leonardo has often been described as the archetype of the Renaissance Man, a man of \"unquenchable curiosity\" and \"feverishly inventive imagination\". He is widely considered to be one of the greatest painters of all time and perhaps the most diversely talented person ever to have lived. According to art historian Helen Gardner, the scope and depth of his interests were without precedent and \"his mind and personality seem to us superhuman, the man himself mysterious and remote\". Marco Rosci states that while there is much speculation about Leonardo, his vision of the world is essentially logical rather than mysterious, and that the empirical methods he employed were unusual for his time.', 'http://en.wikipedia.org/wiki/Leonardo_da_Vinci'),
(98, NULL, 'Michelangelo', 'Italy', 'M', 1475, 1564, '<strong>Michelangelo di Lodovico Buonarroti Simoni</strong> commonly known as Michelangelo, was an Italian sculptor, painter, architect, poet, and engineer of the High Renaissance who exerted an unparalleled influence on the development of Western art. Despite making few forays beyond the arts, his versatility in the disciplines he took up was of such a high order that he is often considered a contender for the title of the archetypal Renaissance man, along with his fellow Italian Leonardo da Vinci. Michelangelo was considered the greatest living artist in his lifetime, and ever since then he has been held to be one of the greatest artists of all time. A number of his works in painting, sculpture, and architecture rank among the most famous in existence. His output in every field during his long life was prodigious; when the sheer volume of correspondence, sketches, and reminiscences that survive is also taken into account, he is the best-documented artist of the 16th century.', 'http://en.wikipedia.org/wiki/Michelangelo'),
(99, NULL, 'Raphael', 'Italy', 'M', 1483, 1520, 'Raffaello Sanzio da Urbino, better known simply as <strong>Raphael</strong>, was an Italian painter and architect of the High Renaissance. His work is admired for its clarity of form and ease of composition and for its visual achievement of the Neoplatonic ideal of human grandeur. Together with Michelangelo and Leonardo da Vinci, he forms the traditional trinity of great masters of that period.', 'http://en.wikipedia.org/wiki/Raphael'),
(100, NULL, 'Titian', 'Italy', 'M', 1488, 1576, '<strong>Tiziano Vecelli</strong> known in English as <strong>Titian</strong> was an Italian painter, the most important member of the 16th-century Venetian school. He was born in Pieve di Cadore, near Belluno (in Veneto), in the Republic of Venice. During his lifetime he was often called da Cadore, taken from the place of his birth. During the course of his long life, Titian\'s artistic manner changed drastically[4] but he retained a lifelong interest in color. Although his mature works may not contain the vivid, luminous tints of his early pieces, their loose brushwork and subtlety of polychromatic modulations are without precedent in the history of Western art.', 'http://en.wikipedia.org/wiki/Titian'),
(101, NULL, 'Caravaggio', 'Italy', 'M', 1571, 1610, '<strong>Michelangelo Merisi da Caravaggio</strong> was an Italian artist active in Rome, Naples, Malta, and Sicily between 1593 and 1610. His paintings, which combine a realistic observation of the human state, both physical and emotional, with a dramatic use of lighting, had a formative influence on the Baroque school of painting.', 'http://en.wikipedia.org/wiki/Caravaggio'),
(102, 'Peter Paul', 'Rubens', 'Belgium', 'M', 1577, 1640, 'Sir Peter Paul Rubens was a German-born Flemish Baroque painter, and a proponent of an extravagant Baroque style that emphasised movement, colour, and sensuality. He is well known for his Counter-Reformation altarpieces, portraits, landscapes, and history paintings of mythological and allegorical subjects.', 'http://en.wikipedia.org/wiki/Peter_Paul_Rubens'),
(103, 'Anthony van', 'Dyck', 'Belgium', 'M', 1599, 1641, '<strong>Sir Anthony van Dyck</strong> was a Flemish Baroque artist who became the leading court painter in England. He is most famous for his portraits of Charles I of England and his family and court, painted with a relaxed elegance that was to be the dominant influence on English portrait-painting for the next 150 years. He also painted biblical and mythological subjects, displayed outstanding facility as a draftsman, and was an important innovator in watercolour and etching.', 'http://en.wikipedia.org/wiki/Anthony_van_Dyck'),
(104, 'Diego', 'Velázquez', 'Spain', 'M', 1599, 1660, '<strong>Diego Rodríguez de Silva y Velázquez</strong> was a Spanish painter who was the leading artist in the court of King Philip IV. He was an individualistic artist of the contemporary Baroque period, important as a portrait artist. In addition to numerous renditions of scenes of historical and cultural significance, he painted scores of portraits of the Spanish royal family, other notable European figures, and commoners.', 'http://en.wikipedia.org/wiki/Diego_Vel%C3%A1zquez'),
(105, NULL, 'Rembrandt', 'Netherlands', 'M', 1606, 1669, '<strong>Rembrandt Harmenszoon van Rijn</strong> was a Dutch painter and etcher. He is generally considered one of the greatest painters and printmakers in European art history and the most important in Dutch history. His contributions to art came in a period of great wealth and cultural achievement that historians call the Dutch Golden Age when Dutch Golden Age painting, although in many ways antithetical to the Baroque style that dominated Europe, was extremely prolific and innovative.', 'http://en.wikipedia.org/wiki/Rembrandt'),
(106, 'Jan', 'Vermeer', 'Netherlands', 'M', 1632, 1675, '<strong>Jan Vermeer</strong> was a Dutch painter who specialized in domestic interior scenes of middle-class life. Vermeer was a moderately successful provincial genre painter in his lifetime. He seems never to have been particularly wealthy, leaving his wife and children in debt at his death, perhaps because he produced relatively few paintings. Vermeer worked slowly and with great care, using bright colours and sometimes expensive pigments, with a preference for cornflower blue and yellow. He is particularly renowned for his masterly treatment and use of light in his work.', 'http://en.wikipedia.org/wiki/Johannes_Vermeer'),
(107, 'Francois', 'Boucher', 'France', 'M', 1703, 1770, 'Possibly the most popular 18th century artist, <strong>Francois Boucher</strong> was a French painter in the Rococo style. When he was 17 years old, Boucher was apprenticed for a short time to the French painter Francois Lemoyne, and then to the engraver Jean-Francois Cars. After three years of work and artistic study, Boucher won the Grand Prix de Rome, a scholarship for artistic study, allowing him to travel to Italy and further his study in art. Upon his return to France, he was accepted into the Royal Academy of Painting and Sculpture, and three years later became a faculty member.', 'http://en.wikipedia.org/wiki/Fran%C3%A7ois_Boucher'),
(108, 'Jean-Baptiste-Simeon', 'Chardin', 'France', 'M', 1699, 1779, '<strong>Jean-Baptiste-Siméon Chardin</strong> was an 18th-century French painter. He is considered a master of still life, and is also noted for his genre paintings which depict kitchen maids, children, and domestic activities. Carefully balanced composition, soft diffusion of light, and granular impasto characterize his work.', 'http://en.wikipedia.org/wiki/Jean-Baptiste-Sim%C3%A9on_Chardin'),
(109, 'Joshua', 'Reynolds', 'England', 'M', 1740, 1790, '<strong>Sir Joshua Reynolds</strong> was an influential eighteenth-century English painter, specialising in portraits and promoting the \"Grand Style\" in painting which depended on idealization of the imperfect. He was one of the founders and first president of the Royal Academy, and was knighted by George III in 1769.', 'http://en.wikipedia.org/wiki/Joshua_Reynolds'),
(110, 'Thomas', 'Gainsborough', 'England', 'M', 1737, 1788, '<strong>Thomas Gainsborough</strong> was an English portrait and landscape painter. He is credited as the originator of the 18th century British landscape school.', 'http://en.wikipedia.org/wiki/Thomas_Gainsborough'),
(111, 'Artemisia', 'Gentileschi', 'Italy', 'F', 1593, 1656, '<strong>Artemisia Gentileschi</strong> was an Italian Baroque painter, today considered one of the most accomplished painters in the generation after Caravaggio. In an era when female painters were not easily accepted by the artistic community or patrons, she was the first female painter to become a member of the Accademia di Arte del Disegno in Florence. She painted many pictures of strong and suffering women from myth and the Bible – victims, suicides, warriors – and made a speciality of the Judith story.  That she was a woman painting in the 17th century and that she was raped herself and participated in prosecuting the rapist long overshadowed her achievements as an artist. For many years she was regarded as a curiosity. Today she is regarded as one of the most progressive and expressionist painters of her generation.', 'http://en.wikipedia.org/wiki/Artemisia_Gentileschi'),
(112, 'Judith', 'Leyster', 'Netherlands', 'F', 1609, 1660, '<strong>Judith Jans Leyster (also Leijster)</strong> was a Dutch Golden Age painter. She was one of three significant women artists in Dutch Golden Age painting; the other two, Rachel Ruysch and Maria van Oosterwijk, were specialized painters of flower still-lifes, while Leyster painted genre works, a few portraits, and a single still life. The number of surviving works attributed to her varies between fewer than 20 and about 35. She largely gave up painting after her marriage, which produced five children.', 'http://en.wikipedia.org/wiki/Judith_Leyster'),
(113, 'Louise Élisabeth', 'Lebrun', 'France', 'F', 1755, 1842, '<strong>Louise Élisabeth Vigée Le Brun</strong> also known as Madame Lebrun, was a French painter, and is recognized as the most important female painter of the 18th century. Her style is generally considered Rococo and shows interest in the subject of neoclassical painting. Vigée Le Brun cannot be considered a pure Neoclassist, however, in that she creates mostly portraits in Neoclassical dress.', 'http://en.wikipedia.org/wiki/Elisabeth_Vigee-Lebrun'),
(114, NULL, 'Giotto', 'Italy', 'M', 1266, 1337, '<strong>Giotto di Bondone</strong> better known simply as Giotto, was an Italian painter and architect from Florence in the late Middle Ages. He is generally considered the first in a line of great artists who contributed to the Italian Renaissance.', 'https://en.wikipedia.org/wiki/Giotto'),
(115, 'Jan', 'van Eyck', 'Belgium', 'M', 1390, 1441, '<strong>Jan van Eyck</strong> was a Flemish painter active in Bruges and is generally considered one of the most significant Northern European painters of the 15th century. The few surviving records indicate that he was born around 1390, most likely in Maaseik. Outside of works completed with his brother Hubert van Eyck and those ascribed to Hand G —believed to be Jan— of the Turin-Milan Hours illuminated manuscript, only about 23 surviving works are confidently attributed to him, of which ten, including the Ghent altarpiece, are signed and dated.', 'http://en.wikipedia.org/wiki/Jan_van_Eyck'),
(116, 'Albrecht', 'Dürer', 'Germany', 'M', 1471, 1528, '<strong>Albrecht Dürer </strong> was a German painter, engraver, printmaker, mathematician, and theorist from Nuremberg. His high-quality woodcuts established his reputation and influence across Europe when he was still in his twenties, and he has been conventionally regarded as the greatest artist of the Northern Renaissance ever since. His vast body of work includes altarpieces and religious works, numerous portraits and self-portraits, and copper engravings. The woodcuts, such as the Apocalypse series (1498), retain a more Gothic flavour than the rest of his work. His well-known prints include the Knight, Death, and the Devil (1513), Saint Jerome in his Study (1514) and Melencolia I (1514), which has been the subject of extensive analysis and interpretation. His watercolours also mark him as one of the first European landscape artists, while his ambitious woodcuts revolutionized the potential of that medium. Dürer\'s introduction of classical motifs into Northern art, through his knowledge of Italian artists and German humanists, has secured his reputation as one of the most important figures of the Northern Renaissance. This is reinforced by his theoretical treatises, which involve principles of mathematics, perspective and ideal proportions.', 'http://en.wikipedia.org/wiki/Albrecht_D%C3%Bcrer'),
(117, 'Hieronymus', 'Bosch', 'Netherlands', 'M', 1450, 1516, '<strong>Hieronymus Bosch</strong>was an Early Netherlandish painter. His work is known for its use of fantastic imagery to illustrate moral and religious concepts and narratives.', 'http://en.wikipedia.org/wiki/Hieronymus_Bosch'),
(118, 'Pieter', 'Bruegel the Elder', 'Netherlands', 'M', 1525, 1569, '<strong>Pieter Bruegel (Brueghel) the Elder</strong> was a Flemish Renaissance painter and printmaker known for his landscapes and peasant scenes (so called genre painting). He is sometimes referred to as the \"Peasant Bruegel.\" From 1559 he dropped the \'h\' from his name and signed his paintings as Bruegel.', 'http://en.wikipedia.org/wiki/Pieter_Bruegel_the_Elder'),
(120, 'Agnolo', 'Bronzino', 'Italy', 'M', 1503, 1572, 'One of the greatest painters of the sixteenth century, Agnolo di Cosimo Tori, known as <strong>Bronzino</strong>, embodied the Mannerist style in the years of the government of Cosimo I de’ Medici.', 'http://en.wikipedia.org/wiki/Bronzino'),
(121, 'El', 'Greco', 'Greece', 'M', 1514, 1614, '<strong>El Greco</strong>, born Doménikos Theotokópoulos,  was a painter, sculptor and architect of the Spanish Renaissance. \"El Greco\" (The Greek) was a nickname,a reference to his national Greek origin. El Greco\'s dramatic and expressionistic style was met with puzzlement by his contemporaries but found appreciation in the 20th century. El Greco is regarded as a precursor of both Expressionism and Cubism.', 'http://en.wikipedia.org/wiki/El_Greco'),
(123, 'Frans', 'Hals', 'Netherlands', 'M', 1582, 1666, '<strong>Frans Hals the Elder</strong> was a Dutch Golden Age portrait painter who lived and worked in Haarlem. He is notable for his loose painterly brushwork, and he helped introduce this lively style of painting into Dutch art. Hals played an important role in the evolution of 17th-century group portraiture.', 'https://en.wikipedia.org/wiki/Frans_Hals'),
(124, 'Jan', 'Steen', 'Netherlands', 'M', 1626, 1679, 'Jan Havickszoon Steen was a Dutch genre painter of the 17th century (also known as the Dutch Golden Age). His works are known for their psychological insight, sense of humour and abundance of colour', 'https://en.wikipedia.org/wiki/Jan_Steen'),
(125, 'Jan', 'Kruseman', 'Netherlands', 'M', 1804, 1862, 'Jan Adam Kruseman (1804-1862) of Haarlem was apprenticed to his uncle Cornelis Kruseman. He later studied at Brussels and Paris. In 1834-1836, he made a series of journeys to Germany, England and Scotland. For a while, he lived in Driebergen, before returning to Haarlem in 1858. Kruseman painted historical, biblical and genre scenes, although mainly portraits. In all he received around five hundred commissions from aristocrats and wealthy commoners for portraits.', 'https://en.wikipedia.org/wiki/Jan_Adam_Kruseman'),
(126, 'Pieter de', 'Hooch', 'Netherlands', 'M', 1629, 1684, 'Pieter de Hooch was a Dutch Golden Age painter famous for his genre works of quiet domestic scenes with an open doorway. He was a contemporary of Jan Vermeer in the Delft Guild of St. Luke, with whom his work shares themes and style.', 'https://en.wikipedia.org/wiki/Pieter_de_Hooch'),
(127, 'Jacob van', 'Ruisdael', 'Netherlands', 'M', 1628, 1682, 'The Haarlem-born painter Jacob van Ruisdael (ca. 1628-1682) began to paint at an early age. His first work dates from 1646. Ruisdael probably had lessons from his father, but his uncle, the artist Salomon van Ruysdael, must also have been a great influence on the young painter. As well as being a painter, Ruisdael was also a doctor. He painted not only woodland landscapes with strong, central motifs such as ruins, watermills and oaks, but also cityscapes and seascapes. Ruisdael\'s compositions are often more imposing than reality. His \'Bentheim Castle\' and \'Windmill at Wijk bij Duurstede\' are good examples of this.', 'https://en.wikipedia.org/wiki/Jacob_van_Ruisdael'),
(128, 'Anton', 'Mauve', 'Netherlands', 'M', 1838, 1888, 'Anthonij (Anton) Rudolf Mauve was a Dutch realist painter who was a leading member of the Hague School. He signed his paintings \'A. Mauve\' or with a monogrammed \'A.M.\'. A master colorist, he was a very significant early influence on his cousin-in-law Vincent van Gogh. Most of Mauve\'s work depicts people and animals in outdoor settings. In his Morning Ride in the Rijksmuseum, for example, fashionable equestrians at the seacoast are seen riding away from the viewer. An unconventional detail, horse droppings in the foreground, attests his commitment to realism.', 'https://en.wikipedia.org/wiki/Anton_Mauve'),
(129, 'Lawrence', 'Alma-Tadema', 'Netherlands', 'M', 1836, 1912, 'Sir Lawrence Alma-Tadema (born Lourens Alma Tadema) was a Dutch painter of special British denizenship. Born in Dronrijp, the Netherlands, and trained at the Royal Academy of Antwerp, Belgium, he settled in England in 1870 and spent the rest of his life there. A classical-subject painter, he became famous for his depictions of the luxury and decadence of the Roman Empire, with languorous figures set in fabulous marbled interiors or against a backdrop of dazzling blue Mediterranean Sea and sky. Though admired during his lifetime for his draftsmanship and depictions of Classical antiquity, his work fell into disrepute after his death, and only since the 1960s has it been re-evaluated for its importance within nineteenth-century English art.', 'https://en.wikipedia.org/wiki/Lawrence_Alma-Tadema'),
(130, 'Thérèse', 'Schwartze', 'Netherlands', 'F', 1851, 1918, 'Thérèse Schwartze was born on 20 December 1851 in Amsterdam in the Netherlands. She was the daughter of the painter Johan Georg Schwartze, who grew up in Philadelphia and trained in Düsseldorf. Schwartze received her first training from her father, before studying for a year at the Rijksacademie van Beeldende Kunsten. She then travelled to Munich and studied under Gabriel Max and Franz von Lenbach. In 1879 she went to Paris to continue her studies under Jean-Jacques Henner. When she returned to Amsterdam she became a member of Arti et Amicitiae.', 'https://en.wikipedia.org/wiki/Th%C3%A9r%C3%A8se_Schwartze'),
(131, NULL, 'Canaletto', 'Italy', 'M', 1697, 1768, 'Giovanni Antonio Canal, better known as Canaletto, was an Italian painter of landscapes of Venice. He was also an important printmaker in etching. He was the son of the painter Bernardo Canal, he visited England between 1746–56 and he is famous for his urban landscapes of Venice. He is very famous for his scenes, usually associated with \"evocative views of the city\".', 'https://en.wikipedia.org/wiki/Canaletto'),
(132, 'Nicolas', 'Poussin', 'France', 'M', 1594, 1665, 'Nicolas Poussin was the leading painter of the classical French Baroque style, although he spent most of his working life in Rome. His work is characterized by clarity, logic, and order, and favors line over color. Until the 20th century he remained a major inspiration for such classically oriented artists as Jacques-Louis David, Jean-Auguste-Dominique Ingres and Paul Cézanne. He worked in Rome for a circle of leading collectors from there and elsewhere, except for a short period when Cardinal Richelieu ordered him back to France to serve as First Painter to the King. Most of his works are history paintings of religious or mythological subjects that very often have a large landscape element.', 'https://en.wikipedia.org/wiki/Nicolas_Poussin'),
(133, 'Ferdinand Georg', 'Waldmüller', 'Austria', 'M', 1793, 1865, 'Ferdinand Georg Waldmüller (1793–1865) is considered the most important Austrian artist of the 19th century. On the one hand, he produced outstanding works in the artistic disciplines prevalent at the time – portraiture, landscape, still life, and genre painting – and, on the other hand, he was always, throughout his life, in search of accomplishment, striding new paths that led the way into the future.', 'https://en.wikipedia.org/wiki/Ferdinand_Georg_Waldm%C3%Bcller'),
(134, 'Rogier van der', 'Weyden', 'Netherlands', 'M', 1399, 1464, 'Rogier van der Weyden or Roger de la Pasture was an Early Netherlandish painter. His surviving works consist mainly of religious triptychs, altarpieces and commissioned single and diptych portraits. Although his life was generally uneventful, he was highly successful and internationally famous in his lifetime. His paintings were exported – or taken – to Italy and Spain, and he received commissions from, amongst others, Philip the Good, Netherlandish nobility and foreign princes. By the latter half of the 15th century, he had eclipsed Jan van Eyck in popularity. However his fame lasted only until the 17th century, and largely due to changing taste, he was almost totally forgotten by the mid-18th century. His reputation was slowly rebuilt during the following 200 years; today he is known, with Robert Campin and van Eyck, as the third of the three great Early Flemish artists, and widely as the most influential Northern painter of the 15th century.', 'https://en.wikipedia.org/wiki/Rogier_van_der_Weyden'),
(135, 'Giovanni', 'Bellini', 'Italy', 'M', 1430, 1516, 'Giovanni Bellini was an Italian Renaissance painter, probably the best known of the Bellini family of Venetian painters. His father was Jacopo Bellini, his brother was Gentile Bellini, and his brother-in-law was Andrea Mantegna. He is considered to have revolutionized Venetian painting, moving it towards a more sensuous and colouristic style. Through the use of clear, slow-drying oil paints, Giovanni created deep, rich tints and detailed shadings. His sumptuous coloring and fluent, atmospheric landscapes had a great effect on the Venetian painting school, especially on his pupils Giorgione and Titian.', 'https://en.wikipedia.org/wiki/Giovanni_Bellini'),
(136, 'Francesco', 'Hayez', 'Italy', 'M', 1791, 1882, 'Francesco Hayez was an Italian painter, the leading artist of Romanticism in mid-19th-century Milan, renowned for his grand historical paintings, political allegories and exceptionally fine portraits.', 'https://en.wikipedia.org/wiki/Francesco_Hayez'),
(137, 'Caspar David', 'Friedrich', 'Germany', 'M', 1774, 1840, 'Caspar David Friedrich was a 19th-century German Romantic landscape painter, generally considered the most important German artist of his generation. He is best known for his mid-period allegorical landscapes which typically feature contemplative figures silhouetted against night skies, morning mists, barren trees or Gothic ruins.', 'https://en.wikipedia.org/wiki/Caspar_David_Friedrich'),
(138, 'Arnold', 'Böcklin', 'Switzerland', 'M', 1827, 1901, 'Arnold Böcklin was a Swiss symbolist painter.', 'https://en.wikipedia.org/wiki/Arnold_B%C3%B6cklin'),
(139, 'John William', 'Waterhouse', 'England', 'M', 1849, 1917, 'John William Waterhouse was an English painter known for working in the Pre-Raphaelite style. He worked several decades after the breakup of the Pre-Raphaelite Brotherhood, which had seen its heyday in the mid-nineteenth century, leading to his sobriquet \"the modern Pre-Raphaelite\". Borrowing stylistic influences not only from the earlier Pre-Raphaelites but also from his contemporaries, the Impressionists, his artworks were known for their depictions of women from both ancient Greek mythology and Arthurian legend.', 'https://en.wikipedia.org/wiki/John_William_Waterhouse'),
(140, 'William', 'Bouguereau', 'France', 'M', 1825, 1905, 'William-Adolphe Bouguereau was a French academic painter and traditionalist. In his realistic genre paintings he used mythological themes, making modern interpretations of classical subjects, with an emphasis on the female human body. During his life he enjoyed significant popularity in France and the United States, was given numerous official honors, and received top prices for his work. As the quintessential salon painter of his generation, he was reviled by the Impressionist avant-garde. By the early twentieth century, Bouguereau and his art fell out of favor with the public, due in part to changing tastes. In the 1980s, a revival of interest in figure painting led to a rediscovery of Bouguereau and his work. Throughout the course of his life, Bouguereau executed 822 known finished paintings, although the whereabouts of many are still unknown.', 'https://en.wikipedia.org/wiki/William-Adolphe_Bouguereau'),
(141, 'Agnolo', 'Gaddi', 'Italy', 'M', 1350, 1396, 'Taddeo Gaddi was himself the major pupil of the Florentine master Giotto. Agnolo was an influential and prolific artist who was the last major Florentine painter stylistically descended from Giotto.', 'https://en.wikipedia.org/wiki/Agnolo_Gaddi');

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
(4, 1, 35, 'I\'m sure many humans lived their entire lives without knowing their blood type. Hell, I\'m doing that right now.\r\n\r\njust because you don\'t know your blood type doesn\'t mean it isn\'t known (ie in your medical record).\r\n\r\nsuper rare stuff like this gets reported by doctors, not the patients.', '2019-03-31 21:53:41'),
(7, 1, 1, 'I\'m sorry to have to tell you about the sinister situation in your country but the reason why you guys have your blood type written everywhere is because of the large yet hidden population of vampires in your country. They changed the laws to make the blood types of people easily accessible because deaths due to blood type allergies were too common', '2019-03-31 21:54:02'),
(10, 1, 35, 'There was an episode of the blacklist about this.', '2019-03-31 21:54:02'),
(13, 1, 1, 'It\'s ironic though. Everything else in the medical world costs an arm and a leg but the average folks with the good blood can\'t get in on that action.', '2019-03-31 21:54:19'),
(16, 1, 35, '\"Golden blood\"? Sounds like natural selection.\r\n\r\nYou have a blood type that only 42 other members of your species have (out of billions). O- is the real \"golden blood\"- it can be given to ANYBODY. (and, yes, I realize that Rh is different than blood type)', '2019-03-31 21:54:19'),
(19, 1, 41, 'Wow I never thought that would be the rarest blood type', '2019-04-01 00:39:02'),
(20, 2, 1, 'Wow, what a great post!', '2019-04-03 05:36:09'),
(21, 33, 1, 'Wow!', '2019-04-03 05:46:25'),
(29, 2, 1, 'I just commented on my own post.', '2019-04-10 05:33:15'),
(30, 1, 41, 'I have golden blood', '2019-04-10 22:46:47'),
(31, 2, 41, 'I do not like Ptolemy II', '2019-04-10 22:47:04'),
(32, 3, 41, 'My father was a convict in Ireland though. ', '2019-04-10 22:47:49'),
(33, 5, 41, 'I wish he lived longer. ', '2019-04-10 22:48:23'),
(34, 4, 41, 'I read Graeme Throne as Game of Thrones. LOL', '2019-04-10 22:50:32'),
(35, 6, 41, 'I only remember 3 digits. ', '2019-04-10 22:51:39'),
(36, 18, 41, 'I love geese but they are viscous sometimes. ', '2019-04-10 22:51:59'),
(37, 68, 41, 'I hope horseshoe crabs do no run out. ', '2019-04-10 22:52:31'),
(38, 65, 41, 'Shout out to the veterans. ', '2019-04-10 22:52:48'),
(39, 23, 41, 'This is kind of frightening. ', '2019-04-10 22:53:08'),
(40, 26, 28, 'If only this kindness could be found in other places. ', '2019-04-10 22:55:57'),
(41, 3, 28, 'I think being a criminal gives a cop an advantage because they can think like criminals, hence be one step ahead of actual criminals. ', '2019-04-10 22:56:35'),
(42, 5, 28, 'Sad', '2019-04-10 22:58:14'),
(43, 25, 28, 'Tuberculosis is not the way to go. ', '2019-04-10 22:58:27'),
(44, 16, 28, 'NOOOOO', '2019-04-10 22:59:08'),
(45, 17, 28, 'This is surreal.', '2019-04-10 22:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` tinyint(4) NOT NULL,
  `FirstName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Region` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Postal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Privacy` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `director_id` tinyint(4) NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of directors who have directed movies in this database';

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`director_id`, `first_name`, `last_name`, `created`) VALUES
(1, 'Christopher', 'Nolan', '2018-03-20 22:25:10'),
(2, 'Taika', 'Waititi', '2018-03-20 22:25:54'),
(3, 'Joss', 'Whedon', '2018-03-20 22:27:06'),
(4, 'Martin', 'Scorsese', '2018-03-20 22:27:34'),
(5, 'Rian', 'Johnson', '2018-03-20 22:29:14'),
(6, 'Jason', 'Reitman', '2018-03-20 22:38:56'),
(7, 'James', 'Cameron', '2018-03-20 22:45:19'),
(8, 'Alejandro', 'G. Iñárritu', '2018-03-20 22:50:18'),
(9, 'Baz', 'Luhrmann', '2018-03-20 23:00:05'),
(10, 'Quentin', ' Tarantino', '2018-03-20 23:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `Galleries`
--

CREATE TABLE `Galleries` (
  `GalleryID` int(11) NOT NULL,
  `GalleryName` varchar(255) DEFAULT NULL,
  `GalleryNativeName` varchar(255) DEFAULT NULL,
  `GalleryCity` varchar(255) DEFAULT NULL,
  `GalleryAddress` varchar(255) DEFAULT NULL,
  `GalleryCountry` varchar(255) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `GalleryWebSite` varchar(255) DEFAULT NULL,
  `FlickrPlaceID` varchar(255) DEFAULT NULL,
  `YahooWoeID` varchar(255) DEFAULT NULL,
  `GooglePlaceID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Galleries`
--

INSERT INTO `Galleries` (`GalleryID`, `GalleryName`, `GalleryNativeName`, `GalleryCity`, `GalleryAddress`, `GalleryCountry`, `Latitude`, `Longitude`, `GalleryWebSite`, `FlickrPlaceID`, `YahooWoeID`, `GooglePlaceID`) VALUES
(2, 'Prado Museum', 'Museo del Prado', 'Madrid', 'Paseo del Prado, s/n, 28014', 'Spain', 40.413393, -3.691953, 'http://www.museodelprado.es/', 'XrSazRhTUrh4j1shyQ', '20219885', 'ChIJ7aLYZp0oQg0RWoitk33wlBA'),
(3, 'State Museum', 'Staatliche Museen', 'Berlin', 'Stauffenbergstraße 41, 10785', 'Germany', 52.50861, 13.36472, 'http://www.smb.museum/', 'VULyzjBXVb89VXc', '675695', 'ChIJ6c-eGLRRqEcR_S0RGNMMbWw'),
(4, 'Uffizi Museum', 'Galleria degli Uffizi', 'Florence', 'Piazzale degli Uffizi, 6, 50122', 'Italy', 43.76863888, 11.25521, 'http://www.polomuseale.firenze.it/en/musei/?m=uffizi', 'GKD_20BTUrvaoc1jyA', '20150278', 'ChIJgZDFjQBUKhMRzcTwm8i33s0'),
(5, 'National Gallery', 'National Gallery', 'London', 'Trafalgar Square', 'UK', 51.5086, -0.1283, 'http://www.nationalgallery.org.uk/', '1EPGyGtTUrrDXJmGCA', '20094364', 'ChIJeclqF84EdkgRtKAjTmWFr0I'),
(6, 'Metropolitan Museum of Art', 'Metropolitan Museum of Art', 'New York City', '1000 5th Ave', 'USA', 40.7794472, -73.963111, 'http://www.metmuseum.org', 'zzA0hmBTUb9GY797pA', '23511893', 'ChIJb8Jg9pZYwokR-qHGtvSkLzs'),
(7, 'National Gallery of Art', 'National Gallery of Art', 'Washington, DC', '6th & Constitution Ave NW', 'USA', 38.89147, -77.02001, 'http://www.nga.gov/content/ngaweb.html', 'i0jd9gJTWr3c.68Wbg', '28751392', 'ChIJSYxSO5u3t4kRm4eyKw_Y7Kg'),
(11, 'The Art Institute of Chicago', 'The Art Institute of Chicago', 'Chicago', '111 S Michigan Ave', 'USA', 41.8794444, -87.62388, 'http://www.artic.edu/', 'S7hSKqFTVr6exT4J', '2441891', 'ChIJlUbZ4qMsDogR3tCinMzzKUg'),
(13, 'Philadelphia Museum of Art', 'Philadelphia Museum of Art', 'Philadelphia', '2600 Benjamin Franklin Pkwy', 'USA', 39.966, -75.181, 'http://www.philamuseum.org/', 'xDQDYKNTVrp.RmQV', '2401619', 'ChIJ_5CoRebFxokR08ApAyF2KIs'),
(16, 'Louvre Museum', 'Musée du Louvre', 'Paris', '75001', 'France', 48.8611, 2.33638, 'http://www.louvre.fr/', '36CFHdZUV7KNOKK4LQ', '55843752', 'ChIJ8XJ_6CVu5kcRWP1XT9TkBt4'),
(17, 'Tate Britain', 'Tate Britain', 'London', 'Millbank, Westminster', 'UK', 51.490833, -0.127222, 'http://www.tate.org.uk/visit/tate-britain', 'BjVxeKdVU7z_Fw', '41676', 'ChIJvWjCxekEdkgRoCgQVJHZH_U'),
(18, 'Art History Museum', 'Kunsthistorisches Museum', 'Vienna', 'Maria-Theresien-Platz, 1010', 'Austria', 48.2037, 16.3614, 'http://www.khm.at/', 'GmGVGDJUV7vR.KE', '551756', 'ChIJ8XfPY5oHbUcRQbimbLVSYG8'),
(19, 'Musée d\'Orsay', 'Musée d\'Orsay', 'Paris', '1 Rue de la Légion d\'Honneur, 75007', 'France', 48.86, 2.327, 'http://www.musee-orsay.fr/', '.jdUillUV7Kt1uHqAg', '55843777', 'ChIJG5Qwtitu5kcR2CNEsYy9cdA'),
(20, 'Museum of Modern Art', 'Museum of Modern Art', 'New York', '11 W 53rd St', 'USA', 40.761484, -73.977664, 'http://www.moma.org/', 'byMt1GpTWrhtqOpahg', '28288823', 'ChIJKxDbe_lYwokRVf__s8CPn-o'),
(22, 'Belvedere Gallery', 'Österreichische Galerie Belvedere', 'Vienna', 'Schloss Belvedere, Prinz Eugen-Straße 27, 1030', 'Austria', 48.19138, 16.38, 'http://www.belvedere.at/', 'wVuFk_FUV7sGJng', '551795', 'ChIJpZ4LAn0HbUcRMNCmNwlXeN8'),
(24, 'Hermitage Museum', 'Hermitage Museum', 'St. Petersburg', 'Palace Square, 2', 'Russia', 59.941, 30.3129, 'http://www.hermitagemuseum.org/', 'BfjabGxYUrw0knsYVA', '90600519', 'ChIJ6eLLMgsxlkYR_F1QoCoDTgc'),
(27, 'J. Paul Getty Museum', 'J. Paul Getty Museum', 'Los Angeles', '1200 Getty Center Dr', 'USA', 34.0775, -118.475, 'http://www.getty.edu/museum/', '6A92XzRTWr3WXDwJwQ', '28751324', 'ChIJpbxvgcW8woARza8I4QhFyyY'),
(28, 'National Gallery of Norway', 'Nationalgalleriet', 'Oslo', 'Universitetsgata 13, 0164', 'Norway', 59.9162, 10.7375, 'http://www.nasjonalmuseet.no/', 'lQQM7sZZVL.Hngs', '865764', 'ChIJOdGZU3xuQUYRRpZUX1Z3YUM'),
(29, 'Van Gogh Museum', 'Van Gogh Museum', 'Amsterdam', 'Museumplein 6, 1071 DJ', 'Netherlands', 52.358417, 4.881083, 'http://www.vangoghmuseum.nl/', 'xfcEFYhWULKtjYI', '728410', 'ChIJX1rTlu8JxkcRGsV8-a4oKMI'),
(30, 'Rijksmuseum', 'Rijksmuseum', 'Amsterdam', 'Museumstraat 1, 1071 XX', 'Netherlands', 52.36, 4.885278, 'http://www.rijksmuseum.nl/', 'xfcEFYhWULKtjYI', '728410', 'ChIJ5Ra7we4JxkcRhYVAaq5zQ9U'),
(32, 'Royal Picture Gallery Mauritshuis', 'Royal Picture Gallery Mauritshuis', 'The Hague', 'Plein 29, 2511 CS Den Haag', 'Netherlands', 52.080556, 4.314444, 'http://www.mauritshuis.nl/', 'gycEsvZWUbkGyFQ', '733553', 'ChIJEa9zVSO3xUcRXKUtUE5Qgbk'),
(34, 'Musée du Petit Palais', 'Petit Palais', 'Paris', 'Avenue Winston Churchill, 75008', 'France', 48.866084, 2.314759, 'http://www.parismusees.paris.fr/', 'a5KHUTVUVL6wFRTYsQ', '56448116', 'ChIJSUOPztFv5kcRnEbSPYG-9fM'),
(35, 'Solomon R. Guggenheim Museum', 'Solomon R. Guggenheim Museum', 'New York', '1071 5th Ave', 'USA', 40.782975, -73.958992, 'http://www.guggenheim.org/new-york', '1AJK9adTWr3qYGsuLA', '28751193', 'ChIJmZ5emqJYwokRuDz79o0coAQ'),
(36, 'The Courtauld Institute of Art', 'The Courtauld Institute of Art', 'London', 'Strand', 'UK', 51.510833, -0.117222, 'http://www.courtauld.ac.uk/', 'AZPsrPxTUbyolQ', '23636', 'ChIJvZhvcMoEdkgRB5qnzGs_VNw'),
(37, 'Barnes Foundation', 'Barnes Foundation', 'Philadelphia', '2025 Benjamin Franklin Pkwy', 'USA', 39.960659, -75.172523, 'http://www.barnesfoundation.org/', 'y3CJNJRTW7m785fi2A', '29389142', 'ChIJrcsBU8vHxokR4FXP2BplJks'),
(38, 'Sistine Chapel', 'Sistine Chapel', 'Rome', '00120, Vatican City', 'Italy', 41.903056, 12.454444, 'http://mv.vatican.va/', 'xfftaFtTUb6gXRUjTg', '23424986', 'ChIJ268jxWVgLxMRIj61f4fIFqs'),
(41, 'Picture Gallery', 'Gemäldegalerie', 'Berlin', 'Gemäldegalerie, 10785', 'Germany', 52.508472, 13.365417, 'http://www.smb.museum/', 'VULyzjBXVb89VXc', '675695', 'ChIJveOIOrRRqEcRIsZHHE5dQxA'),
(42, 'Brooklyn Museum', 'Brooklyn Museum', 'New York', '200 Eastern Pkwy', 'USA', 40.671306, -73.96375, 'http://www.brooklynmuseum.org/', '9R6NtodTWr2le.Hw.A', '28751453', 'ChIJyTmcRApbwokR-oXJRqpVI8Y'),
(43, 'Old Masters Gallery', 'Gemäldegalerie Alte Meister', 'Dresden', 'Theaterplatz 1, 01067', 'Germany', 51.053611, 13.734722, 'http://www.skd.museum/', 'fr.j5iRTVLL4Bs4Wag', '26822156', 'ChIJE6ZpuWjPCUcR0dN6tE-_u6o'),
(49, 'Museum of Fine Arts', 'Museum of Fine Arts', 'Boston', '465 Huntington Ave', 'USA', 42.339167, -71.094167, 'http://www.mfa.org/', 'c1_W2UJUVL.DGU.MbQ', '56574533', 'ChIJS3rn5w1644kRZNWVxNY_Ay8'),
(50, 'National Gallery of Scotland', 'National Gallery of Scotland', 'Edinburgh', 'The Mound', 'Scotland', 55.950917, -3.195667, 'http://www.nationalgalleries.org/', 'AtPXsOpTUrrN5fImVw', '20094252', 'ChIJ68bm6kjGh0gRkyF0XlT5Rww'),
(51, 'Albright–Knox Art Gallery', 'Albright–Knox Art Gallery', 'Buffalo', '1285 Elmwood Ave', 'USA', 42.932078, -78.877072, 'http://www.albrightknox.org/', 'dLCnqMtUV7L6BRUi6g', '55806539', 'ChIJe6SdptAS04kRzppu7BanDfk'),
(52, 'Detroit Institute of Arts', 'Detroit Institute of Arts', 'Detroit', '5200 Woodward Ave', 'USA', 42.359292, -83.064797, 'http://www.dia.org/', 'aLB8_gVUVLt45Q4MaQ', '56192713', 'ChIJO6USub3SJIgRshN1AKZBH20'),
(70, 'Indianapolis Museum of Art', 'Indianapolis Museum of Art', 'Indianapolis', '4000 Michigan Rd', 'USA', 39.8259, -86.1855, 'http://www.imamuseum.org/', '42QAS0hTV7j9Fq9a', '2523727', 'ChIJJYnup7pWa4gRheOf5vIg2JE'),
(81, 'Brera Art Gallery', 'Pinacoteca di Brera', 'Milan', 'Via Brera, 28, 20121', 'Italy', 45.471944, 9.188056, 'http://www.brera.beniculturali.it/', '49Gidk1WU7JxrFY', '718345', 'ChIJH05-WBHuhkcRNjexLI56Nhs');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` tinyint(4) NOT NULL,
  `genre_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table of genre types ';

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_type`, `created`) VALUES
(1, 'Action', '2018-03-20 22:14:29'),
(2, 'Sci-Fi', '2018-03-20 22:14:36'),
(3, 'Adventure', '2018-03-20 22:14:45'),
(4, 'Comedy', '2018-03-20 22:15:03'),
(5, 'Crime', '2018-03-20 22:15:31'),
(6, 'Drama', '2018-03-20 22:15:35'),
(7, 'Biography', '2018-03-20 22:23:44'),
(8, 'Romance', '2018-03-20 22:43:48'),
(9, 'Western', '2018-03-20 23:02:03'),
(10, 'History', '2018-03-20 23:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `GenreID` int(11) NOT NULL,
  `GenreName` varchar(50) NOT NULL,
  `EraID` int(11) DEFAULT NULL,
  `Description` longtext,
  `Link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`GenreID`, `GenreName`, `EraID`, `Description`, `Link`) VALUES
(1, 'Cubism', 5, '<strong>Cubism</strong> was a 20th century avant-garde art movement, pioneered by Pablo Picasso and Georges Braque, that revolutionized European painting and sculpture, and inspired related movements in music, literature and architecture. In cubist artworks, objects are broken up, analyzed, and re-assembled in an abstracted form—instead of depicting objects from one viewpoint, the artist depicts the subject from a multitude of viewpoints to represent the subject in a greater context. Often the surfaces intersect at seemingly random angles, removing a coherent sense of depth. The background and object planes interpenetrate one another to create the shallow ambiguous space, one of cubism\'s distinct characteristics.', 'http://en.wikipedia.org/wiki/Cubism'),
(33, 'Romanticism', 4, '<strong>Romanticism</strong> was an artistic, literary and intellectual movement that originated in the second half of the 18th century in Europe, and gained strength in reaction to the Industrial Revolution. In part, it was a revolt against aristocratic social and political norms of the Age of Enlightenment and a reaction against the scientific rationalization of nature. It was embodied most strongly in the visual arts, music, and literature, but had a major impact on historiography, education[4] and natural history.', 'http://en.wikipedia.org/wiki/Romanticism'),
(34, 'Realism', 4, '<strong>Realism</strong> as a tendency in 19th century art was related to similar movements in the theatre, literature and opera. All emphasized the depiction of everyday subjects, but by no means always discarding classical, Romantic or sentimental approaches to their treatment. The movement began in the 1850s in France. One of Gustave Courbet\'s most important works is A Burial at Ornans, 1849-1850, a canvas recording an event which he witnessed in September 1848. Courbet\'s painting of the funeral of his grand uncle became the first grand statement of the Realist style.', 'http://en.wikipedia.org/wiki/Realist_painting'),
(35, 'Impressionism', 4, '<strong>Impressionism</strong> was a 19th-century art movement that originated with a group of Paris-based artists whose independent exhibitions brought them to prominence during the 1870s and 1880s. The name of the style is derived from the title of a Claude Monet work, Impression, soleil levant (Impression, Sunrise), which provoked the critic Louis Leroy to coin the term in a satiric review published in the Parisian newspaper Le Charivari.', 'http://en.wikipedia.org/wiki/Impressionism'),
(36, 'Post-Impressionism', 5, '<strong>Post-Impressionism</strong> is the term coined by the British artist and art critic Roger Fry in 1910 to describe the development of French art since Manet. Fry used the term when he organized the 1910 exhibition Manet and Post-Impressionism. Post-Impressionists extended Impressionism while rejecting its limitations: they continued using vivid colours, thick application of paint, distinctive brush strokes, and real-life subject matter, but they were more inclined to emphasize geometric forms, to distort form for expressive effect, and to use unnatural or arbitrary colour.', 'http://en.wikipedia.org/wiki/Post_Impressionism'),
(40, 'Fauvism', 5, '<strong>Fauvism</strong> is the style of les Fauves (French for \"the wild beasts\"), a short-lived and loose group of early twentieth-century Modern artists whose works emphasized painterly qualities and strong colour over the representational or realistic values retained by Impressionism. While Fauvism as a style began around 1900 and continued beyond 1910, the movement as such lasted only a few years, 1904–1908, and had three exhibitions. The leaders of the movement were Henri Matisse and André Derain.', 'http://en.wikipedia.org/wiki/Fauvism'),
(47, 'Surrealism', 5, '<strong>Surrealism</strong> is a cultural movement that began in the early 1920s, and is best known for the visual artworks and writings of the group members. Surrealist works feature the element of surprise, unexpected juxtapositions and non sequitur; however, many Surrealist artists and writers[who?] regard their work as an expression of the philosophical movement first and foremost, with the works being an artifact. Leader André Breton was explicit in his assertion that Surrealism was above all a revolutionary movement.', 'http://en.wikipedia.org/wiki/Surrealism'),
(56, 'Expressionism', 5, '<strong>Expressionism</strong> was a modernist movement, initially in poetry and painting, originating in Germany at the beginning of the 20th century. Its typical trait is to present the world solely from a subjective perspective, distorting it radically for emotional effect in order to evoke moods or ideas. Expressionist artists sought to express meaning or emotional experience rather than physical reality.', 'http://en.wikipedia.org/wiki/Expressionism'),
(64, 'Symbolism', 5, '<strong>Symbolism</strong> was a late nineteenth-century art movement of French, Russian and Belgian origin in poetry and other arts. The aesthetic was developed by Stéphane Mallarmé and Paul Verlaine during the 1860s and \'70s. In the 1880s, the aesthetic was articulated by a series of manifestos and attracted a generation of writers. The name \"symbolist\" itself was first applied by the critic Jean Moréas, who invented the term to distinguish the symbolists from the related decadents of literature and of art.', 'http://en.wikipedia.org/wiki/Symbolism_(arts)'),
(76, 'Neoclassicism', 5, '<strong>Neoclassicism</strong> is the name given to Western movements in the decorative and visual arts, literature, theatre, music, and architecture that draw inspiration from the \"classical\" art and culture of Ancient Greece or Ancient Rome. One such movement was dominant in Europe from the mid-18th to the 19th centuries.', 'http://en.wikipedia.org/wiki/Neoclassicism'),
(77, 'Northern Renaissance', 2, 'The <strong>Northern Renaissance</strong> is the Renaissance in northern Europe. Before 1597 Italian Renaissance humanism had little influence outside Italy. From the late 15th century the ideas spread around Europe. This influenced the German Renaissance, French Renaissance, English Renaissance, Renaissance in the Low Countries, Polish Renaissance and other national and localized movements, each with different characteristics and strengths.', 'http://en.wikipedia.org/wiki/Northern_Renaissance'),
(78, 'Renaissance', 2, '<strong>Renaissance</strong> art is the painting, sculpture and decorative arts of that period of European history known as the Renaissance, emerging as a distinct style in Italy in about 1400, in parallel with developments which occurred in philosophy, literature, music and science. Renaissance art, perceived as a \"rebirth\" of ancient traditions, took as its foundation the art of Classical antiquity, but transformed that tradition by the absorption of recent developments in the art of Northern Europe and by application of contemporary scientific knowledge. Renaissance art, with Renaissance Humanist philosophy, spread throughout Europe, affecting both artists and their patrons with the development of new techniques and new artistic sensibilities. Renaissance art marks the transition of Europe from the medieval period to the Early modern age.', 'http://en.wikipedia.org/wiki/Renaissance_art'),
(79, 'High Renaissance', 2, '<strong>High Renaissance</strong> is the period denoting the apogee of the visual arts in the Italian Renaissance. The High Renaissance period is traditionally taken to begin in the 1490s, with Leonardo\'s fresco of the Last Supper in Milan and the death of Lorenzo de\' Medici in Florence, and to have ended in 1527 with the sacking of Rome by the troops of Charles V. This term was first used in German (Hochrenaissance) in the early nineteenth century, and has its origins in the \"High Style\" of painting and sculpture described by Johann Joachim Winckelmann. Over the last twenty years, use of the term has been frequently criticized by academic art historians for oversimplifying artistic developments, ignoring historical context, and focusing only on a few iconic works.', 'http://en.wikipedia.org/wiki/High_Renaissance'),
(80, 'Mannerism', 3, '<strong>Mannerism</strong> is a period of European art that emerged from the later years of the Italian High Renaissance around 1520. It lasted until about 1580 in Italy, when the Baroque style began to replace it, but Northern Mannerism continued into the early 17th century.', 'http://en.wikipedia.org/wiki/Mannerism'),
(81, 'International Gothic', 1, '<strong>International Gothic</strong> is a phase of Gothic art which developed in Burgundy, Bohemia, France and northern Italy in the late 14th century and early 15th century.[1] It then spread very widely across Western Europe, hence the name for the period, which was introduced by the French art historian Louis Courajod at the end of the 19th century.', 'http://en.wikipedia.org/wiki/International_Gothic'),
(83, 'Rococo', 3, '<strong>Rococo</strong>, less commonly roccoco, also referred to as \"Late Baroque\", is an 18th-century artistic movement and style, which affected several aspects of the arts including painting, sculpture, architecture, interior design, decoration, literature, music and theatre. The Rococo developed in the early part of the 18th century in Paris, France as a reaction against the grandeur, symmetry and strict regulations of the Baroque, especially that of the Palace of Versailles. In such a way, Rococo artists opted for a more jocular, florid and graceful approach to Baroque art and architecture. Rococo art and architecture in such a way was ornate and made strong usage of creamy, pastel-like colours, asymmetrical designs, curves and gold. Unlike the more politically focused Baroque, the Rococo had more playful and often witty artistic themes. With regards to interior decoration, Rococo rooms were designed as total works of art with elegant and ornate furniture, small sculptures, ornamental mirrors, and tapestry complementing architecture, reliefs, and wall paintings. The Rococo additionally played an important role in theatre. In the book The Rococo, it is written that there was no other culture which \"has produced a wittier, more elegant, and teasing dialogue full of elusive and camouflaging language and gestures, refined feelings and subtle criticism\" than Rococo theatre, especially that of France.', 'http://en.wikipedia.org/wiki/Rococo'),
(84, 'Baroque', 3, 'The <strong>Baroque</strong> is a period of artistic style that used exaggerated motion and clear, easily interpreted detail to produce drama, tension, exuberance, and grandeur in sculpture, painting, architecture, literature, dance and music. The style began around 1600 in Rome, Italy and spread to most of Europe. The popularity and success of the Baroque style was encouraged by the Roman Catholic Church, which had decided at the time of the Council of Trent, in response to the Protestant Reformation, that the arts should communicate religious themes in direct and emotional involvement. The aristocracy also saw the dramatic style of Baroque architecture and art as a means of impressing visitors and expressing triumphant power and control. Baroque palaces are built around an entrance of courts, grand staircases and reception rooms of sequentially increasing opulence.', 'http://en.wikipedia.org/wiki/Baroque'),
(87, 'Dutch Golden Age', 3, '<strong>Dutch Golden Age</strong> painting spans the 17th century, during and after the later part of the Eighty Years\' War (1568–1648) for Dutch independence. Although Dutch painting of the Golden Age comes in the general European period of Baroque painting, and often shows many of its characteristics, most lacks the idealization and love of splendour typical of much Baroque work, including that of neighbouring Flanders. Most work, including that for which the period is best known, reflects the traditions of detailed realism inherited from Early Netherlandish painting.', 'https://en.wikipedia.org/wiki/Dutch_Golden_Age_painting'),
(88, 'Academic Art', 4, '<strong>Academic Art<strong> is a style of painting and sculpture produced under the influence of European academies of art. Specifically, academic art is the art and artists influenced by the standards of the French Académie des Beaux-Arts, which practiced under the movements of Neoclassicism and Romanticism, and the art that followed these two movements in the attempt to synthesize both of their styles, and which is best reflected by the paintings of William-Adolphe Bouguereau, Thomas Couture, and Hans Makart. In this context it is often called \"academism\", \"academicism\", \"L\'art pompier\", and \"eclecticism\", and sometimes linked with \"historicism\" and \"syncretism\". The art influenced by academies in general is also called \"academic art.\" In this context as new styles are embraced by academics, the new styles come to be considered academic, thus what was at one time a rebellion against academic art becomes academic art.', 'https://en.wikipedia.org/wiki/Academic_art');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` tinyint(4) NOT NULL,
  `movie_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `movie_year` year(4) NOT NULL,
  `movie_desc` text COLLATE utf8_unicode_ci,
  `run_time` time DEFAULT NULL,
  `m_type_id` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of movies with their info: Title, Year, Description, Run Time, Type';

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_title`, `movie_year`, `movie_desc`, `run_time`, `m_type_id`, `created`) VALUES
(1, 'Inception', 2010, 'A thief, who steals corporate secrets through the use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO', '01:48:00', 'f', '2018-03-29 22:15:00'),
(2, 'Thor: Ragnarok', 2017, 'Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.', '02:10:00', 'f', '2018-03-21 00:27:03'),
(3, 'The Wolf of Wall Street', 2013, 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', '03:00:00', 'f', '2018-03-21 00:26:59'),
(4, 'Looper', 2012, 'In 2074, when the mob wants to get rid of someone, the target is sent into the past, where a hired gun awaits - someone like Joe - who one day learns the mob wants to \'close the loop\' by sending back Joe\'s future self for assassination.', '01:53:00', 'f', '2018-03-21 00:27:02'),
(5, 'The Avengers', 2012, 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', '02:23:00', 'f', '2018-03-21 00:27:00'),
(6, 'Juno', 2007, 'Faced with an unplanned pregnancy, an offbeat young woman makes an unusual decision regarding her unborn child.', '01:36:00', 'f', '2018-03-21 00:27:01'),
(7, 'Titanic', 1997, 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', '03:14:00', 'f', '2018-03-21 00:26:55'),
(8, 'Django Unchained', 2012, 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', '02:45:00', 'f', '2018-03-21 00:27:04'),
(9, '\r\nThe Great Gatsby', 2013, 'A writer and wall street trader, Nick, finds himself drawn to the past and lifestyle of his millionaire neighbor, Jay Gatsby.', '02:23:00', 'f', '2018-03-21 00:26:58'),
(10, 'The Revenant', 2015, 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', '02:36:00', 'f', '2018-03-21 00:26:52'),
(12, 'Planet Earth II ', 2016, 'David Attenborough returns in this breathtaking documentary showcasing life on Planet Earth.', '06:00:00', 'd', '2018-03-21 23:05:39');

--
-- Triggers `movie`
--
DELIMITER $$
CREATE TRIGGER `emptyDesc` BEFORE UPDATE ON `movie` FOR EACH ROW BEGIN
IF TRIM(NEW.movie_desc) = '' THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Please re-enter a non-empty description for the movie.';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_id` tinyint(4) NOT NULL,
  `actor_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that connects actors/actresses with the movies they''ve starred in';

--
-- Dumping data for table `movie_actor`
--

INSERT INTO `movie_actor` (`movie_id`, `actor_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 4),
(3, 2),
(4, 5),
(5, 1),
(5, 4),
(6, 3),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `movie_director`
--

CREATE TABLE `movie_director` (
  `movie_id` tinyint(4) NOT NULL,
  `director_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that connects directors with the movies they''ve directed';

--
-- Dumping data for table `movie_director`
--

INSERT INTO `movie_director` (`movie_id`, `director_id`) VALUES
(1, 1),
(2, 2),
(4, 5),
(5, 3),
(5, 4),
(6, 6),
(7, 7),
(8, 10),
(9, 9),
(10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `genre_id` tinyint(4) NOT NULL,
  `movie_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that connects movies with their respective genres';

--
-- Dumping data for table `movie_genre`
--

INSERT INTO `movie_genre` (`genre_id`, `movie_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 1),
(2, 5),
(3, 1),
(3, 2),
(3, 5),
(3, 10),
(4, 2),
(4, 3),
(4, 6),
(5, 3),
(5, 4),
(6, 4),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(7, 3),
(8, 7),
(8, 9),
(9, 8),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `movie_review`
--

CREATE TABLE `movie_review` (
  `user_id` tinyint(4) NOT NULL,
  `movie_id` tinyint(4) NOT NULL,
  `r_desc` longtext COLLATE utf8_unicode_ci,
  `r_id` tinyint(4) NOT NULL,
  `rating` decimal(3,1) DEFAULT '0.0',
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table with movie reviews from users';

--
-- Dumping data for table `movie_review`
--

INSERT INTO `movie_review` (`user_id`, `movie_id`, `r_desc`, `r_id`, `rating`, `date`) VALUES
(1, 1, 'I\'ll say no more, except that Inception rewards the attention it demands.', 1, '9.0', '2018-03-21 18:38:38'),
(2, 1, 'Insanely Brilliant ! Nolan has outdone himself !!', 2, '10.0', '2018-03-21 18:56:17'),
(3, 1, 'Overrated because it makes people \"feel\" smart...', 3, '6.0', '2018-03-21 18:56:41'),
(4, 4, 'Famous scenes and symbolism re-imagined beautifully but also problematically', 5, '3.0', '2018-03-28 19:31:06'),
(3, 8, 'Brutally hilarious and quite messy, but a total blast from start to finish', 7, '8.0', '2018-03-28 19:39:23'),
(4, 8, 'Ego driven mess', 8, '1.0', '2018-03-28 19:39:47'),
(2, 8, 'Brace yourself for True Tarantino', 9, '10.0', '2018-03-28 19:40:29'),
(3, 2, 'Most enjoyable movie for me.Thanks for giving me joy marvel.I really needed it', 10, '10.0', '2018-03-28 19:41:03'),
(4, 2, 'Packed with Marvel references, gorgeous action and more genuine laughs than most comedies, Thor: Ragnarok is an absolute blast!', 11, '8.0', '2018-03-28 19:42:09'),
(4, 5, NULL, 12, '2.0', '2018-03-28 20:52:39'),
(4, 10, NULL, 13, '8.0', '2018-03-28 20:55:32');

--
-- Triggers `movie_review`
--
DELIMITER $$
CREATE TRIGGER `rating_movie_review` BEFORE INSERT ON `movie_review` FOR EACH ROW BEGIN
IF TRIM(NEW.rating) > 10 THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Please put a rating between 0-10';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `movie_screenwriter`
--

CREATE TABLE `movie_screenwriter` (
  `screenwriter_id` tinyint(4) NOT NULL,
  `movie_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that connects screenwriters with the movies they''ve written';

--
-- Dumping data for table `movie_screenwriter`
--

INSERT INTO `movie_screenwriter` (`screenwriter_id`, `movie_id`) VALUES
(1, 4),
(2, 3),
(3, 5),
(4, 5),
(5, 1),
(6, 2),
(7, 2),
(8, 6),
(9, 7),
(10, 10),
(11, 9),
(12, 9),
(13, 8);

-- --------------------------------------------------------

--
-- Table structure for table `movie_type`
--

CREATE TABLE `movie_type` (
  `m_type_id` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `m_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table that displays type of ';

--
-- Dumping data for table `movie_type`
--

INSERT INTO `movie_type` (`m_type_id`, `m_desc`) VALUES
('a', 'Animation'),
('d', 'Documentary'),
('f', 'Film'),
('s', 'Short Film'),
('t', 'TV Series');

-- --------------------------------------------------------

--
-- Table structure for table `PaintingGenres`
--

CREATE TABLE `PaintingGenres` (
  `PaintingGenreID` int(11) NOT NULL,
  `PaintingID` int(11) DEFAULT '0',
  `GenreID` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PaintingGenres`
--

INSERT INTO `PaintingGenres` (`PaintingGenreID`, `PaintingID`, `GenreID`) VALUES
(7, 5, 36),
(9, 7, 36),
(10, 8, 1),
(13, 11, 1),
(14, 12, 1),
(16, 14, 1),
(17, 15, 1),
(18, 16, 76),
(25, 23, 36),
(26, 24, 36),
(28, 25, 1),
(29, 26, 1),
(32, 29, 1),
(33, 30, 76),
(34, 31, 1),
(38, 35, 33),
(39, 36, 33),
(40, 37, 34),
(42, 39, 35),
(44, 41, 35),
(45, 42, 36),
(47, 45, 35),
(48, 46, 35),
(49, 47, 35),
(50, 48, 35),
(51, 49, 35),
(52, 50, 35),
(54, 52, 36),
(56, 54, 36),
(57, 55, 36),
(58, 56, 36),
(59, 57, 36),
(60, 58, 36),
(62, 60, 36),
(63, 61, 36),
(65, 63, 36),
(66, 64, 36),
(67, 65, 36),
(68, 66, 36),
(69, 67, 36),
(70, 68, 36),
(71, 70, 36),
(72, 71, 36),
(89, 88, 36),
(90, 89, 36),
(102, 101, 40),
(103, 102, 40),
(104, 103, 40),
(106, 105, 40),
(115, 114, 47),
(119, 118, 56),
(121, 119, 56),
(131, 124, 47),
(134, 139, 33),
(135, 140, 33),
(137, 142, 33),
(140, 145, 34),
(141, 146, 34),
(146, 152, 35),
(147, 153, 35),
(148, 154, 35),
(151, 157, 35),
(156, 162, 35),
(159, 165, 35),
(161, 167, 35),
(165, 171, 36),
(166, 172, 36),
(167, 173, 35),
(169, 178, 35),
(170, 179, 35),
(172, 181, 33),
(173, 182, 34),
(181, 190, 36),
(182, 191, 36),
(183, 192, 56),
(185, 194, 40),
(186, 195, 40),
(204, 213, 47),
(205, 214, 47),
(213, 225, 47),
(218, 230, 47),
(219, 231, 64),
(220, 232, 64),
(221, 233, 64),
(223, 235, 64),
(243, 258, 47),
(244, 259, 47),
(263, 287, 35),
(264, 288, 35),
(265, 290, 35),
(266, 291, 35),
(269, 294, 36),
(271, 296, 36),
(274, 299, 36),
(275, 300, 36),
(285, 310, 35),
(303, 333, 56),
(304, 334, 56),
(309, 339, 35),
(313, 342, 40),
(314, 343, 40),
(317, 346, 33),
(318, 347, 33),
(319, 348, 33),
(320, 349, 36),
(322, 351, 36),
(323, 352, 36),
(327, 115, 47),
(333, 51, 36),
(334, 77, 56),
(335, 78, 56),
(336, 79, 56),
(337, 80, 56),
(338, 81, 56),
(340, 83, 56),
(347, 219, 47),
(349, 301, 36),
(353, 69, 36),
(360, 366, 78),
(363, 369, 78),
(364, 370, 78),
(367, 373, 78),
(368, 374, 78),
(369, 375, 78),
(370, 376, 78),
(371, 377, 78),
(372, 378, 78),
(373, 379, 78),
(374, 380, 78),
(375, 381, 78),
(377, 383, 78),
(378, 384, 78),
(379, 384, 79),
(380, 386, 78),
(381, 386, 79),
(382, 387, 78),
(383, 387, 79),
(384, 388, 78),
(385, 388, 79),
(386, 389, 78),
(387, 389, 79),
(390, 391, 78),
(391, 391, 79),
(392, 392, 78),
(393, 392, 79),
(394, 393, 78),
(395, 393, 79),
(396, 394, 78),
(397, 394, 79),
(404, 398, 78),
(405, 398, 79),
(406, 399, 78),
(407, 399, 79),
(410, 401, 78),
(411, 401, 79),
(414, 403, 78),
(415, 403, 79),
(418, 405, 78),
(419, 405, 79),
(421, 406, 78),
(422, 406, 79),
(423, 407, 78),
(424, 407, 79),
(425, 408, 78),
(426, 408, 79),
(429, 412, 84),
(430, 413, 84),
(434, 417, 84),
(435, 418, 84),
(436, 419, 84),
(437, 420, 84),
(438, 422, 84),
(439, 423, 84),
(440, 424, 84),
(441, 425, 84),
(442, 426, 84),
(443, 427, 84),
(444, 428, 83),
(446, 430, 83),
(447, 431, 76),
(448, 432, 76),
(449, 433, 76),
(451, 435, 76),
(452, 436, 76),
(453, 430, 34),
(454, 409, 79),
(455, 409, 78),
(456, 437, 83),
(457, 438, 84),
(458, 439, 84),
(459, 439, 33),
(461, 435, 33),
(462, 436, 33),
(466, 441, 81),
(468, 442, 77),
(469, 443, 77),
(471, 445, 77),
(474, 448, 77),
(476, 450, 80),
(477, 451, 80),
(479, 453, 80),
(480, 455, 87),
(481, 455, 84),
(482, 456, 87),
(483, 456, 84),
(484, 457, 87),
(485, 457, 84),
(486, 458, 87),
(487, 458, 84),
(488, 459, 87),
(489, 459, 84),
(490, 460, 87),
(491, 460, 84),
(492, 461, 87),
(493, 461, 84),
(494, 462, 87),
(495, 462, 84),
(496, 463, 87),
(497, 463, 84),
(498, 464, 87),
(499, 464, 84),
(500, 465, 87),
(501, 465, 84),
(502, 466, 87),
(503, 466, 84),
(504, 467, 87),
(505, 467, 84),
(506, 468, 87),
(507, 468, 84),
(508, 469, 87),
(509, 469, 84),
(510, 470, 87),
(511, 470, 84),
(512, 471, 87),
(513, 471, 84),
(514, 472, 87),
(515, 472, 84),
(516, 473, 87),
(517, 473, 84),
(518, 474, 87),
(519, 474, 84),
(520, 475, 87),
(521, 475, 84),
(522, 476, 87),
(523, 476, 84),
(524, 477, 87),
(525, 477, 84),
(526, 478, 33),
(527, 478, 88),
(528, 479, 33),
(529, 479, 88),
(530, 481, 87),
(531, 481, 84),
(532, 482, 87),
(533, 482, 84),
(534, 483, 87),
(535, 483, 84),
(536, 484, 87),
(537, 484, 84),
(538, 486, 35),
(539, 486, 34),
(540, 487, 35),
(541, 487, 34),
(542, 488, 33),
(543, 488, 88),
(544, 489, 33),
(545, 489, 88),
(546, 490, 33),
(547, 490, 88),
(548, 492, 34),
(549, 493, 34),
(550, 495, 33),
(551, 495, 34),
(552, 496, 34),
(553, 497, 83),
(554, 498, 36),
(555, 499, 79),
(556, 500, 79),
(557, 501, 84),
(558, 502, 84),
(559, 504, 84),
(560, 505, 83),
(561, 505, 76),
(562, 506, 83),
(563, 506, 76),
(564, 507, 83),
(565, 507, 76),
(566, 508, 84),
(567, 509, 36),
(568, 510, 36),
(569, 511, 34),
(570, 512, 34),
(571, 513, 34),
(572, 514, 35),
(573, 515, 80),
(574, 508, 80),
(575, 516, 87),
(576, 516, 84),
(577, 517, 87),
(578, 517, 84),
(579, 518, 83),
(580, 519, 35),
(581, 520, 33),
(582, 521, 36),
(583, 522, 36),
(584, 523, 78),
(585, 524, 34),
(586, 524, 35),
(587, 525, 56),
(588, 526, 34),
(589, 526, 88),
(590, 527, 34),
(591, 527, 88),
(592, 528, 34),
(593, 528, 88),
(594, 529, 36),
(595, 530, 36),
(596, 531, 87),
(597, 532, 87),
(598, 533, 87),
(599, 531, 84),
(600, 532, 84),
(601, 533, 84),
(602, 534, 36),
(603, 535, 36),
(604, 536, 77),
(605, 537, 77),
(606, 538, 84),
(607, 539, 34),
(608, 540, 77),
(609, 541, 77),
(610, 542, 77),
(611, 543, 77),
(612, 544, 84),
(613, 545, 84),
(614, 546, 84),
(615, 547, 84),
(616, 548, 84),
(617, 549, 77),
(618, 550, 77),
(619, 551, 77),
(620, 552, 84),
(621, 553, 84),
(622, 554, 87),
(623, 554, 84),
(624, 555, 87),
(625, 555, 84),
(626, 556, 80),
(627, 557, 83),
(628, 557, 76),
(629, 558, 78),
(630, 559, 79),
(631, 560, 78),
(632, 561, 78),
(633, 562, 78),
(634, 563, 78),
(635, 564, 78),
(636, 565, 84),
(637, 566, 34),
(638, 567, 34),
(639, 566, 33),
(640, 567, 33),
(641, 568, 33),
(642, 569, 33),
(643, 570, 33),
(644, 571, 33),
(645, 571, 64),
(646, 572, 33),
(647, 572, 64),
(648, 573, 33),
(649, 573, 88),
(650, 574, 33),
(651, 574, 88),
(652, 575, 33),
(653, 575, 88),
(654, 576, 83),
(655, 577, 83),
(656, 577, 76),
(657, 578, 81),
(658, 579, 84),
(659, 580, 84),
(660, 581, 84),
(661, 582, 83),
(662, 583, 47),
(663, 584, 84),
(664, 585, 84),
(665, 585, 34),
(666, 586, 34),
(667, 587, 88),
(668, 587, 76),
(669, 588, 88),
(670, 589, 88),
(671, 590, 33),
(672, 591, 33),
(673, 592, 36),
(674, 593, 80),
(675, 594, 87),
(676, 594, 84),
(677, 595, 76),
(678, 595, 83),
(679, 596, 64),
(681, 597, 87),
(682, 597, 84),
(683, 598, 81),
(684, 599, 81),
(685, 420, 87);

-- --------------------------------------------------------

--
-- Table structure for table `Paintings`
--

CREATE TABLE `Paintings` (
  `PaintingID` int(11) NOT NULL,
  `ArtistID` int(11) DEFAULT '0',
  `GalleryID` int(11) DEFAULT NULL,
  `ImageFileName` varchar(50) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `ShapeID` int(11) DEFAULT NULL,
  `MuseumLink` varchar(255) DEFAULT NULL,
  `AccessionNumber` varchar(255) DEFAULT NULL,
  `CopyrightText` varchar(255) DEFAULT 'Public domain',
  `Description` longtext,
  `Excerpt` longtext,
  `YearOfWork` int(11) DEFAULT '0',
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Medium` varchar(255) DEFAULT 'Oil on canvas',
  `Cost` decimal(19,4) DEFAULT '700.0000',
  `MSRP` decimal(19,4) DEFAULT '900.0000',
  `GoogleLink` varchar(255) DEFAULT NULL,
  `GoogleDescription` longtext,
  `WikiLink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Paintings`
--

INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(5, 1, 20, '001050', 'Self-portrait (Yo)', 1, 'http://www.moma.org/collection/works/80026?locale=en', '587.1998', 'Estate of Pablo Picasso / Artists Rights Society', NULL, NULL, 1901, 54, 32, 'Oil on cardboard on panel', '125.0000', '135.0000', NULL, NULL, NULL),
(7, 1, 7, '001080', 'Family of Saltimbanques', 3, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.46665.html', '1963.10.190', 'Estate of Pablo Picasso/Artists Rights Society', '<em>Family of Saltimbanques</em> (La famille de saltimbanques) is a 1905 painting by Pablo Picasso. It is considered the masterpiece of Picasso\'s circus period. The painting depicts six saltimbanques, a kind of itinerant circus performer, in a desolate landscape. The composition groups them together, but they do not seem connected to each other and are not looking at each other.[', '<em>Family of Saltimbanques</em> (La famille de saltimbanques) is a 1905 painting by Pablo Picasso. It is considered the masterpiece of Picasso\'s circus period.', 1905, 213, 230, 'Oil on canvas', '440.0000', '570.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Family_of_Saltimbanques'),
(8, 1, 11, '001090', 'Portrait of Daniel-Henry Kahnweiler', 1, 'http://www.artic.edu/aic/collections/artwork/111060', NULL, 'Estate of Pablo Picasso / Artists Rights Society', 'In 1907 Picasso joined an art gallery that had recently been opened in Paris by Daniel-Henry Kahnweiler. Kahnweiler was a German art historian, art collector who became one of the premier French art dealers of the 20th century. He was among the first champions of Pablo Picasso, Georges Braque and the Cubism that they jointly developed. Kahnweiler promoted burgeoning artists such as André Derain, Kees Van Dongen, Fernand Léger, Juan Gris, Maurice de Vlaminck and several others who had come from all over the globe to live and work in Montparnasse at the time.', 'In 1907 Picasso joined an art gallery that had recently been opened in Paris by Daniel-Henry Kahnweiler. Kahnweiler was a German art historian, art collector who became one of the premier French art dealers of the 20th century.', 1910, 101, 73, 'Oil on canvas', '900.0000', '1000.0000', NULL, NULL, NULL),
(11, 1, 13, '001130', 'Self Portrait With A Palette', 1, 'http://www.philamuseum.org/collections/permanent/50947.html', '1950-1-1', 'Estate of Pablo Picasso / Artists Rights Society', 'This self-portrait casts the twenty-five-year-old painter as a hardy, athletic figure and sets the stage for the legend of Picasso as the artistic champion of the twentieth century. In preparatory drawings the artist included a brush in his right hand, but he removed it in this final version. Its absence attests to the notion that creative genius is not simply manual dexterity but the expression of an inner vision, here symbolized by the artist’s intense, staring eyes.', 'This self-portrait casts the twenty-five-year-old painter as a hardy, athletic figure and sets the stage for the legend of Picasso as the artistic champion of the twentieth century.', 1906, 92, 73, 'Oil on canvas', '500.0000', '800.0000', NULL, NULL, NULL),
(12, 1, 6, '001150', 'Portrait of Gertrude Stein', 1, 'http://www.metmuseum.org/art/collection/search/488221', '47.106', 'Estate of Pablo Picasso / Artists Rights Society', 'By 1905 Picasso became a favorite of the American art collectors Leo and Gertrude Stein. Their older brother Michael Stein and his wife Sarah also became collectors of his work. Picasso painted portraits of both Gertrude Stein and her nephew Allan Stein. Gertrude Stein became Picasso\'s principal patron, acquiring his drawings and paintings and exhibiting them in her informal Salon at her home in Paris. At one of her gatherings in 1905, he met Henri Matisse, who was to become a lifelong friend and rival. The Steins introduced him to Claribel Cone and her sister Etta who were American art collectors; they also began to acquire Picasso and Matisse\'s paintings. Eventually Leo Stein moved to Italy, and Michael and Sarah Stein became patrons of Matisse; while Gertrude Stein continued to collect Picasso.', 'By 1905 Picasso became a favorite of the American art collectors Leo and Gertrude Stein. Their older brother Michael Stein and his wife Sarah also became collectors of his work. Picasso painted portraits of both Gertrude Stein and her nephew Allan Stein.', 1907, 100, 81, 'oil on canvas', '620.0000', '800.0000', NULL, NULL, 'http://www.metmuseum.org/Collections/search-the-collections/210008443'),
(14, 1, 20, '001170', 'Two Nudes', 5, 'http://www.moma.org/collection/works/80111?locale=en', '621.1959', 'Estate of Pablo Picasso / Artists Rights Society', 'The terracotta shades and heavy monumentality of the figures in <em>Two Nudes</em> derive from Picasso\'s interest at the time in the ancient Iberian sculpture of his native Spain. Like many artists in the first decades of the twentieth century, Picasso found ancient and non-western art to be fruitful alternatives both to the prescribed forms of academic painting and the visual culture of industrial modernity. These two women are nearly mirror images, but the face of the figure on the left bears a strong resemblance to that of the figure on the far left in <em>Les Demoiselles d\'Avignon</em>. Like the woman in Demoiselles, with whom she shares her chiseled nose and dark, hollow eyes, this woman holds open what appears to be a curtain and gazes outward, as though beckoning viewers in.', 'The terracotta shades and heavy monumentality of the figures in <em>Two Nudes</em> derive from Picasso\'s interest at the time in the ancient Iberian sculpture of his native Spain. Like many artists in the first decades of the twentieth century, Picasso found ancient and non-western art to be fruitful alternatives both to the prescribed forms of academic painting and the visual culture of industrial modernity.', 1907, 151, 93, 'Oil on canvas', '800.0000', '900.0000', NULL, NULL, NULL),
(15, 1, 24, '001180', 'Three Women', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28585/?lng=en', '9658', 'Personal non-commercial use', 'This is one of the most important of Picasso\'s Cubist works. He made about seventy sketches and rough drafts for it. The artist took the traditional subject of the Three Graces and reworked it in his own style.', 'This is one of the most important of Picasso\'s Cubist works. He made about seventy sketches and rough drafts for it. The artist took the traditional subject of the Three Graces and reworked it in his own style.', 1908, 200, 178, 'Oil on canvas', '875.0000', '1000.0000', NULL, NULL, 'http://www.hermitagemuseum.org/html_En/03/hm3_3_1_8c.html'),
(16, 1, 11, '001190', 'Woman and Child on the Seashore', 3, 'http://www.artic.edu/aic/collections/artwork/109275', NULL, 'Estate of Pablo Picasso / Artists Rights Society', 'Inspired by ancient art he saw while in Rome, Picasso began painting heavy-set figures in a neoclassical mode. In 1918, having married the Russian dancer Olga Koklova, Picasso was drawn to images of mothers with children.', 'Inspired by ancient art he saw while in Rome, Picasso began painting heavy-set figures in a neoclassical mode. In 1918, having married the Russian dancer Olga Koklova, Picasso was drawn to images of mothers with children.', 1921, 143, 162, 'Oil on canvas', '750.0000', '900.0000', NULL, NULL, 'http://www.artic.edu/aic/collections/exhibitions/modernwing/artwork/109275'),
(23, 1, 7, '001020', 'The Tragedy', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.46671.html', '1963.10.196', 'Estate of Pablo Picasso/Artists Rights Society', NULL, NULL, 1903, 105, 69, 'Oil on canvas', '430.0000', '600.0000', NULL, NULL, 'http://www.nga.gov/feature/picasso/technique.shtm'),
(24, 1, 11, '001060', 'Old Guitarist', 1, 'http://www.artic.edu/aic/collections/artwork/28067', NULL, 'Estate of Pablo Picasso / Artists Rights Society', NULL, NULL, 1903, 121, 82, 'Oil on panel', '823.0000', '900.0000', NULL, NULL, NULL),
(25, 1, 11, '001100', 'The Glass', 5, 'http://www.artic.edu/aic/collections/artwork/66159', NULL, 'Estate of Pablo Picasso / Artists Rights Society', NULL, NULL, 1911, 32, 17, 'Oil on canvas', '753.0000', '975.0000', NULL, NULL, NULL),
(26, 1, 20, '001140', 'Les Demoiselles d\'Avignon', 3, 'http://www.moma.org/collection/works/79766?locale=en', '333.1939', 'Estate of Pablo Picasso / Artists Rights Society', '<em>Les Demoiselles d\'Avignon</em> (The Young Ladies of Avignon, and originally titled The Brothel of Avignon) is a large oil painting of 1907 by the Spanish artist Pablo Picasso (1881–1973). The work portrays five nude female prostitutes from a brothel on Carrer d\'Avinyó (Avinyó Street) in Barcelona. Each figure is depicted in a disconcerting confrontational manner and none are conventionally feminine. The women appear as slightly menacing and rendered with angular and disjointed body shapes. Two are shown with African mask-like faces and three more with faces in the Iberian style of Picasso\'s native Spain, giving them a savage aura. In this adaptation of Primitivism and abandonment of perspective in favor of a flat, two-dimensional picture plane, Picasso makes a radical departure from traditional European painting. The work is widely considered to be seminal in the early development of both cubism and modern art. Demoiselles was revolutionary and controversial, and led to wide anger and disagreement, even amongst his closest associates and friends.\r\nPainted in Paris during the summer of 1907, Picasso had created hundreds of sketches and studies in preparation for the final work. He long acknowledged the importance of Spanish art and Iberian sculpture as influences on the painting. The work is believed by critics to be influenced by African tribal masks and the art of Oceania, although Picasso denied the connection; many art historians remain skeptical about his denials. Several experts maintain that, at the very least, Picasso visited the Musée d\'Ethnographie du Trocadéro (known today as Musée de l\'Homme) in the spring of 1907 where he saw and was unconsciously influenced by African and Tribal art several months before completing Demoiselles. Some critics argue that the painting was a reaction to Henri Matisse\'s Le bonheur de vivre and Blue Nude.', '<em>Les Demoiselles d\'Avignon</em> (The Young Ladies of Avignon, and originally titled The Brothel of Avignon) is a large oil painting of 1907 by the Spanish artist Pablo Picasso (1881–1973). The work portrays five nude female prostitutes from a brothel on Carrer d\'Avinyó (Avinyó Street) in Barcelona.', 1907, 244, 234, 'Oil on canvas', '1170.0000', '1400.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Les_Demoiselles_d%27Avignon'),
(29, 1, 13, '001260', 'Three Musicians', 3, 'http://www.philamuseum.org/collections/permanent/53963', '1952-61-96', 'Estate of Pablo Picasso / Artists Rights Society', '<em>Three Musicians</em> is the title of two similar collage and oil paintings by Spanish artist Pablo Picasso. They were both completed in 1921 in Fontainebleau near Paris, France, and exemplify the Synthetic Cubist style. Each painting features a Harlequin, a Pierrot, and a monk, who are generally believed to represent Picasso, Guillaume Apollinaire, and Max Jacob, respectively.', '<em>Three Musicians</em> is the title of two similar collage and oil paintings by Spanish artist Pablo Picasso. They were both completed in 1921 in Fontainebleau near Paris, France, and exemplify the Synthetic Cubist style. Each painting features a Harlequin, a Pierrot, and a monk, who are generally believed to represent Picasso, Guillaume Apollinaire, and Max Jacob, respectively.', 1921, 203, 188, 'Oil on canvas', '430.0000', '500.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Three_Musicians'),
(30, 1, 7, '001270', 'Lovers', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.46667.html', '1963.10.192', 'Estate of Pablo Picasso/Artists Rights Society', NULL, NULL, 1923, 130, 97, 'Oil on linen', '480.0000', '600.0000', NULL, NULL, NULL),
(31, 1, 20, '001280', 'Girl Before a Mirror', 1, 'http://www.moma.org/collection/works/78311?locale=en', '2.1938', 'Estate of Pablo Picasso / Artists Rights Society', '<em>Girl Before a Mirror</em> shows Picasso\'s young mistress Marie-Thérèse Walter, one of his favorite subjects in the early 1930s. Her white-haloed profile, rendered in a smooth lavender pink, appears serene. But it merges with a more roughly painted, frontal view of her face—a crescent, like the moon, yet intensely yellow, like the sun, and \"made up\" with a gilding of rouge, lipstick, and green eye-shadow. Perhaps the painting suggests both Walter\'s day-self and her night-self, both her tranquillity and her vitality, but also the transition from an innocent girl to a worldly woman aware of her own sexuality.', '<em>Girl Before a Mirror</em> shows Picasso\'s young mistress Marie-Thérèse Walter, one of his favorite subjects in the early 1930s. Her white-haloed profile, rendered in a smooth lavender pink, appears serene. But it merges with a more roughly painted, frontal view of her face—a crescent, like the moon, yet intensely yellow, like the sun, and \"made up\" with a gilding of rouge, lipstick, and green eye-shadow.', 1932, 162, 130, 'Oil on canvas', '800.0000', '900.0000', NULL, NULL, 'http://www.moma.org/collection/object.php?object_id=78311'),
(35, 6, 16, '006030', 'La Grande Odalisque', 2, 'http://www.louvre.fr/en/oeuvre-notices/une-odalisque', 'R.F. 1158', '&copy; Musée du Louvre', '<em>Grande Odalisque</em>, also known as Une Odalisque or La Grande Odalisque, is an oil painting of 1814 by Jean Auguste Dominique Ingres depicting an odalisque, or concubine. Ingres\' contemporaries considered the work to signify Ingres\' break from Neoclassicism, indicating a shift toward exotic Romanticism.\r\nGrande Odalisque attracted wide criticism when it was first shown. It has been especially noted for the elongated proportions and lack of anatomical realism. The work is housed in the Louvre, Paris.\r\nThis eclectic mix of styles, combining classical form with Romantic themes, prompted harsh criticism when it was first shown in 1814. Critics viewed Ingres as a rebel against the contemporary style of form and content. When the painting was first shown in the Salon of 1819, one critic remarked that the work had \"neither bones nor muscle, neither blood, nor life, nor relief, indeed nothing that constitutes imitation\".[3] This echoed the general view that Ingres had disregarded anatomical realism.[4] Ingres instead favored long lines to convey curvature and sensuality, as well as abundant, even light to tone down the volume. Ingres continued to be criticized for his work until the mid-1820s.', '<em>Grande Odalisque</em>, also known as Une Odalisque or La Grande Odalisque, is an oil painting of 1814 by Jean Auguste Dominique Ingres depicting an odalisque, or concubine. Ingres\' contemporaries considered the work to signify Ingres\' break from Neoclassicism, indicating a shift toward exotic Romanticism.', 1814, 89, 163, 'Oil on canvas', '125.0000', '175.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/La_Grande_Odalisque'),
(36, 7, 16, '007020', 'Liberty Leading the People', 3, 'http://www.louvre.fr/en/oeuvre-notices/july-28-liberty-leading-people', 'R.F. 129', '&copy; Musée du Louvre', '<em>Liberty Leading the People</em> (French: La Liberté guidant le peuple) is a painting by Eugène Delacroix commemorating the July Revolution of 1830, which toppled Charles X of France. A woman personifying Liberty leads the people forward over the bodies of the fallen, holding the tricolore flag of the French Revolution in one hand and brandishing a bayonetted musket with the other. The painting is perhaps Delacroix\'s best-known work.\r\nDelacroix depicted Liberty, as both an allegorical goddess-figure and a robust woman of the people, an approach that contemporary critics denounced as \"ignoble\". The mound of corpses acts as a kind of pedestal from which Liberty strides, barefoot and bare-breasted, out of the canvas and into the space of the viewer. The Phrygian cap she wears had come to symbolize liberty during the first French Revolution, of 1789-94. The painting has been seen as a marker to the end of the Age of Enlightenment, as many scholars see the end of the French Revolution as the start of the romantic era.\r\nThe fighters are from a mixture of social classes, ranging from the bourgeoisie represented by the young man in a top hat, to the revolutionary urban worker, as exemplified by the boy holding pistols (who may have been the inspiration for the character Gavroche in Victor Hugo\'s Les Misérables). What they have in common is the fierceness and determination in their eyes. Aside from the flag held by Liberty, a second, minute tricolore can be discerned in the distance flying from the towers of Notre Dame.', '<em>Liberty Leading the People</em> (French: La Liberté guidant le peuple) is a painting by Eugène Delacroix commemorating the July Revolution of 1830, which toppled Charles X of France. A woman personifying Liberty leads the people forward over the bodies of the fallen, holding the tricolore flag of the French Revolution in one hand and brandishing a bayonetted musket with the other. The painting is perhaps Delacroix\'s best-known work.', 1830, 260, 325, 'Oil on canvas', '625.0000', '860.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Liberty_Leading_the_People'),
(37, 10, 19, '010020', 'Burial at Ornans', 4, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/un-enterrement-a-ornans-130.html', 'RF 325', '&copy; Home', '<em>The Burial</em>, one of Courbet\'s most important works, records the funeral of his grandfather which he attended in September 1848. People who attended the funeral were the models for the painting. Previously, models had been used as actors in historical narratives, but in <em>Burial</em> Courbet said he \"painted the very people who had been present at the interment, all the townspeople\". The result is a realistic presentation of them, and of life in Ornans.\r\nThe vast painting—it measures 10 by 22 feet (3.1 by 6.6 meters)—drew both praise and fierce denunciations from critics and the public, in part because it upset convention by depicting a prosaic ritual on a scale which previously would have been reserved for a religious or royal subject.', '<em>The Burial</em>, one of Courbet\'s most important works, records the funeral of his grandfather which he attended in September 1848. People who attended the funeral were the models for the painting.', 1849, 314, 663, 'Oil on canvas', '1145.0000', '1190.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-burial-at-ornans/jwESwQ4qvb87oQ', 'At the end of summer 1849, Courbet started work on his first monumental painting. He wanted to make it his \"statement of principle\" and made this clear by calling the work Painting of Human Figures, the History of a Burial at Ornans. He took his inspiration from group portraits of Dutch civic guards in the 17th century while the sumptuous blacks recall Spanish art. The nuances of colour in the dark greens and dull greys produces an austere tone, the thick, robust technique gives the people and the natural elements density and weight. The rigorous frieze-like composition and the gaping grave strewn with bones invite us to think about the human condition.', 'http://en.wikipedia.org/wiki/A_Burial_at_Ornans'),
(39, 12, 36, '012060', 'Bar at the Folies Bergere', 2, 'http://courtauld.ac.uk/gallery/collection/impressionism-post-impressionism/edouard-manet-a-bar-at-the-folies-bergere', NULL, '&copy; The Courtauld Gallery', '<em>A Bar at the Folies-Bergère</em> (French: Un bar aux Folies Bergère), painted and exhibited at the Paris Salon in 1882, was the last major work by French painter Édouard Manet. It depicts a scene in the Folies Bergère nightclub in Paris.\r\nThe painting is filled with contemporaneous details specific to the Folies-Bergère. The distant pair of green feet in the upper left-hand corner belong to a trapeze artist, who is performing above the restaurant\'s patrons.\r\nThe beer which is depicted, Bass Pale Ale (noted by the red triangle on the label), would have catered not to the tastes of Parisians, but to those of English tourists, suggesting a British clientele. Manet has signed his name on the label of the bottle at the bottom left, combining the centuries-old practice of self-promotion in art with something more modern, bordering on the product placement concept of the late twentieth century. One interpretation of the painting has been that far from only being a seller of the wares shown on the counter, the woman is herself one of the wares for sale; conveying undertones of prostitution. The man in the background may be a potential client.\r\nBut for all its specificity to time and place, it is worth noting that, should the background of this painting indeed be a reflection in a mirror on the wall behind the bar as suggested by some critics, the woman in the reflection would appear directly behind the image of the woman facing forward. Neither are the bottles reflected accurately or in like quantity for it to be a reflection. These details were criticized in the French press when the painting was shown. The assumption is faulty when one considers that the postures of the two women, however, are quite different and the presence of the man to whom the second woman speaks marks the depth of the subject area. Indeed many critics view the faults in the reflection to be fundamental to the painting as they show a double reality and meaning to the work. One interpretation is that the reflection is an interaction earlier in time that results in the subject\'s expression in the painting\'s present.', '<em>A Bar at the Folies-Bergère</em> (French: Un bar aux Folies Bergère), painted and exhibited at the Paris Salon in 1882, was the last major work by French painter Édouard Manet. It depicts a scene in the Folies Bergère nightclub in Paris.', 1882, 96, 130, 'Oil on canvas', '125.0000', '200.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/A_Bar_at_the_Folies-Berg%C3%A8re'),
(41, 14, 6, '014040', 'At the Piano', 1, 'http://www.metmuseum.org/art/collection/search/459112', '1975.1.201', 'Open Access for Scholarly Content', 'In late 1891 or early 1892 Renoir was invited by the French government to execute a painting for a new museum in Paris, the Musée du Luxembourg, which was to be devoted to the work of living artists. He chose as his subject two girls at the piano. Aware of the intense scrutiny to which his submission would be subjected, Renoir lavished extraordinary care on this project, developing and refining the composition in a series of five canvases. The Lehman painting and the nearly identical version formerly in the collection of Renoir\'s fellow Impressionist Gustave Caillebotte have long been regarded as the most accomplished variants of this intimate and engaging scene of bourgeois domestic life.', 'Aware of the intense scrutiny to which his submission would be subjected, Renoir lavished extraordinary care on this project, developing and refining the composition in a series of five canvases.', 1892, 116, 90, 'Oil on canvas', '790.0000', '940.0000', 'https://www.google.com/culturalinstitute/beta/asset/young-girls-at-the-piano/ZAGwT97hbG0-sg', 'In the early 1890s, friends and admirers of Renoir took exception to the fact that the French State had never made any official purchase from the painter, then almost fifty years old. In 1892, Stéphane Mallarmé, who knew and admired the artist, helped by Roger Marx, a young member of the Beaux Arts administration and open to new trends, took steps to bring Impressionist works into the national museums. This was how, following an informal commission from the administration, Young Girls at the Piano was acquired and placed in the Musée du Luxembourg.', NULL),
(42, 15, 19, '015050', 'Glass of Absinthe', 1, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/dans-un-cafe-167.html', 'RF 1984', '&copy; Home', '<em>L\'Absinthe</em> (English: The Absinthe Drinker or Glass of Absinthe) is a painting by Edgar Degas. Some original title translations are A sketch of a French Café, then Figures at Café, the title was finally changed in 1893 to L’Absinthe (the name the piece is known by today). It is now in the permanent collection of the Musée d\'Orsay in Paris.\r\nPainted in 1875-1876, it depicts two figures, a woman and man, who sit in the center and right of this painting, respectively. The man, wearing a hat, looks right, off the canvas, while the woman, dressed formally and also wearing a hat, stares vacantly downward. A glass filled with the eponymous greenish liquid sits before her. The painting is a representation of the increasing social isolation in Paris during its stage of rapid growth.', '<em>L\'Absinthe</em> (English: The Absinthe Drinker or Glass of Absinthe) is a painting by Edgar Degas. Some original title translations are A sketch of a French Café, then Figures at Café, the title was finally changed in 1893 to L’Absinthe (the name the piece is known by today).', 1877, 92, 68, 'Oil on canvas', '1225.0000', '1300.0000', 'https://www.google.com/culturalinstitute/beta/asset/in-a-caf%C3%A9/GQH1c-43xR3JtA', 'In a cafe, a fashionable meeting place, a man and a woman, although sitting side-by-side, are locked in silent isolation, their eyes empty and sad, with drooping features and a general air of desolation. The painting can be seen as a denunciation of the dangers of absinthe, a violent, harmful liquor which was later prohibited. Parallels have been drawn with Zola\'s novel L\'Assommoir written a few years later and indeed the novelist told the painter: \"I quite plainly described some of your pictures in more than one place in my pages.\" The realistic dimension is flagrant: the cafe has been identified – it is \"La Nouvelle Athènes\", in place Pigalle, a meeting place for modern artists and a hotbed of intellectual bohemians. The framing gives the impression of a snapshot taken by an onlooker at a nearby table. But this impression is deceptive because, in fact, the real life effect is carefully contrived. The picture was painted in the studio and not in the cafe.', 'http://en.wikipedia.org/wiki/L%27Absinthe'),
(45, 17, 19, '017020', 'Women in the Garden', 1, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/femmes-au-jardin-343.html', 'RF 2773', '&copy; Home', 'Monet’s technique of “en plein air” painting was hard at work on this painting. Because it necessitated that he work from the same point of view as he painted, he dug a trench for the bottom half of the painting to sit in while he painted the top, due to its large size (it measures 100 by 81 inches). His model for the women of the painting was Camille Doncieux, who would later become his wife, bearing him two sons. To finish the dresses in the most fashionable style, Monet used magazine illustrations to render the clothing.', 'Monet’s technique of “en plein air” painting was hard at work on this painting. Because it necessitated that he work from the same point of view as he painted, he dug a trench for the bottom half of the painting to sit in while he painted the top, due to its large size.', 1866, 205, 255, 'Oil on canvas', '850.0000', '1050.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Women_in_the_Garden'),
(46, 17, 11, '017030', 'Stacks of Wheat (End of Summer)', 2, 'http://www.artic.edu/aic/collections/artwork/64818', NULL, 'Rights-Managed (RM)', 'The monumental stacks that Claude Monet depicted in his series Stacks of Wheat rose fifteen to twenty feet and stood just outside the artist’s farmhouse at Giverny. Through 1890 and 1891, he worked on this series both in the field, painting simultaneously at several easels, and in the studio, refining pictorial harmonies. In May 1891, Monet hung fifteen of these canvases next to each other in one small room in the Galerie Durand-Ruel in Paris. An unprecedented critical and financial success, the exhibition marked a breakthrough in Monet’s career, as well as in the history of French art.', 'The monumental stacks that Claude Monet depicted in his series Stacks of Wheat rose fifteen to twenty feet and stood just outside the artist’s farmhouse at Giverny.', 1891, 60, 100, 'Oil on canvas', '1200.0000', '1500.0000', NULL, NULL, NULL),
(47, 17, 6, '017070', 'The Houses of Parliament (Effect of Fog)', 3, 'http://www.metmuseum.org/art/collection/search/437128', '56.135.6', 'Open Access for Scholarly Content', 'In the fall of 1899 and the early months of 1900 and of 1901, Monet executed a series of views of the Thames River in London. From his room at the Savoy Hotel, he painted Waterloo Bridge to the east, and Charing Cross Bridge to the west; beginning in February 1900, he set up his easel on a terrace at Saint Thomas\'s Hospital across the river, reserving time in the late afternoon to depict the Houses of Parliament.\r\n\r\nWhile in London, Monet produced nearly a hundred canvases, reportedly moving from one to another as the light changed. He continued to work on these paintings in his studio at Giverny. In May 1904, thirty-seven were exhibited at the Galerie Durand-Ruel in Paris, including this view of the Houses of Parliament cloaked in dense fog.', 'In the fall of 1899 and the early months of 1900 and of 1901, Monet executed a series of views of the Thames River in London. From his room at the Savoy Hotel, he painted Waterloo Bridge to the east, and Charing Cross Bridge to the west; beginning in February 1900, he set up his easel on a terrace at Saint Thomas\'s Hospital across the river, reserving time in the late afternoon to depict the Houses of Parliament.', 1903, 81, 92, 'Oil on canvas', '750.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/houses-of-parliament-in-the-fog/owEEr48qDGwjqQ', 'Monet continued to record fleeting effects of light and atmosphere long after many of his fellow Impressionists had abandoned the practice. Around 1890 he began to paint multiple versions of the same motif. Around the turn of the century Monet was working in London and painted a series of views of the Houses of Parliament as seen from a balcony of Saint Thomas’s hospital directly across the River Thames. As is typical of Monet’s late work, this composition, which has no suggestion of depth and features very free brushwork, verges on abstraction.', 'http://www.metmuseum.org/collections/search-the-collections/110001576'),
(48, 17, 6, '017060', 'Water Lilies', 4, 'http://www.metmuseum.org/art/collection/search/438008', '1998.325.2', 'Open Access for Scholarly Content', 'Monet left much of his late work unfinished and released few paintings for sale, reporting that he was not yet satisfied and was still working on them \"with passion.\" This canvas is one of four water-lily pictures that, quite exceptionally, he did complete, sign, and sell in 1919.', 'Monet left much of his late work unfinished and released few paintings for sale, reporting that he was not yet satisfied and was still working on them \"with passion.\" This canvas is one of four water-lily pictures that, quite exceptionally, he did complete, sign, and sell in 1919.', 1919, 101, 200, 'Oil on canvas', '750.0000', '900.0000', NULL, NULL, 'http://www.metmuseum.org/Collections/search-the-collections/110002464'),
(49, 17, 19, '017050', 'Rouen Cathedral, Full Sunlight', 1, 'http://www.musee-orsay.fr/en/collections/index-of-works/notice.html?no_cache=1&nnumid=001285', 'RF 2002', '&copy; Home', NULL, NULL, 1894, 107, 73, 'Oil on canvas', '1300.0000', '4125.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Rouen_Cathedral_(Monet_series)'),
(50, 17, 7, '017040', 'Woman with a Parasol - Madame Monet and Her Son', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.61379.html', '1983.1.29', 'Open Access', 'Woman with a Parasol was painted outdoors, probably in a single session of several hours\' duration. The artist intended the work to convey the feeling of a casual family outing rather than a formal portrait, and used pose and placement to suggest that his wife and son interrupted their stroll while he captured their likenesses. The brevity of the moment portrayed here is conveyed by a repertory of animated brushstrokes of vibrant color, hallmarks of the style Monet was instrumental in forming. Bright sunlight shines from behind Camille to whiten the top of her parasol and the flowing cloth at her back, while colored reflections from the wildflowers below touch her front with yellow.', 'Woman with a Parasol was painted outdoors, probably in a single session of several hours\' duration.', 1875, 100, 81, 'Oil on canvas', '500.0000', '940.0000', 'https://www.google.com/culturalinstitute/beta/asset/woman-with-a-parasol-madame-monet-and-her-son/EwHxeymQQnprMg', 'With Manet\'s assistance, Monet found lodging in suburban Argenteuil in late 1871, a move that initiated one of the most fertile phases of his career. Impressionism evolved in the late 1860s from a desire to create full–scale, multi–figure depictions of ordinary people in casual outdoor situations. At its purest, impressionism was attuned to landscape painting, a subject Monet favored. In Woman with a Parasol – Madame Monet and Her Son, his skill as a figure painter is equally evident. Contrary to the artificial conventions of academic portraiture, Monet delineated the features of his sitters as freely as their surroundings. The spontaneity and naturalness of the resulting image were praised when it appeared in the second impressionist exhibition in 1876.', NULL),
(51, 18, 50, '018020', 'Vision of the Sermon', 3, 'https://www.nationalgalleries.org/object/NG 1643', 'NG 1643', NULL, 'This painting depicts the scene from the Bible in which Jacob wrestles an angel. As if in a modern-day wrestling arena, French women watch the wrestling match from afar. This painting was created during Gaugin’s stay in Pont-Avon, France, which is where he created his other masterpieces, The Yellow Christ and The Green Christ. This painting also incorporates elements from his Christ series, which also place Breton French women alongside a Biblical scene, placing them as observers in the story. In his typical style, flat areas of color are outlined by thick black lines, and the figures are void of any shading or depth of color.', 'This painting depicts the scene from the Bible in which Jacob wrestles an angel. As if in a modern-day wrestling arena, French women watch the wrestling match from afar. This painting was created during Gaugin’s stay in Pont-Avon, France.', 1888, 74, 93, 'Oil on canvas', '230.0000', '290.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Vision_After_the_Sermon'),
(52, 18, 29, '018030', 'Self-Portrait with Portrait of Émile Bernard (Les misérables)', 2, 'https://www.vangoghmuseum.nl/en/collection/s0224V1962', 's0224V1962', 'Non commercial use', 'Gauguin painted himself in the guise of Jean Valjean, the main character of Victor Hugo’s novel Les Misérables, equating the vibrant and loving fictional outcast with the misunderstood artists of his time.', 'Gauguin painted himself in the guise of Jean Valjean, the main character of Victor Hugo’s novel Les Misérables, equating the vibrant and loving fictional outcast with the misunderstood artists of his time.', 1888, 45, 55, 'Oil on canvas', '250.0000', '300.0000', 'https://www.google.com/culturalinstitute/beta/asset/self-portrait-with-portrait-of-bernard-les-mis%C3%A9rables/FQFNzW6eTVCpwQ', 'Paul Gauguin’s face bears a troubled expression, for the artist has painted himself in the role of Jean Valjean, the protagonist in the Victor Hugo novel Les Misérables. Gauguin compared this fictional hero, a man rejected by society despite his inner power and love, with the misunderstood artists of his own time, including himself.', NULL),
(54, 18, 51, '018040', 'Yellow Christ', 3, 'https://www.albrightknox.org/collection/search/piece:360/', '360', 'Public Domain', '<em>The Yellow Christ</em>, in addition to <em>The Green Christ</em>, also painted by Gaugin, is said to be one of the key works in Cloisonnism. The Christ in the painting is a direct representation of a crucifix in Pont-Avon, France, where Gaugin visited to paint a number of times. It depicts a yellow form of Christ being crucified in 19th century northern France. French Breton women gather around the cross in prayer. The only shading in the painting is of the women bowed in prayer, the figure of Christ on the cross clearly outlined in black, and his form is flat, typical of the Gaugin’s symbolic style.', '<em>The Yellow Christ</em>, in addition to <em>The Green Christ</em>, also painted by Gaugin, is said to be one of the key works in Cloisonnism. The Christ in the painting is a direct representation of a crucifix in Pont-Avon, France, where Gaugin visited to paint a number of times.', 1889, 92, 73, 'Oil on canvas', '250.0000', '300.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Yellow_Christ'),
(55, 18, 6, '018050', 'We Greet Thee Mary', 3, 'http://www.metmuseum.org/art/collection/search/438821', '51.112.2', 'Open Access for Scholarly Content', 'Before embarking on a series of pictures inspired by Polynesian religious beliefs, Gauguin devoted this, his first major Tahitian canvas, to a Christian theme, describing it in a letter of March 1892: \"An angel with yellow wings reveals Mary and Jesus, both Tahitians, to two Tahitian women, nudes dressed in pareus, a sort of cotton cloth printed with flowers that can be draped from the waist. Very somber, mountainous background and flowering trees . . . a dark violet path and an emerald green foreground, with bananas on the left. I\'m rather happy with it.\" Gauguin based much of the composition on a photograph he owned of a bas-relief in the Javanese temple of Borobudur.', 'Before embarking on a series of pictures inspired by Polynesian religious beliefs, Gauguin devoted this, his first major Tahitian canvas, to a Christian theme.', 1891, 114, 88, 'Oil on canvas', '900.0000', '1075.0000', 'https://www.google.com/culturalinstitute/beta/asset/ia-orana-maria-hail-mary/IAEsSZ2MO1CG2A', 'Before embarking on a series of pictures inspired by Polynesian religious beliefs, Gauguin devoted this, his first major Tahitian canvas, to a Christian theme, describing it in a letter of March 1892: \"An angel with yellow wings reveals Mary and Jesus, both Tahitians, to two Tahitian women, nudes dressed in pareus, a sort of cotton cloth printed with flowers that can be draped from the waist. Very somber, mountainous background and flowering trees . . . a dark violet path and an emerald green foreground, with bananas on the left. I\'m rather happy with it.\" Gauguin based much of the composition on a photograph he owned of a bas-relief in the Javanese temple of Borobudur.', NULL),
(56, 18, 49, '018080', 'Where Do We Come From? What Are We? Where Are We Going?', 4, 'http://www.mfa.org/collections/object/where-do-we-come-from-what-are-we-where-are-we-going-32558', '36.270', 'Public domain', 'This is Paul Gaugin’s most famous painting, and he considered it his masterpiece, and the culmination of his thoughts. In Tahiti, as he was painting his masterpiece, Gaugin declared that he would commit suicide upon its completion. Although this was something he had previously attempted, this was not the case, as the artist died of syphilis in 1903. The painting was meant to be read from right to left, with the three main figures in the painting representing the three questions of the title. The figures are arranged from the beginning stages of life, from young figures with a child, to the middle aged figure in the middle, to the elder figure on the left of the painting. The idol in the background, situated behind the elder figure, represents the “Beyond.”', 'This is Paul Gaugin’s most famous painting, and he considered it his masterpiece, and the culmination of his thoughts. In Tahiti, as he was painting his masterpiece, Gaugin declared that he would commit suicide upon its completion.', 1897, 139, 375, 'Oil on canvas', '650.0000', '800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Where_Do_We_Come_From%3F_What_Are_We%3F_Where_Are_We_Going%3F'),
(57, 19, 52, '019010', 'Self Portrait', 1, 'http://www.dia.org/object-info/662cf867-c9e6-4f6b-9281-8b5ca7dd6c72.aspx', '22.13', '&copy; Detroit Institute of Arts', NULL, NULL, 1887, 35, 27, 'Oil on canvas', '420.0000', '550.0000', 'https://www.google.com/culturalinstitute/beta/asset/self-portrait/GAHTFEDf6XGHKQ', NULL, NULL),
(58, 19, 29, '019020', 'Potato Eaters', 2, 'https://www.vangoghmuseum.nl/en/collection/s0005V1962', 's0005V1962', 'Non commercial use', 'For <em>The Potato Eaters</em>, Van Gogh’s first major work, he wanted to depict peasants as they really were. He thus chose coarse and ugly models, so they would look as natural as possible in the final work. He made sketches of the work and sent them to his brother, who helped Van Gogh make adjustment in the composition. As far as two years after Van Gogh completed this painting, he considered it his finest work. This painting has also been a main target for art thieves, who have stolen it not once, but twice times. An early version of the painting was stolen in 1988, but later returned with no ransom, and again in 1991, when it was abandoned by the thieves and recovered.', 'For <em>The Potato Eaters</em>, Van Gogh’s first major work, he wanted to depict peasants as they really were. He thus chose coarse and ugly models, so they would look as natural as possible in the final work.', 1885, 82, 114, 'Oil on canvas', '1250.0000', '1350.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-potato-eaters/rQE6qmf9oVuKPA', '\"The potato eaters\' shows a peasant family partaking of their evening meal by the scanty light of an oil lamp. The painting is built up of wide, coarse brushstrokes. While paying little attention to detail, Van Gogh emphasises the light-dark effects all the more. The outer surrounding area of the painting, which is built up of darker tints, contrasts sharply with the areas lit by the oil lamp, the only light source in the work.', 'http://en.wikipedia.org/wiki/The_Potato_Eaters'),
(60, 19, 29, '019050', 'Sunflowers', 1, 'https://www.vangoghmuseum.nl/en/collection/s0031V1962', 's0031V1962', 'Non commercial use', 'Van Gogh’s paintings of sunflowers are among his most famous. He did them in Arles, in the south of France, in 1888 and 1889. Vincent painted a total of five large canvases with sunflowers in a vase, with three shades of yellow ‘and nothing else’. In this way, he demonstrated that it was possible to create an image with numerous variations of a single colour, without any loss of eloquence.', 'The sunflower paintings had a special significance for Van Gogh: they communicated ‘gratitude’, he wrote.', 1889, 73, 95, 'Oil on canvas', '1300.0000', '1500.0000', 'http://www.googleartproject.com/museums/vangogh/sunflowers-24', 'Van Gogh produced in total five versions of bouquets of sunflowers in vases, all subtly different from each other. His Sunflowers are among his most famous paintings. He made these floral still lifes to decorate the so-called Yellow House in Arles, where initially he had his studio but would later live.', 'http://en.wikipedia.org/wiki/Sunflowers_(painting)'),
(61, 19, 29, '019040', 'Décoration for the Yellow House', 2, 'https://www.vangoghmuseum.nl/en/collection/s0032V1962', 's0032V1962', 'Non commercial use', 'The Décoration for the Yellow House was the main project Vincent van Gogh focused on in Arles, from August 1888 until his breakdown the day before Christmas. This Décoration had no pre-defined form or size; the central idea of the Décoration grew step by step, with the progress of his work. Starting with the Sunflowers, portraits were included in the next step. Finally, mid-September 1888, the idea took shape: from this time on he concentrated on size 30 canvases (Toiles de 30), which were all meant to form part of this Décoration', '<em>Sunflowers</em> (original title, in French: Tournesols) are the subject of two series of still life paintings by the Dutch painter Vincent van Gogh. The earlier series executed in Paris in 1887 gives the flowers lying on the ground, while the second set executed a year later in Arles shows bouquets of sunflowers in a vase.', 1888, 72, 92, 'Oil on canvas', '1290.0000', '1540.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_D%C3%A9coration_for_the_Yellow_House'),
(63, 19, 20, '019070', 'Starry Night', 3, 'http://www.moma.org/collection/works/79802?locale=en', '472.1941', '&copy; Art Resource', 'In the later part of his life, Van Gogh committed himself to an asylum in Saint Remy de Provence. <em>The Starry Night</em> was the view from the window in Van Gogh’s sanitarium bedroom. Although it is a night scene, it was painted during the day. The painting is often referred to as Van Gogh’s magnus opus. As he often sent his works to his brother Theo for his approval, he mailed this one to him in late 1889. He also wrote that he was not so happy about the work, which did not seem complete, as he had originally intended it to simply be a study of the night sky.', 'In the later part of his life, Van Gogh committed himself to an asylum in Saint Remy de Provence. <em>The Starry Night</em> was the view from the window in Van Gogh’s sanitarium bedroom. Although it is a night scene, it was painted during the day.', 1889, 74, 92, 'Oil on canvas', '1340.0000', '1410.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-starry-night/bgEuwDxel93-Pg', 'Van Gogh\'s night sky is a field of roiling energy. Below the exploding stars, the village is a place of quiet order. Connecting earth and sky is the flamelike cypress, a tree traditionally associated with graveyards and mourning. But death was not ominous for van Gogh. \"Looking at the stars always makes me dream,\" he said, \"Why, I ask myself, shouldn\'t the shining dots of the sky be as accessible as the black dots on the map of France? Just as we take the train to get to Tarascon or Rouen, we take death to reach a star.\"', 'http://en.wikipedia.org/wiki/The_Starry_Night'),
(64, 19, 36, '019060', 'Self Portrait With Bandaged Ear', 1, 'http://courtauld.ac.uk/gallery/collection/impressionism-post-impressionism/vincent-van-gogh-self-portrait-with-bandaged-ear', NULL, '&copy; The Courtauld Gallery', 'This self-portrait was painted shortly after Van Gogh returned home from hospital having mutilated his own ear.', 'This self-portrait was painted shortly after Van Gogh returned home from hospital having mutilated his own ear.', 1889, 60, 50, 'Oil on canvas', '250.0000', '300.0000', NULL, NULL, NULL),
(65, 19, 29, '019080', 'Wheatfield with Crows', 4, 'https://www.vangoghmuseum.nl/en/collection/s0149V1962', 's0149V1962', 'Non commercial use', '<em>Wheatfield with Crows</em> is a July 1890 painting by Vincent van Gogh. It is commonly but mistakenly stated that this was Van Gogh\'s last painting. Art historians are uncertain as to which painting was Van Gogh\'s last, as no clear historical records exist, but the evidence of his letters suggests that Wheatfield with Crows was completed around 10 July and predates such paintings as Auvers Town Hall on 14 July 1890 and Daubigny\'s Garden.', '<em>Wheatfield with Crows</em> is a July 1890 painting by Vincent van Gogh. It is commonly but mistakenly stated that this was Van Gogh\'s last painting.', 1890, 50, 103, 'Oil on canvas', '300.0000', '350.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Wheatfield_with_Crows');
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(66, 20, 11, '020040', 'A Sunday Afternoon on the Island of La Grande Jatt', 2, 'http://www.artic.edu/aic/collections/artwork/27992', NULL, 'Rights-Managed (RM)', 'Seurat spent over two years painting <em>A Sunday Afternoon</em>, focusing meticulously on the landscape of the park. He reworked the original as well as completed numerous preliminary drawings and oil sketches. He would go and sit in the park and make numerous sketches of the various figures in order to perfect their form. He concentrated on the issues of colour, light, and form. \r\nMotivated by study in optical and colour theory, Seurat contrasted miniature dots of colors that, through optical unification, form a single hue in the viewer\'s eye. He believed that this form of painting, now known as pointillism, would make the colors more brilliant and powerful than standard brush strokes. To make the experience of the painting even more vivid, he surrounded it with a frame of painted dots, which in turn he enclosed with a pure white, wooden frame, which is how the painting is exhibited today at the Art Institute of Chicago.\r\nIn creating the picture, Seurat employed the then-new pigment zinc yellow (zinc chromate), most visibly for yellow highlights on the lawn in the painting, but also in mixtures with orange and blue pigments. In the century and more since the painting\'s completion, the zinc yellow has darkened to brown—a colour degeneration that was already showing in the painting in Seurat\'s lifetime.', 'Seurat spent over two years painting <em>A Sunday Afternoon</em>, focusing meticulously on the landscape of the park. He reworked the original as well as completed numerous preliminary drawings and oil sketches. He would go and sit in the park and make numerous sketches of the various figures in order to perfect their form.', 1884, 208, 308, 'Oil on canvas', '425.0000', '550.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-sunday-on-la-grande-jatte-1884/twGyqq52R-lYpA', 'In his best-known and largest painting, Georges Seurat depicted people relaxing in a suburban park on an island in the Seine River called La Grande Jatte. The artist worked on the painting in several campaigns, beginning in 1884 with a layer of small horizontal brushstrokes of complementary colors. He later added small dots, also in complementary colors, that appear as solid and luminous forms when seen from a distance.Seurat\'s use of this highly systematic and \"scientific\" technique, subsequently called Pointillism, distinguished his art from the more intuitive approach to painting used by the Impressionists. Although Seurat embraced the subject matter of modern life preferred by artists such as Claude Monet and Pierre-Auguste Renoir, he went beyond their concern for capturing the accidental and instantaneous qualities of light in nature. Seurat sought to evoke permanence by recalling the art of the past, especially Egyptian and Greek sculpture and even Italian Renaissance frescoes. As he explained to the French poet Gustave Kahn, \"The Panathenaeans of Phidias formed a procession. I want to make modern people, in their essential traits, move about as they do on those friezes, and place them on canvases organized by harmonies of color.\" Some contemporary critics, however, found his figures to be less a nod to earlier art history than a commentary on the posturing and artificiality of modern Parisian society.Seurat made the final changes to La Grande Jatte in 1889. He restretched the canvas in order to add a painted border of red, orange, and blue dots that provides a visual transition between the interior of the painting and his specially designed white frame.', 'http://en.wikipedia.org/wiki/Sunday_Afternoon_on_the_Island_of_La_Grande_Jatte'),
(67, 20, 19, '020070', 'Circus', 1, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/cirque-7090.html', 'RF 2511', '&copy; Home', NULL, NULL, 1891, 185, 152, 'Oil on canvas', '450.0000', '500.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-circus/agFX4peHSDwt_g', 'The circus theme was often covered in the 1880\'s, especially by Renoir, Degas and Toulouse-Lautrec. However, The Circus, far from a merely anecdotal rendering of a modern form of entertainment, constitutes one of the most impressive applications of Divisionist theory.', NULL),
(68, 21, 37, '021010', 'Mont Sainte-Victoire seen from Bellevue', 2, 'http://www.barnesfoundation.org/collections/art-collection/object/4672/mont-sainte-victoire-la-montagne-sainte-victoire', 'BF13', '&copy; The Barnes Foundation', '<em>Mont Sainte-Victoire seen from Bellevue</em> is a landscape painting dating from around 1885, by the French artist Paul Cézanne. The subject of the painting is the Montagne Sainte-Victoire in Provence in southern France. Cézanne spent a lot of time in Aix-en-Provence at the time, and developed a special relationship with the landscape. This particular mountain, that stood out in the surrounding landscape, he could see from his house, and he painted it in on numerous occasions.\r\nThe painting shows clearly Cézanne\'s project of rendering order and clarity to natural scenes, without giving up the optical realism of Impressionism. Both the light and the colours of the painting give the impression of a pattern that is not imposed on nature, but is there naturally.', '<em>Mont Sainte-Victoire seen from Bellevue</em> is a landscape painting dating from around 1885, by the French artist Paul Cézanne. The subject of the painting is the Montagne Sainte-Victoire in Provence in southern France. Cézanne spent a lot of time in Aix-en-Provence at the time, and developed a special relationship with the landscape.', 1885, 73, 92, 'Oil on canvas', '850.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Mont_Sainte-Victoire_seen_from_Bellevue'),
(69, 21, 13, '021020', 'Portrait of Madame Cézanne with Loosened Hair', 1, 'http://www.philamuseum.org/collections/permanent/82555.html', '1986-26-1', 'Public Domain', '<em>Portrait of Madame Cézanne with Loosened Hair</em> (or Madame Cézanne with Unbound Hair) is an oil-on-canvas painting by French artist Paul Cézanne, variously dated from the mid 1870s to the early 1890s. Although the model, his wife Hortense Fiquet, was not supportive and did not understand or take an interest her husband\'s work, this is one of forty-four portraits in which she sat for him from 1869, a period during which she progressed from mistress, to wife, to ex-wife. Something of a socialite, Cézanne latterly found Fiquet often fickle and shallow, and once remarked, \"My wife only cares for Switzerland and lemonade\". The sensitivity and depth ascribed to her in this work, is likely drawn from his own personality, projected onto her image.', '<em>Portrait of Madame Cézanne with Loosened Hair</em> (or Madame Cézanne with Unbound Hair) is an oil-on-canvas painting by French artist Paul Cézanne, variously dated from the mid 1870s to the early 1890s. Although the model, his wife Hortense Fiquet, was not supportive and did not understand or take an interest her husband\'s work, this is one of forty-four portraits in which she sat for him from 1869.', 1869, 62, 51, 'Oil on canvas', '750.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Portrait_of_Madame_C%C3%A9zanne_with_Loosened_Hair'),
(70, 21, 6, '021070', 'Card Players', 3, 'http://www.metmuseum.org/art/collection/search/435868', '61.101.1', 'Open Access for Scholarly Content', '<em>The Card Players</em> is a series of oil paintings from the French Post-Impressionist artist Paul Cézanne. Painted during Cézanne\'s final period in the early 1890s, there are five paintings in the series. The versions vary in size and in the number of players depicted. The series is considered by critics to be a cornerstone of Cézanne\'s work during the early-to-mid 1890s period, as well as a \"prelude\" to his final years, when he painted some of his most acclaimed work.\r\nEach painting depicts Provençal peasants immersed in smoking their pipes and playing cards. The subjects, all male, are displayed as studious within their card playing, eyes cast downward, intent on the game at hand. Cézanne adapted a motif from 17th century Dutch and French genre painting which often depicted card games with rowdy, drunken gamblers in taverns, replacing them instead with stone-faced tradesmen in a more simplified setting. Whereas previous paintings of the genre had illustrated heightened moments of drama, Cézanne\'s portraits have been noted for their lack of drama, narrative, and conventional characterization. Other than an unused wine bottle in the two-player versions, there is an absence of drink and money, which were prominent fixtures of the 17th century genre. A painting by one of the Le Nain brothers depicting card players at a museum in Aix-en-Provence, near the artist\'s residence, is widely believed to have been an inspiration for Cézanne.', '<em>The Card Players</em> is a series of oil paintings from the French Post-Impressionist artist Paul Cézanne. The series is considered by critics to be a cornerstone of Cézanne\'s work during the early-to-mid 1890s period, as well as a \"prelude\" to his final years, when he painted some of his most acclaimed work.', 1890, 134, 182, 'Oil on canvas', '200.0000', '275.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Card_Players'),
(71, 21, 20, '021060', 'Still Life With Apples', 2, 'http://www.moma.org/collection/works/78486?locale=en', '22.1934', '&copy; Art Resource', 'Throughout his life, the French painter Paul Cézanne returned again and again to the still life. Encompassing small—scale domestic scenes rather than grand public ones, still life was considered the lowliest of genres by the French Royal Academy, the official arbiter of great art in the nineteenth century. Yet in <em>Still Life with Apples</em>, Cézanne proved that this modest genre could be a vehicle for thinking through the Impressionist project of faithfully representing the appearance of light and space. \"Painting from nature is not copying the object,\" he wrote, \"it is realizing one\'s sensations.\"', 'Throughout his life, the French painter Paul Cézanne returned again and again to the still life. In <em>Still Life with Apples</em>, Cézanne proved that this modest genre could be a vehicle for thinking through the Impressionist project of faithfully representing the appearance of light and space.', 1890, 69, 93, 'Oil on canvas', '1225.0000', '1300.0000', 'http://www.googleartproject.com/museums/moma/still-life-with-apples-20', NULL, 'http://www.moma.org/collection/browse_results.php?object_id=78486'),
(77, 24, 28, '024010', 'Sick Child', 3, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/The+Sick+Child%2C+1885%E2%88%9286.b7C_wljS4f.ips', 'NG.M.00839', '&copy; National Museum of Norway', 'Munch had a troubled familial past. In addition to his overbearing pietist father, his mother died of tuberculosis when he was a small child, and his sister died nine years later of the same disease. This painting is an image of Munch’s older and favorite sister Sophie lying in bed, dying of tuberculosis when she was 15 years old. Munch created many reproductions of this painting, including one that was held in Dresden, Germany. In the 1930’s and 40’s Nazi’s deemed Munch’s art as “degenerate art” and removed all of them from Germany to be sold at auction. This piece was bought and later donated to the Tate Gallery in London, where it remains today.', 'This painting is an image of Munch’s older and favorite sister Sophie lying in bed, dying of tuberculosis when she was 15 years old. Munch created many reproductions of this painting, including one that was held in Dresden, Germany.', 1885, 120, 118, 'Oil on canvas', '375.0000', '400.0000', NULL, NULL, NULL),
(78, 24, 28, '024020', 'Death in the sickroom', 3, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/Death+in+the+Sick-Room%2C+prob.+1893.b7C_wljU3c.ips', 'NG.M.00940', '&copy; National Museum of Norway', 'The picture shows what we can assume to be the artist’s family grouped around his sister Sophie, who died in 1877. She is sitting in a chair with her back to us. To the right stands an aunt, Karen Bjølstad, who moved in with the family to take care of the children and the household after the mother died of tuberculosis in 1868. In the background stands the father, the doctor Christian Munch, with his hands clasped as if in prayer. Near the centre of the picture is a male figure, probably Edvard, in quarter-face. Sister Laura is sitting in the foreground with her hands in her lap, while the third sister, Inger, stands staring straight at us. The male figure to the left is generally identified as Edvard’s younger brother Andreas. In Death in the SickRoom there is no physical contact between the people, except for the hand that aunt Karen has laid on the back of the chair in which the invalid sits.', 'The picture shows what we can assume to be the artist’s family grouped around his sister Sophie, who died in 1877. She is sitting in a chair with her back to us.', 1892, 134, 160, 'Tempura and Crayon on canvas', '250.0000', '275.0000', NULL, NULL, NULL),
(79, 24, 28, '024030', 'Cry (The Scream)', 1, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/The+Scream%2C+1893.b7C_wljU1a.ips', 'NG.M.00939', '&copy; National Museum of Norway', '<em>Scream</em> is the title of expressionist paintings and prints in a series by Norwegian artist Edvard Munch, showing an agonized figure against a blood red sky. The landscape in the background is the Oslofjord, viewed from the hill of Ekeberg, in Oslo (then Kristiania), Norway.\r\nEdvard Munch created several versions of Scream in various media. The Munch Museum holds one of two painted versions (1910, see gallery) and one pastel. The National Gallery of Norway holds the other painted version (1893, shown to right). A fourth version, in pastel, is owned by Norwegian businessman Petter Olsen. Munch also created a lithograph of the image in 1895.', '<em>Scream</em> is the title of expressionist paintings and prints in a series by Norwegian artist Edvard Munch, showing an agonized figure against a blood red sky. The landscape in the background is the Oslofjord, viewed from the hill of Ekeberg, in Oslo (then Kristiania), Norway.', 1893, 91, 74, 'Oil, tempera and pastel on cardboard', '175.0000', '225.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-scream/eQFdRTFKDtVQ1A', 'The Scream is undoubtedly Munch’s most famous motif. It belongs to a series of motifs that Munch developed in Berlin and Åsgårdsstrand in the 1890’s. Munch later gave the series the title Frieze of Life, and described this pictorial cycle as a poem of love, life and death.', 'http://en.wikipedia.org/wiki/The_Scream'),
(80, 24, 28, '024040', 'Puberty', 1, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/Puberty%2C+1894%E2%80%9395.b7C_wljWWK.ips', 'NG.M.00807', '&copy; National Museum of Norway', '<em>Puberty</em> is a painting created by Edvard Munch. Munch is an artist native to Norway and is widely known for his role in expressionistic art. Puberty has also been done as a lithograph and an etching by Munch.\r\nUpon observation of Puberty one of the strongest points in the piece to most is first the adolescent female who is placed mid-center of the painting. The second almost \'haunting\' point in this painting is the shadow the female is meant to be casting. It has been speculated, because of the current sexual mind Munch was in during the time in which he painted this, that the shadow may be a hovering male genital. The thought of male genitalia to a young woman during this time of her own rapidly changing body creates a stench of tension within the piece. Another thought on the shadow is that it suggests the symbolic meaning of death. Both of these speculations on the shadow in this piece reflect well upon what Munch is known for symbolically portraying in his artwork. The female in Puberty had originally been thought to have been a model of Munch\'s while he was in Berlin. The strong detail used in the collar bones of her body suggests that he very well might have used a model. Either way this young lady is trapped in a space that alludes to much controversy within her mind and surroundings.', '<em>Puberty</em> is a painting created by Edvard Munch. Munch is an artist native to Norway and is widely known for his role in expressionistic art. Puberty has also been done as a lithograph and an etching by Munch.', 1894, 152, 110, 'Oil on canvas', '125.0000', '165.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Puberty_(Edvard_Munch)'),
(81, 24, 28, '024050', 'Madonna', 1, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/Madonna%2C+1894%E2%80%9395.b7C_wljU5e.ips', 'NG.M.00841', '&copy; National Museum of Norway', '<em>Madonna</em> is a painting by the Norwegian expressionist Edvard Munch. Munch painted five versions of the Madonna between 1894 and 1895, using oils on canvas. Although it is a highly unusual representation, nevertheless, this painting is of Mary, the mother of Jesus. True to the Norwegian cultural beliefs and way of life, the painting is a strong dose of conceivable realism.', '<em>Madonna</em> is a painting by the Norwegian expressionist Edvard Munch. Munch painted five versions of the Madonna between 1894 and 1895, using oils on canvas. Although it is a highly unusual representation, nevertheless, this painting is of Mary, the mother of Jesus.', 1895, 91, 70, 'Oil on canvas', '190.0000', '230.0000', 'https://www.google.com/culturalinstitute/beta/asset/madonna/1gHp7gNaErg8lA', 'The painting shows a young woman with long, black hair down her shoulders. The deep set eyes are closed as she leans her head back. With her arms held behind her head and back, she exposes her naked body. The wavy lines that surround her, give the impression that she is floating or soaring. The artist has given her a red hat reminiscent of a halo. In Munch’s art the colour red often symbolize love, passion or agony.', 'http://en.wikipedia.org/wiki/Madonna_(Edvard_Munch)'),
(83, 24, 28, '024070', 'Dance of Life', 2, 'http://www.nasjonalmuseet.no/en/collections_and_research/our_collections/edvard_munch_in_the_national_museum/The+Dance+of+Life%2C+1899%E2%80%931900.b7C_wljW5c.ips', 'NG.M.00941', '&copy; National Museum of Norway', 'Munch’s painting shows several couples dancing in a luminous summer night. The central element of the composition is a couple, of whom the woman is wearing a bright red dress that wraps itself around the feet of her dancing partner. Her loose hair swirling about him, they seem to become a single entity. This couple is flanked by two other women, one of them young and radiant in a white dress, the other pale, with sunken cheeks and dressed in black. It is as if a story were being told about various stages in a woman’s life. Munch has set the scene on the seashore, a landscape with elements from Åsgårdstrand. Many of the pictures in Munch’s protracted “Frieze of Life” project were inspired by Åsgårdstrand’s curving shoreline and characteristic landscape.', 'Munch’s painting shows several couples dancing in a luminous summer night. The central element of the composition is a couple, of whom the woman is wearing a bright red dress that wraps itself around the feet of her dancing partner.', 1900, 126, 190, 'Oil on canvas', '250.0000', '325.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-dance-of-life/2QHHE-2HLPWV0g', 'The motif Dance of Life is central to the series Frieze of Life. The first time Munch painted the motif was in 1899-1900. Many years later, in 1925, he painted it once more when he took up again several of the motifs from the Frieze of Life. The technique was different, but the motifs and colours were the same\r\nIn the middle a young couple are dancing. They seem to have melted together. The woman’s red dress wraps itself around the man’s leg. The red colour continues like a contour line around the man and runs into his clothes. They dance face to face, silent and unsmiling, and the woman’s hair blows towards the man. \r\nOn either side of the couple there is a woman. In from the left a young woman dressed in white comes towards us, bright and happy. On the right stands a woman dressed in black, rigid and serious.', NULL),
(88, 28, 13, '028010', 'At the Moulin Rouge', 1, 'http://www.philamuseum.org/collections/permanent/193192.html', '1940-45-1', 'Public Domain', NULL, NULL, 1890, 116, 150, 'Oil on canvas', '340.0000', '400.0000', NULL, NULL, NULL),
(89, 28, 6, '028050', 'Jane Avril', 1, 'http://www.metmuseum.org/art/collection/search/333993', '32.88.15', 'Open Access for Scholarly Content', 'Lautrec’s graphic posters—for performers, like Jane Avril, or dance halls, like the Moulin Rouge—embody the ebullient, frenetic spirit of the nightlife in fin-de-siècle Paris. Avril, a lifelong friend of the artist, commissioned this print to advertise her cabaret show at the Jardin de Paris in 1893. Lautrec’s bold composition is characterized by a radically skewed perspective, severe cropping, flattened forms, and sinuous lines—such as those describing Avril’s frilly costume. The “cancan” kick of Avril’s leg, one of her signature dance moves, finds a formal echo in the vertical thrust of the double-bass, gripped by an unseen musician. To create this print, Lautrec used several lithographic stones, one for each color—inky black, acidic orange, yellow, and green.', 'Lautrec’s bold composition is characterized by a radically skewed perspective, severe cropping, flattened forms, and sinuous lines—such as those describing Avril’s frilly costume', 1893, 130, 95, 'Poster', '475.0000', '654.0000', NULL, NULL, NULL),
(101, 2, 17, '002020', 'Andre Derain', 1, 'http://www.tate.org.uk/art/artworks/matisse-andre-derain-n06241', 'N06241', 'Succession Henri Matisse/DACS 2016', 'Matisse and Derain painted portraits of each other while staying at the port of Collioure in the south of France. Using vivid, apparently arbitrary, colours, Matisse has captured the sensation of sunlight striking the sitter\'s face and casting a heavy shadow down one side. He has also tried to create a dynamic but balanced relationship between complementary colours, such as blue and orange, red and green. Complementary colours \'complete\' each other: they are at their most intense when placed together. Matisse adjusted his colours to obtain the maximum intensity. This non-naturalistic use of colour can be seen as a radical development of certain aspects of Impressionist art, and it led the critics to dub Matisse a \'fauve\' (wild beast).', 'Using vivid, apparently arbitrary, colours, Matisse has captured the sensation of sunlight striking the sitter\'s face and casting a heavy shadow down one side.', 1905, 39, 29, 'Oil on canvas', '523.0000', '700.0000', NULL, NULL, NULL),
(102, 2, 37, '002030', 'Joy of Life', 2, 'http://www.barnesfoundation.org/collections/art-collection/object/7199/le-bonheur-de-vivre-also-called-the-joy-of-life', 'BF719', '&copy; The Barnes Foundation', '<em>Le bonheur de vivre</em> (The joy of Life), is a painting by Henri Matisse. In the central background of the piece is a group of figures that is similar to the group depicted in his painting The Dance (second version).\r\nAccording to Hilton Kramer \"Le bonheur de vivre owing to its long sequestration in the collection of the Barnes Foundation, which never permitted its reproduction in color, is the least familiar of modern masterpieces. Yet this painting was Matisse\'s own response to the hostility his work had met with in the Salon d\'Automne of 1905, a response that entrenched his art even more deeply in the esthetic principles that had governed his Fauvist paintings which had caused a furor and which did so on a far grander scale, too.\"', '<em>Le bonheur de vivre</em> (The joy of Life), is a painting by Henri Matisse. In the central background of the piece is a group of figures that is similar to the group depicted in his painting The Dance (second version).', 1905, 175, 241, 'Oil on canvas', '900.0000', '1240.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Le_bonheur_de_vivre'),
(103, 2, 20, '002040', 'Red Studio', 3, 'http://www.moma.org/collection/works/78389?locale=en', '8.1949', 'Succession H. Matisse / Artists Rights Society', '\"Where I got the color red—to be sure, I just don\'t know,\" Matisse once remarked. \"I find that all these things . . . only become what they are to me when I see them together with the color red.\" This painting features a small retrospective of Matisse\'s recent painting, sculpture, and ceramics, displayed in his studio. The artworks appear in color and in detail, while the room\'s architecture and furnishings are indicated only by negative gaps in the red surface. The composition\'s central axis is a grandfather clock without hands—it is as if, in the oasis of the artist\'s studio, time were suspended.', 'The artworks appear in color and in detail, while the room\'s architecture and furnishings are indicated only by negative gaps in the red surface. The composition\'s central axis is a grandfather clock without hands—it is as if, in the oasis of the artist\'s studio, time were suspended.', 1911, 181, 219, 'Oil on canvas', '1153.0000', '1175.0000', NULL, NULL, NULL),
(105, 32, 7, '032010', 'Charing Cross Bridge', 2, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.61249.html', '1982.76.3', 'Open Access', NULL, NULL, 1905, 80, 100, 'Oil on canvas', '500.0000', '800.0000', NULL, NULL, NULL),
(114, 40, 11, '040020', 'Improvisation No. 30 (Cannons)', 3, 'http://www.artic.edu/aic/collections/artwork/8991', NULL, 'Rights-Managed (RM)', 'Although Improvisation No. 30 (Cannons) at first appears to be an almost random assortment of brilliant colors, shapes, and lines, the artist also included leaning buildings, a crowd of people, and a wheeled, smoking cannon.', 'Although Improvisation No. 30 (Cannons) at first appears to be an almost random assortment of brilliant colors, shapes, and lines, the artist also included leaning buildings, a crowd of people, and a wheeled, smoking cannon.', 1913, 109, 109, 'Oil on canvas', '530.0000', '700.0000', NULL, NULL, NULL),
(115, 40, 24, '040010', 'Composition VI', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/35744/?lng=en', '9662', 'Personal non-commercial use', NULL, NULL, 1913, 195, 300, 'Oil on canvas', '203.0000', '220.0000', NULL, NULL, NULL),
(118, 41, 51, '041010', 'Dynamism of a Dog on a Leash', 2, 'https://www.albrightknox.org/collection/search/piece:505/', '505', 'Public Domain', NULL, NULL, 1912, 90, 110, 'Oil on canvas', '300.0000', '400.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Dynamism_of_a_Dog_on_a_Leash'),
(119, 41, 35, '041020', 'Abstract Speed + Sound', 2, 'https://www.guggenheim.org/artwork/300', '76.2553.31', 'Artists Rights Society', 'It has been proposed that <em>Abstract Speed + Sound</em> was the central section of a narrative triptych suggesting the alteration of landscape by the passage of a car through the atmosphere. The related Abstract Speed and Abstract Speed—The Car Has Passed would have been the flanking panels. Indications of sky and a single landscape are present in the three paintings; the interpretation of fragmented evocations of the car’s speed varies from panel to panel. The Peggy Guggenheim work is distinguished by crisscross motifs, representing sound, and a multiplication of the number of lines and planes.', 'It has been proposed that <em>Abstract Speed + Sound</em> was the central section of a narrative triptych suggesting the alteration of landscape by the passage of a car through the atmosphere.', 1913, 54, 76, 'Oil on millboard', '320.0000', '360.0000', NULL, NULL, 'http://www.guggenheim.org/new-york/collections/collection-online/show-full/piece/?search=Giacomo%20Balla&page=1&f=People&cr=1'),
(124, 45, 20, '045020', 'Persistence of Memory', 3, 'http://www.moma.org/collection/works/79018?locale=en', '162.1934', 'Salvador Dalí, Gala-Salvador Dalí Foundation / Artists Rights Society', '<em>The Persistence of Memory</em> is by far Salvador Dali’s most recognizable paintings, and there are many references to it in popular culture. Although it was conjectured that the soft melting watches were the result of Dali’s interpretation of the theory of relativity, Dali himself state that their inspiration was camembert cheese melting under the sun. The sequence of melting clocks in a disjointed landscape is the depiction of a dream that Dali had experienced, the figure in the middle of the painting being the face of the dreamer himself. The general interpretation is that the painting, which portrays many melting watches, is a rejection of time as a solid and deterministic influence.', '<em>The Persistence of Memory</em> is by far Salvador Dali’s most recognizable paintings, and there are many references to it in popular culture.', 1931, 24, 33, 'Oil on canvas', '800.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Persistence_of_Memory'),
(139, 5, 16, '005010', 'The Oath of the Horatii', 2, 'http://www.louvre.fr/en/oeuvre-notices/oath-horatii', 'INV. 3692', '&copy; Musée du Louvre', '<em>Oath of the Horatii</em> (French: Le Serment des Horaces), is a work by French artist Jacques-Louis David painted in 1784. It depicts a scene from a Roman legend about a dispute between two warring cities; Rome and Alba Longa, when three brothers from a Roman family, the Horatii, agree to end the war by fighting three brothers from an Alba Longa family, the Curiatii. The three brothers, all of which appear willing to sacrifice their lives for the good of Rome, are shown saluting their father who holds their swords out for them. The principal sources for the story behind David\'s Oath are the first book of Livy (sections 24-6) which was elaborated by Dionysius in book 3 of his Roman Antiquities. However, the moment depicted in David\'s painting is his own invention.\r\nIt grew to be considered a paradigm of neoclassical art. The painting increased David\'s fame, allowing him to rear his own students.', '<em>Oath of the Horatii</em> (French: Le Serment des Horaces), is a work by French artist Jacques-Louis David painted in 1784. It depicts a scene from a Roman legend about a dispute between two warring cities; Rome and Alba Longa, when three brothers from a Roman family, the Horatii, agree to end the war by fighting three brothers from an Alba Longa family, the Curiatii.', 1784, 330, 425, 'Oil on canvas', '550.0000', '800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Oath_of_the_Horatii'),
(140, 6, 16, '006010', 'Mademoiselle Caroline Riviere', 1, 'http://www.louvre.fr/en/oeuvre-notices/mademoiselle-caroline-riviere', 'M.I. 1447', '&copy; Musée du Louvre', 'The portrait of Mademoiselle Caroline Rivière was painted in 1806 by the French Neoclassical artist Jean Auguste Dominique Ingres, and today hangs in the Louvre. It is the third of three portraits of the Rivière family the artist painted that year. Caroline\'s father, Philibert Rivière, was a successful court official under Napoleon\'s empire, and sought to commemorate himself, his wife and daughter through a commission with the then young and rising artist - his portraits of Philibert and his wife are also still extant. Although Ingres favoured subject matter drawn from history or Greek legend, at this early stage in his career he earned his living mainly through commissions from wealthy patrons.[1] The family lived outside Paris, at St. Germain-en-Laye, and Mademoiselle Caroline Rivière would have been between 13 and 15 at the time she was portrayed; according to Ingres the \"ravishing daughter\".\r\nThe younger Rivière\'s portrait describes slightly-built and youthful femininity and hints at a hesitant openness. The painting is rendered in bright hues and set against a serene white–blue early spring landscape, the freshness of which was intended to reflect the youth of the sitter. The background is not deeply portrayed; the perspective is shallow and rises—according to the art historian Robert Rosenblum—in \"flattened horizontal tiers against which the figure seems crisply silhouetted as if in low relief.\"\r\nTypical of portraits by Ingres of the time, Caroline Rivière is drawn with a disregard for anatomical accuracy. Her neck is overly elongated, and the bridge of her nose extends too far.Rivière is portrayed with a stiffness and awkwardness typical of her age, and shown in a manner which was intended to emphasise a sense of the nascent purity and simplicity of her youth. Yet the painting is generally seen in the light of pathos and tragedy, as the sitter died within a year of the work being completed', 'The portrait of Mademoiselle Caroline Rivière was painted in 1806 by the French Neoclassical artist Jean Auguste Dominique Ingres, and today hangs in the Louvre. It is the third of three portraits of the Rivière family the artist painted that year.', 1806, 100, 70, 'Oil on canvas', '230.0000', '400.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Mademoiselle_Caroline_Rivi%C3%A8re'),
(142, 7, 16, '007010', 'Death of Sardanapalus', 3, 'http://www.louvre.fr/en/oeuvre-notices/death-sardanapalus', 'R.F. 2346', '&copy; Musée du Louvre', '<em>Death of Sardanapalus</em> (La Mort de Sardanapale) is an oil painting on canvas, dated 1827 by Eugène Delacroix. Its dominant feature is a large divan, with its golden elephants, on which a nude prostrates herself and beseeches the apathetic Sardanapalus for mercy. Sardanapalus (Detail) had ordered his possessions destroyed and sex slaves murdered before immolating himself, once he learned that he was faced with military defeat.', '<em>Death of Sardanapalus</em> (La Mort de Sardanapale) is an oil painting on canvas, dated 1827 by Eugène Delacroix. Its dominant feature is a large divan, with its golden elephants, on which a nude prostrates herself and beseeches the apathetic Sardanapalus for mercy.', 1827, 392, 496, 'Oil on canvas', '850.0000', '1175.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Death_of_Sardanapalus'),
(145, 10, 34, '010030', 'The Young Ladies on the Banks of the Seine (Summer)', 3, 'http://www.petitpalais.paris.fr/fr/collections/les-demoiselles-des-bords-de-la-seine-ete', 'PPP00377', '&copy; Petit Palais', NULL, NULL, 1856, 174, 200, 'Oil on canvas', '250.0000', '350.0000', NULL, NULL, NULL),
(146, 10, 34, '010040', 'The Sleepers', 2, 'http://www.petitpalais.paris.fr/fr/collections/le-sommeil', 'PPP03130', '&copy; Petit Palais', 'In the 1860’s Courbet began painting erotic nudes scenes, including depictions of female genitalia, nude women in erotic poses, and this painting, depicting lesbianism. Courbet gained much notoriety for his erotic nudes, which he displayed alongside hunting scenes, ensuring a sales and a reputation. <em>Le Sommeil</em> was commissioned by the Turkish diplomat Khalil Bey, who also commissioned <em>The Origin of the World</em>, to include his private collection of erotic paintings. This particular painting was also part of a police report in 1872 when a painting dealer held in it an exhibition. It was not allowed to be displayed publicly until 1988.', 'In the 1860’s Courbet began painting erotic nudes scenes, including depictions of female genitalia, nude women in erotic poses, and this painting, depicting lesbianism.', 1866, 135, 200, 'Oil on canvas', '300.0000', '375.0000', NULL, NULL, NULL),
(152, 13, 19, '013030', 'Arrangement in Grey and Black: Portrait of the Painter\'s Mother', 3, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/arrangement-en-gris-et-noir-n1-445.html', 'RF 699', '&copy; Home', '<em>Arrangement in Grey and Black: The Artist\'s Mother</em>, famous under its colloquial name Whistler\'s Mother, is an 1871 oil-on-canvas painting by American-born painter James McNeill Whistler.  It occasionally tours worldwide. Although an icon of American art, it rarely appears in the United States.', '<em>Arrangement in Grey and Black: The Artist\'s Mother</em>, famous under its colloquial name Whistler\'s Mother, is an 1871 oil-on-canvas painting by American-born painter James McNeill Whistler.  It occasionally tours worldwide. Although an icon of American art, it rarely appears in the United States.', 1871, 144, 162, 'Oil on canvas', '1225.0000', '1300.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Whistler%27s_Mother'),
(153, 14, 13, '014030', 'Large Bathers', 2, 'http://www.philamuseum.org/collections/permanent/59196.html', '1963-116-13', 'Public Domain', 'Renoir labored over this painting for a period of three years before he was happy with its composition. Along with at least two full-sized figure drawings of the models, Renoir also created many preparatory drawings for each of the figures before eventually putting brush to canvas. Due to the criticism he received for the painting’s sculptural smoothness and a change in the artist’s perceived style, Renoir, who was exhausted by the effort, claimed that he would never again devote such a long period of time for a single piece of work.', 'Renoir labored over this painting for a period of three years before he was happy with its composition. Along with at least two full-sized figure drawings of the models, Renoir also created many preparatory drawings for each of the figures before eventually putting brush to canvas.', 1887, 170, 116, 'Oil on canvas', '900.0000', '1000.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-large-bathers/2wE1mqTuUoBmtA', 'Although this painting depicts a fleeting moment when one bather playfully threatens to splash a companion, it has a timeless, monumental quality. The sculptural rendering of the figures against a shimmering landscape and the careful application of dry paint reflect the tradition of seventeenth- and eighteenth-century French painting. Renoir--in an attempt to reconcile this tradition with modern painting--labored over this work for three years, making numerous preparatory drawings for individual figures and at least two full-scale, multifigure drawings. Faced with criticism of his new style after completing The Large Bathers, an exhausted Renoir never again devoted such painstaking effort to a single work.', 'http://www.philamuseum.org/collections/permanent/59196.html'),
(154, 15, 19, '015010', 'The Belleli Family', 2, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/la-famille-bellelli-7077.html', 'RF 2210', '&copy; Home', 'Degas’ early masterpiece, <em>The Bellelli Family</em> depicts his aunt, her husband and their two little girls. It is believed that the artist drew each of the figures individually, later combining them in this unique portrayal of their family dynamic. The woman, Degas’ aunt Laura, wears a black dress in mourning for her recently deceased father, whose portrait hangs on the wall behind her. It is likely that this portrait hung at the Paris Salon of 1867, but it was badly hung and as a result was largely ignored by the critics. As a result, Degas kept it in his personal collection, where it remained until he left it to his dealer in 1913. In 1918, after his death, it was revealed an exhibition of the artist’s estate, and was immediately bought for 400,000 by the Luxembourg Museum.', 'Degas’ early masterpiece, <em>The Bellelli Family</em> depicts his aunt, her husband and their two little girls.', 1860, 200, 250, 'Oil on canvas', '1350.0000', '1400.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-bellelli-family/CAEtElXoJtKBnQ', 'Between the ages of 22 and 26, Edgar Degas completed his training in Italy, where part of his familly lived. Here he painted his father\'s sister, Laure, with her husband, the baron Bellelli (1812-1864) and her two daughters, Giula and Giovanna.\r\n\r\nThe baron was an Italian patriot, banned from Naples, who lived an exile in Florence. His wife is in mourning for her father, Hilaire, who died recently and whose portrait appears on the framed redline painting close to his daughter\'s face.', 'http://en.wikipedia.org/wiki/Portrait_of_the_Bellelli_Family'),
(157, 15, 5, '015060', 'Young Spartans Exercising', 2, 'https://www.nationalgallery.org.uk/paintings/hilaire-germain-edgar-degas-young-spartans-exercising', 'NG3860', 'Creative Commons BY-NC-ND 4.0', '<em>Young Spartans Exercising</em>, also known as <em>Young Spartans</em>, is an oil on canvas painting by French impressionist artist Edgar Degas. The work depicts two groups of male and female Spartan youths exercising, though the subject matter of the painting has, in recent times, been challenged.', '<em>Young Spartans Exercising</em>, also known as <em>Young Spartans</em>, is an oil on canvas painting by French impressionist artist Edgar Degas. The work depicts two groups of male and female Spartan youths exercising, though the subject matter of the painting has, in recent times, been challenged.', 1860, 110, 155, 'Oil on canvas', '180.0000', '220.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Young_Spartans_Exercising'),
(162, 15, 19, '015100', 'The Tub', 2, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/le-tub-7086.html', 'RF 4046', '&copy; Home', 'Degas, in the Classic line of descent from Ingres as a draughtsman--and one of the greatest in Europe since the giants of the Renaissance--exchanged oil paint for pastel, as in this example, with a sense of greater freedom in being able to draw in the medium as well as to apply color. The word \"classic\" refers to his preoccupation with the human figure but not to any desire to depict an ideal type of humanity. Remarking that \"la femme en général est laide\" he showed no disposition to modify this supposed ugliness. He quickly abandoned the antique subject-matter of pictorial composition after his few early essays.', 'Degas, in the Classic line of descent from Ingres as a draughtsman--and one of the greatest in Europe since the giants of the Renaissance--exchanged oil paint for pastel, as in this example, with a sense of greater freedom in being able to draw in the medium as well as to apply color.', 1886, 60, 83, 'Pastel on paper', '875.0000', '890.0000', NULL, NULL, 'http://www.ibiblio.org/wm/paint/auth/degas/combing-hair/'),
(165, 16, 7, '016010', 'Little Girl in a Blue Chair', 2, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.61368.html', '1983.1.18', 'Open Access', 'Little Girl in a Blue Armchair stands as a testament to the newly formed relationship between Mary Cassatt and the impressionists, and to her assimilation of a freer style of painting. With a limited palette and vibrant brushstroke, she created a dynamic interplay of forms that is echoed in this captured moment between rest and play.', 'Little Girl in a Blue Armchair stands as a testament to the newly formed relationship between Mary Cassatt and the impressionists', 1878, 90, 130, 'Oil on canvas', '670.0000', '800.0000', NULL, NULL, NULL),
(167, 16, 11, '016030', 'Bath', 1, 'http://www.artic.edu/aic/collections/artwork/111442', NULL, 'Rights-Managed (RM)', '<em>The Child\'s Bath</em> (or The Bath) is an 1893 oil painting by American artist Mary Cassatt. The subject matter and the overhead perspective were inspired by Japanese woodblocks. It shows dignity in motherhood and has a style similar to that of Degas.\r\nThe Art Institute of Chicago acquired the piece in 1910. It has since become one of the most popular pieces in the museum.', '<em>The Child\'s Bath</em> (or The Bath) is an 1893 oil painting by American artist Mary Cassatt. The subject matter and the overhead perspective were inspired by Japanese woodblocks.', 1891, 100, 66, 'Oil on canvas', '725.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Child%27s_Bath'),
(171, 18, 20, '018010', 'Still Life with Three Puppies', 5, 'http://www.moma.org/collection/works/78616?locale=en', '48.1952', '&copy; Art Resource', 'This painting features three distinct zones: a still life of fruit in the foreground, a row of three blue goblets and apples diagonally bisecting the canvas, and three puppies drinking from a large pan. The incongruous scale and placement of these objects on a dramatically upturned tabletop results in a disorienting composition.\r\nMedium\r\nOil on wood\r\nDimensions\r\n36 1/8 x 24 5/8\" (91.8 x 62.6 cm)\r\nCredit\r\nMrs. Simon Guggenheim Fund\r\nObject number\r\n48.1952\r\nDepartment\r\nPainting and Sculpture\r\nThis work is on view on Floor 5, in Painting and Sculpture I, Gallery 1, with 20 other works online.\r\nPaul Gauguin has 33 works online.\r\nThere are 2,242 paintings online.\r\nThis painting features three distinct zones: a still life of fruit in the foreground, a row of three blue goblets and apples diagonally bisecting the canvas, and three puppies drinking from a large pan. The incongruous scale and placement of these objects on a dramatically upturned tabletop results in a disorienting composition.', 'This painting features three distinct zones: a still life of fruit in the foreground, a row of three blue goblets and apples diagonally bisecting the canvas, and three puppies drinking from a large pan.', 1888, 88, 62, 'Oil on canvas', '875.0000', '1225.0000', NULL, NULL, NULL),
(172, 18, 51, '018060', 'Spirit of the Dead Watching', 2, 'https://www.albrightknox.org/collection/search/piece:511/', '515', 'Public Domain', '<em>Spirit of the Dead Watching</em> (Manao tupapau) is an 1892 oil on burlap canvas painting by Paul Gauguin, depicting a nude Tahitian girl lying on her stomach. An old woman is seated behind her. In Tahitian mythology the title may refer to either the girl imagining the ghost, or the ghost imagining her.\r\nThe subject of the painting was Gauguin\'s Tahitian wife Tehura, then 14 years old, who one night, according to Gauguin, was lying in fear when he arrived late home: \"immobile, naked, lying face downward on the bed with the eyes inordinately large with fear . . . Might she not with her frightened face take me for one of the demons and spectres of the Tupapaus, with which the legends of her race people sleepless nights?\" The spirit she fears is personified by the old woman seated at left. The strong colors are symbolic of the native Polynesian belief that phosphorescent lights were manifestations of the spirits of the dead.', '<em>Spirit of the Dead Watching</em> (Manao tupapau) is an 1892 oil on burlap canvas painting by Paul Gauguin, depicting a nude Tahitian girl lying on her stomach. An old woman is seated behind her. In Tahitian mythology the title may refer to either the girl imagining the ghost, or the ghost imagining her.', 1892, 72, 92, 'Oil on burlap mounted on canvas', '225.0000', '325.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Spirit_of_the_Dead_Watching'),
(173, 12, 19, '012010', 'Luncheon on the Grass', 2, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/le-dejeuner-sur-lherbe-7123.html', 'RF 1668', '&copy; Home', '<em>The Luncheon on the Grass</em> (Le déjeuner sur l\'herbe) was rejected by the Paris Salon in 1863 but Manet exhibited it at the Salon des Refusés (Salon of the Rejected) later in the year. Emperor Napoleon III had initiated The Salon des Refusés after the Paris Salon rejected more than 4,000 paintings in 1863.\r\nThe painting\'s juxtaposition of fully dressed men and a nude woman was controversial, as was its abbreviated, sketch-like handling, an innovation that distinguished Manet from Courbet. At the same time, Manet\'s composition reveals his study of the old masters, as the disposition of the main figures is derived from Marcantonio Raimondi\'s engraving of the Judgement of Paris (c. 1515) based on a drawing by Raphael.\r\nTwo additional works that are cited by scholars as important precedents for Le déjeuner sur l\'herbe are <em>Pastoral Concert</em> (c. 1510, The Louvre) and <em>The Tempest</em> (Gallerie dell\'Accademia, Venice), both of which are attributed variously to Italian Renaissance masters Giorgione or Titian. The Tempest is an enigmatic painting that features a fully dressed man and a nude woman in a rural setting. The man is standing to the left and gazing to the side, apparently at the woman, who is seated and is breastfeeding a baby; the relationship between the two figures is unclear. In Pastoral Concert, two clothed men and a nude woman are seated on the grass, engaged in music making, while a second nude woman stands beside them.', '<em>The Luncheon on the Grass</em> (Le déjeuner sur l\'herbe) was rejected by the Paris Salon in 1863 but Manet exhibited it at the Salon des Refusés (Salon of the Rejected) later in the year. Emperor Napoleon III had initiated The Salon des Refusés after the Paris Salon rejected more than 4,000 paintings in 1863.', 1863, 214, 269, 'Oil on canvas', '1225.0000', '1300.0000', 'https://www.google.com/culturalinstitute/beta/asset/luncheon-on-the-grass/twELHYoc3ID_VA', NULL, 'http://en.wikipedia.org/wiki/Le_d%C3%A9jeuner_sur_l%27herbe');
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(178, 13, 7, '013010', 'Symphony in White, No. 1: The White Girl', 5, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.12198.html', '1943.6.2', 'Open Access', '<em>Symphony in White, No. 1</em>, also known as <em>The White Girl</em>, is a painting by James Abbott McNeill Whistler. The work shows a woman in full figure standing on a wolf skin in front of a white curtain with a lily in her hand. The colour scheme of the painting is almost entirely white. The model is Joanna Heffernan, the artist\'s mistress. Though the painting was originally called The White Girl, Whistler later started calling it Symphony in White, No. 1. By referring to his work in such abstract terms, he intended to emphasise his \"art for art\'s sake\" philosophy.\r\nWhistler created the painting in the winter of 1861–62, though he later returned to it and made alterations. It was rejected both at the Royal Academy and at the Salon in Paris, but eventually accepted at the Salon des Refusés in 1863. This exhibition also featured Édouard Manet\'s famous Déjeuner sur l\'herbe, and together the two works gained a lot of attention. <em>The White Girl</em> shows clearly the influence of the Pre-Raphaelite Brotherhood, with whom Whistler had recently come in contact. The painting has been interpreted by later art critics both as an allegory of innocence and its loss, and as a religious allusion to the Virgin Mary.', '<em>Symphony in White, No. 1</em>, also known as <em>The White Girl</em>, is a painting by James Abbott McNeill Whistler. The work shows a woman in full figure standing on a wolf skin in front of a white curtain with a lily in her hand.', 1862, 215, 108, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Symphony_in_White,_No._1:_The_White_Girl'),
(179, 13, 52, '013020', 'Nocturne in Black and Gold: The Falling Rocket', 1, 'http://www.dia.org/object-info/7d1a59d3-6163-440a-925a-b0978f1f8811.aspx', '46.309', '&copy; Detroit Institute of Arts', '<em>Nocturne in Black and Gold – The Falling Rocket</em> is an 1870s painting by James Abbott McNeill Whistler. It depicts a fireworks show in the night sky over Battersea Bridge in an industrial London city park.\r\nThis painting was first shown at the Grosvenor Gallery in London in 1877. It is the last of the London Nocturnes and is now widely acknowledged to be the high point of Whistler\'s middle period.', '<em>Nocturne in Black and Gold – The Falling Rocket</em> is an 1870s painting by James Abbott McNeill Whistler. It depicts a fireworks show in the night sky over Battersea Bridge in an industrial London city park.', 1874, 60, 47, 'Oil on wood', '125.0000', '200.0000', 'https://www.google.com/culturalinstitute/beta/asset/nocturne-in-black-and-gold-the-falling-rocket/BwH3OB1BV9luHw', NULL, 'http://en.wikipedia.org/wiki/Nocturne_in_Black_and_Gold:_The_Falling_Rocket'),
(181, 8, 2, '008010', 'The Shootings of May Third 1808', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-3rd-of-may-1808-in-madrid-or-the-executions/5e177409-2993-4240-97fb-847a02c6496c', 'P00749', 'Private, personal, academic, research or educational', '<em>The Third of May 1808</em> (also known as El tres de mayo de 1808 en Madrid, or Los fusilamientos de la montaña del Príncipe Pío, or Los fusilamientos del tres de mayo) is a painting completed in 1814 by the Spanish painter Francisco Goya, now in the Museo del Prado, Madrid. In the work, Goya sought to commemorate Spanish resistance to Napoleon\'s armies during the occupation of 1808. Along with its companion piece of the same size, The Second of May 1808 (or The Charge of the Mamelukes), it was commissioned by the provisional government of Spain at Goya\'s suggestion.\r\nThe painting\'s content, presentation, and emotional force secure its status as a groundbreaking, archetypal image of the horrors of war. Although it draws on many sources from both high and popular art, The Third of May 1808 marks a clear break from convention. Diverging from the traditions of Christian art and traditional depictions of war, it has no distinct precedent, and is acknowledged as one of the first paintings of the modern era. According to the art historian Kenneth Clark, The Third of May 1808 is \"the first great picture which can be called revolutionary in every sense of the word, in style, in subject, and in intention\".', '<em>The Third of May 1808</em> is a painting completed in 1814 by the Spanish painter Francisco Goya, now in the Museo del Prado, Madrid. In the work, Goya sought to commemorate Spanish resistance to Napoleon\'s armies during the occupation of 1808.', 1814, 268, 347, 'Oil on canvas', '400.0000', '650.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Third_of_May_1808'),
(182, 10, 19, '010060', 'The Painter\'s Studio; A Real Allegory', 4, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/latelier-du-peintre-7091.html', 'RF 2257', '&copy; Home', '<em>The Artist\'s Studio: A Real Allegory of a Seven Year Phase in my Artistic and Moral Life\r\n</em> is an allegory of Coubet\'s life as a painter, seen as an heroic venture, in which he is flanked by friends and admirers on the right, and challenges and opposition to the left. Friends on the right include the art critics Champfleury, and Charles Baudelaire, and art collector Alfred Bruyas. On the left are figures (priest, prostitute, grave digger, merchant and others) who represent what Courbet described in a letter to Champfleury as \"the other world of trivial life, the people, misery, poverty, wealth, the exploited and the exploiters, the people who live off death.\"\r\nIn the foreground of the left-hand side is a man with dogs, who was not mentioned in Courbet\'s letter to Champfleury. X-rays show he was painted in later, but his role in the painting is important: he is an allegory of the then current French Emperor, Napoleon III, identified by his famous hunting dogs and iconic twirled moustache. By placing him on the left, Courbet publicly shows his disdain for the emperor and depicts him as a criminal, suggesting that his \"ownership\" of France is an illegal one.', '<em>The Artist\'s Studio: A Real Allegory of a Seven Year Phase in my Artistic and Moral Life\r\n</em> is an allegory of Coubet\'s life as a painter, seen as an heroic venture, in which he is flanked by friends and admirers on the right, and challenges and opposition to the left.', 1855, 361, 598, 'Oil on canvas', '1225.0000', '1325.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Artist%27s_Studio'),
(190, 28, 20, '028040', 'La Goulue Arriving at the Moulin Rouge with Two Women', 1, 'http://www.moma.org/collection/works/34936?locale=en', '161.1957', '&copy; Art Resource', 'Louise Weber, nicknamed La Goulue (the glutton), is depicted in the Moulin Rouge—a Montmartre cabaret frequented by the Parisian demimonde—flanked by her sister to her right and, to her left, her lover.', 'Throughout his work he portrayed unconventional individuals in an audacious manner both frank and sympathetic.', 1892, 79, 59, 'Oil on canvas', '1400.0000', '1450.0000', NULL, NULL, NULL),
(191, 28, 70, '028020', 'Moulin Rouge La Goulue', 1, 'http://collection.imamuseum.org/artwork/44070/', '36.4', 'Public Domain', 'The Moulin Rouge dance hall opened in Montmartre in 1889 and Toulouse-Lautrec was a regular from the beginning. For his first poster and for the first time in poster design, Toulouse-Lautrec featured the actual entertainers in the advertisement: La Goulue (the Glutton) dancing the can-can accompanied by her partner \"No-Bones\" Valentin.\r\n\r\nNo one in the fall of 1891 would have predicted that this ephemeral advertisement would become within days a collected item, within weeks the object of press reviews, within months the partner of paintings in avant-garde exhibitions, and within a year the internationally recognized symbol of 1890s Paris.', 'For his first poster and for the first time in poster design, Toulouse-Lautrec featured the actual entertainers in the advertisement', 1891, 191, 117, 'Poster', '80.0000', '100.0000', 'https://www.google.com/culturalinstitute/beta/asset/moulin-rouge-la-goulue/HwHWsv1o7adJ3A', 'The Moulin Rouge dance hall opened in Montmartre in 1889 and Toulouse-Lautrec was a regular from the beginning.ÿ For his first poster and for the first time in poster design, Toulouse-Lautrec featured the actual entertainers in the advertisement: La Goulue (the Glutton) dancing the can-can accompanied by her partner \"No-Bones\" Valentin. No one in the fall of 1891 would have predicted that this ephemeral advertisement would become within days a collected item, within weeks the object of press reviews, within months the partner of paintings in avant-garde exhibitions, and within a year the internationally recognized symbol of 1890s Paris.', 'http://fr.wikipedia.org/wiki/Moulin_rouge_-_La_Goulue'),
(192, 29, 22, '029010', 'The Kiss', 3, 'http://digital.belvedere.at/objects/6678/liebespaar', '912', 'Private use', '<em>The Kiss</em> (original <em>Der Kuss</em>) was painted by Gustav Klimt, and is probably his most famous work. He began work on it in 1907 and it is the highpoint of his so-called \'Golden Period\', when he painted a number of works in a similar style. It depicts a couple embracing, their bodies largely hidden by elaborate robes decorated in a style that bears little relation to any historical textile designs. As well as conventional oil paint, gold leaf has been used, one of the aspects of the work that gives it a strikingly modern appearance, while evoking memories of much earlier art. The painting is now in the Österreichische Galerie Belvedere museum, in the Belvedere palace, in Vienna, Austria.\r\nWhen he painted The Kiss Klimt was 45 and still lived at home with his mother and two unmarried sisters - but behind the respectable facade he was a man with a ferocious sexual appetite. Klimt fathered at least three illegitimate children and probably many more. He was obsessed by women and he had a fixation with redheads. It is no surprise that the woman in The Kiss has red hair. According to writer Frank Whitford: \"Together the man and the woman form the shape of a penis and I think that is intentional - it\'s about sex and about the fulfillment of sex between a man and a woman.\"', '<em>The Kiss</em> (original <em>Der Kuss</em>) was painted by Gustav Klimt, and is probably his most famous work. He began work on it in 1907 and it is the highpoint of his so-called \'Golden Period\', when he painted a number of works in a similar style.', 1907, 180, 180, 'Oil and gold on canvas', '230.0000', '320.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-kiss/HQGxUutM_F6ZGg', '“The Kiss”, probably the most popular work by Gustav Klimt, was first exhibited in 1908 at the Kunstschau art exhibition on the site of today’s Konzerthaus. The Ministry bought it from there for the sum of 25,000 Kronen and thus secured for the state one of the icons of Viennese Jugendstil and indeed of European modern art. It undoubtedly represents the culmination of the phase known as the “Golden Epoch”. In this decade, the artist created a puzzling, ornamental encoded programme that revolved around the mystery of existence, love and fulfilment through art. Klimt gained initial inspiration for this in 1903 on a journey to Ravenna to see the Byzantine mosaics. In addition, the painting contains a myriad of motifs from various cultural epochs, above all from Ancient Egyptian mythology. Most recent research has, however, revealed that it is not enough to read the ornaments in the picture just as symbols rooted in tradition aiming to convey a timelessly valid message. They reveal more, such as references to Klimt’s love for Emilie Flöge and the artist’s exploration of the sculptor Auguste Rodin’s art.', 'http://en.wikipedia.org/wiki/The_Kiss_(Klimt_painting)'),
(194, 32, 24, '032020', 'Portrait of a Girl in Black', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28225/?lng=en', '9125', 'Personal non-commercial use', NULL, NULL, 1913, 116, 89, 'Oil on canvas', '320.0000', '360.0000', NULL, NULL, NULL),
(195, 32, 42, '032030', 'Landscape in Provence', 2, 'https://www.brooklynmuseum.org/opencollection/objects/4725', '39.273', 'Creative Commons - Attribution', NULL, NULL, 1908, 32, 41, 'Oil on canvas', '1180.0000', '1210.0000', NULL, NULL, 'http://www.brooklynmuseum.org/opencollection/objects/4725/Landscape_in_Provence_Paysage_de_Provence'),
(213, 45, 13, '045030', 'Soft Construction with Boiled Beans', 2, 'http://www.philamuseum.org/collections/permanent/51315.html', '1950-134-41', 'Salvador Dali, Gala-Salvador Dali Foundation / Artists Rights Society', 'Depicted is a grimacing dismembered figure symbolic of the Spanish state in civil war, alternately grasping upward at itself and holding itself down underfoot, a relationship morbidly prescient of Escher\'s later <em>Drawing Hands</em> (1948). The painting resides at the Philadelphia Museum of Art.\r\nThe painting, which was painted in 1936, is used to show the struggle of war that can sometimes be both self-fulfilling and self-mutilating at the same time. Despite his support of General Franco, Dalí was openly against war, and used this painting to show it. The boiled beans may refer to the ancient Catalan offering to the gods. The little man in the bottom left corner is a representation of the astonishing, awe-inspiring spirits contained in the souls of Anneke and Nikki van Lugo, childhood friends and muses of Dalí.', 'Depicted is a grimacing dismembered figure symbolic of the Spanish state in civil war, alternately grasping upward at itself and holding itself down underfoot, a relationship morbidly prescient of Escher\'s later <em>Drawing Hands</em> (1948).', 1936, 100, 99, 'Oil on canvas', '300.0000', '340.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Soft_Construction_with_Boiled_Beans_(Premonition_of_Civil_War)'),
(214, 45, 17, '045040', 'Metamorphosis of Narcissus', 2, 'http://www.tate.org.uk/art/artworks/dali-metamorphosis-of-narcissus-t02343', 'T02343', 'Salvador Dalí, Gala-Salvador Dalí Foundation / Artists Rights Society', 'This painting is from Dalí\'s Paranoiac-critical period. According to Greek mythology, Narcissus fell in love with his own reflection in a pool. Unable to embrace the watery image, he pined away, and the gods immortalized him as a flower. Dali completed this painting in 1937 on his long awaited return to Paris after having had great success in the United States.', 'This painting is from Dalí\'s Paranoiac-critical period. According to Greek mythology, Narcissus fell in love with his own reflection in a pool. Unable to embrace the watery image, he pined away, and the gods immortalized him as a flower.', 1937, 51, 78, 'Oil on canvas', '290.0000', '350.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Metamorphosis_of_Narcissus'),
(219, 49, 70, '049020', 'Grey Hills', 3, 'http://collection.imamuseum.org/artwork/55829/', '43.37', 'Georgia O\'Keeffe Museum / Artists Rights Society', 'Like all her magnified views, the hills of O\'Keeffe\'s New Mexico landscapes threaten to burst the bounds of the frame.\r\n\r\nO\'Keeffe painted this canvas during a trip to a desolate region of New Mexico.', 'Like all her magnified views, the hills of O\'Keeffe\'s New Mexico landscapes threaten to burst the bounds of the frame.\r\n\r\nO\'Keeffe painted this canvas during a trip to a desolate region of New Mexico.', 1941, 76, 51, 'oil on canvas', '340.0000', '380.0000', NULL, NULL, NULL),
(225, 60, 35, '060010', 'Red Balloon', 3, 'https://www.guggenheim.org/artwork/2143', '48.1172.524', 'Artists Rights Society', NULL, NULL, 1922, 32, 31, 'Oil on muslin primed with chalk', '230.0000', '280.0000', NULL, NULL, NULL),
(230, 60, 20, '060040', 'Twittering Machine', 1, 'http://www.moma.org/collection/works/37347?locale=en', '564.1939', 'Artists Rights Society', 'The \"twittering\" in the title doubtless refers to the birds, while the \"machine\" is suggested by the hand crank. The two elements are, literally, a fusing of the natural with the industrial world. Each bird stands with beak open, poised as if to announce the moment when the misty cool blue of night gives way to the pink glow of dawn. The scene evokes an abbreviated pastoral—but the birds are shackled to their perch, which is in turn connected to the hand crank.\r\nUpon closer inspection, however, an uneasy sensation of looming menace begins to manifest itself. Composed of a wiry, nervous line, these creatures bear a resemblance to birds only in their beaks and feathered silhouettes; they appear closer to deformations of nature. The hand crank conjures up the idea that this \"machine\" is a music box, where the birds function as bait to lure victims to the pit over which the machine hovers. We can imagine the fiendish cacophony made by the shrieking birds, their legs drawn thin and taut as they strain against the machine to which they are fused.', 'The \"twittering\" in the title doubtless refers to the birds, while the \"machine\" is suggested by the hand crank. The two elements are, literally, a fusing of the natural with the industrial world.', 1922, 64, 48, 'Watercolor and ink; oil transfer on paper with gouache and ink borders on cardboard', '600.0000', '800.0000', NULL, NULL, 'http://www.moma.org/collection/object.php?object_id=37347'),
(231, 63, 20, '063010', 'Dream', 2, 'http://www.moma.org/collection/works/79277?locale=en', '252.1954', '&copy; Art Resource', 'Although Rousseau completed more than twenty-five jungle paintings in his career, he never traveled outside France. He instead drew on images of the exotic as it was presented to the urban dweller through popular literature, colonial expositions, and the Paris Zoo. The lush jungle, wild animals, and mysterious horn player featured in this work were inspired by Rousseau\'s visits to the city\'s natural history museum and Jardin des plantes (a combined zoo and botanical garden). Of his visits the artist said, \"When I am in these hothouses and see the strange plants from exotic lands, it seems to me that I am entering a dream.\" The nude model in this painting reclines on a sofa, mixing the domestic and the exotic.', 'Although Rousseau completed more than twenty-five jungle paintings in his career, he never traveled outside France. He instead drew on images of the exotic as it was presented to the urban dweller through popular literature, colonial expositions, and the Paris Zoo.', 1910, 204, 298, 'Oil on canvas', '830.0000', '975.0000', 'http://www.googleartproject.com/museums/moma/the-dream-32', NULL, 'http://www.moma.org/collection/browse_results.php?object_id=79277'),
(232, 63, 20, '063020', 'Sleeping Gypsy', 2, 'http://www.moma.org/collection/works/80172?locale=en', '646.1939', '&copy; Art Resource', 'Rousseau described the subject of <em>The Sleeping Gypsy</em>: “A wandering Negress, a mandolin player, lies with her jar beside her (a vase with drinking water), overcome by fatigue in a deep sleep. A lion chances to pass by, picks up her scent yet does not devour her. There is a moonlight effect, very poetic.” A toll collector for the city of Paris, Rousseau was a largely self-taught painter, although he had ambitions of entering the Academy. This goal was never realized, but his sharp colors, fantastic imagery, and precise outlines—derived from the style and subject matter of popular print culture— struck a chord with a younger generation of avant-garde painters, including Pablo Picasso, Vasily Kandinsky, and Frida Kahlo.', 'Rousseau described the subject of <em>The Sleeping Gypsy</em>: “A wandering Negress, a mandolin player, lies with her jar beside her (a vase with drinking water), overcome by fatigue in a deep sleep. A lion chances to pass by, picks up her scent yet does not devour her.', 1897, 130, 201, 'Oil on canvas', '750.0000', '950.0000', 'http://www.googleartproject.com/museums/moma/the-sleeping-gypsy-24', NULL, 'http://www.moma.org/collection/browse_results.php?object_id=80172'),
(233, 64, 20, '064010', 'Birthday', 2, 'http://www.moma.org/collection/works/79360?locale=en', '275.1949', '&copy; Art Resource', NULL, NULL, 1915, 80, 100, 'Oil on cardboard', '460.0000', '550.0000', NULL, NULL, NULL),
(235, 64, 20, '064030', 'I and the Village', 1, 'http://www.moma.org/collection/works/78984?locale=en', '146.1945', 'Artists Rights Society', 'Painted the year after Chagall came to Paris, I and the Village evokes his memories of his native Hasidic community outside Vitebsk. In the village, peasants and animals lived side by side, in a mutual dependence here signified by the line from peasant to cow, connecting their eyes. The peasant\'s flowering sprig, symbolically a tree of life, is the reward of their partnership. For Hasids, animals were also humanity\'s link to the universe, and the painting\'s large circular forms suggest the orbiting sun, moon (in eclipse at the lower left), and earth.', 'Painted the year after Chagall came to Paris, I and the Village evokes his memories of his native Hasidic community outside Vitebsk.', 1911, 192, 151, 'Oil on canvas', '800.0000', '900.0000', NULL, NULL, NULL),
(258, 73, 17, '073010', 'Composition with Yellow, Blue and Red', 3, 'http://www.tate.org.uk/art/artworks/mondrian-composition-with-yellow-blue-and-red-t00648', 'T00648', 'Creative Commons CC-BY-NC-ND 3.0', 'Mondrian’s interest lay in the abstract quality of line but by 1914 he had all but eliminated the curved line from his work. By 1916 he had suppressed any sense of a subject. Still later he developed a new form of rigorous abstraction called Neo-Plasticism in which he limited himself to straight, horizontal and vertical lines and basic primary colours. Typically his compositions were not symmetrical but could scarcely be purer in their elements. He felt this art reflected a greater, universal truth beyond everyday appearance.', 'Mondrian’s interest lay in the abstract quality of line but by 1914 he had all but eliminated the curved line from his work.', 1937, 72, 69, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(259, 73, 20, '073020', 'Broadway Boogie Woogie', 3, 'http://www.moma.org/collection/works/78682?locale=en', '73.1943', '&copy; Art Resource', 'Mondrian, who had escaped to New York from Europe after the outbreak of World War II, delighted in the city\'s architecture. He was also fascinated by American jazz, particularly boogie-woogie, finding its syncopated beat, irreverent approach to melody, and improvisational aesthetic akin to what he called, in his own work, the \"destruction of natural appearance; and construction through continuous opposition of pure means—dynamic rhythm.\" In this painting, his penultimate, Mondrian replaced the black grid that had long governed his canvases with predominantly yellow lines that intersect at points marked by squares of blue and red. These atomized bands of stuttering chromatic pulses, interrupted by light gray, create paths across the canvas suggesting the city\'s grid, the movement of traffic, and blinking electric lights, as well as the rhythms of jazz.', 'These atomized bands of stuttering chromatic pulses, interrupted by light gray, create paths across the canvas suggesting the city\'s grid, the movement of traffic, and blinking electric lights, as well as the rhythms of jazz.', 1942, 127, 127, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(287, 12, 19, '012020', 'Olympia', 2, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/olympia-7087.html', 'RF 644', '&copy; Home', 'As he had in <em>Luncheon on the Grass</em>, Manet again paraphrased a respected work by a Renaissance artist in the painting <em>Olympia</em> (1863), a nude portrayed in a style reminiscent of early studio photographs, but whose pose was based on Titian\'s <em>Venus of Urbino</em> (1538). The painting is also reminiscent of Francisco Goya\'s painting, <em>The Nude Maja</em> (1800).\r\nManet embarked on the canvas after being challenged to give the Salon a nude painting to display. His uniquely frank depiction of a self-assured prostitute was accepted by the Paris Salon in 1865, where it created a scandal. According to Antonin Proust, \"only the precautions taken by the administration prevented the painting being punctured and torn\" by offended viewers. The painting was controversial partly because the nude is wearing some small items of clothing such as an orchid in her hair, a bracelet, a ribbon around her neck, and mule slippers, all of which accentuated her nakedness, sexuality, and comfortable courtesan lifestyle. The orchid, upswept hair, black cat, and bouquet of flowers were all recognized symbols of sexuality at the time. This modern Venus\' body is thin, counter to prevailing standards; the painting\'s lack of idealism rankled viewers. The painting\'s flatness, inspired by Japanese wood block art, serves to make the nude more human and less voluptuous. A fully dressed black servant is featured, exploiting the then-current theory that black people were hyper-sexed. That she is wearing the clothing of a servant to a courtesan here, furthers the sexual tension of the piece.\r\nOlympia\'s body as well as her gaze is unabashedly confrontational. She defiantly looks out as her servant offers flowers from one of her male suitors. Although her hand rests on her leg, hiding her pubic area, the reference to traditional female virtue is ironic; a notion of modesty is notoriously absent in this work. A contemporary critic denounced Olympia\'s \"shamelessly flexed\" left hand, which seemed to him a mockery of the relaxed, shielding hand of Titian\'s Venus.Likewise, the alert black cat at the foot of the bed strikes a sexually rebellious note in contrast to that of the sleeping dog in Titian\'s portrayal of the goddess in his Venus of Urbino.', 'As he had in <em>Luncheon on the Grass</em>, Manet again paraphrased a respected work by a Renaissance artist in the painting <em>Olympia</em> (1863), a nude portrayed in a style reminiscent of early studio photographs, but whose pose was based on Titian\'s <em>Venus of Urbino</em> (1538).', 1863, 130, 190, 'Oil on canvas', '1175.0000', '1225.0000', 'https://www.google.com/culturalinstitute/beta/asset/olympia/ywFEI4rxgCSO1Q', 'With Olympia, Manet reworked the traditional theme of the female nude, using a strong, uncompromising technique. Both the subject matter and its depiction explain the scandal caused by this painting at the 1865 Salon.\r\n\r\nEven though Manet quoted numerous formal and iconographic references, such as Titian\'s Venus of Urbino, Goya\'s Maja desnuda, and the theme of the odalisque with her black slave, already handled by Ingres among others, the picture portrays the cold and prosaic reality of a truly contemporary subject.', 'http://en.wikipedia.org/wiki/Olympia_(Manet)'),
(288, 12, 5, '012050', 'Music in the Tuileries Gardens', 2, 'https://www.nationalgallery.org.uk/paintings/edouard-manet-music-in-the-tuileries-gardens', 'NG3260', 'Creative Commons BY-NC-ND 4.0', 'It is an early example of Manet\'s painterly style, inspired by Frans Hals and Diego Velázquez, and it is a harbinger of his life-long interest in the subject of leisure.', 'It is an early example of Manet\'s painterly style, inspired by Frans Hals and Diego Velázquez, and it is a harbinger of his life-long interest in the subject of leisure.', 1862, 76, 118, 'Oil on canvas', '300.0000', '350.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Music_in_the_Tuileries'),
(290, 12, 19, '012030', 'Balcony', 1, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/le-balcon-7121.html', 'RF 2772', '&copy; Home', NULL, NULL, 1868, 170, 124, 'Oil on canvas', '1175.0000', '1225.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-balcony/ggFK0UgXAd7OCA', 'When Manet painted this piece, scenes of bourgeois life were in vogue. Yet The Balcony went against the conventions of the day. All the subjects were close acquaintances of the artist, especially Berthe Morisot who here, pictured sitting in the foreground, makes her first appearance in Manet\'s work, and who went on to become one of his favourite models. The painting tells no story or anecdote; the protagonists are frozen, as if isolated in an interior dream, evidence that Manet was freeing himself from academic constraints, despite the obvious reference to Goya\'s Majas at the Balcony.', 'https://commons.wikimedia.org/wiki/File:Edouard_Manet_-_The_Balcony_-_Google_Art_Project.jpg'),
(291, 12, 7, '012040', 'Railroad', 3, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.43624.html', '1956.10.1', 'Open Access', '<em>The Railway</em>, widely known as <em>The Gare Saint-Lazare</em>, was painted in 1873. The setting is the urban landscape of Paris in the late 19th century. Using his favorite model in his last painting of her, a fellow painter, Victorine Meurent, also the model for <em>Olympia</em> and the <em>Luncheon on the Grass</em>, sits before an iron fence holding a sleeping puppy and an open book in her lap. Next to her is a little girl with her back to the painter, who watches a train pass beneath them.\r\nInstead of choosing the traditional natural view as background for an outdoor scene, Manet opts for the iron grating which \"boldly stretches across the canvas\". The only evidence of the train is its white cloud of steam. In the distance, modern apartment buildings are seen. This arrangement compresses the foreground into a narrow focus. The traditional convention of deep space is ignored.', '<em>The Railway</em>, widely known as <em>The Gare Saint-Lazare</em>, was painted in 1873. The setting is the urban landscape of Paris in the late 19th century. Using his favorite model in his last painting of her, a fellow painter, Victorine Meurent, also the model for <em>Olympia</em> and the <em>Luncheon on the Grass</em>, sits before an iron fence holding a sleeping puppy and an open book in her lap.', 1872, 93, 112, 'Oil on canvas', '725.0000', '860.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-railway/kAHNAxL76AyLUA', 'The Gare Saint–Lazare, in 1873 the largest and busiest train station in Paris, is unseen in this painting. Advances in industrial technology and train travel, intrinsic to most contemporary depictions of the site, remain in Manet\'s painting the almost invisible background for a genre depiction of a woman and child. Confined to a narrow space backed by the black bars of an iron fence and isolated by clouds of steam sent up from a train passing below, Manet\'s two models are enigmatic presences. The woman is Victorine Meurent, Manet\'s favorite model in the 1860s, and the child was the daughter of a fellow painter who allowed Manet to use his garden to create The Railway. The composition is a complex contrapuntal apposition of the two figures: one clad in a white dress trimmed with a blue bow and the other dressed in dark blue trimmed with white; one with hair bound by a narrow black ribbon and the other with flowing tresses under a black hat; and one a child standing and looking at anonymous trains and buildings in the background and the other a seated adult staring forward to confront viewers directly.', NULL),
(294, 20, 5, '020010', 'Bathing At Asnieres', 2, 'https://www.nationalgallery.org.uk/paintings/georges-seurat-bathers-at-asnieres', 'NG3908', 'Creative Commons BY-NC-ND 4.0', '<em>Bathers at Asnières</em> (French: <em>Une Baignade, Asnières</em>) is an oil-on-canvas painting by the French artist Georges-Pierre Seurat, the first of his two masterpieces on the monumental scale. Seurat borrowed from sources such as those of the fresco painters of the 15th century, the French classicism of Nicolas Poussin, and of contemporary Impressionism to create a unified canvas of a suburban, but placid Parisian riverside scene. The isolated figures and their clothes piled sculpturally on the riverbank, together with the trees, and austere boundary walls and buildings, are presented in a formal layout. A combination of complex brushstroke techniques, and a meticulous application of contemporary colour theory bring to the composition a sense of gentle vibrancy and timelessness.\r\nSeurat was twenty-four years old when he painted <em>Bathers at Asnières</em>, and he was to live for just another seven years. The Bathers puzzled many of Seurat’s contemporaries, and the picture was not widely acclaimed during his lifetime. An appreciation of it grew, however, during the twentieth century, and today it hangs in the National Gallery, London, where it is considered one of the highlights of the gallery’s collection of paintings.', '<em>Bathers at Asnières</em> (French: <em>Une Baignade, Asnières</em>) is an oil-on-canvas painting by the French artist Georges-Pierre Seurat, the first of his two masterpieces on the monumental scale. Seurat borrowed from sources such as those of the fresco painters of the 15th century, the French classicism of Nicolas Poussin, and of contemporary Impressionism to create a unified canvas of a suburban, but placid Parisian riverside scene.', 1883, 201, 300, 'Oil on canvas', '825.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Bathers_at_Asni%C3%A8res'),
(296, 20, 6, '020050', 'Circus Sideshow (Parade de cirque)', 2, 'http://www.metmuseum.org/art/collection/search/437654', '61.101.17', 'Open Access for Scholarly Content', 'At the Salon des Indépendants in 1888 Seurat demonstrated the versatility of his technique by exhibiting Circus Sideshow, a nighttime outdoor scene in artificial light, and Models, an indoor, daylight scene (Barnes Foundation, Philadelphia). This is Seurat’s first nocturnal painting and his first depiction of popular entertainment. It represents the parade, or sideshow, of the Circus Corvi, which had set up near the place de la Nation in Paris in the spring of 1887. Sideshows were held on the street, for free, to entice passersby to purchase tickets. The onlookers at the far right are queued on stairs leading to the box office.q', 'At the Salon des Indépendants in 1888 Seurat demonstrated the versatility of his technique by exhibiting Circus Sideshow, a nighttime outdoor scene in artificial light, and Models, an indoor, daylight scene', 1888, 100, 156, 'Oil on canvas', '605.0000', '845.0000', NULL, NULL, NULL),
(299, 21, 6, '021030', 'Portrait of Uncle Dominique, as a Monk', 1, 'http://www.metmuseum.org/art/collection/search/435869', '1993.400.1', 'Open Access for Scholarly Content', 'In the fall of 1866 Cézanne painted nine portraits of his maternal uncle, Dominique Aubert. The forty-nine-year-old bailiff indulged his nephew with multiple sittings and agreed to pose in various costumes. Whereas he is shown here in the habit of a Dominican monk, in another likeness of this date, also in the Metropolitan\'s collection, he wears a tassled cap and robe.', 'In the fall of 1866 Cézanne painted nine portraits of his maternal uncle, Dominique Aubert. The forty-nine-year-old bailiff indulged his nephew with multiple sittings and agreed to pose in various costumes.', 1866, 65, 55, 'Oil on canvas', '250.0000', '280.0000', NULL, NULL, 'http://www.metmuseum.org/collections/search-the-collections/110000302'),
(300, 21, 11, '021040', 'The Basket of Apples', 3, 'http://www.artic.edu/aic/collections/artwork/111436', NULL, 'Rights-Managed (RM)', '<em>The Basket of Apples</em> is a still life oil painting noted for its disjointed perspective. It has been described as a balanced composition due to its unbalanced parts; the tilted bottle, the incline of the basket, and the foreshortened lines of the cookies meshing with the lines of the tablecloth. Additionally, the right side of the tabletop is not in the same plane as the left side, as if the image simultaneously reflects two viewpoints. Paintings such as this helped form a bridge between Impressionism and Cubism.', '<em>The Basket of Apples</em> is a still life oil painting noted for its disjointed perspective. It has been described as a balanced composition due to its unbalanced parts; the tilted bottle, the incline of the basket, and the foreshortened lines of the cookies meshing with the lines of the tablecloth.', 1895, 65, 80, 'Oil on canvas', '800.0000', '1050.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Basket_of_Apples'),
(301, 21, 13, '021050', 'Large Bathers', 3, 'http://www.philamuseum.org/collections/permanent/104464.html', 'W1937-1-1', 'Public Domain', '<em>The Large Bathers</em> (French: <em>Les Grandes Baigneuses</em>) is an oil painting by French artist Paul Cézanne first exhibited in 1906. The painting is the largest of a series of \"Bather\" paintings by Cézanne; the others are in the Museum of Modern Art in New York City and the National Gallery, London. Occasionally referred to as the Big Bathers or Large Bathers to distinguish it from the smaller works, the painting is considered one of the masterpieces of modern art, and is often considered Cézanne\'s finest work. Cézanne worked on the painting for seven years, and it remained unfinished at the time of his death in 1906. The painting was purchased in 1937 for $110,000 with funds from a trust fund for the Philadelphia Museum of Art by their major benefactor Joseph E. Widener. It was previously owned by Leo Stein.\r\nThe abstract nude females present in <em>Large Bathers</em> give the painting tension and density. It is exceptional among his work in symmetrical dimensions, with the adaption of the nude forms to the triangular pattern of the trees and river. Using the same technique as employed in painting landscapes and still lifes, <em>Large Bathers</em> is reminiscent of the work of Titian and Peter Paul Rubens. Comparisons are also often made with the other famous group of nude women of the same period, Picasso\'s <em>Les Demoiselles d\'Avignon</em>.', '<em>The Large Bathers</em> (French: <em>Les Grandes Baigneuses</em>) is an oil painting by French artist Paul Cézanne first exhibited in 1906. The painting is the largest of a series of \"Bather\" paintings by Cézanne.', 1899, 208, 249, 'Oil on canvas', '300.0000', '375.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Bathers_(C%C3%A9zanne)'),
(310, 16, 7, '016060', 'Girl Arranging Her Hair', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.46572.html', '1963.10.97', 'Open Access', 'It was Edgar Degas who invited Cassatt to participate in the impressionist exhibitions, and the two remained close associates. Degas respected Cassatt\'s work, seeing in her careful compositions an approach to art that was deliberate and well thought out. Degas was known for his sharp criticism of other artists\' work. He once complained to Cassatt: \"What do women know about style?\" She took his words as a challenge to produce a work whose appeal derived, not from a conventionally pretty subject, but purely from artifice, the painter\'s skill, and style. This painting is the result.', 'The beauty of the picture comes from the rigor of the composition and its harmonized contrast of pinks and blues—in the sitter\'s nightdress, in the background, and even in her skin.', 1886, 75, 62, 'Oil on canvas', '485.0000', '745.0000', NULL, NULL, NULL),
(333, 85, 13, '085020', 'Male and Female', 1, 'http://www.philamuseum.org/collections/permanent/69527.html?mulR=774362296|1', '1974-232-1', 'Pollock-Krasner Foundation / Artists Rights Society', 'In November 1943 this painting was included in Jackson Pollock\'s stunning solo exhibition at Art of This Century, the innovative New York art gallery run by legendary art patron Peggy Guggenheim. As its title suggests, the work depicts a male figure, embodied in the black columnar form at right, with its mysterious arithmetic graffiti, and a curvy female figure at left, with marvelous catlike eyelashes. Standing on tiny triangular feet, both figures are surrounded by splashed and smeared oil paint that enhances the sense of energy inherent in the two vertical forms, while also foreshadowing the famous \"drip\" technique that Pollock would develop later that decade.', 'As its title suggests, the work depicts a male figure, embodied in the black columnar form at right, with its mysterious arithmetic graffiti, and a curvy female figure at left, with marvelous catlike eyelashes.', 1942, 186, 124, 'Oil on canvas', '550.0000', '700.0000', NULL, NULL, NULL),
(334, 85, 20, '085030', 'Number 1A', 2, 'http://www.moma.org/collection/works/78699?locale=en', '77.1950', 'Pollock-Krasner Foundation / Artists Rights Society', 'While the style of \"drip\" painting has become synonymous with the name Jackson Pollock, here the artist has autographed the work even more directly, with several handprints found at the composition\'s upper right. Around this time Pollock stopped giving his paintings evocative titles and began instead to number them. His wife, artist Lee Krasner, later explained, \"Numbers are neutral. They make people look at a painting for what it is—pure painting.\" Collectors did not immediately appreciate Pollock\'s radical new style, and when first exhibited, in 1949 (then titled Number 1, 1948), this painting remained unsold.', 'While the style of \"drip\" painting has become synonymous with the name Jackson Pollock, here the artist has autographed the work even more directly, with several handprints found at the composition\'s upper right.', 1948, 173, 264, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(339, 14, 19, '014010', 'Dance at Le Moulin de la Galette', 2, 'http://www.musee-orsay.fr/en/collections/works-in-focus/search/commentaire/commentaire_id/bal-du-moulin-de-la-galette-7083.html', 'RF 2739', '&copy; Home', '<em>Dance at Moulin de la Galette</em> is one of Impressionism’s most highly revered masterpieces. The scene is of a Sunday afternoon at Moulin de la Galette, where Parisians would typically dress up and spend all day dancing, drinking, and eating galettes, or flat cakes. The painting was in the collection of Gustave Caillebotte, but it was claimed by the French government upon his death due to the non payment of death duties. It was later transferred from the Luxembourg Museum, to the Louvre, and then later to the Musee d’Orsay. Its sale price at auction in 2009 was the fifth highest price ever paid for a painting at auction.', '<em>Dance at Moulin de la Galette</em> is one of Impressionism’s most highly revered masterpieces. The scene is of a Sunday afternoon at Moulin de la Galette, where Parisians would typically dress up and spend all day dancing, drinking, and eating galettes, or flat cakes.', 1876, 131, 175, 'Oil on canvas', '400.0000', '550.0000', 'https://www.google.com/culturalinstitute/beta/asset/dance-at-le-moulin-de-la-galette/rQEx7CtGiKE3yg', 'This painting is doubtless Renoir\'s most important work of the mid 1870\'s and was shown at the Impressionist exhibition in 1877. Though some of his friends appear in the picture, Renoir\'s main aim was to convey the vivacious and joyful atmosphere of this popular dance garden on the Butte Montmartre. The study of the moving crowd, bathed in natural and artificial light, is handled using vibrant, brightly coloured brushstrokes. The somewhat blurred impression of the scene prompted negative reactions from contemporary critics.', 'http://en.wikipedia.org/wiki/Bal_du_moulin_de_la_Galette'),
(342, 2, 37, '002070', 'The Red Madras Headdress', 1, 'http://www.barnesfoundation.org/collections/art-collection/object/6365/red-madras-headdress-le-madras-rouge', 'BF448', '&copy; The Barnes Foundation', '<em>Madras Rouge</em> (<em>The Red Madras Headress</em>) is a painting by Henri Matisse from 1907. The woman depicted is the painter\'s wife, Amélie Noellie Parayre Matisse.', '<em>Madras Rouge</em> (<em>The Red Madras Headress</em>) is a painting by Henri Matisse from 1907. The woman depicted is the painter\'s wife, Amélie Noellie Parayre Matisse.', 1907, 99, 80, 'Oil on canvas', '850.0000', '1000.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Madras_Rouge'),
(343, 2, 24, '002080', 'Dance (II)', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28411/?lng=en', '9673', 'Personal non-commercial use', 'There are two versions of <em>The Dance</em>, the first, painted in March of 1909, is the study for the second one, completed in 1910. The large work, painted along the lines of William Blake’s painting <em>Oberon, Titania and Puck with Fairies Dancing</em>, was painted along with its companion piece, Music, which depicts nudes playing music in a similar setting. The pieces were specially created for Russian businessman and art collector Sergei Shchukin, who was a long-time associate of Matisse’s. This painting is often recognized as a key point in the development of Matisse’s artwork, as well as in the development of modern painting. It is also often associated with “Dance of the Young Girls,” in <em>The Rite of Spring</em> by Igor Stravinsky.', 'There are two versions of <em>The Dance</em>, the first, painted in March of 1909, is the study for the second one, completed in 1910. The large work, painted along the lines of William Blake’s painting <em>Oberon, Titania and Puck with Fairies Dancing</em>, was painted along with its companion piece, Music, which depicts nudes playing music in a similar setting.', 1910, 260, 391, 'Oil on canvas', '1450.0000', '1800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Dance_(Matisse)'),
(346, 5, 6, '005040', 'The Death of Socrates', 2, 'http://www.metmuseum.org/art/collection/search/436105', '31.45', 'Open Access for Scholarly Content', 'The Death of Socrates  is an oil on canvas painted by French painter Jacques-Louis David in 1787. The painting focuses on a classical subject like many of his works from that decade, in this case the story of the execution of Socrates as told by Plato in his Phaedo. In this story, Socrates has been convicted of corrupting the youth of Athens and introducing strange gods, and has been sentenced to die by drinking poison hemlock. Socrates uses his death as a final lesson for his pupils rather than fleeing when the opportunity arises, and faces it calmly. The Phaedo depicts the death of Socrates and is also Plato\'s fourth and last dialogue to detail the philosopher\'s final days, which is also detailed in Euthyphro, Apology, and Crito.', 'The painting focuses on a classical subject like many of his works from that decade, in this case the story of the execution of Socrates as told by Plato in his Phaedo.', 1787, 196, 129, 'Oil on canvas', '1500.0000', '1800.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-death-of-socrates/sAGm14MzWjaN9Q', 'Accused by the Athenian government of denying the gods and corrupting the young through his teachings, Socrates (469–399 B.C.) was offered the choice of renouncing his beliefs or dying by drinking a cup of hemlock. David shows him prepared to die and discoursing on the immortality of the soul with his grief-stricken disciples.', 'https://en.wikipedia.org/wiki/The_Death_of_Socrates'),
(347, 5, 22, '005050', 'Napoleon Crossing the Alps', 1, 'http://digital.belvedere.at/objects/7889/napoleon-am-groen-st-bernhard', '2089', 'Private use', '<em>Napoleon Crossing the Alps</em> (also known as <em>Napoleon at the Saint-Bernard Pass</em> or <em>Bonaparte Crossing the Alps</em>) is the title given to the five versions of an oil on canvas equestrian portrait of Napoleon Bonaparte painted by the French artist Jacques-Louis David between 1801 and 1805. Initially commissioned by the king of Spain, the composition shows a strongly idealized view of the real crossing that Napoleon and his army made across the Alps through the Great St. Bernard Pass in May 1800.', '<em>Napoleon Crossing the Alps</em> (also known as <em>Napoleon at the Saint-Bernard Pass</em> or <em>Bonaparte Crossing the Alps</em>) is the title given to the five versions of an oil on canvas equestrian portrait of Napoleon Bonaparte painted by the French artist Jacques-Louis David between 1801 and 1805.', 1800, 261, 221, 'Oil on canvas', '600.0000', '950.0000', 'https://www.google.com/culturalinstitute/beta/asset/bonaparte-crossing-the-grand-saint-bernard-pass-20-may-1800/QwEFHqZhgW6ulw', NULL, 'http://en.wikipedia.org/wiki/Napoleon_at_the_Saint-Bernard_Pass'),
(348, 5, 16, '005060', 'The Coronation of Napoleon', 2, 'http://www.louvre.fr/en/oeuvre-notices/consecration-emperor-napoleon-and-coronation-empress-josephine-december-2-1804', 'INV. 3699', '&copy; Musée du Louvre', '<em>The Coronation of Napoleon</em> (French: <em>Le Sacre de Napoléon</em>) is a painting completed in 1807 by Jacques-Louis David, the official painter of Napoleon. The painting has imposing dimensions, as it is almost ten metres wide by approximately six metres tall. The crowning and the coronation took place at Notre-Dame de Paris, a way for Napoleon to make it clear that he was a son of the Revolution.', '<em>The Coronation of Napoleon</em> (French: <em>Le Sacre de Napoléon</em>) is a painting completed in 1807 by Jacques-Louis David, the official painter of Napoleon. The painting has imposing dimensions, as it is almost ten metres wide by approximately six metres tall.', 1805, 621, 979, 'Oil on canvas', '800.0000', '1200.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Coronation_of_Napoleon');
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(349, 18, 6, '018090', 'Two Tahitian Women', 1, 'http://www.metmuseum.org/art/collection/search/436446', '49.58.1', 'Open Access for Scholarly Content', 'The painting depicts two topless women, one holding mango blossoms, on the Pacific Island of Tahiti. Currently, the painting is housed at the National Gallery of Art, on loan from the Metropolitan Museum of Art in New York.\r\nAlthough Tahiti is depicted as an innocent paradise, the two women in the painting confront the viewer in a way similar to that in Manet\'s <em>Le déjeuner sur l\'herbe</em> (1863) or <em>Olympia </em>(1863), and follow an artistic tradition of comparing woman\'s breasts to flowers or fruit. The women in the painting also appear in two other works by Gauguin, <em>Faa Iheihe</em> (Tahitian Pastoral) (1898) and <em>Rupe, Rupe</em> (1899).', 'The painting depicts two topless women, one holding mango blossoms, on the Pacific Island of Tahiti. Currently, the painting is housed at the National Gallery of Art, on loan from the Metropolitan Museum of Art in New York.', 1899, 94, 72, 'Oil on canvas', '340.0000', '400.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Two_Tahitian_Women'),
(351, 19, 49, '019110', 'Postman Joseph Roulin', 1, 'http://www.mfa.org/collections/object/postman-joseph-roulin-32542', '35.1982', 'Public domain', 'The Roulin Family is group of portrait paintings Vincent van Gogh executed in Arles in 1888 and 1889 on Joseph, his wife Augustine and their three children: Armand, Camille and Marcelle. This series is unique in many ways. Although Van Gogh loved to paint portraits, it was difficult for financial and other reasons for him to find models. So, finding an entire family that agreed to sit for paintings, in fact for several sittings each was a bounty.\r\nJoseph Roulin became a particularly good, loyal and supporting friend to Van Gogh during his stay in Arles. To represent a man he truly admired was important to him. The family, with children ranging in age from four months to seventeen years, also gave him the opportunity to produces works of individuals in several different stages of life.\r\nRather than making photographic-like works, Van Gogh used his imagination, colors and themes artistically and creatively to evoke desired emotions from the audience.', 'The Roulin Family is group of portrait paintings Vincent van Gogh executed in Arles in 1888 and 1889 on Joseph, his wife Augustine and their three children: Armand, Camille and Marcelle.', 1888, 81, 65, 'Oil on canvas', '350.0000', '420.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Roulin_Family_(Van_Gogh_series)'),
(352, 19, 29, '019120', 'The Sower', 3, 'https://www.vangoghmuseum.nl/en/collection/s0029V1962', 's0029V1962', 'Non commercial use', NULL, NULL, 1888, 40, 32, 'Oil on canvas', '350.0000', '400.0000', NULL, NULL, NULL),
(366, 92, 4, '092010', 'Madonna and Child', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1598', 'Public domain', '<em>Madonna with Child</em> is a painting by the Italian Renaissance artist Filippo Lippi, executed around 1465. It is one of the few works by Lippi which was not executed with the help of his workshop and was an influential model for later depictions of the Madonna and Child, including those by Sandro Botticelli.', '<em>Madonna with Child</em> is a painting by the Italian Renaissance artist Filippo Lippi, executed around 1465. It is one of the few works by Lippi which was not executed with the help of his workshop and was an influential model for later depictions of the Madonna and Child, including those by Sandro Botticelli.', 1465, 95, 64, 'Tempera on panel', '500.0000', '600.0000', 'https://www.google.com/culturalinstitute/beta/asset/madonna-and-child-with-two-angels/9AE9qn4SE5pOPg', 'A famous example of the artist\'s maturity, this painting was transferred to the Uffizi in 1796 from the Villa of Poggio Imperiale. Thanks to the spontaneity and naturalness of the composition, it reaped great interest as an iconographic model for numerous artists including the young Botticelli, apprenticed to the friar Lippi. On the back of the panel there is an autograph charcoal sketch of a female figure.', 'http://en.wikipedia.org/wiki/Madonna_and_Child_(Fra_Lippo_Lippi)'),
(369, 92, 41, '092040', 'Adoration in the Forest', 3, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=864730&viewType=detailView', '69', 'Creative Commons Attribution-NonCommercial-ShareAlike 3.0', '<em>Adoration in the Forest</em> is a painting completed before 1459 by the Carmelite friar, Filippo Lippi, of the Virgin Mary and the newly born Christ Child lying on the ground, in the unusual setting of a steep, dark, wooded wilderness. There are no shepherds, kings, ox, ass – there is no Joseph. It was painted for one of the wealthiest men in Renaissance Florence, the banker Cosimo de Medici. In later times it had a turbulent history. Hitler ordered it to be hidden in WW2 and it became part of the story of a mutiny in the U.S. Army.', '<em>Adoration in the Forest</em> is a painting completed before 1459 by the Carmelite friar, Filippo Lippi, of the Virgin Mary and the newly born Christ Child lying on the ground, in the unusual setting of a steep, dark, wooded wilderness.', 1459, 1185, 1295, 'Oil on wood', '1200.0000', '1600.0000', 'http://www.googleartproject.com/collection/gemaldegalerie-staatliche-museen-zu-berlin/artwork/the-adoration-in-the-forest-filippo-lippi/331331/', NULL, 'http://en.wikipedia.org/wiki/Adoration_in_the_Forest_(Lippi)'),
(370, 93, 5, '093010', 'Baptism of Christ', 1, 'https://www.nationalgallery.org.uk/paintings/piero-della-francesca-the-baptism-of-christ', 'NG665', 'Creative Commons BY-NC-ND 4.0', 'The <em>Baptism of Christ</em> was commissioned presumably some time about 1440 by the Camaldolese Monastery of Sansepolcro in Tuscany, originally part of a triptych. Its dating to Piero della Francesca\'s early career is evidenced by the strong relationship with the \"light painting\" of his master, Domenico Veneziano. It portrays Christ being baptised by John, his head surmounted by a dove representing the Holy Spirit. Christ, John\'s hand, the bird and the bowl form an axis which divides the painting in two symmetrical parts. A second division is created by the tree on the left, which instead divides it according to the golden ratio.', 'The <em>Baptism of Christ</em> was commissioned presumably some time about 1440 by the Camaldolese Monastery of Sansepolcro in Tuscany, originally part of a triptych. Its dating to Piero della Francesca\'s early career is evidenced by the strong relationship with the \"light painting\" of his master, Domenico Veneziano.', 1450, 167, 116, 'Tempera on panel', '900.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Baptism_of_Christ_(Piero_della_Francesca)'),
(373, 94, 81, '094010', 'Lamentation of Christ', 2, 'http://pinacotecabrera.org/collezione-online/opere/cristo-morto-nel-sepolcro-e-tre-dolenti/', '352', 'Public Domain', 'The <em>Lamentation of Christ</em> is a painting of about 1480 by the Italian Renaissance artist Andrea Mantegna. While the dating of the piece is debated, it was completed between 1475 and 1501, probably in the early 1480s. It portrays the body Christ supine on a marble slab. He is watched over by the Virgin Mary and Saint John whose cut-off profile is behind the Virgin Mary, who are weeping for his death.', 'The <em>Lamentation of Christ</em> is a painting of about 1480 by the Italian Renaissance artist Andrea Mantegna. While the dating of the piece is debated, it was completed between 1475 and 1501, probably in the early 1480s. It portrays the body Christ supine on a marble slab. He is watched over by the Virgin Mary and Saint John whose cut-off profile is behind the Virgin Mary, who are weeping for his death.', 1480, 68, 81, 'Tempera on canvas', '400.0000', '600.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Lamentation_over_the_Dead_Christ_(Mantegna)'),
(374, 94, 18, '094020', 'St. Sebastian', 5, 'https://www.khm.at/de/object/285f89b802/', '301', 'Only for private use', '<em>St. Sebastian</em> is the subject of three paintings by the Italian Early Renaissance master Andrea Mantegna. The Paduan artist lived in a period of frequent plagues; Sebastian was considered protector against the plague as having been shot through by arrows, and it was thought that plague spread abroad through the air.', '<em>St. Sebastian</em> is the subject of three paintings by the Italian Early Renaissance master Andrea Mantegna. The Paduan artist lived in a period of frequent plagues; Sebastian was considered protector against the plague as having been shot through by arrows, and it was thought that plague spread abroad through the air.', 1457, 300, 680, 'Oil on panel', '900.0000', '1200.0000', 'http://www.googleartproject.com/collection/kunsthistorisches-museum-vienna-museum-of-fine-arts/artwork/st-sebastian-andrea-mantegna/677761/', NULL, 'http://en.wikipedia.org/wiki/St._Sebastian_of_Vienna_(Mantegna)'),
(375, 94, 41, '094030', 'Presentation at the Temple', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=863431&viewType=detailView', '29', 'Creative Commons Attribution-NonCommercial-ShareAlike 3.0', 'The <em>Presentation at the Temple</em> is painting by the Italian Renaissance artist Andrea Mantegna. Dating to c. 1455, it is housed in the Gemäldegalerie, Berlin, Germany. The date of the painting is unknown, but it belongs to the painter\'s youth in Padua. Date ranges from 1453, when Mantegna married Nicolosia Bellini, daughter of painter Giovanni, and 1460 when he left for Mantua. Bellini\'s Presentation at the Temple, explicitly inspired by Mantegna\'s, dates to around the latter year.', 'The <em>Presentation at the Temple</em> is painting by the Italian Renaissance artist Andrea Mantegna. Dating to c. 1455, it is housed in the Gemäldegalerie, Berlin, Germany. The date of the painting is unknown, but it belongs to the painter\'s youth in Padua.', 1455, 69, 86, 'Tempera on canvas', '800.0000', '900.0000', 'http://www.googleartproject.com/collection/gemaldegalerie-staatliche-museen-zu-berlin/artwork/the-presentation-andrea-mantegna/329346/', NULL, 'http://en.wikipedia.org/wiki/Presentation_at_the_Temple_(Mantegna)'),
(376, 95, 4, '095010', 'Primavera', 2, 'http://www.uffizi.firenze.it/catalogo/', '1890, 8360', 'Public domain', '<em>Primavera</em>, also known as Allegory of Spring, is a tempera panel painting by Italian Renaissance artist Sandro Botticelli. Painted ca. 1482, the painting is described in Culture & Values (2009) as \"[o]ne of the most popular paintings in Western art\". It is also \"one of the most written about, and most controversial paintings in the world.\" While most critics agree that the painting, depicting a group of mythological figures in a garden, is allegorical for the lush growth of Spring, other meanings have also been explored. Among them, the work is sometimes cited as illustrating the ideal of Neoplatonic love. The painting itself carries no title and was first called La Primavera by the art historian Giorgio Vasari who saw it at Villa Castello, just outside Florence, in 1550.', '<em>Primavera</em>, also known as Allegory of Spring, is a tempera panel painting by Italian Renaissance artist Sandro Botticelli. Painted ca. 1482, the painting is described in Culture & Values (2009) as \"[o]ne of the most popular paintings in Western art\". It is also \"one of the most written about, and most controversial paintings in the world.\"', 1482, 202, 314, 'Tempera on panel', '900.0000', '1100.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/la-primavera-spring-botticelli-filipepi/331460/', 'Commissioned by Lorenzo and Giovanni di Pierfrancesco de\' Medici, cousins of Lorenzo il Magnifico, in 1498 this painting was in their florentine residence. Probably based on a theme suggested by Poliziano, it depicts a symbolic and allegorical subject with a complex interpretation: the Realm of Venus. Zephyr chases the nymph Chloris, who turns into the goddess Flora at right. Venus is underneath a blindfolded Cupid in flight with the three Graces and Mercury at left.', 'http://en.wikipedia.org/wiki/Primavera_(Painting)'),
(377, 95, 4, '095020', 'The Birth of Venus', 2, 'http://www.uffizi.firenze.it/catalogo/', '1890, 878', 'Public domain', 'The <em>Birth of Venus</em> is a 1486 painting by Sandro Botticelli. Botticelli was commissioned to paint the work by the Medici family of Florence, specifically Lorenzo di Pierfrancesco de\' Medici under the influence of his cousin Lorenzo de\' Medici, close friend to Botticelli . It depicts the goddess Venus, having emerged from the sea as a fully grown woman, arriving at the sea-shore (which is related to the Venus Anadyomene motif).The painting is on display at the Uffizi Gallery in Florence, Italy.', 'The <em>Birth of Venus</em> is a 1486 painting by Sandro Botticelli. Botticelli was commissioned to paint the work by the Medici family of Florence, specifically Lorenzo di Pierfrancesco de\' Medici under the influence of his cousin Lorenzo de\' Medici, close friend to Botticelli . It depicts the goddess Venus, having emerged from the sea as a fully grown woman, arriving at the sea-shore (which is related to the Venus Anadyomene motif).The painting is on display at the Uffizi Gallery in Florence, Italy.', 1486, 172, 278, 'Tempera on canvas', '1200.0000', '1100.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/the-birth-of-venus-botticelli-sandro-botticelli/331474/', 'The painting was commissioned by Lorenzo di Pierfrancesco de’Medici, a cousin of Lorenzo the Magnificent. The theme was probably suggested by the humanist Poliziano. It depicts Venus born from the sea foam, blown by the west wind, Zephyr, and the nymph, Chloris, towards one of the Horai, who prepares to dress her with a flowered mantle.', 'http://en.wikipedia.org/wiki/The_Birth_of_Venus_(Botticelli)'),
(378, 95, 5, '095030', 'Venus and Mars', 4, 'https://www.nationalgallery.org.uk/paintings/sandro-botticelli-venus-and-mars', 'NG915', 'Creative Commons BY-NC-ND 4.0', '<em>Venus and Mars</em> is a c. 1483 painting by the Italian Renaissance master Sandro Botticelli. It shows the Roman gods Venus and Mars in an allegory of Beauty and Valour. Venus watches Mars sleep while two infant satyrs play carrying his armour as another rests under his arm. A fourth blows a small conch shell in his ear in an effort to wake him. The scene is set in a forest, and the background shows, in the distance, the sea from which Venus emerged. A swarm of wasps hover around Mars\' head, possibly as a symbol that love is often accompanied by pain. Another possible explanation is that the wasps represent the Vespucci family that may have commissioned the painting; the symbol of the Vespucci house is the wasp. The painting is thought originally to have been the back of a lettuccio, a wooden sofa.', '<em>Venus and Mars</em> is a c. 1483 painting by the Italian Renaissance master Sandro Botticelli. It shows the Roman gods Venus and Mars in an allegory of Beauty and Valour. Venus watches Mars sleep while two infant satyrs play carrying his armour as another rests under his arm. A fourth blows a small conch shell in his ear in an effort to wake him.', 1483, 69, 173, 'Tempera on panel', '900.0000', '1000.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Venus_and_Mars_(Botticelli)'),
(379, 95, 5, '095040', 'The Mystical Nativity', 1, 'https://www.nationalgallery.org.uk/paintings/sandro-botticelli-mystic-nativity', 'NG1034', 'Creative Commons BY-NC-ND 4.0', 'The <em>Mystical Nativity</em> is a painting of circa 1500–1501 by the Italian Renaissance master Sandro Botticelli, in the National Gallery in London. Botticelli built up the image using oil paint on canvas. It is his only signed work, and has a very unusual iconography for a Nativity. It has been suggested that the painting may be connected with the influence of Savonarola, whose influence appears in a number of late paintings by Botticelli, though the contents of the image may have been specified by the person commissioning it.', 'The <em>Mystical Nativity</em> is a painting of circa 1500–1501 by the Italian Renaissance master Sandro Botticelli, in the National Gallery in London. Botticelli built up the image using oil paint on canvas. It is his only signed work, and has a very unusual iconography for a Nativity.', 1500, 108, 75, 'Tempera on canvas', '1000.0000', '1075.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Mystical_Nativity'),
(380, 95, 4, '095050', 'Adoration of the Magi', 2, 'http://www.uffizi.firenze.it/catalogo/', '1890, 882', 'Public domain', 'The <em>Adoration of the Magi</em> is a painting by the Italian Renaissance master Sandro Botticelli, dating from 1475 or 1476. It is housed in the Uffizi of Florence. Botticelli was commissioned to paint at least seven versions of The Adoration of the Magi. The Adoration of the Magi theme was popular in the Renaissance Florence. The work was commissioned by Gaspare di Zanobi del Lama, a banker of humble origins and dubious morality connected to the House of Medici, for his chapel in the church of Santa Maria Novella (now destroyed). In the scene are present numerous characters among which are several members of the Medici family: Cosimo de\' Medici (the Magus kneeling in front of the Virgin, described by Vasari as \"the finest of all that are now extant for its life and vigour\"), his sons Piero (the second Magus kneeling in the centre with the red mantle) and Giovanni (the third Magus), and his grandsons Giuliano and Lorenzo. The three Medici portrayed as Magi were all dead at the time the picture was painted, and Florence was effectively ruled by Lorenzo.', 'The <em>Adoration of the Magi</em> is a painting by the Italian Renaissance master Sandro Botticelli, dating from 1475 or 1476. It is housed in the Uffizi of Florence. Botticelli was commissioned to paint at least seven versions of The Adoration of the Magi.', 1475, 111, 134, 'Tempera on panel', '800.0000', '600.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/adoration-of-the-magi-botticelli-filipepi/324472/', 'Commissioned by merchant broker of the Money Changing Guild, Guasparre di Zanobi del Lama for his chapel in Santa Maria Novella in Florence, this small panel depicts Cosimo the Elder and his sons Giovanni and Piero as the Magi, with Lorenzo il Magnifico and his brother Giuliano looking on. Facing the observer, we recognize the artist in a yellow cloak and the patron in a blue robe wearing white gloves.', 'http://en.wikipedia.org/wiki/Adoration_of_the_Magi_of_1475_(Botticelli)'),
(381, 96, 38, '096010', 'Delivery of the Keys', 2, 'http://mv.vatican.va/3_EN/pages/x-Schede/CSNs/CSNs_N_StCristo_05.html', NULL, NULL, 'The <em>Delivery of the Keys</em>, or Christ Giving the Keys to St. Peter is a fresco by the Italian Renaissance painter Pietro Perugino, executed in 1481-1482 and located in the Sistine Chapel, Rome. The scene, part of the series of the Stories of Jesus on the chapel\'s northern wall, is a reference to Matthew 16 in which the \"keys of the kingdom of heaven\" are given to St.Peter. These keys represent the power to forgive and to share the word of God thereby giving them the power to allow others into heaven.', 'The <em>Delivery of the Keys</em>, or Christ Giving the Keys to St. Peter is a fresco by the Italian Renaissance painter Pietro Perugino, executed in 1481-1482 and located in the Sistine Chapel, Rome.', 1481, 330, 550, 'Fresco', '900.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Delivery_of_the_Keys_(Perugino)'),
(383, 96, 4, '096030', 'Portrait of Francesco delle Opere', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1700', 'Public domain', 'The <em>Portrait of Francesco delle Opere</em> is a painting by the Italian Renaissance artist Perugino, dating to 1494 and housed in the Uffizi Gallery, Florence. Francesco delle Opere is portrayed from three-quarters, with a black beret and a mantle of the same color, a red blouse under which is a white shirt. His hand holds a cartouche with the words Timete Devm (\"Beware of God\"), the beginning of a famous preaching by Girolamo Savonarola. The hands lie on an invisible parapet which coincides with the painting\'s lower border, as in Flemish contemporary works such as Hans Memling\'s Man with a Letter.', 'The <em>Portrait of Francesco delle Opere</em> is a painting by the Italian Renaissance artist Perugino, dating to 1494 and housed in the Uffizi Gallery, Florence. Francesco delle Opere is portrayed from three-quarters, with a black beret and a mantle of the same color.', 1494, 52, 44, 'Oil on panel', '400.0000', '500.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/portrait-of-francesco-delle-opere-perugino-vannucci/324475/', 'The painting, signed and dated on the back, portrays Francesco delle Opere (who died in Venice in 1496), brother of Giovanni delle Corniole, famous master carver of precious stones and friend of Perugino. The meticulousness of the details of the portrait set against a gentle landscape is reminiscent of Flemish prototypes. The inscription TIMETE DEUM on the scroll is a recurrent warning in Savonarola\'s sermons. From the collection of Cardinal Leopoldo de\' Medici (1617- 1675) it has been in the Uffizi since 1833.', 'http://en.wikipedia.org/wiki/Portrait_of_Francesco_delle_Opere'),
(384, 97, 5, '097010', 'Virgin of the Rocks', 1, 'https://www.nationalgallery.org.uk/paintings/leonardo-da-vinci-the-virgin-of-the-rocks', 'NG1093', 'Creative Commons BY-NC-ND 4.0', 'The <em>Virgin of the Rocks</em> (sometimes the Madonna of the Rocks) is the name used for two paintings by Leonardo da Vinci, of the same subject, and of a composition which is identical except for several significant details. The version generally considered the prime version, that is the earlier of the two, hangs in the Musée du Louvre in Paris and the other in the National Gallery, London. The paintings are both nearly 2 metres (over 6 feet) high and are painted in oils. Both were painted on wooden panel; that in the Louvre has been transferred to canvas. Both paintings show the Madonna and Christ Child with the infant John the Baptist and an angel, in a rocky setting which gives the paintings their usual name. The significant compositional differences are in the gaze and right hand of the angel. There are many minor ways in which the works differ, including the colours, the lighting, the flora, and the way in which sfumato has been used. Although the date of an associated commission is documented, the complete histories of the two paintings are unknown, and lead to speculation about which of the two is earlier.', 'The <em>Virgin of the Rocks</em> (sometimes the Madonna of the Rocks) is the name used for two paintings by Leonardo da Vinci, of the same subject, and of a composition which is identical except for several significant details.', 1505, 190, 120, 'Oil on panel', '600.0000', '670.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Virgin_of_the_Rocks'),
(386, 97, 4, '097020', 'Annunciation', 4, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1618', 'Public domain', 'This is a painting of the traditional subject of the <em>Annunciation</em>, by the Italian Renaissance artists Leonardo da Vinci and Andrea del Verrocchio, dating from circa 1472–1475[1] and housed in the Uffizi Gallery of Florence, Italy. The angel holds a Madonna lily, a symbol of Mary\'s virginity and of the city of Florence. It is supposed that Leonardo originally copied the wings from those of a bird in flight, but they have since been lengthened by a later artist.', 'This is a painting of the traditional subject of the <em>Annunciation</em>, by the Italian Renaissance artists Leonardo da Vinci and Andrea del Verrocchio, dating from circa 1472–1475[1] and housed in the Uffizi Gallery of Florence, Italy. The angel holds a Madonna lily, a symbol of Mary\'s virginity and of the city of Florence. It is supposed that Leonardo originally copied the wings from those of a bird in flight, but they have since been lengthened by a later artist.', 1472, 98, 217, 'Oil and tempera on panel', '550.0000', '620.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/annunciation-leonardo-da-vinci/324474/', 'The original location and commissioning of this work are unknown. It was painted at about the time Leonardo was still at Verroccchio\'s workshop (1472, ca.) It came to the Uffizi in 1867 from the sacristy of San Bartolomeo a Monteoliveto outside the gate of San Frediano. One can already see the careful attention to the atmospheric changes in the landscape which will be further developed by the artist in later work. The work is meant to be seen from below and from the right. From this point of view certain details come into proper alignment such as the keystones on the building, the foreshortening of the Virgin\'s arm and the lectern.', 'http://en.wikipedia.org/wiki/Annunciation_(Leonardo)'),
(387, 97, 7, '097030', 'Ginevra de\' Benci', 3, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.50724.html', '1967.6.1.a', 'Open Access', 'Ginevra de’ Benci was an aristocrat from 15th-century Florence, admired for her intelligence by Florentine contemporaries. She is the subject of a portrait painting by Leonardo da Vinci. The oil-on-wood portrait was acquired by the National Gallery of Art in Washington, D.C., in 1967, for US$5 million paid to the Princely House of Liechtenstein, a record price at the time, from the Ailsa Mellon Bruce Fund. It is the only painting by Leonardo on public view in the Americas.', 'Ginevra de’ Benci was an aristocrat from 15th-century Florence, admired for her intelligence by Florentine contemporaries. She is the subject of a portrait painting by Leonardo da Vinci. The oil-on-wood portrait was acquired by the National Gallery of Art in Washington, D.C., in 1967, for US$5 million paid to the Princely House of Liechtenstein, a record price at the time, from the Ailsa Mellon Bruce Fund. It is the only painting by Leonardo on public view in the Americas.', 1474, 38, 37, 'Oil on panel', '650.0000', '900.0000', 'http://www.googleartproject.com/collection/national-gallery-of-art-washington-dc/artwork/ginevra-de-benci-leonardo-da-vinci/714778/', NULL, 'http://en.wikipedia.org/wiki/Ginevra_de%27_Benci'),
(388, 97, 16, '097040', 'The Virgin and Child with St. Anne', 1, 'http://www.louvre.fr/en/oeuvre-notices/virgin-and-child-saint-anne', 'INV. 776', '&copy; Musée du Louvre', '<em>The Virgin and Child with Saint Anne</em> is an oil painting by Leonardo da Vinci depicting St. Anne, her daughter the Virgin Mary and the infant Jesus. Christ is shown grappling with a sacrificial lamb symbolizing his Passion as the Virgin tries to restrain him. The painting was commissioned as the high altarpiece for the Church of Santissima Annunziata in Florence and its theme had long preoccupied Leonardo.', '<em>The Virgin and Child with Saint Anne</em> is an oil painting by Leonardo da Vinci depicting St. Anne, her daughter the Virgin Mary and the infant Jesus. Christ is shown grappling with a sacrificial lamb symbolizing his Passion as the Virgin tries to restrain him. The painting was commissioned as the high altarpiece for the Church of Santissima Annunziata in Florence and its theme had long preoccupied Leonardo.', 1508, 168, 112, 'Oil on wood', '500.0000', '550.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Virgin_and_Child_with_St._Anne_(Leonardo_da_Vinci)'),
(389, 97, 16, '097050', 'Mona Lisa', 1, 'http://www.louvre.fr/en/oeuvre-notices/mona-lisa-portrait-lisa-gherardini-wife-francesco-del-giocondo', 'INV. 779', '&copy; Musée du Louvre', 'The <em>Mona Lisa</em> (or <em>La Gioconda</em>) is a half-length portrait of a woman by the Italian artist Leonardo da Vinci, which has been acclaimed as \"the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world.\" The painting, thought to be a portrait of Lisa Gherardini, the wife of Francesco del Giocondo, is in oil on a poplar panel, and is believed to have been painted between 1503 and 1506. It was acquired by King Francis I of France and is now the property of the French Republic, on permanent display at the Musée du Louvre in Paris since 1797. The ambiguity of the subject\'s expression, which is frequently described as enigmatic, the monumentality of the composition, the subtle modeling of forms and the atmospheric illusionism were novel qualities that have contributed to the continuing fascination and study of the work.', 'The <em>Mona Lisa</em> (or <em>La Gioconda</em>) is a half-length portrait of a woman by the Italian artist Leonardo da Vinci, which has been acclaimed as \"the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world.\"', 1503, 77, 53, 'Oil on wood', '400.0000', '450.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Mona_Lisa'),
(391, 98, 4, '098010', 'Doni Tondo', 3, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1456', 'Public domain', 'The <em>Doni Tondo</em>, sometimes called The Holy Family, is the only finished panel painting by the mature Michelangelo to survive. Now in the Uffizi in Florence, Italy, and still in its original frame, the painting was probably commissioned by Agnolo Doni to commemorate his marriage to Maddalena Strozzi, the daughter of a powerful Tuscan family. The painting is in the form of a tondo, or round frame, which is frequently associated during the Renaissance with domestic ideas. The work was most likely created during the period after the Doni\'s marriage in 1503 or 1504, as well as after the excavation of the Laocoön about 1506, yet before the Sistine Chapel ceiling frescoes were begun in 1508, dating the painting to approximately late 1506 or 1507. The Doni Tondo features the Christian Holy family (the child Jesus, Mary, and Saint Joseph) along with John the Baptist in the foreground and contains five ambiguous nude male figures in the background. The inclusion of these nude figures has been interpreted in a variety of ways.', 'The <em>Doni Tondo</em>, sometimes called The Holy Family, is the only finished panel painting by the mature Michelangelo to survive. Now in the Uffizi in Florence, Italy, and still in its original frame, the painting was probably commissioned by Agnolo Doni to commemorate his marriage to Maddalena Strozzi, the daughter of a powerful Tuscan family. The painting is in the form of a tondo, or round frame, which is frequently associated during the Renaissance with domestic ideas.', 1507, 120, 120, 'Oil and tempera on panel', '600.0000', '700.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/doni-tondo-michelangelo-buonarroti/324477/', 'The Doni Tondo is the most famous among the very few paintings on panel by Michelangelo, made on commission from the Florentine merchant Agnolo Doni for his wedding to Maddalena Strozzi in 1504. Originally it hung in the bedchamber of their home on Corso dei Tintori in Florence. The foreground is occupied by the highly modeled figures of the holy Family; the three figures together form a compact group in which the baby Jesus stands out against the intertwining arms of the Virgin and Joseph.', 'http://en.wikipedia.org/wiki/Doni_Tondo'),
(392, 98, 38, '098020', 'The Creation of Adam', 4, 'http://mv.vatican.va/3_EN/pages/x-Schede/CSNs/CSNs_V_StCentr_06.html', NULL, NULL, '<em>The Creation of Adam</em> is arguably the most famous section of Michelangelo\'s fresco Sistine Chapel ceiling painted circa 1511–1512. It is traditionally thought to illustrate the Biblical creation narrative from the Book of Genesis in which God breathes life into Adam, the first man. Chronologically the fourth in the series of panels depicting episodes from Genesis on the Sistine ceiling, it was among the last to be completed. It is the most well-known of the Sistine Chapel fresco panels, and its fame as a piece of art is rivaled only by the Mona Lisa by Leonardo da Vinci. The image of the near-touching hands of God and Adam has become one of the single most iconic images of humanity and has been reproduced in countless imitations and parodies. Along with Leonardo da Vinci\'s The Last Supper, The Creation of Adam and the other Sistine Chapel panels are the most replicated religious paintings of all time.', '<em>The Creation of Adam</em> is arguably the most famous section of Michelangelo\'s fresco Sistine Chapel ceiling painted circa 1511–1512. It is traditionally thought to illustrate the Biblical creation narrative from the Book of Genesis in which God breathes life into Adam, the first man. Chronologically the fourth in the series of panels depicting episodes from Genesis on the Sistine ceiling, it was among the last to be completed.', 1512, 480, 230, 'Fresco', '1200.0000', '1400.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Creation_of_Adam'),
(393, 98, 38, '098030', 'Libyan Sibyl', 3, 'http://mv.vatican.va/3_EN/pages/x-Schede/CSNs/CSNs_V_SibProf_08.html', NULL, NULL, 'On the five pendentives along each side of the ceiling of the Sistine Chapel and the two at either end, Michelangelo painted the largest figures on the ceiling: twelve people who prophesied or represented some aspect of the Coming of Christ. Of those twelve, seven were Prophets of Israel and were male. The remaining five were prophets of the Classical World, called Sibyls and were female. The <em>Libyan Sibyl</em>, named Phemonoe, was the prophetic priestess presiding over the Zeus Ammon Oracle (Zeus represented with the horns of Ammon) at Siwa Oasis in the Libyan Desert.', 'On the five pendentives along each side of the ceiling of the Sistine Chapel and the two at either end, Michelangelo painted the largest figures on the ceiling: twelve people who prophesied or represented some aspect of the Coming of Christ.', 1510, 395, 380, 'Fresco', '1000.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Libyan_Sibyl'),
(394, 99, 18, '099010', 'Madonna in the Meadow', 1, 'https://www.khm.at/de/object/77f959f119/', '175', 'Only for private use', 'The <em>Madonna of the Meadow</em> is also known as Madonna del prato. In it, the three figures in a calm green meadow are linked by looks and touching hands. The Virgin Mary is shown in a contrapposto pose, wearing a gold-bordered blue mantle set against a red dress and with her right leg lying along a diagonal. The blue symbolizes the church and the red Christ\'s death, with the Madonna the uniting of Mother Church with Christ\'s sacrifice. With her eyes fixed on Christ, her head is turned to the left and slightly inclined, and in her hands she holds up Christ, as he leans forward unsteadily to touch the miniature cross held by John. The poppy refers to Christ\'s passion, death and resurrection.', 'The <em>Madonna of the Meadow</em> is also known as Madonna del prato. In it, the three figures in a calm green meadow are linked by looks and touching hands. The Virgin Mary is shown in a contrapposto pose, wearing a gold-bordered blue mantle set against a red dress and with her right leg lying along a diagonal.', 1505, 113, 88, 'Oil on wood', '400.0000', '450.0000', 'http://www.googleartproject.com/collection/kunsthistorisches-museum-vienna-museum-of-fine-arts/artwork/madonna-in-the-meadow-raphael/676851/', 'In 1504 the young Raphael came from Perugia to Florence, where Leonardo da Vinci and Michelangelo dominated artistic life. Especially under the influence of Leonardo’s compositions, the newcomer created a series of Madonna depictions. Particularly in Florence, the Madonna image had experienced a change in function: it was no longer mainly a religious item for practical use, but primarily an exquisite expression of artistic achievement. Raphael gave the Madonna in the Meadow to his Florentine patron Taddeo Taddi as a gift; in 1662 it was acquired at its place of origin by Archduke Ferdinand Karl of Tirol. In keeping with the Sienese type of the Madonna Humilitatis the Virgin Maryis sitting on an elevation on the ground. Supporting the infant Jesus with both hands, she looks at little John the Baptist. The encounter of the two children has been mentioned in Tuscan devotional literature since the late 13th century. The cross is simultaneously a toy, an attribute of John the Baptist and a Passion symbol. The latter is also true of the conspicuously positioned poppy on the right. In the present painting, which was created at the beginning of his series of full-length Madonna depictions, Raphael decided on a strictly geometrical structure: the group is incorporated in an equilateral triangle. However, within the seemingly rigid structure, a lively scene unfolds. Parallel and opposing movements and glances blend with the landscape in the background to create a composition that is in keeping with the demands of the High Renaissance for perfect balance and harmony', 'http://en.wikipedia.org/wiki/Madonna_of_the_meadow_(Raphael)'),
(398, 99, 4, '099050', 'Madonna of the Goldfinch', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1447', 'Public domain', 'The <em>Madonna del cardellino</em> or <em>Madonna of the Goldfinch</em> is a painting by the Italian renaissance artist Raphael, from c. 1505-1506. A 10-year restoration process was completed in 2008, after which the painting was returned to its home at the Uffizi in Florence. In this painting, as in most of the Madonnas of his Florentine period, Raphael arranged the three figures - Mary, Christ and the young John the Baptist - to fit into a geometrical design. Though the positions of the three bodies are natural, together they form an almost regular triangle. The Madonna is shown young and beautiful, as with Raphael’s various other Madonnas. She is also clothed in red and blue, also typical, for red signifies the passion of Christ and blue was used to signify the church. Christ and John are still very young, only babies. John holds a goldfinch in his hand, and Christ is reaching out to touch it. The background is one typical of Raphael. The natural setting is diverse and yet all calmly frames the central subject taking place.', 'The <em>Madonna del cardellino</em> or <em>Madonna of the Goldfinch</em> is a painting by the Italian renaissance artist Raphael, from c. 1505-1506. A 10-year restoration process was completed in 2008, after which the painting was returned to its home at the Uffizi in Florence. In this painting, as in most of the Madonnas of his Florentine period, Raphael arranged the three figures - Mary, Christ and the young John the Baptist - to fit into a geometrical design.', 1505, 107, 77, 'Oil on wood', '500.0000', '540.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/madonna-of-the-goldfinch-raffaello-sanzio/330470/', 'Giorgio Vasari writes that Raphael painted this panel for his friend Lorenzo Nasi, a florentine merchant, on the occasion of his marriage to Sandra Canigiani. Significantly damaged by the collapse of the Nasi house from a landslide on Costa a San Giorgio in 1547, it was restored by a Florentine artist, perhaps Ridolfo del Ghirlandaio. The painting was exhibited in the Tribuna in 1704.', 'http://en.wikipedia.org/wiki/Madonna_del_cardellino'),
(399, 99, 7, '099060', 'Alba Madonna', 3, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.26.html', '1937.1.24', 'Open Access', 'The <em>Alba Madonna</em> is a painting by the Italian High Renaissance artist Raphael, depicting Mary, Jesus and John the Baptist, in a typical Italian countryside. John the Baptist is holding up a cross to Jesus, which the baby Jesus is grasping. All three figures are staring at the cross. The three figures are grouped to the left in the round design, but the outstretched arm of the Madonna and the billowing material of her cloak balance the image.', 'The <em>Alba Madonna</em> is a painting by the Italian High Renaissance artist Raphael, depicting Mary, Jesus and John the Baptist, in a typical Italian countryside. John the Baptist is holding up a cross to Jesus, which the baby Jesus is grasping. All three figures are staring at the cross. The three figures are grouped to the left in the round design, but the outstretched arm of the Madonna and the billowing material of her cloak balance the image.', 1510, 94, 94, 'Oil transferred from wood to canvas', '600.0000', '700.0000', 'http://www.googleartproject.com/collection/national-gallery-of-art-washington-dc/artwork/the-alba-madonna-raphael/712887/', NULL, 'http://en.wikipedia.org/wiki/Alba_Madonna'),
(401, 99, 43, '099080', 'Sistine Madonna', 1, 'http://skd-online-collection.skd.museum/de/contents/show?id=372144', '93', NULL, '<em>Sistine Madonna</em> is an oil painting by the Italian artist Raphael. Commissioned in 1512 by Pope Julius II as an altarpiece for the church of San Sisto, Piacenza, it was one of the last Madonnas painted by the artist. Relocated to Dresden from 1754, the well-known painting has been particularly influential in Germany. After World War II, it was relocated to Moscow for a decade before it was returned to Germany. There, it resides as one of the central pieces in the Gemäldegalerie Alte Meister. The painting has been highly praised by many notable critics, and Giorgio Vasari called it a \"a truly rare and extraordinary work\".', '<em>Sistine Madonna</em> is an oil painting by the Italian artist Raphael. Commissioned in 1512 by Pope Julius II as an altarpiece for the church of San Sisto, Piacenza, it was one of the last Madonnas painted by the artist. Relocated to Dresden from 1754, the well-known painting has been particularly influential in Germany. The painting has been highly praised by many notable critics, and Giorgio Vasari called it a \"a truly rare and extraordinary work\".', 1512, 265, 196, 'Oil on canvas', '900.0000', '1000.0000', 'http://www.googleartproject.com/collection/gemaldegalerie-alte-meister-old-masters-picture-gallery/artwork/the-sistine-madonna-raphael/712643/', NULL, 'http://en.wikipedia.org/wiki/Sistine_Madonna'),
(403, 99, 43, '099100', 'Madonna of the Chair', 3, 'http://skd-online-collection.skd.museum/en/contents/showSearch?id=505378', '97', NULL, 'The <em>Madonna of the Chair</em> or the <em>Madonna della seggiola</em> is a Madonna painting by the Italian renaissance artist Raphael, dating to c. 1513-1514 and housed in the Palazzo Pitti collection in Florence. It depicts Mary embracing the child Christ, while the young John the Baptist devoutly watches. Painted during his Roman period, this Madonna does not have the strict geometrical form and linear style of his earlier Florentine treatments of the same subject. Instead, the warmer colors seem to suggest the influence of Titian and Raphael\'s rival Sebastiano del Piombo.', 'The <em>Madonna of the Chair</em> or the <em>Madonna della seggiola</em> is a Madonna painting by the Italian renaissance artist Raphael, dating to c. 1513-1514 and housed in the Palazzo Pitti collection in Florence. It depicts Mary embracing the child Christ, while the young John the Baptist devoutly watches.', 1514, 71, 71, 'Oil on panel', '500.0000', '600.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Madonna_della_seggiola'),
(405, 99, 7, '099120', 'Portrait of Bindo Altoviti', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.12131.html', '1943.4.33', 'Open Access', 'The <em>Portrait of Bindo Altoviti</em> is a painting finished around 1515 by the Italian High Renaissance painter Raphael. Bindo Altoviti was a rich banker born in Rome in 1491, but of Florentine origin. He was a cultured man who loved the arts. The graceful, almost effeminate position of the subject along with the heavy contrast between light and shadow are atypical of Raphael\'s work, particularly of his portraits of men, demonstrating the artist\'s experimentation with different styles and forms in his later Roman period. The influence of the works of Leonardo, which Raphael studied astutely during this period of his career, are strikingly evident in this particular piece.', 'The <em>Portrait of Bindo Altoviti</em> is a painting finished around 1515 by the Italian High Renaissance painter Raphael. Bindo Altoviti was a rich banker born in Rome in 1491, but of Florentine origin. He was a cultured man who loved the arts.', 1515, 60, 44, 'Oil on wood', '600.0000', '660.0000', 'http://www.googleartproject.com/collection/national-gallery-of-art-washington-dc/artwork/bindo-altoviti-raphael/718252/', NULL, 'http://en.wikipedia.org/wiki/Portrait_of_Bindo_Altoviti_(Raphael)'),
(406, 100, 5, '100010', 'A Man with a Quilted Sleeve', 1, 'https://www.nationalgallery.org.uk/paintings/titian-portrait-of-gerolamo-barbarigo', 'NG1944', 'Creative Commons BY-NC-ND 4.0', 'This portrait was eloquently described by Giorgio Vasari in his 1568 biography of Titian. He identified the man as a member of the Barbarigo, an aristocratic Venetian family. The most likely candidate is Gerolamo, who was 30 years old in 1509. He had numerous political and literary contacts and would have helped the young Titian on his path to success.', 'This portrait was eloquently described by Giorgio Vasari in his 1568 biography of Titian. He identified the man as a member of the Barbarigo, an aristocratic Venetian family. The most likely candidate is Gerolamo, who was 30 years old in 1509. He had numerous political and literary contacts and would have helped the young Titian on his path to success.', 1509, 81, 66, 'Oil on canvas', '500.0000', '550.0000', 'http://www.googleartproject.com/collection/the-national-gallery-london/artwork/portrait-of-gerolamo-barbarigo-titian/330402/', NULL, 'http://en.wikipedia.org/wiki/A_Man_with_a_Quilted_Sleeve'),
(407, 100, 4, '100020', 'Flora', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 146', 'Public domain', '<em>Flora</em> is an oil painting by Italian late Renaissance painter Titian, dated to around 1515 and now held at the Uffizi Gallery in Florence. The work was reproduced in numerous 16th century etchings. It portrays an idealized beautiful woman, a model established in the Venetian school by Titian\'s master Giorgione with his Laura. Her left hands holds a pink-shaded mantle, while another holds a handful of flowers and leaves. The meaning of the painting is disputed: some, basing for example to inscriptions added to the 16th century reproductions, identifies the woman as a courtesan; other consider it a symbol of nuptial love, although her dress is not a dressing one. The identification with Flora, the ancient goddess of Spring and vegetation, derives from the presence of Spring flowers in her hands.', '<em>Flora</em> is an oil painting by Italian late Renaissance painter Titian, dated to around 1515. The work was reproduced in numerous 16th century etchings. It portrays an idealized beautiful woman, a model established in the Venetian school by Titian\'s master Giorgione with his Laura. Her left hands holds a pink-shaded mantle, while another holds a handful of flowers and leaves.', 1515, 80, 63, 'Oil on canvas', '700.0000', '800.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/flora-tiziano-vecellio/327477/', 'Until 1641 this painting belonged to Alfonso Lòpez, a businessman and Cardinal Richelieu\'s agent in Amsterdam. Documented in the Imperial Gallery of Vienna after 1728, it was exchanged for another painting in the Uffizi in 1793. Over the years, unsuccessful attempts have been made to identify the woman portrayed, although the most probable hypothesis remains that it represents the mythological figure, Flora.', 'http://en.wikipedia.org/wiki/Flora_(Titian)'),
(408, 100, 5, '100030', 'Bacchus and Ariadne', 3, 'https://www.nationalgallery.org.uk/paintings/titian-bacchus-and-ariadne', 'NG35', 'Creative Commons BY-NC-ND 4.0', '<em>Bacchus and Ariadne</em> (1520–23)[1] is an oil painting by Titian. It is one of a cycle of paintings on mythological subjects produced for Alfonso d\'Este, the Duke of Ferrara, for the Camerino d\'Alabastro – a private room in his palazzo in Ferrara decorated with paintings based on classical texts. An advance payment was given to Raphael, who originally held the commission for the subject of a Triumph of Bacchus. At the time of Raphael\'s death in 1520, only a preliminary drawing was completed and the commission was then handed to Titian. In the case of Bacchus and Ariadne, the subject matter was derived from the Roman poets Catullus and Ovid. The painting, considered one of Titian\'s greatest works, now hangs in the National Gallery in London.', '<em>Bacchus and Ariadne</em> (1520–23)[1] is an oil painting by Titian. It is one of a cycle of paintings on mythological subjects produced for Alfonso d\'Este, the Duke of Ferrara, for the Camerino d\'Alabastro – a private room in his palazzo in Ferrara decorated with paintings based on classical texts.', 1520, 176, 191, 'Oil on canvas', '1200.0000', '1400.0000', 'http://www.googleartproject.com/collection/the-national-gallery-london/artwork/bacchus-and-ariadne-titian/331385/', NULL, 'http://en.wikipedia.org/wiki/Bacchus_and_Ariadne');
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(409, 100, 4, '100040', 'Venus of Urbino', 2, 'http://www.uffizi.firenze.it/catalogo/', '1890, 1437', 'Public domain', '<em>The Venus of Urbino</em> is a 1538 oil painting by the Italian master Titian. It depicts a nude young woman, identified with the goddess Venus, reclining on a couch or bed in the sumptuous surroundings of a Renaissance palace. It hangs in the Galleria degli Uffizi in Florence. The figure\'s pose is based on Giorgione\'s Sleeping Venus (c. 1510), which Titian completed. In this depiction, Titian has domesticated Venus by moving her to an indoor setting, engaging her with the viewer, and making her sensuality explicit. Devoid as it is of any classical or allegorical trappings – Venus displays none of the attributes of the goddess she is supposed to represent – the painting is unapologetically erotic.', '<em>The Venus of Urbino</em> is a 1538 oil painting by the Italian master Titian. It depicts a nude young woman, identified with the goddess Venus, reclining on a couch or bed in the sumptuous surroundings of a Renaissance palace. In this depiction, Titian has domesticated Venus by moving her to an indoor setting, engaging her with the viewer, and making her sensuality explicit.', 1538, 166, 119, 'Oil on canvas', '1000.0000', '1100.0000', 'http://www.googleartproject.com/collection/uffizi-gallery/artwork/venus-of-urbino-tiziano-vecellio/324480/', 'This painting was purchased in 1538 by Guidobaldo della Rovere, duke of Urbino, who called it the image of a \"nude woman\" in the correspondence with his ambassador in Venice. It was Giorgio Vasari who described it as \"a young Venus lying down\", an identification thereafter unanimously accepted. It reached Florence with Vittoria della Rovere who, in 1631, inherited the estate of her grandfather, Francesco Maria II; in 1637, she married Ferdinand II of Tuscany. The Venus was placed in the Tribuna of the Uffizi in 1736, but it was hidden from the visitors\' view by a cover depicting Sacred Love.', 'http://en.wikipedia.org/wiki/Venus_of_Urbino'),
(412, 101, 5, '101030', 'Supper at Emmaus', 2, 'https://www.nationalgallery.org.uk/paintings/michelangelo-merisi-da-caravaggio-the-supper-at-emmaus', 'NG172', 'Creative Commons BY-NC-ND 4.0', '<em>The Supper at Emmaus</em>  is a painting by the Italian Baroque master Caravaggio, and now in the National Gallery in London. The painting depicts the moment when the resurrected but incognito Jesus, reveals himself to two of his disciples (presumed to be Luke and Cleopas), only to soon vanish from their sight. Cleopas wears the scallopshell of a pilgrim. The other apostle wears torn clothes. Cleopas gesticulates in a perspectively-challenging extension of arms in and out of the frame of reference. The standing groom, forehead smooth and face in darkness, appears oblivious to the event. The painting is unusual for the life-sized figures, the dark and blank background. The table lays out a still-life meal. The basket of food teeters perilously over the edge.', '<em>The Supper at Emmaus</em>  is a painting by the Italian Baroque master Caravaggio, and now in the National Gallery in London. The painting depicts the moment when the resurrected but incognito Jesus, reveals himself to two of his disciples.', 1601, 141, 196, 'Oil on canvas', '1300.0000', '1500.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Supper_at_Emmaus_(London)_(Caravaggio)'),
(413, 102, 5, '102010', 'The Judgement of Paris', 2, 'https://www.nationalgallery.org.uk/paintings/peter-paul-rubens-the-judgement-of-paris', 'NG194', 'Creative Commons BY-NC-ND 4.0', '<em>The Judgement of Paris</em> produced by Peter Paul Rubens is one of two very similar paintings. Both show Rubens\' version of idealised feminine beauty, with the goddesses Venus, Minerva and Juno on one side and Paris accompanied by Mercury on the other.', '<em>The Judgement of Paris</em> produced by Peter Paul Rubens is one of two very similar paintings. Both show Rubens\' version of idealised feminine beauty, with the goddesses Venus, Minerva and Juno on one side and Paris accompanied by Mercury on the other.', 1636, 144, 193, 'Oil on canvas', '900.0000', '1100.0000', 'http://www.googleartproject.com/collection/the-national-gallery-london/artwork/the-judgement-of-paris-peter-paul-rubens/331377/details/', NULL, 'http://en.wikipedia.org/wiki/The_Judgment_of_Paris_(Rubens)'),
(417, 104, 2, '104010', 'Las Meninas', 1, 'https://www.museodelprado.es/en/the-collection/art-work/las-meninas/9fdc7800-9ade-48b0-ab8b-edee94ea877f', 'P01174', 'Private, personal, academic, research or educational', '<em>Las Meninas</em> (Spanish for <em>The Maids of Honour</em>) is a 1656 painting by Diego Velázquez, the leading artist of the Spanish Golden Age, in the Museo del Prado in Madrid. The work\'s complex and enigmatic composition raises questions about reality and illusion, and creates an uncertain relationship between the viewer and the figures depicted. Because of these complexities, Las Meninas has been one of the most widely analyzed works in Western painting. The painting shows a large room in the Madrid palace of King Philip IV of Spain, and presents several figures, most identifiable from the Spanish court, captured, according to some commentators, in a particular moment as if in a snapshot. Some look out of the canvas towards the viewer, while others interact among themselves. The young Infanta Margaret Theresa is surrounded by her entourage of maids of honour, chaperone, bodyguard, two dwarfs and a dog. Just behind them, Velázquez portrays himself working at a large canvas. Velázquez looks outwards, beyond the pictorial space to where a viewer of the painting would stand. In the background there is a mirror that reflects the upper bodies of the king and queen. They appear to be placed outside the picture space in a position similar to that of the viewer, although some scholars have speculated that their image is a reflection from the painting Velázquez is shown working on.', '<em>Las Meninas</em> (Spanish for <em>The Maids of Honour</em>) is a 1656 painting by Diego Velázquez, the leading artist of the Spanish Golden Age, in the Museo del Prado in Madrid. The work\'s complex and enigmatic composition raises questions about reality and illusion, and creates an uncertain relationship between the viewer and the figures depicted. Because of these complexities, Las Meninas has been one of the most widely analyzed works in Western painting.', 1656, 318, 276, 'Oil on canvas', '1100.0000', '1200.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Las_Meninas'),
(418, 104, 2, '104020', 'The Surrender of Breda', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-surrender-of-breda/0cc7577a-51d9-44fd-b4d5-4dba8d9cb13a', 'P01172', 'Private, personal, academic, research or educational', '<em>La rendición de Breda</em> (English: <em>The Surrender of Breda</em>) is a painting by Velázquez, painted during the years 1634–35, and inspired while Velázquez was visiting Italy with Ambrogio Spinola, the Genoese general who conquered Breda on June 5, 1625. It is considered one of Velázquez\'s best artworks. Jan Morris has called it \"one of the most Spanish of all pictures\". The capture of Breda in 1625 was one of the few major successes of Spanish arms in the latter stages of the Eighty Years\' War. The Spanish general, the Genoese aristocrat Ambrogio Spinola, conquered Breda in contradiction to the instructions of his superiors. Before its capture the Spanish government had decided that siege warfare of heavily defended towns of the Low Countries was too wasteful and that it would concentrate on the economic blockade of the Dutch republic. The bulk of Spanish forces were diverted to the unfolding vast Thirty Years War.', '<em>La rendición de Breda</em> (English: <em>The Surrender of Breda</em>) is a painting by Velázquez, painted during the years 1634–35, and inspired while Velázquez was visiting Italy with Ambrogio Spinola, the Genoese general who conquered Breda on June 5, 1625. It is considered one of Velázquez\'s best artworks. Jan Morris has called it \"one of the most Spanish of all pictures\".', 1634, 307, 367, 'Oil on canvas', '1000.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Surrender_of_Breda'),
(419, 104, 5, '104030', 'Rokeby Venus', 2, 'https://www.nationalgallery.org.uk/paintings/diego-velazquez-the-toilet-of-venus-the-rokeby-venus', 'NG2057', 'Creative Commons BY-NC-ND 4.0', '<em>The Rokeby Venus</em> is a painting by Diego Velázquez (1599–1660), the leading artist of the Spanish Golden Age. Completed between 1647 and 1651, and probably painted during the artist\'s visit to Italy, the work depicts the goddess Venus in a sensual pose, lying on a bed and looking into a mirror held by the Roman god of physical love, her son Cupid. Numerous works, from the ancient to the baroque, have been cited as sources of inspiration for Velázquez. The nude Venuses of the Italian painters, such as Giorgione\'s Sleeping Venus (c. 1510) and Titian\'s Venus of Urbino (1538), were the main precedents. In this work, Velázquez combined two established poses for Venus: recumbent on a couch or a bed, and gazing at a mirror. She is often described as looking at herself on the mirror, although this is physically impossible since viewers can see her face reflected in their direction. This phenomenon is known as the Venus effect. In a number of ways the painting represents a pictorial departure, through its central use of a mirror, and because it shows the body of Venus turned away from the observer of the painting.', '<em>The Rokeby Venus</em> is a painting by Diego Velázquez (1599–1660), the leading artist of the Spanish Golden Age. Completed between 1647 and 1651, and probably painted during the artist\'s visit to Italy, the work depicts the goddess Venus in a sensual pose, lying on a bed and looking into a mirror held by the Roman god of physical love, her son Cupid.', 1647, 122, 177, 'Oil on canvas', '600.0000', '700.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Rokeby_Venus'),
(420, 105, 32, '105010', 'The Anatomy Lesson of Dr. Nicolaes Tulp', 2, 'https://www.mauritshuis.nl/en/explore/the-collection/artworks/the-anatomy-lesson-of-dr-nicolaes-tulp-146/', '146', 'Private Use Only', '<em>The Anatomy Lesson of Dr. Nicolaes Tulp</em> is a 1632 oil painting by Rembrandt housed in the Mauritshuis museum in The Hague, the Netherlands. Dr. Nicolaes Tulp is pictured explaining the musculature of the arm to medical professionals. Some of the spectators are various doctors who paid commissions to be included in the painting. The painting is signed in the top-left hand corner Rembrant. This may be the first instance of Rembrandt signing a painting with his forename (in its original form) as opposed to the monogramme RHL (Rembrant Harmenszoon of Leiden), and is thus a sign of his growing artistic confidence.', '<em>The Anatomy Lesson of Dr. Nicolaes Tulp</em> is a 1632 oil painting by Rembrandt housed in the Mauritshuis museum in The Hague, the Netherlands. Dr. Nicolaes Tulp is pictured explaining the musculature of the arm to medical professionals. Some of the spectators are various doctors who paid commissions to be included in the painting. The painting is signed in the top-left hand corner Rembrant. This may be the first instance of Rembrandt signing a painting with his forename (in its original form) as opposed to the monogramme RHL (Rembrant Harmenszoon of Leiden), and is thus a sign of his growing artistic confidence.', 1632, 216, 170, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Anatomy_Lesson_of_Dr._Nicolaes_Tulp'),
(422, 105, 43, '105020', 'The Prodigal Son in the Tavern', 1, 'http://skd-online-collection.skd.museum/en/contents/showSearch?id=376227', '1559', NULL, '<em>The Prodigal Son in the Brothel</em> is a painting by the Dutch master Rembrandt. It is housed in the Gemäldegalerie Alte Meister of Dresden, Germany. It is signed \"REMBRANDT F.\". It portrays two people who had been identified as Rembrandt himself and his wife Saskia. In the Protestant contemporary world, the theme of the prodigal son was a frequent subject for works of art due to its moral background.', '<em>The Prodigal Son in the Brothel</em> is a painting by the Dutch master Rembrandt. It is housed in the Gemäldegalerie Alte Meister of Dresden, Germany. It is signed \"REMBRANDT F.\". It portrays two people who had been identified as Rembrandt himself and his wife Saskia. In the Protestant contemporary world, the theme of the prodigal son was a frequent subject for works of art due to its moral background.', 1637, 161, 131, 'Oil on canvas', '850.0000', '920.0000', 'http://www.googleartproject.com/collection/gemaldegalerie-alte-meister-old-masters-picture-gallery/artwork/rembrandt-and-saskia-in-the-scene-of-the-prodigal-son-rembrandt/712645/', NULL, 'http://en.wikipedia.org/wiki/The_Prodigal_Son_in_the_Tavern'),
(423, 105, 24, '105030', 'The Return of the Prodigal Son', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/43413/?lng=en', '742', 'Personal non-commercial use', '<em>The Return of the Prodigal Son</em> is an oil painting by Rembrandt. It is among the Dutch master\'s final works, likely completed within two years of his death in 1669. Depicting the moment of the prodigal son\'s return to his father in the Biblical parable, it is a renowned work described by art historian Kenneth Clark as \"a picture which those who have seen the original in Leningrad may be forgiven for claiming as the greatest picture ever painted\".', '<em>The Return of the Prodigal Son</em> is an oil painting by Rembrandt. It is among the Dutch master\'s final works, likely completed within two years of his death in 1669. Depicting the moment of the prodigal son\'s return to his father in the Biblical parable, it is a renowned work described by art historian Kenneth Clark as \"a picture which those who have seen the original in Leningrad may be forgiven for claiming as the greatest picture ever painted\".', 1661, 262, 205, 'Oil on canvas', '700.0000', '775.0000', 'http://www.googleartproject.com/collection/the-state-hermitage-museum/artwork/return-of-the-prodigal-son-rembrandt-harmensz-van-rijn/327455/', NULL, 'http://en.wikipedia.org/wiki/The_Return_of_the_Prodigal_Son_(Rembrandt)'),
(424, 106, 30, '106010', 'The Milkmaid', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.6417', 'SK-A-2344', 'Public domain', '<em>The Milkmaid</em> is an oil-on-canvas painting of a \"milkmaid\", in fact a domestic kitchen maid, by the Dutch artist Johannes Vermeer. It is now in the Rijksmuseum in Amsterdam, Netherlands, which regards it as \"unquestionably one of the museum\'s finest attractions\". The painting is strikingly illusionistic, conveying not just details but a sense of the weight of the woman and the table. \"The light, though bright, doesn\'t wash out the rough texture of the bread crusts or flatten the volumes of the maid\'s thick waist and rounded shoulders\", wrote Karen Rosenberg, an art critic for The New York Times. Yet with half of the woman\'s face in shadow, it is \"impossible to tell whether her downcast eyes and pursed lips express wistfulness or concentration,\" she wrote.', '<em>The Milkmaid</em> is an oil-on-canvas painting of a \"milkmaid\", in fact a domestic kitchen maid, by the Dutch artist Johannes Vermeer. It is now in the Rijksmuseum in Amsterdam, Netherlands, which regards it as \"unquestionably one of the museum\'s finest attractions\".', 1657, 46, 41, 'Oil on canvas', '450.0000', '525.0000', 'http://www.googleartproject.com/collection/rijksmuseum/artwork/the-milkmaid-johannes-vermeer/328442/', 'Intent on her task, the kitchen maid pours milk from a jug. The composition radiates a quiet calm, the only movement being the flow of milk into the bowl. Its most exceptional feature is the rendering of light. The tiny dots representing the reflection of light - as in the br eadrolls on the table - are typical of Vermeer\'s technique. This painting is a high point within Vermeer\'s oeuvre. Of the thirty or so works he produced, four are in the Rijksmuseum.', 'http://en.wikipedia.org/wiki/The_Milkmaid_(Vermeer)'),
(425, 106, 32, '106020', 'Girl with a Pearl Earring', 1, 'https://www.mauritshuis.nl/en/explore/the-collection/artworks/girl-with-a-pearl-earring-670/', '670', 'Private Use Only', '<em>Girl with a Pearl Earring</em> is one of Johannes Vermeer\'s masterworks and, as the name implies, uses a pearl earring for a focal point. Today the painting is kept in the Mauritshuis gallery in The Hague. It is sometimes referred to as \"the Mona Lisa of the North\" or \"the Dutch Mona Lisa\". More recent Vermeer literature points to the image being a tronie, the Dutch 17th-century description of a head that was not meant to be a portrait. After the most recent restoration of the painting in 1994, the subtle colour scheme and the intimacy of the girl’s gaze toward the viewer have been greatly enhanced.', '<em>Girl with a Pearl Earring</em> is one of Johannes Vermeer\'s masterworks and, as the name implies, uses a pearl earring for a focal point. Today the painting is kept in the Mauritshuis gallery in The Hague. It is sometimes referred to as \"the Mona Lisa of the North\" or \"the Dutch Mona Lisa\".', 1665, 44, 39, 'Oil on canvas', '500.0000', '600.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Girl_with_a_Pearl_Earring'),
(426, 106, 18, '106030', 'The Art of Painting', 3, 'https://www.khm.at/de/object/8f125da0b3/', '9128', 'Only for private use', '<em>The Art of Painting</em> is a famous 17th century oil on canvas painting by Dutch painter, Johannes Vermeer. Many art historians believe that it is an allegory of painting, hence the alternative title of the painting. After Vermeer\'s The Procuress it is the largest work by the master. Its composition and iconography also make it the most complex Vermeer work of all.', '<em>The Art of Painting</em> is a famous 17th century oil on canvas painting by Dutch painter, Johannes Vermeer. Many art historians believe that it is an allegory of painting, hence the alternative title of the painting. After Vermeer\'s The Procuress it is the largest work by the master. Its composition and iconography also make it the most complex Vermeer work of all.', 1666, 130, 110, 'Oil on canvas', '850.0000', '925.0000', 'http://www.googleartproject.com/collection/kunsthistorisches-museum-vienna-museum-of-fine-arts/artwork/the-art-of-painting-jan-vermeer/680295/', NULL, 'http://en.wikipedia.org/wiki/The_Art_of_Painting'),
(427, 106, 30, '106040', 'The Love Letter', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.6418', 'SK-A-1595', 'Public domain', '<em>The Love Letter</em> is a 17th-century genre painting by Jan Vermeer. The painting shows a servant maid handing a letter to a young woman with a cittern. The tied-up curtain in the foreground creates the impression that the viewer is looking at an intensely private, personal scene. There is also an element of trompe l\'oeil as Dutch paintings were often hung with little curtains to conserve them, and the device of painted curtains is seen in other Dutch works of the period. The diagonals on the chequered floor create the impression of depth and three-dimensionality. The fact that it is a love letter that the woman has received is made clear by the fact that she is carrying a lute (more specifically, a cittern, a member of the lute/guitar family). The lute was a symbol of love - often carnal love; luit was also a slang term for vagina. This idea is further reinforced by the slippers at the very bottom of the picture. The removed slipper was another symbol of sex. The floor brush would appear to represent domesticity, and its placement at the side of the painting may suggest that domestic concerns have been forgotten or pushed aside.', '<em>The Love Letter</em> is a 17th-century genre painting by Jan Vermeer. The painting shows a servant maid handing a letter to a young woman with a cittern.', 1666, 44, 38, 'Oil on canvas', '750.0000', '900.0000', 'http://www.googleartproject.com/collection/rijksmuseum/artwork/the-love-letter-johannes-vermeer/324409/', 'Here Vermeer has chosen an unusual vantage point. From the depths of a shadowy space, we are given a glimpse of a room. A richly clad woman has momentarily ceased her music-making for a letter that has just been handed to her. She looks up expectantly at the servant girl. The subject of the letter could be related to the seascape behind the two women. In the 17th century the sea was often compared to love, and the lover to a ship.', 'http://en.wikipedia.org/wiki/The_Love_Letter_(Vermeer)'),
(428, 107, 50, '107010', 'Madame de Pompadour', 2, 'https://www.nationalgalleries.org/object/NG 429', 'NG 429', NULL, 'Jeanne Antoinette Poisson, Marquise de Pompadour, otherwise known as Madame de Pompadour, was the mistress of King Louis XV, as well as a prominent patron of Francois Boucher. Unlike the many other mistresses of the king, Madame de Pompadour continued to be a presence at the court by creating a cordial relationship with the Queen, by accompanying the King on hunting trips and social gatherings, and commissioning paintings of herself, which hid her aging looks. Although she did commission works from other artists, the majority of her portraits were done by Boucher.', 'Jeanne Antoinette Poisson, otherwise known as Madame de Pompadour, was the mistress of King Louis XV, as well as a prominent patron of Francois Boucher. Unlike the many other mistresses of the king, Madame de Pompadour continued to be a presence at the court by creating a cordial relationship with the Queen, by accompanying the King on hunting trips and social gatherings, and commissioning paintings of herself, which hid her aging looks.', 1758, 463, 379, 'Oil on canvas', '1400.0000', '1500.0000', 'http://www.googleartproject.com/collection/national-galleries-of-scotland/artwork/madame-de-pompadour-jeanne-antoinette-poisson-1721-1764-attributed-to-francois-boucher/427538/', NULL, 'http://en.wikipedia.org/wiki/Madame_de_Pompadour'),
(430, 108, 27, '108010', 'Still Life with Peaches, a Silver Goblet, Grapes, and Walnuts', 2, 'http://www.getty.edu/art/collection/objects/793/jean-simeon-chardin-still-life-with-peaches-a-silver-goblet-grapes-and-walnuts-french-about-1759-1760/', '86.PA.544', 'Public domain', 'In still lifes, genre scenes, and the occasional portrait, Chardin\'s skill at rendering the visual and tactile qualities of simple objects won him the admiration of critics like Diderot. In this small still life, Chardin portrayed a modest subject--three walnuts, four peaches, two bunches of grapes, and a pewter mug--but gave the objects monumentality by arranging them in pure geometric groupings and concentrating on their basic forms. He suggested the objects\' various textures and substances through the play of light across surfaces and successive applications of paint. In this way, Chardin conveyed the fuzzy skin of the peaches, the hard, brittle shell of the walnuts, the translucence of the grapes, and the heavy, cold exterior of the pewter mug.', ' In this small still life, Chardin portrayed a modest subject--three walnuts, four peaches, two bunches of grapes, and a pewter mug--but gave the objects monumentality by arranging them in pure geometric groupings and concentrating on their basic forms. He suggested the objects\' various textures and substances through the play of light across surfaces and successive applications of paint. In this way, Chardin conveyed the fuzzy skin of the peaches, the hard, brittle shell of the walnuts, the translucence of the grapes, and the heavy, cold exterior of the pewter mug.', 1759, 46, 38, 'Oil on canvas', '500.0000', '550.0000', 'http://www.googleartproject.com/collection/the-j-paul-getty-museum/artwork/still-life-with-peaches-a-silver-goblet-grapes-and-walnuts-jean-simeon-chardin-french-1699-1779/2788394/', NULL, NULL),
(431, 109, 17, '109010', 'Age of Innocence', 1, 'http://www.tate.org.uk/art/artworks/reynolds-the-age-of-innocence-n00307', 'N00307', 'Creative Commons CC-BY-NC-ND 3.0', '<em>The Age of Innocence</em> is an oil on canvas picture by Sir Joshua Reynolds, painted in either 1785 or 1788 and measuring 765 x 638 mm. The sitter is unknown, but was possibly Reynolds\'s great-niece Theophila Gwatkin (who was three in 1785), or Lady Anne Spencer (1773–1865), the youngest daughter of the 4th Duke of Marlborough. The picture is a character study, or, in 18th-century terms, a fancy picture, and was painted over another Reynolds work, A Strawberry Girl, perhaps because Strawberry had suffered some paint losses. Only the hands remain in their original state. Innocence itself has deteriorated since 1859. The picture was presented to the National Gallery in 1847 by Robert Vernon, and has hung in the Tate since 1951. The picture became a favourite with the public, and was copied hundreds of times.', '<em>The Age of Innocence</em> is an oil on canvas picture by Sir Joshua Reynolds, painted in either 1785 or 1788 and measuring 765 x 638 mm.', 1788, 76, 64, 'Oil on canvas', '700.0000', '800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Age_of_Innocence_(painting)'),
(432, 109, 17, '109020', 'Three Ladies Adorning a Term of Hymen', 2, 'http://www.tate.org.uk/art/artworks/reynolds-three-ladies-adorning-a-term-of-hymen-n00079', 'N00079', 'Creative Commons CC-BY-NC-ND 3.0', 'Shows the aristocratic Montgomery sisters – Barbara, Elizabeth and Anne. Their father was the Irish aristocrat Sir William Montgomery and they were known as the Irish Graces. They are shown gathering flowers to decorate a statue of Hymen, the Roman god of marriage.', 'Shows the aristocratic Montgomery sisters – Barbara, Elizabeth and Anne. Their father was the Irish aristocrat Sir William Montgomery and they were known as the Irish Graces. They are shown gathering flowers to decorate a statue of Hymen, the Roman god of marriage.', 1773, 233, 290, 'Oil on Canvas', '1200.0000', '1400.0000', NULL, NULL, 'http://en.m.wikipedia.org/wiki/File:Sir_Joshua_Reynolds_-_Three_Ladies_Adorning_a_Term_of_Hymen_-_Google_Art_Project.jpg'),
(433, 110, 5, '110010', 'Mr and Mrs Andrews', 4, 'https://www.nationalgallery.org.uk/paintings/thomas-gainsborough-mr-and-mrs-andrews', 'NG6301', 'Creative Commons BY-NC-ND 4.0', '<em>Mr and Mrs Andrews</em>is an oil on canvas portrait by Thomas Gainsborough in the National Gallery, London. Today it is one of his most famous works. Thomas Gainsborough was twenty-one when he painted Mr and Mrs Andrews in 1750.', '<em>Mr and Mrs Andrews</em>is an oil on canvas portrait by Thomas Gainsborough in the National Gallery, London. Today it is one of his most famous works. Thomas Gainsborough was twenty-one when he painted Mr and Mrs Andrews in 1750.', 1750, 69, 119, 'Oil on Canvas', '900.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Mr_and_Mrs_Andrews'),
(435, 110, 5, '110030', 'Portrait of Mrs. Sarah Siddons', 1, 'https://www.nationalgallery.org.uk/paintings/thomas-gainsborough-mrs-siddons', 'NG683', 'Creative Commons BY-NC-ND 4.0', 'Sarah Siddons was the outstanding tragic actress of her time. Reynolds and other artists also painted her portrait. Gainsborough is reported to have had difficulties with the nose.', 'Sarah Siddons was the outstanding tragic actress of her time. Reynolds and other artists also painted her portrait. Gainsborough is reported to have had difficulties with the nose.', 1785, 126, 100, 'Oil on Canvas', '700.0000', '800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/File:Thomas_Gainsborough_015.jpg'),
(436, 110, 7, '110040', 'Mrs. Richard Brinsley Sheridan', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.99.html', '1937.1.92', 'Open Access', '<em>Mrs. Richard Brinsley Sheridan</em> is an oil on canvas portrait painted by Thomas Gainsborough between 1785 and 1787. It was acquired by the National Gallery of Art in 1937. Mrs. Sheridan (Elizabeth Ann Linley) was a talented musician who enjoyed professional success in Bath and London before marrying Richard Brinsley Sheridan in 1773 and abandoning her career. She was 31 when she sat for Gainsborough. She died from tuberculosis at the age of thirty-eight.', '<em>Mrs. Richard Brinsley Sheridan</em> is an oil on canvas portrait painted by Thomas Gainsborough between 1785 and 1787. It was acquired by the National Gallery of Art in 1937.', 1787, 219, 153, 'Oil on Canvas', '550.0000', '625.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Mrs._Richard_Brinsley_Sheridan_(painting)'),
(437, 113, 5, '113010', 'Self-portrait in a Straw Hat', 1, 'https://www.nationalgallery.org.uk/paintings/elisabeth-louise-vigee-le-brun-self-portrait-in-a-straw-hat', 'NG1653', 'Creative Commons BY-NC-ND 4.0', 'The painting appears, after cleaning, to be an autograph replica of a picture, the original of which was painted in Brussels in 1782 in free imitation of Rubens\'s \'Chapeau de Paille\', which Vigée Le Brun had seen in Antwerp. It was exhibited in Paris in 1782 at the Salon de la Correspondance. Vigée Le Brun\'s original is recorded in a private collection in France.', 'The painting appears, after cleaning, to be an autograph replica of a picture, the original of which was painted in Brussels in 1782 in free imitation of Rubens\'s \'Chapeau de Paille\', which Vigée Le Brun had seen in Antwerp. It was exhibited in Paris in 1782 at the Salon de la Correspondance. Vigée Le Brun\'s original is recorded in a private collection in France.', 1782, 98, 71, 'Oil on Canvas', '700.0000', '800.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/File:Self-portrait_in_a_Straw_Hat_by_Elisabeth-Louise_Vig%C3%A9e-Lebrun.jpg'),
(438, 112, 32, '112010', 'The Proposition', 1, 'https://www.mauritshuis.nl/en/explore/the-collection/artworks/man-offering-money-to-a-young-woman-564', '564', 'Private Use Only', '<em>The Proposition</em> is a genre painting of 1631 by Judith Leyster, now in the Mauritshuis in The Hague, who title it Man offering money to a young woman. It depicts a woman, sewing by candlelight, as a man leans over her, touching her right shoulder with his left hand. He is offering her coins in her right hand, but she is apparently ignoring the offer and concentrating intently upon her sewing.', '<em>The Proposition</em> is a genre painting of 1631 by Judith Leyster, now in the Mauritshuis in The Hague, who title it Man offering money to a young woman. It depicts a woman, sewing by candlelight, as a man leans over her, touching her right shoulder with his left hand.', 1631, 31, 24, 'Oil on Canvas', '500.0000', '600.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Proposition_(painting)'),
(439, 111, 4, '111010', 'Judith Slaying Holofernes', 1, 'http://www.uffizi.firenze.it/catalogo/', NULL, 'Public domain', '<em>Judith Slaying Holofernes</em> is a painting by the Italian early Baroque artist Artemisia Gentileschi completed between 1611–12. The work shows an apocrypha scene from the Old Testament Book of Judith which details the delivery of Israel from the Assyrian general Holofernes. In this scene, Judith and her maidservant behead the general after he has fallen asleep drunk. The painting is relentlessly physical, from the wide spurts of blood to the energy of the two women as they try to wield the large dagger. The effort of the women\'s struggle is most finely represented by the delicate face of the maid, which is grasped by the oversized, muscular fist of Holofernes as he desperately struggles to survive. Although the painting depicts a classic scene from the Bible, Gentileschi drew herself as Judith and her mentor Agostino Tassi, who was tried in court for her rape, as Holofernes.', '<em>Judith Slaying Holofernes</em> is a painting by the Italian early Baroque artist Artemisia Gentileschi completed between 1611–12. The work shows an apocrypha scene from the Old Testament Book of Judith which details the delivery of Israel from the Assyrian general Holofernes. In this scene, Judith and her maidservant behead the general after he has fallen asleep drunk.', 1611, 159, 126, 'Oil on Canvas', '700.0000', '800.0000', 'http://www.google.com/culturalinstitute/asset-viewer/judith-and-holofernes/oQF3gDEYNkutBA?projectId=art-project', 'This large painting signed by the artist was in Palazzo Pitti in 1638 and was tranferred to the Uffizi in 1774. In 1635 the Artist thanked Galileo Galilei for having helped her obtain payment, most likely for this painting for Cosimo III who was an empassioned collector of caravaggesque paintings. Artemisia Gentilleschi was in Florence from 1613 to 1620 and completed several paintings for the Medici Court.', 'https://commons.wikimedia.org/wiki/File:Artemisia_Gentileschi_-_Giuditta_decapita_Oloferne_-_Google_Art_Project.jpg'),
(441, 114, 4, '114020', 'Madonna Enthroned', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 8343', 'Public domain', '<em>Madonna Enthroned</em>, also known as the Ognissanti Madonna, is a painting by the Italian late medieval artist Giotto di Bondone, housed in the Uffizi Gallery of Florence, Italy. It is generally dated to around 1310. The painting has a traditional Christian subject, representing the Virgin Mary and the Christ Child seated on her lap, with saints surrounding the two. It is celebrated often as the first painting of the Renaissance due to its newfound naturalism and escape from the constraints of Gothic art.', '<em>Madonna Enthroned</em>, also known as the Ognissanti Madonna, is a painting by the Italian late medieval artist Giotto di Bondone, housed in the Uffizi Gallery of Florence, Italy. It is generally dated to around 1310. The painting has a traditional Christian subject, representing the Virgin Mary and the Christ Child seated on her lap, with saints surrounding the two. It is celebrated often as the first painting of the Renaissance due to its newfound naturalism and escape from the constraints of Gothic art.', 1310, 325, 204, 'Tempura on Wood', '1500.0000', '2000.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-ognissanti-madonna/OgE-RDjvff-y6g', 'The panel from 1306-10, ca. was originally placed on the old partition wall of the church of Ognissanti, officiated by the Umiliati friars before it was moved to their convent, at least by the end of the 17th century. In 1810, following the French suppression of convents, it was placed in the Accademia. It has been in the Uffizi since 1919.', 'https://en.wikipedia.org/wiki/Ognissanti_Madonna'),
(442, 115, 5, '115010', 'Arnolfini Portrait', 1, 'https://www.nationalgallery.org.uk/paintings/jan-van-eyck-the-arnolfini-portrait', 'NG186', 'Creative Commons BY-NC-ND 4.0', '<em>The Arnolfini Portrait</em> is an oil painting on oak panel dated 1434 by the Early Netherlandish painter Jan van Eyck. The painting is a small full-length double portrait, which is believed to represent the Italian merchant Giovanni di Nicolao Arnolfini and possibly his wife, presumably in their home in the Flemish city of Bruges. It is considered one of the more original and complex paintings in Western art because of the iconography, the unusual geometric orthogonal perspective, the use of the mirror to reflect the space, and that the portrait is considered unique by some art historians as the record of a marriage contract in the form of a painting.', '<em>The Arnolfini Portrait</em> is an oil painting on oak panel dated 1434 by the Early Netherlandish painter Jan van Eyck. It is also known as The Arnolfini Wedding, The Arnolfini Marriage, The Arnolfini Double Portrait or the Portrait of Giovanni Arnolfini and his Wife, among other titles.', 1434, 82, 62, 'Oil on oak panel', '900.0000', '1100.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/The_Arnolfini_Portrait'),
(443, 116, 16, '116010', 'Portrait of the Artist Holding a Thistle', 1, 'http://www.louvre.fr/en/oeuvre-notices/self-portrait-or-portrait-artist-holding-thistle', 'R.F. 2382', '&copy; Musée du Louvre', '<em>Portrait of the Artist Holding a Thistle</em> is an oil painting on parchment pasted on canvas by German artist Albrecht Dürer, painted in 1493. It is the earliest of Dürer\'s painted self-portraits and has been identified as one of the first self-portraits painted by a Northern artist. The date, and the plant in the artist\'s hand, seem to suggest that this is a betrothal portrait.', '<em>Portrait of the Artist Holding a Thistle</em> is an oil painting on parchment pasted on canvas by German artist Albrecht Dürer, painted in 1493. It is the earliest of Dürer\'s painted self-portraits and has been identified as one of the first self-portraits painted by a Northern artist.', 1493, 57, 44, 'Oil on Wood', '600.0000', '675.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Portrait_of_the_Artist_Holding_a_Thistle_(Albrecht_D%C3%BCrer)'),
(445, 117, 2, '117010', 'The Garden of Earthly Delights', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-garden-of-earthly-delights-triptych/02388242-6d6a-4e9e-a992-e1311eab3609', 'P02823', 'Private, personal, academic, research or educational', '<em>The Garden of Earthly Delights</em> is the modern title given to a triptych painted by the Early Netherlandish master Hieronymus Bosch. It has been housed in the Museo del Prado in Madrid since 1939. Dating from between 1490 and 1510, when Bosch was between about 40 and 60 years old, it is his best-known and most ambitious complete work. It reveals the artist at the height of his powers; in no other painting does he achieve such complexity of meaning or such vivid imagery.', '<em>The Garden of Earthly Delights</em> is the modern title given to a triptych painted by the Early Netherlandish master Hieronymus Bosch. It is his best-known and most ambitious complete work. It reveals the artist at the height of his powers; in no other painting does he achieve such complexity of meaning or such vivid imagery.', 1490, 220, 390, 'Oil on panel', '1400.0000', '1600.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-garden-of-earthly-delights/EwHP5mUuUOzqVg', NULL, 'http://en.wikipedia.org/wiki/The_Garden_of_Earthly_Delights'),
(448, 118, 18, '118030', 'The Peasant Wedding', 2, 'https://www.khm.at/de/object/fe73f687e5/', '1027', 'Only for private use', '<em>The Peasant Wedding</em> is a 1567 painting by the Flemish Renaissance painter and printmaker Pieter Bruegel the Elder, one of his many depicting peasant life. It is currently housed in the Kunsthistorisches Museum, Vienna.', '<em>The Peasant Wedding</em> is a 1567 painting by the Flemish Renaissance painter and printmaker Pieter Bruegel the Elder, one of his many depicting peasant life. It is currently housed in the Kunsthistorisches Museum, Vienna.', 1567, 124, 164, 'Oil on Panel', '500.0000', '600.0000', 'http://www.google.com/culturalinstitute/asset-viewer/peasant-wedding/hgGvote2WI8P3w?projectId=art-project', NULL, 'http://en.wikipedia.org/wiki/The_Peasant_Wedding'),
(450, 120, 4, '120010', 'Portrait of Eleanor of Toledo', 1, 'http://www.uffizi.firenze.it/catalogo/', '1890, 748', 'Public domain', '<em>The Portrait of Eleanor of Toledo and Her Son</em> is a painting by the Italian artist Agnolo di Cosimo, known as Bronzino, finished ca. 1545. One of his most famous works, it is housed in the Uffizi Gallery of Florence, Italy and is considered one of the preeminent examples of Mannerist portraiture. The painting depicts Eleanor of Toledo, the wife of Cosimo I de\' Medici, Grand Duke of Tuscany, sitting with her hand resting on the shoulder of one of her sons. This gesture, as well as the pomegranate motif on her dress, referred to her role as mother. Eleanor wears a heavily brocaded dress with black arabesques. In this pose, she is depicted as the ideal woman of the Renaissance.', '<em>The Portrait of Eleanor of Toledo and Her Son</em> is a painting by the Italian artist Agnolo di Cosimo, known as Bronzino, finished ca. 1545. One of his most famous works, it is housed in the Uffizi Gallery of Florence, Italy and is considered one of the preeminent examples of Mannerist portraiture.', 1545, 115, 96, 'Oil on Panel', '675.0000', '850.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-eleonora-di-toledo-with-her-son-giovanni/QAEccCsLDtbB4A', 'This precious painting, documented by Vasari, depicts the Dutchess of Florence, Eleonora di Toledo, with her little son Giovanni. It was painted in 1545 by Bronzino, who was a student of Pontormo and the court portrait artist of the Medici. In spite of the official nature of the portrait, seen through the very refined clothing and the splendor of the jewelry, Bronzino joins the figures of the mother and child in an affectionate pose creating one of the masterpieces of European Portraiture of the 16th century. The painting has been in the Tribune since 1620.', 'http://en.wikipedia.org/wiki/Portrait_of_Eleanor_of_Toledo'),
(451, 120, 5, '120020', 'Venus, Cupid, Folly and Time', 1, 'https://www.nationalgallery.org.uk/paintings/bronzino-an-allegory-with-venus-and-cupid', 'NG651', 'Creative Commons BY-NC-ND 4.0', '<em>Venus, Cupid, Folly, and Time</em> is an allegorical painting by the Florentine artist Agnolo Bronzino. It is now in the National Gallery, London.', '<em>Venus, Cupid, Folly, and Time</em> is an allegorical painting by the Florentine artist Agnolo Bronzino. It is now in the National Gallery, London.', 1545, 146, 116, 'Oil on Wood', '800.0000', '900.0000', NULL, NULL, 'http://en.wikipedia.org/wiki/Venus,_Cupid,_Folly,_and_Time'),
(453, 121, 6, '121020', 'View of Toledo', 1, 'http://www.metmuseum.org/art/collection/search/436575', '29.100.6', 'Open Access for Scholarly Content', '<em>View of Toledo</em>, is one of the two surviving landscapes painted by El Greco. The other, called View and Plan of Toledo lies at Museo Del Greco, Toledo, Spain. Along with Vincent van Gogh\'s The Starry Night, some landscapes by William Turner, and some works by Monet, it is among the best known depictions of the sky in Western art, and features sharp color contrast between the sky and the hills below. Painted in a Mannerist (or Baroque) style, the work takes liberties with the actual layout of Toledo (some buildings are depicted in different positions than their actual location, but truthfully depicts on the side the Castle of San Servando).', '<em>View of Toledo</em>, is one of the two surviving landscapes painted by El Greco. The other, called View and Plan of Toledo lies at Museo Del Greco, Toledo, Spain. Along with Vincent van Gogh\'s The Starry Night, some landscapes by William Turner, and some works by Monet, it is among the best known depictions of the sky in Western art.', 1600, 121, 108, 'Oil on canvas', '700.0000', '800.0000', 'http://www.google.com/culturalinstitute/asset-viewer/view-of-toledo/LQEbD5GpU4Q65Q?projectId=art-project', NULL, 'http://en.wikipedia.org/wiki/View_of_Toledo'),
(455, 123, 30, '123010', 'Portrait of a Couple, Probably Isaac Abrahamsz Massa and Beatrix van der Laen', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.8608', 'SK-A-133', 'Public domain', 'This happy, smiling pair sits comfortably close to each other. Posing a couple together in this way was highly unusual at the time. It may have been prompted by the sitters’ friendship with the painter and the occasion for the commission – their marriage in April 1622. The painting thus contains references to love and devotion, such as the garden of love at right, and at left an eryngium thistle, known in Dutch as ‘mannentrouw’, or male fidelity.', 'This happy, smiling pair sits comfortably close to each other. Posing a couple together in this way was highly unusual at the time.', 1622, 140, 166, 'Oil on canvas', '700.0000', '900.0000', NULL, 'This is probably the marriage portrait of Isaac Abrahamsz Massa and Beatrix van der Laen, c. 1622. The Haarlem merchant Isaac Massa (1586-1643) and Beatrix van der Laen (1592-1639), the daughter of a former burgomaster, had their portraits painted on the occasion of their marriage, 25 April 1622. Her wedding-ring, worn on the right index finger, according to the custom of the day, is prominently displayed. Frans Hals has incorporated various symbols of love into the painting. For example, the spear thistle on the left is also known as \'man\'s fidelity\'. The ivy at the bride\'s feet also signifies faithfulness: the woman clings to her husband just as ivy clings to a wall. The vine twisting itself around the tree has a similar connotation.', 'https://en.wikipedia.org/wiki/Marriage_Portrait_of_Isaac_Massa_and_Beatrix_van_der_Laen'),
(456, 123, 30, '123020', 'Portrait of Feyntje van Steenkiste', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.8611', 'SK-C-557', 'Public domain', 'This pendant portrays the wife of Lucas de Clercq. Spouses were customarily depicted separately, the husband on the left and the wife on the right, both turned towards each other. The light almost always came from the left, illuminating the face of the woman evenly, and casting striking shadows on that of the man. Hals portrayed the woman – as was usual – in a more static pose than that of the man.', 'This pendant portrays the wife of Lucas de Clercq', 1635, 123, 93, 'Oil on canvas', '700.0000', '800.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Feyntje_Steenkiste'),
(457, 123, 30, '123030', 'Portrait of Lucas de Clercq', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.8612', 'SK-C-556', 'Public domain', 'Frans Hals, like no other, was able to bring his sitters to life. In this portrait, the Haarlem merchant Lucas de Clercq is shown with his left arm akimbo and his right arm resting on his stomach. Even though his hands are hidden and still, his vitality is expressed in the animated contour of his body and his slightly turned head.', ' In this portrait, the Haarlem merchant Lucas de Clercq is shown with his left arm akimbo and his right arm resting on his stomach.', 1635, 126, 93, 'Oil on canvas', '700.0000', '800.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-lucas-de-clercq/CwGkOpgoJLk5cQ', NULL, 'https://commons.wikimedia.org/wiki/File:Frans_Hals_-_Lucas_de_Clercq_-_WGA11125.jpg'),
(458, 123, 30, '123040', 'Portrait of Maritge Claesdr Vooght', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.8688', 'SK-C-139', 'Public domain', 'Frans Hals painted a large number of superb likenesses of members of Haarlem’s upper class: he clearly knew how to satisfy the demands of his eminent patrons. Maritge Vooght, wife of the mayor Pieter Olycan, is here portrayed in a traditional pose, proudly sitting upright and looking straight out at the viewer. Hals noted her age, 62, at left. Her coat of arms was added later by a different hand.', 'Maritge Vooght, wife of the mayor Pieter Olycan, is here portrayed in a traditional pose, proudly sitting upright and looking straight out at the viewer.', 1639, 128, 94, 'Oil on canvas', '700.0000', '800.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Maritge_Claesdr._Voogt'),
(459, 123, 30, '123050', 'Portrait of a Woman', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.8607', 'SK-A-1247', 'Public domain', 'Compared with the dynamic Portrait of a Man, this one of his wife makes a somewhat more formal impression. The pose is traditional, with the upper torso turned slightly to the left. She looks straight at the viewer, her lips slightly parted as though she is about to speak. Her face is rendered in much thinner paint than that of her husband, beautifully suggesting the greater softness of a woman’s skin.', 'The pose is traditional, with the upper torso turned slightly to the left. She looks straight at the viewer, her lips slightly parted as though she is about to speak', 1635, 79, 66, 'Oil on canvas', '700.0000', '800.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-a-woman/XwGjG4Da87WLzQ', NULL, 'https://en.wikipedia.org/wiki/Sara_Wolphaerts_van_Diemen'),
(460, 123, 30, '123060', 'A Militiaman Holding a Berkemeyer', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.8609', 'SK-A-135', 'Public domain', 'This militiaman merrily raises his glass to toast us – who would not wish to join him? The execution is just as free and easy as the sitter himself: the swift, spontaneously applied brushstrokes enhance the portrait’s sense of liveliness and animation. The man actually seems to be moving. This bravura painting style ensured the continued success of Frans Hals.', ' The execution is just as free and easy as the sitter himself: the swift, spontaneously applied brushstrokes enhance the portrait’s sense of liveliness and animation', 1629, 81, 66, 'Oil on canvas', '800.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-militiaman-holding-a-berkemeyer-known-as-the-merry-drinker/EgGWR2aHD9M7aA', 'This cheery young man is raising his glass as if to propose a toast. Although the fashion was then for intricate, detailed paintings, Hals applied his paints with quick, confident strokes. This style of painting gives the subject a real sense of movement. This is most obvious with the right hand.', NULL);
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(461, 123, 30, '123070', 'Militia Company of District XI', 4, 'http://hdl.handle.net/10934/RM0001.COLLECT.8613', 'SK-C-374', 'Public domain', 'A commission for a civic guard portrait was rarely granted to a painter from outside the city. Quite exceptionally, Frans Hals – from Haarlem – was asked to paint this group portrait. However, he soon found himself at odds with the guardsmen, and the Amsterdam painter Pieter Codde had to step in to finish the seven figures on the right. Known for his small-scale, very smoothly and finely executed works, Codde nevertheless imitated Hals’s loose style as best he could.', 'Militia Company of District XI under the Command of Captain Reynier Reael, Known as ‘The Meagre Company’', 1637, 429, 209, 'Oil on canvas', '1000.0000', '1400.0000', 'https://www.google.com/culturalinstitute/beta/asset/militia-company-of-district-xi-under-the-command-of-captain-reynier-reael-known-as-the-meagre-company/hAEZoaxqjpODHg', NULL, 'https://en.wikipedia.org/wiki/Meagre_Company'),
(462, 124, 30, '124010', 'Self-portrait', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.378037', 'SK-A-383', 'Public domain', 'A distinguished citizen dressed in decorous black is seated before a red curtain and tassel. Jan Steen, known primarily for his humorous scenes with simple folk, portrayed himself here as utterly self-assured. He also regularly included himself in other paintings, but then usually in a comic role.', 'Jan Steen, known primarily for his humorous scenes with simple folk, portrayed himself here as utterly self-assured.', 1670, 73, 62, 'Oil on canvas', '700.0000', '800.0000', NULL, NULL, 'https://commons.wikimedia.org/wiki/File:1670_Jan_Havicksz._Steen_-_zelfportret.jpg'),
(463, 124, 30, '124020', 'The Merry Family', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5577', 'SK-C-229', 'Public domain', 'This boisterous family is making a lot of noise: the father sings at the top of his lungs while raising a glass; the mother and grandmother chime in; and the children are either blowing into a wind instrument or smoking a long pipe. The note hanging from the mantelpiece gives away the moral of the story: ‘As the old sing, so shall the young twitter.’ What will become of the children if their parents set the wrong example?', ' The note hanging from the mantelpiece gives away the moral of the story: ‘As the old sing, so shall the young twitter.’', 1668, 110, 141, 'Oil on canvas', '800.0000', '1000.0000', 'https://www.google.com/culturalinstitute/beta/asset/PgG66BfO4KGbiA', 'The household depicted here is a cheerful madhouse. Old and young are enjoying themselves to the hilt: the mother and grand - mother have broken into song, the children are making music or smoking, while the father raises his glass. The younger children follow his example. The note on the\r\nmantel-piece says it all: \'So father, so son.\' Steen\'s composition illustrated this old saying, making it clear that bad examples are quickly followed. Jan Steen is perhaps best known for his scenes taken from everyday life: families gathered around the table, people drinking in a tavern. At first glance they are amusing, but there is often a subtle reference or hidden message tucked away somewhere in a text. Steen was a good storyteller with a gift for staging, and he knew how to capture the mood of a piece.', 'https://en.wikipedia.org/wiki/Jan_Steen#/media/File:Jan_Havicksz._Steen_-_Het_vrolijke_huisgezin_-_Google_Art_Project.jpg'),
(464, 124, 30, '124030', 'The Feast of St Nicholas', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5500', 'SK-A-385', 'Public domain', 'The feast of St Nicholas takes place in December. In the Netherlands, it has been celebrated in the same way for centuries. Good children receive gifts from the saint. The little girl in the foreground, for instance, has a bucket full of treats. Naughty children, like the wailing boy at the left, get only a switch (a bundle of twigs) in their shoe. Jan Steen was a born storyteller. He succeeded in incorporating all of the elements of the popular feast in this picture.', 'Good children receive gifts from the saint. The little girl in the foreground, for instance, has a bucket full of treats. Naughty children, like the wailing boy at the left, get only a switch (a bundle of twigs) in their shoe.', 1666, 82, 70, 'Oil on canvas', '700.0000', '800.0000', 'https://www.google.com/culturalinstitute/beta/asset/HQH272DWHOl8aA', 'It is the fifth of December: the feast of St. Nicholas. Next to the chimney, traditional carols are being sung. The holy man has just arrived with presents for the children: a doll and a bucket full of candy for the girl, and for her little brother a golf club. The boy is pointing gleefully at his big brother, who has found a birch rod in his shoe instead of a present (indicating he has been a naughty boy). But grandmother is beckoning to him: no doubt there is a present for him after all, behind the curtain. Steen has succeeded in capturing the special atmosphere of this celebration. Considerable attention is given to all the goodies in the foreground: \'speculaas\', waffles, and a diamond-shaped sweet loaf called a \'duivekater\'. But the story is the main focus of the painting. And, like the born storyteller he is, Steen uses looks and gestures to make this clear.', 'https://en.wikipedia.org/wiki/The_Feast_of_Saint_Nicholas'),
(465, 124, 30, '124040', 'Children Teaching a Cat to Dance', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5502', 'SK-A-718', 'Public domain', 'There is mischief-making going on here! A group of children are teaching a cat to dance, to the music of a shawm, a 17th-century wind instrument. They are clearly enjoying themselves, but the cat is screeching its displeasure, and the dog is barking loudly. An old man angrily reprimands the children from a window high in the wall of the room. Jan Steen knew how to reproduce the ear splitting din of the scene.', 'These children are up to mischief: they are teaching a cat to dance to the music of a shawm, a 17th-century wind instrument.', 1670, 68, 59, 'Oil on panel', '700.0000', '800.0000', 'https://www.google.com/culturalinstitute/beta/asset/children-teaching-a-cat-to-dance-known-as-the-dancing-lesson/sAFdhRy2KCBhPA', NULL, NULL),
(466, 124, 30, '124050', 'Woman at her Toilet', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5507', 'SK-A-4052', 'Public domain', 'This is an intimate moment – a girl undressing before going to bed. She is just pulling off a stocking. The indentation left by her garter is visible just below her knee. Her raised skirt allows the viewer a peak up along her bare legs. The image’s explicit eroticism did not always find favour; until a hundred years ago, an underskirt was painted over her thighs.', 'This is an intimate moment – a girl undressing before going to bed. She is just pulling off a stocking.', 1658, 37, 27, 'Oil on canvas', '450.0000', '500.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Jan_Steen#/media/File:Jan_Havicksz._Steen00.jpg'),
(467, 106, 30, '106050', 'Woman Reading a Letter', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.6420', 'SK-C-251', 'Public domain', 'Enjoying a quiet, private moment, this young woman is absorbed in reading a letter in the morning light. She is still wearing her blue night jacket. All of the colours in the composition are secondary to its radiant lapis lazuli blue. Vermeer recorded the effects of light with extraordinary precision. Particularly innovative is his rendering of the woman’s skin with pale grey, and the shadows on the wall using light blue.', 'Enjoying a quiet, private moment, this young woman is absorbed in reading a letter in the morning light. She is still wearing her blue night jacket.', 1663, 46, 39, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/woman-reading-a-letter/QQF82wPVTRfMPw', NULL, 'https://en.wikipedia.org/wiki/Woman_in_Blue_Reading_a_Letter'),
(468, 106, 30, '106060', 'View of Houses in Delft', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.6419', 'SK-A-2860', 'Public domain', 'This painting of a quiet street with a few figures occupies an exceptional place in Vermeer’s oeuvre. Straight angles give the composition balance, while the triangle of the sky introduces a sense of dynamism. The old walls, coarse bricks, and white plasterwork are almost palpable. Vermeer nonetheless took some liberties with reality, such as the oversized green shutters.', 'This painting of a quiet street with a few figures occupies an exceptional place in Vermeer’s oeuvre.', 1658, 44, 54, 'Oil on canvas', '1000.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-little-street/YAGJRuPz8yVuRQ', 'Also known as View of Houses in Delft, this is the only known outdoor scene by Vermeer of this type: a quiet street with only a few figures. The artist has captured the various materials meticulously: the worn bricks of the masonry, the gleam of the leaded windows, the white- plastered wall. The paint is applied thickly in one spot and thinly in another; in some places it is smooth, in others grainy.', 'https://en.wikipedia.org/wiki/The_Little_Street'),
(469, 105, 30, '105040', 'Militia Company of District II under the Command of Captain Frans Banninck Cocq, Known as the ‘Night Watch’', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.5216', 'SK-C-5', 'Public domain', 'Rembrandt’s largest, most famous canvas was made for the Arquebusiers guild hall. This was one of several halls of Amsterdam’s civic guard, the city’s militia and police. Rembrandt was the first to paint figures in a group portrait actually doing something. The captain, dressed in black, is telling his lieutenant to start the company marching. The guardsmen are getting into formation. Rembrandt used the light to focus on particular details, like the captain’s gesturing hand and the young girl in the foreground. She was the company mascot.', 'Rembrandt’s largest, most famous canvas was made for the Arquebusiers guild hall.', 1642, 453, 379, 'Oil on canvas', '4000.0000', '4500.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-night-watch/eQEojRwTdypUKA', 'The Night Watch, the most famous painting in the Rijksmuseum, actually has another title: Militia Company of District II under the Command of Captain Frans Banninck Cocq. A militia painting is a group portrait of a division of the civic guard. Rembrandt depicted the group of militiamen in an unusual way. Not in a neat row or sitting at their annual banquet, rather, he recorded a moment: a group of militiamen have just moved into action and are about to march off.', 'https://en.wikipedia.org/wiki/The_Night_Watch'),
(470, 105, 30, '105050', 'Portrait of Johannes Wtenbogaert', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.50214', 'SK-A-4885', 'Public domain', 'The 76-year-old Remonstrant minister, once the court chaplain of Prince Maurice, wears a calotte (skullcap) and a ‘tabard’, a fur-lined cloak – the kind of clothing elderly scholars preferred to be portrayed in. Wtenbogaert’s face is more realistically modelled than his hands, which may have been done by a pupil in Rembrandt’s workshop.', 'The 76-year-old Remonstrant minister, once the court chaplain of Prince Maurice, wears a calotte (skullcap) and a ‘tabard’, a fur-lined cloak', 1633, 103, 130, 'Oil on canvas', '1000.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-johannes-wtenbogaert/OAGi5DuRI07nxg', 'Wtenbogaert (1557- 644) was a famous preacher, the founder and leader of the Remonstrant Brotherhood. At the request of one of his followers, he had his portrait painted by Rembrandt when he was 76 years of age. At this time Rembrandt was beginning to make a name for himself in Amsterdam as a portrait painter. This large work is one of the best portraits from that period. The large black cloak lends an imposing gravity to the figure of the old man, automatically leading the eye of the viewer to the white collar and the face. The hands appear to have been done by an assistant, but the face is Rembrandt at his best: with the raised eyebrows the artist has given the old man an individual characterization.', 'https://en.wikipedia.org/wiki/Johannes_Wtenbogaert'),
(471, 105, 30, '105060', 'Self-portrait', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5236', 'SK-A-4691', 'Public domain', 'Even as an inexperienced young artist, Rembrandt did not shy away from experimenting. Here the light glances along his right cheek, while the rest of his face is veiled in shadow. It takes a while to realize that the artist is gazing intently out at us. Using the butt end of his brush, Rembrandt made scratches in the still wet paint to accentuate the curls of his tousled hair.', 'Here the light glances along his right cheek, while the rest of his face is veiled in shadow. It takes a while to realize that the artist is gazing intently out at us.', 1628, 187, 22, 'Oil on canvas', '800.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/self-portrait/AQHvOEXiF3p9fg', 'This is one of the first works in which Rembrandt portrayed himself - he was about 22 years old. The light is strong and comes from behind. Rembrandt\'s face is in shadow and difficult to distinguish. The experimental manner in which the hair is rendered is interesting: Rembrandt made scratches in the wet paint, allowing the undercoat to show through.', NULL),
(472, 105, 30, '105070', 'Portrait of Marten Soolmans', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.612987', 'SK-A-5033', 'Public domain', 'Painted on the occasion of his marriage to Oopjen Coppit in 1634 and in 2015 purchased from the Rothschilds as part of a joint collaboration between the Rijksmuseum and the Louvre. It is considered a pendant portrait, and the portrait of his wife was included in the sale. Together the paintings were sold for 160 million Euro', 'Painted on the occasion of his marriage to Oopjen Coppit in 1634', 1634, 132, 207, 'Oil on canvas', '600.0000', '700.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Portrait_of_Marten_Soolmans'),
(473, 105, 30, '105080', 'The Sampling Officials of the Amsterdam Drapers’ Guild', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.5217', 'SK-C-6', 'Public domain', 'This is Rembrandt’s first and only corporate group portrait. The Syndics stands out for its exceptionally large format and more than life-sized figures. All eyes of the sampling officials – who assessed the quality of dyed cloth – are turned to us and one figure even rises from his chair as if to acknowledge our presence. Because of the low vantage point, the table seems to jut out of the picture.', 'This is Rembrandt’s first and only corporate group portrait. The Syndics stands out for its exceptionally large format and more than life-sized figures.', 1662, 279, 191, 'Oil on canvas', '1800.0000', '1900.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-syndics/ZgHt6DZhk-6SVw', 'It is as if we just distracted the wardens of the Amsterdam drapers\' guild from their work, so realistically Rembrandt has portrayed them. The servant in the background is the only person without a hat. To avoid having all the heads on exactly the same level, one of the officials is standing, just about to seat himself. This clever solution, the loose brushstrokes and the subtle light make this one of the most lively group portraits of the 17th century. The syndics monitored the quality of dyed \'laken\', a feltlike woollen fabric. Their portrait was intended over the fireplace of the conference room of the laken guild. Rembrandt has adjusted his perspective to take this into account: we are looking at the table as if from below. Painted for the Staalhof, the headquarters of the laken guild in the Staalstraat in Amsterdam. In 1771 it was transferred to the townhall.', 'https://en.wikipedia.org/wiki/Syndics_of_the_Drapers%27_Guild'),
(474, 105, 30, '105090', 'Portrait of a Couple as Isaac and Rebecca, known as ‘The Jewish Bride’', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.5223', 'SK-C-216', 'Public domain', 'Two contemporaries had themselves portrayed by Rembrandt in historicizing costumes as characters from the Bible. The couple’s tender embrace is at the centre of this poignant painting: the man’s loving gesture is returned with a gentle caress. The figures and their poses agree with the study (No 67), only the figure of King Abimelech spying on them is missing. We, the viewers, assume his role as witnesses of their clandestine love.', 'The couple’s tender embrace is at the centre of this poignant painting: the man’s loving gesture is returned with a gentle caress.', 1667, 166, 121, 'Oil on canvas', '1000.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/isaac-and-rebecca-known-as-the-jewish-bride/hAERFV8rdOOssw', 'The name \'The Jewish bride\', given to this painting in the 19th century, is a flight of fancy. The sitters probably asked Rembrandt to portray them as the biblical couple Isaac and Rebecca. They are attired in splendid oriental robes, and their tender embrace betrays their great love for one another. For this painting, which was done towards the end of his life, Rembrandt adopted an exceptionally free style. The man\'s sleeve is particularly interesting. The paint has been applied in blobs and daubs which reflect the light. In this way he used paint to add not only colour, but also relief.', 'https://en.wikipedia.org/wiki/The_Jewish_Bride'),
(475, 105, 30, '105100', 'Portrait of Haesje Jacobsdr van Cleyburg', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5225', 'SK-A-4833', 'Public domain', 'Haesje van Cleyburg, the wife of a wealthy Rotterdam beer brewer, is fashionably yet extremely soberly dressed. She has not been made more beautiful than she was: the wrinkles, shadows under her eyes, the bushy eyebrows, and the greying hair are all rendered with painstaking realism. What makes the portrait so charming is the faint smile that plays across her slightly parted lips.', 'Haesje van Cleyburg, the wife of a wealthy Rotterdam beer brewer, is fashionably yet extremely soberly dressed.', 1634, 53, 68, 'Oil on canvas', '700.0000', '800.0000', NULL, NULL, 'https://commons.wikimedia.org/wiki/File:Rembrandt,_Portret_van_Haesje_v.Cleyburg_1634.jpg'),
(476, 105, 30, '105110', 'Self Portrait as the Apostle Paul', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5280', 'SK-A-4050', 'Public domain', 'This is Rembrandt’s first and only self portrait in the guise of a biblical figure. The manuscript and the sword projecting from his cloak are Paul’s traditional attributes. Like the other apostles Rembrandt painted in the same period, Paul too is a real, everyday person. By using his own likeness here Rembrandt encourages a direct bond with the saint.', 'This is Rembrandt’s first and only self portrait in the guise of a biblical figure.', 1661, 77, 91, 'Oil on canvas', '800.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/self-portrait-as-the-apostle-paul/LwGcE5lQC5dLUg', 'Here Rembrandt is 55 or 56 years old. He has portrayed himself as the apostle Paul, shown together with his traditional attributes: a sword - the hilt of which is sticking out of his coat - and a manuscript written in letters which resemble Hebrew. In Protestant circles St. Paul was revered as the most important preacher of the Word of God.', 'https://en.wikipedia.org/wiki/Self-portrait_as_the_Apostle_Paul'),
(477, 105, 30, '105120', 'Jeremiah Lamenting the Destruction of Jerusalem', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.5242', 'SK-A-3276', 'Public domain', 'Downcast, the biblical prophet Jeremiah leans his tired head on his hand. He mourns the burning city of Jerusalem (left background), the destruction of which he had predicted. The most important part of the depiction – the figure of Jeremiah – is painted with great precision, while his surroundings are barely worked out. Rembrandt used powerful contrasts of light and shadow to heighten the drama of the scene.', 'The most important part of the depiction – the figure of Jeremiah – is painted with great precision, while his surroundings are barely worked out', 1630, 46, 58, 'Oil on panel', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/jeremiah-lamenting-the-destruction-of-jerusalem/4gE-j88Uz3znNw', 'Despondently, his old head in his hands, the Biblical prophet Jeremia weeps over the burning of Jerusalem, visible in the left background. The prophet had himself predicted its destruction. This is one of the best paintings Rembrandt did just before leaving the city of Leiden. By this time he was making use of pronounced light and dark contrasts to separate significant elements from less important ones, and to heighten the dramatic impact of a scene. The differences in finishing are also characteristic: the surroundings are rendered cursorily, whereas in the foreground Rembrandt has devoted considerable attention to the representation of fabric and materials, and the reflection of light.', 'https://commons.wikimedia.org/wiki/File:Rembrandt_Harmensz._van_Rijn_-_Jeremia_treurend_over_de_verwoesting_van_Jeruzalem_-_Google_Art_Project.jpg'),
(478, 125, 30, '125010', 'Portrait of Alida Christina Assink', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.358121', 'SK-C-1672', 'Public domain', 'Dressed in the latest fashion, Alida Assink poses here for the society painter Kruseman. The clothing gives her a stylish silhouette: broad shoulders, puff sleeves and a hoop skirt make her waist seem very slim. The large belt buckle further accentuates this. Kruseman admired English portraiture. The rural set-ting with a hunting dog and a garden vase is derived from English models.', 'Dressed in the latest fashion, Alida Assink poses here for the society painter Kruseman.', 1833, 149, 206, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(479, 125, 30, '125020', 'Portrait of William II, King of the Netherlands', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.10653', 'SK-C-170', 'Public domain', 'This is a portrait of King William II in military uniform, but with a decidedly informal air. Accompanied by his hound, he poses casually in the dunes, which in the Romantic era was considered the quintessentially Dutch landscape. In 1848 –when revolutions were raging throughout Europe –William II renounced royal autocracy and the Netherlands became a parliamentary democracy.', 'This is a portrait of King William II in military uniform, but with a decidedly informal air.', 1839, 86, 109, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(481, 126, 30, '126010', 'A Mother Delousing her Child’s Hair, Known as ‘A Mother’s Duty’', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.8769', 'SK-C-149', 'Public domain', 'A mother thoroughly inspects her child’s head for lice. She pursues her task in a sober Dutch interior, with Delft blue tiles and a box bed. In the right foreground is a ‘kakstoel’, or potty chair. Through the doorway is a glimpse of a sunny back room and a garden. De Hooch specialized in such ‘through-views’.', 'A mother thoroughly inspects her child’s head for lice. She pursues her task in a sober Dutch interior, with Delft blue tiles and a box bed.', 1659, 61, 52, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(482, 126, 30, '126020', 'Interior with Women beside a Linen Cupboard`', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.8772', 'SK-C-1191', 'Public domain', 'This scene of domestic virtue dates from De Hooch’s Amsterdam period. In a richly appointed house, two women put freshly pressed linen into a cupboard. They have hitched up their skirts to keep them clean while doing household chores. In the doorway a child plays with a kolfstok, a kind of hockey stick. Brightly lit canal houses can be seen.', 'This scene of domestic virtue dates from De Hooch’s Amsterdam period.', 1663, 75, 70, 'Oil on canvas', '670.0000', '920.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Two_Women_Beside_a_Linen_Chest,_with_a_Child'),
(483, 127, 30, '127010', 'The Windmill at Wijk bij Duurstede', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.5333', 'SK-C-211', 'Public domain', 'The windmill rises up majestically, defying the dark rain clouds and overshadowing the castle and the church of Wijk bij Duurstede. The River Lek flows in the foreground. This painting is world famous, and rightly so. In this impressive composition, Ruisdael united all the typical Dutch elements – the low-lying land, the water and the expansive sky – manipulating them to converge on the equally characteristic Dutch watermill.', 'The painting shows Wijk bij Duurstede, a riverside town about 20 kilometers from Utrecht', 1670, 101, 83, 'Oil on canvas', '1100.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-windmill-at-wijk-bij-duurstede/5gHsKOHsLvPatg', 'Viewed from a low perspective, the mill contrasts majestically against the dark sky. The buildings further in the distance are the castle and St Maarten\'s church at Wijk bij Duurstede, a major city in the Golden Age. The river in the foreground is the Lek. This is the epitome of a Dutch landscape: flat country, lots of water, sky and windmills.', 'https://en.wikipedia.org/wiki/Windmill_at_Wijk_bij_Duurstede'),
(484, 127, 30, '127020', 'Winter Landscape', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.5331', 'SK-A-349', 'Public domain', 'Ruisdael painted around 25 winter landscapes. This scene is dominated by ominous dark clouds, and lit from the left by low, raking sunlight. The warmly dressed figures on the ice seem insignificant in the face of this inclement weather. A cheerful crowd of ice skaters would have been out of place in such a wintery landscape by Ruisdael.', ' This scene is dominated by ominous dark clouds, and lit from the left by low, raking sunlight.', 1665, 49, 42, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(486, 128, 30, '128010', 'Morning Ride Along the Beach', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.9020', 'SK-A-3602', 'Public domain', 'Hague School painters were drawn to the harsh existence of poor fishermen, like those living in nearby Scheveningen. Here, however, Mauve depicted the other side of that fishing village: the sunny world of the well-to-do bourgeoisie. Three riders descend to the beach, where the bathing cabins stand ready for swimmers. The blond and blue colour scheme effectively conveys the briny atmosphere of a summer day along the seashore.', 'Here Mauve depicted the other side of that fishing village: the sunny world of the well-to-do bourgeoisie.', 1876, 68, 43, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, 'https://commons.wikimedia.org/wiki/File:Anton_Mauve_-_Morgenrit_langs_het_strand.jpg'),
(487, 128, 30, '128020', 'The Vegetable Garden', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.9024', 'SK-A-2524', 'Public domain', 'Mauve called himself a real ‘outdoors man’. From 1884 he regularly painted the vegetable and fruit gardens of farms. He used a bright palette instead of the greyish tones he had favoured a few years earlier. The vegetable garden here displays a wealth of green tonalities. The white accents of the linen and the woman’s cap lend depth and freshness to the image.', 'From 1884 he regularly painted the vegetable and fruit gardens of farms. He used a bright palette instead of the greyish tones he had favoured a few years earlier.', 1885, 87, 61, 'Oil on canvas', '750.0000', '900.0000', NULL, NULL, NULL),
(488, 129, 30, '129010', 'The Death of the Pharaoh’s Firstborn Son', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.5773', 'SK-A-2664', 'Public domain', 'In this scene from the biblical book of Exodus, Moses and Aaron (upper right) visit the pharaoh, who is mourning his son. The Egyptian ruler’s son had died from one of the plagues sent by God to secure the Israelites’ release from Egypt. The gloom of the painting reflects the father’s intense grief. One has to look long and hard to discern all the figures and details.', 'In this scene from the biblical book of Exodus, Moses and Aaron (upper right) visit the pharaoh, who is mourning his son.', 1872, 124, 77, 'Oil on canvas', '900.0000', '1200.0000', NULL, NULL, NULL),
(489, 129, 30, '129020', 'The Egyptian Widow', 2, 'http://hdl.handle.net/10934/RM0001.COLLECT.5776', 'SK-A-2427', 'Public domain', 'The Frisian artist Alma-Tadema was a great success in England, where he was even knighted. His representations of ancient Egyptian, Greek and Roman scenes made him one of the most popular 19th-century painters. In this picture, full of archaeological details, a woman is mourning beside the inner mummy case containing the body of her husband. His sarcophagus stands at left, while priests and singers lament the departed.', 'In this picture, full of archaeological details, a woman is mourning beside the inner mummy case containing the body of her husband.', 1872, 99, 74, 'Oil on canvas', '800.0000', '1050.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-egyptian-widow/twGCKY0wRr9MWw?hl=en', NULL, NULL),
(490, 129, 27, '129030', 'Spring', 5, 'http://www.getty.edu/art/collection/objects/611/lawrence-alma-tadema-spring-dutch-1894/', '72.PA.3', 'Public domain', 'A procession of women and children descending marble stairs carry and wear brightly colored flowers. Cheering spectators fill the windows and roof of a classical building. Lawrence Alma-Tadema here represented the Victorian custom of sending children into the country to collect flowers on the morning of May 1, or May Day, but placed the scene in ancient Rome. In this way, he suggested the festival\'s great antiquity through architectural details, dress, sculpture, and even the musical instruments based on Roman originals.', 'A procession of women and children descending marble stairs carry and wear brightly colored flowers.', 1894, 178, 80, 'Oil on canvas', '1000.0000', '1300.0000', NULL, NULL, 'https://commons.wikimedia.org/wiki/File:Alma_Tadema_Spring.jpg'),
(492, 130, 30, '130010', 'Portrait of a young Woman, with \'Puck\' the Dog', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.7476', 'SK-A-1703', 'Public domain', 'Thérèse Schwartze painted this model wearing Italian garb in her atelier in Paris. The young woman exchanges a glance with Puck, the dog at her right. The various rich fabrics of her dress are masterfully rendered. At the time, for a young Dutch woman to work in Paris was as unconventional as pursuing an artistic career. However, as the seasoned daughter of a professional painter, Schwartze was not deterred by such obstacles.', 'Thérèse Schwartze painted this model wearing Italian garb in her atelier in Paris. The young woman exchanges a glance with Puck, the dog at her right.', 1880, 103, 144, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(493, 130, 30, '130020', 'Three girls from the Amsterdam Orphanage', 3, 'http://hdl.handle.net/10934/RM0001.COLLECT.7207', 'SK-A-1190', 'Public domain', 'Three girls from the Amsterdam Orphanage. One reads from a book while another listens and is another busy mending. To the left is a laundry basket, while on the right lies a sleeping cat on a bench.', 'Three girls from the Amsterdam Orphanage. One reads from a book while another listens and is another busy mending. To the left is a laundry basket, while on the right lies a sleeping cat on a bench.', 1885, 96, 81, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(495, 5, 27, '005080', 'Portrait of the Sisters Zenaide and Charlotte Bonaparte\r\nPortrait of the Sisters Zénaïde and Charlotte Bonaparte', 1, 'http://www.getty.edu/art/collection/objects/802/jacques-louis-david-portrait-of-the-sisters-zenaide-and-charlotte-bonaparte-french-1821/', '86.PA.740', 'Public domain', 'The Sisters Zenaide and Charlotte Bonaparte, Napoleon\'s nieces, embrace as they read a letter from their father, Joseph Bonaparte, who was exiled in the United States while they lived in Brussels, Belgium, after Napoleon\'s fall from power. The folds of the carefully creased paper are realistically rendered, and the viewer can even decipher a Philadelphia address on the letter.', 'The Sisters Zenaide and Charlotte Bonaparte, Napoleon\'s nieces, embrace as they read a letter from their father, Joseph Bonaparte', 1821, 100, 129, 'Oil on canvas', '800.0000', '1000.0000', 'https://www.google.com/culturalinstitute/beta/asset/zenaide-and-carlotta-bonaparte/OQEgWJJ50fcp7g', NULL, NULL),
(496, 108, 27, '108020', 'Still Life with Fish, Vegetables, Gougères, Pots, and Cruets on a Table\r\nStill Life with Fish, Vegetables, Gougères, Pots, and Cruets on a Table', 1, 'http://www.getty.edu/art/collection/objects/201125/jean-simeon-chardin-still-life-with-fish-vegetables-gougeres-pots-and-cruets-on-a-table-french-1769/', '2003.13', 'Public domain', 'The objects\' arrangement is spare but dynamic: Two mackerels hang vertically in front of a plain background, perpendicular to an arrangement of food on the tabletop below. Brilliant light directs the eye, attracting attention to the shiny fish, leafy greens, root vegetables, a wheel of cheese, and covered bowls. Although the overall palette is subdued, the oil and vinegar cruets are infused with rich color. The signature and date in the lower right corner are the last Chardin is known to have applied to a still life.', 'Chardin here transforms a simple kitchen scene with a subtle palette, innovative composition, and virtuoso brushwork', 1769, 58, 68, 'Oil on canvas', '800.0000', '950.0000', NULL, NULL, NULL),
(497, 113, 27, '113020', 'The Vicomtesse de Vaudreuil', 1, 'http://www.getty.edu/art/collection/objects/782/elisabeth-louise-vigee-le-brun-the-vicomtesse-de-vaudreuil-french-1785/', '85.PB.443', 'Public domain', 'On an oval panel, a young woman poses in front of a landscape. Smiling slightly, she looks candidly out at the viewer. The sitter, Victoire-Pauline de Riquet de Carama, was an aristocrat and her status improved when she married Jean-Louis, Vicomte de Vaudreuil in 1781. The artist Elisabeth Louise Vigée Le Brun emphasized the Vicomtesse\'s status and refinement by carefully describing her fashionable straw hat, silk dress, and gauze scarf, collar, and cuffs. Displaying her learning, the Vicomtesse places her right thumb in her book to mark her place, as if she has been interrupted while reading. Vigée Le Brun adopted this obvious gesture, often used in men\'s portraits, to illustrate women\'s importance in French Enlightenment circles.', 'On an oval panel, a young woman poses in front of a landscape. Smiling slightly, she looks candidly out at the viewer. The sitter, Victoire-Pauline de Riquet de Carama, was an aristocrat and her status improved when she married Jean-Louis, Vicomte de Vaudreuil in 1781.', 1785, 64, 83, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(498, 19, 27, '019130', 'Irises', 2, 'http://www.getty.edu/art/collection/objects/826/vincent-van-gogh-irises-dutch-1889/', '90.PA.20', 'Public domain', 'In May 1889, after episodes of self-mutilation and hospitalization, Vincent van Gogh chose to enter an asylum in Saint-Rémy, France. There, in the last year before his death, he created almost 130 paintings. Within the first week, he began Irises, working from nature in the asylum\'s garden. The cropped composition, divided into broad areas of vivid color with monumental irises overflowing its borders, was probably influenced by the decorative patterning of Japanese woodblock prints. Each one of Van Gogh\'s irises is unique. He carefully studied their movements and shapes to create a variety of curved silhouettes bounded by wavy, twisting, and curling lines. The painting\'s first owner, French art critic Octave Mirbeau, one of Van Gogh\'s earliest supporters, wrote: \"How well he has understood the exquisite nature of flowers!\"', 'Each one of Van Gogh\'s irises is unique. He carefully studied their movements and shapes to create a variety of curved silhouettes bounded by wavy, twisting, and curling lines.', 1889, 94, 74, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/irises/DgFVFAJo_30MeQ', NULL, 'https://en.wikipedia.org/wiki/Irises_(painting)'),
(499, 100, 27, '100050', 'Venus and Adonis', 2, 'http://www.getty.edu/art/collection/objects/846/titian-tiziano-vecellio-venus-and-adonis-italian-about-1555-1560/', '92.PA.42', 'Public domain', 'Titian\'s loose, energetic strokes of paint give the painting a sense of spontaneity and movement. In some areas, the artist even painted with his finger, as seen in Adonis\'s arm. The composition\'s dynamism springs from the torsion caused by Venus\'s awkward pose, which was inspired by an ancient sculptural relief. Titian used rich colors, shimmering highlights, and a lush landscape to create the painting\'s evocative, poignant mood.', 'The composition\'s dynamism springs from the torsion caused by Venus\'s awkward pose, which was inspired by an ancient sculptural relief. Titian used rich colors, shimmering highlights, and a lush landscape to create the painting\'s evocative, poignant mood.', 1558, 196, 160, 'Oil on canvas', '800.0000', '1000.0000', NULL, NULL, 'https://en.wikipedia.org/wiki/Venus_and_Adonis_(Titian,_Madrid)'),
(500, 100, 27, '100060', 'Portrait of Alfonso d\'Avalos, Marchese del Vasto, in Armor with a Page', 1, 'http://www.getty.edu/art/collection/objects/223011/titian-tiziano-vecellio-portrait-of-alfonso-d\'avalos-marchese-del-vasto-in-armor-with-a-page-italian-probably-january-february-1533/', '2003.486', 'Public domain', 'Titian\'s Portrait of Alfonso d\'Avalos, painted in Bologna in the winter of 1533, signals the inception of one of the most influential prototypes in the history of Western art--the standing state portrait. Dressed in armor with a diminutive page looking up to him, Alfonso d\'Avalos exudes the tremendous power he wielded as governor of Milan and commander general of imperial forces in Italy under the Holy Roman Emperor, Charles V. As the Abbot of Brantôme--a French historian--observed, D\'Avalos was a man who took great care with his appearance. He was born into an illustrious Spanish-Neapolitan family and trained for a military career under his cousin, Ferdinando Francesco, the Marchese di Pescara. After winning numerous military campaigns, D\'Avalos was honored with the Order of the Golden Fleece. He is shown wearing the Order\'s royal collar over an elaborate and beautifully wrought suit of armor befitting an imperial leader. In the lower left, his page hands him a helmet. Titian, who may have known D\'Avalos personally, endowed him with all the earnestness of a learned and contemplative man, while at the same time conveying his authority.', 'Titian\'s Portrait of Alfonso d\'Avalos, painted in Bologna in the winter of 1533, signals the inception of one of the most influential prototypes in the history of Western art--the standing state portrait.', 1533, 80, 110, 'Oil on canvas', '800.0000', '1060.0000', NULL, NULL, NULL),
(501, 131, 27, '131010', 'The Grand Canal in Venice from Palazzo Flangini to Campo San Marcuola', 2, 'http://www.getty.edu/art/collection/objects/225593/canaletto-giovanni-antonio-canal-the-grand-canal-in-venice-from-palazzo-flangini-to-campo-san-marcuola-italian-about-1738/', '2013.22', 'Public domain', 'Canaletto was at the peak of his powers when he created this view of the sun-drenched palaces lining the Grand Canal and reflected in its shimmering water. With precise brushwork, he also evoked the effects of soot and crumbling stucco disfiguring the facades.', 'Canaletto was at the peak of his powers when he created this view of the sun-drenched palaces lining the Grand Canal and reflected in its shimmering water. With precise brushwork, he also evoked the effects of soot and crumbling stucco disfiguring the facades.', 1738, 78, 47, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(502, 131, 6, '131020', 'Piazza San Marco', 2, 'http://www.metmuseum.org/art/collection/search/435839', '1988.162', 'Open Access for Scholarly Content', 'The most celebrated view painter of eighteenth-century Venice, Canaletto was particularly popular with British visitors to the city. This wonderfully fresh and well-preserved canvas shows the square of San Marco. The windows of the bell tower are fewer in number than in actuality, and the flagstaffs are too tall, but otherwise Canaletto took few liberties with the topography.', 'This wonderfully fresh and well-preserved canvas shows the square of San Marco.', 1727, 112, 69, 'Oil on canvas', '1100.0000', '1400.0000', NULL, NULL, NULL),
(504, 131, 6, '131030', 'Venice: Santa Maria della Salute', 2, 'http://www.metmuseum.org/art/collection/search/435840', '59.38', 'Open Access for Scholarly Content', 'A bird\'s eye view is to a degree imaginary, even if the scene is real, and this view is taken from high above the Grand Canal and the landing stage at Santa Maria della Salute. The panorama embraces the entrance to the canal in the direction of the bacino, with, at the right, the façade and dome of the church, one of the most splendid sights that Venice affords.', 'A bird\'s eye view is to a degree imaginary, even if the scene is real, and this view is taken from high above the Grand Canal and the landing stage at Santa Maria della Salute.', 1740, 79, 47, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(505, 132, 6, '132010', 'The Abduction of the Sabine Women', 2, 'http://www.metmuseum.org/art/collection/search/437329', '46.160', 'Open Access for Scholarly Content', 'The Romans invited the neighboring Sabines with the intention of forcibly retaining their young women as wives. Romulus raised his cloak as the pre-arranged signal for the warriors to seize the women. The yellow armor worn by the man at the right is modeled after a Roman lorica, which was made of leather and reproduced the anatomy of the male torso. The painting belonged to the maréchal de Créquy, who was the French ambassador to Rome from June 1633 to July 1634.', 'The Romans invited the neighboring Sabines with the intention of forcibly retaining their young women as wives. Romulus raised his cloak as the pre-arranged signal for the warriors to seize the women.', 1633, 209, 61, 'Oil on canvas', '1300.0000', '1800.0000', NULL, NULL, NULL),
(506, 132, 6, '132020', 'The Rest on the Flight into Egypt', 1, 'http://www.metmuseum.org/art/collection/search/438025', '1997.117.6', 'Open Access for Scholarly Content', 'This tenderly poetic picture reveals a side of Poussin not otherwise represented by the Museum’s splendid holdings of this artist. During the 1620s Poussin was especially attracted by Venetian painting, studying Titian’s great mythological compositions, some of which were in aristocratic collections in Rome. He took the inspiration for the fruit-gathering cherubs and the landscape from Titian’s Bacchanals.', 'During the 1620s Poussin was especially attracted by Venetian painting, studying Titian’s great mythological compositions, some of which were in aristocratic collections in Rome.', 1627, 63, 76, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(507, 132, 27, '132030', 'Landscape with a Calm\r\nLandscape with a Calm', 2, 'http://www.getty.edu/art/collection/objects/106381/nicolas-poussin-landscape-with-a-calm-un-temps-calme-et-serein-french-1650-1651/', '97.PA.60', 'Public domain', 'In the late 1640s and early 1650s, at the height of his artistic maturity, Nicolas Poussin turned from historical narrative to landscape painting. Landscape with a Calm does not illustrate a story but rather evokes a mood. The ordered composition and clear, golden light contribute to A Calm\'s utter tranquility, while glowing, gem-like colors and fluid paint strokes enliven this scene of benevolent nature. Poussin\'s sketching campaigns in the Roman countryside with his friend and fellow landscape painter Claude Lorrain account, in part, for its fresh observation of cloud-scattered sky and grazing goats.', 'Landscape with a Calm does not illustrate a story but rather evokes a mood. The ordered composition and clear, golden light contribute to A Calm\'s utter tranquility, while glowing, gem-like colors and fluid paint strokes enliven this scene of benevolent nature.', 1650, 131, 97, 'Oil on canvas', '800.0000', '1100.0000', NULL, NULL, NULL),
(508, 121, 6, '121030', 'Cardinal Fernando Nino de Guevara', 1, 'http://www.metmuseum.org/art/collection/search/436573', '29.100.5', 'Open Access for Scholarly Content', 'This intense portrait depicts Fernando Niño de Guevara (1541–1609), who in 1596 was named cardinal and is dressed as such here. In 1599 he became Inquisitor General of Spain but resigned in 1602 to serve the rest of his life as Archbishop of Seville. The painting probably dates from the spring of 1600 when the cardinal was in Toledo with Philip III and members of the Madrid court. El Greco had lived in Venice and in the Farnese Palace in Rome, where Titian’s portraits (such as those of the Farnese Pope Paul III) would have revealed to the Greek painter the psychological possibilities of portraiture.', 'This intense portrait depicts Fernando Niño de Guevara (1541–1609), who in 1596 was named cardinal and is dressed as such here.', 1600, 108, 170, 'Oil on canvas', '800.0000', '900.0000', NULL, NULL, NULL),
(509, 15, 6, '015120', 'The Dance Class', 3, 'http://www.metmuseum.org/art/collection/search/438817', '1987.47.1', 'Open Access for Scholarly Content', 'This work and its variant in the Musée d\'Orsay, Paris, represent the most ambitious paintings Degas devoted to the theme of the dance. Some twenty-four women, ballerinas and their mothers, wait while a dancer executes an \"attitude\" for her examination. Jules Perrot, a famous ballet master, conducts the class. The imaginary scene is set in a rehearsal room in the old Paris Opéra, which had recently burned to the ground. On the wall beside the mirror, a poster for Rossini’s Guillaume Tell pays tribute to the singer Jean-Baptiste Faure, who commissioned the picture and lent it to the 1876 Impressionist exhibition.', 'This work and its variant in the Musée d\'Orsay, Paris, represent the most ambitious paintings Degas devoted to the theme of the dance.', 1874, 77, 83, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(510, 15, 6, '015130', 'Sulking', 2, 'http://www.metmuseum.org/art/collection/search/436162', '29.100.43', 'Open Access for Scholarly Content', 'Two well-known personalities in the art world, the writer Edmond Duranty and model Emma Dobigny, posed for this early genre scene by Degas, set in an office, possibly a small bank. From the faithfully copied British racing print to the stylishly attired female protagonist, it recalls the work of fellow artist James Tissot. Yet for all the exacting detail, the subject of this picture remains elusive. The model’s elegant visiting dress, curiously worn without a hat, and the informality of her pose may suggest a familial or intimate relationship, but Degas offers faint clue as to the cause of his \"sulking.\"', 'Two well-known personalities in the art world, the writer Edmond Duranty and model Emma Dobigny, posed for this early genre scene by Degas, set in an office, possibly a small bank.', 1870, 46, 32, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(511, 6, 6, '006040', 'Madame Jacques-Louis Leblanc', 1, 'http://www.metmuseum.org/art/collection/search/436703', '19.77.2', 'Open Access for Scholarly Content', 'For this portrait there are more than two dozen drawings investigating a variety of poses (Musée Ingres, Montauban). Similar studies do not exist for the likeness of Madame Leblanc’s husband (19.77.1). The two paintings—the only pair of portraits Ingres produced—were probably intended to hang facing one another, since the light falls differently in each, but they are unified by the visual harmony of hands, gold chains, and rich textiles that enhance the couple’s black clothing.', 'For this portrait there are more than two dozen drawings investigating a variety of poses', 1823, 92, 117, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(512, 6, 6, '006050', 'Joséphine-Éléonore-Marie-Pauline de Galard de Brassac de Béarn', 1, 'http://www.metmuseum.org/art/collection/search/459106', '1975.1.186', 'Open Access for Scholarly Content', 'Jean-Auguste-Dominique Ingres, the neo-classical French artist par excellence, painted this masterpiece toward the end of his life when his reputation as a portraitist to prominent citizens and Orléanist aristocrats had been long established. Pauline de Broglie sat for the artist’s final commission. Ingres captures the shy reserve of his subject while illuminating through seamless brushwork the material quality of her many fine attributes: her rich blue satin and lace ball gown, the gold embroidered shawl, and silk damask chair, together with finely tooled jewels of pearl, enamel, and gold. The portrait was commissioned by the sitter’s husband, Albert de Broglie, a few years after their ill-fated marriage. Pauline was stricken with tuberculosis soon after completion of the exquisite portrait, leaving five sons and a grieving husband. Through Albert’s lifetime, it was draped in fabric on the walls of the family residence.', 'Jean-Auguste-Dominique Ingres, the neo-classical French artist par excellence, painted this masterpiece toward the end of his life when his reputation as a portraitist to prominent citizens and Orléanist aristocrats had been long established.', 1851, 121, 91, 'Oil on canvas', '1100.0000', '1400.0000', NULL, NULL, NULL);
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(513, 6, 6, '006060', 'Joseph-Antoine Moltedo', 1, 'http://www.metmuseum.org/art/collection/search/438818', '29.100.23', 'Open Access for Scholarly Content', 'Corsican by birth, Moltedo was an enterprising businessman and inventor, agent to the French clergy at the Vatican, and director of the Roman post office from 1803 until 1814. Painted during one of the most productive periods of Ingres’s nascent career, this refined portrait belongs to a series of commissions he received from French officials in Napoleonic Rome. They are distinguished by the inclusion of Roman views as backdrops—in this case the Appian Way and the Colosseum—as well as by stormy gray skies, a Romantic conceit that serves as a foil to the calm and secure expressions of the men portrayed.', 'Painted during one of the most productive periods of Ingres’s nascent career, this refined portrait belongs to a series of commissions he received from French officials in Napoleonic Rome.', 1810, 58, 75, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(514, 14, 6, '014050', 'By the Seashore', 1, 'http://www.metmuseum.org/art/collection/search/437430', '29.100.125', 'Open Access for Scholarly Content', 'Renoir likely painted this work in his studio, posing his model and future wife, Aline Charigot, in a wicker chair. The beach behind her probably represents the Normandy coast near Dieppe. This canvas reflects the impact of Renoir’s trip to Italy in 1881–82, which inspired him to unite the “grandeur and simplicity” he admired in Renaissance art with the luminosity of Impressionism. His new approach, which he called his “dry” manner, is evident in Aline’s face, with its carefully drawn features and smooth handling of paint. The medley of quick strokes in the background, however, displays the freer technique of Renoir’s earlier years.', 'Renoir likely painted this work in his studio, posing his model and future wife, Aline Charigot, in a wicker chair.', 1883, 72, 92, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(515, 120, 6, '120030', 'Portrait of a Young Man', 1, 'http://www.metmuseum.org/art/collection/search/435802', '29.100.16', 'Open Access for Scholarly Content', 'This portrait—among Bronzino\'s most arresting—was painted in the 1530s. The sitter is not known, but he must have belonged to Bronzino\'s close circle of literary friends in Florence, a number of whom sat for the artist. Bronzino himself composed verses in the style of the great Florentine poet Petrarch (1304–74), and the fanciful and witty details in this picture—the carved grotesque heads on the table and chair and the masklike face suggested in the folds of the youth\'s breeches—would have been appreciated by writers as comments on masks and identity. The book is doubtless a collection of poems. For a technical study of the changes Bronzino made to the painting as he worked see metmuseum.org/collections.', 'This portrait was painted in the 1530s. The sitter is not known, but he must have belonged to Bronzino\'s close circle of literary friends in Florence, a number of whom sat for the artist.', 1530, 75, 96, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(516, 105, 32, '105130', 'Self Portrait', 3, 'https://www.mauritshuis.nl/en/explore/the-collection/artworks/selfportrait-840/', '840', 'Private Use Only', 'No seventeenth-century artist made as many self-portraits as Rembrandt did. This self-portrait dates from 1669, the year Rembrandt died, so it may be the last he painted. The expressive freedom of style shows that Rembrandt was certainly not exhausted at the end of his life. The way he painted the face with strong brushstrokes is remarkable. With thick layers of paint that are almost modelled, Rembrandt suggests a man of flesh and blood. This is a true masterpiece.', 'This self-portrait dates from 1669, the year Rembrandt died, so it may be the last he painted.', 1669, 60, 65, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(517, 127, 32, '127030', 'View of Haarlem with Bleaching Grounds', 3, 'https://www.mauritshuis.nl/en/explore/the-collection/artworks/view-of-haarlem-with-bleaching-grounds-155', '155', 'Private Use Only', 'In this painting, Van Ruisdael captured the essence of the Dutch landscape. From a high dune, we look out over the flat land in the direction of Haarlem, the city in the distance. Above the city stretches an immense sky with clouds drifting by.', 'In this painting, Van Ruisdael captured the essence of the Dutch landscape.', 1675, 62, 55, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(518, 110, 24, '110050', 'Women in Blue', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/38759/?lng=en', '3509', 'Personal non-commercial use', 'Gainsborough\'s portrait of this unknown lady is rightly regarded as one of the most charming and excellent works in the Hermitage collection of English painting. Although the artist did not in fact like painting portraits, preferring to work on landscapes, it is for his portraits that he was best loved and is best known today. Here he created an image of great elegance and beauty, a painting dominated by a mood of romantic dreaminess. The light, mobile, melting brushstrokes convey the soft skin, the greyish-blue silk of the shawl, and the luxuriant feather of the headdress which surmounts the powdered wig. Free, sketchy painting is combined with fine transitions of colour to create an effect something akin to pastel. Gainsborough\'s style was noted and much admired by contemporaries, and even his great rival, the President of the Royal Academy, Sir Joshua Reynolds, admitted his skill.', 'Here Gainsborough created an image of great elegance and beauty, a painting dominated by a mood of romantic dreaminess.', 1781, 63, 76, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(519, 17, 24, '017080', 'Waterloo Bridge. Effect of Fog', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28490/?lng=en', '6545', 'Personal non-commercial use', 'This is just one of a series of famous views of London created by Monet during the later Impressionist period. The urban theme was making its appearance not for the first time in his work, although Monet concentrated mainly on rural landscapes. In his cycle of London works, the central motif was the fog, the marvellous way in which it changed light and air and the very atmosphere, literally swallowing up buildings. The capturing of the moment\'s passing impression which gave Impressionism its name was replaced by an analysis of complex colour nuances in flickering, changing light. The artist\'s trips to London in 1889, 1900 and 1901 seemed to fall always in the foggy season. From his room in the Savoy Hotel, Monet had a view over the Thames towards Waterloo Bridge', 'This is just one of a series of famous views of London created by Monet during the later Impressionist period.', 1903, 110, 63, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(520, 7, 24, '007003', 'Lion Hunt in Morocco', 3, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/37102/?lng=en', '3853', 'Personal non-commercial use', 'Delacroix took the subject for this painting from his recollections of the journey through Morocco in 1832. In the foreground he depicted two hunters - a man and a youth - beneath the luxurious crown of a tree, as well as two Arabs in the background with a horse. The outlines of the figures and the rock, the twisted trunks of the trees create a sense of tension. The rifle in the hands of one of the hunters and the unsheathed sabre lying on the ground emphasize that things are coming to an end. The dramatism so typical of Romanticism is created here by energetic brushstrokes and the contrast of complementary colours - red and green, blue and orange - and light and dark patches: the dark green foliage and shaded rock seem to be more tangible in contrast with the sky and the mountain stream.', 'Delacroix took the subject for this painting from his recollections of the journey through Morocco in 1832.', 1854, 92, 74, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(521, 21, 24, '021080', 'Smoker', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28720/?lng=en', '6561', 'Personal non-commercial use', 'One of a whole series of pictures of smokers and card players, this excellent work was painted in the artist\'s studio. The prototypes for such figures appeared in the paintings of the Old Masters back in the 17th century, but here there is no subject, no narrative interest. Nor is there any sense of a genre, despite the prosaic nature of the motif. The calm, solid pose, the generalised face without any gestures or expression, the monumental figure, all give the image a classical majesty. The integrity of human nature is captured in three-dimensional forms.', 'One of a whole series of pictures of smokers and card players, this excellent work was painted in the artist\'s studio.', 1892, 73, 92, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(522, 15, 42, '015140', 'Portrait of a Man', 1, 'https://www.brooklynmuseum.org/opencollection/objects/4394', '21.112', 'Creative Commons - Attribution', NULL, NULL, 1866, 64, 86, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(523, 96, 42, '096040', 'Portrait of a Man', 1, 'https://www.brooklynmuseum.org/opencollection/objects/37762', '34.497', 'Creative Commons - Attribution', NULL, NULL, 1495, 44, 58, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(524, 128, 42, '128030', 'Digging Sand, or The Sand Cart', 2, 'https://www.brooklynmuseum.org/opencollection/objects/64506', '51.13', 'Creative Commons - Attribution', NULL, NULL, 1875, 81, 56, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(525, 29, 22, '029050', 'Fritza Riedler', 1, 'http://digital.belvedere.at/objects/2177/fritza-riedler', '3379', 'Private use', NULL, NULL, 1906, 133, 153, 'Oil on canvas', '2200.0000', '2700.0000', NULL, NULL, NULL),
(526, 133, 22, '133010', 'Anna Bayer, the Artist\'s 2nd Wife', 1, 'http://digital.belvedere.at/objects/5997/anna-bayer-die-zweite-gattin-des-kunstlers', '291', 'Private use', NULL, NULL, 1850, 55, 68, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(527, 133, 22, '133020', 'Self Portrait as a Young Man', 1, 'http://digital.belvedere.at/objects/7921/selbstportrat-in-jungen-jahren', '2121', 'Private use', NULL, NULL, 1828, 75, 95, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(528, 133, 22, '133030', 'Prince Esterházy\'s Councillor Mathias Kerzmann with his Second Wife', 1, 'http://digital.belvedere.at/objects/536/der-furstlich-esterhazysche-rat-mathias-kerzmann-mit-seiner', '1521', 'Private use', NULL, NULL, 1835, 158, 205, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(529, 19, 29, '019140', 'The Bedroom', 3, 'https://www.vangoghmuseum.nl/en/collection/s0047V1962', 's0047V1962', 'Non commercial use', 'While he was in Arles, Van Gogh made this painting of his bedroom in the Yellow House. He prepared the room himself with simple furniture and with his own work on the wall. The bright colours were meant to express absolute ‘repose’ or ‘sleep’. Research shows that the strongly contrasting colours we see in the work today are the result of discolouration over the years. The walls and doors, for instance, were originally purple rather than blue.', 'While he was in Arles, Van Gogh made this painting of his bedroom in the Yellow House.', 1888, 91, 72, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(530, 19, 29, '019150', 'Almond Blossom', 3, 'https://www.vangoghmuseum.nl/en/collection/s0176V1962', 's0176V1962', 'Non commercial use', 'Large blossom branches like this against a blue sky were one of Van Gogh’s favourite subjects. Almond trees flower early in the spring making them a symbol of new life. Van Gogh borrowed the subject, the bold outlines and the positioning of the tree in the picture plane from Japanese printmaking.', 'Large blossom branches like this against a blue sky were one of Van Gogh’s favourite subjects.', 1890, 92, 73, 'Oil on canvas', '1200.0000', '1900.0000', NULL, NULL, NULL),
(531, 103, 24, '103020', 'Portrait of Elizabeth and Philadelphia Wharton', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/48240/?lng=en', '533', 'Personal non-commercial use', 'Few artists have truly successfully depicted children, but Anthony van Dyck in this portrait of the daughters of Philip, 4th Lord Wharton, produced a genuinely appealing image. It was painted during the late, English period of the artist\'s career, and is executed well within the traditions of Western European official portraiture. The girls are shown posing statically against a very roughly indicated, generalised background, with just a hint of a decorative landscape. Dressed and coiffed a la mode, they look like true grown up ladies, the eldest holding herself importantly and with a sense of her own importance, just like a lady at court. The youngest gently holds her sister by the shoulder, frozen in the pose in which she has been stood by the artist. The official majesty of the formal portrait is softened by the little dog, surprised by his mistresses\' immobility, who scratches wonderingly at the eldest girl\'s dress with one paw. With its elegant colour scheme, dominated by cold pearly-grey and silver-blue, and the virtuoso skill in conveying the texture of fabrics and jewellery, van Dyck\'s painting yet manages to be a very gentle and informal image of two charming girls.', 'Anthony van Dyck in this portrait of the daughters of Philip, 4th Lord Wharton, produced a genuinely appealing image.', 1640, 130, 162, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(532, 103, 24, '103030', 'Portrait of Henry Danvers, Earl of Danby', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/48262/?lng=en', '545', 'Personal non-commercial use', 'From 1632 to 1641 van Dyck worked at the court of the English King Charles I, where he produced a marvellous serious of portraits of the English aristocracy, of which this is perhaps one of the most outstanding. Henry Danvers, Earl of Danby (1573-1644), was a member of the Privy Council, Keeper of the Royal Seal and founder of the first botanical garden in England, at Oxford. He was also a renowned military commander, having fought in Ireland, the Southern Netherlands and France. Here, the Earl is seen wearing the attire of a Knight of the Order of the Garter, to which he was elevated in 1633. By his left temple is a black patch, which must cover a scar. The energetic, wilful gesture of the right hand is evidence of his decisiveness, whilst the left hand resting on the sword indicates his watchfulness, necessary to one of the King\'s inner circle. The elegant pose, the rich picturesqueness of the costume and the luxurious setting give the portrait a very official feel. Combining a true likeness of the sitter with a convincing impression of his character, this painting is also an important historical document.', 'From 1632 to 1641 van Dyck worked at the court of the English King Charles I, where he produced a marvellous serious of portraits of the English aristocracy, of which this is perhaps one of the most outstanding.', 1638, 130, 223, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(533, 103, 27, '103040', 'Portrait of Agostino Pallavicini', 1, 'http://www.getty.edu/art/collection/objects/524/anthony-van-dyck-portrait-of-agostino-pallavicini-flemish-about-1621/', '68.PA.2', 'Public domain', 'Agostino Pallavicini, a member of the Genoese branch of the Pallavicini family and the future doge of Genoa, sits enveloped by the sumptuous, flowing red robes worn in his role as ambassador to the Pope. The wide expanse of fabric, spectacularly rendered, seems to have a life of its own and almost threatens to take over the painting. The luxurious swirl of cloth, its brilliant sheen, and the way it glimmers and reflects light display Anthony van Dyck\'s virtuosity as a painter. The family coat of arms seen on the drapery behind the sitter at the left, along with other documented portraits, firmly establishes Pallavicini\'s identity.', 'Agostino Pallavicini, a member of the Genoese branch of the Pallavicini family and the future doge of Genoa, sits enveloped by the sumptuous, flowing red robes worn in his role as ambassador to the Pope.', 1621, 141, 216, 'Oil on canvas', '900.0000', '1000.0000', NULL, NULL, NULL),
(534, 18, 24, '018100', 'Sacred Spring: Sweet Dreams', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28178/?lng=en', '6510', 'Personal non-commercial use', 'Gauguin returned from his first stay in Tahiti (1891-1893) to spend nearly two years in Paris, where he painted this work. The exotic world of Oceania had captured the artist\'s imagination with its harmony of man and nature, with what he saw as the preservation of primitive simplicity. This work captures his recollections of Tahiti and his romantic dreams of the harmony of all on earth. The Tahitian girls symbolise different stages in life. The young islander with the halo above her head, deep in sleep, is the embodiment of virgin purity, while the second girl with the fruit in her hand, ready to take a bite, is like Eve. In the depths of the landscape islanders are dancing around an idol, some mysterious ancient god. The canvas reveals the artist\'s very individual style with its pure colours applied in generalised flat areas which, like the lines, are subjugated to a single rhythm.', 'Gauguin returned from his first stay in Tahiti (1891-1893) to spend nearly two years in Paris, where he painted this work.', 1894, 100, 74, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(535, 17, 24, '017090', 'Haystack at Giverny', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/28486/?lng=en', '6563', 'Personal non-commercial use', 'Most of the second half of Monet\'s life was spent in and around Giverny, where the leader of the Impressionists was particularly drawn by the landscape of central France. He captured views of Giverny in numerous canvases. A year before he painted this work in 1886, Monet had already shown a field of poppies (\"Poppy Field\", 1885; Paul Mellon Collection, USA), but without the haystack. The Hermitage work is one of the first of his paintings to show the haystack, which was to be the subject of whole series of works. Monet in virtuoso style captures the fine nuances of effects of light and air, picking the very moment at which the weather is changing and the horizon brightening on an overcast, windy day. The Impressionists painted such overcast weather with bright, light colours, which enabled them to capture the translucent sky and bring out the endlessly rich nuances of colour.', 'The Hermitage work is one of the first of his paintings to show the haystack, which was to be the subject of whole series of works.', 1886, 81, 60, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(536, 117, 2, '117020', 'The Creation', 5, 'https://www.museodelprado.es/coleccion/obra-de-arte/la-creacion/b5cb7209-0009-4b8f-ab20-d6db0617a9fa', 'P02053', 'Private, personal, academic, research or educational', NULL, NULL, 1495, 77, 188, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(537, 117, 2, '117030', 'Visio Tondalii', 1, 'https://www.museodelprado.es/coleccion/obra-de-arte/fantasia-moral-visio-tondali/ed19fa42-83e3-443b-96b1-04261634bb14', 'P02054', 'Private, personal, academic, research or educational', NULL, NULL, 1495, 24, 29, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(538, 104, 2, '104040', 'The Crucified Christ', 1, 'https://www.museodelprado.es/en/the-collection/art-work/the-crucified-christ/72cbb57e-f622-4531-9b25-27ff0a9559d7', 'P01167', 'Private, personal, academic, research or educational', 'Stylistically, this work appears to have been made in the early 1630s -soon after the artist returned from Italy- and most authors date it from around 1632. The Apollonian perfection of the anatomy and the figure`s pale complexion recall the neo-Attic character of Guido Reni`s work, but it must have been Velázquez`s intention to imbue the figure with a divine and ineffable beauty, reflecting the belief that Christ was the most beautiful of men.', 'The Apollonian perfection of the anatomy and the figure`s pale complexion recall the neo-Attic character of Guido Reni`s work, but it must have been Velázquez`s intention to imbue the figure with a divine and ineffable beauty, reflecting the belief that Christ was the most beautiful of men.', 1632, 169, 248, 'Oil on canvas', '1400.0000', '1800.0000', NULL, NULL, NULL),
(539, 8, 2, '008020', 'The Parasol', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-parasol/a230a80f-a899-4535-9e90-ad883bd096c5', 'P00773', 'Private, personal, academic, research or educational', 'This tapestry cartoon depicts a young woman. She is sitting, with a dog on her lap, and is accompanied by a Majo who protects her from the sun with a parasol. This work\'s format and bottom-to-top perspective indicates that it was intended to hang over a window. It\'s pyramidal composition, with the figures in the foreground, reflects the influence of classical Italian painting on Goya, as well as his mastery at painting light and shadows. The resultant tapestry was intended to hang in the dining room of the Prince and Princess of Asturias (the future Carlos IV and his wife Maria Luisa de Parma) at the Monastery of El Escorial.', 'This tapestry cartoon depicts a young woman. She is sitting, with a dog on her lap, and is accompanied by a Majo who protects her from the sun with a parasol.', 1777, 152, 104, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(540, 116, 2, '116030', 'Self-Portrait', 1, 'https://www.museodelprado.es/en/the-collection/art-work/self-portrait/8417d190-eb9d-4c52-9c89-dcdcd0109b5b', 'P02179', 'Private, personal, academic, research or educational', 'In the same year that he published the Apocalipsis cum figuris, Dürer painted himself as a gentleman, dressed in light toned clothes and looking his best. He wears an open black and white doublet with a striped cap in the same colours, an undershirt trimmed with gold and a silk cord of blue and white threads holding up a grey-brown cloak that falls over his right shoulder. Dürer has sheathed the hands that he uses to paint in grey kidskin gloves indicative of high rank with the aim of elevating his social status from that of craftsman to artist and of locating painting among the liberal arts, as in Italy.', 'In the same year that he published the Apocalipsis cum figuris, Dürer painted himself as a gentleman, dressed in light toned clothes and looking his best.', 1498, 41, 52, 'Oil on panel', '700.0000', '900.0000', NULL, NULL, NULL),
(541, 134, 2, '134010', 'The Descent from the Cross', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-descent-from-the-cross/856d822a-dd22-4425-bebd-920a1d416aa7', 'P02825', 'Private, personal, academic, research or educational', 'The Deposition was painted for the chapel of Our Lady outside the walls of Louvain, which was founded in the fourteenth century by the guild of bowmen, sold in 1798 and demolished shortly thereafter. The occupation of the founders is indicated by the two small crossbows hanging on the tracery of the two major corners of the table.', 'The Descent from the Cross was painted for the Chapel of Our Lady Outside the Walls at Leuven', 1443, 261, 204, 'Oil on panel', '2700.0000', '3900.0000', NULL, NULL, NULL),
(542, 134, 27, '134020', 'Portrait of Isabella of Portugal', 1, 'http://www.getty.edu/art/collection/objects/651/workshop-of-rogier-van-der-weyden-portrait-of-isabella-of-portugal-netherlandish-about-1450/', '78.PB.3', 'Public domain', 'Seated with her hands crossed in her lap, Isabella of Portugal, the duchess of Burgundy, conveys the poise and confidence of her noble position. Her sumptuous attire, heavily woven with gold thread, and her jeweled fingers and headdress reflect her aristocratic status. Oddly, the artist did not match the patterns of the sleeves, as would have been customary during this period.', 'Seated with her hands crossed in her lap, Isabella of Portugal, the duchess of Burgundy, conveys the poise and confidence of her noble position.', 1450, 37, 46, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-isabella-of-portugal/dQFnG1h6Jg1hYg?hl=en', NULL, NULL),
(543, 134, 24, '134030', 'St Luke Drawing the Virgin', 3, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/38861/?lng=en', '419', 'Personal non-commercial use', 'The subject is taken from a 6th-century legend of Greek origin, according to which St Luke was the first ever to draw a portrait of the Virgin Mary. Artists saw Luke as the patron of their art. Rogier van der Weyden set the action in an open loggia. To the left, at the foot of a throne, sits the Virgin, feeding the Christ Child. The throne, hinting at her future status as the Queen of Heaven, is decorated with sculptural figures of Adam and Eve, indicating that Christ and the Virgin will atone for their Original Sin. Opposite the Madonna, St Luke has sunk respectfully to his knees as he seeks to capture her appearance. The artist manages to convey both Luke\'s trembling reverence and his concentration on his drawing. Behind St Luke we can just see a bull and a book, both traditional attributes of the Apostle Luke. Two figures contemplating the landscape from the battlements possibly represent Joachim and Anna, the Virgin\'s parents.', 'The subject is taken from a 6th-century legend of Greek origin, according to which St Luke was the first ever to draw a portrait of the Virgin Mary.', 1445, 108, 102, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(544, 102, 2, '102020', 'The Three Graces', 1, 'https://www.museodelprado.es/en/the-collection/art-work/the-three-graces/145eadd9-0b54-4b2d-affe-09af370b6932', 'P01670', 'Private, personal, academic, research or educational', 'Rubens depicts the three graces beside a fountain, under a garland of flowers in a landscape. The figures are based on classical sculpture, which is visible in the artist’s effort to reproduce the coldness of marble in their flesh. The circular rhythm and elegant undulation are customary characteristics of this artist, along with the grandiloquent shapes and warm colors he brought into his painting in his final years. The figure on the left is directly inspired by his second wife, Hélène Forment.', 'Rubens depicts the three graces beside a fountain, under a garland of flowers in a landscape. The figures are based on classical sculpture, which is visible in the artist’s effort to reproduce the coldness of marble in their flesh.', 1635, 182, 220, 'Oil on panel', '1600.0000', '1900.0000', NULL, NULL, NULL),
(545, 102, 2, '102030', 'The Judgement of Paris', 2, 'https://www.museodelprado.es/en/the-collection/art-work/the-judgement-of-paris/918bc2de-00a9-480d-87ba-96ac25f22bf4', 'P01731', 'Private, personal, academic, research or educational', 'As Homer tells it in The Iliad, Paris the shepherd, son of Priam, had to decide with of the three goddesses —Juno, Venus or Minerva— was the most beautiful, and give her the golden apple Mercury he had received from Mercury. On the left, Paris appears to be meditating, with the apple still in his hands. His attention is focused on Venus, in the middle of the composition. Minerva´s weapons are visible in the foreground. The setting and elegance of this work bear a clear relation to southern painting as a result of the artist´s stay in Italy. The figures are based on classical sculptures and the influence of mannerist painting is visible in the sinuous rhythm of their anatomies. This work was first documented at Madrid´s Alcázar Palace in 1666.', 'Paris the shepherd, son of Priam, had to decide with of the three goddesses —Juno, Venus or Minerva— was the most beautiful, and give her the golden apple Mercury he had received from Mercury.', 1608, 114, 89, 'Oil on panel', '900.0000', '1100.0000', NULL, NULL, NULL),
(546, 118, 18, '118040', 'The Tower of Babel', 2, 'https://www.khm.at/de/object/bc6dc48b74/', '1026', 'Only for private use', 'Bruegel’s monumental composition had several forerunners in Netherlandish painting, but his work became the most famous classic among the Tower of Babel depictions and was frequently copied in many different variations. The sense of scale is provided by the flemish-style port city, which is impressively tiny in comparison to the tower.', 'Bruegel’s monumental composition had several forerunners in Netherlandish painting, but his work became the most famous classic among the Tower of Babel depictions and was frequently copied in many different variations.', 1563, 155, 114, 'Oil on canvas', '900.0000', '1000.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-tower-of-babel/bAGKOdJfvfAhYQ?hl=en', NULL, NULL),
(547, 118, 18, '118050', 'Children’s Games', 2, 'https://www.khm.at/de/object/caf1a3dfb5/', '1017', 'Only for private use', 'Children – more than 230 in all – are occupied with 83 different games. The whole city seems to be theirs. Bruegel gives the beholder an encyclopaedic view of the children’s games of his time.', 'Children – more than 230 in all – are occupied with 83 different games. The whole city seems to be theirs. Bruegel gives the beholder an encyclopaedic view of the children’s games of his time.', 1560, 161, 118, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/children%E2%80%99s-games/CQEeZWQPOI2Yjg?hl=en', NULL, NULL),
(548, 118, 18, '118060', 'Hunters in the Snow (Winter)', 2, 'https://www.khm.at/de/object/b83aac23b9/', '1838', 'Only for private use', 'On top of the hill a group of hunters accompanied by a pack of dogs is seen, making their way back to the village below. Their catch is poor: a single fox dangling from the spear the hunter on the left carries on his shoulder. To the hunter’s left, Bruegel added a motif that had been used forquire some time in book illumination for depicting the month of December: the preparations for singeing a pig over an open fire outside a building. The damaged sign hanging above them reveals the name of the inn: “dit is inden Hert”, meaning “To the Deer” – a well-aimed passing shot. Entertaining details, such as the people ice-skating on the frozen lakes, have contributed to the painting’s enormous popularity.', 'In the late 16th century, the Antwerp banker Niclaes Jongelinck owned one of the most important painting collections in the Netherlands. He commissioned Bruegel to create a series of six seasonal paintings, the last of which is shown here.', 1565, 162, 117, 'Oil on canvas', '900.0000', '1150.0000', 'https://www.google.com/culturalinstitute/beta/asset/hunters-in-the-snow-winter/WgFmzFNNN74nUg?hl=en', NULL, NULL),
(549, 134, 18, '134040', 'Triptych: The Crucifixion', 2, 'https://www.khm.at/de/object/5a1e3a5aed/', '901', 'Only for private use', 'Today this Crucifixion scene is spread across a winged altar, but it was probably originally a single panel, with the “frame” only painted on to it. Not long after it was created, however, the work was sawn into three parts, making the portraits of St. Mary Magdalene and St. Veronica wings of a triptych. Given its original condition, it makes van der Weyden’s artistic innovation even more significant: for the first time he unites all of the participants – the Crucifixion group, saints and the donors – in front of a continuous landscape, in which an idealised Jerusalem appears on the horizon. The realism of such a unified space had never been attempted in earlier works. Unknown today, the patrons are separated only by a conspicuous fissure in the ground from the central subject of religious contemplation, a concept that was so progressive that it was initially attenuated in the paintings of the period that followed.', 'Today this Crucifixion scene is spread across a winged altar, but it was probably originally a single panel, with the “frame” only painted on to it.', 1444, 131, 101, 'Oil on panel', '2000.0000', '2400.0000', 'https://www.google.com/culturalinstitute/beta/asset/triptych-the-crucifixion/3gF9kN6BYvNuxw?hl=en', NULL, NULL),
(550, 115, 18, '115030', 'Cardinal Niccolò Albergati', 1, 'https://www.khm.at/de/object/fccb3cdc9a/', '975', 'Only for private use', 'During a peace congress that was seeking to bring an end to decades of enmity between France and Burgundy, van Eyck painted portraits of some of those in attendance, among them, most likely, Cardinal Niccolò Albergati, who in his position as nuncio was one the most important participants in the negotiations. In Arras, van Eyck created a silverpoint drawing (Dresden, Staatliche Kunstsammlungen, Kupferstichkabinett), which most probably depicts the cardinal. Here the Flemish painter not only captured the physiognomy of the aged cleric but in his notes also specified the coloration', 'Here the Flemish painter not only captured the physiognomy of the aged cleric but in his notes also specified the coloration.', 1435, 34, 29, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/kardinal-niccol%C3%B2-albergati/0AEB0A0Fyh6sBw?hl=en', NULL, NULL),
(551, 116, 18, '116050', 'Portrait of a Young Venetian Woman', 1, 'https://www.khm.at/de/object/f29c21d489/', '6440', 'Only for private use', 'This honest, close-up view of a gentle face is in keeping with Venetian portraits of the time. The sandy hair of the unknown woman is held at the back of the head by a shining golden net, the prevailing fashion in Venice. Dürer has used carefully distributed highlights to emphasise the curly hair falling to either side of the face; it has a formal counterpart in the fine ribbons of her dress. The fact that Dürer left the preparatory underdrawing of the ribbon on the left has led to the assumption that the picture is unfinished, but technical analysis of the entire surface of the painting speaks against it. It makes sense from a compositional point of view: the colour of the one ribbon matches the woman’s hair, while the other picks up the monochrome tone of the background and is also found in the young woman’s dark eyes.', 'This honest, close-up view of a gentle face is in keeping with Venetian portraits of the time.', 1505, 24, 32, 'Oil on wood', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-a-young-venetian-woman/4QHm8iCbgjn1Og?hl=en', NULL, NULL),
(552, 101, 18, '101050', 'The Crowning with Thorns', 2, 'https://www.khm.at/de/object/18997733ec/', '307', 'Only for private use', 'With a complete command of anatomy, Caravaggio characterises the varied physical appearance of the protagonists. Christ’s delicate skin is in obvious contrast to the bronzed appearance of his tormentors. His exposed, outstretched neck, which has been forced into a horizontal position, is a clear indication of the brutality of the action. Caravaggio uses decisive contrasts of light and dark to create a strong physical presence.', 'With a complete command of anatomy, Caravaggio characterises the varied physical appearance of the protagonists.', 1603, 166, 127, 'Oil on canvas', '1200.0000', '1400.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-crowning-with-thorns/yAGZLO5MaPVjfQ?hl=en', NULL, NULL),
(553, 102, 18, '102040', 'The Miracles of St. Francis Xavier', 1, 'https://www.khm.at/de/object/c7af0926b2/', '519', 'Only for private use', 'Like a monument, the protagonist stands in a dark robe with deep folds on the plinth-like projection of a wall. Francis Xavier dominates the scene as the “missionary to the Asian peoples”, his left hand pointing to Fides, the personification of faith, his right hand extended towards the toppling idols, and his gaze turned to the listeners and supplicants. Rubens has used dramatic lighting – the Jesuit is back-lit – to stage the group of listeners and observers, who, keeping a respectful distance, are bathed in bright light. Standing in the shadows the armoured soldier creates an optical turningpoint in the composition, leading the gaze of the viewer to the actual miracle depicted: in the left foreground deathly pale figures are rising from their graves.', 'Francis Xavier dominates the scene as the “missionary to the Asian peoples”, his left hand pointing to Fides, the personification of faith, his right hand extended towards the toppling idols, and his gaze turned to the listeners and supplicants.', 1618, 395, 535, 'Oil on canvas', '2300.0000', '2700.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-miracles-of-st-francis-xavier/mAG-VIH-g-_RNA?hl=en', NULL, NULL),
(554, 126, 18, '126030', 'Woman and Child with Serving Maid', 2, 'https://www.khm.at/de/object/c32d9bf27a/', '5976', 'Only for private use', ' De Hooch painted the present work during his time in Amsterdam (starting in 1660), where he specialised in depicting the style of home furnishings and life typical of the city’s well-situated citizens. Despite the presence of a serving maid, the elegantly clad mother is caring personally for her infant; she does not waste money on a wet-nurse. Across the spotless tile floor, we look into a second room at the back, then through the half-open door to a house on a canal and the city beyond. A fire is burning on the hearth, providing a colourful accent that recurs in the infant’s clothing and the sunlit view. In a similarly rhythmic fashion, the red of the fabric drying on the hearth is repeated at several points in the picture, giving the composition a balance of colour. This scene makes clear the understanding of (ideal) roles at the time: attentive childcare and a well-run household are a woman’s province.', 'De Hooch painted the present work during his time in Amsterdam (starting in 1660), where he specialised in depicting the style of home furnishings and life typical of the city’s well-situated citizens.', 1664, 76, 64, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/woman-and-child-with-serving-maid/PwEM1bzSv2ImXw?hl=en', NULL, NULL),
(555, 124, 18, '124060', 'Beware of Luxury', 2, 'https://www.khm.at/de/object/9a1de01f89/', '791', 'Only for private use', 'Jan Steen arranges the various actors as though on a theatre stage. The gentle depth of the composition is based on a triangle, with the magnificently dressed young woman at its top point. Her clothing and seductive look identify her as a “loose-living” girl. She, however, is not the focus of the scene; that is provided by the lady of the house, who has fallen asleep at the table on the left. Her “absence” has resulted in the rest of the story: the dog is finishing the meat pie that was served on the table, one of the children is filching something from the cabinet on the wall (“opportunity makes the thief ”), the little girl’s brother is trying out a pipe, and the youngest child, sitting in his highchair, is playing carelessly with a string of pearls. His attention diverted to the side, a young man is trying to play a violin. Young people who continued to live at home were considered suspect in the popular culture of the Netherlands at the time. The prostitute in the foreground has already been mentioned: in a rovocative gesture she holds a filled glass between the legs of the man of the house, while he dismisses with a grin the admonishment of the nun (a Beguine?) standing on the right. The duck on the shoulder of the man next to her identifies him as a Quaker, who urges the reading of pious texts. Finally, the pig in the doorway to the kitchen is an allusion to another proverb: “Neither cast ye your pearls [here: roses] before swine”. Hanging above the heads of these sinners are the symbols of the penalty to be expected for unbridled, lustful behaviour: a sword and a crutch in a basket suspended from the ceiling.', 'The painting’s traditional German title “Die verkehrte Welt” (“The Topsy-Turvy World”) is not completely in accordance with the content, because this is really a humorous warning against one of the seven deadly sins, luxuria extravagance, later lust).', 1663, 145, 105, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/beware-of-luxury-%E2%80%9Cin-weelde-siet-toe%E2%80%9D/iAEDJelKemoXnA?hl=en', NULL, NULL),
(556, 120, 18, '120050', 'Holy Family with St. Anne and the Infant St. John', 1, 'https://www.khm.at/de/object/432aca3a1e/', '183', 'Only for private use', 'ompletely in contrast to the principles of Venetian painting, which made colour the dominant means of expression, Renaissance painting in Florence gave priority to the drawing as the means of expressing artistic invention. Thus there was a demand that the contours in painting be dear and sometimes even sharp. Bronzino’s works are considered the epitome of Florentine disegno and, at the same time, its final pinnacle, which had already assumed the character of Mannerism. Bronzino, who was a pupil of Jacopo Pontormo and thus extremely familiar with the works of Michelangelo, served for many years as court painter to the Medici. He created decorations (now lost) for numerous theatrical works and festive occasions and supplied brilliant designs for the Medici tapestry factory. In his composition Bronzino organises the group in close proximity to one another in the foreground. Nevertheless the figures are arranged next to and behind each other in a way that makes them easy to recognise. The infant St. John is in the foremost position, his gaze and gesture pointing to the infant Jesus, who is depicted frontally. Behind them stands St. Mary, who is holding her son’s arm in a loving gesture. The composition is extended by St. Anne and St. Joseph, who stand out from the central group of three because of their more natural skin colour. More than in almost any other of his works, Bronzino has emphasised the sharply outlined and sculptural figures almost to the point of stony coldness, especially in the case of the two boys. This artistic decision is also an example of paragone (Italian: comparison) – the competition, discussed in art theory at the time, between painting and sculpture to see which could create the better depiction of three-dimensional forms. Here Bronzino creates exciting contrasts: the coolness and clarity of his composition as opposed to the intimate familiar atmosphere; soft and gentle movements contrasted with formal severity and abstraction; turning away from natural models on the one hand but depicting all of their details on the other.', 'Bronzino’s works are considered the epitome of Florentine disegno and, at the same time, its final pinnacle, which had already assumed the character of Mannerism.', 1545, 101, 126, 'Oil on wood', '900.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/holy-family-with-st-anne-and-the-infant-st-john/kQF72Dy8lZiemg?hl=en', NULL, NULL),
(557, 132, 18, '132050', 'The Conquest of Jerusalem by Emperor Titus', 2, 'https://www.khm.at/de/object/78b9cab199/', '1556', 'Only for private use', 'Poussin came to Rome in 1624, and only a short stay in Paris (1640–1642) was to interrupt his Roman career. As a friend of his successful fellow-painter Claude Lorrain and a protégé of Pope Urban VIII and the cultured members of the papal court, Poussin became one of Rome’s most prominent painters. His frequently documented interest in the art of antiquity gave his works a classical touch, which manifests itself in the present painting in its relief-like composition and plain coloration. The chaotic action appears well-organised, with the bodies precisely laid out on the canvas, and the mighty columns of the temple and the rigid figures in the foreground providing a counterweight to the battlefield tumult.', 'As a friend of his successful fellow-painter Claude Lorrain and a protégé of Pope Urban VIII and the cultured members of the papal court, Poussin became one of Rome’s most prominent painters.', 1638, 198, 147, 'Oil on canvas', '1200.0000', '1500.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-conquest-of-jerusalem-by-emperor-titus/YgFi1vGsvyQXXA?hl=en', NULL, NULL),
(558, 94, 81, '094070', 'Madonna and Child with a Choir of Cherubs', 1, 'http://pinacotecabrera.org/en/collezione-online/opere/madonna-and-child-with-a-choir-of-cherubs/', '297', 'Public domain', 'The panel, attributed to Giovanni Bellini until 1885, when Luigi Cavenaghi’s restoration made it possible to recognize the hand of Mantegna, is probably the one that the artist gave to his friend the abbé Matteo Bosso. It came to Brera in 1808 from the Venetian church of Santa Maria Maggiore following the Napoleonic abolitions.', 'The panel, attributed to Giovanni Bellini until 1885, when Luigi Cavenaghi’s restoration made it possible to recognize the hand of Mantegna', 1490, 70, 88, 'Tempera on panel', '1000.0000', '1300.0000', NULL, NULL, NULL),
(559, 99, 81, '099150', 'The Marriage of the Virgin', 1, 'http://pinacotecabrera.org/en/collezione-online/opere/the-marriage-of-the-virgin/', '336', 'Public domain', 'The painting, dating from 1504, was moved from the Church of San Francesco in Città di Castello to the Pinacoteca in 1805. Raphael painted the Marriage of the Virgin having in mind the altarpiece with the same subject by Perugino, which is conserved at the Musée des Beaux-Arts in Caen. Raphael took inspiration from it, using its composition structure and iconography to obtain a result of incredible and unachievable perfection.', 'Raphael painted the Marriage of the Virgin having in mind the altarpiece with the same subject by Perugino, which is conserved at the Musée des Beaux-Arts in Caen.', 1504, 118, 171, 'Oil on canvas', '1200.0000', '1500.0000', NULL, NULL, NULL),
(560, 93, 81, '093020', 'The Virgin with Child, Angels and Saints', 1, 'http://pinacotecabrera.org/en/collezione-online/opere/the-virgin-with-child-angels-and-saints/', '180', 'Public domain', 'After the Napoleonic abolitions, the altarpiece came to Brera from the church of San Bernardino in Urbino, erected by Federico da Montefeltro to house his own grave. It is likely that Federico commissioned it after the birth of his heir, followed by the death of his wife Battista Sforza (1472), and that he wanted to underline the protection granted by the Virgin to his own dynastic authority through this work dense in symbols.', 'After the Napoleonic abolitions, the altarpiece came to Brera from the church of San Bernardino in Urbino, erected by Federico da Montefeltro to house his own grave.', 1474, 172, 252, 'Tempera on panel', '2500.0000', '4000.0000', NULL, NULL, NULL),
(561, 135, 81, '135010', 'Pietà', 2, 'http://pinacotecabrera.org/en/collezione-online/opere/pieta-giovanni-bellini/', '228', 'Public domain', 'The panel, dated to the years between 1465 and 1470, marks an evident emancipation of the artist from the influence of Andrea Mantegna, to whom he was linked not just by cultural affinities but also by close ties of kinship (they were brothers-in-law).', 'The panel, dated to the years between 1465 and 1470, marks an evident emancipation of the artist from the influence of Andrea Mantegna, to whom he was linked not just by cultural affinities but also by close ties of kinship.', 1470, 107, 86, 'Tempera on panel', '900.0000', '1200.0000', NULL, NULL, NULL),
(562, 135, 81, '135020', 'Madonna and Child', 2, 'http://pinacotecabrera.org/en/collezione-online/opere/madonna-and-child/', '298', 'Public domain', 'The Madonna and Child, dated 1510, is the latest of the works by Bellini in Brera. When he painted it, Bellini was around eighty and one of the most prestigious figures of the Venetian Renaissance, a sort of charismatic patriarch who, at the end of his career, showed that he was able to take in and guide a new direction in style.', 'The space of the picture is dominated by the monumental figure of the Virgin seated on a throne, wrapped in loose drapery that dilates the volume of her body in line with 15th-century schemes for construction of the image.', 1510, 115, 85, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(563, 135, 70, '135030', 'Madonna and Child with St. John the Baptist', 1, 'http://collection.imamuseum.org/artwork/41175/', '2000.341', 'Public domain', NULL, NULL, 1500, 58, 76, 'Oil on wood', '700.0000', '900.0000', NULL, NULL, NULL);
INSERT INTO `Paintings` (`PaintingID`, `ArtistID`, `GalleryID`, `ImageFileName`, `Title`, `ShapeID`, `MuseumLink`, `AccessionNumber`, `CopyrightText`, `Description`, `Excerpt`, `YearOfWork`, `Width`, `Height`, `Medium`, `Cost`, `MSRP`, `GoogleLink`, `GoogleDescription`, `WikiLink`) VALUES
(564, 135, 18, '135040', 'Young Woman at Her Toilette', 2, 'https://www.khm.at/de/object/274ad4786c/', '97', 'Only for private use', ' The nude figure is integrated into a system of horizontal and vertical features. She is sitting on a bench that has been covered with a precious carpet, and behind her is a dark-green surface on which a mirror has been hung. On the left a view of a Venetian landscape gives the painting depth. By using the same colours in the principal motif and landscape, Bellini connects the two spheres, and the basic mood of the painting is gentle and unified. In her right hand the young woman is holding another mirror, which is a symbol of vanitas on the one hand and an attribute of Venus Pudica on the other. Using the device of two mirrors, Bellini enables the observer to see two views of the woman’s head from a single vantage point, a perspective possible only in painting.', 'Bellini\'s first female nude, painted when he was about 85 years old.', 1515, 78, 63, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/young-woman-at-her-toilette/dQE6qBYljWU39A?hl=en', NULL, NULL),
(565, 131, 81, '131040', 'View of St. Mark’s from the Punta della Dogana', 2, 'http://pinacotecabrera.org/en/collezione-online/opere/view-of-st-marks-from-the-punta-della-dogana/', '2236', 'Public domain', 'The View of St. Mark’s Basin came to Brera in 1828 with the View of the Grand Canal Looking toward the Punta della Dogana from Campo Sant’Ivo. They are subjects of which the artist was very fond, replicating them several times and varying the angle and breadth of the view: the two versions in Brera date from around 1740-45, i.e. the years immediately preceding Canaletto’s journey to England.', 'The View of St. Mark’s Basin came to Brera in 1828 with the View of the Grand Canal Looking toward the Punta della Dogana from Campo Sant’Ivo.', 1745, 70, 53, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(566, 136, 81, '136010', 'The Kiss', 1, 'http://pinacotecabrera.org/en/collezione-online/opere/the-kiss/', '6335', 'Public domain', 'It is one of the emblematic images of the Pinacoteca and perhaps the most widely reproduced Italian painting of the whole of the 19th century, created with the aim of symbolizing the love of the motherland and thirst for life on the part of the young nation that had emerged from the Second War of Independence and which now placed so many hopes in its new rulers. It proved an immediate and resounding success both for its patriotic values and for the medieval inspiration of the subject, typical of the Romantic taste of the time: Hayez painted other versions of it, now in various European collections.', 'It is one of the emblematic images of the Pinacoteca and perhaps the most widely reproduced Italian painting of the whole of the 19th century.', 1859, 88, 112, 'Oil on canvas', '800.0000', '1000.0000', NULL, NULL, NULL),
(567, 136, 81, '136020', 'Melancholy', 1, 'http://pinacotecabrera.org/en/collezione-online/opere/melancholy/', '6331', 'Public domain', 'The work, executed between 1840 and 1842, is full of erudite references to the Italian and European pictorial tradition: from reflections on the 16th-century painting of the Veneto exemplified by the treatment of the clothing, which echoes the textural effects of Savoldo and Titian, to the citation of Flemish still lifes.', 'The work, executed between 1840 and 1842, is full of erudite references to the Italian and European pictorial tradition.', 1842, 101, 138, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(568, 137, 3, '137010', 'Abbey among Oak Trees', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=968249&viewType=detailView', '8/85', 'Public domain', 'Abbey among Oak Trees is the companion piece to Monk by the Sea. Friedrich showed both paintings in the Berlin Academy Exhibition of 1810. In their perplexing remoteness and formal radicalism they were to become key works in German Romanticism.', 'Abbey among Oak Trees is the companion piece to Monk by the Sea. Friedrich showed both paintings in the Berlin Academy Exhibition of 1810.', 1810, 171, 110, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/abbey-among-oak-trees/UAEmmuxqtNUt-g', NULL, NULL),
(569, 137, 3, '137020', 'Man and Women Contemplating the Moon', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=964081&viewType=detailView', 'II 887', 'Public domain', 'During a nighttime walk through a mountain forest a pair remains on a hill next to a dramatically stirring, uprooted oak. Darkness surrounds the hikers, their eyes are directed to the orb of the moon, whose light solemnly quiet fills the atmosphere.', 'During a nighttime walk through a mountain forest a pair remains on a hill next to a dramatically stirring, uprooted oak. Darkness surrounds the hikers, their eyes are directed to the orb of the moon, whose light solemnly quiet fills the atmosphere.', 1824, 44, 34, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/two-men-contemplating-the-moon/AQHW6lwY6LzX1Q', NULL, NULL),
(570, 137, 3, '137030', 'Moonrise over the Sea', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=959550&viewType=detailView', '53', 'Public domain', 'Like its companion piece, the evening picture of the diptych was painted in 1822. In Moonrise on the Seashore Friedrich took up one of his favorite themes. In the reflected light of the night sky, it is as though the surface of the water begins to glow all of its own accord, taking up the light of heaven, as it were.', 'Like its companion piece, the evening picture of the diptych was painted in 1822.', 1822, 71, 55, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/moonrise-over-the-sea/mwFGGdzKbfGMkg', NULL, NULL),
(571, 138, 3, '138010', 'The Isle of the Dead', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=967648&viewType=detailView', '2/80', 'Public domain', 'Arnold Böcklin spent the autumn of 1879 on Ischia. The Castello Alfonso, on a small island nearby, deeply impressed him during his stay. When the young, widowed Marie Berna visited Böcklin’s studio in Florence in 1880 and asked for a “picture to dream by,” the memory of that landscape must have merged with earlier memories of, for example, the islands of the dead like San Michele in Venice and Etruscan cliff-necropolises. The Isle of the Dead became one of Böcklin’s most popular pictorial works. He achieved this by combining a limited number of ideas into an impressive atmospheric composition. The motifs — island, water, and castle or vil-la by the sea — are already familiar from many of his earlier works. However, in this case they have been concentrated into a statement of the artist’s Weltanschauung. The location is sinister. The viewer’s gaze is led up the steps but can penetrate no further into the darkness. The island’s strict symmetry, the calm horizontals and verticals, the circular island surrounded by high cliff walls, and the magical lighting create an atmosphere that is both solemn and sublime, evoking a sense of stillness and other-worldliness. The ripple-less surface of the water and the boat bearing the coffin with a figure shrouded in white behind it add a melancholy tone to the whole.', 'The Isle of the Dead became one of Böcklin’s most popular pictorial works. He achieved this by combining a limited number of ideas into an impressive atmospheric composition.', 1883, 150, 80, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-isle-of-the-dead/0wFgMTIQ3kZCpg?hl=en', NULL, NULL),
(572, 138, 3, '138020', 'The Deposition', 2, 'http://www.smb-digital.de/eMuseumPlus?service=ExternalInterface&module=collection&objectId=963112&viewType=detailView', 'I 827', 'Public domain', NULL, NULL, 1876, 250, 164, 'Oil on canvas', '900.0000', '1100.0000', NULL, NULL, NULL),
(573, 139, 17, '139010', 'The Lady of Shalott', 2, 'http://www.tate.org.uk/art/artworks/waterhouse-the-lady-of-shalott-n01543', 'N01543', 'Creative Commons CC-BY-NC-ND (3.0 Unported)', 'ennyson’s poem, first published in 1832, tells of a woman who suffers under an undisclosed curse. She lives isolated in a tower on an island called Shalott, on a river which flows down from King Arthur’s castle at Camelot. Not daring to look upon reality, she is allowed to see the outside world only through its reflection in a mirror. One day she glimpses the reflected image of the handsome knight Lancelot, and cannot resist looking at him directly. The mirror cracks from side to side, and she feels the curse come upon her. The punishment that follows results in her drifting in her boat downstream to Camelot ‘singing her last song’, but dying before she reaches there.', 'The picture illustrates the following lines from part IV of Tennyson’s ‘The Lady of Shalott’:', 1888, 200, 153, 'Oil on canvas', '1300.0000', '1700.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-lady-of-shalott/RQHFwa4u2LTw0g?hl=en', NULL, NULL),
(574, 139, 17, '139020', 'Consulting the Oracle', 2, 'http://www.tate.org.uk/art/artworks/waterhouse-consulting-the-oracle-n01541', 'N01541', 'Creative Commons CC-BY-NC-ND (3.0 Unported)', 'Miracles, magic and the power of prophecy are common themes in Waterhouse\'s art. In this picture he shows a group of seven young girls, sitting in a semicircle round a lamplit shrine, waiting in excitement while the priestess interprets the words of the Oracle.', 'In this picture a group of seven young girls, sitting in a semicircle round a lamplit shrine, waiting in excitement while the priestess interprets the words of the Oracle.', 1884, 198, 119, 'Oil on canvas', '1100.0000', '1300.0000', NULL, NULL, NULL),
(575, 139, 17, '139030', 'Saint Eulalia', 1, 'http://www.tate.org.uk/art/artworks/waterhouse-saint-eulalia-n01542', 'N01542', 'Creative Commons CC-BY-NC-ND (3.0 Unported)', 'Waterhouse exhibited this picture at the Royal Academy in 1885 with the following note: \'Prudentius says that the body of St. Eulalia was shrouded \"by the miraculous fall of snow when lying in the forum after her martyrdom.\"\'', 'Waterhouse exhibited this picture at the Royal Academy in 1885 with the following note: \'Prudentius says that the body of St. Eulalia was shrouded \"by the miraculous fall of snow when lying in the forum after her martyrdom.\"\'', 1885, 117, 189, 'Oil on canvas', '1200.0000', '1350.0000', NULL, NULL, NULL),
(576, 107, 7, '107030', 'Madame Bergeret', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.32681.html', '1946.7.3', 'Open Access', 'In the 1740s Boucher was establishing himself as a mature painter in Parisian art circles. In this portrait he defines the chic of that decade: Madame Bergeret is placed in a garden setting, dressed in a creamy silk gown, tight in the bodice with\r\npuffed sleeves highlighted with blue ribbons. Her face glows with youth and beauty depicted in translucent whites. The most important motif, and the charm of the composition, is the profusion of roses -- emerging from a bronze vase, decorating her sleeves and hair, and arranged across the bench and on the foreground plane. Sacred to Venus, the rose was a symbol well suited for a portrait of Bergeret\'s beloved wife.', 'In this portrait he defines the chic of that decade: Madame Bergeret is placed in a garden setting, dressed in a creamy silk gown, tight in the bodice with\r\npuffed sleeves highlighted with blue ribbons.', 1766, 105, 143, 'Oil on canvas', '900.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/madame-bergeret/TwFs06EqPBEgug', NULL, NULL),
(577, 107, 7, '107040', 'The Bath of Venus', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.12200.html', '1943.7.2', 'Open Access', 'In The Bath of Venus, the mythological goddess has lost any allusions to classical history painting and is offered up to the viewer as an object of physical beauty. Venus, located in a lush garden setting, coyly attempts to restrain a pouting Cupid as two putti point to the scene in mocking disapproval. Boucher\'s success in communicating the charm and sensuality of the nude lies in his mastery of color and fluid brushstrokes. Venus is rendered in porcelain tones, delicately accented in pink, her body highlighted against luscious blue velvet and silk. The two white doves at her feet contrast a thick impasto surface with the transparent water and cool greens and blues of the foliage. The painting exemplifies the rococo love of asymmetric lines and sinuous curves, artfully arranged to seduce both the eye and the mind of the beholder.', 'In The Bath of Venus, the mythological goddess has lost any allusions to classical history painting and is offered up to the viewer as an object of physical beauty.', 1751, 84, 107, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(578, 114, 7, '114030', 'Madonna and Child', 1, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.397.html', '1939.1.256', 'Open Access', 'Painted during the latter part of Giotto\'s career, the Madonna and Child was the central part of a five-section polyptych, or altarpiece in many panels (see Reconstruction). Giotto utilized a conservative Byzantine-style background in gold leaf, symbolizing the realm of heaven, and included a white rose, the traditional symbol of Mary\'s purity as well as a reference to the innocence lost through Original Sin. Yet, the Madonna and Child introduces a new naturalistic trend in painting. Instead of making the blessing gesture of a philosopher, the infant Christ grasps his mother\'s left index finger in a typically baby-like way as he playfully reaches for the flower that she holds.', 'Painted during the latter part of Giotto\'s career, the Madonna and Child was the central part of a five-section polyptych', 1315, 62, 85, 'Tempera on panel', '1900.0000', '2300.0000', NULL, NULL, NULL),
(579, 112, 7, '112020', 'Self-Portrait', 3, 'http://www.nga.gov/content/ngaweb/Collection/art-object-page.37003.html', '1949.6.1', 'Open Access', 'Judith Leyster’s Self-Portrait exudes self-confidence in her abilities, and it has become one of the National Gallery of Art’s most popular Dutch paintings. Leyster has depicted herself at her easel, briefly interrupting work on a painting of a violin player to interact with the viewer. The momentary quality of the portrait and the vigorous brushwork echo the work of Frans Hals.', 'Judith Leyster’s Self-Portrait exudes self-confidence in her abilities, and it has become one of the National Gallery of Art’s most popular Dutch paintings.', 1630, 65, 74, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(580, 111, 52, '111040', 'Judith and Maidservant with the Head of Holophernes', 1, 'http://www.dia.org/object-info/0573dd3e-1079-4ce3-8262-78b0e1e68331.aspx', '52.253', '&copy; Detroit Institute of Arts', 'One of Artemisia\'s best works, this scene is tense with imminent danger as Judith and Abra prepare to flee Holofernes\'s tent with his severed head. Dramatic and unusual chiaroscuro, especially the shadows Judith\'s hand casts on her face, together with vigilant expressions and posture, add urgency to the scene.', 'One of Artemisia\'s best works, this scene is tense with imminent danger as Judith and Abra prepare to flee Holofernes\'s tent with his severed head.', 1625, 141, 184, 'Oil on canvas', '1100.0000', '1500.0000', NULL, NULL, NULL),
(581, 111, 24, '111030', 'Cupid and Psyche', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/31669/?lng=en', '6889', 'Personal non-commercial use', NULL, NULL, 1639, 160, 130, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(582, 113, 24, '113030', 'Portrait of Emperor Pavel I\'s Daughters', 3, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/38159/?lng=en', '7747', 'Personal non-commercial use', NULL, NULL, 1796, 99, 99, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(583, 40, 24, '040030', 'Landscape', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/35717/?lng=en', '9098', 'Personal non-commercial use', NULL, NULL, 1913, 100, 88, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(584, 101, 24, '101060', 'Lute Player', 2, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/31511/?lng=en', '45', 'Personal non-commercial use', 'This is an early work by Caravaggio, who sought above all to convey the reality and solidity of the surrounding world. We can already see the elements of the artist\'s style which were to have such a widespread influence on other artists. The figure of a young boy dressed in a white shirt stands out clearly against the dark background. The sharp sidelighting and the falling shadows give the objects an almost tangible volume and weight. Caravaggio was interested in the uniqueness of the surrounding world, and there are markedly individual features not only in the youth\'s face but also in the objects which make up the still life: the damaged pear, the crack in the lute, the crumpled pages of the music. The melody written on those pages is that of a then fashionable song by Jacques Arcadelt, \"You know that I love you\". Love as the theme of this work is also indicated by other objects. For instance, the cracked lute was a metaphor for the love that fails,.', 'This is an early work by Caravaggio, who sought above all to convey the reality and solidity of the surrounding world. We can already see the elements of the artist\'s style which were to have such a widespread influence on other artists.', 1596, 119, 94, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(585, 108, 24, '108030', 'Saying Grace', 1, 'https://www.hermitagemuseum.org/wps/portal/hermitage/digital-collection/01.+Paintings/37525/?lng=en', '1193', 'Personal non-commercial use', 'Chardin was the first to introduce the themes of the family, motherhood and housework to French 18th-century art. The heroes of Saying Grace belong to the Third Estate, that class of craftsmen and small traders with whose way of life Chardin was most familiar. The action centres on the table where a young mother is dishing out soup and seeking to make her two daughters repeat the words of a lunchtime prayer. Composed with great care, the painting seeks to portray the artist\'s ideal of the closely-knit family, of their caring attitude towards each other. He produced a warm and touching image in the younger daughter, capturing the feelings of the child who does not as yet fully comprehend the meaning of the words, making it one of the best images of children Chardin ever created.', 'Composed with great care, the painting seeks to portray the artist\'s ideal of the closely-knit family, of their caring attitude towards each other.', 1744, 38, 49, 'Oil on canvas', '700.0000', '900.0000', NULL, NULL, NULL),
(586, 8, 27, '008030', 'Portrait of the Marquesa de Santiago', 1, 'http://www.getty.edu/art/collection/objects/706/francisco-jose-de-goya-y-lucientes-francisco-de-goya-portrait-of-the-marquesa-de-santiago-spanish-1804/', '83.PA.12', 'Public domain', 'The Marquesa de Santiago stands full-length in front of a landscape of gently sloping hills. Well-born, very wealthy, and a commanding presence, she confronts the viewer directly. Her white lace mantilla extends to her knees, and she holds a closed fan in her left hand. Heavily applied make-up accentuates her features. Known for her dissolute lifestyle, the Marquesa died at the age of forty-three, three years after this portrait was made.', 'The Marquesa de Santiago stands full-length in front of a landscape of gently sloping hills. Well-born, very wealthy, and a commanding presence, she confronts the viewer directly.', 1804, 126, 209, 'Oil on canvas', '900.0000', '1100.0000', 'https://www.google.com/culturalinstitute/beta/asset/portrait-of-the-marquesa-de-santiago/IgE6HJDa9WgHrg', 'The Marquesa de Santiago stands full-length in front of a landscape of gently sloping hills. Well-born, very wealthy, and a commanding presence, she confronts the viewer directly. Her white lace mantilla extends to her knees, and she holds a closed fan in her left hand. Heavily applied make-up accentuates her features. Known for her dissolute lifestyle, the Marquesa died at the age of forty-three, three years after this portrait was made. An English visitor to Spain once described her as \"very profligate and loose in her manners and conversations, and scarcely admitted into female society¿and said to boast of her nocturnal revels.\" While contemporary portraitists sought to convey ideal beauty with a highly finished technique, Goya used a more expressionistic handling of the paint. Broad, quick brushstrokes describe her dark dress, and the application of thick impasto suggests the gold braid on the Marquesa\'s sleeve and lace of her mantilla. In the background, crude cottages and trees are merely indicated with wide, rapid sweeps of the brush.', NULL),
(587, 140, 27, '140010', 'A Young Girl Defending Herself against Eros', 1, 'http://www.getty.edu/art/collection/objects/548/william-adolphe-bouguereau-a-young-girl-defending-herself-against-eros-french-about-1880/', '70.PA.3', 'Public domain', 'A young nude woman sits with her arms outstretched, pushing away a winged boy. He is Cupid, the god of love, holding up an arrow to pierce her. The title suggests that the young woman is trying to defend herself, yet she smiles and struggles unconvincingly against the mischievous little god.', 'A young nude woman sits with her arms outstretched, pushing away a winged boy. He is Cupid, the god of love, holding up an arrow to pierce her. The title suggests that the young woman is trying to defend herself, yet she smiles and struggles unconvincingly against the mischievous little god.', 1880, 57, 81, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-young-girl-defending-herself-against-eros/WwG4E841q7Lwgg?hl=en', NULL, NULL),
(588, 140, 42, '140020', 'The Elder Sister', 1, 'https://www.brooklynmuseum.org/opencollection/objects/4390', '21.99', 'Creative Commons - Attribution', 'An academic painter who had achieved great success in the Paris Salon with mythological, historical, and religious subjects, Bouguereau later turned to genre scenes such as this image of a young woman caring for her younger brother. Although the figures are defined as siblings in the title, Bouguereau evokes the Madonna and Child with a tender pose—much like that seen in the altarpieces on the opposite wall—and the Catholic rosary beads in the child’s hand. Moreover, scholars have linked Bouguereau’s composition and the dark, dreamy look of the girl to the Sistine Madonna by Raphael. Bouguereau’s works appealed to a middle-class clientele—both French and American—that cherished Christian and domestic values.', 'Although the figures are defined as siblings in the title, Bouguereau evokes the Madonna and Child with a tender pose and the Catholic rosary beads in the child’s hand.', 1864, 45, 55, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-elder-sister-reduction-la-soeur-a%C3%AEn%C3%A9e-r%C3%A9duction/IgFK1YTUuvzIrQ?hl=en', NULL, NULL),
(589, 140, 52, '140030', 'The Nut Gatherers', 2, 'http://www.dia.org/object-info/2d7edad7-ef64-461f-8c1c-ee02475ecb81.aspx', '54.458', '&copy; Detroit Institute of Arts', NULL, NULL, 1882, 134, 87, 'Oil on canvas', '900.0000', '1000.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-nut-gatherers/GwH-a-m2kog8Mw?hl=en', NULL, NULL),
(590, 5, 27, '005090', 'The Farewell of Telemachus and Eucharis', 3, 'http://www.getty.edu/art/collection/objects/806/jacques-louis-david-the-farewell-of-telemachus-and-eucharis-french-1818/', '87.PA.27', 'Public domain', 'Fixing the viewer with a dreamy gaze, the fair-haired Telemachus grasps Eucharis\'s thigh with his right hand while holding his sword upright with the other. In the 1699 French novel Les Aventures de Télémaque, loosely based on characters from the Odyssey, the author Fénelon describes how Telemachus, the son of Odysseus, fell passionately in love with the beautiful nymph Eucharis. His duty as a son, however, required that he end their romance and depart in search of his missing father.', 'Fixing the viewer with a dreamy gaze, the fair-haired Telemachus grasps Eucharis\'s thigh with his right hand while holding his sword upright with the other', 1818, 103, 88, 'Oil on canvas', '900.0000', '1200.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-farewell-of-telemachus-and-eucharis/rwHbSEhvONtMwg?hl=en', NULL, NULL),
(591, 137, 27, '137040', 'A Walk at Dusk', 2, 'http://www.getty.edu/art/collection/objects/862/caspar-david-friedrich-a-walk-at-dusk-german-about-1830-1835/', '93.PA.14', 'Public domain', 'His head bowed, a man walks alone in the silvery, cold moonlit night while contemplating a megalithic tomb and its implicit message of death. It is winter, and all around him nature is dying. Leafless trees loom behind like specters, but a grove of verdant oaks rises through the mist in the background with the promise of life. The waxing moon, high in the sky, also acts as a counterbalance to death, symbolizing Christ and the promise of rebirth for the artist Caspar David Friedrich.', 'His head bowed, a man walks alone in the silvery, cold moonlit night while contemplating a megalithic tomb and its implicit message of death. It is winter, and all around him nature is dying', 1835, 43, 33, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-walk-at-dusk/5wFxD61nj36xGQ?hl=en', NULL, NULL),
(592, 12, 27, '012070', 'Jeanne (Spring)', 1, 'http://www.getty.edu/art/collection/objects/268843/edouard-manet-jeanne-spring-french-1881/', '2014.62', 'Public domain', 'A chic young woman in a day dress with floral accents holds a parasol against a background of exuberant foliage. She looks straight ahead, a picture of poise and detachment even as she seems fully aware of the viewer\'s admiring gaze.', 'A chic young woman in a day dress with floral accents holds a parasol against a background of exuberant foliage.', 1881, 51, 74, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/le-printemps-jeanne-demarsy/ewHUkby4MoOrrw?hl=en', NULL, NULL),
(593, 121, 27, '121040', 'Christ on the Cross', 1, 'http://www.getty.edu/art/collection/objects/129847/el-greco-domenico-theotocopuli-christ-on-the-cross-greek-1600-1610/', '2000.40', 'Public domain', 'Isolated atop a mountain, a gaunt, tormented Christ dominates a nearly empty landscape. On a road leading to the walled city of Jerusalem, horsemen pass by the execution hill, literally turning their backs on Christ. El Greco\'s use of dramatic colors and exaggerated proportions distorts the figure, conveying the transcendent moment when Christ sublimated his physical pain and commended his spirit to God. Turning his eyes upward toward heaven, Christ looks away from the bones and skulls that lie at his feet, representative of his triumph over death. Light plays across his undulating form, illuminating his tortured body against the dark background. To heighten empathy between the viewer and Christ, the elongated but graceful figure appears alone. This private, devotional image was meant to encourage contemplation and spiritual reflection.', 'On a road leading to the walled city of Jerusalem, horsemen pass by the execution hill, literally turning their backs on Christ. El Greco\'s use of dramatic colors and exaggerated proportions distorts the figure.', 1610, 51, 82, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/christ-on-the-cross/cgHO8uo2dVOJoQ?hl=en', NULL, NULL),
(594, 105, 27, '105140', 'An Old Man in Military Costume', 1, 'http://www.getty.edu/art/collection/objects/673/rembrandt-harmensz-van-rijn-an-old-man-in-military-costume-dutch-about-1630-1631/', '78.PB.246', 'Public domain', 'The subject, who appears in different guises in several other paintings by Rembrandt van Rijn and his contemporaries, wears a plumed hat and metal breastplate. His military costume may symbolize Dutch strength and patriotism during the struggle for independence from Spain. Although he faces front, the man\'s torso is turned in a three-quarter view; his watery eyes gazing off to the side give the image a sense of immediacy.', 'The subject, who appears in different guises in several other paintings by Rembrandt van Rijn and his contemporaries, wears a plumed hat and metal breastplate.', 1630, 51, 66, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/an-old-man-in-military-costume/5QHSdGU-GIOq5A?hl=en', NULL, NULL),
(595, 107, 27, '107050', 'The Bird Catchers', 2, 'http://www.getty.edu/art/collection/objects/590/francois-boucher-the-bird-catchers-french-1748/', '71.PA.38', 'Public domain', 'Responding to the contemporary rage for pastorals depicting amorous countryside games, François Boucher here exhibited young, fashionable couples in the act of catching birds. In the 1700s, small birds played an important symbolic role in courtship ritual: the gift of a caged bird from a man to a woman signified her capture of his heart. Posed in front of the ruins of a temple to Vesta, young aristocratic women dressed in exquisite finery play with small birds; some still hold them on strings while others daintily hold them on their fingers.', 'Responding to the contemporary rage for pastorals depicting amorous countryside games, François Boucher here exhibited young, fashionable couples in the act of catching birds.', 1748, 294, 337, 'Oil on canvas', '1600.0000', '2000.0000', 'https://www.google.com/culturalinstitute/beta/asset/the-bird-catchers/xwEWTp-JlLY4BA?hl=en', NULL, NULL),
(596, 63, 27, '063030', 'A Centennial of Independence', 2, 'http://www.getty.edu/art/collection/objects/816/henri-rousseau-a-centennial-of-independence-french-1892/', '88.PA.58', 'Public domain', 'Henri Rousseau commemorated the one-hundredth anniversary of the proclamation of the first French Republic in 1792. Peasants dance the farandole, a popular southern French dance, around three liberty trees and two female figures representing the First and Third Republics. Rousseau copied the dancers from a French magazine illustration but added waving banners, the liberty poles, and the allegorical figures. A wagon in the background is full of costumed musicians, reminiscent of parades the artist had seen. He used brilliant colors and solid forms to express the happiness of the scene symbolizing good government. To the right, the erect posture of the dignified republican leaders signals the solidity of the French Republic.', 'Henri Rousseau commemorated the one-hundredth anniversary of the proclamation of the first French Republic in 1792.', 1892, 158, 111, 'Oil on canvas', '700.0000', '900.0000', 'https://www.google.com/culturalinstitute/beta/asset/a-centennial-of-independence/WAFKMD3ymhrp_g?hl=en', NULL, NULL),
(597, 103, 30, '103050', 'William II, Prince of Orange, and his Bride, Mary Stuart', 1, 'http://hdl.handle.net/10934/RM0001.COLLECT.8289', 'SK-A-102', 'Public domain', 'The boy is fourteen and the girl only nine. William’s father, Frederick Henry, commissioned the celebrated Flemish painter Van Dyck to portray the young Dutch prince and English princess on the occasion of their marriage in London. The union with the daughter of the English king enhanced the status of the House of Orange. On her gown, Mary wears a gift from William, a large diamond brooch.', 'William’s father, Frederick Henry, commissioned the celebrated Flemish painter Van Dyck to portray the young Dutch prince and English princess on the occasion of their marriage in London.', 1641, 142, 182, 'Oil on canvas', '1100.0000', '1500.0000', 'https://www.google.com/culturalinstitute/beta/asset/william-ii-prince-of-orange-and-his-bride-mary-stuart/ZQFrg3nK-U4BXQ', NULL, NULL),
(598, 141, 6, '141010', 'Saint Margaret and the Dragon', 1, 'http://www.metmuseum.org/art/collection/search/436429', '41.190.23', 'Open Access for Scholarly Content', 'Together with two other small panels, this depiction of Saint Margaret emerging from the mouth of a dragon formed part of the predella of an unidentified altarpiece. Supposedly martyred in 304, legend had it that Margaret was swallowed by Satan in the guise of a dragon, but emerged unscathed due to the cross she possessed.', 'Together with two other small panels, this depiction of Saint Margaret emerging from the mouth of a dragon formed part of the predella of an unidentified altarpiece.', 1390, 20, 23, 'Tempera on wood', '1500.0000', '1900.0000', NULL, NULL, NULL),
(599, 141, 6, '141020', 'The Trinity', 5, 'http://www.metmuseum.org/art/collection/search/436428', '41.100.33', 'Open Access for Scholarly Content', 'This imposing representation of the Trinity (God the Father, his son Jesus on the cross, and the dove of the Holy Spirit) was painted about 1390 and is probably the center of a triptych. Among the leading painters in late-fourteenth-century Florence, Agnolo’s work, with its pastel colors and delicate modeling, was especially important for Lorenzo Monaco, whose four prophets hang nearby.', 'This imposing representation of the Trinity was painted about 1390 and is probably the center of a triptych.', 1395, 70, 129, 'Tempera on wood', '1800.0000', '2200.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PaintingSubjects`
--

CREATE TABLE `PaintingSubjects` (
  `PaintingSubjectID` int(11) NOT NULL,
  `PaintingID` int(11) DEFAULT '0',
  `SubjectID` int(11) DEFAULT '11'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PaintingSubjects`
--

INSERT INTO `PaintingSubjects` (`PaintingSubjectID`, `PaintingID`, `SubjectID`) VALUES
(4, 5, 11),
(6, 7, 11),
(7, 8, 11),
(11, 11, 11),
(12, 12, 11),
(14, 14, 11),
(15, 15, 11),
(16, 16, 11),
(18, 16, 2),
(25, 23, 11),
(26, 24, 11),
(27, 25, 10),
(28, 26, 11),
(31, 29, 11),
(32, 29, 3),
(33, 30, 11),
(34, 30, 15),
(36, 31, 11),
(39, 35, 11),
(40, 36, 11),
(41, 36, 14),
(42, 37, 11),
(43, 39, 11),
(46, 41, 11),
(47, 42, 11),
(48, 42, 13),
(50, 45, 11),
(51, 46, 2),
(52, 46, 12),
(53, 47, 2),
(54, 47, 7),
(55, 48, 2),
(56, 48, 12),
(57, 49, 7),
(58, 49, 2),
(59, 50, 11),
(60, 50, 2),
(61, 51, 2),
(62, 51, 9),
(63, 52, 11),
(65, 54, 11),
(66, 54, 9),
(67, 55, 9),
(68, 55, 11),
(69, 56, 11),
(70, 57, 11),
(71, 58, 11),
(73, 60, 12),
(74, 60, 10),
(75, 61, 7),
(77, 63, 2),
(78, 64, 11),
(79, 65, 2),
(80, 66, 2),
(81, 67, 11),
(82, 66, 11),
(83, 68, 2),
(85, 70, 11),
(86, 71, 10),
(87, 71, 12),
(88, 77, 11),
(89, 77, 16),
(90, 78, 11),
(91, 78, 16),
(92, 79, 11),
(93, 80, 11),
(94, 81, 11),
(95, 81, 9),
(96, 83, 11),
(103, 88, 11),
(104, 89, 11),
(115, 101, 11),
(116, 102, 11),
(117, 103, 7),
(119, 105, 2),
(127, 114, 5),
(128, 115, 5),
(130, 118, 5),
(131, 118, 1),
(132, 119, 5),
(133, 124, 2),
(134, 139, 2),
(135, 139, 11),
(136, 139, 14),
(137, 140, 11),
(139, 142, 11),
(140, 142, 14),
(141, 145, 11),
(142, 146, 11),
(143, 146, 15),
(146, 152, 11),
(147, 153, 11),
(148, 154, 11),
(151, 157, 11),
(152, 157, 14),
(158, 162, 11),
(163, 165, 11),
(164, 167, 11),
(165, 171, 1),
(166, 171, 10),
(167, 172, 11),
(168, 173, 11),
(171, 178, 11),
(172, 179, 2),
(173, 181, 14),
(174, 182, 11),
(177, 190, 11),
(178, 191, 11),
(179, 192, 15),
(180, 192, 11),
(183, 182, 18),
(184, 56, 18),
(185, 194, 11),
(186, 195, 2),
(194, 173, 13),
(195, 213, 18),
(196, 214, 18),
(200, 219, 2),
(202, 225, 5),
(207, 230, 5),
(208, 231, 18),
(209, 231, 11),
(210, 232, 11),
(211, 231, 12),
(212, 232, 1),
(213, 233, 11),
(216, 233, 15),
(217, 235, 11),
(224, 258, 5),
(225, 259, 5),
(226, 287, 11),
(227, 288, 11),
(228, 290, 11),
(229, 291, 11),
(230, 291, 6),
(232, 157, 4),
(235, 294, 11),
(237, 296, 11),
(238, 296, 17),
(241, 299, 11),
(242, 300, 13),
(243, 300, 10),
(244, 301, 11),
(253, 310, 11),
(254, 333, 5),
(255, 334, 5),
(256, 339, 11),
(257, 69, 11),
(258, 342, 11),
(259, 343, 11),
(264, 346, 11),
(265, 346, 14),
(266, 347, 11),
(267, 347, 1),
(268, 347, 14),
(269, 348, 11),
(270, 348, 14),
(271, 349, 11),
(273, 351, 11),
(274, 352, 2),
(289, 24, 3),
(301, 366, 11),
(302, 366, 9),
(303, 366, 16),
(308, 369, 9),
(309, 369, 11),
(310, 370, 9),
(311, 370, 11),
(316, 373, 9),
(317, 373, 11),
(318, 374, 9),
(319, 374, 11),
(320, 375, 9),
(321, 375, 11),
(322, 376, 19),
(323, 376, 18),
(324, 376, 11),
(325, 377, 19),
(326, 377, 11),
(327, 377, 18),
(328, 378, 19),
(329, 378, 11),
(330, 378, 18),
(331, 379, 11),
(332, 379, 9),
(333, 380, 9),
(334, 380, 11),
(335, 381, 9),
(336, 381, 11),
(340, 383, 11),
(341, 384, 9),
(342, 384, 11),
(343, 384, 16),
(344, 386, 9),
(345, 386, 11),
(346, 387, 11),
(347, 388, 11),
(348, 388, 9),
(349, 389, 11),
(352, 391, 9),
(353, 391, 11),
(354, 391, 16),
(355, 392, 9),
(356, 392, 11),
(357, 393, 9),
(358, 393, 18),
(359, 393, 11),
(360, 394, 9),
(361, 394, 11),
(362, 394, 16),
(367, 398, 9),
(368, 398, 11),
(369, 399, 9),
(370, 399, 11),
(374, 401, 9),
(375, 401, 11),
(378, 403, 9),
(379, 403, 11),
(381, 405, 11),
(382, 406, 11),
(383, 407, 11),
(384, 408, 19),
(385, 408, 11),
(386, 408, 18),
(390, 412, 9),
(391, 412, 11),
(392, 413, 11),
(393, 413, 19),
(394, 413, 18),
(402, 417, 11),
(403, 418, 14),
(404, 419, 11),
(405, 419, 19),
(406, 419, 18),
(407, 420, 11),
(408, 422, 11),
(409, 422, 18),
(410, 423, 11),
(411, 423, 18),
(412, 424, 11),
(413, 425, 11),
(414, 426, 11),
(415, 426, 18),
(416, 427, 11),
(417, 428, 11),
(418, 428, 14),
(421, 430, 10),
(422, 430, 18),
(423, 431, 11),
(424, 431, 18),
(425, 432, 11),
(426, 432, 19),
(427, 432, 18),
(428, 433, 11),
(430, 435, 11),
(431, 436, 11),
(432, 7, 18),
(433, 409, 11),
(434, 409, 19),
(435, 409, 18),
(436, 51, 18),
(439, 299, 9),
(440, 79, 18),
(442, 366, 15),
(443, 378, 15),
(444, 409, 15),
(445, 419, 15),
(446, 427, 15),
(447, 431, 16),
(448, 437, 11),
(449, 438, 11),
(450, 438, 15),
(451, 439, 11),
(452, 439, 9),
(453, 439, 18),
(455, 441, 9),
(457, 441, 11),
(458, 441, 16),
(459, 442, 16),
(460, 442, 15),
(461, 443, 11),
(465, 445, 18),
(466, 445, 9),
(474, 448, 11),
(475, 448, 15),
(478, 450, 11),
(479, 450, 16),
(480, 451, 18),
(481, 451, 15),
(482, 451, 11),
(483, 451, 19),
(486, 453, 2),
(487, 453, 7),
(488, 455, 11),
(489, 455, 2),
(490, 455, 15),
(491, 456, 11),
(492, 455, 16),
(493, 456, 11),
(494, 457, 11),
(495, 458, 11),
(496, 459, 11),
(497, 460, 11),
(498, 460, 21),
(499, 114, 5),
(500, 115, 5),
(501, 119, 5),
(502, 258, 5),
(503, 333, 5),
(504, 334, 5),
(505, 418, 21),
(506, 461, 21),
(507, 461, 11),
(508, 462, 11),
(509, 463, 18),
(510, 463, 11),
(511, 463, 16),
(512, 464, 16),
(513, 464, 11),
(514, 465, 16),
(515, 465, 11),
(516, 465, 1),
(517, 466, 11),
(518, 467, 11),
(519, 468, 2),
(520, 468, 11),
(521, 468, 7),
(522, 469, 11),
(523, 469, 21),
(524, 470, 11),
(525, 471, 11),
(526, 472, 11),
(527, 473, 11),
(528, 474, 11),
(529, 474, 9),
(530, 474, 18),
(531, 475, 11),
(532, 476, 11),
(533, 476, 18),
(534, 476, 9),
(535, 477, 9),
(536, 477, 11),
(537, 478, 11),
(538, 479, 11),
(539, 479, 20),
(540, 481, 11),
(541, 482, 11),
(542, 482, 18),
(543, 483, 2),
(544, 484, 2),
(545, 486, 2),
(546, 486, 11),
(547, 486, 1),
(548, 487, 2),
(549, 488, 11),
(550, 488, 14),
(551, 489, 14),
(552, 488, 16),
(553, 489, 15),
(554, 489, 11),
(555, 490, 11),
(556, 490, 14),
(557, 492, 11),
(558, 493, 11),
(559, 495, 11),
(560, 496, 10),
(561, 497, 11),
(562, 498, 10),
(563, 498, 12),
(564, 499, 19),
(565, 499, 11),
(566, 500, 11),
(567, 501, 2),
(568, 502, 2),
(569, 504, 2),
(570, 505, 19),
(571, 505, 14),
(572, 505, 11),
(573, 506, 11),
(574, 506, 9),
(575, 506, 2),
(576, 507, 2),
(577, 507, 14),
(578, 508, 9),
(579, 508, 11),
(580, 508, 20),
(581, 509, 17),
(582, 509, 11),
(583, 510, 11),
(584, 511, 11),
(585, 512, 11),
(586, 513, 11),
(587, 514, 2),
(588, 515, 11),
(589, 516, 11),
(590, 517, 2),
(591, 518, 11),
(592, 519, 2),
(593, 519, 7),
(594, 501, 7),
(595, 502, 7),
(596, 504, 7),
(597, 520, 2),
(598, 520, 11),
(599, 521, 11),
(600, 522, 11),
(601, 523, 11),
(602, 524, 2),
(603, 525, 11),
(604, 526, 11),
(605, 527, 11),
(606, 528, 20),
(607, 528, 11),
(608, 529, 7),
(609, 530, 2),
(610, 530, 12),
(611, 531, 11),
(612, 532, 11),
(613, 533, 11),
(614, 533, 9),
(615, 534, 2),
(616, 534, 18),
(617, 535, 2),
(618, 536, 2),
(619, 536, 18),
(620, 536, 9),
(621, 537, 9),
(622, 538, 9),
(623, 539, 11),
(624, 540, 11),
(625, 541, 9),
(626, 542, 11),
(627, 542, 20),
(628, 543, 9),
(629, 544, 19),
(630, 544, 11),
(631, 545, 11),
(632, 545, 19),
(633, 546, 18),
(634, 546, 9),
(635, 547, 18),
(636, 547, 2),
(637, 547, 7),
(638, 548, 2),
(639, 548, 11),
(640, 549, 9),
(641, 549, 11),
(642, 550, 11),
(643, 550, 9),
(644, 550, 20),
(645, 551, 11),
(646, 552, 9),
(647, 552, 11),
(648, 553, 11),
(649, 553, 9),
(650, 554, 11),
(651, 555, 11),
(652, 555, 18),
(653, 556, 9),
(654, 557, 9),
(655, 557, 14),
(656, 557, 11),
(657, 558, 9),
(658, 558, 11),
(659, 559, 11),
(660, 559, 9),
(661, 560, 11),
(662, 560, 9),
(663, 561, 9),
(664, 561, 11),
(665, 562, 11),
(666, 562, 9),
(667, 562, 16),
(668, 560, 16),
(669, 563, 11),
(670, 563, 9),
(671, 564, 11),
(672, 565, 2),
(673, 565, 6),
(674, 565, 7),
(675, 566, 11),
(676, 566, 15),
(677, 567, 11),
(678, 567, 18),
(679, 568, 2),
(680, 568, 18),
(681, 569, 18),
(682, 569, 2),
(683, 570, 2),
(684, 570, 18),
(685, 571, 18),
(686, 571, 19),
(687, 571, 2),
(688, 572, 11),
(689, 572, 9),
(690, 573, 11),
(691, 573, 14),
(692, 573, 17),
(693, 574, 14),
(694, 574, 11),
(695, 575, 11),
(696, 575, 9),
(697, 576, 11),
(698, 577, 19),
(699, 577, 11),
(700, 578, 9),
(701, 579, 11),
(702, 580, 9),
(703, 580, 11),
(704, 581, 19),
(705, 581, 2),
(706, 582, 11),
(707, 583, 5),
(708, 584, 11),
(709, 585, 11),
(710, 585, 18),
(711, 586, 11),
(712, 587, 11),
(713, 587, 18),
(714, 588, 11),
(715, 588, 16),
(716, 589, 11),
(717, 589, 16),
(718, 589, 15),
(719, 590, 11),
(720, 590, 19),
(721, 590, 15),
(722, 591, 2),
(723, 591, 18),
(724, 592, 11),
(725, 593, 9),
(726, 594, 11),
(727, 594, 21),
(728, 595, 11),
(729, 595, 2),
(730, 596, 11),
(731, 596, 18),
(732, 597, 11),
(733, 597, 20),
(734, 598, 9),
(735, 599, 9),
(736, 23, 5),
(737, 8, 5),
(738, 347, 20),
(739, 347, 21),
(740, 348, 20),
(741, 36, 21),
(742, 36, 20),
(743, 41, 17),
(744, 67, 17),
(745, 81, 18),
(746, 235, 5),
(747, 560, 7),
(748, 381, 7),
(749, 559, 7),
(750, 546, 7),
(751, 479, 1);

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
(2, 54, 'TIL in ancient Egypt, under the decree of Ptolemy II, all ships visiting the city were obliged to surrender their books to the library of Alexandria and be copied. The original would be kept in the library and the copy given back to the owner.                      ', '2019-03-31 02:50:03', 1, 'Ptolemy II Philadelphus, (Philadelphus in Greek: “Brother-Loving”) (born 308 bce, Cos—died 246), king of Egypt (285–246 bce), second king of the Ptolemaic dynasty, who extended his power by skillful diplomacy, developed agriculture and commerce, and made Alexandria a leading centre of the arts and sciences...'),
(3, 35, 'TIL Australia\'s first cops were all criminals. Their first police force was made up of 12 of the best behaved convicts.', '2019-03-31 02:50:03', 5, 'When you think of the police force, you probably think of exceptional men and women. Pillars of society. But that wasn’t always the case.\r\n\r\nIn fact, Australia’s first police force was made up entirely of convicts.\r\n\r\nAfter the First Fleet arrived in New South Wales in January of 1788, the Marines of the Royal Navy was put in charge of law enforcement, laying down the rules set by Governor Arthur Phillip.\r\n\r\nWith the pain of reduced rations hitting hard, crime began to rise steadily throughout the colony.\r\n\r\nIt was soon decided that the new settlement needed a police force of its own, so Governor Phillip created the Night Watch.\r\n\r\nWith little manpower available, the Governor decided to populate the Night Watch with 12 of the best behaved convicts.'),
(4, 28, 'TIL if you won the lottery in Australia, you had to go public with your win, turning into an overnight celebrity. This was until the abduction & murder of Graeme Thorne, 8, whose family won the lottery leading to Graeme being abducted for ransom but killed.', '2019-03-31 02:50:03', 5, 'It was the 7th of July, 1960, when Freda Thorne kissed her son, 8-year-old Graeme Thorne, goodbye and sent him off to school. Graeme lived in a two-bedroom ground floor flat in Edward St., Bondi, Australia, with his mother, his father, Bazil, and his 3-year-old sister, Belinda.\r\n\r\nTragically, this was the last time Freda would ever see her son alive. Moments after leaving their home, he would become the very first victim of kidnap for ransom in Australia’s history.\r\n\r\nThat morning, Graeme walked the short distance to Wellington and O’Brien Streets to wait for family friend, Phyllis Smith, who would routinely collect him from this spot to take him to school along with her own two sons. When she arrived as the designated spot, Graeme wasn’t there. Phyllis drove to the Thorne residence to check if Graeme was there. He wasn’t. Freda immediately called police to report her son missing.\r\n\r\n'),
(5, 28, 'TIL the last victim of the 1966 University of Texas at Austin shooting died in 2001 after having to undergo dialysis for 35 years, 3 times a week, 5 hours each time. His death was ruled a homicide.', '2019-03-31 02:50:03', 4, 'It took 35 painful years, but a rifle bullet fired by Charles Whitman on Aug. 1, 1966, from the observation deck of the University of Texas Tower finally killed its victim this week.\r\n\r\nDavid Gunby, 58, died Monday at Harris Hospital in Fort Worth, and the Tarrant County medical examiner, Dr. Nizam Peerwani, ruled the death a homicide, given the chronic kidney problems he suffered because of the gunshot wound.'),
(6, 40, 'TIL NASA calculated that you only need 40 digits of Pi to calculate the circumference of the observable universe, to the accuracy of 1 hydrogen atom ', '2019-03-31 02:50:03', 1, '\r\nEarlier this week, we received this question from a fan on Facebook who wondered how many decimals of the mathematical constant pi (π) NASA-JPL scientists and engineers use when making calculations:\r\n\r\nDoes JPL only use 3.14 for its pi calculations? Or do you use more decimals like say: 3.14159265358979...'),
(7, 30, 'TIL Smoking Areas existed in Public High Schools back in the 1980’s. Students could smoke cigarettes on school grounds between classes in designated lounges', '2019-03-31 05:36:28', 4, 'Legislation to eliminate student smoking areas on public high school campuses gained final legislative passage Wednesday night and was sent to Gov. George Deukmejian.'),
(9, 58, 'TIL Slave Bible, an abridged version of the bible made for slaves, in which the enslaved Israelites never left Egypt and lines that condemn slave owners were removed.', '2019-04-02 21:10:45', 4, 'testing post content'),
(11, 39, 'TIL Deep-Sea Gigantism is the tendency for species to be larger than their shallower-water relatives. Proposed explanations include: scarcer resources; greater pressure; and colder temperatures.', '2019-04-02 21:12:34', 1, 'In zoology, deep-sea gigantism, also known as abyssal gigantism, is the tendency for species of invertebrates and other deep-sea dwelling animals to be larger than their shallower-water relatives. Proposed explanations involve adaptation to scarcer food resources, greater pressure or colder temperature at depth.'),
(13, 1, 'TIL Southern California Edison plans to bury 3.6 million pounds of lethal radioactive waste at the closed San Onofre nuclear power plant, about 100 feet from the ocean and just a few feet above the water table.', '2019-04-02 21:13:07', 5, 'he current plan for storing the plant\'s radioactive waste is ... Southern California Edison is keeping 3.6 million pounds of lethal radioactive waste at the shuttered San Onofre nuclear plant in ... The idea is to bury the spent fuel on site, about 100 feet from the ocean and just a few feet above the water table.\r\n'),
(15, 1, 'TIL Pigeons can understand when a flock leader is doing a poor job and course correct. The poor leader will also spend less time as head bird and lose flock mates due to poor performance.', '2019-04-02 21:13:49', 5, 'Speed wins over competence in the pigeon world: The fastest, not the smartest, pigeons become leaders of the flock. But a new study published in the Royal Society journal Biology Letters shows potential for a coup in the coop when the head pigeon flies astray.\r\n\r\nResearchers at the University of Oxford confused pigeons using \"clock-shifting,\" to mix up their navigational abilities. This is essentially intentional jet-lagging: Homing pigeons are kept in a light-sealed room, where artificial lights are turned on and off at intervals out of phase with the sun\'s natural light. When they\'re released, they\'ve been calibrated to head in the direction you want them to fly.\r\n\r\nTaking eight GPS-tracked flocks of five birds each, they clock-shifted either the whole flock, none of the birds, or only the lead bird. In those where the whole flock was on the same, wrong page, they tended to deviate away from their homeward path. When just the leader was confused, however, the rest of the birds course-corrected, despite the leader\'s incorrect path. The head bird spent less time at the top, and lost more followers when the rest of the flock knew what was up.\r\n\r\n\"The exact mechanism by which a flock is able to correct for misinformation coming from its leader is still unclear,\" lead author Isobel Watts told Phys.org. \"However, we can speculate that it may be due to either misinformed flock leaders doubting their own abilities and paying more attention to what their flockmates appear to be doing, or the flock members recognising weakness in the leader and taking more control themselves.\"\r\n\r\ntags:  pigeons  animals  intelligence \r\nYou May Like\r\nHigh Speed WiFi Booster Takes Canada By Storm\r\nWiFi Booster\r\nU.S. Cardiologist: It\'s Like a Pressure Wash for Your Insides\r\nTotal Restore Supplement\r\nSponsored Links\r\nMost Of The Web Is Invisible To Google. Here\'s What It Contains\r\nWant to know more about the dark web and what’s available? Check out this roadmap to learn all about the deep web and its darkest alleys.\r\nYou May Like\r\nA Simple Fix For Snoring And Sleep Apnea\r\nPurch Expert\r\nDo You Know What Your Irish Surname Means?\r\nAncestry™\r\nSponsored Links\r\nSeasoning your cast iron pan isn’t enough\r\nCast iron is strange mixture of incredibly durable and unusually delicate—especially for a cooking implement. The metal is physically sturdy, but also highly reactive, which means even a droplet of water left in the pan can leave a rust spot. To protect that nice black surface, you must coat it with\r\nLATEST NEWS\r\nHEALTH\r\nWhat we know about the polio-like illness paralyzing children—and what we don\'t\r\nTECHNOLOGY\r\nMegapixels: An epic wildebeest crossing, a really hungry fox, and more Smithsonian Photo Contest finalists\r\nHEALTH\r\nThese charts will help you visualize just how unhealthy diets are around the world\r\nTECHNOLOGY\r\nNot all of us can ride a scooter. Here\'s a plan to get everyone where they need to go.\r\nHEALTH\r\nSleeping with your screens on is bad for you, whether you know it or not\r\nGADGETS\r\nThe best lightweight setup for a traveling guitarist\r\nENVIRONMENT\r\nAir pollution from corn production might contribute to thousands of deaths each year\r\nDIY\r\nHow to build a thriving indoor garden\r\nENVIRONMENT\r\nWind turbines do not cause cancer\r\n\r\nPOPSCI SHOP\r\nThis music-oriented app can help you learn a new language\r\nCheck out the Earworms Musical Brain Trainer app.\r\nBy Stack Commerce\r\n\r\nENVIRONMENT\r\nPretty soon we\'ll have to stop blaming China for global carbon emissions\r\nThe United States is lagging behind.\r\nBy Kat Eschner\r\n\r\nPOPSCI SHOP\r\nName your price on 65 hours of beginner-friendly design tutorials\r\nYour new creative career starts here.\r\nBy Stack Commerce\r\n\r\nSCIENCE\r\nDinosaur extinction is an unsolved mystery. This ancient fish may have swallowed some crucial evidence.\r\nBut the findings are not without their fair share of critics.\r\nBy Neel V. Patel\r\n\r\nGADGETS\r\nApple\'s AR headset, Amazon streaming news, and the rest of the current tech rumors\r\nCatch up on all the technology gossip without all the hype.\r\nBy PopSci Staff\r\n\r\nHEALTH\r\nMillennials want spirits—with none of the alcohol. Here\'s how distilleries make it work.\r\nThe science behind the latest (non-)drinking trend.\r\nBy Eleanor Cummins\r\n\r\nTECHNOLOGY\r\nThis experimental airplane will change shape while flying\r\nThe wing is strong but light.\r\nBy Rob Verger\r\n\r\nGADGETS\r\n40 percent off office supplies and other deals worth highlighting\r\nA quick guide to getting the goods for cheaper.\r\nBy Billy Cadden\r\nWant more news like this?\r\nSign up to receive our email newsletter and never miss an update!\r\n\r\nEnter email address\r\nBy submitting above, you agree to our privacy policy.\r\n\r\n \r\n          \r\nSUBSCRIBE RENEW CUSTOMER SERVICE PRIVACY POLICY TERMS OF USE ABUSE MASTHEAD CONTACT US GDPR\r\nMany products featured on this site were editorially chosen. Popular Science may receive financial compensation for products purchased through this site.\r\n\r\nCopyright © 2019 Popular Science. A Bonnier Corporation Company. All rights reserved. Reproduction in whole or in part without permission is prohibited.\r\n\r\n\r\n'),
(16, 1, 'TIL Nearly half of all airline pilots admit to falling asleep during a flight. 29 percent of these reported waking up and seeing everyone else in the cabin asleep as well.', '2019-04-02 21:14:45', 5, 'Poll also finds 49 per cent of flight-deck crew believe tiredness to be biggest threat to safety'),
(17, 28, 'TIL Noisestorm earned 50 thousand dollars from Epic Games for using their Unreal 4 game engine to create the music video for Crab Rave, \"for having the most creative and original use of their software. \"', '2019-04-02 21:26:13', 3, '\"Crab Rave\" was initially released as a small April Fool\'s Day joke,[3] although it soon gained popularity after becoming an internet meme due to the music video\'s uplifting theme and dancing crabs. In an interview with Suzana Palyan of Billboard, O\'Broin expressed his appreciation for its growing popularity, writing \"It\'s incredibly cool to see people enjoying it for the humour and video, as well as for the music itself. I really didn\'t anticipate the wave of new listeners and the plethora of memes based on the original; it\'s very fun to see the new creative variations being made every day.\" The music video was developed by O\'Broin using the program Unreal Engine.[4][3]'),
(18, 1, 'TIL Geese mate for life. When a hunter kills a goose, it\'s partner will mourn and generally refuse to mate again.', '2019-04-02 21:26:50', 1, 'Geese are especially fastidious when it comes to their loyalty. They\'re well known for the long-term pair bonds they form. So what\'s their secret? What makes these water birds so successful in their relationships, and why would geese mate for life?'),
(19, 1, 'TIL a majority of the \"snakes\" from the snake pit scene in Indiana Jones aren\'t actually snakes. The film used a species of legless lizards known as the sheltopusik.', '2019-04-02 21:29:07', 2, 'Our favourite ophidiophobe encounters snakes twice in the first of the three Indiana Jones movies. First, in South America, he finds himself in Jock’s plane, sharing a seat with Jock’s pet snake. You’d think that, being in South America, they’d use something South American, like a Boa Constrictor, which isn’t exactly hard to find. But no: they used a Burmese Python (Python molurus bivittatus) instead.'),
(20, 1, 'TIL That malaria has killed more than half of all humans since they were created.', '2019-04-02 21:29:56', 1, 'Long before Thanos snapped his fingers in Avengers: Infinity War, another villain successfully killed half of humanity.\r\n\r\nMalaria is a simple parasite, transmitted by a mosquito bite. But this deadly disease, which has been around as long as homo sapiens, has killed more than all wars and natural disasters combined. It has wiped out cities, destroyed empires, ruined colonies, and may be responsible for 50 billion deaths, among them Alexander the Great and Marcus Aurelius (allegedly).'),
(22, 1, 'TIL Amish people end formal education at the 8th grade. This is mainly because they value apprenticeship and hands-on learning, and that more advanced learning can foster anti-Christian beliefs and counter their values.', '2019-04-02 21:30:19', 3, 'Amish are well-known for their approach to schooling.  Most Amish children attend school in one- or two-room private schools, and end their formal education at the eighth grade.   Some observers criticize the Amish approach to education, seeing it as a means of restricting the individual.'),
(23, 1, 'TIL about Hart Island in NY, one of the largest cemeteries in the U.S. About one million people have been buried there since 1869, mostly children and stillborn babies. Very few people have even been allowed to visit, and taking pictures or videos is illegal.', '2019-04-02 21:30:35', 4, 'Hart Island, sometimes referred to as Hart\'s Island, is an island in the northeast Bronx.'),
(24, 1, 'TIL Groundhogs and Woodchucks are the same animal', '2019-04-02 21:32:46', 5, 'Groundhogs and woodchucks are the same animal. “Woodchuck” is just another name for “groundhog.”'),
(25, 1, 'TIL about William R. King, who was the 13th Vice President. He died of tuberculosis after only 6 weeks in office. He was also likely President Buchanan’s same sex partner.', '2019-04-02 21:33:31', 4, 'William Rufus DeVane King (April 7, 1786 – April 18, 1853) was an American politician and diplomat. '),
(26, 56, 'TIL American President Jimmy Carter issued complete pardons for draft avoiders and contentious objectors during the Vietnam War.', '2019-04-02 21:33:42', 4, 'On this day in 1977, U.S. President Jimmy Carter grants an unconditional pardon to hundreds of thousands of men who evaded the draft during the Vietnam War. '),
(27, 35, 'Til that Harvard student and seminarian Jonathan Daniels traveled to the south to aid the civil rights movement. He was walking with a black girl when a deputy pointed his shotgun at her. Daniels jumped in front of her, sacrificing his life so that she could live.', '2019-04-02 21:36:22', 4, 'Jonathan Myrick Daniels (March 20, 1939 – August 20, 1965) was an Episcopal seminarian and civil rights activist. In 1965, he was murdered by a shotgun-wielding construction worker, Tom Coleman, who was a special county deputy, in Hayneville, Alabama, while in the act of shielding 17-year-old Ruby Sales'),
(30, 1, 'TIL that cats have accents. Phonetics researchers have suggested that cats and their humans develop a “pidgin language” together to communicate, which may influence regional variations in cat vocalizations.', '2019-04-02 21:56:08', 1, 'Meow, miaou, yaong, nyan, näu: Humans say ‘meow’ in different ways, depending on what part of the world they’re from, but do cats? This is the question researchers at Lund University in Sweden are trying to answer in a new study on feline communication.'),
(31, 34, 'TIL during the 1936 Berlin Olympics, Jesse Owens fouled his first two attempts at long jump, but before the final attempt his Nazi rival, Luz Long, gave him some friendly advice that helped Owens qualify and win gold', '2019-04-03 05:40:07', 1, 'The Track and Field World Championships begin Saturday in Berlin — and they\'re surrounded by symbolism. It\'s the first time an American team has returned to the German city for a major international championship since the infamous 1936 Berlin Olympics. American team members will wear a patch honoring Jesse Owens, the star of the \'36 games.'),
(32, 13, 'TIL that Chicago\'s Field Museum has 10 colonies of flesh-eating beetles, who live and work at the museum cleaning animal bones for display.', '2019-04-03 05:44:46', 1, 'Not long ago, the thing in the tank was a living animal—a bobcat that prowled and hunted the way bobcats do, and then eventually died. What’s in the tank doesn’t resemble a bobcat, though. It’s just a mass that looks a little bit like jerky meat still on the bone. And the bobcat isn\'t alone, either: Little black beetles and setae-studded larvae are swarming all over the meat, devouring it. Put an ear to the top of the tank, and you’ll hear something akin to the snap-crackle-pop of Rice Krispies just drenched in milk—the sound of thousands of dermestid beetles hard at work.'),
(33, 1, 'TIL an alcoholic court stenographer in Manhattan repeatedly typed I hate my job instead of documenting speech during cases', '2019-04-03 05:46:14', 1, 'The actions of Kochanski, who has since been fired, have jeopardised several cases by giving felons the opportunity to claim crucial evidence is missing.'),
(39, 1, 'TIL in 2007, a 12 year old Norwegian boy named Hans Jorgen Olsen saved both himself and his sister from a vicious moose attack using skills he learned from playing World of Warcraft; taunt and feign death.', '2019-04-04 23:29:08', 1, 'Gaming skills are clearly transferable to real-life situations as one Norwegian boy will tell you. 12-year-old Hans Jorgen Olsen called upon skills gained through playing World of Warcraft to save himself and his sister from a moose attack.'),
(45, 56, 'TIL of Saitō Musashibō Benkei, a Japanese warrior who is said to have killed in excess of 300 trained soldiers by himself while defending a bridge. He was so fierce in close quarters that his enemies were forced to kill him with a volley of arrows. He died standing upright.', '2019-04-05 02:30:22', 2, 'Benkei was said to have wandered around Kyoto every night on a personal quest to take 1000 swords from samurai warriors, whom he believed were arrogant and unworthy. After collecting 999 swords through duels and looking for his final prize, he met a young man playing a flute at Gojotenjin Shrine in Kyoto. The much shorter man supposedly carried a gilded sword around his waist. Instead of dueling at the shrine itself, the two walked to Gojo Bridge in the city where the bigger Benkei ultimately lost to the smaller warrior, who happened to be Minamoto no Yoshitsune, a son of Minamoto no Yoshitomo. Some sources claim that the fight took place not at the Gojo Bridge, but instead at Matsubara Bridge.[3] Not long after the duel, Benkei, frustrated and looking for revenge, waited for Yoshitsune at the Buddhist temple of Kiyomizu, where he lost yet again.[4] Henceforth, he became Yoshitsune\'s retainer and fought with him in the Genpei War against the Taira clan.'),
(61, 57, 'TIL In the early 20th century the term \"Muggles\" meant someone who smoked marijuana. Louis Armstrong and some bandmates would get high before recording sessions and even recorded a song called \"Muggles\".', '2019-04-10 21:46:20', 5, '<br>'),
(64, 58, 'TIL That during WW2 there were around 250,000+ Filipino soldiers that fought for the allied forces and were promised the same compensation as their American counterparts, but in 1946 Truman signed the Rescission Act of 1946 which denied Filipino soldiers all of their benefits.', '2019-04-10 22:33:59', 4, '<br>'),
(65, 58, 'TIL in 1944, 22-year-old Corporal Anthony Damato threw himself on an enemy hand grenade, saving the lives of his two Marines at the cost of his own life. President Roosevelt later awarded him the Medal of Honor calling it a \"fearless and valiant sacrifice reflecting great upon himself and the US\".', '2019-04-10 22:34:11', 4, '<br>'),
(66, 58, 'TIL that the Portuguese man o’ war isn’t actually a jellyfish, but a colony of individual organisms called zooids, each with a different function within the ‘body’', '2019-04-10 22:34:27', 4, '<br>'),
(67, 60, 'TIL Seattle-Tacoma International Airport in Washington, USA has the fastest airport WIFI in the world with download speed of 103.00 Mbps and Upload speed of 155.93 Mbps', '2019-04-10 22:39:00', 5, '<br>'),
(68, 41, 'TIL that horseshoe crab blood, costing $60,000 per gallon, is unique and is integral in FDA testing. This has led to a massive effort by scientists to try to conserve this invaluable resource.', '2019-04-10 22:46:37', 1, '<br>'),
(69, 28, 'TIL that Pistachio Nuts are prone to spontaneous combustion if improperly stored or transported in large quantities due to a chemical reaction that continues to take place in the nuts even after they are harvested', '2019-04-10 22:59:47', 1, '<br>');

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
(215, 1, 2, 1),
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
(391, 41, 2, 0),
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
(467, 57, 61, 1),
(470, 58, 64, 1),
(471, 58, 65, 1),
(472, 58, 66, 1),
(473, 60, 67, 1),
(474, 60, 66, 1),
(475, 60, 61, 1),
(476, 60, 2, 1),
(477, 60, 3, 1),
(478, 60, 19, 1),
(479, 60, 27, 1),
(480, 41, 68, 1),
(486, 41, 67, 1),
(487, 41, 22, 1),
(488, 41, 24, 1),
(490, 28, 1, 1),
(492, 28, 3, 0),
(494, 28, 6, 1),
(495, 28, 23, 1),
(496, 28, 68, 1),
(497, 28, 26, 1),
(498, 28, 16, 1),
(499, 28, 17, 0),
(501, 28, 69, 1),
(502, 28, 4, 0),
(503, 28, 61, 1),
(506, 1, 23, 1),
(511, 61, 1, 1),
(512, 61, 2, 1),
(513, 61, 23, 0),
(514, 61, 11, 1),
(515, 61, 64, 1),
(516, 61, 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `RatingID` int(11) NOT NULL,
  `PaintingID` int(11) DEFAULT NULL,
  `ReviewDate` datetime DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`RatingID`, `PaintingID`, `ReviewDate`, `Rating`, `Comment`) VALUES
(1, 115, '2016-06-20 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(2, 424, '2016-03-25 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(3, 472, '2016-12-14 00:00:00', 1, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(4, 576, '2015-10-16 00:00:00', 2, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(5, 524, '2017-05-23 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(6, 592, '2017-08-20 00:00:00', 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(7, 172, '2017-06-06 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(8, 583, '2015-11-24 00:00:00', 1, NULL),
(9, 259, '2015-09-25 00:00:00', 4, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(10, 333, '2016-06-18 00:00:00', 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(11, 565, '2015-10-02 00:00:00', 3, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(12, 393, '2016-11-21 00:00:00', 5, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(13, 562, '2017-06-12 00:00:00', 2, NULL),
(14, 408, '2017-02-15 00:00:00', 1, NULL),
(15, 379, '2016-07-07 00:00:00', 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(16, 41, '2016-05-22 00:00:00', 5, NULL),
(17, 192, '2016-07-26 00:00:00', 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(18, 45, '2016-05-09 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(19, 580, '2017-09-04 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(20, 294, '2016-07-22 00:00:00', 5, NULL),
(21, 579, '2015-12-18 00:00:00', 3, NULL),
(22, 533, '2015-10-15 00:00:00', 3, NULL),
(23, 455, '2017-06-27 00:00:00', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(24, 484, '2016-03-18 00:00:00', 2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(25, 573, '2015-11-01 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(26, 403, '2016-10-29 00:00:00', 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(27, 599, '2016-02-29 00:00:00', 4, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(28, 486, '2016-11-15 00:00:00', 3, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(29, 484, '2017-03-08 00:00:00', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(30, 124, '2016-04-23 00:00:00', 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(31, 37, '2016-11-13 00:00:00', 5, NULL),
(32, 574, '2017-01-21 00:00:00', 5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(33, 586, '2016-09-16 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(34, 376, '2015-10-24 00:00:00', 1, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(35, 35, '2016-04-27 00:00:00', 3, NULL),
(36, 455, '2016-09-25 00:00:00', 3, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(37, 486, '2016-01-30 00:00:00', 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(38, 30, '2016-03-18 00:00:00', 2, NULL),
(39, 23, '2017-09-10 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(40, 114, '2015-09-19 00:00:00', 2, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(41, 375, '2016-09-28 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(42, 259, '2016-12-14 00:00:00', 5, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(43, 431, '2017-05-15 00:00:00', 4, NULL),
(44, 384, '2015-11-17 00:00:00', 2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(45, 47, '2017-03-16 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(46, 448, '2017-08-21 00:00:00', 1, NULL),
(47, 465, '2015-12-29 00:00:00', 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(48, 534, '2015-11-06 00:00:00', 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(49, 392, '2017-02-10 00:00:00', 1, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(50, 388, '2017-05-11 00:00:00', 2, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(51, 26, '2017-07-30 00:00:00', 5, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(52, 54, '2016-12-23 00:00:00', 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(53, 587, '2017-01-14 00:00:00', 3, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(54, 427, '2016-10-30 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(55, 533, '2017-01-08 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(56, 590, '2017-06-22 00:00:00', 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(57, 178, '2017-08-14 00:00:00', 1, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(58, 35, '2017-02-10 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(59, 290, '2017-06-16 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(60, 478, '2017-01-28 00:00:00', 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(61, 140, '2015-11-02 00:00:00', 1, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(62, 481, '2016-08-05 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(63, 71, '2017-03-07 00:00:00', 2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(64, 30, '2016-11-07 00:00:00', 3, NULL),
(65, 230, '2016-05-30 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(66, 586, '2017-01-02 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(67, 398, '2015-12-05 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(68, 549, '2016-04-17 00:00:00', 4, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(69, 571, '2016-09-30 00:00:00', 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(70, 501, '2017-06-02 00:00:00', 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(71, 571, '2017-05-20 00:00:00', 4, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(72, 118, '2016-05-05 00:00:00', 4, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(73, 408, '2017-07-19 00:00:00', 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(74, 573, '2017-05-14 00:00:00', 2, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(75, 16, '2017-04-15 00:00:00', 5, NULL),
(76, 545, '2016-03-10 00:00:00', 2, NULL),
(77, 521, '2017-06-28 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(78, 525, '2016-09-13 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(79, 554, '2016-11-12 00:00:00', 4, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(80, 142, '2016-02-29 00:00:00', 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(81, 48, '2016-02-14 00:00:00', 3, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(82, 374, '2016-07-11 00:00:00', 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(83, 498, '2016-04-26 00:00:00', 2, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(84, 172, '2017-01-29 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(85, 388, '2017-01-16 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(86, 430, '2017-03-28 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(87, 560, '2017-03-28 00:00:00', 1, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(88, 35, '2016-01-29 00:00:00', 2, NULL),
(89, 417, '2017-08-05 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(90, 514, '2017-09-13 00:00:00', 5, NULL),
(91, 533, '2017-09-11 00:00:00', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(92, 334, '2017-05-03 00:00:00', 5, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(93, 484, '2015-09-22 00:00:00', 3, NULL),
(94, 555, '2015-09-29 00:00:00', 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(95, 478, '2017-06-08 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(96, 426, '2016-07-08 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(97, 380, '2016-05-04 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(98, 467, '2017-08-11 00:00:00', 5, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(99, 427, '2017-08-10 00:00:00', 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(100, 572, '2016-08-16 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(101, 192, '2017-01-16 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(102, 213, '2016-03-29 00:00:00', 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(103, 568, '2016-11-03 00:00:00', 3, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(104, 541, '2015-12-27 00:00:00', 4, NULL),
(105, 576, '2017-07-07 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(106, 466, '2015-12-14 00:00:00', 3, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(107, 585, '2017-03-18 00:00:00', 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(108, 554, '2016-04-01 00:00:00', 3, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(109, 566, '2016-03-10 00:00:00', 4, NULL),
(110, 527, '2017-06-11 00:00:00', 3, NULL),
(111, 57, '2016-02-10 00:00:00', 5, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(112, 539, '2016-05-05 00:00:00', 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(113, 484, '2017-07-30 00:00:00', 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(114, 562, '2016-08-18 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(115, 505, '2017-09-05 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(116, 584, '2016-03-31 00:00:00', 2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(117, 64, '2017-02-11 00:00:00', 3, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(118, 232, '2015-11-22 00:00:00', 1, NULL),
(119, 65, '2017-04-16 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(120, 30, '2015-11-14 00:00:00', 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(121, 498, '2015-09-24 00:00:00', 5, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(122, 343, '2016-07-23 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(123, 408, '2017-04-27 00:00:00', 5, NULL),
(124, 520, '2016-04-18 00:00:00', 4, NULL),
(125, 47, '2017-07-16 00:00:00', 2, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(126, 57, '2017-08-18 00:00:00', 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(127, 68, '2016-02-14 00:00:00', 2, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(128, 219, '2016-09-25 00:00:00', 4, NULL),
(129, 587, '2016-05-27 00:00:00', 4, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(130, 528, '2016-01-04 00:00:00', 2, NULL),
(131, 453, '2017-01-29 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(132, 387, '2016-01-24 00:00:00', 4, NULL),
(133, 517, '2016-01-18 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(134, 89, '2017-08-30 00:00:00', 5, NULL),
(135, 48, '2017-01-24 00:00:00', 4, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(136, 594, '2016-05-03 00:00:00', 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(137, 101, '2015-11-13 00:00:00', 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(138, 528, '2016-09-11 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(139, 192, '2016-05-25 00:00:00', 4, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(140, 291, '2016-11-05 00:00:00', 1, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(141, 258, '2016-01-13 00:00:00', 1, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(142, 195, '2016-11-06 00:00:00', 5, NULL),
(143, 36, '2016-09-13 00:00:00', 2, NULL),
(144, 393, '2016-02-13 00:00:00', 3, NULL),
(145, 528, '2016-11-24 00:00:00', 2, NULL),
(146, 589, '2016-05-02 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(147, 288, '2017-08-16 00:00:00', 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(148, 41, '2017-08-01 00:00:00', 2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(149, 568, '2017-02-17 00:00:00', 2, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(150, 475, '2017-02-08 00:00:00', 3, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(151, 192, '2016-04-22 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(152, 101, '2015-11-14 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(153, 562, '2017-06-20 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(154, 474, '2016-02-26 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(155, 80, '2017-06-12 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(156, 507, '2016-10-31 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(157, 490, '2015-12-15 00:00:00', 3, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(158, 459, '2017-08-15 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(159, 60, '2016-05-06 00:00:00', 4, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(160, 63, '2016-06-10 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(161, 477, '2016-01-01 00:00:00', 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(162, 506, '2015-09-19 00:00:00', 1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(163, 586, '2016-11-12 00:00:00', 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(164, 178, '2016-07-24 00:00:00', 1, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(165, 294, '2016-02-09 00:00:00', 3, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(166, 473, '2016-04-09 00:00:00', 3, NULL),
(167, 105, '2017-07-27 00:00:00', 5, NULL),
(168, 587, '2016-12-21 00:00:00', 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(169, 388, '2016-09-17 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(170, 426, '2016-10-30 00:00:00', 3, NULL),
(171, 36, '2017-07-20 00:00:00', 4, NULL),
(172, 288, '2017-07-19 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(173, 482, '2015-12-28 00:00:00', 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(174, 519, '2016-12-29 00:00:00', 5, NULL),
(175, 300, '2016-04-01 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(176, 409, '2017-01-24 00:00:00', 2, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(177, 54, '2017-07-08 00:00:00', 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(178, 347, '2017-03-25 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(179, 589, '2017-01-21 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(180, 231, '2016-04-04 00:00:00', 4, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(181, 568, '2016-03-25 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(182, 88, '2016-09-04 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(183, 192, '2017-05-19 00:00:00', 1, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(184, 569, '2015-12-20 00:00:00', 3, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(185, 401, '2016-09-04 00:00:00', 3, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(186, 488, '2016-10-16 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(187, 591, '2015-10-02 00:00:00', 2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(188, 460, '2017-07-31 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(189, 386, '2016-05-10 00:00:00', 5, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(190, 105, '2016-06-25 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(191, 514, '2016-10-10 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(192, 498, '2017-09-01 00:00:00', 2, NULL),
(193, 582, '2015-10-01 00:00:00', 3, NULL),
(194, 450, '2016-04-20 00:00:00', 3, NULL),
(195, 549, '2016-07-21 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(196, 581, '2017-03-15 00:00:00', 5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(197, 514, '2016-04-03 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(198, 431, '2017-07-24 00:00:00', 3, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(199, 584, '2016-01-26 00:00:00', 3, NULL),
(200, 425, '2017-06-05 00:00:00', 4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(201, 393, '2015-12-12 00:00:00', 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(202, 14, '2016-05-24 00:00:00', 2, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(203, 258, '2016-09-14 00:00:00', 1, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(204, 54, '2017-05-23 00:00:00', 1, NULL),
(205, 486, '2016-04-25 00:00:00', 5, NULL),
(206, 58, '2016-04-19 00:00:00', 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(207, 81, '2016-04-28 00:00:00', 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(208, 495, '2017-08-04 00:00:00', 3, NULL),
(209, 511, '2015-12-03 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(210, 432, '2016-01-02 00:00:00', 3, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(211, 570, '2016-06-26 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(212, 30, '2016-06-19 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(213, 511, '2016-01-19 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(214, 36, '2017-01-17 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(215, 399, '2017-01-17 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(216, 425, '2015-09-16 00:00:00', 3, NULL),
(217, 171, '2016-09-22 00:00:00', 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(218, 51, '2016-05-25 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(219, 488, '2017-09-10 00:00:00', 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(220, 178, '2016-03-01 00:00:00', 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(221, 15, '2016-02-27 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(222, 514, '2017-05-28 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(223, 562, '2015-10-29 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(224, 399, '2017-01-05 00:00:00', 5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(225, 426, '2016-10-14 00:00:00', 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(226, 48, '2017-06-26 00:00:00', 1, NULL),
(227, 310, '2015-10-18 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(228, 492, '2016-01-22 00:00:00', 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(229, 60, '2016-06-08 00:00:00', 3, NULL),
(230, 532, '2017-06-05 00:00:00', 1, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(231, 598, '2016-11-20 00:00:00', 2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(232, 369, '2016-11-10 00:00:00', 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(233, 590, '2016-12-17 00:00:00', 5, NULL),
(234, 16, '2016-07-13 00:00:00', 2, NULL),
(235, 12, '2016-03-15 00:00:00', 5, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(236, 588, '2017-08-15 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(237, 102, '2017-02-16 00:00:00', 4, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(238, 46, '2017-04-20 00:00:00', 3, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(239, 347, '2015-09-23 00:00:00', 3, NULL),
(240, 65, '2017-06-30 00:00:00', 4, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(241, 103, '2017-05-23 00:00:00', 3, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(242, 498, '2017-05-15 00:00:00', 2, NULL),
(243, 39, '2017-02-26 00:00:00', 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(244, 46, '2016-03-06 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(245, 70, '2016-05-11 00:00:00', 5, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(246, 431, '2017-03-29 00:00:00', 3, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(247, 88, '2017-02-28 00:00:00', 5, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(248, 192, '2016-06-09 00:00:00', 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(249, 504, '2017-07-11 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(250, 333, '2016-01-02 00:00:00', 5, NULL),
(251, 347, '2017-07-11 00:00:00', 4, NULL),
(252, 291, '2016-01-19 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(253, 413, '2017-01-16 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(254, 554, '2016-09-06 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(255, 424, '2016-11-28 00:00:00', 4, NULL),
(256, 401, '2016-01-04 00:00:00', 3, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(257, 401, '2017-05-17 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(258, 451, '2016-06-22 00:00:00', 4, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(259, 457, '2017-05-06 00:00:00', 5, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(260, 516, '2015-10-30 00:00:00', 2, NULL),
(261, 508, '2016-06-06 00:00:00', 5, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(262, 426, '2016-04-03 00:00:00', 2, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(263, 588, '2016-08-02 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(264, 575, '2017-05-22 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(265, 558, '2017-07-28 00:00:00', 2, NULL),
(266, 552, '2017-02-06 00:00:00', 5, NULL),
(267, 598, '2017-08-08 00:00:00', 3, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(268, 554, '2017-03-03 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(269, 103, '2016-04-03 00:00:00', 5, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(270, 438, '2017-08-24 00:00:00', 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(271, 589, '2017-01-10 00:00:00', 1, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(272, 524, '2016-08-21 00:00:00', 1, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(273, 89, '2015-11-15 00:00:00', 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(274, 60, '2017-02-14 00:00:00', 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(275, 78, '2015-12-09 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(276, 154, '2016-03-30 00:00:00', 3, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(277, 438, '2017-04-30 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(278, 569, '2016-01-28 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(279, 552, '2016-10-03 00:00:00', 5, NULL),
(280, 474, '2016-06-03 00:00:00', 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(281, 142, '2016-07-15 00:00:00', 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(282, 501, '2015-10-08 00:00:00', 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(283, 575, '2017-03-02 00:00:00', 5, NULL),
(284, 119, '2015-10-09 00:00:00', 3, NULL),
(285, 581, '2016-04-18 00:00:00', 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(286, 568, '2016-01-13 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(287, 486, '2016-05-21 00:00:00', 5, NULL),
(288, 533, '2016-11-28 00:00:00', 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(289, 490, '2016-06-13 00:00:00', 2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(290, 154, '2016-08-29 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(291, 544, '2017-08-12 00:00:00', 5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(292, 233, '2017-08-25 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(293, 393, '2016-09-10 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(294, 546, '2017-01-12 00:00:00', 4, NULL),
(295, 60, '2016-10-13 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(296, 60, '2016-08-29 00:00:00', 1, NULL),
(297, 507, '2016-08-13 00:00:00', 1, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(298, 165, '2016-10-10 00:00:00', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(299, 52, '2015-12-25 00:00:00', 3, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(300, 549, '2017-09-07 00:00:00', 3, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(301, 470, '2017-05-04 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(302, 388, '2016-09-07 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(303, 47, '2016-12-16 00:00:00', 1, NULL),
(304, 431, '2017-06-22 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(305, 544, '2017-03-24 00:00:00', 1, NULL),
(306, 192, '2017-03-02 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(307, 596, '2015-09-17 00:00:00', 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(308, 571, '2017-01-02 00:00:00', 3, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(309, 564, '2016-01-25 00:00:00', 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(310, 124, '2017-08-03 00:00:00', 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(311, 556, '2016-06-09 00:00:00', 5, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(312, 165, '2016-10-26 00:00:00', 5, NULL),
(313, 114, '2017-03-27 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(314, 441, '2016-04-01 00:00:00', 1, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(315, 11, '2016-07-02 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(316, 580, '2016-05-28 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(317, 546, '2016-07-13 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(318, 488, '2016-12-16 00:00:00', 5, NULL),
(319, 456, '2016-02-22 00:00:00', 4, NULL),
(320, 195, '2017-06-26 00:00:00', 1, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(321, 103, '2016-05-30 00:00:00', 3, NULL),
(322, 394, '2016-05-03 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(323, 465, '2017-07-12 00:00:00', 5, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(324, 63, '2016-12-09 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(325, 406, '2016-01-01 00:00:00', 1, NULL),
(326, 409, '2017-09-01 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(327, 591, '2016-04-16 00:00:00', 1, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(328, 474, '2015-11-21 00:00:00', 2, NULL),
(329, 36, '2017-05-23 00:00:00', 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(330, 486, '2016-12-09 00:00:00', 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(331, 488, '2016-09-03 00:00:00', 3, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(332, 379, '2017-05-08 00:00:00', 2, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(333, 63, '2015-12-27 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(334, 525, '2017-01-31 00:00:00', 4, NULL),
(335, 140, '2017-01-08 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(336, 422, '2016-10-23 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(337, 588, '2016-01-13 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(338, 12, '2016-06-14 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(339, 58, '2016-07-07 00:00:00', 2, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(340, 181, '2017-08-27 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(341, 492, '2015-10-23 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(342, 301, '2017-01-09 00:00:00', 1, NULL),
(343, 556, '2015-10-02 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(344, 419, '2017-09-06 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(345, 195, '2015-11-15 00:00:00', 1, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(346, 67, '2017-03-28 00:00:00', 5, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(347, 46, '2017-02-03 00:00:00', 2, NULL),
(348, 509, '2016-03-12 00:00:00', 1, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(349, 388, '2016-01-26 00:00:00', 3, NULL),
(350, 258, '2016-10-03 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(351, 588, '2015-09-17 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(352, 401, '2017-03-10 00:00:00', 5, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(353, 12, '2016-01-09 00:00:00', 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(354, 63, '2015-10-24 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(355, 520, '2017-01-11 00:00:00', 1, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(356, 482, '2017-01-07 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(357, 461, '2017-03-27 00:00:00', 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(358, 525, '2015-09-16 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(359, 288, '2016-07-09 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(360, 26, '2016-03-06 00:00:00', 4, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(361, 562, '2016-10-28 00:00:00', 1, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(362, 445, '2016-01-02 00:00:00', 4, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(363, 562, '2016-10-05 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(364, 465, '2017-09-03 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(365, 30, '2017-02-04 00:00:00', 1, NULL),
(366, 376, '2017-08-28 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(367, 525, '2016-09-27 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(368, 232, '2017-04-28 00:00:00', 3, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(369, 593, '2016-12-13 00:00:00', 4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(370, 259, '2015-11-26 00:00:00', 2, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(371, 498, '2016-07-25 00:00:00', 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(372, 190, '2017-06-07 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(373, 539, '2016-04-20 00:00:00', 4, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(374, 181, '2016-04-25 00:00:00', 2, NULL),
(375, 65, '2016-09-10 00:00:00', 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(376, 482, '2016-05-19 00:00:00', 4, NULL);
INSERT INTO `Reviews` (`RatingID`, `PaintingID`, `ReviewDate`, `Rating`, `Comment`) VALUES
(377, 52, '2017-06-25 00:00:00', 5, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(378, 499, '2017-06-02 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(379, 467, '2016-10-18 00:00:00', 3, NULL),
(380, 551, '2016-04-15 00:00:00', 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(381, 466, '2016-03-16 00:00:00', 1, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(382, 394, '2017-08-12 00:00:00', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(383, 549, '2016-10-28 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(384, 64, '2016-11-14 00:00:00', 5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(385, 333, '2017-08-30 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(386, 333, '2017-06-20 00:00:00', 4, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(387, 561, '2016-03-02 00:00:00', 2, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(388, 586, '2016-07-17 00:00:00', 3, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(389, 16, '2016-01-10 00:00:00', 5, NULL),
(390, 225, '2015-11-16 00:00:00', 2, NULL),
(391, 589, '2017-06-05 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(392, 467, '2016-10-08 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(393, 65, '2016-11-10 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(394, 587, '2015-12-11 00:00:00', 2, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(395, 443, '2015-10-21 00:00:00', 2, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(396, 458, '2016-03-21 00:00:00', 2, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(397, 562, '2017-04-20 00:00:00', 4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(398, 233, '2016-09-23 00:00:00', 1, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(399, 565, '2017-05-23 00:00:00', 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(400, 527, '2015-12-07 00:00:00', 4, NULL),
(401, 442, '2016-10-14 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(402, 477, '2017-08-05 00:00:00', 4, NULL),
(403, 596, '2017-09-13 00:00:00', 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(404, 479, '2017-03-29 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(405, 500, '2016-06-14 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(406, 450, '2017-06-14 00:00:00', 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(407, 36, '2016-06-01 00:00:00', 3, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(408, 60, '2017-06-17 00:00:00', 1, NULL),
(409, 408, '2016-12-01 00:00:00', 1, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(410, 333, '2017-08-09 00:00:00', 3, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(411, 41, '2016-02-07 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(412, 333, '2016-09-26 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(413, 530, '2017-07-25 00:00:00', 5, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(414, 581, '2017-03-13 00:00:00', 5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(415, 438, '2017-01-30 00:00:00', 5, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(416, 408, '2017-06-09 00:00:00', 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(417, 300, '2017-01-05 00:00:00', 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(418, 425, '2016-12-14 00:00:00', 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(419, 568, '2017-08-29 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(420, 5, '2015-11-30 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(421, 89, '2016-12-05 00:00:00', 2, NULL),
(422, 63, '2015-11-18 00:00:00', 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(423, 573, '2016-09-02 00:00:00', 1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(424, 524, '2017-06-18 00:00:00', 1, NULL),
(425, 571, '2016-05-31 00:00:00', 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(426, 392, '2016-10-12 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(427, 370, '2015-12-04 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(428, 588, '2016-07-01 00:00:00', 3, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(429, 569, '2016-06-05 00:00:00', 2, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(430, 333, '2017-05-02 00:00:00', 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(431, 7, '2016-10-11 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(432, 586, '2017-05-19 00:00:00', 3, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(433, 115, '2017-02-01 00:00:00', 3, NULL),
(434, 389, '2017-01-05 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(435, 525, '2015-11-29 00:00:00', 4, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(436, 399, '2017-02-24 00:00:00', 1, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(437, 535, '2016-02-01 00:00:00', 3, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(438, 225, '2016-05-31 00:00:00', 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(439, 492, '2016-02-03 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(440, 504, '2016-02-19 00:00:00', 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(441, 334, '2015-10-02 00:00:00', 1, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(442, 567, '2017-07-08 00:00:00', 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(443, 419, '2015-09-25 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(444, 70, '2017-02-23 00:00:00', 5, NULL),
(445, 489, '2017-07-13 00:00:00', 4, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(446, 428, '2016-03-15 00:00:00', 5, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(447, 589, '2015-10-17 00:00:00', 5, NULL),
(448, 333, '2016-01-21 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(449, 569, '2016-06-07 00:00:00', 4, NULL),
(450, 554, '2017-08-15 00:00:00', 2, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(451, 498, '2017-04-20 00:00:00', 1, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(452, 506, '2017-07-28 00:00:00', 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(453, 60, '2015-09-25 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(454, 479, '2017-02-13 00:00:00', 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(455, 575, '2016-03-06 00:00:00', 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(456, 571, '2015-12-30 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(457, 342, '2016-02-15 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(458, 555, '2016-04-19 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(459, 48, '2017-01-08 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(460, 399, '2015-11-10 00:00:00', 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(461, 380, '2017-01-19 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(462, 35, '2016-11-23 00:00:00', 1, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(463, 375, '2017-02-07 00:00:00', 2, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(464, 124, '2017-08-19 00:00:00', 5, NULL),
(465, 162, '2016-05-19 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(466, 63, '2017-02-20 00:00:00', 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(467, 424, '2017-05-08 00:00:00', 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(468, 570, '2017-05-15 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(469, 538, '2017-03-09 00:00:00', 2, NULL),
(470, 501, '2016-02-05 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(471, 573, '2017-09-15 00:00:00', 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(472, 195, '2016-02-26 00:00:00', 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(473, 381, '2017-08-17 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(474, 426, '2017-06-27 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(475, 102, '2016-01-02 00:00:00', 4, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(476, 48, '2016-04-26 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(477, 39, '2016-02-27 00:00:00', 5, NULL),
(478, 80, '2015-10-14 00:00:00', 4, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(479, 509, '2016-09-27 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(480, 425, '2015-09-20 00:00:00', 4, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(481, 54, '2017-09-12 00:00:00', 3, NULL),
(482, 58, '2016-10-23 00:00:00', 3, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(483, 388, '2016-04-26 00:00:00', 2, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(484, 61, '2015-12-24 00:00:00', 5, NULL),
(485, 105, '2016-07-05 00:00:00', 1, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(486, 507, '2017-08-29 00:00:00', 1, NULL),
(487, 259, '2016-03-05 00:00:00', 4, NULL),
(488, 334, '2016-03-27 00:00:00', 4, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(489, 501, '2015-11-14 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(490, 587, '2016-07-25 00:00:00', 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(491, 233, '2016-06-09 00:00:00', 5, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(492, 460, '2016-10-22 00:00:00', 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(493, 39, '2015-11-24 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(494, 467, '2016-09-26 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(495, 77, '2016-02-19 00:00:00', 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(496, 507, '2017-01-06 00:00:00', 4, NULL),
(497, 425, '2016-12-28 00:00:00', 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(498, 351, '2015-11-14 00:00:00', 5, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(499, 30, '2016-07-27 00:00:00', 2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(500, 301, '2015-10-05 00:00:00', 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(501, 427, '2015-12-14 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(502, 173, '2017-01-04 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(503, 388, '2016-01-31 00:00:00', 5, NULL),
(504, 195, '2015-12-10 00:00:00', 4, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(505, 37, '2017-05-09 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(506, 599, '2017-05-16 00:00:00', 5, NULL),
(507, 42, '2016-09-17 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(508, 77, '2017-02-01 00:00:00', 4, NULL),
(509, 51, '2016-05-26 00:00:00', 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(510, 465, '2016-08-30 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(511, 573, '2017-08-28 00:00:00', 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(512, 178, '2015-10-05 00:00:00', 4, NULL),
(513, 432, '2017-07-12 00:00:00', 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(514, 467, '2017-09-07 00:00:00', 2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(515, 484, '2016-09-18 00:00:00', 5, NULL),
(516, 477, '2017-05-10 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(517, 588, '2016-04-06 00:00:00', 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(518, 543, '2016-06-06 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(519, 392, '2016-03-19 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(520, 412, '2017-01-20 00:00:00', 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(521, 573, '2016-08-13 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(522, 513, '2017-03-05 00:00:00', 4, NULL),
(523, 103, '2016-07-19 00:00:00', 5, NULL),
(524, 598, '2017-09-10 00:00:00', 1, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(525, 425, '2016-04-06 00:00:00', 1, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(526, 71, '2016-03-30 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(527, 576, '2016-12-13 00:00:00', 1, NULL),
(528, 521, '2016-03-03 00:00:00', 4, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(529, 334, '2017-03-28 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(530, 377, '2016-12-29 00:00:00', 3, NULL),
(531, 172, '2015-12-02 00:00:00', 3, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(532, 347, '2016-02-14 00:00:00', 4, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(533, 56, '2016-07-20 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(534, 511, '2016-08-02 00:00:00', 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(535, 61, '2016-09-23 00:00:00', 1, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(536, 30, '2017-05-10 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(537, 564, '2016-06-28 00:00:00', 1, NULL),
(538, 388, '2016-09-10 00:00:00', 3, NULL),
(539, 78, '2016-07-19 00:00:00', 4, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(540, 451, '2016-03-24 00:00:00', 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(541, 571, '2017-02-09 00:00:00', 4, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(542, 520, '2016-07-19 00:00:00', 4, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(543, 464, '2016-10-14 00:00:00', 3, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(544, 258, '2017-09-12 00:00:00', 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(545, 573, '2017-04-05 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(546, 30, '2017-05-26 00:00:00', 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(547, 14, '2015-12-07 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(548, 352, '2016-03-22 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(549, 291, '2016-01-01 00:00:00', 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(550, 573, '2016-10-19 00:00:00', 3, NULL),
(551, 498, '2016-05-17 00:00:00', 3, NULL),
(552, 492, '2016-07-22 00:00:00', 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(553, 145, '2017-05-12 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(554, 598, '2017-07-30 00:00:00', 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(555, 192, '2016-10-12 00:00:00', 5, NULL),
(556, 213, '2016-08-05 00:00:00', 2, NULL),
(557, 508, '2017-04-22 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(558, 14, '2015-10-28 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(559, 103, '2016-10-09 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(560, 287, '2016-10-07 00:00:00', 3, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(561, 105, '2017-01-28 00:00:00', 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(562, 401, '2016-03-17 00:00:00', 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(563, 173, '2017-01-10 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(564, 406, '2016-09-15 00:00:00', 5, NULL),
(565, 420, '2015-10-03 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(566, 425, '2017-01-16 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(567, 192, '2016-01-14 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(568, 573, '2016-08-04 00:00:00', 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(569, 51, '2016-07-14 00:00:00', 3, NULL),
(570, 381, '2016-04-26 00:00:00', 3, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(571, 549, '2016-11-01 00:00:00', 3, NULL),
(572, 509, '2016-09-30 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(573, 46, '2016-06-23 00:00:00', 5, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(574, 542, '2015-11-13 00:00:00', 2, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(575, 571, '2017-04-05 00:00:00', 3, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(576, 432, '2016-04-08 00:00:00', 5, NULL),
(577, 52, '2017-01-20 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(578, 486, '2016-12-28 00:00:00', 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(579, 334, '2016-09-25 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(580, 559, '2016-07-03 00:00:00', 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(581, 588, '2017-07-29 00:00:00', 1, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(582, 49, '2015-12-22 00:00:00', 3, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(583, 579, '2017-02-01 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(584, 437, '2016-10-18 00:00:00', 2, NULL),
(585, 58, '2017-07-20 00:00:00', 1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(586, 476, '2016-01-04 00:00:00', 2, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(587, 69, '2017-02-03 00:00:00', 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(588, 573, '2016-07-27 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(589, 370, '2016-11-21 00:00:00', 4, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(590, 41, '2015-11-23 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(591, 520, '2017-05-17 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(592, 432, '2017-02-13 00:00:00', 4, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(593, 376, '2017-05-20 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(594, 287, '2016-10-01 00:00:00', 3, NULL),
(595, 483, '2017-05-10 00:00:00', 1, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(596, 596, '2017-03-07 00:00:00', 1, NULL),
(597, 39, '2017-08-22 00:00:00', 3, NULL),
(598, 486, '2017-07-12 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(599, 509, '2016-11-22 00:00:00', 4, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(600, 334, '2017-04-04 00:00:00', 3, NULL),
(601, 467, '2016-02-08 00:00:00', 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(602, 573, '2016-05-17 00:00:00', 5, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(603, 573, '2016-03-04 00:00:00', 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(604, 541, '2015-11-28 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(605, 39, '2017-06-23 00:00:00', 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(606, 424, '2015-11-22 00:00:00', 5, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(607, 48, '2017-04-04 00:00:00', 4, NULL),
(608, 63, '2016-03-31 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(609, 79, '2017-02-26 00:00:00', 4, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(610, 291, '2016-03-27 00:00:00', 1, NULL),
(611, 77, '2017-01-30 00:00:00', 4, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(612, 294, '2016-10-22 00:00:00', 4, NULL),
(613, 514, '2017-03-27 00:00:00', 1, NULL),
(614, 441, '2017-05-13 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(615, 409, '2017-04-08 00:00:00', 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(616, 489, '2017-02-11 00:00:00', 2, NULL),
(617, 65, '2017-06-27 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(618, 388, '2016-05-16 00:00:00', 1, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(619, 588, '2016-10-26 00:00:00', 3, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(620, 15, '2016-12-14 00:00:00', 4, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(621, 192, '2016-04-02 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(622, 60, '2017-06-24 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(623, 436, '2017-02-18 00:00:00', 4, NULL),
(624, 565, '2016-01-30 00:00:00', 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(625, 542, '2016-06-23 00:00:00', 4, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(626, 230, '2016-01-07 00:00:00', 3, NULL),
(627, 423, '2016-12-31 00:00:00', 1, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(628, 192, '2017-03-17 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(629, 501, '2016-12-10 00:00:00', 4, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(630, 403, '2016-04-20 00:00:00', 2, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(631, 484, '2016-02-28 00:00:00', 3, NULL),
(632, 535, '2017-03-05 00:00:00', 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(633, 69, '2016-07-24 00:00:00', 5, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(634, 571, '2016-06-19 00:00:00', 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(635, 586, '2015-09-20 00:00:00', 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(636, 568, '2017-09-15 00:00:00', 4, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(637, 61, '2015-10-07 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(638, 63, '2016-09-05 00:00:00', 1, NULL),
(639, 192, '2016-01-11 00:00:00', 5, NULL),
(640, 388, '2016-03-10 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(641, 484, '2015-12-22 00:00:00', 4, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(642, 557, '2017-08-16 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(643, 526, '2016-09-12 00:00:00', 2, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(644, 37, '2016-08-01 00:00:00', 4, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(645, 388, '2017-07-21 00:00:00', 2, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(646, 484, '2015-10-19 00:00:00', 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(647, 499, '2015-10-31 00:00:00', 3, NULL),
(648, 114, '2017-06-04 00:00:00', 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(649, 63, '2016-04-23 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(650, 587, '2016-02-14 00:00:00', 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(651, 556, '2016-06-28 00:00:00', 3, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(652, 45, '2015-11-05 00:00:00', 5, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(653, 192, '2017-08-19 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(654, 401, '2017-03-22 00:00:00', 2, NULL),
(655, 386, '2015-10-09 00:00:00', 3, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(656, 401, '2016-09-05 00:00:00', 5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(657, 506, '2016-01-07 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(658, 375, '2015-11-09 00:00:00', 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(659, 25, '2016-09-01 00:00:00', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(660, 526, '2017-04-15 00:00:00', 5, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(661, 66, '2017-06-11 00:00:00', 5, NULL),
(662, 182, '2016-05-26 00:00:00', 2, NULL),
(663, 525, '2017-08-13 00:00:00', 2, NULL),
(664, 291, '2017-09-05 00:00:00', 5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(665, 101, '2016-10-17 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(666, 551, '2016-06-04 00:00:00', 1, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(667, 124, '2016-02-14 00:00:00', 2, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(668, 64, '2017-05-04 00:00:00', 4, NULL),
(669, 515, '2016-08-20 00:00:00', 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(670, 484, '2015-09-16 00:00:00', 1, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(671, 483, '2015-12-28 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(672, 577, '2017-04-03 00:00:00', 2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(673, 213, '2017-08-23 00:00:00', 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(674, 30, '2016-12-07 00:00:00', 4, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(675, 500, '2016-09-08 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(676, 588, '2016-12-11 00:00:00', 1, NULL),
(677, 80, '2016-04-17 00:00:00', 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(678, 586, '2016-01-24 00:00:00', 3, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(679, 103, '2015-12-27 00:00:00', 2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(680, 512, '2017-07-08 00:00:00', 2, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(681, 587, '2016-02-17 00:00:00', 1, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(682, 568, '2017-01-17 00:00:00', 1, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(683, 481, '2016-09-05 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(684, 47, '2016-11-08 00:00:00', 4, NULL),
(685, 348, '2016-02-07 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(686, 373, '2017-01-12 00:00:00', 3, NULL),
(687, 231, '2016-12-22 00:00:00', 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(688, 30, '2017-02-21 00:00:00', 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(689, 63, '2016-05-28 00:00:00', 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(690, 171, '2017-01-09 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(691, 484, '2017-08-03 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(692, 101, '2017-07-29 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(693, 589, '2016-01-29 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(694, 373, '2017-08-12 00:00:00', 3, NULL),
(695, 65, '2016-04-29 00:00:00', 1, NULL),
(696, 488, '2017-07-22 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(697, 596, '2016-09-23 00:00:00', 5, NULL),
(698, 586, '2016-04-18 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(699, 450, '2015-09-25 00:00:00', 5, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(700, 589, '2017-04-30 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(701, 300, '2016-08-13 00:00:00', 2, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(702, 103, '2017-02-23 00:00:00', 2, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(703, 339, '2016-12-21 00:00:00', 1, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(704, 36, '2016-12-11 00:00:00', 5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(705, 63, '2015-09-23 00:00:00', 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(706, 154, '2017-07-08 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(707, 509, '2016-10-29 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(708, 426, '2017-03-18 00:00:00', 3, NULL),
(709, 182, '2017-07-24 00:00:00', 3, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(710, 300, '2017-03-29 00:00:00', 3, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(711, 484, '2017-03-11 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(712, 58, '2016-06-30 00:00:00', 1, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(713, 79, '2015-12-04 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(714, 16, '2016-01-28 00:00:00', 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(715, 105, '2016-04-27 00:00:00', 5, NULL),
(716, 501, '2015-11-06 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(717, 573, '2016-09-06 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(718, 427, '2017-03-29 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(719, 294, '2016-04-25 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(720, 118, '2016-07-17 00:00:00', 2, NULL),
(721, 554, '2017-03-07 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(722, 192, '2017-03-08 00:00:00', 1, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(723, 443, '2015-12-29 00:00:00', 3, NULL),
(724, 507, '2015-10-26 00:00:00', 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(725, 39, '2016-11-03 00:00:00', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(726, 58, '2017-06-28 00:00:00', 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(727, 486, '2017-01-05 00:00:00', 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(728, 14, '2016-05-11 00:00:00', 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(729, 527, '2016-08-04 00:00:00', 5, NULL),
(730, 165, '2015-11-27 00:00:00', 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(731, 573, '2017-08-28 00:00:00', 1, NULL),
(732, 419, '2015-12-04 00:00:00', 3, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.');
INSERT INTO `Reviews` (`RatingID`, `PaintingID`, `ReviewDate`, `Rating`, `Comment`) VALUES
(733, 509, '2017-04-06 00:00:00', 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(734, 544, '2017-06-11 00:00:00', 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(735, 71, '2016-04-18 00:00:00', 4, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(736, 65, '2016-02-27 00:00:00', 3, NULL),
(737, 408, '2017-01-14 00:00:00', 1, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(738, 379, '2016-06-17 00:00:00', 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(739, 178, '2017-05-10 00:00:00', 5, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(740, 118, '2017-08-22 00:00:00', 1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(741, 596, '2017-02-21 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(742, 102, '2016-06-29 00:00:00', 1, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(743, 172, '2017-04-10 00:00:00', 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(744, 535, '2016-03-03 00:00:00', 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(745, 457, '2017-08-29 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(746, 425, '2017-07-20 00:00:00', 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(747, 57, '2017-05-27 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(748, 16, '2016-11-03 00:00:00', 1, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(749, 195, '2016-01-16 00:00:00', 2, NULL),
(750, 65, '2016-10-22 00:00:00', 3, NULL),
(751, 55, '2016-04-12 00:00:00', 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(752, 152, '2017-03-05 00:00:00', 4, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(753, 588, '2017-08-31 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(754, 518, '2017-07-10 00:00:00', 3, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(755, 103, '2017-06-11 00:00:00', 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(756, 456, '2016-12-15 00:00:00', 2, NULL),
(757, 36, '2015-12-03 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(758, 370, '2017-04-12 00:00:00', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(759, 548, '2016-08-08 00:00:00', 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(760, 66, '2016-01-17 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(761, 586, '2017-09-09 00:00:00', 2, NULL),
(762, 519, '2016-04-09 00:00:00', 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(763, 192, '2015-09-24 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(764, 124, '2016-04-23 00:00:00', 4, NULL),
(765, 51, '2015-11-24 00:00:00', 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(766, 348, '2016-05-07 00:00:00', 2, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(767, 488, '2017-04-24 00:00:00', 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(768, 589, '2016-07-23 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(769, 370, '2016-12-20 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(770, 408, '2017-09-03 00:00:00', 3, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(771, 60, '2017-08-15 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(772, 47, '2016-01-13 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(773, 399, '2016-04-06 00:00:00', 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(774, 498, '2016-10-12 00:00:00', 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(775, 573, '2015-11-09 00:00:00', 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(776, 48, '2017-02-09 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(777, 427, '2016-05-19 00:00:00', 5, NULL),
(778, 437, '2016-08-23 00:00:00', 4, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(779, 42, '2016-10-12 00:00:00', 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(780, 488, '2016-12-05 00:00:00', 2, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(781, 479, '2016-12-28 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(782, 489, '2017-01-12 00:00:00', 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(783, 179, '2016-10-14 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(784, 426, '2017-07-14 00:00:00', 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(785, 427, '2015-10-12 00:00:00', 3, NULL),
(786, 575, '2017-04-20 00:00:00', 1, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(787, 63, '2016-04-27 00:00:00', 1, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(788, 535, '2016-07-01 00:00:00', 1, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(789, 69, '2015-10-04 00:00:00', 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(790, 561, '2016-04-27 00:00:00', 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(791, 540, '2016-07-02 00:00:00', 1, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(792, 492, '2017-09-12 00:00:00', 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(793, 593, '2017-02-17 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(794, 114, '2017-02-26 00:00:00', 4, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(795, 47, '2015-12-13 00:00:00', 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(796, 587, '2015-10-06 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(797, 581, '2016-04-08 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(798, 431, '2017-04-08 00:00:00', 5, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(799, 477, '2017-08-19 00:00:00', 2, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(800, 564, '2017-04-21 00:00:00', 2, NULL),
(801, 422, '2016-01-30 00:00:00', 1, NULL),
(802, 310, '2016-02-12 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(803, 574, '2016-07-13 00:00:00', 4, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(804, 425, '2016-06-19 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(805, 300, '2016-03-03 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(806, 162, '2016-12-23 00:00:00', 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(807, 482, '2017-08-12 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(808, 48, '2016-10-17 00:00:00', 1, NULL),
(809, 546, '2017-02-25 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(810, 291, '2016-03-29 00:00:00', 2, NULL),
(811, 426, '2017-01-14 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(812, 554, '2017-04-03 00:00:00', 2, NULL),
(813, 235, '2016-01-14 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(814, 374, '2017-03-19 00:00:00', 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(815, 63, '2016-12-13 00:00:00', 5, NULL),
(816, 498, '2016-05-21 00:00:00', 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(817, 483, '2015-12-09 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(818, 60, '2016-07-07 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(819, 594, '2017-03-03 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(820, 545, '2017-05-03 00:00:00', 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(821, 498, '2015-11-09 00:00:00', 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(822, 459, '2016-06-29 00:00:00', 5, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(823, 430, '2016-12-29 00:00:00', 1, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(824, 506, '2017-07-11 00:00:00', 3, NULL),
(825, 549, '2017-03-08 00:00:00', 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(826, 58, '2017-01-01 00:00:00', 5, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(827, 588, '2017-04-04 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(828, 45, '2016-04-27 00:00:00', 2, NULL),
(829, 513, '2017-08-26 00:00:00', 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(830, 500, '2016-03-28 00:00:00', 4, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(831, 105, '2015-10-25 00:00:00', 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(832, 392, '2017-06-06 00:00:00', 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(833, 468, '2016-09-15 00:00:00', 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(834, 366, '2016-08-08 00:00:00', 5, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(835, 393, '2016-09-17 00:00:00', 4, NULL),
(836, 65, '2017-08-13 00:00:00', 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(837, 58, '2016-05-25 00:00:00', 2, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(838, 118, '2017-05-31 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(839, 448, '2016-09-20 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(840, 448, '2015-10-08 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(841, 392, '2016-03-26 00:00:00', 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(842, 118, '2017-06-05 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(843, 477, '2016-05-01 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(844, 405, '2017-08-22 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(845, 509, '2017-05-27 00:00:00', 1, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(846, 294, '2017-07-24 00:00:00', 1, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(847, 467, '2017-06-07 00:00:00', 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(848, 388, '2015-11-20 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(849, 124, '2016-03-03 00:00:00', 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(850, 598, '2017-07-30 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(851, 399, '2015-11-21 00:00:00', 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(852, 504, '2016-09-02 00:00:00', 4, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(853, 369, '2016-10-24 00:00:00', 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(854, 377, '2016-12-21 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(855, 399, '2017-06-28 00:00:00', 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(856, 419, '2016-09-01 00:00:00', 5, NULL),
(857, 153, '2017-03-03 00:00:00', 4, NULL),
(858, 483, '2016-04-09 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(859, 587, '2017-08-16 00:00:00', 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(860, 300, '2015-12-15 00:00:00', 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(861, 67, '2016-05-31 00:00:00', 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(862, 36, '2017-07-14 00:00:00', 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(863, 296, '2016-04-22 00:00:00', 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(864, 380, '2016-09-23 00:00:00', 3, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(865, 498, '2016-07-17 00:00:00', 3, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(866, 333, '2016-02-10 00:00:00', 5, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(867, 258, '2016-02-04 00:00:00', 1, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(868, 445, '2016-08-18 00:00:00', 5, NULL),
(869, 543, '2016-03-28 00:00:00', 1, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(870, 65, '2017-08-05 00:00:00', 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(871, 419, '2017-07-06 00:00:00', 2, NULL),
(872, 498, '2016-07-05 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(873, 442, '2016-11-28 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(874, 466, '2015-11-25 00:00:00', 2, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(875, 381, '2017-06-01 00:00:00', 3, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(876, 401, '2016-12-12 00:00:00', 2, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(877, 425, '2017-04-13 00:00:00', 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(878, 495, '2015-11-12 00:00:00', 2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(879, 388, '2017-02-16 00:00:00', 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(880, 577, '2015-09-23 00:00:00', 3, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(881, 63, '2016-09-27 00:00:00', 2, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(882, 592, '2017-03-16 00:00:00', 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(883, 589, '2017-09-04 00:00:00', 4, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(884, 124, '2016-12-22 00:00:00', 5, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(885, 408, '2016-12-01 00:00:00', 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(886, 352, '2015-12-09 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(887, 230, '2016-05-13 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(888, 66, '2017-04-08 00:00:00', 2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(889, 425, '2016-01-21 00:00:00', 3, NULL),
(890, 542, '2017-02-05 00:00:00', 2, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(891, 569, '2016-04-02 00:00:00', 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(892, 61, '2016-02-27 00:00:00', 3, NULL),
(893, 301, '2017-09-07 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(894, 60, '2016-09-11 00:00:00', 2, NULL),
(895, 505, '2017-05-04 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(896, 386, '2016-04-13 00:00:00', 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(897, 574, '2017-03-11 00:00:00', 5, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(898, 550, '2017-04-12 00:00:00', 2, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(899, 409, '2016-11-08 00:00:00', 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(900, 172, '2016-04-26 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(901, 58, '2016-10-04 00:00:00', 4, NULL),
(902, 515, '2016-04-12 00:00:00', 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(903, 80, '2017-01-23 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(904, 192, '2017-03-17 00:00:00', 1, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(905, 54, '2016-07-01 00:00:00', 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(906, 504, '2017-01-19 00:00:00', 3, NULL),
(907, 333, '2015-10-07 00:00:00', 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(908, 334, '2016-04-25 00:00:00', 5, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(909, 467, '2015-09-27 00:00:00', 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(910, 394, '2016-08-27 00:00:00', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(911, 496, '2017-03-31 00:00:00', 3, NULL),
(912, 537, '2017-01-12 00:00:00', 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(913, 545, '2016-07-01 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(914, 334, '2016-07-25 00:00:00', 5, NULL),
(915, 519, '2016-05-04 00:00:00', 5, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(916, 343, '2016-04-03 00:00:00', 5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(917, 378, '2017-03-14 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(918, 392, '2016-04-02 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(919, 388, '2016-05-10 00:00:00', 4, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(920, 522, '2016-10-21 00:00:00', 5, NULL),
(921, 556, '2017-01-06 00:00:00', 1, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(922, 30, '2016-07-15 00:00:00', 2, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(923, 442, '2017-08-08 00:00:00', 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(924, 499, '2017-01-17 00:00:00', 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(925, 173, '2017-02-09 00:00:00', 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(926, 425, '2016-10-28 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(927, 565, '2017-03-16 00:00:00', 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(928, 570, '2016-11-07 00:00:00', 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(929, 482, '2016-11-07 00:00:00', 4, NULL),
(930, 588, '2017-06-02 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(931, 393, '2015-12-13 00:00:00', 3, NULL),
(932, 366, '2016-01-11 00:00:00', 5, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(933, 483, '2016-04-04 00:00:00', 4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(934, 301, '2016-09-01 00:00:00', 4, NULL),
(935, 30, '2016-09-15 00:00:00', 5, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(936, 483, '2017-07-05 00:00:00', 5, NULL),
(937, 343, '2015-09-21 00:00:00', 3, NULL),
(938, 392, '2016-08-20 00:00:00', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(939, 422, '2017-04-13 00:00:00', 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(940, 548, '2017-03-16 00:00:00', 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(941, 467, '2017-06-18 00:00:00', 5, NULL),
(942, 546, '2017-04-07 00:00:00', 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(943, 428, '2016-04-19 00:00:00', 3, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(944, 450, '2017-06-09 00:00:00', 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(945, 142, '2017-06-15 00:00:00', 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(946, 482, '2017-02-21 00:00:00', 3, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(947, 467, '2016-08-13 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(948, 540, '2016-07-06 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(949, 502, '2017-08-27 00:00:00', 5, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(950, 528, '2015-12-16 00:00:00', 5, NULL),
(951, 462, '2016-12-09 00:00:00', 2, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(952, 55, '2016-04-22 00:00:00', 3, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(953, 192, '2016-02-07 00:00:00', 1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(954, 425, '2016-05-02 00:00:00', 3, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(955, 564, '2017-01-19 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(956, 488, '2016-01-13 00:00:00', 3, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(957, 35, '2016-04-26 00:00:00', 1, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(958, 552, '2016-02-13 00:00:00', 1, NULL),
(959, 590, '2017-08-15 00:00:00', 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(960, 527, '2016-02-07 00:00:00', 4, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(961, 389, '2017-07-27 00:00:00', 3, NULL),
(962, 585, '2015-12-26 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(963, 549, '2016-01-03 00:00:00', 5, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(964, 573, '2016-12-07 00:00:00', 4, NULL),
(965, 48, '2016-07-13 00:00:00', 1, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(966, 352, '2016-04-13 00:00:00', 1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(967, 71, '2016-03-24 00:00:00', 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(968, 231, '2017-07-02 00:00:00', 3, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(969, 426, '2017-03-24 00:00:00', 4, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(970, 515, '2016-11-21 00:00:00', 5, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(971, 152, '2016-01-27 00:00:00', 4, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(972, 549, '2016-10-19 00:00:00', 4, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(973, 392, '2017-02-26 00:00:00', 4, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(974, 564, '2016-04-03 00:00:00', 1, NULL),
(975, 508, '2016-02-15 00:00:00', 5, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(976, 576, '2017-02-03 00:00:00', 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(977, 427, '2016-05-10 00:00:00', 5, NULL),
(978, 587, '2017-02-15 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(979, 529, '2016-04-19 00:00:00', 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(980, 39, '2017-07-31 00:00:00', 4, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(981, 30, '2017-05-31 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(982, 63, '2017-04-21 00:00:00', 4, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(983, 31, '2016-09-29 00:00:00', 1, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(984, 451, '2016-02-27 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(985, 586, '2017-08-09 00:00:00', 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(986, 145, '2016-07-31 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(987, 525, '2016-02-28 00:00:00', 5, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(988, 486, '2015-10-31 00:00:00', 5, NULL),
(989, 349, '2016-01-03 00:00:00', 1, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(990, 5, '2016-12-05 00:00:00', 1, NULL),
(991, 165, '2017-01-10 00:00:00', 1, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(992, 547, '2016-06-30 00:00:00', 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(993, 484, '2017-04-13 00:00:00', 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(994, 486, '2017-07-31 00:00:00', 4, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(995, 504, '2017-04-07 00:00:00', 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(996, 522, '2016-10-20 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(997, 579, '2017-01-23 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(998, 530, '2016-05-18 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(999, 425, '2016-10-31 00:00:00', 4, NULL),
(1000, 172, '2017-03-19 00:00:00', 5, NULL),
(1001, 574, '2016-11-09 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(1002, 25, '2016-12-05 00:00:00', 4, NULL),
(1003, 486, '2017-07-01 00:00:00', 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(1004, 497, '2016-05-03 00:00:00', 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(1005, 439, '2016-08-19 00:00:00', 1, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1006, 67, '2016-06-10 00:00:00', 3, NULL),
(1007, 30, '2017-03-23 00:00:00', 3, NULL),
(1008, 63, '2016-02-01 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1009, 484, '2015-12-06 00:00:00', 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(1010, 54, '2016-12-26 00:00:00', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1011, 408, '2016-08-31 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(1012, 191, '2015-10-13 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(1013, 58, '2017-01-26 00:00:00', 2, NULL),
(1014, 542, '2016-11-28 00:00:00', 5, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(1015, 527, '2017-09-05 00:00:00', 1, NULL),
(1016, 63, '2017-03-09 00:00:00', 5, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1017, 588, '2016-01-03 00:00:00', 5, NULL),
(1018, 352, '2016-11-18 00:00:00', 4, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(1019, 468, '2017-06-09 00:00:00', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(1020, 65, '2016-11-11 00:00:00', 5, NULL),
(1021, 468, '2015-09-24 00:00:00', 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(1022, 195, '2015-10-12 00:00:00', 3, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(1023, 542, '2017-04-24 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(1024, 79, '2016-08-15 00:00:00', 4, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(1025, 25, '2017-05-10 00:00:00', 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(1026, 501, '2017-03-13 00:00:00', 4, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(1027, 60, '2016-06-06 00:00:00', 2, NULL),
(1028, 60, '2016-11-22 00:00:00', 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(1029, 587, '2015-09-29 00:00:00', 1, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(1030, 333, '2015-12-18 00:00:00', 1, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1031, 192, '2016-12-11 00:00:00', 5, NULL),
(1032, 536, '2016-05-12 00:00:00', 2, NULL),
(1033, 540, '2015-10-22 00:00:00', 3, NULL),
(1034, 532, '2016-02-08 00:00:00', 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(1035, 486, '2016-05-03 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(1036, 291, '2016-01-22 00:00:00', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(1037, 552, '2016-06-16 00:00:00', 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1038, 58, '2017-03-04 00:00:00', 2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(1039, 599, '2016-05-17 00:00:00', 5, NULL),
(1040, 77, '2017-03-23 00:00:00', 5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(1041, 173, '2016-10-07 00:00:00', 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(1042, 49, '2015-12-10 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1043, 483, '2016-04-29 00:00:00', 1, NULL),
(1044, 154, '2015-10-27 00:00:00', 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(1045, 388, '2017-05-01 00:00:00', 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(1046, 39, '2017-02-09 00:00:00', 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1047, 102, '2016-08-07 00:00:00', 2, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(1048, 548, '2016-08-11 00:00:00', 1, NULL),
(1049, 554, '2017-06-09 00:00:00', 2, NULL),
(1050, 342, '2017-04-14 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1051, 574, '2016-01-23 00:00:00', 2, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(1052, 349, '2016-07-18 00:00:00', 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(1053, 30, '2017-01-16 00:00:00', 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(1054, 593, '2015-11-07 00:00:00', 1, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(1055, 516, '2016-09-26 00:00:00', 5, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(1056, 579, '2016-11-02 00:00:00', 4, NULL),
(1057, 172, '2017-01-22 00:00:00', 5, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(1058, 405, '2016-09-30 00:00:00', 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(1059, 194, '2016-07-22 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1060, 571, '2016-10-03 00:00:00', 2, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(1061, 518, '2015-10-26 00:00:00', 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(1062, 520, '2017-07-07 00:00:00', 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(1063, 432, '2016-12-21 00:00:00', 3, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(1064, 103, '2017-05-11 00:00:00', 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(1065, 351, '2016-01-14 00:00:00', 1, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(1066, 504, '2015-12-15 00:00:00', 1, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(1067, 380, '2017-06-15 00:00:00', 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(1068, 173, '2016-06-17 00:00:00', 5, NULL),
(1069, 71, '2016-04-06 00:00:00', 3, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(1070, 426, '2015-11-05 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1071, 442, '2017-08-08 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1072, 569, '2016-06-22 00:00:00', 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(1073, 190, '2016-12-28 00:00:00', 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1074, 352, '2017-01-10 00:00:00', 4, NULL),
(1075, 472, '2017-04-08 00:00:00', 4, NULL),
(1076, 39, '2017-06-26 00:00:00', 5, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(1077, 366, '2017-06-29 00:00:00', 1, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(1078, 561, '2017-08-30 00:00:00', 1, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(1079, 589, '2016-10-06 00:00:00', 4, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(1080, 15, '2017-05-08 00:00:00', 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(1081, 376, '2016-07-12 00:00:00', 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(1082, 573, '2016-11-30 00:00:00', 1, NULL),
(1083, 259, '2016-03-16 00:00:00', 2, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(1084, 348, '2017-01-24 00:00:00', 1, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(1085, 392, '2017-04-07 00:00:00', 1, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(1086, 500, '2017-02-23 00:00:00', 4, NULL),
(1087, 408, '2016-06-05 00:00:00', 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(1088, 333, '2016-07-24 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(1089, 501, '2016-02-29 00:00:00', 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(1090, 192, '2016-12-07 00:00:00', 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(1091, 425, '2017-09-06 00:00:00', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(1092, 568, '2017-07-11 00:00:00', 4, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(1093, 492, '2016-01-02 00:00:00', 1, NULL),
(1094, 482, '2016-02-07 00:00:00', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1095, 583, '2017-08-30 00:00:00', 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(1096, 339, '2016-10-04 00:00:00', 4, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1097, 558, '2017-08-25 00:00:00', 3, 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(1098, 535, '2016-12-25 00:00:00', 2, NULL);
INSERT INTO `Reviews` (`RatingID`, `PaintingID`, `ReviewDate`, `Rating`, `Comment`) VALUES
(1099, 373, '2017-01-06 00:00:00', 5, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(1100, 597, '2017-03-05 00:00:00', 2, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(1101, 56, '2017-07-16 00:00:00', 4, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1102, 590, '2016-09-19 00:00:00', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(1103, 388, '2017-08-18 00:00:00', 4, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(1104, 427, '2017-06-06 00:00:00', 4, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(1105, 78, '2016-12-20 00:00:00', 3, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(1106, 490, '2016-04-24 00:00:00', 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(1107, 30, '2016-08-31 00:00:00', 1, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(1108, 25, '2017-01-23 00:00:00', 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(1109, 393, '2015-11-20 00:00:00', 4, NULL),
(1110, 103, '2015-11-08 00:00:00', 2, NULL),
(1111, 178, '2016-02-09 00:00:00', 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(1112, 588, '2017-02-14 00:00:00', 2, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(1113, 422, '2016-04-26 00:00:00', 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(1114, 581, '2015-11-24 00:00:00', 4, NULL),
(1115, 408, '2016-05-03 00:00:00', 1, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1116, 45, '2017-01-25 00:00:00', 2, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(1117, 65, '2016-06-20 00:00:00', 1, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(1118, 154, '2017-06-09 00:00:00', 4, NULL),
(1119, 408, '2017-05-31 00:00:00', 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1120, 501, '2016-02-26 00:00:00', 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(1121, 46, '2015-11-10 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1122, 41, '2015-10-04 00:00:00', 2, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(1123, 35, '2017-01-21 00:00:00', 2, NULL),
(1124, 425, '2017-03-25 00:00:00', 3, NULL),
(1125, 529, '2016-03-25 00:00:00', 2, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(1126, 554, '2016-09-17 00:00:00', 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(1127, 39, '2017-08-30 00:00:00', 1, NULL),
(1128, 461, '2016-09-19 00:00:00', 2, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(1129, 579, '2017-05-21 00:00:00', 2, NULL),
(1130, 595, '2017-03-15 00:00:00', 1, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(1131, 519, '2016-12-11 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1132, 14, '2016-03-08 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1133, 213, '2016-06-03 00:00:00', 5, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(1134, 348, '2016-08-14 00:00:00', 3, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(1135, 509, '2015-12-19 00:00:00', 1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(1136, 486, '2017-07-28 00:00:00', 4, NULL),
(1137, 294, '2016-10-09 00:00:00', 2, NULL),
(1138, 52, '2017-05-13 00:00:00', 4, NULL),
(1139, 565, '2016-12-19 00:00:00', 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(1140, 124, '2017-08-03 00:00:00', 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(1141, 153, '2015-12-23 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(1142, 535, '2016-09-24 00:00:00', 4, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(1143, 333, '2016-03-20 00:00:00', 5, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1144, 46, '2016-06-15 00:00:00', 3, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(1145, 501, '2016-03-20 00:00:00', 3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1146, 172, '2016-04-11 00:00:00', 3, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(1147, 588, '2016-10-01 00:00:00', 1, NULL),
(1148, 25, '2016-12-07 00:00:00', 3, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1149, 592, '2017-04-18 00:00:00', 2, NULL),
(1150, 45, '2017-04-11 00:00:00', 3, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(1151, 580, '2017-06-14 00:00:00', 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(1152, 288, '2015-12-03 00:00:00', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(1153, 30, '2016-08-09 00:00:00', 2, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(1154, 428, '2016-06-08 00:00:00', 3, NULL),
(1155, 445, '2017-08-09 00:00:00', 5, NULL),
(1156, 590, '2017-08-20 00:00:00', 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1157, 483, '2017-08-10 00:00:00', 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(1158, 557, '2015-12-10 00:00:00', 5, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(1159, 401, '2016-01-23 00:00:00', 1, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(1160, 573, '2016-04-14 00:00:00', 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(1161, 467, '2015-10-03 00:00:00', 1, NULL),
(1162, 424, '2016-03-29 00:00:00', 2, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(1163, 11, '2016-06-07 00:00:00', 5, NULL),
(1164, 536, '2016-03-08 00:00:00', 4, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(1165, 469, '2016-07-30 00:00:00', 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(1166, 533, '2015-09-20 00:00:00', 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(1167, 16, '2017-07-04 00:00:00', 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(1168, 192, '2017-05-14 00:00:00', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1169, 35, '2016-03-24 00:00:00', 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(1170, 587, '2015-12-19 00:00:00', 2, NULL),
(1171, 424, '2016-09-29 00:00:00', 1, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(1172, 392, '2017-09-12 00:00:00', 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(1173, 11, '2015-12-15 00:00:00', 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(1174, 83, '2015-12-26 00:00:00', 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(1175, 533, '2017-01-28 00:00:00', 1, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(1176, 477, '2016-08-30 00:00:00', 5, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(1177, 392, '2017-02-13 00:00:00', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1178, 588, '2015-12-07 00:00:00', 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(1179, 399, '2015-11-07 00:00:00', 2, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(1180, 140, '2015-11-29 00:00:00', 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(1181, 157, '2015-11-10 00:00:00', 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(1182, 334, '2017-06-25 00:00:00', 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(1183, 445, '2016-01-03 00:00:00', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(1184, 47, '2017-07-05 00:00:00', 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(1185, 39, '2016-07-22 00:00:00', 3, NULL),
(1186, 79, '2016-10-07 00:00:00', 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(1187, 497, '2015-11-21 00:00:00', 3, NULL),
(1188, 597, '2016-07-31 00:00:00', 4, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(1189, 69, '2017-02-15 00:00:00', 5, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(1190, 392, '2017-01-13 00:00:00', 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(1191, 172, '2016-01-01 00:00:00', 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(1192, 182, '2016-10-30 00:00:00', 3, NULL),
(1193, 296, '2016-11-27 00:00:00', 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(1194, 119, '2016-04-06 00:00:00', 3, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(1195, 583, '2015-10-05 00:00:00', 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(1196, 430, '2016-10-02 00:00:00', 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(1197, 527, '2016-09-21 00:00:00', 3, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(1198, 556, '2017-05-07 00:00:00', 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(1199, 475, '2016-10-24 00:00:00', 2, NULL),
(1200, 588, '2017-01-14 00:00:00', 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');

-- --------------------------------------------------------

--
-- Table structure for table `screenwriter`
--

CREATE TABLE `screenwriter` (
  `screenwriter_id` tinyint(4) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table of screenwriters who have written movie(s) in database';

--
-- Dumping data for table `screenwriter`
--

INSERT INTO `screenwriter` (`screenwriter_id`, `first_name`, `last_name`, `created`) VALUES
(1, 'Rian', 'Johnson', '2018-03-20 22:30:08'),
(2, 'Terence', 'Winter', '2018-03-20 22:30:50'),
(3, 'Joss', 'Whedon', '2018-03-20 22:31:48'),
(4, 'Zak', 'Penn', '2018-03-20 22:32:06'),
(5, 'Christopher', 'Winter', '2018-03-20 22:34:07'),
(6, 'Eric', 'Pearson', '2018-03-20 22:34:50'),
(7, 'Craig', 'Kyle', '2018-03-20 22:35:07'),
(8, 'Diablo', 'Cody', '2018-03-20 22:39:25'),
(9, 'James', 'Cameron', '2018-03-20 22:47:54'),
(10, 'Mark', ' L. Smith', '2018-03-20 22:50:59'),
(11, ' Baz', 'Luhrmann', '2018-03-20 22:56:29'),
(12, 'Craig', 'Pearce', '2018-03-20 22:56:36'),
(13, 'Quentin', ' Tarantino', '2018-03-20 23:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `Shapes`
--

CREATE TABLE `Shapes` (
  `ShapeID` int(11) NOT NULL,
  `ShapeName` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Shapes`
--

INSERT INTO `Shapes` (`ShapeID`, `ShapeName`) VALUES
(1, 'Portrait'),
(2, 'Landscape'),
(3, 'Square'),
(4, 'Panoramic'),
(5, 'Slim');

-- --------------------------------------------------------

--
-- Table structure for table `Subjects`
--

CREATE TABLE `Subjects` (
  `SubjectID` int(11) NOT NULL,
  `SubjectName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Subjects`
--

INSERT INTO `Subjects` (`SubjectID`, `SubjectName`) VALUES
(1, 'Animals'),
(2, 'Landscape'),
(3, 'Music'),
(4, 'Sports'),
(5, 'Abstract'),
(6, 'Transportation'),
(7, 'Architecture'),
(9, 'Religion'),
(10, 'Still Life'),
(11, 'People'),
(12, 'Botanical'),
(13, 'Cuisine'),
(14, 'History'),
(15, 'Love'),
(16, 'Family'),
(17, 'Performing Arts'),
(18, 'Allegory'),
(19, 'Mythological'),
(20, 'Power'),
(21, 'Military'),
(22, 'Abstract');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` tinyint(4) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table of users who can write reviews for movies';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `first_name`, `last_name`, `created`, `birth_date`) VALUES
(1, 'pTravy', 'Peter', 'Travers', '2018-03-29 21:23:43', '1998-02-28'),
(2, 'movielover', 'Bina', 'Smith', '2018-03-29 21:24:15', '1965-05-07'),
(3, 'blueSky', 'Alexandra', 'Dragonmir', '2018-03-29 21:24:07', '1999-03-14'),
(4, 'gotem', 'Artem', 'Dianne', '2018-03-29 21:24:28', '1970-06-23'),
(5, 'filmpas', 'William', 'Barnes', '2018-03-29 21:26:00', '1996-03-29');

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
(12, 'jaiga99', '$2y$10$FfY0beoYkDwTUI4Yx7aZBOcwIX8vsKeGTn3reaQI86bRC250O0Asu', '2019-03-31 04:47:30', 'idunwona@gmail.com'),
(13, 'bingingwithbaggins', '$2y$10$xr5RZ9cFTRjSavVIlH7c5OEboEwjQkKZEvvDMhAf2hKDpHLtJv1CG', '2019-03-31 04:47:44', 'kilef@gmail.com'),
(22, 'thepresident', '$2y$10$lQLFzUxHxEAJf/2YAg4OZuAq0i8.tac5muyHFRIC1YWIFnRYVqeLm', '2019-03-31 04:53:57', 'helslo@gmail.com'),
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
(54, 'Janice', '$2y$10$oiVHIlm2FiDFYw93hIO.7e1l2uurZXoGVg1jV0ObFC.DljsttvtU6', '2019-04-10 04:38:47', 'Janice@hotmail.com'),
(55, 'Test', '$2y$10$jqAXiPQ8tCSVQdsV0Pl6teChV0vFcUhvgB2DzNzbXoidJ7Lo1/D9W', '2019-04-10 05:49:53', '1@hotmail.com'),
(56, 'ZarqaMac', '$2y$10$uo6em7iPMx/2TPQyUyV0/es5snFfp4yfjprxVZ8NoY1JiIzX9jprS', '2019-04-10 21:42:56', 'ZarqaMac@hotmail.com'),
(57, 'MacDonald', '$2y$10$rQsgLGkRsSRjrwULbMfLIOaarCsYr8FklvzngvzIqfP7lV6cIHwGS', '2019-04-10 21:45:00', 'MacDonald@live.com'),
(58, 'K', '$2y$10$P1XjbC6/GsFWdupecHjdsuAzTPSJdP/dcs9E3lptpX9J2RNn0tvhS', '2019-04-10 22:33:33', 'k@hotmail.com'),
(59, 'wW', '$2y$10$R37m70N2/25HW2P2YB1ShOEwhIgFdbPgJmeRpE6AmcTRAhOXfuPnW', '2019-04-10 22:35:34', 'km@gmail.com'),
(60, 'KnowledgeMaster', '$2y$10$TmovryDoxcnCyg2xpXr8DuM6osXO./ht/NjxbMmndaBnq0exa.njC', '2019-04-10 22:38:39', 'kmm@gmail.com'),
(61, 'JelloMan', '$2y$10$bNb09ihQGxAleC5/Vj6i/ey8hveFCXMhysw3ds3o/GdYYejEG.YEe', '2019-04-10 23:07:07', 'jm@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_all_movies`
-- (See below for the actual view)
--
CREATE TABLE `v_all_movies` (
`movie_title` varchar(128)
,`movie_year` year(4)
,`movie_desc` text
,`genre_type` varchar(128)
,`m_desc` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_movie_actors`
-- (See below for the actual view)
--
CREATE TABLE `v_movie_actors` (
`movie_title` varchar(128)
,`first_name` varchar(128)
,`last_name` varchar(128)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_movie_genre`
-- (See below for the actual view)
--
CREATE TABLE `v_movie_genre` (
`movie_title` varchar(128)
,`genre_type` varchar(128)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_movie_ratings`
-- (See below for the actual view)
--
CREATE TABLE `v_movie_ratings` (
`Title` varchar(128)
,`movie_year` year(4)
,`run_time` time
,`Rating` decimal(3,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_movie_type`
-- (See below for the actual view)
--
CREATE TABLE `v_movie_type` (
`movie_title` varchar(128)
,`m_desc` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `v_all_movies`
--
DROP TABLE IF EXISTS `v_all_movies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wong2580`@`%` SQL SECURITY DEFINER VIEW `v_all_movies`  AS  select `m`.`movie_title` AS `movie_title`,`m`.`movie_year` AS `movie_year`,`m`.`movie_desc` AS `movie_desc`,`g`.`genre_type` AS `genre_type`,`mt`.`m_desc` AS `m_desc` from (((`movie` `m` join `genre` `g`) join `movie_genre` `mg`) join `movie_type` `mt` on((`m`.`movie_id` = `mg`.`movie_id`))) where ((`mg`.`genre_id` = `g`.`genre_id`) and (`m`.`m_type_id` = `mt`.`m_type_id`)) order by `m`.`movie_title` ;

-- --------------------------------------------------------

--
-- Structure for view `v_movie_actors`
--
DROP TABLE IF EXISTS `v_movie_actors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wong2580`@`%` SQL SECURITY DEFINER VIEW `v_movie_actors`  AS  select `m`.`movie_title` AS `movie_title`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name` from ((`movie` `m` join `actor` `a`) join `movie_actor` `ma` on(((`m`.`movie_id` = `ma`.`movie_id`) and (`a`.`actor_id` = `ma`.`actor_id`)))) order by `m`.`movie_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_movie_genre`
--
DROP TABLE IF EXISTS `v_movie_genre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wong2580`@`%` SQL SECURITY DEFINER VIEW `v_movie_genre`  AS  select `m`.`movie_title` AS `movie_title`,`g`.`genre_type` AS `genre_type` from ((`movie` `m` join `movie_genre` `mg`) join `genre` `g` on(((`m`.`movie_id` = `mg`.`movie_id`) and (`mg`.`genre_id` = `g`.`genre_id`)))) order by `m`.`movie_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_movie_ratings`
--
DROP TABLE IF EXISTS `v_movie_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wong2580`@`%` SQL SECURITY DEFINER VIEW `v_movie_ratings`  AS  select `m`.`movie_title` AS `Title`,`m`.`movie_year` AS `movie_year`,`m`.`run_time` AS `run_time`,`r`.`rating` AS `Rating` from (`movie` `m` join `movie_review` `r` on((`m`.`movie_id` = `r`.`movie_id`))) group by `r`.`movie_id` order by `m`.`movie_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_movie_type`
--
DROP TABLE IF EXISTS `v_movie_type`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wong2580`@`%` SQL SECURITY DEFINER VIEW `v_movie_type`  AS  select `m`.`movie_title` AS `movie_title`,`mt`.`m_desc` AS `m_desc` from (`movie` `m` join `movie_type` `mt` on((`m`.`m_type_id` = `mt`.`m_type_id`))) order by `m`.`movie_title` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`);
ALTER TABLE `actor` ADD FULLTEXT KEY `first_name_last_name` (`first_name`,`last_name`);

--
-- Indexes for table `Artists`
--
ALTER TABLE `Artists`
  ADD PRIMARY KEY (`ArtistID`),
  ADD KEY `ArtistID` (`ArtistID`),
  ADD KEY `LastName` (`LastName`);

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
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `Galleries`
--
ALTER TABLE `Galleries`
  ADD PRIMARY KEY (`GalleryID`),
  ADD KEY `GalleryID` (`GalleryID`),
  ADD KEY `GooglePlaceID` (`GooglePlaceID`),
  ADD KEY `FlickrPlaceID` (`FlickrPlaceID`),
  ADD KEY `YahooWoeID` (`YahooWoeID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`GenreID`),
  ADD UNIQUE KEY `GenreName` (`GenreName`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `FK_movie_type_id` (`m_type_id`);

--
-- Indexes for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `FK_movie_actor` (`actor_id`,`movie_id`);

--
-- Indexes for table `movie_director`
--
ALTER TABLE `movie_director`
  ADD PRIMARY KEY (`movie_id`,`director_id`),
  ADD KEY `FK_movie_director` (`director_id`,`movie_id`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`genre_id`,`movie_id`),
  ADD KEY `FK_movie_genre` (`movie_id`,`genre_id`);

--
-- Indexes for table `movie_review`
--
ALTER TABLE `movie_review`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `FK_review_movie_id` (`movie_id`),
  ADD KEY `FK_user_id` (`user_id`);

--
-- Indexes for table `movie_screenwriter`
--
ALTER TABLE `movie_screenwriter`
  ADD PRIMARY KEY (`screenwriter_id`,`movie_id`),
  ADD KEY `FK_movie_screenwriter` (`movie_id`,`screenwriter_id`);

--
-- Indexes for table `movie_type`
--
ALTER TABLE `movie_type`
  ADD PRIMARY KEY (`m_type_id`),
  ADD UNIQUE KEY `INDEX_m_desc` (`m_desc`);

--
-- Indexes for table `PaintingGenres`
--
ALTER TABLE `PaintingGenres`
  ADD PRIMARY KEY (`PaintingGenreID`),
  ADD KEY `GenreID` (`GenreID`),
  ADD KEY `PaintingID` (`PaintingID`),
  ADD KEY `PaintingGenreID` (`PaintingGenreID`);

--
-- Indexes for table `Paintings`
--
ALTER TABLE `Paintings`
  ADD PRIMARY KEY (`PaintingID`),
  ADD UNIQUE KEY `ImageFileName` (`ImageFileName`),
  ADD KEY `ArtistID` (`ArtistID`),
  ADD KEY `GalleryID` (`GalleryID`),
  ADD KEY `ShapeID` (`ShapeID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `PaintingID` (`PaintingID`);

--
-- Indexes for table `PaintingSubjects`
--
ALTER TABLE `PaintingSubjects`
  ADD PRIMARY KEY (`PaintingSubjectID`),
  ADD KEY `PaintingID` (`PaintingID`),
  ADD KEY `SubjectID` (`SubjectID`);

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
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `PaintingID` (`PaintingID`);

--
-- Indexes for table `screenwriter`
--
ALTER TABLE `screenwriter`
  ADD PRIMARY KEY (`screenwriter_id`);

--
-- Indexes for table `Shapes`
--
ALTER TABLE `Shapes`
  ADD PRIMARY KEY (`ShapeID`);

--
-- Indexes for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `index_name` (`last_name`,`first_name`);

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
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `actor_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Artists`
--
ALTER TABLE `Artists`
  MODIFY `ArtistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `director_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Galleries`
--
ALTER TABLE `Galleries`
  MODIFY `GalleryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `GenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `movie_review`
--
ALTER TABLE `movie_review`
  MODIFY `r_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `PaintingGenres`
--
ALTER TABLE `PaintingGenres`
  MODIFY `PaintingGenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT for table `Paintings`
--
ALTER TABLE `Paintings`
  MODIFY `PaintingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600;

--
-- AUTO_INCREMENT for table `PaintingSubjects`
--
ALTER TABLE `PaintingSubjects`
  MODIFY `PaintingSubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `Rank`
--
ALTER TABLE `Rank`
  MODIFY `RankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- AUTO_INCREMENT for table `screenwriter`
--
ALTER TABLE `screenwriter`
  MODIFY `screenwriter_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Shapes`
--
ALTER TABLE `Shapes`
  MODIFY `ShapeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Subjects`
--
ALTER TABLE `Subjects`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`) ON DELETE CASCADE;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_movie_type_id` FOREIGN KEY (`m_type_id`) REFERENCES `movie_type` (`m_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `FK_movie_actor_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`),
  ADD CONSTRAINT `FK_movie_actor_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `movie_director`
--
ALTER TABLE `movie_director`
  ADD CONSTRAINT `FK_movie_director_director_id` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_movie_director_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_review`
--
ALTER TABLE `movie_review`
  ADD CONSTRAINT `FK_review_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_screenwriter`
--
ALTER TABLE `movie_screenwriter`
  ADD CONSTRAINT `FK_movie_screenwriter_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_movie_screenwriter_screenwriter_id` FOREIGN KEY (`screenwriter_id`) REFERENCES `screenwriter` (`screenwriter_id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `rank_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `Post` (`PostID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
