-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 19 jan. 2022 à 09:28
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `voitures`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voiture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BCA76ED395` (`user_id`),
  KEY `IDX_67F068BC181A8BA` (`voiture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `user_id`, `contenu`, `voiture_id`) VALUES
(1, 3, 'commentaire de user 1', 1),
(2, 4, 'commentaire de user 2', 2),
(3, 1, 'un commentaires', 1),
(4, 1, 'une autre commentaire', 1),
(5, 1, 'Je commente', 6),
(6, 1, 'Je commente', 17),
(7, 1, 'Un commentaire', 2),
(8, 1, 'comment', 3),
(9, 2, 'something', 3),
(10, 2, 'un truc', 3),
(11, 3, 'commentaire', 11),
(12, 3, 'une autre commentaire', 13),
(13, 3, 'Je commente', 1),
(14, 3, 'je commente', 7),
(15, 3, 'Je commente la Ford', 24),
(16, 3, 'some commentaire', 18),
(17, 6, 'commentaire de user', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220118140905', '2022-01-18 14:09:21', 426),
('DoctrineMigrations\\Version20220118141239', '2022-01-18 14:13:12', 331),
('DoctrineMigrations\\Version20220118141821', '2022-01-18 14:24:07', 313),
('DoctrineMigrations\\Version20220118142736', '2022-01-18 14:27:43', 2281),
('DoctrineMigrations\\Version20220118143053', '2022-01-18 14:31:01', 1802),
('DoctrineMigrations\\Version20220118143824', '2022-01-18 14:38:50', 953),
('DoctrineMigrations\\Version20220118150344', '2022-01-18 15:03:56', 1534);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D6499D419299` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `login`, `password`) VALUES
(1, 1, 'superadmin', 'superadmin'),
(2, 2, 'admin', 'admin'),
(3, 3, 'user1', 'user1'),
(4, 3, 'user2', 'user2'),
(5, 3, 'user3', 'user3'),
(6, 3, 'user', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'superadmin'),
(2, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `nom`) VALUES
(1, 'Abarth'),
(2, 'Alfa Romeo'),
(3, 'Alpine'),
(4, 'Aston Martin'),
(5, 'Audi'),
(6, 'Bentley'),
(7, 'BMW'),
(8, 'Bollore'),
(9, 'BRP'),
(10, 'Bugatti'),
(11, 'Cadillac'),
(12, 'Caterham'),
(13, 'Chevrolet'),
(14, 'Chrysler'),
(15, 'Citroën'),
(16, 'Cupra'),
(17, 'Dacia'),
(18, 'Daihatsu'),
(19, 'Dodge'),
(20, 'DS'),
(21, 'Ferrari'),
(22, 'Fiat'),
(23, 'Fisker'),
(24, 'Ford'),
(25, 'G M C'),
(26, 'Honda'),
(27, 'Hummer'),
(28, 'Hyundai'),
(29, 'Infiniti'),
(30, 'Isuzu');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC181A8BA` FOREIGN KEY (`voiture_id`) REFERENCES `voiture` (`id`),
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6499D419299` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
