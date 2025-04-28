-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 23 avr. 2025 à 10:30
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `matysazurimmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

DROP TABLE IF EXISTS `appartement`;
CREATE TABLE IF NOT EXISTS `appartement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `nb_piece` int(11) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `batiment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5kn64l7l2m25kkryy4n50ikyb` (`batiment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `description`, `nb_piece`, `numero`, `surface`, `batiment_id`) VALUES
(1, 'Appartement reservé à l\'élite', 30, 'MASTER-99', 800, 1),
(2, 'Appartement reservé aux VIP', 15, 'HYPER-77', 400, 1),
(3, 'Appartement ouvert aux personnes d\'exception', 5, 'SUPER-15', 100, 1),
(4, 'Appartement ordinaire', 3, 'BASE-01', 65, 1),
(5, 'Appartement de Cornelia', 2, '01', 35, 2);

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

DROP TABLE IF EXISTS `batiment`;
CREATE TABLE IF NOT EXISTS `batiment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `adresse`, `ville`) VALUES
(1, '14 Rue de la Tour Prismatique', 'Illumis'),
(2, '22 Rue de la Tour Maîtrise', 'Yantreizh');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `locataire_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ahw6ibj07960n52ulfdoc96g` (`appartement_id`),
  KEY `FKp7hols6tlsatgb3ve32kbn5sv` (`locataire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

DROP TABLE IF EXISTS `locataire`;
CREATE TABLE IF NOT EXISTS `locataire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_paiement` date DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `contrat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10c1k2kn8ywg4xtmhghiorrix` (`contrat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

DROP TABLE IF EXISTS `reparation`;
CREATE TABLE IF NOT EXISTS `reparation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_reparation` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `societe` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6956f2e6c8hx646pcw3g8qw6w` (`appartement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `FK5kn64l7l2m25kkryy4n50ikyb` FOREIGN KEY (`batiment_id`) REFERENCES `batiment` (`id`);

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FK1ahw6ibj07960n52ulfdoc96g` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKp7hols6tlsatgb3ve32kbn5sv` FOREIGN KEY (`locataire_id`) REFERENCES `locataire` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK10c1k2kn8ywg4xtmhghiorrix` FOREIGN KEY (`contrat_id`) REFERENCES `contrat` (`id`);

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `FK6956f2e6c8hx646pcw3g8qw6w` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
