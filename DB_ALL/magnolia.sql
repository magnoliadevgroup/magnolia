-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2017 at 11:16 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magnoliadb`
--
CREATE DATABASE IF NOT EXISTS `magnoliadb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `magnoliadb`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CATEGORY_ID` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(255) NOT NULL,
  `CATEGORY_DESCRIPTION` text NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `IMAGE_ID` int(11) NOT NULL,
  `IMAGE` blob NOT NULL,
  `IMAGE_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1491415593),
('m130524_201442_init', 1491415607);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `ORDER_DETAIL_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` float NOT NULL,
  `FULFILLED` tinyint(1) NOT NULL,
  `SHIP_DATE` date NOT NULL,
  `BILL_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `PAYMENT_ID` int(11) NOT NULL,
  `ORDER_DATE` date NOT NULL,
  `SHIP_DATE` date NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TRANSACTION_STATUS` varchar(255) NOT NULL,
  `FULFILLED` tinyint(1) NOT NULL,
  `DELETED` tinyint(1) NOT NULL,
  `PAID` tinyint(1) NOT NULL,
  `PAYMENT_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PAYMENT_ID` int(11) NOT NULL,
  `PAYMENT_TYPE` int(11) NOT NULL,
  `PAYMENT_METHOD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `CATEGORY_ID` int(11) NOT NULL,
  `IMAGE_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `VENDOR_PRODUCT_ID` varchar(255) NOT NULL,
  `PRODUCT_NAME` varchar(255) NOT NULL,
  `PROUCT_DESCRIPTION` text NOT NULL,
  `UNITS_IN_STOCK` int(11) NOT NULL,
  `PRODUCT_PRICE` float NOT NULL,
  `PRODUCT_AVAILABLE` tinyint(1) NOT NULL,
  `NOTES` text NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_order_details`
--

CREATE TABLE `stock_order_details` (
  `STOCK_ORDER_DETAIL_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `STOCK_ORDER_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` float NOT NULL,
  `FULFILLED` tinyint(1) NOT NULL,
  `SHIP_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_orders`
--

CREATE TABLE `stock_orders` (
  `VENDOR_ID` int(11) NOT NULL,
  `STOCK_ORDER_ID` int(11) NOT NULL,
  `PAYMENT_ID` int(11) NOT NULL,
  `ORDER_DATE` date NOT NULL,
  `SHIP_DATE` date NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FULFILLED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'IO-ajubdTIUcucRr2YokxAR8LPkK-SvP', '$2y$13$RwjtqFrYUasWb10TFAsKn.mHl3UendTbvBHgBjZPCREdHw7R4xZVa', NULL, 'admin@gmail.com', 10, 1491415817, 1491415817),
