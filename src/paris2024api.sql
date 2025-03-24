-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 mars 2025 à 13:30
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `paris2024api`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

DROP TABLE IF EXISTS `actualite`;
CREATE TABLE IF NOT EXISTS `actualite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `epreuve_id` bigint DEFAULT NULL,
  `sport_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKru8ghq4fqvk3d54x76l8aiusg` (`epreuve_id`),
  KEY `FKnkfcodksmad3f7h7qi29avyow` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id`, `contenu`, `date`, `titre`, `epreuve_id`, `sport_id`) VALUES
(1, 'Usain Bolt remporte le 100m avec un nouveau record du monde.', '2008-08-16', 'Usain Bolt en or à Pékin', 1, 5),
(2, 'L’équipe de France de football féminin se qualifie pour la finale.', '2021-07-30', 'Les Bleues en finale des JO', 5, 1),
(3, 'Novak Djokovic s’impose en finale du tournoi olympique de tennis.', '2021-07-31', 'Djokovic décroche l’or', 8, 3),
(4, 'Le relais 4x100m américain établit un nouveau record olympique.', '2012-08-10', 'Record pour les USA en relais', 10, 5),
(5, 'La finale de basketball masculin voit les États-Unis s’imposer face à l’Espagne.', '2012-08-12', 'Les USA champions en basket', 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
CREATE TABLE IF NOT EXISTS `athlete` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `datenaiss` date DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `pays_id` bigint DEFAULT NULL,
  `sport_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq8a4808wpeoko5u6ev7yutjhe` (`pays_id`),
  KEY `FKd8yqmh4gktyl51404sw4hrmmr` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `athlete`
--

INSERT INTO `athlete` (`id`, `datenaiss`, `nom`, `prenom`, `pays_id`, `sport_id`) VALUES
(1, '1986-08-21', 'Bolt', 'Usain', 5, 5),
(2, '1987-06-17', 'Durant', 'Kevin', 41, 2),
(3, '1981-06-30', 'Phelps', 'Michael', 67, 4),
(4, '1997-12-20', 'Mbappé', 'Kylian', 21, 1),
(5, '1981-05-22', 'Djokovic', 'Novak', 74, 3),
(6, '2002-06-07', 'Richardson', 'Sha’Carri', 21, 5),
(7, '1992-09-29', 'Biles', 'Simone', 50, 5),
(8, '1993-03-19', 'Antetokounmpo', 'Giannis', 64, 2),
(9, '1985-02-05', 'Ronaldo', 'Cristiano', 21, 1),
(15, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `athlete_epreuve`
--

DROP TABLE IF EXISTS `athlete_epreuve`;
CREATE TABLE IF NOT EXISTS `athlete_epreuve` (
  `athlete_id` bigint NOT NULL,
  `epreuve_id` bigint NOT NULL,
  KEY `FKfpn1sg56ees0b3h30byi4qdu9` (`epreuve_id`),
  KEY `FKokh54uqi149behrho1jonx5w5` (`athlete_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `athlete_epreuve`
--

INSERT INTO `athlete_epreuve` (`athlete_id`, `epreuve_id`) VALUES
(1, 1),
(1, 2),
(2, 6),
(3, 4),
(4, 4),
(5, 8),
(6, 1),
(7, 10),
(8, 6),
(9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `athlete_olympiade`
--

DROP TABLE IF EXISTS `athlete_olympiade`;
CREATE TABLE IF NOT EXISTS `athlete_olympiade` (
  `athlete_id` bigint NOT NULL,
  `olympiade_id` bigint NOT NULL,
  KEY `FK6vnipv7nre9hyorqg83wwts5h` (`olympiade_id`),
  KEY `FK9asi5g5ajwqwny7kvplcbwrls` (`athlete_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `athlete_olympiade`
--

INSERT INTO `athlete_olympiade` (`athlete_id`, `olympiade_id`) VALUES
(1, 3),
(2, 6),
(3, 4),
(4, 5),
(5, 6),
(6, 6),
(7, 5),
(8, 4),
(9, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `sport_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqldn4sjm6k6ps1i4j6a8cuggp` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `nom`, `sport_id`) VALUES
(1, '100m', 5),
(2, '200m', 5),
(4, 'Football masculin', 1),
(5, 'Football féminin', 1),
(6, 'Basketball masculin', 2),
(7, 'Basketball féminin', 2),
(8, 'Simple hommes', 3),
(9, 'Simple dames', 3),
(10, 'Relais 4x100m', 5);

-- --------------------------------------------------------

--
-- Structure de la table `olympiade`
--

DROP TABLE IF EXISTS `olympiade`;
CREATE TABLE IF NOT EXISTS `olympiade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annee` int DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `pays_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb49xhy2kbok8iievugwgkewi8` (`pays_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `olympiade`
--

INSERT INTO `olympiade` (`id`, `annee`, `numero`, `ville`, `pays_id`) VALUES
(1, 2000, 'XX', 'Sydney', 36),
(2, 2004, 'XXIV', 'Athènes', 30),
(3, 2008, 'XXVIII', 'Pékin', 20),
(4, 2012, 'XXXII', 'Londres', 40),
(5, 2016, 'XXXVI', 'Rio de Janeiro', 76),
(6, 2020, 'XXXX', 'Tokyo', 50);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'Afghanistan'),
(2, 'South Africa'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'Germany'),
(6, 'Andorra'),
(7, 'Angola'),
(8, 'Antigua and Barbuda'),
(9, 'Netherlands Antilles'),
(10, 'Saudi Arabia'),
(11, 'Argentina'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Australia'),
(15, 'Austria'),
(16, 'Azerbaijan'),
(17, 'Bahamas'),
(18, 'Bahrain'),
(19, 'Bangladesh'),
(20, 'Barbados'),
(21, 'Belarus'),
(22, 'Belgium'),
(23, 'Belize'),
(24, 'Benin'),
(25, 'Bermuda'),
(26, 'Bhutan'),
(27, 'Bolivia'),
(28, 'Bosnia and Herzegovina'),
(29, 'Botswana'),
(30, 'Brazil'),
(31, 'Brunei Darussalam'),
(32, 'Bulgaria'),
(33, 'Burkina Faso'),
(34, 'Burundi'),
(35, 'Cayman Islands'),
(36, 'Cambodia'),
(37, 'Cameroon'),
(38, 'Canada'),
(39, 'Cape Verde'),
(40, 'Central African Republic'),
(41, 'Chile'),
(42, 'People\'s Republic of China'),
(43, 'Cyprus'),
(44, 'Colombia'),
(45, 'Comoros'),
(46, 'Congo'),
(47, 'Democratic Republic of the Congo'),
(48, 'Cook Islands'),
(49, 'Republic of Korea'),
(50, 'Australasia (1908-1912)'),
(51, 'Bohemia (TCH since 1920)'),
(52, 'British Honduras'),
(53, 'British West Indies (BAR, JAM'),
(54, 'Burma (until 1989)'),
(55, 'Costa Rica'),
(56, 'Czechoslovakia'),
(57, 'Democratic Republic of Yemen'),
(58, 'Federal Republic of Germany (1950-1990)'),
(59, 'German Democratic Republic (1955-1990)'),
(60, 'Independent Participant'),
(61, 'Independent Olympic Athlete'),
(62, 'Mixed NOCs'),
(63, 'Mixed team'),
(64, 'Other countries'),
(65, 'Rhodesia (until 1968)'),
(66, 'Russia'),
(67, 'Serbia - Yugoslavia YUG since'),
(68, 'Serbia and Montenegro'),
(69, 'Unified Team (ex USSR)'),
(70, 'United Team of Germany (1956,1960,1964)'),
(71, 'USSR'),
(72, 'Yugoslavia'),
(73, 'Zaire (1971-1997)'),
(74, 'Côte d\'Ivoire'),
(75, 'Croatia'),
(76, 'Cuba'),
(77, 'Denmark'),
(78, 'Djibouti'),
(79, 'Dominican Republic'),
(80, 'Dominica'),
(81, 'Egypt'),
(82, 'El Salvador'),
(83, 'United Arab Emirates'),
(84, 'Ecuador'),
(85, 'Eritrea'),
(86, 'Spain'),
(87, 'Estonia'),
(88, 'United States of America'),
(89, 'Ethiopia'),
(90, 'The Former Yugoslav Republic of Macedonia'),
(91, 'Fiji'),
(92, 'Finland'),
(93, 'France');

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id`, `nom`) VALUES
(1, 'Football'),
(2, 'Basketball'),
(3, 'Tennis'),
(4, 'Natation'),
(5, 'Athlétisme');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD CONSTRAINT `FKnkfcodksmad3f7h7qi29avyow` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`),
  ADD CONSTRAINT `FKru8ghq4fqvk3d54x76l8aiusg` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`);

--
-- Contraintes pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `FKd8yqmh4gktyl51404sw4hrmmr` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`),
  ADD CONSTRAINT `FKq8a4808wpeoko5u6ev7yutjhe` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);

--
-- Contraintes pour la table `athlete_epreuve`
--
ALTER TABLE `athlete_epreuve`
  ADD CONSTRAINT `FKfpn1sg56ees0b3h30byi4qdu9` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`),
  ADD CONSTRAINT `FKokh54uqi149behrho1jonx5w5` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);

--
-- Contraintes pour la table `athlete_olympiade`
--
ALTER TABLE `athlete_olympiade`
  ADD CONSTRAINT `FK6vnipv7nre9hyorqg83wwts5h` FOREIGN KEY (`olympiade_id`) REFERENCES `olympiade` (`id`),
  ADD CONSTRAINT `FK9asi5g5ajwqwny7kvplcbwrls` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `FKqldn4sjm6k6ps1i4j6a8cuggp` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`);

--
-- Contraintes pour la table `olympiade`
--
ALTER TABLE `olympiade`
  ADD CONSTRAINT `FKb49xhy2kbok8iievugwgkewi8` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
