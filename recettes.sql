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


-- Listage de la structure de la base pour recettes
CREATE DATABASE IF NOT EXISTS `recettes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes`;

-- Listage de la structure de table recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `idIngredient` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `prix` float NOT NULL,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.ingredient : ~29 rows (environ)
INSERT INTO `ingredient` (`idIngredient`, `nom`, `prix`) VALUES
	(1, 'Tomates', 1.5),
	(2, 'Mozza', 2),
	(3, 'Huile d\'olive', 0.3),
	(6, 'Oeufs', 0.9),
	(7, 'Beurre', 0.2),
	(8, 'Pâtes', 0.8),
	(9, 'Sauce tomate', 1),
	(10, 'Ail', 0.1),
	(11, 'Pain', 0.5),
	(12, 'Avocat', 1.5),
	(13, 'Citron', 0.3),
	(14, 'Farine', 0.2),
	(15, 'Lait', 0.4),
	(16, 'Sucre', 0.05),
	(17, 'Quinoa', 1.5),
	(18, 'Concombre', 0.5),
	(19, 'Feta', 1.5),
	(20, 'Banane', 0.8),
	(21, 'Miel', 0.2),
	(22, 'Avoine', 0.3),
	(23, 'Compote', 0.6),
	(24, 'Courgette', 0.8),
	(25, 'Poivron', 1),
	(26, 'Oignon', 0.2),
	(27, 'Yogourt', 0.5),
	(28, 'Fraise', 1),
	(29, 'Lardons', 2.5),
	(30, 'Crème', 0.8),
	(31, 'Parmesan', 2);

-- Listage de la structure de table recettes. ingredientsrecette
CREATE TABLE IF NOT EXISTS `ingredientsrecette` (
  `quantite` float NOT NULL,
  `uniteMsr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idRecette` int NOT NULL,
  `idIngredient` int NOT NULL,
  KEY `idRecette` (`idRecette`),
  KEY `idIngredient` (`idIngredient`),
  CONSTRAINT `FK_ingredientsrecette_ingredient` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`idIngredient`),
  CONSTRAINT `FK_ingredientsrecette_recette` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.ingredientsrecette : ~40 rows (environ)
INSERT INTO `ingredientsrecette` (`quantite`, `uniteMsr`, `idRecette`, `idIngredient`) VALUES
	(2, 'CaS', 1, 3),
	(3, 'Pièce(s)', 1, 1),
	(1, 'Pièce(s)', 1, 2),
	(250, 'g', 3, 8),
	(400, 'g', 3, 9),
	(1, 'Pièce(s)', 3, 10),
	(1, 'CaS', 3, 3),
	(2, 'Pièce(s)', 4, 11),
	(1, 'Pièce(s)', 4, 12),
	(0.5, 'Pièce(s)', 4, 13),
	(100, 'g', 5, 14),
	(250, 'ml', 5, 15),
	(1, 'Pièce(s)', 5, 6),
	(10, 'g', 5, 7),
	(1, 'CaS', 5, 16),
	(150, 'g', 6, 17),
	(0.5, 'Pièce(s)', 6, 18),
	(100, 'g', 6, 1),
	(100, 'g', 6, 19),
	(1, 'CaS', 6, 3),
	(0.5, 'Pièce(s)', 6, 13),
	(2, 'Pièce(s)', 7, 20),
	(1, 'CaS', 7, 21),
	(50, 'g', 8, 22),
	(200, 'ml', 8, 15),
	(100, 'g', 8, 23),
	(1, 'CaC', 8, 16),
	(1, 'Pièce(s)', 9, 24),
	(1, 'Pièce(s)', 9, 25),
	(1, 'Pièce(s)', 9, 26),
	(1, 'CaS', 9, 3),
	(1, 'Pièce(s)', 10, 27),
	(100, 'g', 10, 28),
	(100, 'g', 10, 20),
	(1, 'CaS', 10, 21),
	(250, 'g', 11, 8),
	(150, 'g', 11, 29),
	(2, 'Pièce(s)', 11, 6),
	(100, 'ml', 11, 30),
	(50, 'g', 11, 31);

