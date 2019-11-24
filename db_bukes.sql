-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2019 pada 20.52
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rekening` varchar(255) NOT NULL,
  `kodebank` int(10) DEFAULT NULL,
  `bank` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `name`, `rekening`, `kodebank`, `bank`) VALUES
(1, 'Bukes', '12451241', 123, 'Mandiri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirm_links`
--

CREATE TABLE `confirm_links` (
  `id` int(11) NOT NULL,
  `link` char(32) NOT NULL,
  `for_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `confirm_links`
--

INSERT INTO `confirm_links` (`id`, `link`, `for_order`) VALUES
(21, 'b2c2431ad5d84f9ed3d7d86cb75904b3', 1234),
(22, '29c0823cea6f7c37f94b87154b1faad9', 1235);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cookie_law`
--

CREATE TABLE `cookie_law` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cookie_law`
--

INSERT INTO `cookie_law` (`id`, `link`, `theme`, `visibility`) VALUES
(1, '', 'light-floating', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cookie_law_translations`
--

CREATE TABLE `cookie_law_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `learn_more` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `valid_from_date` int(10) UNSIGNED NOT NULL,
  `valid_to_date` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-enabled, 0-disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `type`, `code`, `amount`, `valid_from_date`, `valid_to_date`, `status`) VALUES
(1, 'percent', 'JH8RDS', '10', 1565974800, 1575306000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id`, `activity`, `username`, `time`) VALUES
(1, 'Go to History', 'admin', 1571661597),
(2, 'Go to discounts page', 'admin', 1571661602),
(3, 'Go to discounts page', 'admin', 1571661615),
(4, 'Go to Titles / Descriptions page', 'admin', 1571661616),
(26, 'Go to products', 'admin', 1571662325),
(27, 'Go to orders page', 'admin', 1571662328),
(28, 'Change status of Order Id 1 to status 0', 'admin', 1571662355),
(29, 'Change status of Order Id 1 to status 0', 'admin', 1571662358),
(30, 'Change status of Order Id 1 to status 2', 'admin', 1571662364),
(31, 'Change status of Order Id 1 to status 1', 'admin', 1571662366),
(32, 'Change status of Order Id 1 to status 0', 'admin', 1571662367),
(33, 'Change status of Order Id 1 to status 1', 'admin', 1571662369),
(34, 'Go to orders page', 'admin', 1571662373),
(35, 'Go to orders page', 'admin', 1571662376),
(36, 'Go to orders page', 'admin', 1571662377),
(37, 'Go to Pages manage', 'admin', 1571662406),
(38, 'Go to orders page', 'admin', 1571662409),
(39, 'Go to products', 'admin', 1571662424),
(40, 'Go to publish product', 'admin', 1571662427),
(41, 'Go to publish product', 'admin', 1571662434),
(42, 'Go to History', 'admin', 1571662437),
(43, 'Go to Admin Users', 'admin', 1571662443),
(44, 'Go to Subscribed Emails', 'admin', 1571662445),
(45, 'Go to File Manager', 'admin', 1571662447),
(46, 'Go to languages', 'admin', 1571662545),
(47, 'Go to languages', 'admin', 1571662549),
(48, 'Go to languages', 'admin', 1571662585),
(49, 'Go to languages', 'admin', 1571662596),
(50, 'Go to Styling page', 'admin', 1571662600),
(51, 'Go to Styling page', 'admin', 1571662632),
(52, 'Go to Templates Page', 'admin', 1571662639),
(53, 'Go to Admin Users', 'admin', 1571662792),
(54, 'Go to Settings Page', 'admin', 1571662807),
(55, 'Go to Settings Page', 'admin', 1571662818),
(56, 'Change site logo', 'admin', 1571662832),
(57, 'Go to Settings Page', 'admin', 1571662832),
(58, 'Go to orders page', 'admin', 1571662849),
(59, 'Go to products', 'admin', 1571662885),
(60, 'Go to publish product', 'admin', 1571662888),
(61, 'Success updated product', 'admin', 1571662895),
(62, 'Go to products', 'admin', 1571662895),
(63, 'Go to languages', 'admin', 1571663014),
(64, 'Go to languages', 'admin', 1571663016),
(65, 'Go to Pages manage', 'admin', 1571663130);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `currencyKey` varchar(5) NOT NULL,
  `flag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `name`, `currency`, `currencyKey`, `flag`) VALUES
(5, 'id', 'indonesia', 'Rp', 'IDR', 'flag-400.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'point to public_users ID',
  `products` text NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'viewed status is change when change processed status',
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_code` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `products`, `date`, `referrer`, `clean_referrer`, `payment_type`, `paypal_status`, `processed`, `viewed`, `confirmed`, `discount_code`) VALUES
(22, 1235, 0, 'a:2:{i:0;a:2:{s:12:\"product_info\";a:22:{s:2:\"id\";s:1:\"5\";s:6:\"folder\";s:10:\"1571782280\";s:5:\"image\";s:31:\"President_Abdurrahman_Wahid.jpg\";s:4:\"time\";s:10:\"1571782325\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"2\";s:8:\"quantity\";s:1:\"6\";s:5:\"pages\";s:1:\"0\";s:11:\"datePublish\";s:12:\"05 June 1986\";s:4:\"isbn\";s:9:\"513426453\";s:9:\"publisher\";s:9:\"Pancasila\";s:6:\"weight\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"length\";s:1:\"0\";s:11:\"procurement\";s:1:\"0\";s:3:\"url\";s:18:\"Presiden_keempat_5\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"4\";s:9:\"vendor_id\";s:1:\"0\";s:5:\"price\";s:5:\"52411\";}s:16:\"product_quantity\";s:1:\"2\";}i:1;a:2:{s:12:\"product_info\";a:22:{s:2:\"id\";s:1:\"6\";s:6:\"folder\";s:10:\"1571782361\";s:5:\"image\";s:47:\"President_Megawati_Sukarnoputri_-_Indonesia.jpg\";s:4:\"time\";s:10:\"1571782411\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"2\";s:8:\"quantity\";s:1:\"3\";s:5:\"pages\";s:1:\"0\";s:11:\"datePublish\";s:12:\"24 July 1986\";s:4:\"isbn\";s:0:\"\";s:9:\"publisher\";s:0:\"\";s:6:\"weight\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"length\";s:1:\"0\";s:11:\"procurement\";s:1:\"0\";s:3:\"url\";s:17:\"Presiden_kelima_6\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"5\";s:9:\"vendor_id\";s:1:\"0\";s:5:\"price\";s:5:\"53112\";}s:16:\"product_quantity\";s:1:\"1\";}}', 1574624678, 'Direct', 'Direct', 'cashOnDelivery', NULL, 1, 1, 1, ''),
(21, 1234, 0, 'a:1:{i:0;a:2:{s:12:\"product_info\";a:22:{s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1571753288\";s:5:\"image\";s:16:\"ir__soekarno.jpg\";s:4:\"time\";s:10:\"1571753332\";s:11:\"time_update\";s:10:\"1573599877\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"2\";s:8:\"quantity\";s:1:\"3\";s:5:\"pages\";s:1:\"0\";s:11:\"datePublish\";s:14:\"17 August 1945\";s:4:\"isbn\";s:10:\"1284128481\";s:9:\"publisher\";s:9:\"Pancasila\";s:6:\"weight\";s:1:\"1\";s:5:\"width\";s:1:\"3\";s:6:\"length\";s:1:\"4\";s:11:\"procurement\";s:1:\"4\";s:3:\"url\";s:18:\"Presiden_pertama_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"vendor_id\";s:1:\"0\";s:5:\"price\";s:6:\"100000\";}s:16:\"product_quantity\";s:1:\"2\";}}', 1574623842, 'Direct', 'Direct', 'cashOnDelivery', NULL, 1, 1, 1, 'JH8RDS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_clients`
--

CREATE TABLE `orders_clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(20) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_clients`
--

INSERT INTO `orders_clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `post_code`, `notes`, `for_id`) VALUES
(21, 'Murniasih', 'asda', 'admin@blackpunk.id', '12345678', 'Dramaga cantik', 'Bogor', '16680', '', 21),
(22, 'Murniasih', 'jhbkhj', 'admin@blackpunk.id', '12345678', 'Dramaga cantik', 'Bogor', '16680', '', 22);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder` int(10) UNSIGNED DEFAULT NULL COMMENT 'folder with images',
  `image` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL COMMENT 'time created',
  `time_update` int(10) UNSIGNED NOT NULL COMMENT 'time updated',
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `shop_categorie` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `pages` int(10) DEFAULT NULL,
  `datePublish` varchar(32) NOT NULL DEFAULT '-',
  `isbn` varchar(64) NOT NULL DEFAULT '-',
  `publisher` varchar(32) NOT NULL DEFAULT '-',
  `weight` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `length` float DEFAULT NULL,
  `procurement` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `virtual_products` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `folder`, `image`, `time`, `time_update`, `visibility`, `shop_categorie`, `quantity`, `pages`, `datePublish`, `isbn`, `publisher`, `weight`, `width`, `length`, `procurement`, `url`, `virtual_products`, `brand_id`, `position`, `vendor_id`) VALUES
