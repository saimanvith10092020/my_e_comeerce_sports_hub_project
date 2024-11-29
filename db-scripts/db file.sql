-- -----------------------------------------------------
-- Create a new user
-- -----------------------------------------------------
-- CREATE USER 'ecommerce'@'localhost' IDENTIFIED BY 'ecommerce';

-- GRANT ALL PRIVILEGES ON * . * TO 'ecommerce'@'localhost';

-- ALTER USER 'ecommerce'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ecommerce';


-- -----------------------------------------------------
-- Schema ecommerce-db
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `ecommerce-db`;

CREATE SCHEMA `ecommerce-db`;

USE `ecommerce-db` ;

-- -----------------------------------------------------
-- Table `ecommerce-db`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce-db`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `ecommerce-db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce-db`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------
INSERT INTO product_category(category_name) VALUES ('Indoor');
INSERT INTO product_category(category_name) VALUES ('Outdoor');
INSERT INTO product_category(category_name) VALUES ('Board');
INSERT INTO product_category(category_name) VALUES ('Fitness');

-- -----------------------------------------------------
-- Indoor Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) 
VALUES 
('INDOOR-1001', 'Table Tennis Set', 'Complete table tennis set with two paddles and balls', 'assets/images/products/indoor/indoor-1001.jpeg', 1, 100, 3000, 1, NOW()),
('INDOOR-1002', 'Chess Board', 'Classic wooden chess board with carved pieces', 'assets/images/products/indoor/indoor-1002.jpeg', 1, 200, 1500, 1, NOW()),
('INDOOR-1003', 'Carrom Board', 'Standard size carrom board with coins and striker', 'assets/images/products/indoor/indoor-1003.jpeg', 1, 150, 2500, 1, NOW()),
('INDOOR-1004', 'Darts Set', 'Professional darts board with 6 darts', 'assets/images/products/indoor/indoor-1004.jpeg', 1, 100, 2000, 1, NOW()),
('INDOOR-1005', 'Snooker Table', 'Professional snooker table with cue sticks and balls included', 'assets/images/products/indoor/indoor-1005.jpeg', 1, 10, 85000, 1, NOW()),
('INDOOR-1006', 'Poker Chips Set', '300 poker chips with cards and dealer buttons', 'assets/images/products/indoor/indoor-1006.jpeg', 1, 80, 2500, 1, NOW()),
('INDOOR-1007', 'Rubik Cube', 'Standard 3x3 Rubik cube with smooth rotation', 'assets/images/products/indoor/indoor-1007.jpeg', 1, 200, 300, 1, NOW()),
('INDOOR-1008', 'Air Hockey Table', 'Electric air hockey table with paddles and pucks', 'assets/images/products/indoor/indoor-1008.jpeg', 1, 15, 7500, 1, NOW()),
('INDOOR-1009', 'Foosball Table', 'Wooden foosball table with manual scorekeeper', 'assets/images/products/indoor/indoor-1009.jpeg', 1, 20, 12500, 1, NOW()),
('INDOOR-1010', 'UNO Card Game', 'Classic UNO game for family fun', 'assets/images/products/indoor/indoor-1010.jpeg', 1, 500, 300, 1, NOW()),
('INDOOR-1011', 'Chinese Checkers', 'Six-player Chinese checkers board game', 'assets/images/products/indoor/indoor-1011.jpeg', 1, 150, 500, 1, NOW()),
('INDOOR-1012', 'Dominoes Set', 'Double-six dominoes set in a wooden box', 'assets/images/products/indoor/indoor-1012.jpeg', 1, 100, 700, 1, NOW()),
('INDOOR-1013', 'Jenga', 'Classic wooden block stacking game', 'assets/images/products/indoor/indoor-1013.jpeg', 1, 300, 1200, 1, NOW()),
('INDOOR-1014', 'Scrabble Junior', 'Scrabble game designed for younger players', 'assets/images/products/indoor/indoor-1014.jpeg', 1, 100, 900, 1, NOW());

-- -----------------------------------------------------
-- Outdoor Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) 
VALUES 
('OUTDOOR-1001', 'Cricket Kit', 'Full cricket kit with bat, ball, pads, and gloves', 'assets/images/products/outdoor/outdoor-1001.jpeg', 1, 50, 5000, 2, NOW()),
('OUTDOOR-1002', 'Football', 'High-quality leather football with standard size', 'assets/images/products/outdoor/outdoor-1002.jpeg', 1, 200, 1000, 2, NOW()),
('OUTDOOR-1003', 'Badminton Racket Set', 'Set of two rackets with shuttlecocks', 'assets/images/products/outdoor/outdoor-1003.jpeg', 1, 150, 1200, 2, NOW()),
('OUTDOOR-1004', 'Volleyball', 'Durable outdoor volleyball with pump', 'assets/images/products/outdoor/outdoor-1004.jpeg', 1, 100, 800, 2, NOW()),
('OUTDOOR-1005', 'Basketball', 'Durable outdoor basketball with official size and weight', 'assets/images/products/outdoor/outdoor-1005.jpeg', 1, 150, 1000, 2, NOW()),
('OUTDOOR-1006', 'Hockey Stick', 'Professional hockey stick with ball', 'assets/images/products/outdoor/outdoor-1006.jpeg', 1, 80, 2500, 2, NOW()),
('OUTDOOR-1007', 'Baseball Kit', 'Baseball bat and glove with ball included', 'assets/images/products/outdoor/outdoor-1007.jpeg', 1, 50, 3000, 2, NOW()),
('OUTDOOR-1008', 'Track and Field Starter Kit', 'Includes hurdles, javelin, and starting blocks', 'assets/images/products/outdoor/outdoor-1008.jpeg', 1, 20, 15000, 2, NOW()),
('OUTDOOR-1009', 'Cycling Helmet', 'Lightweight helmet with adjustable straps', 'assets/images/products/outdoor/outdoor-1009.jpeg', 1, 200, 1500, 2, NOW()),
('OUTDOOR-1010', 'Frisbee', 'Professional grade flying disc for outdoor fun', 'assets/images/products/outdoor/outdoor-1010.jpeg', 1, 300, 500, 2, NOW()),
('OUTDOOR-1011', 'Skateboard', 'Durable wooden skateboard with alloy wheels', 'assets/images/products/outdoor/outdoor-1011.jpeg', 1, 100, 3500, 2, NOW()),
('OUTDOOR-1012', 'Archery Set', 'Bow and arrow set for beginners', 'assets/images/products/outdoor/outdoor-1012.jpeg', 1, 25, 5000, 2, NOW()),
('OUTDOOR-1013', 'Kite Kit', 'High-quality kite with strings and handles', 'assets/images/products/outdoor/outdoor-1013.jpeg', 1, 400, 300, 2, NOW()),
('OUTDOOR-1014', 'Camping Set', 'Tent, sleeping bag, and flashlight for outdoor adventures', 'assets/images/products/outdoor/outdoor-1014.jpeg', 1, 50, 12000, 2, NOW());

-- -----------------------------------------------------
-- Board Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) 
VALUES 
('BOARD-1001', 'Monopoly', 'Classic property trading board game', 'assets/images/products/board/board-1001.jpeg', 1, 100, 1500, 3, NOW()),
('BOARD-1002', 'Clue', 'Classic mystery board game for family and friends', 'assets/images/products/board/board-1002.jpeg', 1, 70, 1500, 3, NOW()),
('BOARD-1003', 'Pictionary', 'Drawing and guessing game for groups', 'assets/images/products/board/board-1003.jpeg', 1, 100, 1200, 3, NOW()),
('BOARD-1004', 'Catan', 'Strategy board game for 3-4 players', 'assets/images/products/board/board-1004.jpeg', 1, 50, 3000, 3, NOW()),
('BOARD-1005', 'Risk', 'World domination strategy game', 'assets/images/products/board/board-1005.jpeg', 1, 50, 2500, 3, NOW()),
('BOARD-1006', 'Pandemic', 'Cooperative board game to save the world from diseases', 'assets/images/products/board/board-1006.jpeg', 1, 40, 2200, 3, NOW()),
('BOARD-1007', 'Codenames', 'Word guessing game for teams', 'assets/images/products/board/board-1007.jpeg', 1, 60, 1500, 3, NOW()),
('BOARD-1008', 'Ticket to Ride', 'Train adventure board game', 'assets/images/products/board/board-1008.jpeg', 1, 30, 3500, 3, NOW()),
('BOARD-1009', 'Sequence', 'Card and chip strategy game', 'assets/images/products/board/board-1009.jpeg', 1, 80, 1200, 3, NOW()),
('BOARD-1010', 'Trivial Pursuit', 'Trivia-based question-and-answer game', 'assets/images/products/board/board-1010.jpeg', 1, 40, 2000, 3, NOW()),
('BOARD-1011', 'Scrabble', 'Classic word game with tiles and board', 'assets/images/products/board/board-1011.jpeg', 1, 100, 1800, 3, NOW());

-- -----------------------------------------------------
-- Fitness Equipment
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) 
VALUES 
('FITNESS-1001', 'Dumbbells Set', 'Set of adjustable dumbbells', 'assets/images/products/fitness/fitness-1001.jpeg', 1, 200, 3000, 4, NOW()),
('FITNESS-1002', 'Treadmill', 'Foldable electric treadmill with heart monitor', 'assets/images/products/fitness/fitness-1002.jpeg', 1, 30, 45000, 4, NOW()),
('FITNESS-1003', 'Kettlebell', 'Set of kettlebells in different weights', 'assets/images/products/fitness/fitness-1003.jpeg', 1, 150, 2000, 4, NOW()),
('FITNESS-1004', 'Resistance Bands', 'Set of 5 resistance bands with different strengths', 'assets/images/products/fitness/fitness-1004.jpeg', 1, 500, 800, 4, NOW()),
('FITNESS-1005', 'Yoga Mat', 'Eco-friendly non-slip yoga mat', 'assets/images/products/fitness/fitness-1005.jpeg', 1, 300, 1000, 4, NOW()),
('FITNESS-1006', 'Pull-Up Bar', 'Doorway pull-up and chin-up bar', 'assets/images/products/fitness/fitness-1006.jpeg', 1, 100, 2500, 4, NOW()),
('FITNESS-1007', 'Skipping Rope', 'Adjustable speed skipping rope', 'assets/images/products/fitness/fitness-1007.jpeg', 1, 500, 500, 4, NOW()),
('FITNESS-1008', 'Foam Roller', 'High-density foam roller for muscle recovery', 'assets/images/products/fitness/fitness-1008.jpeg', 1, 200, 1200, 4, NOW()),
('FITNESS-1009', 'Ankle Weights', 'Pair of adjustable ankle weights', 'assets/images/products/fitness/fitness-1009.jpeg', 1, 250, 1500, 4, NOW()),
('FITNESS-1010', 'Ab Wheel', 'Dual-wheel ab roller with knee pad', 'assets/images/products/fitness/fitness-1010.jpeg', 1, 300, 1000, 4, NOW()),
('FITNESS-1011', 'Gym Ball', 'Anti-burst exercise ball for yoga and Pilates', 'assets/images/products/fitness/fitness-1011.jpeg', 1, 100, 1200, 4, NOW());



USE `ecommerce-db`;

SET foreign_key_checks = 0;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Data for table `country`
--

INSERT INTO `country` VALUES 
(1,'BR','Brazil'),
(2,'CA','Canada'),
(3,'DE','Germany'),
(4,'IN','India'),
(5,'TR','Turkey'),
(6,'US','United States');

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` VALUES 
(1,'Acre',1),
(2,'Alagoas',1),
(3,'Amapá',1),
(4,'Amazonas',1),
(5,'Bahia',1),
(6,'Ceará',1),
(7,'Distrito Federal',1),
(8,'Espírito Santo',1),
(9,'Goiás',1),
(10,'Maranhão',1),
(11,'Mato Grosso do Sul',1),
(12,'Mato Grosso',1),
(13,'Minas Gerais',1),
(14,'Paraná',1),
(15,'Paraíba',1),
(16,'Pará',1),
(17,'Pernambuco',1),
(18,'Piaui',1),
(19,'Rio de Janeiro',1),
(20,'Rio Grande do Norte',1),
(21,'Rio Grande do Sul',1),
(22,'Rondônia',1),
(23,'Roraima',1),
(24,'Santa Catarina',1),
(25,'Sergipe',1),
(26,'São Paulo',1),
(27,'Tocantins',1),
(28,'Alberta',2),
(29,'British Columbia',2),
(30,'Manitoba',2),
(31,'New Brunswick',2),
(32,'Newfoundland and Labrador',2),
(33,'Northwest Territories',2),
(34,'Nova Scotia',2),
(35,'Nunavut',2),
(36,'Ontario',2),
(37,'Prince Edward Island',2),
(38,'Quebec',2),
(39,'Saskatchewan',2),
(40,'Yukon',2),
(41,'Baden-Württemberg',3),
(42,'Bavaria',3),
(43,'Berlin',3),
(44,'Brandenburg',3),
(45,'Bremen',3),
(46,'Hamburg',3),
(47,'Hesse',3),
(48,'Lower Saxony',3),
(49,'Mecklenburg-Vorpommern',3),
(50,'North Rhine-Westphalia',3),
(51,'Rhineland-Palatinate',3),
(52,'Saarland',3),
(53,'Saxony',3),
(54,'Saxony-Anhalt',3),
(55,'Schleswig-Holstein',3),
(56,'Thuringia',3),
(57,'Andhra Pradesh',4),
(58,'Arunachal Pradesh',4),
(59,'Assam',4),
(60,'Bihar',4),
(61,'Chhattisgarh',4),
(62,'Goa',4),
(63,'Gujarat',4),
(64,'Haryana',4),
(65,'Himachal Pradesh',4),
(66,'Jammu & Kashmir',4),
(67,'Jharkhand',4),
(68,'Karnataka',4),
(69,'Kerala',4),
(70,'Madhya Pradesh',4),
(71,'Maharashtra',4),
(72,'Manipur',4),
(73,'Meghalaya',4),
(74,'Mizoram',4),
(75,'Nagaland',4),
(76,'Odisha',4),
(77,'Punjab',4),
(78,'Rajasthan',4),
(79,'Sikkim',4),
(80,'Tamil Nadu',4),
(81,'Telangana',4),
(82,'Tripura',4),
(83,'Uttar Pradesh',4),
(84,'Uttarakhand',4),
(85,'West Bengal',4),
(86,'Andaman and Nicobar Islands',4),
(87,'Chandigarh',4),
(88,'Dadra and Nagar Haveli',4),
(89,'Daman & Diu',4),
(90,'Lakshadweep',4),
(91,'Puducherry',4),
(92,'The Government of NCT of Delhi',4),
(93,'Alabama',6),
(94,'Alaska',6),
(95,'Arizona',6),
(96,'Arkansas',6),
(97,'California',6),
(98,'Colorado',6),
(99,'Connecticut',6),
(100,'Delaware',6),
(101,'District Of Columbia',6),
(102,'Florida',6),
(103,'Georgia',6),
(104,'Hawaii',6),
(105,'Idaho',6),
(106,'Illinois',6),
(107,'Indiana',6),
(108,'Iowa',6),
(109,'Kansas',6),
(110,'Kentucky',6),
(111,'Louisiana',6),
(112,'Maine',6),
(113,'Maryland',6),
(114,'Massachusetts',6),
(115,'Michigan',6),
(116,'Minnesota',6),
(117,'Mississippi',6),
(118,'Missouri',6),
(119,'Montana',6),
(120,'Nebraska',6),
(121,'Nevada',6),
(122,'New Hampshire',6),
(123,'New Jersey',6),
(124,'New Mexico',6),
(125,'New York',6),
(126,'North Carolina',6),
(127,'North Dakota',6),
(128,'Ohio',6),
(129,'Oklahoma',6),
(130,'Oregon',6),
(131,'Pennsylvania',6),
(132,'Rhode Island',6),
(133,'South Carolina',6),
(134,'South Dakota',6),
(135,'Tennessee',6),
(136,'Texas',6),
(137,'Utah',6),
(138,'Vermont',6),
(139,'Virginia',6),
(140,'Washington',6),
(141,'West Virginia',6),
(142,'Wisconsin',6),
(143,'Wyoming',6),
(144,'Adıyaman',5),
(145,'Afyonkarahisar',5),
(146,'Ağrı',5),
(147,'Aksaray',5),
(148,'Amasya',5),
(149,'Ankara',5),
(150,'Antalya',5),
(151,'Ardahan',5),
(152,'Artvin',5),
(153,'Aydın',5),
(154,'Balıkesir',5),
(155,'Bartın',5),
(156,'Batman',5),
(157,'Bayburt',5),
(158,'Bilecik',5),
(159,'Bingöl',5),
(160,'Bitlis',5),
(161,'Bolu',5),
(162,'Burdur',5),
(163,'Bursa',5),
(164,'Çanakkale',5),
(165,'Çankırı',5),
(166,'Çorum',5),
(167,'Denizli',5),
(168,'Diyarbakır',5),
(169,'Düzce',5),
(170,'Edirne',5),
(171,'Elazığ',5),
(172,'Erzincan',5),
(173,'Erzurum',5),
(174,'Eskişehir',5),
(175,'Gaziantep',5),
(176,'Giresun',5),
(177,'Gümüşhane',5),
(178,'Hakkâri',5),
(179,'Hatay',5),
(180,'Iğdır',5),
(181,'Isparta',5),
(182,'İstanbul',5),
(183,'İzmir',5),
(184,'Kahramanmaraş',5),
(185,'Karabük',5),
(186,'Karaman',5),
(187,'Kars',5),
(188,'Kastamonu',5),
(189,'Kayseri',5),
(190,'Kırıkkale',5),
(191,'Kırklareli',5),
(192,'Kırşehir',5),
(193,'Kilis',5),
(194,'Kocaeli',5),
(195,'Konya',5),
(196,'Kütahya',5),
(197,'Malatya',5),
(198,'Manisa',5),
(199,'Mardin',5),
(200,'Mersin',5),
(201,'Muğla',5),
(202,'Muş',5),
(203,'Nevşehir',5),
(204,'Niğde',5),
(205,'Ordu',5),
(206,'Osmaniye',5),
(207,'Rize',5),
(208,'Sakarya',5),
(209,'Samsun',5),
(210,'Siirt',5),
(211,'Sinop',5),
(212,'Sivas',5),
(213,'Şanlıurfa',5),
(214,'Şırnak',5),
(215,'Tekirdağ',5),
(216,'Tokat',5),
(217,'Trabzon',5),
(218,'Tunceli',5),
(219,'Uşak',5),
(220,'Van',5),
(221,'Yalova',5),
(222,'Yozgat',5),
(223,'Zonguldak',5);

SET foreign_key_checks = 1;


USE `ecommerce-db`;

--
-- Prep work
--
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
SET FOREIGN_KEY_CHECKS=1;

--
-- Table structure for table `address`
--
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `customer`
--
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `order_items`
--
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



