-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `clues`;
CREATE TABLE `clues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT 'Le nom de l indice',
  `riddle_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riddle_id` (`riddle_id`),
  CONSTRAINT `clues_ibfk_1` FOREIGN KEY (`riddle_id`) REFERENCES `riddles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `theme_code` int(10) NOT NULL,
  KEY `theme_code` (`theme_code`),
  KEY `id` (`id`),
  KEY `name` (`name`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`theme_code`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `riddles`;
CREATE TABLE `riddles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer` varchar(60) NOT NULL COMMENT 'La réponse de l énigme',
  `name` varchar(60) NOT NULL COMMENT 'Le nom de l énigme',
  `theme_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_code` (`theme_code`),
  CONSTRAINT `riddles_ibfk_1` FOREIGN KEY (`theme_code`) REFERENCES `themes` (`id`),
  CONSTRAINT `riddles_ibfk_2` FOREIGN KEY (`theme_code`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `riddles` (`id`, `answer`, `name`, `theme_code`) VALUES
(1,	'Baby-Sittor',	'Je suis comédie américaine pour enfant',2),
(2,	'Koala',	'Je suis une espèce de marsupial',1),
(3,	'Mozart',	'Je suis un musicien célèbre',3),
(4,	'Fight Club',	'Un film américano-allemand',2),
(5,	'Nickelback',	'Je suis un groupe de rock alternatif canadien',3),
(6,	'Tortue Pelomedusa',	'Je suis une créature vivant sous l’eau',1),
(7,	'Mouette',	'Je suis une créature vivant sur terre et dans les airs',1),
(8,	'Poisson Rouge',	'Je suis une créature vivant sous l’eau',1),
(9,	'Intouchable',	'Je suis une comédie dramatique française',2),
(10,	'Hyène',	'Je suis un mammifère vivant en meute',1),
(11,	'Requin Bouledogue',	'Je suis un poisson cartilagineux',1),
(12,	'La 25e heure',	'Je suis un drame américain sorti en 2002',2),
(13,	'Mangouste',	'Je suis un animal présent en Asie, Afrique, Europe du Sud et aux Caraïbes',1),
(14,	'Jacques Brel',	'Je suis un chanteur né en 1929',3),
(15,	'Forrest Gump',	'Je suis une comédie dramatique sortie en 1994',2),
(16,	'Le Roi Lion',	'Je suis un long métrage d animation sorti en 1994',2),
(17,	'Phenix',	'Je suis un animal vénéré',	1),
(23,	'Hibou',	'Dans la mythologie grecque, je suis également l interprète d Atropos',1),
(26,	'Pokemon',	'Je suis une franchise créée par Satoshi Tajiri .',2);

DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Le nom du type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(00) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('joueur','administrateur') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2023-10-08 09:01:56
