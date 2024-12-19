-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

-- Listage de la structure de table cinema. acteurice
CREATE TABLE IF NOT EXISTS `acteurice` (
  `idActeurice` int NOT NULL AUTO_INCREMENT,
  `idPersonne` int NOT NULL,
  PRIMARY KEY (`idActeurice`),
  UNIQUE KEY `idPersonne` (`idPersonne`),
  CONSTRAINT `acteurice_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.acteurice : ~29 rows (environ)
INSERT INTO `acteurice` (`idActeurice`, `idPersonne`) VALUES
	(26, 2),
	(19, 3),
	(12, 4),
	(16, 5),
	(6, 6),
	(14, 7),
	(21, 8),
	(1, 9),
	(24, 10),
	(2, 11),
	(3, 12),
	(10, 13),
	(22, 14),
	(20, 15),
	(23, 16),
	(18, 18),
	(25, 19),
	(8, 20),
	(7, 21),
	(11, 22),
	(9, 23),
	(15, 24),
	(5, 25),
	(13, 26),
	(17, 27),
	(27, 28),
	(4, 35),
	(28, 37),
	(29, 38);

-- Listage de la structure de table cinema. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `idFilm` int NOT NULL,
  `idGenre` int NOT NULL,
  PRIMARY KEY (`idFilm`,`idGenre`),
  KEY `idGenre` (`idGenre`),
  CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `categorie_ibfk_2` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.categorie : ~22 rows (environ)
INSERT INTO `categorie` (`idFilm`, `idGenre`) VALUES
	(1, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(9, 1),
	(10, 1),
	(12, 1),
	(1, 2),
	(2, 2),
	(4, 2),
	(6, 2),
	(8, 2),
	(10, 2),
	(3, 3),
	(9, 3),
	(8, 4),
	(12, 4),
	(5, 5),
	(7, 5),
	(12, 5);

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `idFilm` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `annee` date NOT NULL,
  `duree` int NOT NULL,
  `synopsis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `note` varchar(50) NOT NULL,
  `affiche` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trailer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idReali` int NOT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `idReali` (`idReali`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`idReali`) REFERENCES `reali` (`idReali`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~12 rows (environ)
INSERT INTO `film` (`idFilm`, `titre`, `annee`, `duree`, `synopsis`, `note`, `affiche`, `trailer`, `idReali`) VALUES
	(1, 'Alien', '1979-09-12', 117, 'A space crew faces a deadly extraterrestrial creature that begins hunting them aboard their ship after a distress signal leads them to a mysterious planet.', '9.5/10', 'https://m.media-amazon.com/images/M/MV5BN2NhMDk2MmEtZDQzOC00MmY5LThhYzAtMDdjZGFjOGZjMjdjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/4lRNBd8Vook?si=_tS2cccCDkUsK3Wu', 1),
	(2, 'The Shining', '1980-05-23', 146, 'A family’s stay at a remote mountain hotel unravels into terror as supernatural forces and a father\'s descent into madness threaten their survival.', '9/10', 'https://m.media-amazon.com/images/M/MV5BZjhjMjA2NTItZmFjOC00ZTg2LTlkODEtMDNjMWM3ZjUxZWY3XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/FZQvIJxG9Xs?si=ApnzIbdOjdcpVmw8', 2),
	(3, 'E.T.', '1982-06-11', 115, 'A young boy befriends a gentle alien stranded on Earth and helps it find a way home while evading government agents.', '6.5/10', 'https://m.media-amazon.com/images/M/MV5BYTNhNmY0YWMtMTczYi00MTA0LThhMmUtMTIxYzE0Y2QwMzRlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/Jva4IWuDYLM?si=rZDL6Y_gy0qGfrrv', 3),
	(4, 'The Thing', '1982-06-25', 109, 'In an Antarctic research station, a shape-shifting alien lifeform infiltrates and mimics the team, sparking paranoia and a desperate fight for survival.', '9/10', 'https://m.media-amazon.com/images/M/MV5BYTA3NDU5MWEtNTk4Yy00ZDNkLThmZTQtMjU3ZGVhYzAyMzU4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/eke95-lTPnY?si=NQdvL9ljQLJFwKLI', 4),
	(5, 'Total Recall', '1990-06-01', 113, 'A construction worker discovers his memories may be fabricated and embarks on a mind-bending adventure to Mars to uncover his true identity.', '7.5/10', 'https://m.media-amazon.com/images/M/MV5BZjRlMzBkOGMtMTA1Ny00ZWI4LTkzMDItOGVkNWJkN2E4ZTkwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/u-JZb46UZzE?si=0v5drck1SMl-Okwy', 5),
	(6, 'The Fly', '1986-08-15', 96, 'A scientist’s groundbreaking teleportation experiment goes horrifyingly wrong when his DNA is fused with a fly, leading to a monstrous transformation.', '8.5/10', 'https://m.media-amazon.com/images/M/MV5BOTBlNTliNTItY2VhNS00MjA5LTllYzItMmQyNGRjYTAyZWQxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/fj1SHpBsY7w?si=QpKkpU01l3xVgSXa', 6),
	(7, 'Predator', '1987-06-12', 107, 'An elite military team is hunted by a highly advanced alien predator in the jungles of Central America during a covert rescue mission.', '8/10', 'https://m.media-amazon.com/images/M/MV5BOWEzMDI0MTUtMjQ0Yy00MGRhLWI4YjAtZTgzZTM3NTYxZGJkXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/Vo3FmkleTEQ?si=arls4eKlB-cdTIE5', 7),
	(8, 'The Silence of the Lambs', '1991-02-14', 118, 'A young FBI trainee seeks the help of a brilliant but dangerous cannibalistic killer to catch another serial murderer.', '8.5/10', 'https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/6iB21hsprAQ?si=zTRJXiIe9m4C5aKt', 8),
	(9, 'Jurassic Park', '1993-06-11', 127, 'A billionaire’s dinosaur theme park turns deadly when the prehistoric creatures escape their enclosures and threaten everyone on the island.', '8.5/10', 'https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/bx46tthKXmc?si=vADYKGpJuK8rPB0T', 3),
	(10, 'Nope', '2022-07-22', 130, 'Siblings running a horse ranch encounter a mysterious UFO and attempt to document its existence while uncovering its terrifying nature.', '5/10', 'https://m.media-amazon.com/images/M/MV5BODRlNWRhZWUtMzdlZC00ZDIyLWFhZjMtYTcxNjI1ZDIwODhjXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/In8fuzj3gck?si=eMGekxijj77qzt2v', 9),
	(11, '2001 - A space odyssey', '1968-09-27', 149, 'Humanity’s journey through space and time culminates in an existential encounter with an alien intelligence and the evolution of consciousness.', '8/10', 'https://m.media-amazon.com/images/M/MV5BNjU0NDFkMTQtZWY5OS00MmZhLTg3Y2QtZmJhMzMzMWYyYjc2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/oR_e9y-bka0?si=MBNCT_XIIG6BnWoU', 2),
	(12, 'Running Man', '1987-11-13', 101, 'In a dystopian future, a falsely accused man is forced to participate in a deadly televised game show where survival means freedom.', '7/10', 'https://m.media-amazon.com/images/M/MV5BMDQwYzMwMDItYzFhZC00YjkzLTlmODAtMzg3NDFlNDhhZjYzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/pkAN5rGGP1M?si=sziW9XZmJMaUTFVd', 11);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~5 rows (environ)
INSERT INTO `genre` (`idGenre`, `libelle`) VALUES
	(1, 'Science-fiction'),
	(2, 'Horror'),
	(3, 'Adventure'),
	(4, 'Thriller'),
	(5, 'Action');

-- Listage de la structure de table cinema. interpretation
CREATE TABLE IF NOT EXISTS `interpretation` (
  `idFilm` int NOT NULL,
  `idActeurice` int NOT NULL,
  `idRole` int NOT NULL,
  PRIMARY KEY (`idFilm`,`idActeurice`,`idRole`),
  KEY `idActeurice` (`idActeurice`),
  KEY `idRole` (`idRole`),
  CONSTRAINT `interpretation_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `interpretation_ibfk_2` FOREIGN KEY (`idActeurice`) REFERENCES `acteurice` (`idActeurice`),
  CONSTRAINT `interpretation_ibfk_3` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.interpretation : ~31 rows (environ)
INSERT INTO `interpretation` (`idFilm`, `idActeurice`, `idRole`) VALUES
	(3, 1, 8),
	(4, 2, 10),
	(4, 3, 11),
	(6, 4, 13),
	(9, 5, 24),
	(2, 6, 5),
	(8, 7, 20),
	(6, 8, 14),
	(8, 9, 22),
	(6, 10, 12),
	(9, 10, 25),
	(8, 11, 21),
	(1, 12, 3),
	(10, 13, 26),
	(2, 14, 6),
	(9, 15, 23),
	(2, 16, 4),
	(10, 17, 27),
	(5, 18, 30),
	(7, 18, 17),
	(12, 18, 32),
	(1, 19, 2),
	(5, 20, 15),
	(3, 21, 7),
	(5, 22, 31),
	(7, 23, 19),
	(3, 24, 9),
	(7, 25, 18),
	(1, 26, 1),
	(10, 27, 28),
	(4, 28, 29);

-- Listage de la structure de table cinema. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `idPersonne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sexe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateNais` date NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personne : ~39 rows (environ)
INSERT INTO `personne` (`idPersonne`, `nom`, `prenom`, `sexe`, `dateNais`, `bio`, `photo`) VALUES
	(1, 'Scott', 'Ridley', 'H', '1937-11-30', 'A British director and producer, Ridley Scott is known for his groundbreaking work in science fiction and historical epics, with iconic films like Alien, Blade Runner, and Gladiator.', 'https://m.media-amazon.com/images/M/MV5BNDM1OWUyZDktZGJmYS00MjQxLWI1OTItY2M4MWViM2NmOWM0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
	(2, 'Weaver', 'Sigouney', 'F', '1949-10-08', 'An acclaimed actress known for her iconic role as Ellen Ripley in the Alien franchise, she has become a pioneer for women in science fiction and action films.', 'https://m.media-amazon.com/images/M/MV5BMTk1MTcyNTE3OV5BMl5BanBnXkFtZTcwMTA0MTMyMw@@._V1_.jpg'),
	(3, 'Skerritt', 'Tom', 'H', '1937-08-25', 'An American actor, Tom Skerritt has appeared in diverse roles in films like Top Gun, Alien, and A River Runs Through It, and is also known for his television work.', 'https://m.media-amazon.com/images/M/MV5BNzY3Mjk5MTMyMl5BMl5BanBnXkFtZTYwMjUxMTc1._V1_FMjpg_UX1000_.jpg'),
	(4, 'Hurt', 'John', 'H', '1943-01-22', 'A versatile British actor celebrated for his powerful performances in films like The Elephant Man, Alien, and 1984.', 'https://m.media-amazon.com/images/M/MV5BMTM1NTgyMTAyOV5BMl5BanBnXkFtZTcwMTE4MjQwNA@@._V1_FMjpg_UX1000_.jpg'),
	(5, 'Nicholson', 'Jack', 'H', '1937-04-22', 'A legendary American actor, Jack Nicholson is celebrated for his iconic roles in One Flew Over the Cuckoo\'s Nest, The Shining, and Batman, winning numerous awards.', 'https://m.media-amazon.com/images/M/MV5BMTQ3OTY0ODk0M15BMl5BanBnXkFtZTYwNzE4Njc4._V1_FMjpg_UX1000_.jpg'),
	(6, 'Duvall', 'Shelley', 'F', '1949-07-09', 'A unique and talented actress renowned for her roles in The Shining and Popeye, as well as her work on the innovative children\'s series Faerie Tale Theatre.', 'https://m.media-amazon.com/images/M/MV5BNjE4MTY1Mzk0N15BMl5BanBnXkFtZTgwOTQzNDE2MDE@._V1_FMjpg_UX1000_.jpg'),
	(7, 'Lloyd', 'Danny', 'H', '1972-01-01', 'An American former child actor, Danny Lloyd is best known for his role as Danny Torrance in Stanley Kubrick\'s The Shining.\n', 'https://m.media-amazon.com/images/M/MV5BMjI3MjY3MjgtYmRlYS00MWNmLWE5Y2EtYzAwNmY2NGIxOGE5XkEyXkFqcGc@._V1_.jpg'),
	(8, 'Thomas', 'Henry', 'H', '1971-09-09', 'Likely a confusion with another name; please clarify or specify if referring to Tom Holland or another cinema personality.', 'https://m.media-amazon.com/images/M/MV5BMTQ5NjY0NjI5NV5BMl5BanBnXkFtZTYwMDYzMTYz._V1_FMjpg_UX1000_.jpg'),
	(9, 'Barrymore', 'Drew', 'F', '1975-02-22', 'An American actress, Drew Barrymore gained fame as a child star in E.T. the Extra-Terrestrial and later found success in romantic comedies and as a television host.', 'https://m.media-amazon.com/images/M/MV5BMjEyOTMzODIxM15BMl5BanBnXkFtZTcwODM2NTY5Mg@@._V1_FMjpg_UX1000_.jpg'),
	(10, 'Wallace', 'Dee', 'F', '1948-12-14', 'A beloved actress often associated with family and horror films, best known as the compassionate mother in E.T. the Extra-Terrestrial.', 'https://m.media-amazon.com/images/M/MV5BZDZlZTNjNjgtNjJhZC00MGYxLTkyZDMtOGIwYmFjOTM1MWQwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
	(11, 'Brimley', 'Wilford', 'H', '1934-09-27', 'An American actor, Wilford Brimley was known for his roles in Cocoon, The Thing, and his advocacy for diabetes awareness.', 'https://m.media-amazon.com/images/M/MV5BNDRkNmNiZTUtOGEzYy00MGMzLWEyMjYtOGYxYThhY2MxZjFkXkEyXkFqcGc@._V1_.jpg'),
	(12, 'David', 'Keith', 'H', '1956-06-04', 'A versatile actor and director recognized for his roles in An Officer and a Gentleman and Firestarter.', 'https://m.media-amazon.com/images/M/MV5BMTQ3ODAyNjQyN15BMl5BanBnXkFtZTcwNTM5NTk3MQ@@._V1_FMjpg_UX1000_.jpg'),
	(13, 'Goldblum', 'Jeff', 'H', '1952-10-22', 'An American actor and musician, Jeff Goldblum is renowned for his eccentric roles in Jurassic Park, The Fly, and Independence Day.', 'https://m.media-amazon.com/images/M/MV5BZWIxM2YzMTEtMjFiNy00NWQ2LWI0Y2MtZGVmYjM0YWFmZThmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
	(14, 'Ticotin', 'Rachel', 'F', '1958-11-01', 'A talented actress admired for her strong performances in Total Recall and Con Air.', 'https://m.media-amazon.com/images/M/MV5BMTMwNTYzOTIxN15BMl5BanBnXkFtZTcwNDczNDgwMw@@._V1_QL75_UX480_.jpg'),
	(15, 'Stone', 'Sharon', 'F', '1958-03-10', 'A renowned actress who achieved global fame with her captivating performance in Basic Instinct and continues to be a prominent figure in Hollywood.', 'https://m.media-amazon.com/images/M/MV5BMTg0MDU1ODQwNF5BMl5BanBnXkFtZTcwOTc3MjQwNA@@._V1_FMjpg_UX1000_.jpg'),
	(16, 'Ventura', 'Jessie', 'H', '1952-07-15', 'An American politician, actor, and former professional wrestler, Jesse Ventura became the governor of Minnesota and starred in films like Predator and The Running Man.', 'https://m.media-amazon.com/images/M/MV5BMjA0NjIyMjcyNV5BMl5BanBnXkFtZTYwMjU5Njk1._V1_FMjpg_UX1000_.jpg'),
	(17, 'McTiernan', 'John', 'H', '1952-01-08', 'A master of action cinema, he directed classics like Die Hard, Predator, and The Hunt for Red October.', 'https://upload.wikimedia.org/wikipedia/commons/b/b2/John_McTiernan_Deauville_2014_3.jpg'),
	(18, 'Schwarzenegger', 'Arnold', 'H', '1947-07-30', 'An Austrian-American actor, former bodybuilder, and politician, Arnold Schwarzenegger became a global icon through roles in The Terminator, Predator, and as California\'s governor.', 'https://m.media-amazon.com/images/M/MV5BMTI3MDc4NzUyMV5BMl5BanBnXkFtZTcwMTQyMTc5MQ@@._V1_FMjpg_UX1000_.jpg'),
	(19, 'Weathers', 'Carl', 'H', '1948-01-14', 'Best known for his role as Apollo Creed in the Rocky series, he is also celebrated for his work in Predator and The Mandalorian.', 'https://m.media-amazon.com/images/M/MV5BNjcwNTdhYjMtZDQ5My00ZjVjLWEyZDgtOTZiYzk5YzM3ZjBlXkEyXkFqcGc@._V1_.jpg'),
	(20, 'Getz', 'John', 'H', '1946-03-15', 'An American actor, John Getz is known for his roles in films such as The Fly, Blood Simple, and The Social Network.', 'https://m.media-amazon.com/images/M/MV5BMjAwNDcxODcwMF5BMl5BanBnXkFtZTcwMjQ2MzMzMQ@@._V1_.jpg'),
	(21, 'Foster', 'Jodie', 'F', '1962-11-19', 'A two-time Academy Award-winning actress and director, she is celebrated for her exceptional performances in The Silence of the Lambs and Contact.', 'https://m.media-amazon.com/images/M/MV5BMTM3MjgyOTQwNF5BMl5BanBnXkFtZTcwMDczMzEwNA@@._V1_.jpg'),
	(22, 'Hopkins', 'Anthony', 'H', '1937-12-31', 'A Welsh actor, Anthony Hopkins is famous for his brilliant performances in The Silence of the Lambs, The Father, and War & Peace, winning multiple Academy Awards.', 'https://m.media-amazon.com/images/M/MV5BMTg5ODk1NTc5Ml5BMl5BanBnXkFtZTYwMjAwOTI4._V1_FMjpg_UX1000_.jpg'),
	(23, 'Glenn', 'Scott', 'H', '1941-01-26', 'Likely a confusion with another name; please clarify or specify the correct individual.', 'https://m.media-amazon.com/images/M/MV5BMTU3NzAwMzE1OF5BMl5BanBnXkFtZTYwMjkzOTY0._V1_FMjpg_UX1000_.jpg'),
	(24, 'Neill', 'Sam', 'H', '1947-09-14', 'A New Zealand actor, Sam Neill is known for his roles in Jurassic Park, The Hunt for Red October, and The Piano.', 'https://m.media-amazon.com/images/M/MV5BMjUyMTU0MzA0MF5BMl5BanBnXkFtZTgwNTA4MTQ4NjM@._V1_FMjpg_UX1000_.jpg'),
	(25, 'Dern', 'Laura', 'F', '1967-02-10', 'A highly regarded actress known for her roles in Jurassic Park, Blue Velvet, and Marriage Story, earning critical acclaim for her nuanced performances.', 'https://m.media-amazon.com/images/M/MV5BMjI3NzY0MDQxMF5BMl5BanBnXkFtZTcwNzMwMzcyNw@@._V1_FMjpg_UX1000_.jpg'),
	(26, 'Kaluuya', 'Daniel', 'H', '1989-02-24', ' A British actor, Daniel Kaluuya gained worldwide recognition for his performances in Get Out, Black Panther, and Judas and the Black Messiah, winning an Academy Award.', 'https://m.media-amazon.com/images/M/MV5BOTk1MzgzOTg5OV5BMl5BanBnXkFtZTcwNDQ4NjMxOA@@._V1_FMjpg_UX1000_.jpg'),
	(27, 'Palmer', 'Keke', 'F', '1993-08-26', 'A versatile actress, singer, and TV host who gained acclaim for her roles in Akeelah and the Bee and Jordan Peele’s Nope.', 'https://m.media-amazon.com/images/M/MV5BZjRjN2NkZTktMjE3My00MzIyLWFkNmMtYjNkN2YyZTgyNTc2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
	(28, 'Yeun', 'Steven', 'H', '1983-12-24', 'A Korean-American actor, Steven Yeun is best known for his role in The Walking Dead and for his critically acclaimed performance in Minari.', 'https://m.media-amazon.com/images/M/MV5BZTdkZDYwNzQtNmJhOC00NGRkLWJmOTgtZDM1NGE0ZDFmYTdmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
	(29, 'Kubrick', 'Stanley', 'H', '1928-07-26', 'A visionary director known for his meticulous craftsmanship and masterpieces such as 2001: A Space Odyssey, The Shining, and A Clockwork Orange.', 'https://m.media-amazon.com/images/M/MV5BMDZlOGFiZmYtZDRmZi00M2RkLTg1MDgtYjUwYjJiYmNiZjhmXkEyXkFqcGc@._V1_.jpg'),
	(30, 'Spielberg', 'Steven', 'H', '1946-12-18', 'An American filmmaker, Steven Spielberg is one of the most influential directors in cinema history, known for E.T. the Extra-Terrestrial, Schindler’s List, and Jaws.', 'https://m.media-amazon.com/images/M/MV5BMTY1NjAzNzE1MV5BMl5BanBnXkFtZTYwNTk0ODc0._V1_FMjpg_UX1000_.jpg'),
	(31, 'Carpenter', 'John', 'H', '1948-01-16', 'A legendary filmmaker celebrated for his pioneering work in horror and science fiction, with classics like Halloween and The Thing.', 'https://m.media-amazon.com/images/M/MV5BMTAzMzgwNDgzODBeQTJeQWpwZ15BbWU4MDA2OTk2NDEx._V1_FMjpg_UX1000_.jpg'),
	(32, 'Verhoeven', 'Paul', 'H', '1938-07-18', 'A Dutch director and screenwriter, Paul Verhoeven is known for provocative and satirical films like Robocop, Total Recall, and Basic Instinct.', 'https://m.media-amazon.com/images/M/MV5BOTUyMDk4MTUtMDU4YS00ZWI3LTk5MTgtY2UyM2E4N2QyNjg3XkEyXkFqcGc@._V1_.jpg'),
	(33, 'Demme', 'Jonathan', 'H', '1944-02-22', 'An acclaimed director known for his ability to blend humanity and suspense in films like The Silence of the Lambs and Philadelphia.', 'https://m.media-amazon.com/images/M/MV5BMTY1NzY0OTQ0OF5BMl5BanBnXkFtZTcwNDY1Njk5Mg@@._V1_.jpg'),
	(34, 'Peele', 'Jordan', 'H', '1979-02-21', 'An American filmmaker, comedian, and actor, Jordan Peele is acclaimed for his horror films Get Out and Us, which combine social commentary with genre innovation.', 'https://m.media-amazon.com/images/M/MV5BZGIzOTRhY2ItYzdiOC00NTNlLWJmMTYtZGYzNWM2M2RiNjM3XkEyXkFqcGc@._V1_CR159,0,642,963_FMjpg_UX1000_.jpg'),
	(35, 'Davis', 'Geena', 'F', '1956-01-21', 'A celebrated actress and advocate for gender equality in media, best known for her roles in Thelma & Louise and A League of Their Own.', 'https://m.media-amazon.com/images/M/MV5BMTIxMTk5MTc3Ml5BMl5BanBnXkFtZTYwMDc0NDE0._V1_.jpg'),
	(36, 'Cronenberg', 'David', 'H', '1943-03-15', 'A Canadian filmmaker, David Cronenberg is known for his work in the body horror genre, with films like The Fly, Videodrome, and Crash.', 'https://m.media-amazon.com/images/M/MV5BMTM5NjM3OTYyMV5BMl5BanBnXkFtZTYwMzcyMzY1._V1_FMjpg_UX1000_.jpg'),
	(37, 'Russell', 'Kurt', 'H', '1951-03-17', 'A charismatic actor renowned for his roles in iconic films like Escape from New York, The Thing, and Big Trouble in Little China.', 'https://m.media-amazon.com/images/M/MV5BMTk3MjkxNzQwMV5BMl5BanBnXkFtZTYwNDk4ODM1._V1_FMjpg_UX1000_.jpg'),
	(38, 'Eastwood', 'Clint', 'H', '1930-05-31', 'An American actor, director, and producer, Clint Eastwood became famous for his roles in Dirty Harry and The Good, the Bad and the Ugly, later achieving success as a director with films like Unforgiven and Million Dollar Baby.', 'https://m.media-amazon.com/images/M/MV5BMTAxNzc4MDAyMjheQTJeQWpwZ15BbWU4MDM2NjE5OTYz._V1_.jpg'),
	(39, 'Glaser', 'Paul Michael', 'H', '1943-03-25', 'An American actor, director, and producer, Paul Michael Glaser is best known for his role as Detective Starsky in the TV series Starsky & Hutch and for directing the film The Running Man.\n\n\n', 'https://m.media-amazon.com/images/M/MV5BMTc5MjM0NDQ3MV5BMl5BanBnXkFtZTYwNjIxNzU2._V1_FMjpg_UX1000_.jpg');

-- Listage de la structure de table cinema. reali
CREATE TABLE IF NOT EXISTS `reali` (
  `idReali` int NOT NULL AUTO_INCREMENT,
  `idPersonne` int NOT NULL,
  PRIMARY KEY (`idReali`),
  UNIQUE KEY `idPersonne` (`idPersonne`),
  CONSTRAINT `reali_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.reali : ~11 rows (environ)
INSERT INTO `reali` (`idReali`, `idPersonne`) VALUES
	(1, 1),
	(7, 17),
	(2, 29),
	(3, 30),
	(4, 31),
	(5, 32),
	(8, 33),
	(9, 34),
	(6, 36),
	(10, 38),
	(11, 39);

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `personnage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.role : ~31 rows (environ)
INSERT INTO `role` (`idRole`, `personnage`) VALUES
	(1, 'Ellen Ripley'),
	(2, 'Dallas'),
	(3, 'Kane'),
	(4, 'Jack Torrance'),
	(5, 'Wendy Torrance'),
	(6, 'Danny Torrance'),
	(7, 'Elliott'),
	(8, 'Gertie'),
	(9, 'Mary'),
	(10, 'Dr. Blair'),
	(11, 'Childs'),
	(12, 'Seth Brundle'),
	(13, 'Veronica Quaife'),
	(14, 'Stathis Borans'),
	(15, 'Lori'),
	(17, 'Dutch'),
	(18, 'Dillon'),
	(19, 'Blain'),
	(20, 'Clarice Starling'),
	(21, 'Dr. Hannibal Lecter'),
	(22, 'Jack Crawford'),
	(23, 'Dr. Alan Grant'),
	(24, 'Dr. Ellie Sattler'),
	(25, 'Dr. Ian Malcolm'),
	(26, 'OJ Haywood'),
	(27, 'Emerald Haywood'),
	(28, 'Ricky "Jupe" Park'),
	(29, 'MacReady'),
	(30, 'Douglas Quaid'),
	(31, 'Melina'),
	(32, 'Ben Richards');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
