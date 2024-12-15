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
  `idPersonne` int DEFAULT NULL,
  PRIMARY KEY (`idActeurice`),
  UNIQUE KEY `idPersonne` (`idPersonne`),
  CONSTRAINT `acteurice_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `titre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `annee` date DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `synopsis` text,
  `note` double DEFAULT NULL,
  `affiche` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idReali` int DEFAULT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `idReali` (`idReali`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`idReali`) REFERENCES `reali` (`idReali`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~12 rows (environ)
INSERT INTO `film` (`idFilm`, `titre`, `annee`, `duree`, `synopsis`, `note`, `affiche`, `idReali`) VALUES
	(1, 'Alien', '1979-09-12', 117, 'Une équipe d\'astronautes doit survivre face à une entité extraterrestre.', 9.5, 'alien.jpg', 1),
	(2, 'The Shining', '1980-05-23', 146, 'Un homme devient fou alors qu\'il garde un hôtel isolé avec sa famille.', 9, 'theshining.jpg', 2),
	(3, 'E.T. l\'extra-terrestre', '1982-06-11', 115, 'Un garçon et un extraterrestre se lient d\'amitié alors qu\'ils tentent de fuir des autorités.', 6.5, 'et.jpg', 3),
	(4, 'The Thing', '1982-06-25', 109, 'Des scientifiques en Antarctique sont confrontés à une créature capable de prendre l\'apparence de n\'importe qui.', 9, 'thething.jpg', 4),
	(5, 'Total Recall', '1990-06-01', 113, 'Un homme découvre que ses souvenirs implantés sont liés à un complot sur Mars.', 8, 'totalrecall.jpg', 5),
	(6, 'The Fly', '1986-08-15', 96, 'Un scientifique se transforme en monstre après une expérience de téléportation qui tourne mal.', 8.5, 'thefly.jpg', 6),
	(7, 'Predator', '1987-06-12', 107, 'Un groupe de commandos se retrouve pris au piège par un extraterrestre chasseur dans la jungle.', 8, 'predator.jpg', 7),
	(8, 'The Silence of the Lambs', '1991-02-14', 118, 'Une jeune agente du FBI cherche l\'aide d\'un tueur en série pour capturer un autre criminel.', 8.5, 'silenceofthelambs.jpg', 8),
	(9, 'Jurassic Park', '1993-06-11', 127, 'Des scientifiques réaniment des dinosaures pour un parc à thème, mais tout dérape rapidement.', 8.5, 'jurassicpark.jpg', 3),
	(10, 'Nope', '2022-07-22', 130, 'Deux frères et sœurs tentent de capturer des preuves d\'un phénomène étrange dans leur ferme.', 5, 'nope.jpg', 9),
	(11, '2001, l\'Odyssée de l\'Espace', '1968-09-27', 149, 'Le film retrace, à travers différentes époques de l\'histoire humaine, le rôle joué dans l\'évolution de l\'humanité par une intelligence inconnue', 8, '2001.jpg', 2),
	(12, 'Running Man', '1987-11-13', 101, 'Running Man est un film de science-fiction où un homme accusé à tort d\'un crime doit participer à un jeu télévisé brutal et mortel, dans lequel des prisonniers sont pourchassés par des chasseurs pour divertir le public.', 6.5, 'runningman.jpg', 11);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~5 rows (environ)
INSERT INTO `genre` (`idGenre`, `libelle`) VALUES
	(1, 'Science-fiction'),
	(2, 'Horreur'),
	(3, 'Aventure'),
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
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sexe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dateNais` date DEFAULT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personne : ~39 rows (environ)
INSERT INTO `personne` (`idPersonne`, `nom`, `prenom`, `sexe`, `dateNais`) VALUES
	(1, 'Scott', 'Ridley', 'H', '1937-11-30'),
	(2, 'Weaver', 'Sigouney', 'F', '1949-10-08'),
	(3, 'Skerritt', 'Tom', 'H', '1937-08-25'),
	(4, 'Hurt', 'John', 'H', '1943-01-22'),
	(5, 'Nicholson', 'Jack', 'H', '1937-04-22'),
	(6, 'Duvall', 'Shelley', 'F', '1949-07-09'),
	(7, 'Lloyd', 'Danny', 'H', '1972-01-01'),
	(8, 'Thomas', 'Henry', 'H', '1971-09-09'),
	(9, 'Barrymore', 'Drew', 'F', '1975-02-22'),
	(10, 'Wallace', 'Dee', 'F', '1948-12-14'),
	(11, 'Brimley', 'Wilford', 'H', '1934-09-27'),
	(12, 'David', 'Keith', 'H', '1956-06-04'),
	(13, 'Goldblum', 'Jeff', 'H', '1952-10-22'),
	(14, 'Ticotin', 'Rachel', 'F', '1958-11-01'),
	(15, 'Stone', 'Sharon', 'F', '1958-03-10'),
	(16, 'Ventura', 'Jessie', 'H', '1952-07-15'),
	(17, 'McTiernan', 'John', 'H', '1952-01-08'),
	(18, 'Schwarzenegger', 'Arnold', 'H', '1947-07-30'),
	(19, 'Weathers', 'Carl', 'H', '1948-01-14'),
	(20, 'Getz', 'John', 'H', '1946-03-15'),
	(21, 'Foster', 'Jodie', 'F', '1962-11-19'),
	(22, 'Hopkins', 'Anthony', 'H', '1937-12-31'),
	(23, 'Glenn', 'Scott', 'H', '1941-01-26'),
	(24, 'Neill', 'Sam', 'H', '1947-09-14'),
	(25, 'Dern', 'Laura', 'F', '1967-02-10'),
	(26, 'Kaluuya', 'Daniel', 'H', '1989-02-24'),
	(27, 'Palmer', 'Keke', 'F', '1993-08-26'),
	(28, 'Yeun', 'Steven', 'H', '1983-12-24'),
	(29, 'Kubrick', 'Stanley', 'H', '1928-07-26'),
	(30, 'Spielberg', 'Steven', 'H', '1946-12-18'),
	(31, 'Carpenter', 'John', 'H', '1948-01-16'),
	(32, 'Verhoeven', 'Paul', 'H', '1938-07-18'),
	(33, 'Demme', 'Jonathan', 'H', '1944-02-22'),
	(34, 'Peele', 'Jordan', 'H', '1979-02-21'),
	(35, 'Davis', 'Geena', 'F', '1956-01-21'),
	(36, 'Cronenberg', 'David', 'H', '1943-03-15'),
	(37, 'Russell', 'Kurt', 'H', '1951-03-17'),
	(38, 'Eastwood', 'Clint', 'H', '1930-05-31'),
	(39, 'Glaser', 'Paul Michael', 'H', '1943-03-25');

-- Listage de la structure de table cinema. reali
CREATE TABLE IF NOT EXISTS `reali` (
  `idReali` int NOT NULL AUTO_INCREMENT,
  `idPersonne` int DEFAULT NULL,
  PRIMARY KEY (`idReali`),
  UNIQUE KEY `idPersonne` (`idPersonne`),
  CONSTRAINT `reali_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `personnage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
