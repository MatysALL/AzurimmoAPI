-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 mars 2025 à 13:25
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
-- Base de données : `paris2024`
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
  KEY `FKru8ghq4fqvk3d54x76l8aiusg` (`epreuve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id`, `contenu`, `date`, `titre`, `epreuve_id`, `sport_id`) VALUES
(1, 'Usain Bolt vise un nouveau record.', '2024-07-15', 'Bolt prêt pour Paris', 1, 1),
(2, 'Katie Ledecky impressionne à l\'entrainement.', '2024-07-16', 'Ledecky en forme', 4, 2),
(3, 'LeBron James de retour aux JO.', '2024-07-17', 'LeBron veut l\'or', 7, 4),
(4, 'Usain traarza vise un nouveau record.', '2024-07-15', 'Btttttt', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
CREATE TABLE IF NOT EXISTS `athlete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `datenaiss` date DEFAULT NULL,
  `pays_id` int DEFAULT NULL,
  `sport_id` int DEFAULT NULL,
  `urlImage` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_athlete_pays` (`pays_id`),
  KEY `FK_athlete_sport` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `athlete`
--

INSERT INTO `athlete` (`id`, `nom`, `prenom`, `datenaiss`, `pays_id`, `sport_id`, `urlImage`) VALUES
(1, 'AGBEGNENOU', 'Clarisseo', '1992-10-25', 93, 1, NULL),
(2, 'Rinner', 'Teddy', '1989-04-07', 93, 1, NULL),
(11, 'FLORENT', 'Manaudou', NULL, 3, 2, NULL),
(12, 'BOLT', 'Usain', '1986-08-21', 159, 1, NULL),
(13, 'LEDECKY', 'Katie', '1997-03-17', 88, 2, NULL),
(14, 'ONO', 'Shohei', '1992-02-03', 120, 3, NULL),
(15, 'JAMES', 'LeBron', '1984-12-30', 88, 4, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `athlete_epreuve`
--

DROP TABLE IF EXISTS `athlete_epreuve`;
CREATE TABLE IF NOT EXISTS `athlete_epreuve` (
  `athlete_id` bigint NOT NULL,
  `epreuve_id` bigint NOT NULL,
  KEY `FKfpn1sg56ees0b3h30byi4qdu9` (`epreuve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `athlete_epreuve`
--

INSERT INTO `athlete_epreuve` (`athlete_id`, `epreuve_id`) VALUES
(12, 1),
(12, 3),
(13, 4),
(14, 5),
(14, 6),
(15, 7);

-- --------------------------------------------------------

--
-- Structure de la table `athlete_olympiade`
--

DROP TABLE IF EXISTS `athlete_olympiade`;
CREATE TABLE IF NOT EXISTS `athlete_olympiade` (
  `athlete_id` int NOT NULL,
  `olympiade_id` int NOT NULL,
  PRIMARY KEY (`athlete_id`,`olympiade_id`),
  KEY `FK_ao_olympiade` (`olympiade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `athlete_olympiade`
--

INSERT INTO `athlete_olympiade` (`athlete_id`, `olympiade_id`) VALUES
(12, 9),
(1, 10),
(2, 10),
(12, 10),
(13, 10),
(1, 11),
(2, 11),
(13, 11),
(14, 11),
(15, 11);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `sport_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `nom`, `sport_id`) VALUES
(1, '100m Homme', 1),
(2, '200m Femme', 1),
(3, 'Relais 4x100m', 1),
(4, '100m Nage Libre', 2),
(5, '-78kg Femme', 3),
(6, '+100kg Homme', 3),
(7, 'Tournoi Basket Homme', 4);

-- --------------------------------------------------------

--
-- Structure de la table `olympiade`
--

DROP TABLE IF EXISTS `olympiade`;
CREATE TABLE IF NOT EXISTS `olympiade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `annee` int NOT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `pays_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_olympiade_pays` (`pays_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `olympiade`
--

INSERT INTO `olympiade` (`id`, `numero`, `annee`, `ville`, `pays_id`) VALUES
(1, 'XXIII', 1984, 'Los Angeles', 88),
(2, 'XXIV', 1988, 'Séoul', 178),
(3, 'XXV', 1992, 'Barcelone', 86),
(4, 'XXVI', 1996, 'Atlanta', 88),
(5, 'XXVII', 2000, 'Sydney', 14),
(6, 'XXVIII', 2004, 'Athènes', 99),
(7, 'XXIX', 2008, 'Pékin', 42),
(8, 'XXX', 2012, 'Londres', 98),
(9, 'XXXI', 2016, 'Rio', 30),
(10, 'XXXII', 2020, 'Tokyo', 120),
(11, 'XXXIII', 2024, 'Paris', 93);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(7) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `code`, `nom`) VALUES
(1, 'AFG', 'Afghanistan'),
(2, 'RSA', 'South Africa'),
(3, 'ALB', 'Albania'),
(4, 'ALG', 'Algeria'),
(5, 'GER', 'Germany'),
(6, 'AND', 'Andorra'),
(7, 'ANG', 'Angola'),
(8, 'ANT', 'Antigua and Barbuda'),
(9, 'AHO', 'Netherlands Antilles'),
(10, 'KSA', 'Saudi Arabia'),
(11, 'ARG', 'Argentina'),
(12, 'ARM', 'Armenia'),
(13, 'ARU', 'Aruba'),
(14, 'AUS', 'Australia'),
(15, 'AUT', 'Austria'),
(16, 'AZE', 'Azerbaijan'),
(17, 'BAH', 'Bahamas'),
(18, 'BRN', 'Bahrain'),
(19, 'BAN', 'Bangladesh'),
(20, 'BAR', 'Barbados'),
(21, 'BLR', 'Belarus'),
(22, 'BEL', 'Belgium'),
(23, 'BIZ', 'Belize'),
(24, 'BEN', 'Benin'),
(25, 'BER', 'Bermuda'),
(26, 'BHU', 'Bhutan'),
(27, 'BOL', 'Bolivia'),
(28, 'BIH', 'Bosnia and Herzegovina'),
(29, 'BOT', 'Botswana'),
(30, 'BRA', 'Brazil'),
(31, 'BRU', 'Brunei Darussalam'),
(32, 'BUL', 'Bulgaria'),
(33, 'BUR', 'Burkina Faso'),
(34, 'BDI', 'Burundi'),
(35, 'CAY', 'Cayman Islands'),
(36, 'CAM', 'Cambodia'),
(37, 'CMR', 'Cameroon'),
(38, 'CAN', 'Canada'),
(39, 'CPV', 'Cape Verde'),
(40, 'CAF', 'Central African Republic'),
(41, 'CHI', 'Chile'),
(42, 'CHN', 'People\'s Republic of China'),
(43, 'CYP', 'Cyprus'),
(44, 'COL', 'Colombia'),
(45, 'COM', 'Comoros'),
(46, 'CGO', 'Congo'),
(47, 'COD', 'Democratic Republic of the Congo'),
(48, 'COK', 'Cook Islands'),
(49, 'KOR', 'Republic of Korea'),
(50, 'ANZ', 'Australasia (1908-1912)'),
(51, 'BOH', 'Bohemia (TCH since 1920)'),
(52, 'HBR', 'British Honduras'),
(53, 'BWI', 'British West Indies (BAR, JAM'),
(54, 'BIR', 'Burma (until 1989)'),
(55, 'CRC', 'Costa Rica'),
(56, 'TCH', 'Czechoslovakia'),
(57, 'YMD', 'Democratic Republic of Yemen'),
(58, 'FRG', '\"Federal Republic of Germany (1950-1990, &quot'),
(59, 'GDR', 'German Democratic Republic (1955-1990, '),
(60, 'IOP', 'Independant Participant'),
(61, 'IOA', 'Independent Olympic Athlete'),
(62, 'MIX', 'Mixed NOCs'),
(63, 'ZZX', 'Mixed team'),
(64, 'ZZZ', 'Other countries'),
(65, 'RHO', 'Rhodesia (until 1968)'),
(66, 'RU1', 'Russia'),
(67, 'SER', 'Serbia - Yougoslavie YUG since'),
(68, 'SCG', 'Serbia and Montenegro'),
(69, 'EUN', 'Unified Team (ex USSR)'),
(70, 'EUA', 'United Team of Germany (1956,1960,1964)'),
(71, 'URS', 'USSR'),
(72, 'YUG', 'Yugoslavia'),
(73, 'ZAI', 'Zaire (1971-1997)'),
(74, 'CIV', '\"C&#244'),
(75, 'CRO', 'Croatia'),
(76, 'CUB', 'Cuba'),
(77, 'DEN', 'Denmark'),
(78, 'DJI', 'Djibouti'),
(79, 'DOM', 'Dominican Republic'),
(80, 'DMA', 'Dominica'),
(81, 'EGY', 'Egypt'),
(82, 'ESA', 'El Salvador'),
(83, 'UAE', 'United Arab Emirates'),
(84, 'ECU', 'Ecuador'),
(85, 'ERI', 'Eritrea'),
(86, 'ESP', 'Spain'),
(87, 'EST', 'Estonia'),
(88, 'USA', 'United States of America'),
(89, 'ETH', 'Ethiopia'),
(90, 'MKD', 'The Former Yugoslav Republic of Macedonia'),
(91, 'FIJ', 'Fiji'),
(92, 'FIN', 'Finland'),
(93, 'FRA', 'France'),
(94, 'GAB', 'Gabon'),
(95, 'GAM', 'Gambia'),
(96, 'GEO', 'Georgia'),
(97, 'GHA', 'Ghana'),
(98, 'GBR', 'Great Britain'),
(99, 'GRE', 'Greece'),
(100, 'GRN', 'Grenada'),
(101, 'GUM', 'Guam'),
(102, 'GUA', 'Guatemala'),
(103, 'GUI', 'Guinea'),
(104, 'GBS', 'Guinea-Bissau'),
(105, 'GEQ', 'Equatorial Guinea'),
(106, 'GUY', 'Guyana'),
(107, 'HAI', 'Haiti'),
(108, 'HON', 'Honduras'),
(109, 'HKG', 'Hong Kong, China'),
(110, 'HUN', 'Hungary'),
(111, 'IND', 'India'),
(112, 'INA', 'Indonesia'),
(113, 'IRI', 'Islamic Republic of Iran'),
(114, 'IRQ', 'Iraq'),
(115, 'IRL', 'Ireland'),
(116, 'ISL', 'Iceland'),
(117, 'ISR', 'Israel'),
(118, 'ITA', 'Italy'),
(119, 'JAM', 'Jamaica'),
(120, 'JPN', 'Japan'),
(121, 'JOR', 'Jordan'),
(122, 'KAZ', 'Kazakhstan'),
(123, 'KEN', 'Kenya'),
(124, 'KGZ', 'Kyrgyzstan'),
(125, 'KIR', 'Kiribati'),
(126, 'KUW', 'Kuwait'),
(127, 'LAO', 'Lao People\'s Democratic Republic'),
(128, 'LES', 'Lesotho'),
(129, 'LAT', 'Latvia'),
(130, 'LIB', 'Lebanon'),
(131, 'LBR', 'Liberia'),
(132, 'LBA', 'Libya'),
(133, 'LIE', 'Liechtenstein'),
(134, 'LTU', 'Lithuania'),
(135, 'LUX', 'Luxembourg'),
(136, 'MAD', 'Madagascar'),
(137, 'MAS', 'Malaysia'),
(138, 'MAW', 'Malawi'),
(139, 'MDV', 'Maldives'),
(140, 'MLI', 'Mali'),
(141, 'MLT', 'Malta'),
(142, 'MAR', 'Morocco'),
(143, 'MHL', 'Marshall Islands'),
(144, 'MRI', 'Mauritius'),
(145, 'MTN', 'Mauritania'),
(146, 'MEX', 'Mexico'),
(147, 'FSM', 'Federated States of Micronesia'),
(148, 'MDA', 'Republic of Moldova'),
(149, 'MON', 'Monaco'),
(150, 'MGL', 'Mongolia'),
(151, 'MNE', 'Montenegro'),
(152, 'MOZ', 'Mozambique'),
(153, 'MYA', 'Myanmar (ex Burma until 1989)'),
(154, 'NAM', 'Namibia'),
(155, 'NRU', 'Nauru'),
(156, 'NEP', 'Nepal'),
(157, 'NCA', 'Nicaragua'),
(158, 'NIG', 'Niger'),
(159, 'NGR', 'Nigeria'),
(160, 'NOR', 'Norway'),
(161, 'NZL', 'New Zealand'),
(162, 'OMA', 'Oman'),
(163, 'UGA', 'Uganda'),
(164, 'UZB', 'Uzbekistan'),
(165, 'PAK', 'Pakistan'),
(166, 'PLW', 'Palau'),
(167, 'PLE', 'Palestine'),
(168, 'PAN', 'Panama'),
(169, 'PNG', 'Papua New Guinea'),
(170, 'PAR', 'Paraguay'),
(171, 'NED', 'Netherlands'),
(172, 'PER', 'Peru'),
(173, 'PHI', 'Philippines'),
(174, 'POL', 'Poland'),
(175, 'PUR', 'Puerto Rico'),
(176, 'POR', 'Portugal'),
(177, 'QAT', 'Qatar'),
(178, 'PRK', 'Democratic People\'s Republic of Korea'),
(179, 'ROU', 'Romania'),
(180, 'RUS', 'Russian Federation'),
(181, 'RWA', 'Rwanda'),
(182, 'SKN', 'Saint Kitts and Nevis'),
(183, 'LCA', 'Saint Lucia'),
(184, 'SMR', 'San Marino'),
(185, 'VIN', 'St Vincent and the Grenadines'),
(186, 'SOL', 'Solomon Islands'),
(187, 'SAM', 'Samoa (until 1996 Western Samoa)'),
(188, 'ASA', 'American Samoa'),
(189, 'STP', 'Sao Tome and Principe'),
(190, 'SEN', 'Senegal'),
(191, 'SRB', 'Serbia'),
(192, 'SEY', 'Seychelles'),
(193, 'SLE', 'Sierra Leone'),
(194, 'SIN', 'Singapore'),
(195, 'SVK', 'Slovakia'),
(196, 'SLO', 'Slovenia'),
(197, 'SOM', 'Somalia'),
(198, 'SUD', 'Sudan'),
(199, 'SRI', 'Sri Lanka'),
(200, 'SWE', 'Sweden'),
(201, 'SUI', 'Switzerland'),
(202, 'SUR', 'Suriname'),
(203, 'SWZ', 'Swaziland'),
(204, 'SYR', 'Syrian Arab Republic'),
(205, 'TJK', 'Tajikistan'),
(206, 'TPE', 'Chinese Taipei'),
(207, 'TAN', 'United Republic of Tanzania'),
(208, 'CHA', 'Chad'),
(209, 'CZE', 'Czech Republic'),
(210, 'THA', 'Thailand'),
(211, 'TLS', 'Democratic Republic of Timor-Leste'),
(212, 'TOG', 'Togo'),
(213, 'TGA', 'Tonga'),
(214, 'TTO', 'Trinidad and Tobago'),
(215, 'TUN', 'Tunisia'),
(216, 'TKM', 'Turkmenistan'),
(217, 'TUR', 'Turkey'),
(218, 'TUV', 'Tuvalu'),
(219, 'UKR', 'Ukraine'),
(220, 'URU', 'Uruguay'),
(221, 'VAN', 'Vanuatu'),
(222, 'VEN', 'Venezuela'),
(223, 'IVB', 'Virgin Islands, British'),
(224, 'ISV', 'Virgin Islands, US'),
(225, 'VIE', 'Vietnam'),
(226, 'YEM', 'Yemen'),
(227, 'ZAM', 'Zambia'),
(228, 'ZIM', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `id` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id`, `nom`) VALUES
(1, 'Judo'),
(2, 'Natation'),
(3, 'Athlétisme'),
(4, 'Basket-ball');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD CONSTRAINT `FKru8ghq4fqvk3d54x76l8aiusg` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`);

--
-- Contraintes pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `FK_athlete_pays` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `FK_athlete_sport` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`);

--
-- Contraintes pour la table `athlete_epreuve`
--
ALTER TABLE `athlete_epreuve`
  ADD CONSTRAINT `FKfpn1sg56ees0b3h30byi4qdu9` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`);

--
-- Contraintes pour la table `athlete_olympiade`
--
ALTER TABLE `athlete_olympiade`
  ADD CONSTRAINT `FK_ao_athlete` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `FK_ao_olympiade` FOREIGN KEY (`olympiade_id`) REFERENCES `olympiade` (`id`);

--
-- Contraintes pour la table `olympiade`
--
ALTER TABLE `olympiade`
  ADD CONSTRAINT `FK_olympiade_pays` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