(1, 1571661963, 'hos_cokro.jpg', 1571662043, 1571662895, 1, 1, 1, NULL, '-', '-', '-', NULL, NULL, NULL, 1, 'Presiden_pertama_1', NULL, NULL, 1, 0),
(2, 1571753288, 'ir__soekarno.jpg', 1571753332, 1573599877, 1, 2, 1, 0, '17 August 1945', '1284128481', 'Pancasila', 1, 3, 4, 6, 'Presiden_pertama_2', NULL, NULL, 1, 0),
(3, 1571763694, 'President_Suharto.jpg', 1571763770, 1571782020, 1, 2, 2, 0, '20 November 2015', '-', '-', 0, 0, 0, 1, 'Presiden_kedua_3', NULL, NULL, 2, 0),
(4, 1571782082, 'Foto_Presiden_Habibie_1998.jpg', 1571782205, 1571782224, 1, 2, 3, 120, '25 June 1936', '51351252', 'Pancasila', 0, 0, 0, 0, 'Presiden_ketiga_4', NULL, NULL, 3, 0),
(5, 1571782280, 'President_Abdurrahman_Wahid.jpg', 1571782325, 0, 1, 2, 4, 0, '05 June 1986', '513426453', 'Pancasila', 0, 0, 0, 2, 'Presiden_keempat_5', NULL, NULL, 4, 0),
(6, 1571782361, 'President_Megawati_Sukarnoputri_-_Indonesia.jpg', 1571782411, 0, 1, 2, 2, 0, '24 July 1986', '', '', 0, 0, 0, 1, 'Presiden_kelima_6', NULL, NULL, 5, 0),
(7, 1571782463, 'Presiden_Susilo_Bambang_Yudhoyono.png', 1571782501, 1571782609, 1, 2, 2, 0, 'Choose', '', '', 0, 0, 0, 1, 'Presiden_keenam_7', NULL, NULL, 6, 0),
(8, 1571782506, 'Joko-Widodo.jpg', 1571782593, 0, 1, 2, 2, 0, 'Choose', '', '', 0, 0, 0, 0, 'Presiden_ketujuh_8', NULL, NULL, 7, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_translations`
--

CREATE TABLE `products_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` varchar(20) NOT NULL,
  `old_price` varchar(20) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products_translations`
--

INSERT INTO `products_translations` (`id`, `title`, `description`, `price`, `old_price`, `abbr`, `for_id`) VALUES
(5, 'Presiden pertama', '<p>Presiden pertama indonesia</p>\r\n', '100000', '', 'id', 2),
(7, 'Presiden kedua', '<p>Presiden kedua indonesia</p>\r\n', '120000', '', 'id', 3),
(9, 'Presiden ketiga', '<p>Presiden ketiga indonesia</p>\r\n', '231000', '', 'id', 4),
(11, 'Presiden keempat', '<p>Presiden keempat indonesia</p>\r\n', '52411', '', 'id', 5),
(13, 'Presiden kelima', '<p>Presiden kelima indonesia</p>\r\n', '53112', '', 'id', 6),
(15, 'Presiden keenam', '<p>Presiden keenam indonesia</p>\r\n', '84721', '', 'id', 7),
(17, 'Presiden ketujuh', '<p>Presiden ketujuh indonesia</p>\r\n', '72631', '', 'id', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `seo_pages`
--

CREATE TABLE `seo_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `seo_pages`
--

INSERT INTO `seo_pages` (`id`, `name`) VALUES
(1, 'home'),
(2, 'checkout'),
(3, 'contacts');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seo_pages_translations`
--

CREATE TABLE `seo_pages_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `page_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_for` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `sub_for`, `position`) VALUES
(2, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_categories_translations`
--

CREATE TABLE `shop_categories_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shop_categories_translations`
--

INSERT INTO `shop_categories_translations` (`id`, `name`, `abbr`, `for_id`) VALUES
(5, 'Pejoeang', 'id', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribed`
--

CREATE TABLE `subscribed` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'notifications by email',
  `last_login` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `notify`, `last_login`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'fertyokta@gmail.com', 1, 1574616940);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_public`
--

CREATE TABLE `users_public` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_public`
--

INSERT INTO `users_public` (`id`, `name`, `email`, `phone`, `password`, `created`) VALUES
(8, 'jhon', 'jhon@email.com', '1234', '827ccb0eea8a706c4c34a16891f84e7b', '2019-11-24 16:13:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `value_store`
--

CREATE TABLE `value_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `thekey` varchar(50) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `value_store`
--

INSERT INTO `value_store` (`id`, `thekey`, `value`) VALUES
(1, 'sitelogo', 'bookseller-apple-books-400x240.png'),
(2, 'navitext', ''),
(3, 'footercopyright', 'Powered by Blackpunk © All right reserved. '),
(4, 'contactspage', 'Hello dear client'),
(5, 'footerContactAddr', 'Telkom university'),
(6, 'footerContactEmail', 'info@bukes.com'),
(7, 'footerContactPhone', '+022 - 123 456 789'),
(8, 'googleMaps', '42.671840, 83.279163'),
(9, 'footerAboutUs', 'Bukes merupakan perusahaan penjualan buku bekas online untuk membantu mahasiswa membeli buku dengan mudah dan dengan harga yang miring'),
(10, 'footerSocialFacebook', ''),
(11, 'footerSocialTwitter', 'https://twitter.com/0xblackpunk'),
(12, 'footerSocialGooglePlus', ''),
(13, 'footerSocialPinterest', ''),
(14, 'footerSocialYoutube', ''),
(16, 'contactsEmailTo', 'info@bukes.com'),
(17, 'shippingOrder', '99000'),
(18, 'addJs', ''),
(19, 'publicQuantity', '1'),
(20, 'paypal_email', ''),
(21, 'paypal_sandbox', '0'),
(22, 'publicDateAdded', '0'),
(23, 'googleApi', ''),
(24, 'template', 'bukes'),
(25, 'cashondelivery_visibility', '1'),
(26, 'showBrands', '0'),
(27, 'showInSlider', '0'),
(28, 'codeDiscounts', '1'),
(29, 'virtualProducts', '0'),
(30, 'multiVendor', '0'),
(31, 'moreInfoBtn', '0'),
(32, 'newStyle', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `confirm_links`
--
ALTER TABLE `confirm_links`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cookie_law`
--
ALTER TABLE `cookie_law`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`abbr`,`for_id`) USING BTREE;

--
-- Indeks untuk tabel `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_clients`
--
ALTER TABLE `orders_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products_translations`
--
ALTER TABLE `products_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `seo_pages`
--
ALTER TABLE `seo_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `seo_pages_translations`
--
ALTER TABLE `seo_pages_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shop_categories_translations`
--
ALTER TABLE `shop_categories_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscribed`
--
ALTER TABLE `subscribed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_public`
--
ALTER TABLE `users_public`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `value_store`
--
ALTER TABLE `value_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`thekey`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `confirm_links`
--
ALTER TABLE `confirm_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `cookie_law`
--
ALTER TABLE `cookie_law`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `orders_clients`
--
ALTER TABLE `orders_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `products_translations`
--
ALTER TABLE `products_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `seo_pages`
--
ALTER TABLE `seo_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `seo_pages_translations`
--
ALTER TABLE `seo_pages_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `shop_categories_translations`
--
ALTER TABLE `shop_categories_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `subscribed`
--
ALTER TABLE `subscribed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users_public`
--
ALTER TABLE `users_public`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `value_store`
--
ALTER TABLE `value_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