-- Listage de la structure de table recettes. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `idRecette` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `tpsPrepaMin` int NOT NULL DEFAULT '0',
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `idTypePlat` int NOT NULL,
  PRIMARY KEY (`idRecette`),
  KEY `idTypePlat` (`idTypePlat`),
  CONSTRAINT `FK_recette_type_plat` FOREIGN KEY (`idTypePlat`) REFERENCES `type_plat` (`idTypePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.recette : ~10 rows (environ)
INSERT INTO `recette` (`idRecette`, `nom`, `tpsPrepaMin`, `instructions`, `idTypePlat`) VALUES
	(1, 'Salade de tomates/mozza', 10, 'Couper les tomates et la mozzarella en rondelles.\nDisposer dans une assiette, alterner tomate et mozzarella.\nAjouter le basilic, saler et poivrer.\nArroser d\'huile d\'olive et servir.', 1),
	(3, 'Pâtes à la tomate fraîche', 15, 'Faire cuire les pâtes selon les instructions du paquet.\nPendant ce temps, hacher l\'ail et le faire revenir dans l\'huile d\'olive.\nAjouter la sauce tomate et laisser mijoter 5-10 minutes.\nMélanger les pâtes égouttées avec la sauce tomate, saler et poivrer avant de servir.', 2),
	(4, 'Toast à l\'avocat', 10, 'Faire griller les tranches de pain.\nCouper l\'avocat en deux, retirer le noyau et écraser la chair dans un bol.\nAjouter le jus de citron, saler et poivrer.\nÉtaler l\'avocat écrasé sur les tranches de pain grillé et servir.', 1),
	(5, 'Crêpes', 15, 'Mélanger la farine, le lait, l\'œuf et le sucre pour obtenir une pâte lisse.\nChauffer une poêle avec un peu de beurre et verser une petite quantité de pâte.\nCuire chaque crêpe 1-2 minutes de chaque côté, puis servir.', 3),
	(6, 'Salade quinoa', 20, 'Cuire le quinoa selon les instructions du paquet.\nCouper le concombre, les tomates cerises et la feta en morceaux.\nMélanger tous les ingrédients dans un grand saladier.\nAjouter l\'huile d\'olive, le jus de citron, saler et poivrer avant de servir.', 2),
	(7, 'Banane au miel', 10, 'Préchauffer le four à 180°C.\nCouper les bananes en deux dans le sens de la longueur.\nPlacer les bananes sur une plaque de cuisson, arroser de miel et saupoudrer de cannelle.\nFaire cuire au four pendant 5-7 minutes jusqu\'à ce qu\'elles soient dorées.\n', 3),
	(8, 'Porridge à la compote de pommes', 10, 'Faire chauffer le lait dans une casserole.\nAjouter les flocons d\'avoine et laisser cuire 3-4 minutes en remuant.\nAjouter la compote de pommes et le sucre, mélanger et servir.', 3),
	(9, 'Poêlée de légumes', 20, 'Couper tous les légumes en dés.\nFaire chauffer l\'huile d\'olive dans une poêle et y faire revenir l\'oignon.\nAjouter les autres légumes, saler, poivrer, et cuire 10-15 minutes jusqu\'à ce qu\'ils soient tendres.', 2),
	(10, 'Yogourt aux fruits', 5, 'Verser le yogourt dans un bol.\nAjouter les fruits frais coupés en morceaux.\nArroser de miel et servir.', 3),
	(11, 'Pâtes à la carbonara', 20, 'Cuire les pâtes, préparer la sauce, assembler les 2', 2);

-- Listage de la structure de table recettes. type_plat
CREATE TABLE IF NOT EXISTS `type_plat` (
  `idTypePlat` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTypePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recettes.type_plat : ~3 rows (environ)
INSERT INTO `type_plat` (`idTypePlat`, `nom`) VALUES
	(1, 'Entrée'),
	(2, 'Plat de résistance'),
	(3, 'Dessert');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
