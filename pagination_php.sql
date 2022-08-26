-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 août 2022 à 15:52
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pagination_php`
--

-- --------------------------------------------------------

--
-- Structure de la table `offres`
--

DROP TABLE IF EXISTS `offres`;
CREATE TABLE IF NOT EXISTS `offres` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `date_publication` varchar(255) DEFAULT NULL,
  `date_maj` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `intitule` text,
  `ville` varchar(255) DEFAULT NULL,
  `type_contrat` text,
  `type_metier` text,
  `nom_entreprise` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `offres`
--

INSERT INTO `offres` (`id`, `image`, `date_publication`, `date_maj`, `reference`, `intitule`, `ville`, `type_contrat`, `type_metier`, `nom_entreprise`, `description`) VALUES
(1, NULL, '12/03/22', '10/08/22', '17', 'Développeur', 'Paris', 'CDD', 'Informatique', 'Auctor PC', 'Nous recrutons un développeur...'),
(2, NULL, '09/06/22', '12/23/21', '23', 'Développeur', 'Cergy', 'Alternance', 'Informatique', 'Aenean Corporation', 'recrutons un développeur...'),
(3, NULL, '10/05/21', '05/01/22', '79', 'Développeur', 'Paris', 'CDI', 'Informatique', 'Magnis Dis Parturient Ltd', 'recrutons un développeur...'),
(4, NULL, '05/03/22', '04/10/22', '5', 'Développeur', 'Sarcelles', 'CDI', 'Informatique', 'Rutrum Lorem Inc.', 'recrutons un développeur...'),
(5, NULL, '05/08/22', '07/06/22', '91', 'Développeur', 'Sarcelles', 'CDD', 'Informatique', 'At Libero Inc.', 'recrutons un développeur...'),
(6, 'https://naver.com', '12/28/21', '08/25/23', '90', 'Développeur', 'Tours', 'Alternance', 'Informatique', 'Integer LLC', 'Nous recrutons un développeur...'),
(7, 'https://reddit.com', '04/28/22', '03/21/23', '13', 'Développeur', 'Cergy', 'CDI', 'Informatique', 'Euismod Urna Nullam Foundation', 'Nous recrutons un développeur...'),
(8, 'https://bbc.co.uk', '01/20/23', '04/05/23', '79', 'Développeur', 'Paris', 'CDD', 'Informatique', 'Donec Dignissim Institute', 'Nous recrutons un développeur...'),
(9, 'https://youtube.com', '02/25/22', '02/01/23', '83', 'Développeur', 'Tours', 'Alternance', 'Informatique', 'Sociis Natoque Penatibus Associates', 'Nous recrutons un développeur...'),
(10, 'http://facebook.com', '04/11/22', '07/09/23', '5', 'Développeur', 'Paris', 'CDD', 'Informatique', 'Pharetra Sed Foundation', 'Nous recrutons un développeur...'),
(11, 'https://ebay.com', '10/24/22', '09/25/22', '31', 'Développeur', 'Cergy', 'Alternance', 'Informatique', 'Iaculis Enim Sit Institute', 'recrutons un développeur...'),
(12, 'https://baidu.com', '04/23/23', '06/19/22', '89', 'Développeur', 'Cergy', 'CDI', 'Informatique', 'Et Ultrices Corporation', 'Nous recrutons un développeur...'),
(13, 'https://youtube.com', '11/03/22', '05/11/22', '23', 'Développeur', 'Sarcelles', 'CDI', 'Informatique', 'Nulla Foundation', 'recrutons un développeur...'),
(14, 'http://yahoo.com', '05/27/23', '05/09/23', '59', 'Développeur', 'Sarcelles', 'Alternance', 'Informatique', 'Gravida Corp.', 'recrutons un développeur...'),
(15, 'https://baidu.com', '11/03/21', '07/30/23', '13', 'Développeur', 'Paris', 'CDI', 'Informatique', 'Egestas Ligula Corp.', 'Nous recrutons un développeur...'),
(16, 'https://guardian.co.uk', '05/27/23', '01/28/22', '61', 'Développeur', 'Tours', 'CDD', 'Informatique', 'Hendrerit Consectetuer LLP', 'recrutons un développeur...'),
(17, 'http://pinterest.com', '02/04/22', '11/17/21', '73', 'Développeur', 'Cergy', 'Alternance', 'Informatique', 'Eu Limited', 'Nous recrutons un développeur...'),
(18, 'https://yahoo.com', '06/22/22', '08/06/22', '17', 'Développeur', 'Paris', 'CDI', 'Informatique', 'Risus Duis A Limited', 'recrutons un développeur...'),
(19, 'https://yahoo.com', '07/01/23', '11/03/21', '72', 'Développeur', 'Tours', 'Alternance', 'Informatique', 'Eu Turpis Limited', 'recrutons un développeur...'),
(20, 'https://whatsapp.com', '02/13/22', '08/25/22', '53', 'Développeur', 'Tours', 'CDI', 'Informatique', 'Et Euismod LLC', 'recrutons un développeur...'),
(21, 'http://nytimes.com', '05/02/22', '05/15/22', '5', 'Développeur', 'Paris', 'CDD', 'Informatique', 'Quisque Tincidunt Inc.', 'Nous recrutons un développeur...'),
(22, 'https://zoom.us', '04/10/23', '07/15/22', '7', 'Développeur', 'Sarcelles', 'CDI', 'Informatique', 'Mauris Quis Turpis LLC', 'recrutons un développeur...'),
(23, 'http://whatsapp.com', '12/02/21', '10/08/21', '71', 'Développeur', 'Paris', 'CDD', 'Informatique', 'Morbi Corporation', 'recrutons un développeur...'),
(24, 'https://twitter.com', '06/20/22', '04/21/23', '67', 'Développeur', 'Cergy', 'CDI', 'Informatique', 'Libero PC', 'Nous recrutons un développeur...'),
(25, 'http://yahoo.com', '02/09/23', '12/10/21', '19', 'Développeur', 'Cergy', 'CDD', 'Informatique', 'Donec Porttitor Industries', 'Nous recrutons un développeur...');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