(2, 'demo', 'Vk36ha4yYK4j8qY8N0hD5AtBjO1GoNAk', '$2y$13$8.vv21HZjXuafLRmLEZ82O20Xn8AvRGBzsv0t6EOrhKzyG0Xj9c7q', NULL, 'demo@gfg.fd', 10, 1491416040, 1491416040);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `LOGIN_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `LAST_NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `ZIP_CODE` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `BILLING_ADDRESS` varchar(255) DEFAULT NULL,
  `BILLING_CITY` varchar(255) DEFAULT NULL,
  `BILLING_ZIP_CODE` varchar(255) DEFAULT NULL,
  `BILLING_COUNTRY` varchar(255) DEFAULT NULL,
  `BILLING_PHONE` varchar(255) DEFAULT NULL,
  `SHIPPING_ADDRESS` varchar(255) DEFAULT NULL,
  `SHIPPING_CITY` varchar(255) DEFAULT NULL,
  `SHIPPING_ZIP_CODE` varchar(255) DEFAULT NULL,
  `SHIPPING_COUNTRY` varchar(255) DEFAULT NULL,
  `SHIPPING_PHONE` varchar(255) DEFAULT NULL,
  `REGISTRATION_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `LOGIN_ID`, `PASSWORD`, `FIRST_NAME`, `LAST_NAME`, `ADDRESS`, `CITY`, `ZIP_CODE`, `COUNTRY`, `PHONE`, `EMAIL`, `BILLING_ADDRESS`, `BILLING_CITY`, `BILLING_ZIP_CODE`, `BILLING_COUNTRY`, `BILLING_PHONE`, `SHIPPING_ADDRESS`, `SHIPPING_CITY`, `SHIPPING_ZIP_CODE`, `SHIPPING_COUNTRY`, `SHIPPING_PHONE`, `REGISTRATION_DATE`) VALUES
(1, 'ehunter0', 'mLr55aAn', 'Ernest', 'Hunter', '59781 Nevada Street', 'Radomin', '87-404', 'Poland', '48-(889)752-0911', 'ehunter0@lycos.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-09'),
(2, 'kbradley1', 'bZLKeNFiGp', 'Kelly', 'Bradley', '73914 Corscot Junction', 'Philadelphia', '19120', 'United States', '1-(215)511-4498', 'kbradley1@uol.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01'),
(3, 'tcox2', '3gRNnsjci', 'Thomas', 'Cox', '79 Thompson Way', 'Lesnikovo', '641754', 'Russia', '7-(326)120-4704', 'tcox2@nydailynews.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-12'),
(4, 'mlawson3', '3EWPEEUWf248', 'Martha', 'Lawson', '4058 Vernon Place', 'Lomé', '5131', 'Togo', '228-(490)879-0336', 'mlawson3@netscape.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-11'),
(5, 'aroberts4', 'DbmZFe', 'Albert', 'Roberts', '443 Maryland Street', 'Wanjiazhuang', '6141', 'China', '86-(394)669-6480', 'aroberts4@imdb.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-02'),
(6, 'mrussell5', 'PopucYIABFJ', 'Marilyn', 'Russell', '22 Arkansas Crossing', 'San Jose', '95128', 'United States', '1-(714)645-9170', 'mrussell5@sun.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-10'),
(7, 'vramos6', 'mybyeY', 'Virginia', 'Ramos', '63734 Hovde Pass', 'Kashima', '927-0038', 'Japan', '81-(588)485-5494', 'vramos6@ask.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-27'),
(8, 'cgeorge7', '5zDrz7NQVoA', 'Clarence', 'George', '55975 Dapin Avenue', 'Bojonghaur', '6134123', 'Indonesia', '62-(710)389-3535', 'cgeorge7@nationalgeographic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-24'),
(9, 'rmarshall8', '0WVSGZnyt', 'Raymond', 'Marshall', '4366 Spohn Junction', 'Barão de São Miguel', '8650-005', 'Portugal', '351-(819)454-6903', 'rmarshall8@yolasite.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30'),
(10, 'kfoster9', '31fo2m', 'Kathryn', 'Foster', '70607 Northview Lane', 'Fucha', '6131', 'China', '86-(184)106-0320', 'kfoster9@thetimes.co.uk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-21'),
(11, 'creida', '8ARxqwu', 'Clarence', 'Reid', '90 Anzinger Point', 'Atarodangwautu', '51345', 'Indonesia', '62-(305)483-5007', 'creida@tinypic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-20'),
(12, 'spetersonb', 'kDU2XV', 'Susan', 'Peterson', '78158 Oxford Circle', 'Pordapor Barat', '1325', 'Indonesia', '62-(681)662-7636', 'spetersonb@sogou.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-10'),
(13, 'tcarterc', 'sZtA2GXx', 'Tammy', 'Carter', '22 1st Place', 'Taiping', '64213', 'China', '86-(442)716-9825', 'tcarterc@paypal.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-02'),
(14, 'jholmesd', 'pM8s9ZWw', 'Jennifer', 'Holmes', '070 Utah Court', 'Zhouxi', '54315', 'China', '86-(355)225-3684', 'jholmesd@boston.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-30'),
(15, 'jjacobse', 'GsdeKRcaaVC', 'Jessica', 'Jacobs', '7068 Bashford Point', 'Lingyang', '64545', 'China', '86-(674)460-7696', 'jjacobse@xrea.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-23'),
(16, 'kcoxf', 'WIDzyTn', 'Kathleen', 'Cox', '07 High Crossing Street', 'Stockholm', '162 87', 'Sweden', '46-(801)187-7543', 'kcoxf@rediff.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-06'),
(17, 'dmendozag', 'BqP8OybBx', 'Diana', 'Mendoza', '39 Summer Ridge Alley', 'Pucheng', '53451', 'China', '86-(474)484-2835', 'dmendozag@instagram.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-30'),
(18, 'whillh', 'XEEMj6dRlu1', 'Walter', 'Hill', '8225 Jenna Crossing', 'Zaña', '5415315', 'Peru', '51-(230)380-4665', 'whillh@com.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-24'),
(19, 'smontgomeryi', 'NIiuf6k3', 'Stephanie', 'Montgomery', '9 Tomscot Hill', 'Ryjewo', '82-420', 'Poland', '48-(347)204-8570', 'smontgomeryi@tripod.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-16'),
(20, 'ggreenej', 'V4gdPZ8l', 'George', 'Greene', '9468 Lien Terrace', 'Nizhnyaya Tavda', '626020', 'Russia', '7-(894)374-3869', 'ggreenej@dell.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-21'),
(21, 'dstewartk', 'cgXSSmP1HOx', 'Donald', 'Stewart', '3 Arrowood Terrace', 'Caraguatatuba', '11660-000', 'Brazil', '55-(231)445-8937', 'dstewartk@ycombinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-03'),
(22, 'fmillsl', 'AcYjmOCctg', 'Frances', 'Mills', '24 Hovde Junction', 'Nagaoka', '999-2222', 'Japan', '81-(700)230-3466', 'fmillsl@photobucket.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-17'),
(23, 'hmartinm', 'JbWxK1r', 'Helen', 'Martin', '443 Prairieview Road', 'Dongdai', '616661', 'China', '86-(419)954-0908', 'hmartinm@economist.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-06'),
(24, 'jstonen', 'Du2eFd2w', 'Janice', 'Stone', '8 South Parkway', 'Klenica', '66-130', 'Poland', '48-(874)748-4933', 'jstonen@youtu.be', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-15'),
(25, 'kwilliamso', 'v7F8UF3ivi', 'Kathryn', 'Williams', '573 Norway Maple Circle', 'Ixopo', '1980', 'South Africa', '27-(741)885-7457', 'kwilliamso@liveinternet.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-02'),
(26, 'gbaileyp', '8VEAB3VG', 'Gerald', 'Bailey', '3 Jackson Drive', 'Girsereng', '65444', 'Indonesia', '62-(792)553-4442', 'gbaileyp@php.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-28'),
(27, 'kfoxq', 'fD5j2yL', 'Katherine', 'Fox', '309 Bultman Street', 'Preobrazheniye', '429500', 'Russia', '7-(998)499-3490', 'kfoxq@archive.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-01'),
(28, 'bperryr', '5uDpEWLgN25', 'Billy', 'Perry', '05403 Riverside Center', 'Goyty', '366502', 'Russia', '7-(792)164-0499', 'bperryr@weibo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-15'),
(29, 'kwilliamss', '8o3pXPfFP', 'Kenneth', 'Williams', '61 Lakewood Gardens Terrace', 'Novyy Svit', '8765', 'Ukraine', '380-(694)807-8782', 'kwilliamss@ask.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-12'),
(30, 'lperkinst', 'zr17Mlo', 'Linda', 'Perkins', '08 Schmedeman Plaza', 'Buenavista', '47216', 'Mexico', '52-(689)863-5598', 'lperkinst@de.vu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-05'),
(31, 'hharrisu', 'ys59053mOpbM', 'Heather', 'Harris', '20 Almo Pass', 'Golub-Dobrzyń', '87-401', 'Poland', '48-(350)987-0765', 'hharrisu@nhs.uk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-11'),
(32, 'gbrooksv', 'LzXotKJui0ZS', 'Gerald', 'Brooks', '846 Anzinger Avenue', 'Wodzierady', '98-105', 'Poland', '48-(812)692-5859', 'gbrooksv@a8.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-30'),
(33, 'jcooperw', 'tjcMVf6wD9', 'Johnny', 'Cooper', '02679 Stuart Point', 'Las Toscas', '3586', 'Argentina', '54-(163)814-3551', 'jcooperw@google.es', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-26'),
(34, 'pburtonx', 'sbIwSMOspW', 'Phyllis', 'Burton', '2 Cody Lane', 'Fajões', '3700-660', 'Portugal', '351-(304)951-2754', 'pburtonx@studiopress.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-30'),
(35, 'smendozay', 'Y7VLPt2KgSw', 'Stephanie', 'Mendoza', '21 Shelley Alley', 'Nioki', '43242', 'Democratic Republic of the Congo', '242-(885)653-0167', 'smendozay@g.co', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-20'),
(36, 'kjonesz', '8lOf82eP', 'Kathryn', 'Jones', '28 Tennessee Place', 'Xingyi', '6353', 'China', '86-(496)273-9483', 'kjonesz@weather.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-09'),
(37, 'dberry10', 'ai28Gbe', 'Doris', 'Berry', '5 Del Sol Crossing', 'Shapaja', '74234', 'Peru', '51-(806)203-9870', 'dberry10@ow.ly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-28'),
(38, 'plittle11', 'POfSbKPIHq', 'Paula', 'Little', '5 Shopko Point', 'Huangzhawan', '54321', 'China', '86-(476)409-0292', 'plittle11@github.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-14'),
(39, 'jowens12', 'PRlnvOi', 'Jean', 'Owens', '69433 Anthes Street', 'Woha', '1132', 'Indonesia', '62-(831)277-1045', 'jowens12@yelp.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-30'),
(40, 'mbailey13', 'bFuCVs', 'Margaret', 'Bailey', '086 Helena Drive', 'El Soberbio', '3364', 'Argentina', '54-(236)418-4325', 'mbailey13@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-12'),
(41, 'jdavis14', 'Rpvf2I6i', 'Johnny', 'Davis', '53167 Birchwood Place', 'Karano', '43235', 'Indonesia', '62-(891)465-4759', 'jdavis14@jimdo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-11'),
(42, 'pwallace15', '9blandV5qB', 'Paula', 'Wallace', '8 Cambridge Lane', 'Agago', '3153453', 'Uganda', '256-(178)576-6161', 'pwallace15@google.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-16'),
(43, 'rburton16', 'i5FJgFo', 'Richard', 'Burton', '3176 Fisk Drive', 'Xo’jayli Shahri', '6542', 'Uzbekistan', '998-(261)149-3784', 'rburton16@ycombinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01'),
(44, 'cgreene17', 'GT3CzsNE5JL', 'Charles', 'Greene', '50 Elgar Street', 'Quimistán', '35641', 'Honduras', '504-(326)789-5833', 'cgreene17@japanpost.jp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-14'),
(45, 'wreid18', 'pL06ZL', 'Wanda', 'Reid', '222 Wayridge Trail', 'Korczyna', '38-420', 'Poland', '48-(462)740-6250', 'wreid18@blogs.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-16'),
(46, 'dcarroll19', 'ebIT506v4MX', 'Dennis', 'Carroll', '6209 Memorial Center', 'Shifo', '12314', 'China', '86-(150)480-4948', 'dcarroll19@naver.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-04'),
(47, 'mrussell1a', 'nDCi5pO', 'Marilyn', 'Russell', '5610 Scott Circle', 'Gao', '5645', 'Mali', '223-(249)621-9642', 'mrussell1a@xing.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-13'),
(48, 'kjordan1b', 'QbnbCIB', 'Karen', 'Jordan', '9 Pleasure Circle', 'Aykol', '7654', 'China', '86-(887)256-7191', 'kjordan1b@reference.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-08'),
(49, 'bjackson1c', 'MqN4MaBdQC', 'Bobby', 'Jackson', '1 Rieder Way', 'Passos', '37900-000', 'Brazil', '55-(476)328-3067', 'bjackson1c@creativecommons.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-17'),
(50, 'dyoung1d', 'l17RYhUU9fHQ', 'Dorothy', 'Young', '9052 Bobwhite Crossing', 'Castro Daire', '3600-073', 'Portugal', '351-(425)545-8814', 'dyoung1d@epa.gov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `VENDOR_ID` int(11) NOT NULL,
  `COMPANY_NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `ZIP_CODE` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `NOTES` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`IMAGE_ID`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`ORDER_DETAIL_ID`),
  ADD KEY `ORDER_DETAILS_fk0` (`PRODUCT_ID`),
  ADD KEY `ORDER_DETAILS_fk1` (`ORDER_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `ORDERS_fk0` (`USER_ID`),
  ADD KEY `ORDERS_fk1` (`PAYMENT_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PAYMENT_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `PRODUCTS_fk0` (`CATEGORY_ID`),
  ADD KEY `PRODUCTS_fk1` (`IMAGE_ID`);

--
-- Indexes for table `stock_order_details`
--
ALTER TABLE `stock_order_details`
  ADD PRIMARY KEY (`STOCK_ORDER_DETAIL_ID`),
  ADD KEY `STOCK_ORDER_DETAILS_fk0` (`PRODUCT_ID`),
  ADD KEY `STOCK_ORDER_DETAILS_fk1` (`STOCK_ORDER_ID`);

--
-- Indexes for table `stock_orders`
--
ALTER TABLE `stock_orders`
  ADD PRIMARY KEY (`STOCK_ORDER_ID`),
  ADD KEY `STOCK_ORDERS_fk0` (`VENDOR_ID`),
  ADD KEY `STOCK_ORDERS_fk1` (`PAYMENT_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `LOGIN_ID` (`LOGIN_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`VENDOR_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `IMAGE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `ORDER_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_order_details`
--
ALTER TABLE `stock_order_details`
  MODIFY `STOCK_ORDER_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_orders`
--
ALTER TABLE `stock_orders`
  MODIFY `STOCK_ORDER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `VENDOR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `ORDER_DETAILS_fk0` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`),
  ADD CONSTRAINT `ORDER_DETAILS_fk1` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `ORDERS_fk0` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `ORDERS_fk1` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `payments` (`PAYMENT_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `PRODUCTS_fk0` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`),
  ADD CONSTRAINT `PRODUCTS_fk1` FOREIGN KEY (`IMAGE_ID`) REFERENCES `images` (`IMAGE_ID`);

--
-- Constraints for table `stock_order_details`
--
ALTER TABLE `stock_order_details`
  ADD CONSTRAINT `STOCK_ORDER_DETAILS_fk0` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`),
  ADD CONSTRAINT `STOCK_ORDER_DETAILS_fk1` FOREIGN KEY (`STOCK_ORDER_ID`) REFERENCES `stock_orders` (`STOCK_ORDER_ID`);

--
-- Constraints for table `stock_orders`
--
ALTER TABLE `stock_orders`
  ADD CONSTRAINT `STOCK_ORDERS_fk0` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendors` (`VENDOR_ID`),
  ADD CONSTRAINT `STOCK_ORDERS_fk1` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `payments` (`PAYMENT_ID`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-04-05 16:07:35', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
