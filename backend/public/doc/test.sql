-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `clues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Le nom de l indice',
  `riddle_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riddle_id` (`riddle_id`),
  CONSTRAINT `clues_ibfk_1` FOREIGN KEY (`riddle_id`) REFERENCES `riddles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8mb4;

INSERT INTO `clues` (`id`, `name`, `riddle_id`) VALUES
(1,	'J’ai été produit en 2005 par Walt Disney Pictures',	1),
(2,	'Mon personnage principal est Shane Wolfe un Navy Seal',	1),
(3,	'Je fais mention du film la mélodie du bonheur',	1),
(4,	'L’acteur principal est du film est Vin Diesel',	1),
(5,	'Mon titre est synonyme d’un métier',	1),
(6,	'J’ai un petit corps trapu, des membres courts et des grandes oreilles rondes',	2),
(7,	'Je peux peser jusqu’à  5 kilos et mesurer 85 cm ',	2),
(8,	'Je possède une fourrure laineuse marron gris argenté',	2),
(9,	'Je suis étroitement lié à l eucalyptus',	2),
(10,	'Je dors parfois jusqu’à 20h par jour',	2),
(11,	'Je suis autrichien',	3),
(12,	'Je fais partie de l école classique viennoise',	3),
(13,	'Mon nom est synonyme de prodige',	3),
(14,	'Je me produis en public dès l âge de sept ans à travers l Europe',	3),
(15,	'Je suis un film qui est sortie en 1999',	4),
(16,	'Je suis un thriller psychologique',	4),
(17,	'À ma sortie, je suis  un échec commercial aux États-Unis mais je réalise de meilleures recettes au niveau international',	4),
(18,	'Je suis réalisé par David Fincher',	4),
(19,	'Les rôles principaux sont tenus par Edward Norton, Brad Pitt et Helena Bonham Carter',	4),
(20,	'Le personnage principal souffre d’insomnie chronique et s’invente un ami imaginaire',	4),
(21,	'J’ai été former en 1995',	5),
(22,	'J’ai fait 6 tournées mondiales',	5),
(23,	'J’ai vendu plus de 50 millions d albums à travers le monde',	5),
(24,	'A mes débuts je joue des reprises de chansons de Led Zeppelin et de Metallica',	5),
(25,	'Mon chanteur principal est Chad Kroeger',	5),
(26,	'J’ai chanté How You Reminde Me, Rockstar ou encore Photograph',	5),
(27,	'Je suis animal qui possède des ailes',	17),
(28,	'Je suis doté d une grande longévité',	17),
(29,	'Je suis unique',	17),
(30,	'On peut m appeler l\'oiseau de feu',	17),
(31,	'Je suis un animal mythique',	17),
(32,	'Je renais de mes cendres',	17),
(33,	'Je suis omnivore',	6),
(34,	'Ma période d’incubation est de 80 à 90 jours',	6),
(35,	'J’ai besoin d une température constante toute l année oscillant entre 25 et 30',	6),
(36,	'Je viens d’Afrique du sud et j’occupe principalement des petits bassins et mares stagnantes',	6),
(37,	'On peut me trouver dans le commerce animalier',	6),
(38,	'Je peux vivre une trentaine d’années',	6),
(39,	'Je possède une carapace et je peux mesurer jusqu’à 32,5 cm',	6),
(40,	'On m’appelle aussi la tortue à cou caché d’Afrique',	6),
(41,	'Je fais partie de la famille des Laridés',	7),
(42,	'J’ai un cri très rauque et bruit',	7),
(43,	'Je vis et me nourris en colonies',	7),
(44,	'Je suis la plupart du temps blanche avec un bec orange',	7),
(45,	'On peut dire que je suis tridactyle, atricille, argentée ou rieuse',	7),
(46,	'Je suis un oiseau emblématique des côtes françaises',	7),
(47,	'Je mesure en moyenne 20 cm mais mon record est de 35 cm',	8),
(48,	'Ma présence permet d’éviter la présence des moustiques',	8),
(49,	'Je vis dans les eaux calmes d’Europe et de Chine',	8),
(50,	'Mon espérance de vie est de 30 ans mais mon record est de 43 ans',	8),
(51,	'J\'ai également été poète, acteur et réalisateur belge',	14),
(53,	'Je fait partie des icônes de la chanson française',	14),
(54,	'  Parmi mes titres : Ne me quitte pas, Amsterdam',	14),
(55,	'Je suis une comédie sortie en 2011',	9),
(56,	'L\'histoire est inspirée de la vie de Philippe Pozzo di Borgo ',	9),
(57,	'J\'ai été réaliser par  Olivier Nakache et Éric Toledano',	9),
(58,	'Les acteurs principaux sont Omar Sy et François Cluzet',	9),
(59,	'  Mon cri ressemble à un rire désagréable',	10),
(60,	'On me trouve en Afrique, principalement dans la savane et près de points d\'eau.',	10),
(61,	'Je chasse en bande',	10),
(62,	'Selon mon espèce je peux mesurer de 95 cm à 165 cm ',	10),
(63,	'Je fait parti de la famille des Carcharhinidés.',	11),
(64,	'Je suis pêché pour ma chair, mon cuir ou mon foie.',	11),
(65,	'Ma taille maximale est de 3,40 m de longueur pour 220 kg',	11),
(66,	'Je suis carnivore',	13),
(67,	'Je suis un animal solitaire mais je peux vivre parfois en groupe',	13),
(68,	'Un je suis un personnage du Disney Le Roi Lion',	13),
(69,	'Je suis nocturne',	23),
(70,	'Mes grands yeux scrutateurs et mon mode de vie « en retraite », sont vecteur de nombreuses superstitions',	23),
(71,	'On dit que je « hue » ou « hulule ».',	23),
(72,	'J\'ai été réaliser par  Spike Lee.',	12),
(73,	'Je suis une adaptation du premier roman de David Benioff, publié en 2001',	12),
(74,	'J\'ai été tourné dans cinq arrondissements de New York',	12),
(75,	'Le personnage principal de mon histoire est jouer par Edward Norton',	12),
(76,	' J\'ai été réalisée par Robert Zemeckis',	15),
(77,	'Je suis une adaptation du roman du même nom de l\'écrivain Winston Groom, paru en 1986.',	15),
(78,	'Le film relate la vie mouvementée d\'un personnage simple d\'esprit » originaire de l\'Alabama ',	15),
(79,	'J\'ai été distingué par six Oscars lors de la cérémonie de 1995',	15),
(80,	'Les acteurs principaux sont jouer par Tom Hanks et Robin Wright.',	15),
(81,	'Je suis un Disney.',	16),
(82,	'J\'ai été réaliser par Roger Allers et Rob Minkoff.',	16),
(83,	'L\'histoire se déroule dans la savane d\'Afrique le personnage découvre son futur royaume, la Terre des Lions ',	16),
(84,	'Les animaux du monde réel n\'existent pas.',	26),
(85,	'Je suis un Anime, Manga ou Jeu de cartes.',	26),
(86,	'Les premiers jeux de mon univers sortent sur Game Boy en 1996.',	26),
(87,	'Les créatures de mon univers possèdent des aptitudes telles que cracher du feu',	26);

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `theme_code` int(11) NOT NULL,
  KEY `theme_code` (`theme_code`),
  KEY `id` (`id`),
  KEY `name` (`name`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`theme_code`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

INSERT INTO `games` (`id`, `score`, `name`, `theme_code`) VALUES
(1,	1000,	'alexisss',	1),
(2,	10000,	'alexisss',	1),
(3,	10000,	'alexisss',	1),
(8,	985,	'alexisss',	3),
(9,	955,	'alexisss',	3),
(10,	800,	'alexisss',	3),
(11,	700,	'alexisss',	3),
(12,	595,	'alexisss',	3),
(13,	1000,	'alexisss',	1),
(14,	995,	'Alexis',	3),
(17,	1000,	'Alexis',	1),
(18,	670,	'Alexis',	3),
(19,	570,	'Alexis',	3),
(20,	570,	'Alexis',	3);

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_100000_create_password_resets_table',	1),
(2,	'2019_08_19_000000_create_failed_jobs_table',	1),
(3,	'2019_12_14_000001_create_personal_access_tokens_table',	1);

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\User',	2,	'authToken',	'a1939d14c84632ea811416729c3295724ef6bffe2810b82f1f4a04fb76bf8af2',	'[\"*\"]',	NULL,	'2023-09-16 15:26:15',	'2023-09-16 15:26:15'),
(2,	'App\\Models\\User',	2,	'authToken',	'126edeb35096c4bb3f4694fe05cacd110cf69a50e9637370aa26b17ec7c8b99b',	'[\"*\"]',	NULL,	'2023-09-16 15:27:09',	'2023-09-16 15:27:09'),
(3,	'App\\Models\\User',	2,	'authToken',	'ce2ee79598bb920046a95e467ebda83a4d3e493de182b12ecab0d21987e59330',	'[\"*\"]',	NULL,	'2023-09-16 15:35:12',	'2023-09-16 15:35:12'),
(4,	'App\\Models\\User',	2,	'authToken',	'37121dc1450b0db44caaa88512c88c3fd5e107b3bc52cc69f5b7795dcb919030',	'[\"*\"]',	NULL,	'2023-09-16 15:35:42',	'2023-09-16 15:35:42'),
(5,	'App\\Models\\User',	2,	'authToken',	'e91f5e1b402e4662190e0d24932f213e5cec3a5928f5920c6a7947aa2b79cfbe',	'[\"*\"]',	NULL,	'2023-09-16 15:36:34',	'2023-09-16 15:36:34'),
(6,	'App\\Models\\User',	2,	'authToken',	'9299c652ccb7b90010e05593792a27b0a2e4f865ef9ec3d7ca00010fdd48867f',	'[\"*\"]',	NULL,	'2023-09-16 15:38:55',	'2023-09-16 15:38:55'),
(7,	'App\\Models\\User',	2,	'authToken',	'c7a9994932c4e9eb995f03180b59a96fadcabb359e3037d112c80a884f582bc5',	'[\"*\"]',	NULL,	'2023-09-16 15:54:03',	'2023-09-16 15:54:03'),
(8,	'App\\Models\\User',	2,	'authToken',	'd1867104c9270cf5ef4af695f94298c93013044846926162fe2e15f299a9d059',	'[\"*\"]',	NULL,	'2023-09-16 15:54:26',	'2023-09-16 15:54:26'),
(9,	'App\\Models\\User',	2,	'authToken',	'803c1a77551828c6f3e9741d89762ff776a75ed719ac8cc1e797183d0937aaba',	'[\"*\"]',	NULL,	'2023-10-02 07:21:20',	'2023-10-02 07:21:20'),
(10,	'App\\Models\\User',	2,	'authToken',	'71bd87645c28e9c659880dcb4029cd608fd8a292aa2c2dce5d4550baff37ec6e',	'[\"*\"]',	NULL,	'2023-10-02 10:51:29',	'2023-10-02 10:51:29');

CREATE TABLE `riddles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer` varchar(64) NOT NULL COMMENT 'La réponse de l énigme',
  `name` varchar(128) NOT NULL COMMENT 'Le nom de l énigme',
  `theme_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_id` (`theme_id`),
  CONSTRAINT `riddles_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  CONSTRAINT `riddles_ibfk_2` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;
'
INSERT INTO `riddles` (`id`, `answer`, `name`, `theme_id`) VALUES
(1,	'Baby-Sittor',	'Je suis comédie américaine pour enfant',	2),
(2,	'Koala',	'Je suis une espèce de marsupial',	1),
(3,	'Mozart',	'Je suis un musicien célèbre',	3),
(4,	'Fight Club',	'Un film américano-allemand',	2),
(5,	'Nickelback',	'Je suis un groupe de rock alternatif canadien',	3),
(6,	'Tortue Pelomedusa',	'Je suis une créature vivant sous l’eau',	1),
(7,	'Mouette',	'Je suis une créature vivant sur terre et dans les airs',	1),
(8,	'Poisson Rouge',	'Je suis une créature vivant sous l’eau',	1),
(9,	'Intouchable',	'Je suis une comédie dramatique française',	2),
(10,	'Hyène',	'Je suis un mammifère vivant en meute',	1),
(11,	'Requin Bouledogue',	'Je suis un poisson cartilagineux',	1),
(12,	'La 25e heure',	'Je suis un drame américain sorti en 2002',	2),
(13,	'Mangouste',	'Je suis un animal présent en Asie, Afrique, Europe du Sud et aux Caraïbes',	1),
(14,	'Jacques Brel',	'Je suis un chanteur né en 1929',	3),
(15,	'Forrest Gump',	'Je suis une comédie dramatique sortie en 1994',	2),
(16,	'Le Roi Lion',	'Je suis un long métrage d animation sorti en 1994',	2),
(17,	'Phenix',	'Je suis un animal vénéré',	1),
(23,	'Hibou',	'Dans la mythologie grecque, je suis également l interprète d Atropos',	1),
(26,	'Pokemon',	'Je suis une franchise créée par Satoshi Tajiri .',	2);

CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Le nom du type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `themes` (`id`, `name`) VALUES
(1,	'Animaux'),
(2,	'Cinéma'),
(3,	'Musique');

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('joueur','administrateur') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `password`, `name`, `role`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'$2y$10$MBMH9Z1E62hQMWSEzasuredZ.8fKaVUf3sOzTIGXXn2gEUcZnigIe',	'JohnDoeeeaa',	'joueur',	'john@exaaaamplee.com',	NULL,	'2023-09-16 14:14:55',	'2023-09-16 14:14:55'),
(2,	'$2y$10$8HSyruGr275no0lMzaZVc.HMIpTT34CcoENsknXvknKPDBQFZpyb2',	'Alexis',	'administrateur',	'alexis.andrade@outlook.com',	NULL,	'2023-09-16 14:17:14',	'2023-09-16 14:17:14'),
(3,	'$2y$10$NP2hLQk3O18GZc.FpO8uQee9YCnSFS/UukSrTQ0xWC4cB9l53ACeK',	'test',	'joueur',	'test@test.com',	NULL,	'2023-10-02 07:22:10',	'2023-10-02 07:22:10');

-- 2023-10-08 09:26:16
