SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `t_articles`
--

DROP TABLE IF EXISTS `t_articles`;
CREATE TABLE `t_articles` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_articles`
--

INSERT INTO `t_articles` (`id`, `category_id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`, `visible`, `date`, `last_modified`, `position`, `image`, `views`, `rate`, `author`) VALUES
(1, 1, 'Consec tetadip scinelit', 'consec-tetadip-scinelit', 'Consec tetadip scinelit', 'Articles, Business, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system\r\n', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2021-01-02 21:00:00', '2022-08-30 01:41:35', 1, 'article-1.jpg', 0, 1, 'Webmaster'),
(2, 2, 'Proin tincidunt felis', 'proin-tincidunt-felis', 'Proin tincidunt felis', 'Articles, Projects, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2021-04-02 21:00:00', '2022-08-30 01:40:31', 2, 'article-2.jpg', 3, 0, 'Webmaster'),
(3, 3, 'Lorem ipsum dolor', 'lorem-ipsum-dolor', 'Lorem ipsum dolor', 'Articles, Sales, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2021-01-02 21:00:00', '2022-08-30 01:39:41', 3, 'article-3.jpg', 0, 0, 'Webmaster');

-- --------------------------------------------------------

--
-- Table structure for table `t_articles_categories`
--

DROP TABLE IF EXISTS `t_articles_categories`;
CREATE TABLE `t_articles_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_articles_categories`
--

INSERT INTO `t_articles_categories` (`id`, `parent_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `url`, `image`, `position`, `visible`, `last_modified`) VALUES
(1, 0, 'Business advice', '', 'Business advice', 'Business advice', '', '', 'business-advice', '', 1, 1, '2022-08-30 01:41:35'),
(2, 0, 'Project management', '', 'Project management', 'Project management', '', '', 'project-management', '', 2, 1, '2022-08-30 01:40:31'),
(3, 0, 'Increased sales', '', 'Increased sales', 'Increased sales', '', '', 'increased-sales', '', 3, 1, '2022-08-30 01:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `t_banners`
--

DROP TABLE IF EXISTS `t_banners`;
CREATE TABLE `t_banners` (
  `id` int(11) NOT NULL,
  `group_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `show_all_pages` tinyint(1) NOT NULL DEFAULT '0',
  `categories` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `pages` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `brands` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `articles_categories` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_banners`
--

INSERT INTO `t_banners` (`id`, `group_id`, `name`, `position`, `visible`, `show_all_pages`, `categories`, `pages`, `brands`, `articles_categories`) VALUES
(1, '1', 'Main slider', 1, 1, 0, '0', '1', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `t_banners_images`
--

DROP TABLE IF EXISTS `t_banners_images`;
CREATE TABLE `t_banners_images` (
  `id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_banners_images`
--

INSERT INTO `t_banners_images` (`id`, `banner_id`, `name`, `alt`, `title`, `description`, `url`, `button`, `image`, `position`, `visible`) VALUES
(1, 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'starting at $129.00', '/', 'Shop Now', 'hero-slide01.png', 1, 1),
(2, 1, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'for only $1,459.99', '/', 'Shop Now', 'hero-slide02.png', 2, 1),
(3, 1, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'starting at $349.50', '/', 'Shop Now', 'hero-slide03.png', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_blog`
--

INSERT INTO `t_blog` (`id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`, `visible`, `date`, `last_modified`, `image`, `views`, `rate`) VALUES
(1, 'Lorem ipsum dolor', 'lorem-ipsum-dolor', 'Lorem ipsum dolor', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2020-12-31 21:00:00', '2022-08-30 01:38:28', 'blog-1.jpg', 0, 0),
(2, 'Consec tetadip scinelit', 'consec-tetadip-scinelit', 'Consec tetadip scinelit', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2021-01-01 21:00:00', '2022-08-30 01:37:55', 'blog-2.jpg', 6, 1),
(3, 'Proin tincidunt felis', 'proin-tincidunt-felis', 'Proin tincidunt felis', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2021-01-02 21:00:00', '2022-08-30 01:37:27', 'blog-3.jpg', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_brands`
--

DROP TABLE IF EXISTS `t_brands`;
CREATE TABLE `t_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_brands`
--

INSERT INTO `t_brands` (`id`, `name`, `name_h1`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `image`, `visible`, `last_modified`) VALUES
(1, 'Apple', '', 'apple', 'Apple', 'Apple', 'Apple', '', 'apple-logo.png', 1, '2022-08-10 22:56:52'),
(2, 'Samsung', '', 'samsung', 'Samsung', 'Samsung', 'Samsung', '', 'samsung-logo.png', 1, '2022-08-11 00:00:06'),
(3, 'DJI', '', 'dji', 'DJI', 'DJI', 'DJI', '', 'djl-logo.png', 1, '2022-08-10 01:24:11'),
(4, 'Havit', '', 'havit', 'Havit', 'Havit', 'Havit', '', 'havit-logo.png', 1, '2022-08-10 01:22:26'),
(5, 'JBL', '', 'jbl', 'JBL', 'JBL', 'JBL', '', 'jbl-logo.png', 1, '2022-08-10 01:20:18'),
(6, 'Motorola', '', 'motorola', 'Motorola', 'Motorola', 'Motorola', '', 'motorola-logo.png', 1, '2022-08-10 01:27:04'),
(7, 'Nokia', '', 'nokia', 'Nokia', 'Nokia', 'Nokia', '', 'nokia-logo.png', 1, '2022-08-10 01:04:45'),
(8, '1More', '', '1more', '1More', '1More', '1More', '', '1more-logo.png', 1, '2022-08-10 23:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `t_callbacks`
--

DROP TABLE IF EXISTS `t_callbacks`;
CREATE TABLE `t_callbacks` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_callbacks`
--

INSERT INTO `t_callbacks` (`id`, `date`, `name`, `phone`, `message`, `processed`) VALUES
(1, '2021-05-22 02:11:42', 'John Smith', '+1(234) 567-89-01', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_categories`
--

DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE `t_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_categories`
--

INSERT INTO `t_categories` (`id`, `parent_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `url`, `image`, `icon`, `code`, `position`, `visible`, `external_id`, `featured`, `last_modified`) VALUES
(1, 0, 'Tablets', '', 'Tablets', 'Tablets', 'Tablets', '', 'tablets', 'tablets-category.png', '', 'tablet', 7, 1, '', 1, '2022-08-10 22:47:58'),
(2, 0, 'Gadgets', '', 'Gadgets', 'Gadgets', 'Gadgets', '', 'gadgets', '', '', 'watch', 2, 1, '', 0, '2022-07-27 16:20:40'),
(3, 2, 'Quadcopters', '', 'Quadcopters', 'Quadcopters', 'Quadcopters', '', 'quadcopters', '', '', 'drone', 3, 1, '', 0, '2022-08-08 00:22:26'),
(4, 0, 'Accessories', '', 'Accessories', 'Accessories', 'Accessories', '', 'accessories', 'accessories-category.png', '', 'headphones', 6, 1, '', 1, '2022-08-10 04:10:13'),
(5, 2, 'Portable acoustics', '', 'Portable acoustics', 'Portable acoustics', 'Portable acoustics', '', 'portable-acoustics', '', '', 'speaker', 4, 1, '', 0, '2022-08-07 23:35:01'),
(6, 2, 'Watch', '', 'Watch', 'Watch', 'Watch', '', 'watch', '', '', 'watch-fitness', 5, 1, '', 0, '2022-08-10 22:45:34'),
(7, 0, 'Smartphones', '', 'Smartphones', 'Smartphones', 'A smartphone is a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies.', '<p><strong> Smartphone </strong>- a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies. How to choose a smartphone? The catalog of smartphones is extremely wide, and it is not easy to understand this variety. The first thing to start with is operating system. You can purchase: <a href=\"en/catalog/smartphones/operatingsystem-android\"> Android smartphones </a> the most common;<a href=\"en/catalog/smartphones/operatingsystem-ios\"> iOS smartphones </a> they are appreciated for their reliability and high speed of work; Other important criteria ; screen size and resolution, processor type, camera capabilities. \'Turbo Shop\' an online smartphone store, which features many models from leading manufacturers. Here you can buy cheap smartphones as well as mid-range devices and top models with delivery in New York and other regions of the USA.</p>', 'smartphones', 'smartphones-category.png', '', 'mobile', 1, 1, '', 1, '2022-08-11 00:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `t_categories_features`
--

DROP TABLE IF EXISTS `t_categories_features`;
CREATE TABLE `t_categories_features` (
  `category_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_categories_features`
--

INSERT INTO `t_categories_features` (`category_id`, `feature_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 11),
(1, 12),
(1, 13),
(1, 15),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 13),
(2, 15),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 9),
(3, 15),
(4, 3),
(5, 3),
(5, 15),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 12),
(6, 13),
(6, 15),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(8, 3),
(9, 3),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_comments`
--

DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('product','blog','article','review') COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comments`
--

INSERT INTO `t_comments` (`id`, `date`, `ip`, `object_id`, `name`, `text`, `type`, `approved`, `parent_id`, `admin`, `rate`, `rating`) VALUES
(1, '2021-09-24 05:10:00', '127.0.0.1', 0, 'Olivia', 'Satisfied with everything, thank you. Everything was delivered quickly.', 'review', 1, 0, 0, 2, 4),
(2, '2021-09-24 05:08:00', '127.0.0.1', 0, 'Oliver', 'Reliable store! Quickly give feedback on the order placed, delivery within 3 days. Fast and quality service.', 'review', 1, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `t_coupons`
--

DROP TABLE IF EXISTS `t_coupons`;
CREATE TABLE `t_coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `type` enum('absolute','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'absolute',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) DEFAULT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  `usages` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_coupons`
--

INSERT INTO `t_coupons` (`id`, `code`, `expire`, `type`, `value`, `min_order_price`, `single`, `usages`) VALUES
(1, 'TURBOCMS', NULL, 'percentage', '15.00', '1000.00', 0, 1),
(2, 'TESTCOUPON', '2021-01-23 22:00:00', 'percentage', '30.00', '0.00', 0, 0),
(3, 'THANKYOU', '2021-01-23 22:00:00', 'percentage', '50.00', '2000.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_currencies`
--

DROP TABLE IF EXISTS `t_currencies`;
CREATE TABLE `t_currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sign` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rate_from` decimal(10,2) NOT NULL DEFAULT '1.00',
  `rate_to` decimal(10,2) NOT NULL DEFAULT '1.00',
  `cents` int(1) NOT NULL DEFAULT '2',
  `position` int(11) NOT NULL,
  `enabled` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_currencies`
--

INSERT INTO `t_currencies` (`id`, `name`, `sign`, `code`, `rate_from`, `rate_to`, `cents`, `position`, `enabled`) VALUES
(1, 'USD', '$', 'USD', '8.98', '8.98', 0, 1, 1),
(2, 'UAH', '₴', 'UAH', '30.00', '1.00', 0, 2, 1),
(3, 'EUR', '€', 'EUR', '0.96', '1.00', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_delivery`
--

DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `separate_payment` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_delivery`
--

INSERT INTO `t_delivery` (`id`, `name`, `description`, `free_from`, `price`, `enabled`, `position`, `separate_payment`) VALUES
(1, 'Courier delivery in the city', '<p>Courier delivery is carried out by the service of the carrier companies of the city. Your order will be shipped the day after the order. Delivery takes from 1 to 3 days.</p>', '200.00', '20.00', 1, 1, NULL),
(2, 'Pickup', '<p>Convenient, free and fast way to receive an order.</p>', '0.00', '0.00', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_delivery_payment`
--

DROP TABLE IF EXISTS `t_delivery_payment`;
CREATE TABLE `t_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_delivery_payment`
--

INSERT INTO `t_delivery_payment` (`delivery_id`, `payment_method_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `t_faq`
--

DROP TABLE IF EXISTS `t_faq`;
CREATE TABLE `t_faq` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_faq`
--

INSERT INTO `t_faq` (`id`, `name`, `answer`, `visible`, `position`, `last_modified`) VALUES
(1, 'What to do if the product does not fit by form, color or size and other reasons?', '<p><span class=\"tlid-translation translation\" lang=\"en\">Within 14 days from the date of purchase of the goods (not including the date of purchase) - you can goods that have not been used, the presentation and consumer properties are preserved, and are not in the list of goods not subject to exchange or return: Exchange for a similar item without recounting the value Exchange for any other with appropriate recalculation of value Return and receive the money paid for it How to assess the safety of presentation: In good lighting, without the use of special means, the product should not have visible traces of lzovaniya as fine scratches, abrasions, and even more chips, nicks or cracks. The easiest way is to evaluate whether the presentation is preserved by answering the question: &ldquo;Would I buy this product in the same condition as a new one?&rdquo;</span></p>', 1, 1, '2022-04-20 16:09:00'),
(2, 'What is the warranty duration of my product?', '<p>The warranty period of the goods is calculated from the date of its sale. It is usually indicated in the product&rsquo;s operating document (warranty card, data sheet, label, or other document attached to the product)On the website of the manufacturer of your product.</p>', 1, 2, '2022-04-20 16:08:55'),
(3, 'Do you deliver to the apartment and rise to the floor?', '<p>Please note that targeted delivery takes place before entering the building.<br />The goods from the &ldquo;Home Appliances and Interior&rdquo; section, bulky goods from the &ldquo;Fitness&rdquo; and &ldquo;Detsky Mir&rdquo; sections (exercise machines, cribs, children\'s furniture, mattresses, etc.) are delivered to the apartment.&gt;<br />The cost of manually entering the apartment depends on: the dimensions of the equipment, the difficulty of lifting and the availability of an elevator (where the goods are placed in the package).</p>', 1, 3, '2022-04-20 16:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `t_features`
--

DROP TABLE IF EXISTS `t_features`;
CREATE TABLE `t_features` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL,
  `in_filter` tinyint(1) DEFAULT '0',
  `is_color` tinyint(1) DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url_in_product` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_features`
--

INSERT INTO `t_features` (`id`, `name`, `position`, `in_filter`, `is_color`, `url`, `url_in_product`) VALUES
(1, 'Операционная система', 2, 1, 0, 'operatingsystem', 1),
(2, 'Оперативная память', 3, 0, 0, 'ram', 0),
(3, 'Цвет', 1, 1, 1, 'color', 0),
(4, 'Процессор', 4, 0, 0, 'protsessor', 0),
(5, 'Количество ядер', 5, 0, 0, 'cores', 0),
(6, 'Тактовая частота', 6, 0, 0, 'clockrate', 0),
(7, 'Графический процессор', 7, 0, 0, 'gpu', 0),
(8, 'Встроенная память', 8, 0, 0, 'memory', 0),
(9, 'Тип карт памяти', 9, 0, 0, 'memorycardtype', 0),
(10, 'Камера', 10, 0, 0, 'camera', 0),
(11, 'Фронтальная камера', 11, 0, 0, 'frontcamera', 0),
(12, 'Тип экрана', 12, 0, 0, 'screentype', 0),
(13, 'Диагональ', 13, 0, 0, 'diagonal', 0),
(14, 'Тип аккумулятора', 14, 0, 0, 'batterytype', 0),
(15, 'Емкость аккумулятора', 15, 0, 0, 'batterycapacity', 0),
(16, 'Количество SIM-карт', 16, 0, 0, 'numberofsimcards', 0),
(17, 'Тип SIM-карты', 17, 0, 0, 'simcardtype', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_feedbacks`
--

DROP TABLE IF EXISTS `t_feedbacks`;
CREATE TABLE `t_feedbacks` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_feedbacks`
--

INSERT INTO `t_feedbacks` (`id`, `date`, `ip`, `name`, `email`, `message`, `processed`) VALUES
(1, '2021-05-22 02:08:45', '127.0.0.1', 'David Jones', 'test@gmail.com', 'How to get to you?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_files`
--

DROP TABLE IF EXISTS `t_files`;
CREATE TABLE `t_files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` enum('product','blog','page','order') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_files`
--

INSERT INTO `t_files` (`id`, `name`, `object_id`, `filename`, `type`, `position`) VALUES
(1, 'Instructions for use (PIE)', 23, 'sm-a505_a705_ds_um_open_pie_rus_rev.1.0_190607.pdf', 'product', 0),
(2, 'Instructions for use (QQ)', 23, 'sm-a505_a705fn_um_cis_qq_rus_rev.1.0_200407.pdf', 'product', 1),
(3, '', 39, 'iphone-12-mini-ios14-info-rs.pdf', 'product', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_groups`
--

DROP TABLE IF EXISTS `t_groups`;
CREATE TABLE `t_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_groups`
--

INSERT INTO `t_groups` (`id`, `name`, `discount`) VALUES
(1, 'Regular customer', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `t_images`
--

DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_images`
--

INSERT INTO `t_images` (`id`, `name`, `product_id`, `filename`, `position`) VALUES
(269, '', 1, 'apple-ipad-mini-2.png', 269),
(268, '', 1, 'apple-ipad-mini-1.png', 268),
(309, '', 2, 'samsung-galaxy-tab-1.png', 309),
(310, '', 2, 'samsung-galaxy-tab-2.png', 310),
(271, '', 3, 'apple-ipad-air-1.png', 0),
(272, '', 3, 'apple-ipad-air-2.png', 1),
(246, '', 5, 'dji-mavic-pro-1.png', 0),
(240, '', 4, 'dji-mavic-air-1.png', 240),
(241, '', 4, 'dji-mavic-air-2.png', 241),
(247, '', 5, 'dji-mavic-pro-2.png', 247),
(248, '', 5, 'dji-mavic-pro-3.png', 248),
(238, '', 6, 'dji-phantom-4-2.png', 1),
(270, '', 6, 'dji-phantom-4-1.png', 0),
(264, '', 35, 'samsung-galaxy-watch-1.png', 0),
(308, '', 7, 'havit-g1.png', 308),
(256, '', 9, 'jbl-flip-4-red-1.png', 256),
(257, '', 9, 'jbl-flip-4-red-2.png', 257),
(254, '', 10, 'jbl-flip-4-blue-1.png', 254),
(255, '', 10, 'jbl-flip-4-blue-2.png', 255),
(253, '', 11, 'jbl-flip-4-black-2.png', 253),
(252, '', 11, 'jbl-flip-4-black-1.png', 0),
(263, '', 12, 'samsung-galaxy-watch-active-green-1.png', 0),
(259, '', 13, 'apple-watch-4-black-1.png', 0),
(324, '', 34, 'samsung-galaxy-watch-active-1.png', 0),
(258, '', 14, 'apple-watch-4-silver-1.png', 258),
(260, '', 15, 'apple-watch-4-white-1.png', 260),
(306, '', 8, '1more-quad-driver-1.png', 306),
(319, '', 17, 'motorola-moto-g6-1.png', 319),
(320, '', 17, 'motorola-moto-g6-2.png', 320),
(321, '', 18, 'nokia-42-ds-3-2.png', 1),
(322, '', 18, 'nokia-42-ds-3-1.png', 0),
(285, '', 19, 'samsung-galaxy-fold-1.png', 0),
(286, '', 19, 'samsung-galaxy-fold-2.png', 1),
(287, '', 19, 'samsung-galaxy-fold-3.png', 287),
(288, '', 19, 'samsung-galaxy-fold-4.png', 288),
(296, '', 16, 'apple-airpods-4.png', 296),
(293, '', 16, 'apple-airpods-1.png', 293),
(294, '', 16, 'apple-airpods-2.png', 294),
(295, '', 16, 'apple-airpods-3.png', 295),
(283, '', 20, 'samsung-galaxy-s10-1.png', 283),
(284, '', 20, 'samsung-galaxy-s10-2.png', 284),
(282, '', 21, 'samsung-galaxy-a30-2.png', 282),
(281, '', 21, 'samsung-galaxy-a30-1.png', 281),
(325, '', 22, 'samsung-galaxy-m30-1.png', 325),
(326, '', 22, 'samsung-galaxy-m30-2.png', 326),
(278, '', 23, 'samsung-galaxy-a50-2.png', 1),
(277, '', 23, 'samsung-galaxy-a50-1.png', 0),
(279, '', 23, 'samsung-galaxy-a50-blue-2.png', 2),
(280, '', 23, 'samsung-galaxy-a50-white-2.png', 3),
(275, '', 24, 'samsung-galaxy-a10-1.png', 275),
(276, '', 24, 'samsung-galaxy-a10-2.png', 276),
(273, '', 25, 'samsung-galaxy-a20-2.png', 1),
(274, '', 25, 'samsung-galaxy-a20-1.png', 0),
(338, '', 26, 'samsung-galaxy-a70-1.png', 338),
(339, '', 26, 'samsung-galaxy-a70-2.png', 339),
(341, '', 33, 'apple-iphone-x-2.png', 1),
(331, '', 27, 'samsung-galaxy-a40-1.png', 331),
(332, '', 27, 'samsung-galaxy-a40-2.png', 332),
(330, '', 29, 'samsung-galaxy-a80-2.png', 1),
(333, '', 30, 'samsung-galaxy-a20-1.png', 333),
(335, '', 32, 'samsung-galaxy-s7-1.png', 0),
(336, '', 32, 'samsung-galaxy-s7-2.png', 1),
(337, '', 32, 'samsung-galaxy-s7-3.png', 2),
(354, '', 31, 'apple-iphone-7-1.png', 354),
(355, '', 31, 'apple-iphone-7-2.png', 355),
(329, '', 29, 'samsung-galaxy-a80-1.png', 0),
(334, '', 30, 'samsung-galaxy-a20-2.png', 334),
(340, '', 33, 'apple-iphone-x-1.png', 0),
(351, '', 39, 'apple-iphone-12-green-2.png', 7),
(342, '', 39, 'apple-iphone-12-black-1.png', 0),
(343, '', 39, 'apple-iphone-12-black-2.png', 1),
(350, '', 39, 'apple-iphone-12-green-1.png', 6),
(353, '', 39, 'apple-iphone-12-blue-2.png', 3),
(352, '', 39, 'apple-iphone-12-blue-1.png', 2),
(346, '', 39, 'apple-iphone-12-red-1.png', 4),
(347, '', 39, 'apple-iphone-12-red-2.png', 5),
(348, '', 39, 'apple-iphone-12-white-1.png', 8),
(349, '', 39, 'apple-iphone-12-white-2.png', 9),
(327, '', 28, 'samsung-galaxy-a2-1.png', 327),
(328, '', 28, 'samsung-galaxy-a2-2.png', 328);

-- --------------------------------------------------------

--
-- Table structure for table `t_labels`
--

DROP TABLE IF EXISTS `t_labels`;
CREATE TABLE `t_labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_labels`
--

INSERT INTO `t_labels` (`id`, `name`, `color`, `position`) VALUES
(1, 'call back', '#d9534f', 1),
(2, 'expected product', '#3f80ea', 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_languages`
--

DROP TABLE IF EXISTS `t_languages`;
CREATE TABLE `t_languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_languages`
--

INSERT INTO `t_languages` (`id`, `name`, `label`, `enabled`, `position`) VALUES
(1, 'Russian', 'ru', 1, 3),
(2, 'English', 'en', 1, 1),
(3, 'Ukrainian', 'ua', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_articles`
--

DROP TABLE IF EXISTS `t_lang_articles`;
CREATE TABLE `t_lang_articles` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_articles`
--

INSERT INTO `t_lang_articles` (`lang_id`, `lang_label`, `article_id`, `name`, `author`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(1, '', 1, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Бизнес, Вебмастер', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Consec tetadip scinelit', 'Webmaster', 'Consec tetadip scinelit', 'Articles, Business, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system\r\n', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Проекты, Вебмастер', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Бізнес, Вебмайстер', 'Заголовок демонстраційної статті h2 Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(2, '', 2, 'Proin tincidunt felis', 'Webmaster', 'Proin tincidunt felis', 'Articles, Projects, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Проекти, Вебмайстер', 'Заголовок демонстраційної статті h2 Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 3, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Продажи, Вебмастер', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Lorem ipsum dolor', 'Webmaster', 'Lorem ipsum dolor', 'Articles, Sales, Webmaster', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>');
INSERT INTO `t_lang_articles` (`lang_id`, `lang_label`, `article_id`, `name`, `author`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(3, '', 3, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Продажі, Вебмайстер', 'Заголовок демонстраційної статті h2 Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_articles_categories`
--

DROP TABLE IF EXISTS `t_lang_articles_categories`;
CREATE TABLE `t_lang_articles_categories` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_articles_categories`
--

INSERT INTO `t_lang_articles_categories` (`lang_id`, `lang_label`, `article_category_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, '', 1, 'Бизнес-советы', '', 'Бизнес-советы', 'Бизнес-советы', '', ''),
(2, '', 1, 'Business advice', '', 'Business advice', 'Business advice', '', ''),
(3, '', 1, 'Бізнес-поради', '', 'Бізнес-поради', 'Бізнес-поради', '', ''),
(1, '', 2, 'Управление проектами', '', 'Управление проектами', 'Управление проектами', '', ''),
(2, '', 2, 'Project management', '', 'Project management', 'Project management', '', ''),
(1, '', 3, 'Повышение продаж', '', 'Повышение продаж', 'Повышение продаж', '', ''),
(3, '', 2, 'Управління проектами', '', 'Управління проектами', 'Управління проектами', '', ''),
(2, '', 3, 'Increased sales', '', 'Increased sales', 'Increased sales', '', ''),
(3, '', 3, 'Підвищення продажів', '', 'Підвищення продажів', 'Підвищення продажів', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_banners_images`
--

DROP TABLE IF EXISTS `t_lang_banners_images`;
CREATE TABLE `t_lang_banners_images` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_banners_images`
--

INSERT INTO `t_lang_banners_images` (`lang_id`, `lang_label`, `banner_image_id`, `name`, `alt`, `title`, `description`, `url`, `button`) VALUES
(1, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'от $129.00', '/', 'Купить'),
(2, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'starting at $129.00', '/', 'Shop Now'),
(3, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'від $129,00', '/', 'Купити'),
(1, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'всего за $1459,99', '/', 'Купить'),
(2, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'for only $1,459.99', '/', 'Shop Now'),
(3, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'всього за $1459,99', '/', 'Купити'),
(1, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'от $349,50', '/', 'Купить'),
(2, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'starting at $349.50', '/', 'Shop Now'),
(3, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'від $349,50', '/', 'Купити');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_blog`
--

DROP TABLE IF EXISTS `t_lang_blog`;
CREATE TABLE `t_lang_blog` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_blog`
--

INSERT INTO `t_lang_blog` (`lang_id`, `lang_label`, `blog_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(1, '', 1, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Бизнес, Продажи, Финансы', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Lorem ipsum dolor', 'Lorem ipsum dolor', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Бізнес, Продажі, Фінанси', 'Заголовок демонстраційної статті h2 Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Бизнес, Продажи, Финансы', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 2, 'Consec tetadip scinelit', 'Consec tetadip scinelit', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Бізнес, Продажі, Фінанси', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 3, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Бизнес, Продажи, Финансы', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Proin tincidunt felis', 'Proin tincidunt felis', 'Business, Sales, Finance', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>');
INSERT INTO `t_lang_blog` (`lang_id`, `lang_label`, `blog_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(3, '', 3, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Бізнес, Продажі, Фінанси', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">.</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_brands`
--

DROP TABLE IF EXISTS `t_lang_brands`;
CREATE TABLE `t_lang_brands` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_brands`
--

INSERT INTO `t_lang_brands` (`lang_id`, `lang_label`, `brand_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple', ''),
(2, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple', ''),
(3, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple', ''),
(1, '', 2, 'Samsung', '', 'Samsung', 'Samsung', 'Samsung', ''),
(2, '', 2, 'Samsung', '', 'Samsung', 'Samsung', 'Samsung', ''),
(3, '', 2, 'Samsung', '', 'Samsung', 'Samsung', 'Samsung', ''),
(1, '', 3, 'DJI', '', 'DJI', 'DJI', 'DJI', ''),
(2, '', 3, 'DJI', '', 'DJI', 'DJI', 'DJI', ''),
(3, '', 3, 'DJI', '', 'DJI', 'DJI', 'DJI', ''),
(1, '', 4, 'Havit', '', 'Havit', 'Havit', 'Havit', ''),
(2, '', 4, 'Havit', '', 'Havit', 'Havit', 'Havit', ''),
(3, '', 4, 'Havit', '', 'Havit', 'Havit', 'Havit', ''),
(1, '', 5, 'JBL', '', 'JBL', 'JBL', 'JBL', ''),
(2, '', 5, 'JBL', '', 'JBL', 'JBL', 'JBL', ''),
(3, '', 5, 'JBL', '', 'JBL', 'JBL', 'JBL', ''),
(1, '', 6, 'Motorola', '', 'Motorola', 'Motorola', 'Motorola', ''),
(2, '', 6, 'Motorola', '', 'Motorola', 'Motorola', 'Motorola', ''),
(3, '', 6, 'Motorola', '', 'Motorola', 'Motorola', 'Motorola', ''),
(1, '', 7, 'Nokia', '', 'Nokia', 'Nokia', 'Nokia', ''),
(2, '', 7, 'Nokia', '', 'Nokia', 'Nokia', 'Nokia', ''),
(3, '', 7, 'Nokia', '', 'Nokia', 'Nokia', 'Nokia', ''),
(1, '', 8, '1More', '', '1More', '1More', '1More', ''),
(2, '', 8, '1More', '', '1More', '1More', '1More', ''),
(3, '', 8, '1More', '', '1More', '1More', '1More', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_categories`
--

DROP TABLE IF EXISTS `t_lang_categories`;
CREATE TABLE `t_lang_categories` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_categories`
--

INSERT INTO `t_lang_categories` (`lang_id`, `lang_label`, `category_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, '', 1, 'Планшеты', '', 'Планшеты', 'Планшеты', 'Планшеты', ''),
(1, '', 2, 'Гаджеты', '', 'Гаджеты', 'Гаджеты', 'Гаджеты', ''),
(1, '', 3, 'Квадрокоптеры', '', 'Квадрокоптеры', 'Квадрокоптеры', 'Квадрокоптеры', ''),
(1, '', 4, 'Аксессуары', '', 'Аксессуары', 'Аксессуары', 'Аксессуары', ''),
(1, '', 5, 'Портативная акустика', '', 'Портативная акустика', 'Портативная акустика', 'Портативная акустика', ''),
(1, '', 6, 'Часы', '', 'Часы', 'Часы', 'Часы', ''),
(1, '', 7, 'Смартфоны', '', 'Смартфоны', 'Смартфоны', 'Смартфон – универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов.', '<p><strong>Смартфон</strong> &ndash; универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов. Как выбрать смартфон? Каталог смартфонов чрезвычайно широк, и разобраться в этом многообразии нелегко. Первое, с чего стоит начать, &ndash; операционная система. Вы можете приобрести: <a href=\"catalog/smartphones/operatingsystem-android\">смартфоны Android&nbsp;</a>&ndash; наиболее распространенные; <a href=\"catalog/smartphones/operatingsystem-ios\">смартфоны iOS</a> &ndash; их ценят за надежность и высокую скорость работы; Другие важные критерии &ndash; размер и разрешение экрана, тип процессора, возможности камеры. &laquo;Turbo Shop&raquo; &ndash; интернет-магазин смартфонов, в котором представлено множество моделей от ведущих производителей. Здесь вы можете купить как дешевые смартфоны, так и устройства среднего класса и топовые модели с доставкой по Москве и другим регионам РФ.</p>'),
(2, 'en', 1, 'Tablets', '', 'Tablets', 'Tablets', 'Tablets', ''),
(2, 'en', 2, 'Gadgets', '', 'Gadgets', 'Gadgets', 'Gadgets', ''),
(2, 'en', 3, 'Quadcopters', '', 'Quadcopters', 'Quadcopters', 'Quadcopters', ''),
(2, 'en', 4, 'Accessories', '', 'Accessories', 'Accessories', 'Accessories', ''),
(2, 'en', 5, 'Portable acoustics', '', 'Portable acoustics', 'Portable acoustics', 'Portable acoustics', ''),
(2, 'en', 6, 'Watch', '', 'Watch', 'Watch', 'Watch', ''),
(2, 'en', 7, 'Smartphones', '', 'Smartphones', 'Smartphones', 'A smartphone is a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies.', '<p><strong> Smartphone </strong>- a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies. How to choose a smartphone? The catalog of smartphones is extremely wide, and it is not easy to understand this variety. The first thing to start with is operating system. You can purchase: <a href=\"en/catalog/smartphones/operatingsystem-android\"> Android smartphones </a> the most common;<a href=\"en/catalog/smartphones/operatingsystem-ios\"> iOS smartphones </a> they are appreciated for their reliability and high speed of work; Other important criteria ; screen size and resolution, processor type, camera capabilities. \'Turbo Shop\' an online smartphone store, which features many models from leading manufacturers. Here you can buy cheap smartphones as well as mid-range devices and top models with delivery in New York and other regions of the USA.</p>'),
(3, 'ua', 1, 'Планшети', '', 'Планшети', 'Планшети', 'Планшети', ''),
(3, 'ua', 2, 'Гаджети', '', 'Гаджети', 'Гаджети', 'Гаджети', ''),
(3, 'ua', 3, 'Квадрокоптери', '', 'Квадрокоптери', 'Квадрокоптери', 'Квадрокоптери', ''),
(3, 'ua', 4, 'Аксесуари', '', 'Аксесуари', 'Аксесуари', 'Аксесуари', ''),
(3, 'ua', 5, 'Портативна акустика', '', 'Портативна акустика', 'Портативна акустика', 'Портативна акустика', ''),
(3, 'ua', 6, 'Годинники', '', 'Годинники', 'Годинники', 'Годинники', ''),
(3, 'ua', 7, 'Смартфони', '', 'Смартфони', 'Смартфони', 'Смартфон - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. ', '<p><strong>Смартфон</strong> - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. Як вибрати смартфон? Каталог смартфонів надзвичайно широкий, і розібратися в цьому різноманітті нелегко. Перше, з чого варто почати, - операційна система. Ви можете придбати: &bull; смартфони Android - найбільш поширені; &bull; смартфони iOS - їх цінують за надійність і високу швидкість роботи; Інші важливі критерії - розмір і дозвіл екрана, тип процесора, можливості камери. &laquo;Turbo Shop&raquo; - інтернет-магазин смартфонів, в якому представлено безліч моделей від провідних виробників. Тут ви можете купити як дешеві смартфони, так і пристрої середнього класу і топові моделі з доставкою по Києву та іншим регіонам України.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_currencies`
--

DROP TABLE IF EXISTS `t_lang_currencies`;
CREATE TABLE `t_lang_currencies` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_currencies`
--

INSERT INTO `t_lang_currencies` (`lang_id`, `lang_label`, `currency_id`, `name`, `sign`) VALUES
(1, '', 1, 'USD', '$'),
(2, '', 1, 'USD', '$'),
(3, '', 1, 'USD', '$'),
(1, '', 2, 'UAH', '₴'),
(2, '', 2, 'UAH', '₴'),
(3, '', 2, 'UAH', '₴'),
(2, '', 3, 'EUR', '€'),
(3, '', 3, 'EUR', '€'),
(1, '', 3, 'EUR', '€');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_delivery`
--

DROP TABLE IF EXISTS `t_lang_delivery`;
CREATE TABLE `t_lang_delivery` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_delivery`
--

INSERT INTO `t_lang_delivery` (`lang_id`, `lang_label`, `delivery_id`, `name`, `description`) VALUES
(1, '', 1, 'Курьерская доставка по городу', '<p>Курьерская доставка осуществляется службой компаний-перевозчиков города. Ваш заказ будет отправлен на следующий день после заказа. Доставка занимает от 1 до 3 дней.</p>'),
(2, '', 1, 'Courier delivery in the city', '<p>Courier delivery is carried out by the service of the carrier companies of the city. Your order will be shipped the day after the order. Delivery takes from 1 to 3 days.</p>'),
(1, '', 2, 'Самовывоз', '<p>Удобный, бесплатный и быстрый способ получения заказа.</p>'),
(3, '', 1, 'Кур\'єрська доставка по місту', '<p>Кур\'єрська доставка здійснюється службою компаній-перевізників міста. Ваше замовлення буде відправлений на наступний день після замовлення. Доставка займає від 1 до 3 днів.</p>'),
(2, '', 2, 'Pickup', '<p>Convenient, free and fast way to receive an order.</p>'),
(3, '', 2, 'Самовивіз', '<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_faq`
--

DROP TABLE IF EXISTS `t_lang_faq`;
CREATE TABLE `t_lang_faq` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_faq`
--

INSERT INTO `t_lang_faq` (`lang_id`, `lang_label`, `faq_id`, `name`, `answer`) VALUES
(1, '', 1, 'Что делать, если товар не подошел по форме, цвету или размеру и другие причины?', '<p>В течение 14 дней от даты приобретения товара (не считая дату покупки) - Вы можете товар, который не использовался, сохранен товарный вид и потребительские свойства, и отсутствует в перечне товаров, не подлежащих обмену или возврату: Обменять на аналогичный без пересчета стоимости Обменять на любой другой с соответствующим перерасчетом стоимости Вернуть и получить уплаченные за него денежные средства Как оценить сохранность товарного вида: При хорошем освещении, без применения специальных средств, на товаре не должно быть видимых следов пользования в виде мелких царапин, потертостей, а тем более сколов, вмятин или трещин. Проще всего оценить сохранен ли товарный вид, ответив себе на вопрос: &laquo;Купил бы я этот товар в таком виде, как новый?\"</p>'),
(2, '', 1, 'What to do if the product does not fit by form, color or size and other reasons?', '<p><span class=\"tlid-translation translation\" lang=\"en\">Within 14 days from the date of purchase of the goods (not including the date of purchase) - you can goods that have not been used, the presentation and consumer properties are preserved, and are not in the list of goods not subject to exchange or return: Exchange for a similar item without recounting the value Exchange for any other with appropriate recalculation of value Return and receive the money paid for it How to assess the safety of presentation: In good lighting, without the use of special means, the product should not have visible traces of lzovaniya as fine scratches, abrasions, and even more chips, nicks or cracks. The easiest way is to evaluate whether the presentation is preserved by answering the question: &ldquo;Would I buy this product in the same condition as a new one?&rdquo;</span></p>'),
(1, '', 2, 'Какой гарантийный срок у моего товара?', '<p>Гарантийный срок товара исчисляется со дня его продажи. Он обычно указан в эксплуатационном документе на товар (гарантийном талоне, техническом паспорте, этикетке или в другом документе, прилагаемом к товару). &nbsp;На сайте производителя Вашего товара</p>'),
(3, '', 1, 'Що робити, якщо товар не підійшов за формою, кольору або розміром і інші причини?', '<p>Протягом 14 днів від дати придбання товару (не рахуючи дати придбання) - Ви можете товар, який не використовувався, збережено товарний вигляд і споживчі властивості, і відсутня в переліку товарів, що не підлягають обміну або поверненню: Обміняти на аналогічний без перерахунку вартості Обміняти на будь-який інший з відповідним перерахуванням вартості Повернути і отримати сплачені за нього кошти Як оцінити збереження товарного вигляду: При хорошому освітленні, без застосування спеціальних засобів, на товарі не повинно бути видимих ​​слідів п льзованія у вигляді дрібних подряпин, потертостей, а тим більше відколів, вм\'ятин або тріщин. Найпростіше оцінити збережений чи товарний вигляд, відповівши собі на питання: &laquo;Купив би я цей товар в такому вигляді, як новий?\"</p>'),
(2, '', 2, 'What is the warranty duration of my product?', '<p>The warranty period of the goods is calculated from the date of its sale. It is usually indicated in the product&rsquo;s operating document (warranty card, data sheet, label, or other document attached to the product)On the website of the manufacturer of your product.</p>'),
(1, '', 3, 'Осуществляете ли вы доставку до квартиры и подъем на этаж?', '<p>Пожалуйста, обратите внимание, что адресная доставка осуществляется до входа в здание.<br />Товары из раздела &laquo;Бытовая техника и интерьер&raquo;, крупногабаритные товары из разделов \"Фитнес\", и \"Детский мир\" (тренажеры, детские кроватки, детская мебель, матрасы и т. д.)доставляются до квартиры.<br />Стоимость ручного заноса в квартиру зависит от: габаритов техники, сложности подъема и наличия лифта (куда товар помещается в упаковке).</p>'),
(3, '', 2, 'Який гарантійний термін мій товар?', '<p>Гарантійний термін товару обчислюється з його продажу. Він зазвичай зазначений в експлуатаційному документі на товар (гарантійному талоні, технічному паспорті, етикетці або іншому документі, що додається до товару). На сайті виробника Вашого товару.</p>'),
(2, '', 3, 'Do you deliver to the apartment and rise to the floor?', '<p>Please note that targeted delivery takes place before entering the building.<br />The goods from the &ldquo;Home Appliances and Interior&rdquo; section, bulky goods from the &ldquo;Fitness&rdquo; and &ldquo;Detsky Mir&rdquo; sections (exercise machines, cribs, children\'s furniture, mattresses, etc.) are delivered to the apartment.&gt;<br />The cost of manually entering the apartment depends on: the dimensions of the equipment, the difficulty of lifting and the availability of an elevator (where the goods are placed in the package).</p>'),
(3, '', 3, 'Чи здійснюєте ви доставку до квартири і підйом на поверх?', '<p>Будь ласка, зверніть увагу, що адресна доставка здійснюється до входу в будівлю.<br />Товари з розділу &laquo;побутова техніка і інтер\'єр&raquo;, великогабаритні товари з розділів \"фітнес\", і \"дитячий світ\" (тренажери, дитячі ліжечка, дитячі меблі, матраци і т. д.) доставляються до квартири.<br />Вартість ручного занесення в квартиру залежить від: габаритів техніки, складності підйому і наявності ліфта (куди товар поміщається в упаковці).</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_features`
--

DROP TABLE IF EXISTS `t_lang_features`;
CREATE TABLE `t_lang_features` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_features`
--

INSERT INTO `t_lang_features` (`lang_id`, `lang_label`, `feature_id`, `name`) VALUES
(1, '', 1, 'Операционная система'),
(1, '', 2, 'Оперативная память'),
(1, '', 3, 'Цвет'),
(1, '', 4, 'Процессор'),
(1, '', 5, 'Количество ядер'),
(1, '', 6, 'Тактовая частота'),
(1, '', 7, 'Графический процессор'),
(1, '', 8, 'Встроенная память'),
(1, '', 9, 'Тип карт памяти'),
(1, '', 10, 'Камера'),
(1, '', 11, 'Фронтальная камера'),
(1, '', 12, 'Тип экрана'),
(1, '', 13, 'Диагональ'),
(1, '', 14, 'Тип аккумулятора'),
(1, '', 15, 'Емкость аккумулятора'),
(1, '', 16, 'Количество SIM-карт'),
(1, '', 17, 'Тип SIM-карты'),
(2, 'en', 1, ' Operating system'),
(2, 'en', 2, 'RAM'),
(2, 'en', 3, 'Color'),
(2, 'en', 4, 'CPU'),
(2, 'en', 5, 'Cores'),
(2, 'en', 6, 'Clock rate'),
(2, 'en', 7, 'GPU'),
(2, 'en', 8, 'Memory'),
(2, 'en', 9, 'Memory card type'),
(2, 'en', 10, 'Camera'),
(2, 'en', 11, 'Front-camera'),
(2, 'en', 12, 'Screen type'),
(2, 'en', 13, 'Diagonal'),
(2, 'en', 14, 'Battery type'),
(2, 'en', 15, 'Battery capacity'),
(2, 'en', 16, 'Number of SIM-cards'),
(2, 'en', 17, 'SIM card type'),
(3, 'ua', 1, 'Операційна система'),
(3, 'ua', 2, 'Оперативна пам\'ять'),
(3, 'ua', 3, 'Колір'),
(3, 'ua', 4, 'Процессор'),
(3, 'ua', 5, 'Кількість ядер'),
(3, 'ua', 6, 'Тактова частота'),
(3, 'ua', 7, 'Графічний процесор'),
(3, 'ua', 8, 'Пам\'ять'),
(3, 'ua', 9, 'Тип карт пам\'яті'),
(3, 'ua', 10, 'Камера'),
(3, 'ua', 11, 'Фронтальна камера'),
(3, 'ua', 12, 'Тип екрану'),
(3, 'ua', 13, 'Діагональ'),
(3, 'ua', 14, 'Тип акумулятора'),
(3, 'ua', 15, 'Ємність аккумулятору'),
(3, 'ua', 16, 'Кількість SIM-карт'),
(3, 'ua', 17, 'Тип SIM-карти');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_files`
--

DROP TABLE IF EXISTS `t_lang_files`;
CREATE TABLE `t_lang_files` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_files`
--

INSERT INTO `t_lang_files` (`lang_id`, `lang_label`, `file_id`, `name`) VALUES
(1, '', 1, 'Инструкция по использованию (PIE)'),
(1, '', 2, 'Инструкция по использованию (QQ)'),
(2, '', 1, 'Instructions for use (PIE)'),
(2, '', 2, 'Instructions for use (QQ)'),
(3, '', 1, 'Інструкція з використання (PIE)'),
(3, '', 2, 'Інструкція з використання (QQ)'),
(2, '', 3, ''),
(1, '', 3, ''),
(3, '', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_pages`
--

DROP TABLE IF EXISTS `t_lang_pages`;
CREATE TABLE `t_lang_pages` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_pages`
--

INSERT INTO `t_lang_pages` (`lang_id`, `lang_label`, `page_id`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `header`) VALUES
(1, '', 1, 'Главная', 'Главная', 'Этот магазин является демонстрацией скрипта интернет-магазина  Turbo CMS. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях. ', 'Главная', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href=\"https://turbo-cms.com/\">Turbo</a>. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.&nbsp;</p>', 'Главная'),
(2, '', 1, 'Home', 'Home', 'This store is a demonstration of the script for the online store Turbo CMS. All materials on this site are for demonstration purposes only.', 'Home', '<p>This store is a demonstration of the script for the online store <a href=\"https://turbo-cms.com/\"> Turbo </a>. All materials on this site are for demonstration purposes only.</p>', 'Home'),
(3, '', 1, 'Головна', 'Головна', 'Цей магазин є демонстрацією скрипта інтернет-магазину Turbo CMS . Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.', 'Головна', '<p>Цей магазин є демонстрацією скрипта інтернет-магазину <a href=\"https://turbo-cms.com/\"> Turbo </a>. Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.</p>', 'Головна'),
(1, '', 2, 'Все товары', 'Все товары', 'Все товары', 'Все товары', '', 'Все товары'),
(2, '', 2, 'All products', 'All products', 'All products', 'All products', '', 'All products'),
(3, '', 2, 'Всі товари', 'Всі товари', 'Всі товари', 'Всі товари', '', 'Всі товари'),
(1, '', 3, '404', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(2, '', 3, '404', 'Page not found', 'Page not found', 'Page not found', '<p>Page not found</p>', 'Page not found'),
(3, '', 3, '404', 'Сторінка не знайдена', 'Сторінка не знайдена', 'Сторінка не знайдена', '<p>Сторінка не знайдена</p>', 'Сторінка не знайдена'),
(1, '', 4, 'Карта сайта', 'Карта сайта', 'Карта сайта', 'Карта сайта', '', 'Карта сайта'),
(2, '', 4, 'Sitemap', 'Sitemap', 'Sitemap', 'Sitemap', '', 'Sitemap'),
(3, '', 4, 'Карта сайту', 'Карта сайту', 'Карта сайту', 'Карта сайту', '', 'Карта сайту'),
(1, '', 5, 'Новинки', 'Новинки', 'Новинки', 'Новинки', '', 'Новинки'),
(2, '', 5, 'New', 'New', 'New', 'New', '', 'New'),
(3, '', 5, 'Новинки', 'Новинки', 'Новинки', 'Новинки', '', 'Новинки'),
(1, '', 6, 'Рекомендуемые', 'Рекомендуемые', 'Рекомендуемые', 'Рекомендуемые', '', 'Рекомендуемые'),
(2, '', 6, 'Featured', 'Featured', 'Featured', 'Featured', '', 'Featured'),
(3, '', 6, 'Рекомендовані', 'Рекомендовані', 'Рекомендовані', 'Рекомендовані', '', 'Рекомендовані'),
(1, '', 7, 'Распродажа', 'Распродажа', 'Распродажа', 'Распродажа', '', 'Распродажа'),
(2, '', 7, 'Sale', 'Sale', 'Sale', 'Sale', '', 'Sale'),
(3, '', 7, 'Розпродаж', 'Розпродаж', 'Розпродаж', 'Розпродаж', '', 'Розпродаж'),
(1, '', 8, 'Хиты', 'Хиты', 'Хиты', 'Хиты', '', 'Хиты'),
(2, '', 8, 'Hit', 'Hit', 'Hit', 'Hit', '', 'Hit'),
(3, '', 8, 'Хіти', 'Хіти', 'Хіти', 'Хіти', '', 'Хіти'),
(1, '', 9, 'Избранное', 'Избранное', 'Избранное', 'Избранное', '', 'Избранное'),
(2, '', 9, 'Wishlist', 'Wishlist', 'Wishlist', 'Wishlist', '', 'Wishlist'),
(3, '', 9, 'Обране', 'Обране', 'Обране', 'Обране', '', 'Обране'),
(1, '', 10, 'Сравнение', 'Сравнение', 'Сравнение', 'Сравнение', '', 'Сравнение'),
(2, '', 10, 'Compare', 'Compare', 'Compare', 'Compare', '', 'Compare'),
(3, '', 10, 'Порівняння', 'Порівняння', 'Порівняння', 'Порівняння', '', 'Порівняння'),
(1, '', 11, 'Оплата', 'Оплата', 'Оплата', 'Оплата', '<h2>Наличными курьеру</h2>\r\n<p>Вы можете оплатить заказ курьеру в гривнах непосредственно в момент доставки. Курьерская доставка осуществляется по Киеву на следующий день после принятия заказа.</p>\r\n<h2>Банковская карта</h2>\r\n<p>Оплата банковской картой Visa или MasterCard.</p>\r\n<h2>Через терминал</h2>\r\n<p>Оплатите наличными через многочисленные терминалы в любом городе. Можно заплатить и с банковской карты через многие банкоматы.&nbsp;</p>\r\n<h2>Со счета мобильного телефона</h2>\r\n<p>Оплата со счета мобильного телефона.</p>\r\n<h2>Квитанция</h2>\r\n<p>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</p>\r\n<h2>PayPal</h2>\r\n<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>\r\n<h2>Оплата через Интеркассу</h2>\r\n<p>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</p>\r\n<h2>Оплата картой через Liqpay.com</h2>\r\n<p>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</p>', 'Оплата'),
(2, '', 11, 'Payment', 'Payment', 'Payment\r\n', 'Payment', '<h2>Cash</h2>\r\n<p>You can pay the courier directly in rubles at the time of delivery. The Express delivery within New York next day after order acceptance.</p>\r\n<h2>PayPal</h2>\r\n<p>Make purchases&nbsp;safely,&nbsp;without disclosing information&nbsp;about your credit card.&nbsp;PayPal&nbsp;will protect&nbsp;you if&nbsp;problems occur&nbsp;with purchase.</p>', 'Payment'),
(3, '', 11, 'Оплата', 'Оплата', 'Оплата\r\n', 'Оплата', '<h2>Готівкою кур\'єру</h2>\r\n<p>Ви можете оплатити замовлення кур\'єру в гривнях безпосередньо в момент доставки. Кур\'єрська доставка здійснюється по Києву на наступний день після прийняття замовлення.</p>\r\n<h2>Банківська картка</h2>\r\n<p>Оплата банківською картою Visa або MasterCard.</p>\r\n<h2>PayPal</h2>\r\n<p>Робіть покупки безпечно, без розкриття інформації про свою кредитну картку. PayPal захистить вас, якщо виникнуть проблеми з покупкою.</p>\r\n<h2>Оплата через Інтеркаса</h2>\r\n<p>Це зручний у використанні сервіс, підключення до якого дозволить Інтернет-магазинам, веб-сайтам та іншим торговим майданчикам приймати всі можливі форми оплати в максимально короткі терміни.</p>\r\n<h2>Оплата карткою через Liqpay</h2>\r\n<p>Завдяки своїй відкритості та універсальності LiqPAY стрімко інтегрується з багатьма платіжними системами і платформами і стає стандартом платіжних операцій.</p>\r\n<h2>Готівкою в офісі Нова Пошта</h2>\r\n<p>При доставці замовлення системою Нова Пошта, ви зможете оплатити замовлення в їхньому офісі безпосередньо в момент отримання товарів.</p>', 'Оплата'),
(1, '', 12, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Курьерская доставка по Киеву</h2>\r\n<p>Курьерская доставка осуществляется на следующий день после оформления заказа, если товар есть в наличии. Курьерская доставка осуществляется в пределах Киева ежедневно с 10.00 до 21.00. Заказ на сумму свыше 1000 гривен доставляется бесплатно.<br /><br />Стоимость бесплатной доставки раcсчитывается от суммы заказа с учтенной скидкой. В случае если сумма заказа после применения скидки менее 1000 грн, осуществляется платная доставка.<br /><br />При сумме заказа менее 1000 грн стоимость доставки составляет от 100 грн.</p>\r\n<h2>Самовывоз</h2>\r\n<p>Удобный,&nbsp;бесплатный и быстрый способ получения заказа.<br />Адрес офиса: <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"ru\" data-language-to-translate-into=\"uk\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Киев, ул.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"ru\" data-language-to-translate-into=\"uk\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Глубочицкая, 32б</span></span>.</p>\r\n<h2>Доставка с помощью предприятия &laquo;Новая Почта&raquo;</h2>\r\n<p>Удобный и быстрый способ доставки в города Украины. Посылка доставляется в офис &laquo;Новая Почта&raquo; в вашем городе. Для получения необходимо предъявить паспорт и номер грузовой декларации (сообщит наш менеджер после отправки). Посылку желательно получить в течение 24 часов с момента прихода груза, иначе компания &laquo;Новая Почта&raquo; может взыскать с вас дополнительную оплату за хранение. Срок доставки и стоимость вы можете рассчитать на сайте компании.</p>\r\n<h2>Наложенным платежом</h2>\r\n<p>При доставке заказа наложенным платежом с помощью &laquo;Новая Почта&raquo;, вы сможете оплатить заказ непосредственно в момент получения товаров.</p>', 'Доставка'),
(2, '', 12, 'Delivery', 'Delivery', 'Delivery', 'Delivery', '<h2>Shipping within New York</h2>\r\n<p>Courier delivery is made&nbsp;the next day&nbsp;after ordering,&nbsp;if the item is in stock.&nbsp;Courier delivery is made&nbsp;within the New York&nbsp;daily from&nbsp;10.00 to&nbsp;21.00.&nbsp;For orders&nbsp;more than $300 delivered free of charge.<br /><br />Cost&nbsp;free delivery is calculated&nbsp;from&nbsp;the total order&nbsp;with&nbsp;the discount&nbsp;taken into account.&nbsp;If the order amount&nbsp;after applying the discount&nbsp;less than $300,&nbsp;is&nbsp;a paid service.</p>\r\n<p>For orders&nbsp;less than $300,&nbsp;the&nbsp;delivery&nbsp;cost is $50.</p>\r\n<h2>Store pickup</h2>\r\n<p>Convenient, free&nbsp;and&nbsp;fast way of receiving your order.</p>\r\n<p>Office address:&nbsp;41 West 40th Street New York, NY</p>\r\n<h2>C.O.D (Cash On Delivery)</h2>\r\n<p>On delivery order cash on delivery through \"mail of USA\", you will be able to pay for the order at the time goods are received.</p>', 'Delivery'),
(3, '', 12, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Кур\'єрська доставка по Києву</h2>\r\n<p>Кур\'єрська доставка здійснюється на наступний день після оформлення замовлення, якщо товар є в наявності. Кур\'єрська доставка здійснюється в межах Києва; щодня з 10.00 до 21.00. Замовлення на суму понад 300 грн доставляється безкоштовно. Вартість безкоштовної доставки Розраховувати від суми замовлення з врахованої знижкою. У разі якщо сума замовлення після застосування знижки менш 300 грн, здійснюється платна доставка. При сумі замовлення менше 300 грн вартість доставки складає від 50 грн.</p>\r\n<h2>Самовивіз</h2>\r\n<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення. Місцезнаходження компанії: Київ, вул. Глибочицька, 32б.</p>\r\n<h2>Доставка за допомогою підприємства &laquo;Нова Пошта&raquo;</h2>\r\n<p>Зручний і швидкий спосіб доставки у великі міста України. Посилка доставляється в офіс &laquo;Нова пошта&raquo; у Вашому місті. Для отримання необхідно пред\'явити паспорт і номер вантажної декларації (повідомить наш менеджер після відправки). Посилку бажано отримати протягом 24 годин з моменту приходу вантажу, інакше компанія &laquo;Нова Пошта&raquo; може стягнути з Вас додаткову оплату за зберігання. Термін доставки і вартість Ви можете розрахувати на сайті компанії.</p>\r\n<h2>Післяплата</h2>\r\n<p>При доставці замовлення післяплатою за допомогою &laquo;Нова Пошта&raquo;, ви зможете оплатити замовлення безпосередньо в момент отримання товарів.</p>', 'Доставка'),
(1, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(2, '', 13, 'Blog', 'Blog', '', 'Blog', '', 'Blog'),
(3, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(1, '', 14, 'Контакты', 'Контакты', 'Контакты', 'Контакты', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"ru\" data-language-to-translate-into=\"uk\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Киев, ул.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"ru\" data-language-to-translate-into=\"uk\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Глубочицкая, </span></span>32б, 02000</p>\r\n<p>Телефон: (095) 545-54-54</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1269.9307677918514!2d30.49195294945491!3d50.46230305803582!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x84a28f327eb7dc52!2z0JDRgNC10L3QtNCwINC-0YTQuNGB!5e0!3m2!1sru!2sua!4v1609513285692!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Контакты'),
(2, '', 14, 'Contacts', 'Contacts', 'Contacts', 'Contacts', '<p>41 West 40th Street New York, NY</p>\r\n<p>Phone: (210) 876-5432</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4399.518506840664!2d-73.97964170435294!3d40.75394620817656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259aa94a61b4f%3A0x8ebce7fe1262c134!2zNDEgVyA0MHRoIFN0LCBOZXcgWW9yaywgTlkgMTAwMTgsINCh0KjQkA!5e0!3m2!1sru!2sua!4v1609512981791!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Contacts'),
(3, '', 14, 'Контакти', 'Контакти', 'Контакти', 'Контакти', '<p>Київ, вул. Глибочицька, 32б, 02000</p>\r\n<p>Телефон: (095) 545-54-54</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1269.9307677918514!2d30.49195294945491!3d50.46230305803582!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x84a28f327eb7dc52!2z0JDRgNC10L3QtNCwINC-0YTQuNGB!5e0!3m2!1sru!2sua!4v1609513285692!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Контакти'),
(1, '', 15, 'Бренды', 'Бренды', '', 'Бренды', '', 'Бренды'),
(2, '', 15, 'Brands', 'Brands', '', 'Brands', '', 'Brands'),
(3, '', 15, 'Бренди', 'Бренди', '', 'Бренди', '', 'Бренди'),
(1, '', 16, 'Статьи', 'Статьи', '', 'Статьи', '', 'Статьи'),
(2, '', 16, 'Articles', 'Articles', '', 'Articles', '', 'Articles'),
(3, '', 16, 'Статті', 'Статті', '', 'Статті', '', 'Статті'),
(1, '', 17, 'Каталог', 'Каталог', '', 'Каталог', '', 'Каталог'),
(2, '', 17, 'Catalog', 'Catalog', '', 'Catalog', '', 'Catalog'),
(3, '', 17, 'Каталог', 'Каталог', '', 'Каталог', '', 'Каталог'),
(1, '', 18, 'Поиск', 'Поиск', '', 'Поиск', '', 'Поиск'),
(2, '', 18, 'Search', 'Search', '', 'Search', '', 'Search'),
(3, '', 18, 'Пошук', 'Пошук', '', 'Пошук', '', 'Пошук'),
(1, '', 22, 'Смартфоны на ios', 'Смартфоны на ios', 'Смартфоны операционная система: ios', 'Смартфоны на ios', '<p>Смартфоны операционная система: ios</p>', 'Смартфоны на ios'),
(2, '', 22, 'IOS smartphones', 'IOS smartphones', 'Smartphones operating system: IOS', 'IOS smartphones', '<p>Smartphones operating system: ios</p>', 'IOS smartphones'),
(1, '', 23, 'Смартфоны на android', 'Смартфоны на android', 'Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться. ', 'Смартфоны на android', '<p>Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться.</p>\r\n<p>Покупка смартфона Android &mdash; отличное решение и для тех, кто желает быстро получать актуальные обновления и пользоваться всеми возможностями, предоставляемыми ОС. Многие известные производители, конкурируя друг с другом, предлагают покупателям новые модели телефонов на Android в любых ценовых категориях.</p>', 'Смартфоны на android'),
(3, '', 22, 'Смартфони на ios', 'Смартфони на ios', 'Смартфони операційна система: ios', 'Смартфони на ios', '<p>Смартфони операційна система: ios</p>', 'Смартфони на ios'),
(1, '', 21, 'Смартфоны Samsung', 'Смартфоны Samsung', 'Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.', 'Смартфоны Samsung', '<p>Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.</p>', 'Смартфоны Samsung'),
(2, '', 21, 'Samsung smartphones ', 'Samsung smartphones ', 'Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.', 'Samsung smartphones ', '<p>Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.</p>', 'Samsung smartphones '),
(3, '', 21, 'Смартфони Samsung', 'Смартфони Samsung', 'Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.', 'Смартфони Samsung', '<p>Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.</p>', 'Смартфони Samsung'),
(2, '', 23, 'Android smartphones', 'Android smartphones', 'Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.', 'Android smartphones', '<p>Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.</p>\r\n<p>Buying an Android smartphone is also an excellent solution for those who want to quickly receive up-to-date updates and use all the features provided by the OS. Many well-known manufacturers, competing with each other, offer customers new models of Android phones in any price range</p>', 'Android smartphones'),
(2, '', 24, 'Apple smartphones', 'Apple smartphones', 'Apple smartphones are presented in a wide range', 'Apple smartphones', '<p>Apple smartphones are presented in a wide range</p>', 'Apple smartphones'),
(3, '', 24, 'Смартфони Apple', 'Смартфони Apple', 'Смартфони Apple представлені в широкому асортименті', 'Смартфони Apple', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Смартфони Apple</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">представлені</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">в</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">широкому</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">асортименті</span></p>', 'Смартфони Apple'),
(3, '', 23, 'Смартфони на android', 'Смартфони на android', 'Телефони на «Андроїд» забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися.', 'Смартфони на android', '<p>Телефони на &laquo;Андроїд&raquo; забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися.</p>\r\n<p>Купівля смартфона Android - відмінне рішення і для тих, хто бажає швидко отримувати оновлення й пакети користуватися всіма можливостями, наданими ОС. Багато відомих виробників, конкуруючи один з одним, пропонують покупцям нові моделі телефонів на Android в будь-яких цінових категоріях.</p>', 'Смартфони на android'),
(1, '', 24, 'Смартфоны Apple', 'Смартфоны Apple', 'Смартфоны Apple представлены в широком ассортименте', 'Смартфоны Apple', '<p>Смартфоны Apple представлены в широком ассортименте</p>', 'Смартфоны Apple'),
(1, '', 25, 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 'FAQ'),
(2, '', 25, 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 'FAQ'),
(3, '', 25, 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 'FAQ'),
(1, '', 26, 'Отзывы', 'Отзывы', 'Отзывы', 'Отзывы', '', 'Отзывы'),
(2, '', 26, 'Reviews', 'Reviews', 'Reviews', 'Reviews', '', 'Reviews'),
(3, '', 26, 'Відгуки', 'Відгуки', 'Відгуки', 'Відгуки', '', 'Відгуки');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_payment_methods`
--

DROP TABLE IF EXISTS `t_lang_payment_methods`;
CREATE TABLE `t_lang_payment_methods` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_payment_methods`
--

INSERT INTO `t_lang_payment_methods` (`lang_id`, `lang_label`, `payment_id`, `name`, `description`) VALUES
(1, '', 2, 'Оплата картой через Liqpay', '<p>LiqPay &mdash; платежная система, позволяющая проводить оплату банковскими картами MasterСard и VISA, а также наличными через терминалы самообслуживания Приватбанка. Оплата возможна после входа в аккаунт через номер мобильного телефона.</p>'),
(2, '', 2, 'Liqpay', '<p>LiqPay is a payment system that allows you to pay with MasterCard and VISA credit cards, as well as in cash through Privatbank self-service terminals. Payment is possible after entering the account through a mobile phone number.</p>'),
(1, '', 3, 'Оплата наличными курьеру', '<p>Если вы не хотите предварительно оплачивать заказ, у вас есть возможность рассчитаться с курьером наличными в момент получения посылки. Чтобы процесс был максимально комфортным и для вас, и для курьера, рекомендуем заранее подготовить нужную сумму.</p>'),
(3, '', 2, 'Оплата карткою через Liqpay', '<p>LiqPay - платіжна система, що дозволяє проводити оплату банківськими картами MasterСard і VISA, а також готівкою через термінали самообслуговування Приватбанку. Оплата можлива після входу в обліковий запис через номер мобільного телефону.</p>'),
(2, '', 3, 'Cash payment to courier', '<p>If you do not want to pre-pay the order, you have the opportunity to pay the courier in cash at the time of receipt of the parcel. To make the process as comfortable as possible for both you and the courier, we recommend that you prepare the required amount in advance.</p>'),
(1, '', 4, 'PayPal', '<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>'),
(3, '', 3, 'Оплата готівкою кур\'єру', '<p>Якщо ви не хочете попередньо оплачувати замовлення, у вас є можливість розрахуватися з кур\'єром готівкою в момент отримання посилки. Щоб процес був максимально комфортним і для вас, і для кур\'єра, рекомендуємо заздалегідь підготувати потрібну суму.</p>'),
(2, '', 4, 'PayPal', '<p>PayPal is a global e-commerce business allowing payments and money transfers to be made through the Internet. Online money transfers serve as electronic alternatives to paying with traditional paper methods, such as checks and money orders.</p>'),
(3, '', 4, 'PayPal', '<p>Робіть покупки безпечно, без розкриття інформації про свою кредитну картку. PayPal захистить вас, якщо виникнуть проблеми з покупкою.</p>'),
(1, '', 5, 'Оплата через WayForPay', '<p>WayForPay &mdash; это онлайн-сервис с оплатой через банковские карты платежных систем VISA и MasterCard. Доступные методы платежа: Приват 24, терминал, сервис обслуживает прием платежей через систему Bitcoin.</p>'),
(2, '', 5, 'WayForPay', '<p>WayForPay is an online service with payment through bank cards of VISA and MasterCard payment systems. Available payment methods: Privat 24, terminal, the service serves the acceptance of payments through the Bitcoin system.</p>'),
(3, '', 5, 'Оплата через WayForPay', '<p>WayForPay - це онлайн-сервіс з оплатою через банківські картки платіжних систем VISA і MasterCard. Доступні методи платежу: Приват 24, термінал, сервіс обслуговує прийом платежів через систему Bitcoin.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_products`
--

DROP TABLE IF EXISTS `t_lang_products`;
CREATE TABLE `t_lang_products` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_products`
--

INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br /><br />iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br /><br />iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br /><br /><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br /><br />Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br /><br /><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br /><br />iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br /><br /><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br /><br /><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br /><br />На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br /><br /><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. '),
(1, '', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br /><br />Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br /><br /><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br /><br />Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br /><br /><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br /><br />Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br /><br /><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br /><br />Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br /><br /><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br /><br /><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br /><br />Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br /><br /><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br /><br />Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br /><br /><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br /><br />Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br /><br /><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br /><br />Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br /><br /><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br /><br /><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br /><br />Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br /><br /><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br /><br />Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме. '),
(1, '', 3, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br /><br />iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br /><br /><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br /><br />Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br /><br /><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br /><br />Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br /><br /><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br /><br /><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br /><br />iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br /><br /><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br /><br />Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br /><br /><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br /><br />Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br /><br /><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br /><br /><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br /><br />Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br /><br /><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br /><br />Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br /><br /><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br /><br />На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br /><br /><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br /><br />В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br /><br /><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone'),
(1, '', 4, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'DJI Mavic Air – новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.'),
(1, '', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'DJI Mavic Pro Fly More Combo – модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.'),
(1, '', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'DJI Phantom 4 Pro – модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. '),
(1, '', 7, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. '),
(1, '', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. '),
(1, '', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.\r\n'),
(1, '', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.'),
(1, '', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.'),
(1, '', 12, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br><br>Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br><br><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br><br>Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br><br><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br><br>Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br><br><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br><br>Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br><br>Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br><br><strong>SAMSUNG HEALTH</strong>&nbsp;<br><br>С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br><br><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br><br>Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br><br>Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br><br><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br><br>Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br><br><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br><br>Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br><br><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br><br>Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br><br><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br><br>С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br><br><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br><br>Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов. '),
(1, '', 13, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 14, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 15, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 16, 'Apple AirPods', '<p>Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;Это вещи самодостаточные и часто уникальные.&nbsp;Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей. Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</p>', '<h2>Магия звука</h2>\r\n<p>Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;Это вещи самодостаточные и часто уникальные.&nbsp;Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</p>\r\n<h2>Зачем наушников процессор?</h2>\r\n<p>В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</p>\r\n<h2>Достойная автономность</h2>\r\n<p>Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение. Это вещи самодостаточные и часто уникальные. Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.'),
(1, '', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. '),
(1, '', 18, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br />Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Смартфоны', 'Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. '),
(1, '', 19, 'Samsung Galaxy Fold', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4380 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.<span id=\"hscc\"></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Самсунг Галакси Fold — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.'),
(1, '', 20, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. '),
(1, '', 21, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Смартфоны', 'Самсунг Галакси A30 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 22, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.'),
(1, '', 23, 'Samsung Galaxy A50', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.'),
(1, '', 24, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.'),
(1, '', 25, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.'),
(1, '', 26, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.'),
(1, '', 27, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 — замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.'),
(1, '', 28, 'Samsung Galaxy A2', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.</p>', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобильные телефоны', 'Самсунг Галакси A2 Core — отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.'),
(1, '', 29, 'Samsung Galaxy A80', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx. Оснащен очень мощным аккумулятором на 3700 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте! Подробней с техническими характеристиками смартфона Galaxy A80 можно ознакомиться ниже.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.'),
(1, '', 30, 'Samsung Galaxy A20e', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. '),
(1, '', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>', '<p>ВЕЛИКОЛЕПНАЯ СЕМЕРКА</p>\r\n<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>\r\n<p>ПРИТЯГИВАЕТ ВНИМАНИЕ</p>\r\n<p>iPhone 7 притягивает к себе внимание. Уникальный цвет &laquo;черный оникс&raquo; радует глаз благородной игрой света на глянцевой поверхности и гранях. Корпус защищен от брызг и воды. Обновлены кнопка &laquo;Домой&raquo; и дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОМОЙ&raquo;</p>\r\n<p>Стала сенсорной и получила чувствительность к силе нажатия. Благодаря встроенному Taptic Engine тактильный отклик при нажатии получил несколько уровней интенсивности. Чем сильнее нажатие на кнопку, тем сильнее отклик телефона &mdash; это новый опыт использования и восприятия.</p>\r\n<p>ВЛАГОЗАЩИТА КОРПУСА</p>\r\n<p>Конструкция корпуса iPhone изменилась и внутри. Смартфон нового поколения защищен по стандарту IP67 от влаги и пыли.</p>\r\n<p>КАРДИНАЛЬНО НОВЫЙ ВЗГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 установлен новый модуль камеры с 6-линзовым объективом со светосилой &fnof;/1.8 и оптической стабилизацией. Сенсор стал в 2 раза быстрее. Вспышка с 4 диодами. Специальный ISP-процессор управляет работой камеры. Все это выводит качество снимков на новый уровень, особенно в условиях недостаточной освещенности. Фронтальная камера оснащена сенсором 7 Мп с улучшенным цветовым диапазоном. Получить четкие и яркие селфи теперь еще проще.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильные телефоны', 'Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка «Домой» теперь поддерживает Force Touch.'),
(1, '', 32, 'Samsung Galaxy S7', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px.</p>', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ик-порт, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобильные телефоны', 'Самсунг Галакси S7 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн.'),
(1, '', 33, 'Apple iPhone X', '<p>Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;с переосмысленной системой управления.&nbsp;</p>', '<p>&nbsp;Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;<br>с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благодаря мощнейшей внутренней 64 битной архитектуре. Разительно улучшенная самая популярная в мире мобильная камера.&nbsp;<br>Именно таким видит свой флагманский смартфон компания Apple в 2017 году.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобильные телефоны', 'Apple iPhone X – воплощение лучших инновационных решений. Абсолютно новый дизайн с переосмысленной системой управления. '),
(2, 'en', 1, 'Apple iPad mini', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">7.9\" Retina display with True Tone technology.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">And Apple Pencil support to make it even easier for you to follow inspiration.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">It\'s still the same iPad mini, but now it can do more.</span></span></p>', '<p><strong>REALLY BIG</strong>&nbsp;<br><br>The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.&nbsp;<br><br><strong>COMPACT. PORTABLE. POCKET-ABLE</strong>&nbsp;<br><br>The iPad mini is incredibly compact and lightweight, making it easy to keep you company wherever you go. It weighs less than 400g and is 6.1mm thick and fits perfectly in a pocket or bag. It is very comfortable to hold in your hand and can be quickly pulled out of your pocket when inspiration calls for it.&nbsp;<br><br><strong>PERFORMANCE GOES BEYOND SIZE</strong>&nbsp;<br><br>The power and intelligence of iPad mini comes from the A12 Bionic Processor with Neural Engine. Using machine learning technologies, the processor quickly recognizes patterns, suggests options, and learns from experience. Work in Adobe Photoshop CC, augmented reality, immersive games with console-level graphics - there\'s enough power for everything.&nbsp;<br><br><strong>It\'s NOT THE DISPLAY SIZE, IT\'S THE PIXEL QUALITY</strong>&nbsp; <br><br>iPad mini has a stunning 7.9-inch display with over 3 million pixels. And Apple made the most of each. High brightness, wide color gamut, and anti-reflective coating make iPad mini perfect for any environment. Whether you\'re reading a book in the park or editing a video at home, images and text will always look as clear and natural as possible. And True Tone technology automatically adjusts white balance based on lighting, so colors look even more natural.&nbsp;<br><br><strong>STAY CONNECTED. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad mini let you capture amazing photos and videos. And that\'s not all. You can FaceTime with friends, scan documents, make notes on them, or even plan furniture rearrangements using AR (augmented reality) technology.&nbsp;<br><br><strong>APPLE PENCIL. FIT GREAT</strong>&nbsp;<br><br>Apple Pencil (sold separately) brings a million new possibilities to iPad. With it, iPad mini will turn into an incredibly convenient digital notebook. Take handwritten notes, fill out forms, and sign documents. Or get creative and sketch and draw on the go.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF YOUR IPAD</strong>&nbsp;<br><br>With iOS, the compact iPad mini lets you do the things you want iPad to do. Use multiple applications at the same time, move files with simple multi-touch gestures, open your favorite applications from the Dock. And with the Files app, all your content is always at your fingertips.&nbsp;<br><br><strong>A MILLION POSSIBILITIES IN ONE IPAD MINI</strong>&nbsp;<br><br>On iPad mini installed excellent Apple applications for everyday tasks - Photos, Maps, Messages, Mail, Safari and others. And there are over a million more iPad apps available in the App Store, making it easy to find the ones you need. Edit videos, socialize, sketch or immerse yourself in exciting online games.&nbsp;<br><br><strong>YOUR DATA BELONG TO YOU ONLY</strong>&nbsp;<br><br>How and all Apple products, iPad mini has been designed with strict privacy guidelines in mind. Touch ID is a simple and secure authentication system for iPad mini. And with Apple Pay, you can pay for purchases quickly and securely. Just touch the Touch ID sensor and you\'re done.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Tablets', 'JUST AS BIG The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" '),
(2, 'en', 2, 'Samsung Galaxy Tab', '<p>Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for entertainment and multitasking.</p>', '<p><strong>MULTITASKING WITHOUT LIMITS</strong>&nbsp;<br><br>Designed with your busy lifestyle and need to constantly work on the go, the new Samsung Galaxy Tab S4 is your ultimate entertainment and entertainment companion. multitasking.&nbsp;<br><br><strong>SAMSUNG DEX TO MAKE YOUR WORK PRODUCTIVE</strong>&nbsp;<br><br>Samsung DeX is now compatible with the Samsung Galaxy Tab for the first time S4. Now the high productivity of work on the PC has become available on the tablet. Multitasking is available via an HDMI adapter without the need for a Samsung DeX dock or DeX pad, and you can add a keyboard, mouse or monitor for greater efficiency.&nbsp;<br><br><strong>READY TO WORK</strong>&amp;nbsp ;<br><br>Everything is at hand for the working mode. The desktop on the screen of the Galaxy Tab S4 tablet is implemented as on a regular PC, i.e. with a taskbar, multi-window support and file drag and drop functionality. If you want to have a familiar desktop on your screen, just launch Samsung DeX from the Quick Access Toolbar and add an Android compatible keyboard and mouse.&nbsp;<br><br><strong>WORK MORE EFFICIENTLY</strong>&nbsp;&lt; br /&gt;<br>The productivity of your work depends on how comfortable the working environment is. This is where using Samsung DeX with an external monitor can help. On a large monitor screen, you can continue to use the Android interface of your tablet. Or look at the monitor and use the tablet as a touchpad, pad with S Pen or touch keyboard.&nbsp;<br><br><strong>IT IS NOT OFF - IT IS IN STANDBY MODE</strong>&nbsp;<br><br>If you have a new idea, capture it on the tablet screen so you don\'t forget. With the Galaxy Tab S4\'s off-screen note-taking feature, you can quickly jot down your thoughts even on a black screen with the versatile S Pen. The thinnest 0.7mm rubber tip lets you easily and accurately take notes and sketch.&nbsp;<br><br><strong>IMPROVED PERFORMANCE</strong>&nbsp;<br><br>Speed Samsung Galaxy Tab S4\'s LTE data transfer rate is up to 1Gbps, so you\'ll have plenty of time to do other things. And with 64GB of onboard storage, expandable up to 400GB with a microSD card slot, you\'ll have plenty of room to store your documents and videos.&nbsp;<br><br><strong>DIVE DOWN ENTERTAINMENT ATMOSPHERE</strong>&nbsp;<br><br>Despite its compact size, the Galaxy Tab S4 has a large visual workspace. Thanks to the narrowest possible frame and the absence of the Samsung logo and the Home button, the screen diagonal is actually 10.5 inches. And the enhanced 16:10 aspect ratio of the sAMOLED screen creates a more immersive viewing experience for your favorite content.&nbsp;<br><br><strong>SURROUND YOURSELF WITH HIGH QUALITY SOUND</strong>&nbsp;<br><br>Four speakers, tuned by the world famous AKG company, provide sound like in real life. Now you can experiment with the adaptive audio feature created by the experts at AKG. And Dolby Atmos delivers immersive 3D sound for a lifelike experience.&nbsp;<br><br><strong>WATCH VIDEOS WITHOUT TIME</strong>&nbsp;<br>&lt; br /&gt;Galaxy Tab S4 is equipped with a 7300 mAh battery that allows you to watch videos up to 16 hours, so you can watch your favorite movies or series without thinking about the time. And if the battery runs out, you can fully charge it in just 200 minutes thanks to the quick charge function.&nbsp;<br><br><strong>USEFUL EVEN IN STANDBY MODE</strong>&nbsp;<br>&lt; br /&gt;In sleep mode, the Galaxy Tab S4 turns into a smart home display. If the tablet is charging or \"sleeping\", then using the Daily Board function, you can set the display mode for your favorite photos on the screen. In addition, the tablet can be a useful assistant and display on the screen not only the current weather forecast, but also the date and time, acting as a calendar.&nbsp;<br><br><strong>UNLOCKING WITH THE HELP OF THE IRIS</strong> &nbsp;<br><br>In addition to face recognition, the Galaxy Tab S4 now supports iris scanning. To unlock your tablet, just scan your face or iris. Built-in encryption and a secure folder, combined with bio-identification functions, will ensure the safety of your files and applications.&nbsp;<br><br><strong>MULTIPLE SECURITY SYSTEM</strong>&nbsp;<br><br>Keep your data is secure. The Samsung Knox security platform is activated from the moment you turn on your tablet. Multi-layered real-time security puts your data in a secure folder that only you have access to. Keep your work and personal data separate.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Tablets', 'MULTITASKING WITHOUT LIMITS Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for multitasking and entertainment.'),
(2, 'en', 3, 'Apple iPad Air', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">iPad Air gives you access to the most advanced Apple designs.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">A12 Bionic processor with Neural Engine.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">10.5\" Retina display with True Tone technology.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Support for Apple Pencil and Smart Keyboard.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Plus, at just 6.1mm thin, iPad Air weighs less than 500g, so you can easily carry it with you wherever you go.</span></span></p>', '<p><strong>TO ALL THE LOVE OF POWERFUL TECHNOLOGY</strong>&nbsp;<br><br>iPad Air gives you access to Apple\'s most advanced designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g so you can easily carry it with you.&nbsp;<br><br><strong>EVERYTHING YOU NEED. NO WEIGHT</strong>&nbsp;<br><br>Despite the large 10.5-inch Retina display, iPad Air is very compact. It is great for solving a variety of tasks literally on the go. To do this, it is equipped with the most advanced wireless technology, as well as a battery that lasts up to 10 hours without recharging. That\'s almost a whole day.&nbsp;<br><br><strong>POWER ENOUGH FOR EVERYTHING, AT ONCE</strong>&nbsp;<br><br>The power and intelligence of iPad Air comes from the A12 Bionic processor with Neural Engine. The processor uses real-time machine learning technology to deliver incredible experiences for photography, gaming, augmented reality and more. You can edit videos, make impressive presentations, design 3D models, watch your favorite series online. And do it all at the same time.&nbsp;<br><br><strong>SUPER-FAST GRAPHICS FOR GAMES AND APPS</strong>&nbsp;<br><br>Stunning AR performance, incredible graphics experience , photorealistic graphics in 3D games - the 4-core graphics system of the A12 Bionic processor is behind it all.&nbsp;<br><br><strong>EVERYTHING IS DONE BEAUTIFUL</strong>&nbsp;<br><br>iPad Air features a 10.5-inch Retina display with wide color gamut. I want to look at this display endlessly. Photos, videos and games look alive and natural down to the smallest detail. And regardless of the environment, True Tone technology, increased brightness and anti-reflective coating help to ensure the highest quality image.&nbsp;<br><br><strong>TRUE TONE. EASY ON THE EYES IN ANY LIGHT</strong>&nbsp;<br><br>True Tone technology automatically adjusts white balance based on ambient light. Therefore, the image on the display looks more natural and comfortable for the eyes in any conditions - both during the evening reading and when you paint a sunny landscape in the open air.&nbsp;<br><br><strong>Keep in touch. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad Air let you capture stunning photos and 1080p HD video. And that\'s not all. You can communicate via FaceTime with several interlocutors, scan and immediately send documents. And even create your own worlds - iPad Air cameras work great with augmented reality technologies (augmented reality).&nbsp;<br><br><strong>PLAY, WORK AND BE CREATIVE IN Augmented Reality</strong>&nbsp;<br><br>When virtual objects and data become part of the real world, completely new horizons open up before you. With front and rear cameras, an A12 Bionic processor with Neural Engine, a large natural color display, and accurate motion tracking, iPad is the perfect device for living in augmented reality.&nbsp;<br><br><strong>SEND. DRAW. FOLLOW INSPIRATION</strong>&nbsp;<br><br>Apple Pencil (sold separately) captures hand movements with amazing precision and speed. It is comfortable to hold in your hand like a regular pencil. However, he can do much more. With Apple Pencil, your iPad Air can become a notepad or an artist\'s canvas - you have many options.&nbsp;<br><br><strong>TAKE NOTES. COMMENT ON DOCUMENTS AND SCREENSHOTS. AND MORE</strong>&nbsp;<br><br>Taking notes or jotting down ideas on iPad Air is as easy as writing on a piece of paper. You can mark up documents, add pictures to your notes, take screenshots, and add comments to them.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF IPAD</strong>&nbsp;<br><br>iOS is an advanced mobile operating system that lets you control your iPad Air with simple taps. Apple calls them gestures, and they give you full access to all of the iPad Air\'s large display and smart technologies. With the multitasking feature, you can use your favorite applications at the same time - just select them from the Dock. And files can be moved from one application to another and sorted in the Files app in any way you like.&nbsp;<br><br><strong>ALL YOUR FILES HAVE BEEN GONE</strong>&nbsp;<br><br>The Files app lets you work with content that can be stored on your iPad Air, iCloud Drive, or other cloud services such as Box and Dropbox. Either way, your files will always be available - easy and simple.&nbsp;<br><br><strong>YOUR IPAD MAKES YOUR INTEREST</strong>&nbsp;<br><br>The iPad Air comes with excellent</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Tablets', 'iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. '),
(2, 'en', 4, 'DJI Mavic Air', '<p>DJI Mavic Air is a new compact drone that is even smaller, faster, more reliable and more comfortable to fly.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Its main advantage is the expanded functionality of the camera, which can now create spherical panoramas, ideal for viewing with virtual reality glasses.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">In addition, several selfie video scenarios are available to the user - slow distance, orbiting, spiraling, a sharp rise and an imitation of a boomerang flight.</span></span></p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Quadcopters', 'The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. '),
(2, 'en', 5, 'DJI Mavic Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Mavic Pro Fly More Combo is a model of an unmanned aerial vehicle from a famous manufacturer.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">You can take it with you on trips, outdoor photo shoots, sports competitions and any other events.</span></span></p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Quadcopters', 'Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.'),
(2, 'en', 6, 'DJI Phantom 4 Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Phantom 4 Pro is an upgraded model of the famous aircraft.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.</span></span></p>', '<p>Quadcopter&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps. Such characteristics allow you to create full-size burst photos at up to 14 frames per second, as well as record videos with C4K resolution (4096 x 2160) and a frame rate of up to 60 per second. The user only needs to select the appropriate memory card &ndash; its maximum volume reaches 128 GB.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Improved dynamic capabilities</strong>. Despite the upgrade of the technical part, the mass of the quadrocopter has not increased &ndash; this was facilitated by the use of a frame made of magnesium, aluminum and titanium. The device can spend up to 30 minutes in the air, rising to a height of up to 6 kilometers above sea level. The maximum horizontal flight speed is 20 m / s (72 km / h), and the rise &ndash; 6 m/s (21.6 km/h). An advanced dual-band radio control system allows the aircraft to exchange signals with the remote control at a distance of up to 7 km in the absence of obstacles.</li>\r\n<li><strong>Total security</strong>. The FlightAutonomy system received two new micro-cameras and two infrared sensors located on the sides. Thanks to this, the quadcopter can recognize obstacles even in low light and automatically correct the course to avoid a collision. This feature is useful for both beginners and professional videographers, who get the opportunity to focus on the shooting process.</li>\r\n<li><strong>Easy management</strong>. There is nothing superfluous on the standard remote &ndash; the aircraft can be controlled using two mini-joysticks and two buttons. All additional functions are activated using a proprietary mobile application. In the standard version, the remote control is equipped with a holder for a smartphone, and in the PLUS version &ndash; retractable screen with a very bright backlight (1000 cd/m2), allowing you to see all the details of the image even when exposed to direct sunlight.</li>\r\n<li><strong>Automatic Flight Programs</strong>. DRAW technology allows you to draw the course of a quadrocopter on the touch screen &ndash; the device will follow it at a constant altitude, allowing you to pay maximum attention to the precise aiming of the camera. In addition, the aircraft can simply be shown the end point to which it will reach, bypassing all obstacles. Videographers will especially benefit from the automatic tracking of a moving object and the release of the shutter when gestures are recognized.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Quadcopters', 'Quadcopter DJI Phantom 4 Pro – modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.'),
(2, 'en', 7, 'Havit G1 Black/Red', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">You can play sports for even longer, and secure earbuds will provide you with maximum comfort.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">One charge of the earbuds is enough for 3.5 hours of active use.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Headphones are protected from sweat and water, which makes it possible to use the headphones even under extreme load conditions.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">And two acoustic heads will blow your workouts with a bang.</span></span></p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Accessories', 'With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort.'),
(2, 'en', 8, '1MORE Quad Driver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</span></span></p>', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>\r\n<p>The frequency range is amazing - from 20 Hz to 40 kHz, headphone sensitivity is 99 dB at a resistance of 32 ohms. The remote control has 3 buttons (volume control, call reception) and a microphone with noise and interference suppression. The 3.5mm mini jack is shaped like an \"L\" to ensure durability, even when carried in your pocket with your smartphone all the time.</p>\r\n<p>The polymer braid of the wires is resistant to wear, abrasion and creases, inside the structure is reinforced by Kevlar threads. The set includes a stylish gift box, a hard case, a 6.3 mm adapter, an air adapter, and 8 pairs of interchangeable ear tips of various sizes. Designed for uncompromising music enjoyment, these headphones are the best choice for true music lovers.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Accessories', 'The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.'),
(2, 'en', 9, 'JBL Flip 4 Red', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 10, 'JBL Flip 4 Blue', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 11, 'JBL Flip 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 12, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(2, 'en', 13, 'Apple Watch 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.'),
(2, 'en', 14, 'Apple Watch 4 Silver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.'),
(2, 'en', 15, 'Apple Watch 4 White', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.'),
(2, 'en', 16, 'Apple AirPods', '<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>', '<h2>Sound magic</h2>\r\n<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>\r\n<h2>Why a headphone processor?</h2>\r\n<p>In the list of technical characteristics of Apple AirPods, we can see the W1 processor. Moreover, he answers in this model not only for the formation of a sound signal. Headphones know what you are doing at the moment: Whether you are using 1 or 2 headphones, talking or listening to music - the system will automatically adjust to the required mode, create sound isolation, pause the music and turn it on again.</p>\r\n<h2>Decent autonomy</h2>\r\n<p>But from a mobile gadget, you need not only a range of capabilities, but also the possibility of long-term work. Apple AirPods will be able to play music continuously for 5:00. Using the charging case will make you autonomous for a day. At the same time, 15 minutes of recharging will give you another 3:00 of music and communication!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Accessories ', 'Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. '),
(2, 'en', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.</p>', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system. The company\'s devices are famous for their optimization and the almost complete absence of any add-ons. Motorola Moto G6 Plus is equipped with a 5.9-inch IPS screen that will give you hours of reading or video viewing pleasure thanks to its large diagonal, high resolution and excellent color reproduction. You can comfortably perform everyday tasks and even play any modern mobile games thanks to the Qualcomm Snapdragon 630 processor. In addition, the Motorola Moto G6 Plus has IPX7 water protection, and another nice bonus is the NFC module.</p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Smartphones ', 'Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.'),
(2, 'en', 18, 'Nokia 4.2 DS 3', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">With the Google Assistant at your fingertips, the pace is picking up.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">You can ask questions, check your schedule, or even dim the lights.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">An assistant can do a lot.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">And the longer you use it, the better it works.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Less time on the phone - more time for the joys of life.</span></span></p>', '<p><strong>Life is easier just around the corner</strong></p>\r\n<p>When the Google Life Assistant is at hand, it picks up the pace. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>\r\n<p><strong>We increased the design requirements, and then brought it to perfection</strong></p>\r\n<p>Skill and sophistication - for every day. Thickness 8.4 mm. Quality 2.5D glass with rounded corners on front and back. Not a phone, but a real pleasure to hold in your hand. 5.71 inch HD+ screen with 19:9 aspect ratio A sheer pleasure not only to hold but also to look at. A battery that adapts to you and lasts a long time.</p>\r\n<p><strong>Moments you remember have never looked so spectacular</strong></p>\r\n<p>Share your emotions. With a dual rear camera and a wide-angle selfie camera, all smiles will be in the frame. Get creative with the latest features like bokeh mode and advanced photo editing.</p>\r\n<p><strong>Continuous improvement</strong></p>\r\n<p>Nokia 4.2 - Android One smartphone on pure Android 9 Pie without third-party programs. Nothing extra - plus free security updates once a month, don\'t slow down your phone.<br>Add artificial intelligence that will suggest the necessary functions of applications based on its experience and help you manage your screen time with Digital Wellbeing.&lt; /p&gt;</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Smartphones', 'With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works.'),
(2, 'en', 19, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera. Equipped with a very powerful battery for</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">4380 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course USB port For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Smartphones', 'Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera.'),
(2, 'en', 20, 'Samsung Galaxy S10', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Smartphones', 'Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. '),
(2, 'en', 21, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A30 is a wonderful Android smartphone with Exynos 9610 1800Mhz octa-core processor, Super AMOLED display with up to 16 million colors, 6.4\" diagonal and 16 Mpx camera. Equipped with a very powerful 4000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Smartphones', 'Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.'),
(2, 'en', 22, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 5000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Smartphones', 'Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.'),
(2, 'en', 23, 'Samsung Galaxy A50', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p><span id=\"hscc\">Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.'),
(2, 'en', 24, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with a 6.2\" IPS LCD display with up to 16 million colors and a 13 Mpx camera. Equipped with a very powerful 3400 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Smartphones', 'Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.'),
(2, 'en', 25, 'Samsung Galaxy A20', '<p>The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A20 is an excellent smartphone running on the Android platform with an 8-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 4000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Smartphones', 'The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.'),
(2, 'en', 26, 'Samsung Galaxy A70', '<p>The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.</p>', '<p><span id=\"hscc\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a Super AMOLED display with up to 16 million colors, with a diagonal of 6.7 \"and a 32 Mpx camera. Equipped with a very powerful 4500 mAh battery. For communication, it can offer:</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port, for music lovers there is a 3.5 mm audio output.</span></span></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Smartphones', 'The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.'),
(2, 'en', 27, 'Samsung Galaxy A40', '<p>The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 5.9 \"and a 16 Mpx camera. Equipped with a very powerful 3100 mAh battery. For communication it can offer:</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port.For music lovers, there is a 3.5 mm audio output.It is also worth noting that it is equipped with a GPS receiver, which will allow you not to get lost in any</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">place!</span></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Smartphones', 'The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.'),
(2, 'en', 28, 'Samsung Galaxy A2', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A2 Core on the rear packs 5-megapixel camera. The rear camera setup has autofocus. It sports a 5-megapixel camera on the front for selfies.</p>\r\n<p>Samsung Galaxy A2 Core based on Android 9.0 Pie (Go edition) and packs 16GB of inbuilt storage that can be expanded via microSD card. The Samsung Galaxy A2 Core is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards.</p>\r\n<p>Connectivity options on the Samsung Galaxy A2 Core include Wi-Fi 802.11 b/g/n, GPS, Micro-USB, FM radio, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer.</p>\r\n<p><span id=\"hscc\">&nbsp;</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Mobile phones', 'Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 787'),
(2, 'en', 29, 'Samsung Galaxy A80', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A80 on the rear packs a 48-megapixel primary camera with an f/2.0 aperture and a second 8-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus.</p>\r\n<p>The Samsung Galaxy A80 runs One UI based on Android 9.0 Pie and packs 128GB of inbuilt storage. The Samsung Galaxy A80 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy A80 measures 165.20 x 76.50 x 9.30mm (height x width x thickness) . It was launched in Angel Gold, Ghost White, and Phantom Black colours. It bears a glass body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A80 include Wi-Fi 802.11 b/g/n, GPS, USB Type-C, 3G, and 4G (with support for Band 40 used by some LTE networks in India) with active 4G on both SIM cards. Sensors on the phone include accelerometer, ambient light sensor, proximity sensor, and fingerprint sensor. The Samsung Galaxy A80 supports face unlock.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Mobile phones', 'Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 co'),
(2, 'en', 30, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p'),
(2, 'en', 31, 'Apple iPhone 7 Black', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.&nbsp;</p>', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery.</p>\r\n<p>As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture. The rear camera setup has phase detection autofocus. It sports a 7-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Apple iPhone 7 based on iOS 10 and packs 32GB of inbuilt storage. The Apple iPhone 7 is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Apple iPhone 7 measures 138.30 x 67.10 x 7.10mm (height x width x thickness) and weighs 138.00 grams. It was launched in Black, Gold, Jet Black, Matte Black, Red, Rose Gold, and Silver colours.</p>\r\n<p>Connectivity options on the Apple iPhone 7 include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v4.20, NFC, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Mobile phones', 'Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a'),
(2, 'en', 32, 'Samsung Galaxy S7', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside.&nbsp;&nbsp;</p>', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The camera is absolutely amazing, especially in low light. This is a pragmatic phone, compared to its sibling the Galaxy S7 Edge, and is better value for money if you don\'t want to show off. However, with competition at an all-time high, you can also get most of its features and functions for one third this price.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Mobile phones', 'Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The came'),
(2, 'en', 33, 'Apple iPhone X', '<p>Apple iPhone X is the epitome of the best innovative solutions. A completely new design with a reimagined control system.</p>', '<p>Apple iPhone X is the epitome of the best innovative solutions. Brand new design<br>with a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful internal 64-bit architecture. Dramatically improved the world\'s most popular mobile camera.<br>This is exactly how Apple sees its flagship smartphone in 2017.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Mobile phones', 'Apple iPhone X is the epitome of the best innovative solutions. Brand new design\r\nwith a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body.'),
(3, 'ua', 1, 'Apple iPad mini', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Дисплей Retina 7,9 дюйми з технологією True Tone.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">І підтримка Apple Pencil, щоб вам було ще простіше слідувати за натхненням.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Це все той самий iPad mini, але тепер він вміє більше.</span></span></p>', '<p><strong>ЗОВСІМ ЯК ВЕЛИКИЙ</strong></p>\r\n<p>iPad mini ідеально поєднує в собі компактність та продуктивність - за це його і люблять. Тепер для кохання з\'явилося ще більше приводів. Процесор A12 Bionic із системою Neural Engine. Дисплей Retina 7,9 дюйми з технологією True Tone. І підтримка Apple Pencil, щоб вам було ще простіше слідувати за натхненням. Це все той самий iPad mini, але тепер він вміє більше.</p>\r\n<p><strong>КОМПАКТНИЙ. ПОРТАТИВНИЙ. КИШЕНЬКОВИЙ</strong></p>\r\n<p>iPad mini неймовірно компактний і легкий, тому легко складе вам компанію, де б ви не знаходилися. Він важить менше 400 г при товщині 6,1 мм і чудово поміщається у кишеню чи сумку. Його дуже зручно тримати в руці і можна швидко дістати з кишені, коли цього вимагатиме натхнення.</p>\r\n<p><strong>ПРОДУКТИВНІСТЬ ВИХОДИТЬ ЗА РАМКИ РОЗМІРУ </strong></p>\r\n<p>Потужність та інтелект iPad mini забезпечуються процесором A12 Bionic із системою Neural Engine. Використовуючи технології машинного навчання, процесор швидко розпізнає закономірності, пропонує свої варіанти та навчається на основі набутого досвіду. Робота в Adobe Photoshop CC, доповнена реальність, захоплюючі ігри з графікою консольного рівня &ndash; потужності вистачить на все.</p>\r\n<p><strong>СПРАВА НЕ В РОЗМІРІ ДИСПЛЕЮ, А В ЯКОСТІ ПІКСЕЛЕЙ </strong></p>\r\n<p>iPad mini оснащений чудовим дисплеєм 7,9 дюйма, який відображає понад 3 мільйони пікселів. І Apple витягли максимум із кожного. Висока яскравість, широкий колірний охоплення і покриття антивідблиску дозволяють використовувати iPad mini в будь-яких умовах. Неважливо, що ви робите: читаєте книгу в парку або монтуєте відео вдома - зображення та текст завжди виглядатимуть максимально чітко та природно. А технологія True Tone автоматично налаштовує баланс білого з урахуванням освітлення, тому тепер кольори виглядатимуть ще натуральніше.</p>\r\n<p><strong>БУДЬТЕ НА ЗВ\'ЯЗКУ. Знімайте в HD. ГРАЙТЕ В AR </strong></p>\r\n<p>Камери на iPad mini дозволяють знімати чудові фотографії та відео. І це далеко ще не все. Ви можете спілкуватися з друзями по FaceTime, сканувати документи, робити позначки або навіть планувати перестановку меблів за допомогою технологій AR (доповненої реальності).</p>\r\n<p><strong>APPLE PENCIL. ВІДМІННО ВПИСУЄТЬСЯ</strong></p>\r\n<p>Apple Pencil (продається окремо) розкриває в iPad мільйон нових можливостей. З ним iPad mini перетвориться на неймовірно зручний цифровий блокнот. Робіть записи від руки, заповнюйте форми та підписуйте документи. Або підійдіть до справи творчо: робіть начерки та малюнки прямо на ходу. IOS.</p>\r\n<p><strong>ДОПОМОЖЕ ВАМ РОЗКРИТИ ПОТЕНЦІАЛ IPAD </strong></p>\r\n<p>Завдяки iOS на компактному iPad mini можна виконувати завдання, які ви ставите перед iPad. Використовуйте кілька програм одночасно, переміщуйте файли простими жестами Multi-Touch, відкривайте улюблені програми з панелі Dock. А з додатком \"Файли\" весь ваш контент завжди буде під рукою.</p>\r\n<p><strong>МІЛЬЙОН МОЖЛИВОСТЕЙ В ОДНОМУ IPAD MINI </strong></p>\r\n<p>На iPad mini встановлені чудові програми Apple для повсякденних завдань - Фото, Карти, Повідомлення, Пошта, Safari та інші. А в App Store доступно ще більше мільйона програм для iPad &ndash; серед них легко знайти необхідні саме вам. Монтуйте відео, спілкуйтеся в соціальних мережах, робіть начерки або занурюйтесь у захоплюючі мережеві ігри.</p>\r\n<p><strong>ВАШІ ДАНІ НАЛЕЖАТЬ ТІЛЬКИ ВАМ </strong></p>\r\n<p>Як і всі продукти Apple, iPad mini розроблявся з урахуванням строгих вимог щодо захисту особистої інформації. Touch ID &ndash; це проста та надійна система аутентифікації на iPad mini. А за допомогою Apple Pay можна швидко та безпечно оплачувати покупки. Просто торкніться датчика Touch ID - і готово.</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшети', 'ЗОВСІМ ЯК ВЕЛИКИЙ iPad mini ідеально поєднує в собі компактність та продуктивність - за це його і люблять. Тепер для кохання з\'явилось ще більше приводів. Процесор A12 Bionic із системою Neural Engine.'),
(3, 'ua', 2, 'Samsung Galaxy Tab', '<p>Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим найкращим супутником у розвагах та роботі у багатозадачному режимі.</p>', '<p><strong>БАГАТОЗАДАЧНІСТЬ БЕЗ КОРДОНІВ</strong></p>\r\n<p>Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим найкращим супутником у розвагах та роботі у багатозадачному режимі.</p>\r\n<p><strong>SAMSUNG DEX ДЛЯ ЗБІЛЬШЕННЯ ПРОДУКТИВНОСТІ ВАШОЇ РОБОТИ </strong></p>\r\n<p>Режим Samsung DeX вперше став сумісним із планшетом Samsung Galaxy Tab S4. Тепер висока продуктивність роботи на ПК стала доступною на планшеті. Багатозадачний режим роботи доступний через адаптер HDMI без використання док-станції Samsung DeX або DeX pad, для більшої ефективності можна додати клавіатуру, мишу або монітор.</p>\r\n<p><strong>ГОТОВИЙ ДЛЯ РОБОТИ </strong></p>\r\n<p>Все під рукою для робочого режиму. Робочий стіл на екрані планшета Galaxy Tab S4 реалізований як у звичайному ПК, тобто. з панеллю завдань, підтримкою багатовіконного режиму та функцією перетягування файлів. Якщо ви хочете мати на екрані звичний робочий стіл, просто запустіть Samsung DeX через панель швидкого доступу та додайте Android-сумісну клавіатуру та мишу.</p>\r\n<p><strong>ПРАЦЮЙТЕ ЕФЕКТИВНІШЕ</strong></p>\r\n<p>Продуктивність вашої роботи залежить від того, наскільки комфортне робоче середовище. Саме тут може допомогти використання Samsung DeX із зовнішнім монітором. На великому екрані монітора можна продовжувати користуватися Android інтерфейсом вашого планшета. Або дивитися на монітор, а планшет використовувати як тачпад, панель із S Pen або сенсорну клавіатуру.</p>\r\n<p><strong>ВІН НЕ ВИКЛЮЧЕНИЙ - ВІН В РЕЖИМІ ОЧІКУВАННЯ </strong></p>\r\n<p>Якщо у вас виникла нова ідея, зафіксуйте її на екрані планшета, щоб не забути. Завдяки функції запису нотаток на вимкненому екрані планшета Galaxy Tab S4 ви можете швидко записати ваші думки навіть на чорному екрані за допомогою багатофункціонального електронного пера S Pen. Найтонший 0,7-мм гумовий кінчик пера дозволяє легко і точно робити нотатки та малювати ескізи.</p>\r\n<p><strong>ПОЛІПШЕНІ РОБОЧІ ХАРАКТЕРИСТИКИ </strong></p>\r\n<p>Швидкість передачі даних Samsung Galaxy Tab S4 в режимі LTE досягає 1 Гбіт/с, тому у вас буде достатньо часу і для інших справ. А завдяки наявності в планшеті 64 Гб вбудованої пам\'яті та можливості розширення її до 400 Гб за допомогою слота для MicroSD карт пам\'яті, у вас буде достатньо місця для зберігання ваших документів та відео.</p>\r\n<p><strong>ЗАНУРИТИСЯ В АТМОСФЕРУ РОЗВАГ</strong></p>\r\n<p>Незважаючи на компактні розміри, планшет Galaxy Tab S4 оснащений великим площею візуальним простором для роботи. Завдяки максимально вузькій рамці та відсутності логотипу Samsung та кнопки Home, діагональ екрану реально становить 10,5 дюймів. А покращене співвідношення сторін 16:10 sAMOLED екрану створює ефект повнішого занурення при перегляді вашого улюбленого контенту.</p>\r\n<p><strong>ОКРУЖІТЬ СЕБЕ ЗВУКОМ ВИСОКОЇ ЯКОСТІ</strong></p>\r\n<p>Чотири динаміки, налаштовані спеціалістами всесвітньо відомої компанії AKG, забезпечують звук як у реальному житті. Тепер ви можете експериментувати з адаптивним аудіо, створеним експертами AKG. А технологія Dolby Atmos забезпечує об\'ємний 3D звук, завдяки чому те, що відбувається на екрані, не відрізняється від реальності.</p>\r\n<p><strong>ДИВІТЬСЯ ВІДЕО, НЕ ДУМАЮЧИ ПРО ЧАС</strong></p>\r\n<p>Galaxy Tab S4 оснащений батареєю ємністю 7300 мАг, що дозволяє переглядати відео до 16 годин, так що ви зможете дивитися ваші улюблені фільми або серіали, не думаючи про час. А якщо батарея розрядиться, завдяки функції швидкої зарядки ви зможете повністю зарядити її всього за 200 хвилин.</p>\r\n<p><strong>КОРИСНИЙ НАВІТЬ У РЕЖИМІ ОЧІКУВАННЯ</strong></p>\r\n<p>У сплячому режимі планшет Galaxy Tab S4 перетворюється на розумний домашній дисплей. Якщо планшет заряджається або \"спить\", за допомогою функції Daily Board ви можете налаштувати режим відображення на екрані ваших улюблених фотографій. Крім того, планшет може бути корисним помічником і відображати на екрані не просто поточний прогноз погоди, але також дату та час, виконуючи роль календаря.</p>\r\n<p><strong>РОЗБЛОКУВАННЯ ЗА ДОПОМОГОЮ РАДУЖКИ ОКА</strong></p>\r\n<p>Крім технології розпізнавання облич Galaxy Tab S4 тепер підтримує функцію сканування райдужної оболонки ока. Для розблокування вашого планшета достатньо відсканувати ваше обличчя або райдужку очей. Вбудована система шифрування та захищена папка у поєднанні з функціями біоідентифікації забезпечать безпеку ваших файлів та програм.</p>\r\n<p><strong>БАГОТОРІВНЕВА СИСТЕМА ЗАХИСТУ</strong></p>\r\n<p>Тримайте дані під надійним захистом. Платформа безпеки Samsung Knox активізується з моменту увімкнення вашого планшета. Багаторівнева система захисту в реальному часі поміщає ваші дані до захищеної папки, доступ до якої є тільки у вас. Зберігайте ваші робочі та особисті дані окремо.</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшети', 'Багатозадачність без кордонів Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим кращим супутником у розвагах та роботі в багатозадачному режимі.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 'ua', 3, 'Apple iPad Air', '<p>iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. Крім того, при товщині всього 6,1 мм iPad Air важить менше 500 г &mdash; ви легко зможете завжди тримати його при собі.</p>', '<h3>iPad Air - всім любителям потужних технологій</h3>\r\n<p>iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. Крім того, при товщині всього 6,1 мм iPad Air важить менше 500 г &mdash; ви легко зможете завжди тримати його при собі.</p>\r\n<h3>Все, що вам потрібно. Ніякої зайвої ваги</h3>\r\n<p>Попри великий дисплей Retina 10,5 дюйма, iPad Air дуже компактний. Він чудово підходить для вирішення найрізноманітніших завдань буквально на ходу. Для цього він оснащений найбільш передовими технологіями бездротового зв\'язку, а також акумулятором, який працює без підзарядки до 10 годин. Тобто майже цілий день.</p>\r\n<h3>На зв\'язку практично де завгодно</h3>\r\n<p>iPad Air підтримує швидкі бездротові мережі 4G LTE та передавання даних зі швидкістю до 866 Мбіт/с по Wi-Fi.&nbsp;Це означає &mdash; жодних дротів і жодних складнощів. А з технологією eSIM ви можете підключити тарифний план бездротового зв\'язку прямо з iPad Air &mdash; практично у будь-якій точці світу.</p>\r\n<h3>Вдосталь потужності для всього й одразу</h3>\r\n<p>Потужність та інтелект iPad Air забезпечуються процесором A12 Bionic з системою Neural Engine. Процесор задіює технології машинного навчання у режимі реального часу й відкриває неймовірні можливості для фотографії, ігор, доповненої реальності та багато чого іншого. Ви можете редагувати відео, робити приголомшливі презентації, проектувати 3D-моделі, дивитися улюблені серіали онлайн. І робити все це одночасно.</p>\r\n<h3>Надзвичайно швидка графіка для ігор та додатків</h3>\r\n<p>Приголомшлива продуктивність у додатках з доповненою реальністю, неймовірні графічні можливості, фотореалістична графіка в 3D-іграх &mdash; за всім цим стоїть 4-ядерна графічна система процесора A12 Bionic.</p>\r\n<h3>Дисплей Retina - все робиться красиво</h3>\r\n<p>iPad Air оснащений дисплеєм Retina 10,5 дюйма з широким колірним охопленням. На цей дисплей хочеться дивитися нескінченно. Фотографії, відео та ігри виглядають живо і природно аж до найдрібніших деталей. І незалежно від зовнішніх умов, технологія True Tone, підвищена яскравість та покриття антивідблиску допоможуть зробити зображення максимально якісним.</p>\r\n<h3>True Tone. Легко для очей при будь-якому освітленні</h3>\r\n<p>Технологія True Tone автоматично налаштовує баланс білого з урахуванням зовнішнього освітлення. Тому зображення на дисплеї виглядає більш природно та комфортно для очей за будь-яких умов &mdash; і під час вечірнього читання, і коли ви малюєте сонячний пейзаж на пленері.</p>\r\n<h3>Будьте на зв\'язку. Знімайте в HD. Грайте в AR</h3>\r\n<p>Камери iPad Air дозволяють знімати приголомшливі фотографії та HD-відео 1080p. І це далеко не все. Можна спілкуватися по FaceTime з кількома співрозмовниками, сканувати і відразу надсилати документи. І навіть створювати власні світи &mdash; камери iPad Air чудово працюють з технологіями augmented reality (доповненої реальності).</p>\r\n<h3>Грайте, працюйте та займайтеся творчістю у доповненій реальності</h3>\r\n<p>Коли віртуальні об\'єкти і дані стають частиною реального світу, перед вами відкриваються абсолютно нові горизонти. Камери на передній та задній панелях, процесор A12 Bionic з системою Neural Engine, великий дисплей з природним передаванням кольору і точне відстеження руху роблять iPad ідеальним пристроєм для життя у доповненій реальності.</p>\r\n<h3>Пишіть. Малюйте. Прямуйте за натхненням</h3>\r\n<p>Apple Pencil передає рухи руки з приголомшливою точністю та швидкістю.&nbsp;Його зручно тримати в руці, як звичайний олівець. При цьому він вміє набагато більше. З Apple Pencil ваш iPad Air може стати блокнотом або полотном художника &mdash; у вас безліч варіантів.</p>\r\n<h3>Робіть нотатки. Коментуйте документи та скріншоти. І багато іншого</h3>\r\n<p>Робити нотатки або записувати ідеї на iPad Air так само легко, як на звичайному аркуші паперу. Ви можете розмічати документи, доповнювати нотатки малюнками, робити знімки екрану та додавати до них коментарі.</p>\r\n<h3>Smart Keyboard. Повний розмір. Повний захист</h3>\r\n<p>Smart Keyboard &mdash; це повнорозмірна клавіатура, яка дуже допоможе у підготовці важливої презентації або підсумкового твору.&nbsp;Її не потрібно заряджати й спеціально налаштовувати. Просто приєднайте Smart Keyboard до iPad Air і починайте працювати. А коли закінчите, складіть клавіатуру, і вона перетвориться на легку та елегантну обкладинку.</p>\r\n<h3>iOS - допоможе вам розкрити потенціал iPad</h3>\r\n<p>iOS &mdash; це передова мобільна операційна система, яка дозволяє керувати iPad Air простими дотиками. Ми називаємо їх жестами, і вони забезпечують повний доступ до всіх можливостей великого дисплея та інтелектуальних технологій iPad Air. З функцією багатозадачності ви зможете одночасно користуватися улюбленими додатками &mdash; досить просто вибрати їх на панелі Dock. А файли можна переміщувати з однієї програми до іншої та сортувати у додатку &laquo;Файли&raquo; так, як вам зручно.</p>\r\n<h3>Всі ваші файли зібрані разом</h3>\r\n<p>Додаток &laquo;Файли&raquo; дає можливість працювати з контентом, який може зберігатися на iPad Air, в iCloud Drive або інших хмарних сервісах, таких як Box та Dropbox. У будь-якому випадку, файли завжди будуть доступні &mdash; легко й просто.</p>\r\n<h3>Ваш iPad відповідає вашим інтересам</h3>\r\n<p>На iPad Air встановлені чудові додатки Apple для повсякденних завдань, такі як Фото, Карти, Повідомлення, Пошта та Safari. Потужні додатки Pages, Numbers і Keynote допоможуть у роботі, а GarageBand та iMovie вже готові стати вашими улюбленими творчими інструментами.</p>\r\n<h3>Понад мільйон додатків для iPad в App Store</h3>\r\n<p>В App Store можна знайти будь-які додатки: для фотографії, малювання, офісної роботи та багато чого іншого. Розробники проектують їх з урахуванням приголомшливої продуктивності та великого дисплея iPad Air, а також роблять сумісними з Apple Pencil. І кожного дня в App Store з\'являються рекомендації нових цікавих додатків.</p>\r\n<h3>iCloud. Ідеальне місце для ваших фотографій, файлів та інших цінностей</h3>\r\n<p>Завдяки iCloud ваші фотографії, документи, нотатки та багато інших файлів завжди оновлені й доступні на всіх ваших пристроях.&nbsp;А додаток &laquo;Файли&raquo; дозволяє працювати з файлами, що зберігаються як в iCloud Drive, так і на iPad Air.</p>\r\n<h3>Ваша особиста інформація належить лише вам. І крапка</h3>\r\n<p>Як і всі продукти Apple, iPad Air розроблявся з урахуванням суворих вимог до захисту особистої інформації. Touch ID &mdash; це проста та надійна система аутентифікації на iPad Air. А за допомогою Apple Pay можна швидко та безпечно сплачувати за покупки. Просто доторкніться до датчика Touch ID &mdash; і готово.</p>\r\n<h3>Універсальний доступ. Підтримає кожного</h3>\r\n<p>Технології стають дійсно потужними, коли ними може користуватися кожен. Тому на iPad так багато можливостей для людей з порушеннями зору, слуху, здатності до навчання, а також зі складнощами у спілкуванні. У їх числі функція VoiceOver, яка озвучує те, що відбувається на екрані, та Switch Control, що дозволяє працювати з iPad Air, не торкаючись дисплея.</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшети', 'iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. '),
(3, 'ua', 4, 'DJI Mavic Air', '<p><strong>DJI Mavic Air</strong> &ndash; нова модель компактного дрону, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Квадрокоптер <strong>DJI Mavic Air</strong> &ndash; нова модель компактного дрона, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Його головна перевага &ndash; розширений функціонал камери, яка тепер може створювати сферичні панорами, які ідеально підходять для перегляду в окулярах віртуальної реальності.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Крім того, користувачеві доступно кілька сценаріїв селфі-відео - повільне віддалення, обертання по орбіті, рух по спіралі, різке піднесення та імітація польоту бумерангу.</span></span></p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптери', 'Квадрокоптер DJI Mavic Air – нова модель компактного дрона, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні. '),
(3, 'ua', 5, 'DJI Mavic Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Mavic Pro Fly More Combo &ndash; модель безпілотного літального апарату від знаменитого виробника.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Більш компактний, ніж Phantom, він легко поміщається в рюкзак, який не обмежує рухів користувача.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;молодша&raquo; модель безпілотного літального апарата від знаменитого виробника.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Більш компактний, ніж Phantom, він легко поміщається в рюкзак, який не обмежує рухів користувача.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Його можна брати з собою у подорожі, на виїзні фотосесії, на спортивні змагання та на будь-які інші заходи.</span></span></p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптери', 'Квадрокоптер DJI Mavic Pro Fly More Combo – «молодша» модель безпілотного літального апарата від знаменитого виробника. '),
(3, 'ua', 6, 'DJI Phantom 4 Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Phantom 4 Pro &ndash; модернізована модель знаменитого літального апарату.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Його головна відмінність від попередньої версії представлена новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с.</span></span></p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернізована модель знаменитого літального апарату. Його головна відмінність від попередньої версії представлена ​​новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с. Такі характеристики дозволяють створювати повнорозмірні серійні фотографії зі швидкістю до 14 кадрів в секунду, а також записувати ролики з роздільною здатністю C4K (4096 х 2160) та частотою зміни кадрів до 60 в секунду. Користувачеві залишається лише підібрати відповідну картку пам\'яті &ndash; її максимальний об\'єм досягає 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Покращені динамічні можливості</strong>. Незважаючи на проведене оновлення технічної частини, маса квадрокоптера не зросла. цьому сприяло застосування рами з магнію, алюмінію та титану. Пристрій може проводити в повітрі до 30 хвилин, піднімаючись на висоту до 6 км над рівнем моря. Максимальна швидкість горизонтального польоту дорівнює 20 м/с (72 км/год), а підйому &ndash; 6 м/с (21,6 км/год). Удосконалена дводіапазонна система радіокерування дозволяє літальному апарату обмінюватися сигналами з пультом на дистанції до 7 км за відсутності перешкод.</li>\r\n<li><strong>Повна безпека</strong>. Система FlightAutonomy отримала дві нові мікрокамери та два інфрачервоні датчики, розташовані з боків. Завдяки цьому квадрокоптер може розпізнавати перешкоди навіть при слабкому освітленні та автоматично виправляти курс, запобігаючи зіткненню. Така функція є корисною як для новачків, так і для професійних відеооператорів, які отримують можливість зосередитися на процесі зйомки.</li>\r\n<li><strong>Зручне керування</strong>. На стандартному пульті немає нічого зайвого &ndash; літальним апаратом можна керувати за допомогою двох міні-джойстиків та двох кнопок. Всі додаткові функції активуються за допомогою мобільного додатка. У стандартній версії пульт забезпечений тримачем для смартфона, а в модифікації PLUS &ndash; ndash; висувним екраном з дуже яскравим підсвічуванням (1000 кд/м2), що дозволяє розглянути всі деталі зображення навіть при попаданні на нього прямого сонячного проміння.</li>\r\n<li><strong>Автоматичні програми польоту</strong>. Технологія DRAW дозволяє намалювати курс квадрокоптера на сенсорному екрані &ndash; пристрій буде слідувати йому на постійній висоті, дозволяючи приділити максимум уваги точному наведенню камери. Крім того, літальному апарату можна просто показати кінцеву точку, до якої він дістанеться, обминаючи всі перешкоди. Для відеооператорів будуть особливо корисними функції автоматичного стеження за об\'єктом, що рухається, і спуску затвора при розпізнаванні жестів.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптери', 'DJI Phantom 4 Pro – модернізована модель знаменитого літального апарату. Його головна відмінність від попередньої версії представлена новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с.'),
(3, 'ua', 7, 'Havit G1 Black/Red', '<p>З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Ви зможете займатися спортом ще довше, а надійні кріплення навушників забезпечать максимальний комфорт.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Одного заряду навушників вистачає на 3.5 годин активного використання.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Навушники захищені від поту та води, що дає можливість використовувати навушники навіть в екстремальних умовах навантаження.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">А дві акустичні головки підірвуть ваші тренування на ура.</span></span></p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксесуари', 'З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні. Ви зможете займатися спортом ще довше, а надійні кріплення навушників забезпечать максимальний комфорт. '),
(3, 'ua', 8, '1MORE Quad Driver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">В алюмінієвому корпусі анатомічної форми 4 випромінювачі &ndash; динамічний з карбону та 3 арматурних драйвера, що відповідають за низькі та високі частоти.</span></span></p>', '<p>Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді. В алюмінієвому корпусі анатомічної форми 4 випромінювачі &ndash; динамічний з карбону та 3 арматурних драйвера, що відповідають за низькі та високі частоти.</p>\r\n<p>Частотний діапазон дивує від 20 Гц до 40 кГц, чутливість навушників 99 дБ при опорі 32 Ом. Пульт дистанційного керування має 3 кнопки (регулятор гучності, прийом дзвінка) та мікрофон з придушенням шумів та перешкод. Роз\'єм mini jack 3,5 мм має форму літери &laquo;L&raquo;, що забезпечує його довговічність навіть при постійному носінні в кишені разом зі смартфоном.</p>\r\n<p>Полімерне обплетення проводів стійке до зносу, стирання та заломів, усередині конструкцію посилює кевларові нитки. У комплекті стильне подарункове упакування, жорсткий чохол, перехідник на 6,3 мм, авіаадаптер, а також 8 пар змінних амбушюр різного розміру. Ці навушники створені для безкомпромісної насолоди музикою &ndash; найкращий вибір для справжніх меломанів.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксесуари', 'Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді. '),
(3, 'ua', 9, 'JBL Flip 4 Red', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Чудова акустика вже встигла здобути низку премій.</span></span></p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 10, 'JBL Flip 4 Blue', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Чудова акустика вже встигла здобути низку премій.</span></span></p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 11, 'JBL Flip 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Чудова акустика вже встигла здобути низку премій.</span></span></p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 12, 'Samsung Galaxy Watch', '<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>', '<p><strong>Смарт-годинник Samsung Galaxy Watch Active</strong></p>\r\n<p>Ваш новий рівень функціональних можливостей</p>\r\n<p><strong>Нові можливості</strong></p>\r\n<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>\r\n<p><strong>Дизайн для активних користувачів</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active &ndash; це сучасний гаджет, укладений в гармонійний спортивний корпус. Чи плануєте відвідати вечірку або конференцію? Великий вибір ремінців різних кольорів допоможе вам легко змінити стиль та імідж в залежності від настрою або дрес-коду.</p>\r\n<p><strong>Проста лаконічна краса</strong></p>\r\n<p>Маючи в запасі різні візуальні варіанти, циферблат Samsung Galaxy Watch Active налаштовується на ваш ритм, щоб відповідати стилю і функціональним потребам. Яку б ви не ставили мета перед собою, смарт &ndash; годинник Samsung допоможуть її досягти.</p>\r\n<p><strong>Завжди залишайтеся в формі</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active мотивують вас підтримувати форму. Режим &laquo;Денна активність&raquo; допоможе вам досягати намічених цілей:не сидіть, рухайтеся, будьте активними. Вдосконалені високочутливі сенсори руху автоматично виконують виміри і відстежують сім різних типів активності, щоб надати вам точну інформацію про ваших денних фізичних навантаженнях. У годиннику встановлено датчик GPS. Ступінь їх водозащити становить 5ATM.</p>\r\n<p><strong>Керуйте рівнем стресу</strong></p>\r\n<p>Інтегрований датчик серцебиття відстежує ваш серцевий ритм і, в разі виявлення аномальних відхилень, відправляє вам повідомлення. Годинники Samsung Galaxy Watch Active визначать рівень вашого стресу і запропонують зробити дихальні вправи на розслаблення. Спостерігайте за рівнем стресу до і після розслабляючого дихання.</p>\r\n<ul>\r\n<li>Контроль стресу і енергії в кілька торкань</li>\r\n<li>Розслаблюючі дихальні вправи допоможуть вам прийти в норму</li>\r\n<li>Медитативних вправи для відновлення внутрішнього балансу</li>\r\n</ul>\r\n<p><strong>Слідкуйте за здоров\'ям</strong></p>\r\n<p>Додаток Samsung Health допоможе вам здійснювати постійний контроль за своїм самопочуттям. Переглядайте дані про стан вашого здоров\'я на дисплеї годин, користуйтеся великою кількістю інструментів, щоб керувати не тільки своєю фізичною активністю, а й загальним самопочуттям.</p>\r\n<p><strong>Не завершуйте спілкування</strong></p>\r\n<p>Завжди залишайтеся на зв\'язку. Надсилайте смайлики, текстові або голосові повідомлення за допомогою Galaxy Watch Active, навіть коли ваш телефон знаходиться на підзарядці.</p>\r\n<p><strong>Передові технології заряду</strong></p>\r\n<p>Інноваційна технологія бездротової зарядки Wireless Power Share допоможе швидко поповнити заряд пристрою. Galaxy Watch Active відстежують вашу активність до 45 годин без підзарядки.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес – годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.'),
(3, 'ua', 13, 'Apple Watch 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</span></span></p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br /><br />Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br /><br />Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br /><br />Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br /><br /><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br /><br />Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 14, 'Apple Watch 4 Silver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</span></span></p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br /><br />Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br /><br />Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br /><br />Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br /><br /><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br /><br />Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 15, 'Apple Watch 4 White', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</span></span></p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br /><br />Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br /><br />Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br /><br />Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br /><br /><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br /><br />Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 16, 'Apple AirPods', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"4\"><span class=\"Q4iAWc\">Усі звикли, що аксесуари від Apple &ndash; це більше, ніж просто доповнення.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"4\"><span class=\"Q4iAWc\">Це речі самодостатні та часто унікальні.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"4\"><span class=\"Q4iAWc\">Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних для всіх речей.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"4\"><span class=\"Q4iAWc\">Відсутність дротів, гідна якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.</span></span></p>', '<h2><strong>Магія звуку </strong></h2>\r\n<p>Всі звикли, що аксесуари від Apple &ndash; це більше, ніж просто доповнення. Це речі самодостатні та часто унікальні. Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.</p>\r\n<h2>Навіщо навушників процесор?</h2>\r\n<p>У списку технічних характеристик Apple AirPods ми бачимо процесор W1. Причому відповідає він у цій моделі як формування звукового сигналу. Навушники знають, що ви робите в даний момент: Чи використовуєте ви 1 або 2 навушники, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставити музику на паузу і знову включити.</p>\r\n<h2>Гідна автономність</h2>\r\n<p>Але від мобільного гаджета потрібний не тільки спектр можливостей, а й можливість тривалої роботи. Apple AirPods зможуть безперервно працювати на відтворення музики п\'ять годин. Використання чохла для заряджання зробить вас автономним на добу. При цьому 15 хвилин підзарядки дадуть вам ще три години музики та спілкування!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Аксесуари', 'Усі звикли, що аксесуари від Apple – це більше, ніж просто доповнення. Це речі самодостатні та часто унікальні. Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних для всіх речей. Відсутніст'),
(3, 'ua', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo. Пристрої компанії славляться своєю оптимізацією та практично повною відсутністю будь-яких надбудов. Motorola Moto G6 Plus оснащується 5.9-дюймовим IPS&nbsp;екраном, який подарує довгі години задоволення від читання або перегляду відео, завдяки великій діагоналі, високій роздільній здатності та чудовій кольоропередачі. З комфортом виконувати повсякденні завдання і навіть пограти в будь-які сучасні мобільні ігри можна завдяки процесору Qualcomm Snapdragon 630. До того ж Motorola Moto G6 Plus має захист від води за стандартом IPX7, а ще одним приємним бонусом виступає модуль NFC.</p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Смартфони', 'Motorola Moto G6 – смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo.'),
(3, 'ua', 18, 'Nokia 4.2 DS 3', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Коли під рукою Google Асистент життя набирає темпу.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Можна ставити запитання, дивитися свій розклад або навіть приглушити світло.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Помічник може багато чого.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">І чим довше ви використовуєте, тим краще він працює.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Менше часу по телефону &ndash; більше часу для радощів життя.</span></span></p>', '<p><strong>Легше життя зовсім поруч - варто лише натиснути кнопку</strong></p>\r\n<p>Коли під рукою Google Асистент життя набирає темпу. Можна ставити запитання, дивитися свій розклад або навіть приглушити світло. Помічник може багато чого. І чим довше ви використовуєте, тим краще він працює. Менше часу по телефону &ndash; більше часу для радощів життя.</p>\r\n<p><strong>Ми підвищили вимоги до дизайну, а потім довели його до досконалості</strong></p>\r\n<p>Майстерність та витонченість - на кожен день. Товщина 8,4 мм. Якісне скло 2.5D із закругленими кутами з передньої та задньої сторони. Чи не телефон, а суцільне задоволення тримати в руці. Екран HD + 5,71 дюймів із співвідношенням сторін 19:9 Суцільне задоволення не тільки тримати, але й дивитися. Батарея, яка підлаштовується під вас та довго тримає заряд.</p>\r\n<p><strong>Пам\'ятні моменти ще ніколи не виглядали так ефектно</strong></p>\r\n<p>Діліться емоціями. За допомогою подвійної основної камери і ширококутної Selfie камери всі посмішки будуть у кадрі. Виявіть свої творчі здібності, використовуючи новітні функції, такі як режим боке та розширене редагування знімків.</p>\r\n<p><strong>Постійно вдосконалюється</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистій Android 9 Pie без сторонніх програм. Нічого зайвого &ndash; плюс безкоштовні оновлення безпеки раз на місяць, не уповільнюють роботу телефону.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Смартфони', 'Коли під рукою Google Асистент життя набирає темпу. Можна ставити запитання, дивитися свій розклад або навіть приглушити світло. Помічник може багато чого. І чим довше ви використовуєте, тим краще він працює. '),
(3, 'ua', 19, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений HD Super AMOLED Plus-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 4.6\" і камерою на 13 Mpx.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy Fold - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений HD Super AMOLED Plus-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 4.6\" і камерою на 13 Mpx.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">4380 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Смартфони', 'Samsung Galaxy Fold - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений HD Super AMOLED Plus-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 4.6\" і камерою на 13 Mpx.'),
(3, 'ua', 20, 'Samsung Galaxy S10', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 1.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">на 4500 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 1.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">на 4500 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Смартфони', 'Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів,'),
(3, 'ua', 21, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx 0 .</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Смартфони', 'Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx.'),
(3, 'ua', 22, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Смартфони', 'Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.'),
(3, 'ua', 23, 'Samsung Galaxy A50', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', '<p><span id=\"hscc\">Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Мобільні телефони', 'Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 'ua', 24, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.2\" і камерою на 13 Mpx .</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Смартфони', 'Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн.'),
(3, 'ua', 25, 'Samsung Galaxy A20', '<p>Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8х-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Смартфони', 'Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн.'),
(3, 'ua', 26, 'Samsung Galaxy A70', '<p>Samsung Galaxy A70 - відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx.</p>', '<p><span id=\"hscc\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A70 &mdash; відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx. Оснащений дуже потужним акумулятором на 4500 mAh.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</span></span></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Смартфони', 'Samsung Galaxy A70 - відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx.'),
(3, 'ua', 27, 'Samsung Galaxy A40', '<p>Samsung Galaxy A40 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Samsung Galaxy A40 &mdash; чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx. Оснащений дуже потужним акумулятором на 3100 mAh.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.Також варто відзначити, що він оснащений GPS-приймачем, який дозволить Вам не заблукати в будь-якому</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">місці!</span></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Смартфони', 'Samsung Galaxy A40 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx.'),
(3, 'ua', 28, 'Samsung Galaxy A2', '<p>GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</p>', '<p><span id=\"hscc\">GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобільні телефони', 'GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графіч'),
(3, 'ua', 29, 'Samsung Galaxy A80', '<p>Самсунг Галаксі A80 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7 \"і камерою на 48 Mpx.</p>', '<h3>Більш живі й природні кадри</h3>\r\n<p>Режим Scene Optimizer допомагає вашим фотографіям стати дійсно приголомшливими. Використовуючи штучний інтелект, смартфон визначає, що знаходиться в кадрі, і покращує фото для отримання більш живою і яскравої картинки. А також пропонує оптимальні настройки освітлення для зйомки в темряві, щоб ваші знімки вийшли якнайкраще.</p>\r\n<h3>Суцільне задоволення</h3>\r\n<p>Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою без всяких відволікаючих деталей. А роздільна здатність Full HD + робить зображення максимально детальним.</p>\r\n<h3>Акумулятор, який тримає заряд довше</h3>\r\n<p>Спілкуйтеся, шукайте потрібну інформацію в мережі, слухайте улюблену музику і діліться свіжими фото з друзями в соціальних мережах. Samsung Galaxy A80 з ємною батареєю на 3700 мАг дозволяє користуватися смартфоном весь день, без обмежень. Режим адаптивного енергоощадження оптимізує енергоспоживання, закриваючи невикористовувані додатки, а технологія швидкої зарядки потужністю 25 Вт дозволяє заряджати батарею неймовірно швидко.</p>\r\n<h3>Готовий прийняти виклик</h3>\r\n<p>Маючи потужний 8-ядерний процесор і 8 Гб оперативної пам\'яті, Galaxy A80 здатний впоратися з будь-яким завданням. Тим більше, що функція Intelligent Performance Enhancer, яка розпізнає звички користувача, робить роботу системи ще більш ефективною. Завдяки цьому ви можете комфортно працювати, грати і використовувати свій телефон по максимуму кожен раз.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильні телефони', 'Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою '),
(3, 'ua', 30, 'Samsung Galaxy A20e', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки.</p>', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки. Апарат оснастили IPS-дисплеєм Infinity-V діагоналлю 5,8 дюйма з роздільною здатністю 1560x720 пікселів з невеликим вирізом для селф-камери у верхній частині. Сканер відбитків пальців, на відміну від старших моделей лінійки, розташувався на задній кришці пристрою. Під &laquo;капотом&raquo; Galaxy A20e встановлений процесор Exynos 7884, який працює за підтримки 3 ГБ оперативної пам\'яті. Вбудоване сховище об\'ємом 32 ГБ можна додатково розширити за допомогою карти microSD. Ємність акумулятора новинки з підтримкою швидкої зарядки потужністю 15 Вт складає 3000 мАг. Основна камера гаджета складається з двох сенсорів: основного з дозволом 16 Мп (f / 1.9) і допоміжного 5-мегапіксельного з діафрагмою f / 2.2. Фронталки представлена ​​єдиним датчиком на 8 Мп (f / 2.0).</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильні телефони', 'Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з «краплею», подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидк'),
(3, 'ua', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився.&nbsp;</p>', '<p>ПРЕКРАСНА СІМКА</p>\r\n<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка &laquo;Додому&raquo; тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корпус в нових кольорах з допрацьованим дизайном.</p>\r\n<p>притягують увагу</p>\r\n<p>iPhone 7 притягує до себе увагу. Унікальний колір &laquo;чорний онікс&raquo; радує око благородної грою світла на глянцевому поверхні і гранях. Корпус захищений від бризок і води. Оновлені кнопка &laquo;Додому&raquo; і дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОДОМУ&raquo;</p>\r\n<p>Стала сенсорної і отримала чутливість до сили натискання. Завдяки вбудованому Taptic Engine тактильний відгук при натисненні отримав кілька рівнів інтенсивності. Чим сильніше натискання на кнопку, тим сильніше відгук телефону - це новий досвід використання і сприйняття.</p>\r\n<p>вологозахистом КОРПУСУ</p>\r\n<p>Конструкція корпусу iPhone змінилася і всередині. Смартфон нового покоління захищений за стандартом IP67 від вологи і пилу.</p>\r\n<p>КАРДИНАЛЬНО НОВИЙ ПОГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 виявлено новий модуль камери з 6-лінзовий об\'єктивом зі світлосилою &fnof; / 1.8 і оптичною стабілізацією. Сенсор став в 2 рази швидше. Спалах з 4 діодами. Спеціальний ISP-процесор керує роботою камери. Все це виводить якість знімків на новий рівень, особливо в умовах недостатньої освітленості. Фронтальна камера оснащена сенсором 7 Мп з поліпшеним колірним діапазоном. Отримати чіткі і яскраві Селфі тепер ще простіше.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильні телефони', 'Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка «Додому» тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корп'),
(1, '', 34, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br /><br />Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br /><br /><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br /><br />Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br /><br /><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br /><br />Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br /><br /><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br /><br />Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br /><br /><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br /><br />Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br /><br /><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br /><br />Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br /><br />Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br /><br /><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br /><br />Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br /><br /><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br /><br />Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br /><br /><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br /><br />Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!'),
(3, 'ua', 32, 'Samsung Galaxy S7', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px.</p>', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px. Оснащений потужним акумулятором на 3000 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ік-порт, стерео Bluetooth, і, звичайно, USB-порт. Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобільні телефони', 'Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з р'),
(3, 'ua', 33, 'Apple iPhone X', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн з переосмисленої системою управління.</p>', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн<br>з переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. Досконале апаратне ядро, завдяки найпотужнішою внутрішньої 64 бітної архітектури. Разюче поліпшена найпопулярніша в світі мобільна камера.<br>Саме таким бачить свій флагманський смартфон компанія Apple в 2017 році.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобільні телефони', 'Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн\r\nз переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. '),
(2, '', 34, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.'),
(3, '', 34, 'Samsung Galaxy Watch', '<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>', '<p><strong>Смарт-годинник Samsung Galaxy Watch Active</strong></p>\r\n<p>Ваш новий рівень функціональних можливостей</p>\r\n<p><strong>Нові можливості</strong></p>\r\n<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>\r\n<p><strong>Дизайн для активних користувачів</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active &ndash; це сучасний гаджет, укладений в гармонійний спортивний корпус. Чи плануєте відвідати вечірку або конференцію? Великий вибір ремінців різних кольорів допоможе вам легко змінити стиль та імідж в залежності від настрою або дрес-коду.</p>\r\n<p><strong>Проста лаконічна краса</strong></p>\r\n<p>Маючи в запасі різні візуальні варіанти, циферблат Samsung Galaxy Watch Active налаштовується на ваш ритм, щоб відповідати стилю і функціональним потребам. Яку б ви не ставили мета перед собою, смарт &ndash; годинник Samsung допоможуть її досягти.</p>\r\n<p><strong>Завжди залишайтеся в формі</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active мотивують вас підтримувати форму. Режим &laquo;Денна активність&raquo; допоможе вам досягати намічених цілей:не сидіть, рухайтеся, будьте активними. Вдосконалені високочутливі сенсори руху автоматично виконують виміри і відстежують сім різних типів активності, щоб надати вам точну інформацію про ваших денних фізичних навантаженнях. У годиннику встановлено датчик GPS. Ступінь їх водозащити становить 5ATM.</p>\r\n<p><strong>Керуйте рівнем стресу</strong></p>\r\n<p>Інтегрований датчик серцебиття відстежує ваш серцевий ритм і, в разі виявлення аномальних відхилень, відправляє вам повідомлення. Годинники Samsung Galaxy Watch Active визначать рівень вашого стресу і запропонують зробити дихальні вправи на розслаблення. Спостерігайте за рівнем стресу до і після розслабляючого дихання.</p>\r\n<ul>\r\n<li>Контроль стресу і енергії в кілька торкань</li>\r\n<li>Розслаблюючі дихальні вправи допоможуть вам прийти в норму</li>\r\n<li>Медитативних вправи для відновлення внутрішнього балансу</li>\r\n</ul>\r\n<p><strong>Слідкуйте за здоров\'ям</strong></p>\r\n<p>Додаток Samsung Health допоможе вам здійснювати постійний контроль за своїм самопочуттям. Переглядайте дані про стан вашого здоров\'я на дисплеї годин, користуйтеся великою кількістю інструментів, щоб керувати не тільки своєю фізичною активністю, а й загальним самопочуттям.</p>\r\n<p><strong>Не завершуйте спілкування</strong></p>\r\n<p>Завжди залишайтеся на зв\'язку. Надсилайте смайлики, текстові або голосові повідомлення за допомогою Galaxy Watch Active, навіть коли ваш телефон знаходиться на підзарядці.</p>\r\n<p><strong>Передові технології заряду</strong></p>\r\n<p>Інноваційна технологія бездротової зарядки Wireless Power Share допоможе швидко поповнити заряд пристрою. Galaxy Watch Active відстежують вашу активність до 45 годин без підзарядки.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес – годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.'),
(1, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов. '),
(2, '', 35, 'Samsung Galaxy Watch', '<p>The Samsung Galaxy Watch combines the elegant design of a classic watch with cutting-edge technology from the world of smart gadgets.</p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.</span></li>\r\n<li><span class=\"a-list-item\">Go nonstop for days on a single charge. The wireless charger lets you power up without slowing down. (Average expected performance based on typical use. Results may vary.)</span></li>\r\n<li><span class=\"a-list-item\">Available in two sizes and three colors, the Galaxy Watch offers stylish watch faces so realistic they hardly look digital. Plus, choose from a collection of interchangeable bands.</span></li>\r\n<li><span class=\"a-list-item\">Pairs with both Android and iOS smartphones via Bluetooth connection.</span></li>\r\n<li><span class=\"a-list-item\">Included in box: Galaxy Watch, Additional Strap (Large and Small included), Wireless charging Dock, Travel Adaptor, Quick Start Guide, User Manual (Warranty: 1 Year Standard Parts and Labor)</span></li>\r\n</ul>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.'),
(3, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.</p>', '<p><strong>НЕМАЄ МЕЖІ ДОСКОНАЛОСТІ </strong></p>\r\n<p>Знайомтеся: ваш провідник у світ персональної ефективності. Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.</p>\r\n<p><strong>НОВИЙ ПОГЛЯД НА АУТЕНТИЧНІСТЬ </strong></p>\r\n<p>Оригінальне дизайнерське рішення Samsung Galaxy Watch пропонує можливість вибору об\'ємного 3D циферблата з імітацією справжніх стрілок та звуку цокання, як ніколи наближаючи досвід використання до відчуттів від традиційних механічних годинників.</p>\r\n<p><strong>ОБЕРІТЬ СВІЙ СТИЛЬ </strong></p>\r\n<p>Підкресліть свою індивідуальність із Galaxy Watch. Виберіть модель, яка підходить вам за кольором і розміром корпусу: з діаметром 42 мм (колір Глибокий чорний або Рожеве золото) або 46 мм (колір Срібляста сталь). Надайте образу завершеність, підібравши сподобався дизайн циферблата і ремінця.</p>\r\n<p><strong>ЗАВЖДИ АКТИВНИЙ ЕКРАН </strong></p>\r\n<p>Налаштуйте режим Always On Display так, щоб sAMOLED екран ваших Galaxy Watch показував час завжди - без необхідності натискати на кнопку увімкнення або повертати безіль.</p>\r\n<p><strong>ПЕРСОНАЛЬНИЙ ФІТНЕС-ТРЕНЕР </strong></p>\r\n<p>Виведіть ефективність ваших тренувань на новий рівень із персональним тренером - Samsung Galaxy Watch! Ваш розумний пристрій виміряє частоту серцевого ритму та автоматично зафіксує різні типи активності. Виберіть додаткову активність для відстеження зі списку до 39 можливих варіантів.</p>\r\n<p><strong>SAMSUNG HEALTH </strong></p>\r\n<p>За допомогою сервісу Samsung Health ви можете розширити існуючі функції Galaxy Watch та ще й детальніше фіксувати параметри стану вашого здоров\'я.</p>\r\n<p><strong>НА СТРАЖІ ЗДОРОВ\'Я ВДЕНЬ І ВНІЧІ </strong></p>\r\n<p>Всі знають, наскільки важливим є здоровий сон і як він впливає на самопочуття. Samsung Galaxy Watch проаналізує параметри сну протягом ночі, фіксуючи в журналі його фази.</p>\r\n<p><strong>ПЕРСОНАЛЬНИЙ АСИСТЕНТ </strong></p>\r\n<p>Galaxy Watch фіксує ваше пробудження та виводить на екран інформацію про погоду, а також список справ на сьогодні та нагадування. Зведення подій перед сном відображає пропущені нагадування, результати тренувань та активності, погоду на завтра та стан заряду акумулятора.</p>\r\n<p><strong>ТАЙМ МЕНЕДЖМЕНТ </strong></p>\r\n<p>Переведіть Samsung Galaxy Watch в режим My Day для зручного та ефективного керування своїм часом. Швидкий та зручний доступ до запланованих подій, відстеження часу до наступного сповіщення та нагадування, які не дадуть нічого пропустити. Плануйте свій день ефективно та легко. Менше часу на плани, більше на їхню реалізацію.</p>\r\n<p><strong>ВЕЛИКА БІБЛІОТЕКА ДОДАТКІВ </strong></p>\r\n<p>Бібліотека програм Galaxy Apps дозволить вибрати не тільки найзручніші інструменти для виконання щоденних завдань, але й різні ігри, розроблені спеціально для круглого дисплея Galaxy Watch.</p>\r\n<p><strong>КОМПАКТНИЙ НАВІГАТОР </strong></p>\r\n<p>Вбудований модуль GPS допоможе визначити місцезнаходження та відстежити маршрут руху. А вбудовані альтиметр та барометр допоможуть, якщо ви вирішите зійти з наміченого маршруту.</p>\r\n<p><strong>ЗАЛИШАЙТЕ ГАМАНЕЦЬ ВДОМА</strong></p>\r\n<p>За допомогою зручного та надійного сервісу безконтактної оплати Samsung Pay, покупки можна робити одним помахом руки &ndash; вам навіть не потрібно виймати з кишені смартфон чи гаманець.</p>\r\n<p><strong>ЗАРЯДЖАЙТЕСЯ БЕЗ ДРОТІВ</strong></p>\r\n<p>Зарядити акумулятор простіше. Помістіть Galaxy Watch на бездротовий зарядний пристрій і процес заряджання розпочнеться автоматично.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.'),
(1, '', 39, 'Apple iPhone 12', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 39, 'Apple iPhone 12', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 39, 'Apple iPhone 12', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_variants`
--

DROP TABLE IF EXISTS `t_lang_variants`;
CREATE TABLE `t_lang_variants` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_variants`
--

INSERT INTO `t_lang_variants` (`lang_id`, `lang_label`, `variant_id`, `name`, `color`) VALUES
(1, '', 1, '', ''),
(1, '', 2, '64 ГБ', ''),
(1, '', 3, '', ''),
(1, '', 4, '', ''),
(1, '', 5, '', ''),
(1, '', 6, '', ''),
(1, '', 7, '', ''),
(1, '', 8, '', ''),
(1, '', 9, '', ''),
(1, '', 10, '', ''),
(1, '', 11, '', ''),
(1, '', 12, '', ''),
(1, '', 13, '', ''),
(1, '', 14, '', ''),
(1, '', 15, '', ''),
(1, '', 16, '', ''),
(1, '', 17, '', ''),
(1, '', 18, '', ''),
(1, '', 19, '', ''),
(1, '', 20, '', ''),
(1, '', 21, '32 ГБ', ''),
(1, '', 22, '', ''),
(1, '', 23, '64 ГБ', 'Черный'),
(1, '', 24, '128 ГБ', 'Синий'),
(1, '', 25, '256 ГБ', 'Белый'),
(1, '', 26, '512 ГБ', 'Синий'),
(1, '', 27, '', ''),
(1, '', 28, '', ''),
(1, '', 29, '', ''),
(1, '', 30, '', ''),
(1, '', 31, '', ''),
(1, '', 32, '', ''),
(1, '', 33, '', ''),
(1, '', 34, '', ''),
(1, '', 35, '', ''),
(1, '', 36, '', ''),
(2, 'en', 1, '', ''),
(2, 'en', 2, '64 GB', ''),
(2, 'en', 3, '', ''),
(2, 'en', 4, '', ''),
(2, 'en', 5, '', ''),
(2, 'en', 6, '', ''),
(2, 'en', 7, '', ''),
(2, 'en', 8, '', ''),
(2, 'en', 9, '', ''),
(2, 'en', 10, '', ''),
(2, 'en', 11, '', ''),
(2, 'en', 12, '', ''),
(2, 'en', 13, '', ''),
(2, 'en', 14, '', ''),
(2, 'en', 15, '', ''),
(2, 'en', 16, '', ''),
(2, 'en', 17, '', ''),
(2, 'en', 18, '', ''),
(2, 'en', 19, '', ''),
(2, 'en', 20, '', ''),
(2, 'en', 21, '32 GB', ''),
(2, 'en', 22, '', ''),
(2, 'en', 23, '64 GB', 'Black'),
(2, 'en', 24, '128 GB', 'Blue'),
(2, 'en', 25, '256 GB', 'White'),
(2, 'en', 26, '256 GB', 'Blue'),
(2, 'en', 27, '', ''),
(2, 'en', 28, '', ''),
(2, 'en', 29, '', ''),
(2, 'en', 30, '', ''),
(2, 'en', 31, '', ''),
(2, 'en', 32, '', ''),
(2, 'en', 33, '', ''),
(2, 'en', 34, '', ''),
(2, 'en', 35, '', ''),
(2, 'en', 36, '', ''),
(3, 'ua', 1, '', ''),
(3, 'ua', 2, '64 ГБ', ''),
(3, 'ua', 3, '', ''),
(3, 'ua', 4, '', ''),
(3, 'ua', 5, '', ''),
(3, 'ua', 6, '', ''),
(3, 'ua', 7, '', ''),
(3, 'ua', 8, '', ''),
(3, 'ua', 9, '', ''),
(3, 'ua', 10, '', ''),
(3, 'ua', 11, '', ''),
(3, 'ua', 12, '', ''),
(3, 'ua', 13, '', ''),
(3, 'ua', 14, '', ''),
(3, 'ua', 15, '', ''),
(3, 'ua', 16, '', ''),
(3, 'ua', 17, '', ''),
(3, 'ua', 18, '', ''),
(3, 'ua', 19, '', ''),
(3, 'ua', 20, '', ''),
(3, 'ua', 21, '32 ГБ', ''),
(3, 'ua', 22, '', ''),
(3, 'ua', 23, '64 ГБ', 'Чорний'),
(3, 'ua', 24, '128 ГБ', 'Синій'),
(3, 'ua', 25, '256 ГБ', 'Білий'),
(3, 'ua', 26, '512 ГБ', 'Синій'),
(3, 'ua', 27, '', ''),
(3, 'ua', 28, '', ''),
(3, 'ua', 29, '', ''),
(3, 'ua', 30, '', ''),
(3, 'ua', 31, '', ''),
(3, 'ua', 32, '', ''),
(3, 'ua', 33, '', ''),
(3, 'ua', 34, '', ''),
(3, 'ua', 35, '', ''),
(3, 'ua', 36, '', ''),
(1, '', 38, '256 ГБ', 'Синий'),
(2, '', 38, '512 GB', 'Blue'),
(3, '', 38, '256 ГБ', 'Синій'),
(1, '', 39, '512 ГБ', 'Черный'),
(2, '', 39, '512 GB', 'Black'),
(3, '', 39, '512 ГБ', 'Чорний'),
(1, '', 40, '', ''),
(2, '', 40, '', ''),
(3, '', 40, '', ''),
(1, '', 41, '', ''),
(2, '', 41, '', ''),
(3, '', 41, '', ''),
(1, '', 64, '64 ГБ', ''),
(2, '', 64, '64 GB', ''),
(3, '', 64, '64 ГБ', ''),
(1, '', 65, '64 ГБ', 'Черный'),
(2, '', 65, '64 GB', 'Black'),
(3, '', 65, '64 ГБ', 'Чорний'),
(1, '', 66, '128 ГБ', 'Черный'),
(2, '', 66, '128 GB', 'Black'),
(3, '', 66, '128 ГБ', 'Чорний'),
(1, '', 67, '256 ГБ', 'Черный'),
(2, '', 67, '256 GB', 'Black'),
(3, '', 67, '256 ГБ', 'Чорний'),
(1, '', 68, '64 ГБ', 'Синий'),
(2, '', 68, '64 GB', 'Blue'),
(3, '', 68, '64 ГБ', 'Синій'),
(1, '', 69, '128 ГБ', 'Синий'),
(2, '', 69, '128 GB', 'Blue'),
(3, '', 69, '128 ГБ', 'Синій'),
(1, '', 70, '256 ГБ', 'Синий'),
(2, '', 70, '256 GB', 'Blue'),
(3, '', 70, '256 ГБ', 'Синій'),
(1, '', 71, '64 ГБ', 'Красный'),
(2, '', 71, '64 GB', 'Red'),
(3, '', 71, '64 ГБ', 'Червоний'),
(1, '', 72, '128 ГБ', 'Красный'),
(2, '', 72, '128 GB', 'Red'),
(3, '', 72, '128 ГБ', 'Червоний'),
(1, '', 73, '256 ГБ', 'Красный'),
(2, '', 73, '256 GB', 'Red'),
(3, '', 73, '256 ГБ', 'Червоний'),
(1, '', 74, '64 ГБ', 'Зеленый'),
(2, '', 74, '64 GB', 'Green'),
(3, '', 74, '64 ГБ', 'Зелений'),
(1, '', 75, '128 ГБ', 'Зеленый'),
(2, '', 75, '128 GB', 'Green'),
(3, '', 75, '128 ГБ', 'Зелений'),
(1, '', 76, '256 ГБ', 'Зеленый'),
(2, '', 76, '256 GB', 'Green'),
(3, '', 76, '256 ГБ', 'Зелений'),
(1, '', 77, '64 ГБ', 'Белый'),
(2, '', 77, '64 GB', 'White'),
(3, '', 77, '64 ГБ', 'Білий'),
(1, '', 78, '128 ГБ', 'Белый'),
(2, '', 78, '128 GB', 'White'),
(3, '', 78, '128 ГБ', 'Білий'),
(1, '', 79, '256 ГБ', 'Белый'),
(2, '', 79, '256 GB', 'White'),
(3, '', 79, '256 ГБ', 'Білий'),
(2, '', 81, '512 GB', 'White'),
(3, '', 81, '512 ГБ', 'Білий'),
(1, '', 81, '512 ГБ', 'Белый');

-- --------------------------------------------------------

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_menu`
--

INSERT INTO `t_menu` (`id`, `name`, `position`) VALUES
(1, 'Main menu', 1),
(2, 'Other pages', 2),
(3, 'Information', 3),
(4, 'Landing pages', 4);

-- --------------------------------------------------------

--
-- Table structure for table `t_options`
--

DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translit` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_options`
--

INSERT INTO `t_options` (`product_id`, `feature_id`, `lang_id`, `value`, `translit`) VALUES
(1, 1, 1, 'IOS', 'ios'),
(23, 8, 2, '64 GB', '64gb'),
(23, 5, 1, '8', '8'),
(23, 6, 1, '2.3 MГц', '23mgts'),
(23, 7, 1, 'Mali-G72 MP3', 'malig72mp3'),
(23, 8, 1, '64 ГБ', '64gb'),
(29, 8, 1, '128 ГБ', '128gb'),
(29, 10, 1, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(29, 11, 1, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(30, 10, 1, '13 MP + 5 MP', '13mp5mp'),
(30, 9, 1, 'microSDXC', 'microsdxc'),
(30, 8, 1, '32 ГБ', '32gb'),
(30, 7, 1, 'ARM Mali-G71', 'armmalig71'),
(30, 6, 1, '1.6 MГц', '16mgts'),
(30, 5, 1, '8', '8'),
(30, 4, 1, 'Exynos 7884', 'exynos7884'),
(30, 2, 1, '3 GB', '3gb'),
(30, 1, 1, 'Android', 'android'),
(30, 3, 1, '#000000', '000000'),
(31, 8, 1, '32 ГБ', '32gb'),
(31, 7, 1, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(31, 6, 1, '2.3 MГц', '23mgts'),
(31, 5, 1, '4', '4'),
(31, 4, 1, 'A10', 'a10'),
(31, 2, 1, '2 ГБ', '2gb'),
(31, 1, 1, 'IOS', 'ios'),
(31, 3, 1, '#000000', '000000'),
(32, 5, 1, '4', '4'),
(32, 6, 1, '2.6 MГц', '26mgts'),
(32, 7, 1, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(32, 8, 1, '32 ГБ', '32gb'),
(33, 11, 1, '7 МП', '7mp'),
(23, 4, 2, 'Exynos 9610', 'exynos9610'),
(23, 5, 2, '8', '8'),
(23, 6, 2, '2.3 MHz', '23mhz'),
(23, 7, 2, 'Mali-G72 MP3', 'malig72mp3'),
(29, 8, 2, '128 GB', '128gb'),
(29, 7, 2, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(29, 6, 2, '2.2 MHz', '22mhz'),
(29, 5, 2, '8', '8'),
(30, 5, 2, '8', '8'),
(30, 6, 2, '1.6 MHz', '16mhz'),
(30, 7, 2, 'ARM Mali-G71', 'armmalig71'),
(30, 8, 2, '32 GB', '32gb'),
(31, 5, 2, '4', '4'),
(31, 6, 2, '2.3 MHz', '23mhz'),
(32, 8, 2, '32 GB', '32gb'),
(32, 9, 2, 'microSDXC', 'microsdxc'),
(23, 8, 3, '64 ГБ', '64gb'),
(23, 9, 3, 'microSDXC', 'microsdxc'),
(23, 10, 3, '25 Мп + 5 Мп + 8 Мп', '25mp5mp8mp'),
(23, 11, 3, '25 Мп', '25mp'),
(23, 12, 3, 'Super AMOLED', 'superamoled'),
(29, 8, 3, '128 ГБ', '128gb'),
(29, 10, 3, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(30, 6, 3, '1.6 MГц', '16mgts'),
(30, 7, 3, 'ARM Mali-G71', 'armmalig71'),
(30, 8, 3, '32 ГБ', '32gb'),
(30, 9, 3, 'microSDXC', 'microsdxc'),
(30, 10, 3, '13 MP + 5 MP', '13mp5mp'),
(31, 8, 3, '32 ГБ', '32gb'),
(31, 10, 3, '12 МП', '12mp'),
(31, 11, 3, '7 МП', '7mp'),
(31, 12, 3, 'IPS', 'ips'),
(31, 13, 3, '4.7\"', '47'),
(32, 7, 3, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(32, 6, 3, '2.6 MГц', '26mgts'),
(32, 5, 3, '4', '4'),
(33, 6, 3, '2.1 MГц', '21mgts'),
(33, 8, 3, '64 ГБ', '64gb'),
(33, 10, 3, '12 МП', '12mp'),
(29, 11, 3, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(30, 4, 3, 'Exynos 7884', 'exynos7884'),
(30, 9, 2, 'microSDXC', 'microsdxc'),
(33, 6, 2, '2.1 MHz', '21mhz'),
(30, 2, 3, '3 ГБ', '3gb'),
(33, 11, 3, '7 МП', '7mp'),
(32, 7, 2, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(30, 11, 2, '8 MP', '8mp'),
(23, 2, 2, '4 GB', '4gb'),
(23, 13, 3, '6.4\"', '64'),
(31, 10, 2, '12 MP', '12mp'),
(23, 14, 3, 'Li-Po', 'lipo'),
(30, 14, 3, 'Li-Polymer', 'lipolymer'),
(21, 8, 1, '32 ГБ', '32gb'),
(32, 8, 3, '32 ГБ', '32gb'),
(33, 5, 3, '6', '6'),
(33, 4, 3, 'A11', 'a11'),
(31, 10, 1, '12 MP', '12mp'),
(31, 11, 1, '7 MP', '7mp'),
(31, 12, 1, 'IPS', 'ips'),
(23, 9, 1, 'microSDXC', 'microsdxc'),
(23, 10, 1, '25 Мп + 5 Мп + 8 Мп', '25mp5mp8mp'),
(23, 9, 2, 'microSDXC', 'microsdxc'),
(23, 10, 2, '25 MP + 5 MP + 8 MP', '25mp5mp8mp'),
(23, 7, 3, 'Mali-G72 MP3', 'malig72mp3'),
(23, 6, 3, '2.3 MГц', '23mgts'),
(30, 10, 2, '13 MP + 5 MP', '13mp5mp'),
(30, 5, 3, '8', '8'),
(31, 14, 3, 'Li-Ion', 'liion'),
(32, 6, 2, '2.6 MHz', '26mhz'),
(31, 7, 2, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(33, 8, 2, '64 GB', '64gb'),
(32, 5, 2, '4', '4'),
(30, 11, 3, '8 Мп', '8mp'),
(23, 11, 2, '25 MP', '25mp'),
(29, 7, 1, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(29, 10, 2, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera'),
(29, 7, 3, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(33, 10, 2, '12 MP', '12mp'),
(31, 15, 3, '1960 мА·ч', '1960mach'),
(30, 12, 3, 'PLS', 'pls'),
(31, 4, 2, 'A10', 'a10'),
(31, 8, 2, '32 GB', '32gb'),
(30, 13, 3, '5.8\"', '58'),
(32, 4, 1, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(32, 10, 2, '12 MP', '12mp'),
(32, 4, 3, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(32, 2, 3, '4 ГБ', '4gb'),
(31, 7, 3, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(31, 6, 3, '2.3 MГц', '23mgts'),
(30, 1, 3, 'Android', 'android'),
(28, 13, 1, '5\"', '5'),
(28, 12, 1, 'IPS', 'ips'),
(28, 11, 1, '5 МП', '5mp'),
(28, 10, 1, '8 МП', '8mp'),
(28, 9, 1, 'microSD', 'microsd'),
(28, 8, 1, '8 ГБ', '8gb'),
(28, 7, 1, 'ARM Mali-T830', 'armmalit830'),
(28, 6, 1, '1.6 MГц', '16mgts'),
(28, 5, 1, '8', '8'),
(28, 4, 1, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 2, 1, '1 ГБ', '1gb'),
(28, 1, 1, 'Android', 'android'),
(28, 8, 2, '8 GB', '8gb'),
(28, 7, 2, 'ARM Mali-T830', 'armmalit830'),
(28, 6, 2, '1.6 MHz', '16mhz'),
(28, 5, 3, '8', '8'),
(28, 6, 3, '1.6 MГц', '16mgts'),
(28, 7, 3, 'ARM Mali-T830', 'armmalit830'),
(28, 8, 3, '8 ГБ', '8gb'),
(28, 9, 3, 'microSD', 'microsd'),
(28, 10, 3, '8 МП', '8mp'),
(28, 11, 3, '5 МП', '5mp'),
(28, 12, 3, 'IPS', 'ips'),
(28, 13, 3, '5\"', '5'),
(28, 14, 3, 'Li-Ion', 'liion'),
(28, 15, 3, '2600 мА·ч', '2600mach'),
(28, 9, 2, 'microSD', 'microsd'),
(28, 10, 2, '8 MP', '8mp'),
(28, 11, 2, '5 MP', '5mp'),
(28, 12, 2, 'IPS', 'ips'),
(28, 13, 2, '5\"', '5'),
(33, 5, 2, '6', '6'),
(31, 2, 2, '2 GB', '2gb'),
(21, 9, 1, 'microSD', 'microsd'),
(21, 10, 1, '16 + 5', '165'),
(21, 11, 1, '16 МП', '16mp'),
(21, 12, 1, 'Super AMOLED', 'superamoled'),
(21, 13, 1, '6.4\"', '64'),
(21, 14, 1, 'Li-Ion', 'liion'),
(21, 15, 1, '4000 мА·ч', '4000mach'),
(21, 10, 2, '16 + 5', '165'),
(21, 9, 2, 'microSD', 'microsd'),
(21, 8, 2, '32 GB', '32gb'),
(21, 7, 2, 'Mali-G71 MP2', 'malig71mp2'),
(21, 6, 2, '1.8 MHz', '18mhz'),
(34, 1, 1, 'Tizen', 'tizen'),
(34, 8, 1, '4 ГБ', '4gb'),
(35, 1, 1, 'Tizen', 'tizen'),
(35, 8, 1, '4 ГБ', '4gb'),
(12, 8, 1, '4 ГБ', '4gb'),
(33, 12, 1, 'OLED', 'oled'),
(37, 3, 1, '#ffffff', 'ffffff'),
(37, 3, 1, '#ffcc00', 'ffcc00'),
(37, 3, 1, '#ff0000', 'ff0000'),
(37, 3, 1, '#339966', '339966'),
(37, 3, 1, '#000000', '000000'),
(37, 3, 1, '#0000ff', '0000ff'),
(38, 3, 1, '#0000ff', '0000ff'),
(38, 3, 1, '#339966', '339966'),
(38, 3, 1, '#ff0000', 'ff0000'),
(38, 3, 1, '#ffcc00', 'ffcc00'),
(38, 3, 1, '#ffffff', 'ffffff'),
(38, 3, 1, '#000000', '000000'),
(21, 7, 1, 'Mali-G71 MP2', 'malig71mp2'),
(21, 5, 1, '8', '8'),
(21, 6, 1, '1.8 MГц', '18mgts'),
(39, 3, 2, '#ffffff', 'ffffff'),
(39, 8, 1, '256 ГБ', '256gb'),
(39, 8, 1, '128 ГБ', '128gb'),
(39, 8, 1, '64 ГБ', '64gb'),
(39, 4, 1, 'Apple A14 Bionic', 'applea14bionic'),
(39, 1, 2, 'IOS', 'ios'),
(39, 2, 2, '4 GB', '4gb'),
(39, 4, 2, 'Apple A14 Bionic', 'applea14bionic'),
(39, 5, 2, '6', '6'),
(39, 6, 2, '3.1 MHz', '31mhz'),
(39, 8, 2, '64 GB', '64gb'),
(39, 9, 1, 'Нет', 'net'),
(39, 8, 2, '128 GB', '128gb'),
(39, 6, 1, '3.1 MГц', '31mgts'),
(39, 8, 2, '256 GB', '256gb'),
(31, 5, 3, '4', '4'),
(39, 16, 3, '1 SIM', '1sim'),
(39, 12, 3, 'OLED', 'oled'),
(39, 11, 3, '12 МП', '12mp'),
(39, 10, 3, '12 Мп + 12 Мп', '12mp12mp'),
(39, 9, 3, 'Немає', 'nemae'),
(39, 8, 3, '256 ГБ', '256gb'),
(39, 8, 3, '128 ГБ', '128gb'),
(39, 5, 3, '6', '6'),
(39, 6, 3, '3.1 MГц', '31mgts'),
(39, 8, 3, '64 ГБ', '64gb'),
(12, 8, 2, '4 GB', '4gb'),
(12, 8, 3, '4 ГБ', '4gb'),
(34, 1, 3, 'Tizen', 'tizen'),
(34, 1, 2, 'Tizen', 'tizen'),
(35, 8, 2, '4 GB', '4gb'),
(35, 8, 3, '4 ГБ', '4gb'),
(39, 5, 1, '6', '6'),
(39, 2, 1, '4 ГБ', '4gb'),
(39, 1, 1, 'IOS', 'ios'),
(29, 12, 1, 'Super AMOLED', 'superamoled'),
(29, 13, 1, '6.7\"', '67'),
(29, 14, 1, 'Li-Polymer', 'lipolymer'),
(39, 10, 1, '12 Мп + 12 Мп', '12mp12mp'),
(33, 10, 1, '12 МП', '12mp'),
(33, 8, 1, '64 ГБ', '64gb'),
(33, 4, 1, 'A11', 'a11'),
(33, 5, 1, '6', '6'),
(33, 6, 1, '2.1 MГц', '21mgts'),
(29, 6, 1, '2.2 MГц', '22mgts'),
(29, 5, 1, '8', '8'),
(29, 4, 1, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 1, '8 ГБ', '8gb'),
(29, 1, 1, 'Android', 'android'),
(29, 11, 2, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera'),
(29, 6, 3, '2.2 MГц', '22mgts'),
(29, 5, 3, '8', '8'),
(1, 1, 2, 'IOS', 'ios'),
(1, 1, 3, 'IOS', 'ios'),
(33, 11, 2, '7 MP', '7mp'),
(21, 11, 2, '16 MP', '16mp'),
(21, 12, 2, 'Super AMOLED', 'superamoled'),
(21, 13, 2, '6.4\"', '64'),
(21, 4, 1, 'Exynos 7 Octa 7904', 'exynos7octa7904'),
(21, 2, 1, '3 ГБ', '3gb'),
(21, 1, 1, 'Android', 'android'),
(1, 2, 1, '5 GB', '5gb'),
(1, 2, 3, '5 GB', '5gb'),
(1, 2, 2, '5 GB', '5gb'),
(35, 12, 1, 'Super AMOLED', 'superamoled'),
(35, 13, 1, '1.1\"', '11'),
(34, 12, 1, 'Super AMOLED', 'superamoled'),
(34, 13, 1, '1.1\"', '11'),
(12, 1, 1, 'Tizen', 'tizen'),
(32, 9, 1, 'microSDXC', 'microsdxc'),
(32, 10, 1, '12 MP', '12mp'),
(32, 11, 1, '5 MP', '5mp'),
(32, 12, 1, 'Super AMOLED', 'superamoled'),
(32, 2, 1, '4 ГБ', '4gb'),
(32, 1, 1, 'Android', 'android'),
(33, 2, 1, '3 ГБ', '3gb'),
(33, 1, 1, 'IOS', 'ios'),
(33, 3, 1, '#000000', '000000'),
(33, 2, 3, '3 ГБ', '3gb'),
(33, 1, 3, 'IOS', 'ios'),
(33, 3, 3, '#000000', '000000'),
(33, 4, 2, 'A11', 'a11'),
(31, 13, 1, '4.7\"', '47'),
(31, 14, 1, 'Li-Ion', 'liion'),
(31, 15, 1, '1960 мА·ч', '1960mach'),
(31, 17, 1, 'Nano-SIM', 'nanosim'),
(30, 11, 1, '8 MP', '8mp'),
(30, 12, 1, 'PLS', 'pls'),
(30, 13, 1, '5.8\"', '58'),
(30, 14, 1, 'Li-Polymer', 'lipolymer'),
(30, 15, 1, '3000 мА·ч', '3000mach'),
(30, 16, 1, '2 SIM', '2sim'),
(30, 17, 1, 'Nano-SIM', 'nanosim'),
(28, 14, 1, 'Li-Ion', 'liion'),
(28, 15, 1, '2600 мА·ч', '2600mach'),
(28, 16, 1, '2 SIM', '2sim'),
(28, 17, 1, 'micro-SIM', 'microsim'),
(23, 11, 1, '25 Мп', '25mp'),
(23, 12, 1, 'Super AMOLED', 'superamoled'),
(21, 16, 1, '2 SIM', '2sim'),
(21, 17, 1, 'Nano-SIM', 'nanosim'),
(39, 11, 1, '12 МП', '12mp'),
(39, 12, 1, 'OLED', 'oled'),
(39, 13, 1, '6.1\"', '61'),
(39, 14, 1, 'Li-Ion', 'liion'),
(23, 12, 2, 'Super AMOLED', 'superamoled'),
(23, 13, 2, '6.4\"', '64'),
(23, 14, 2, 'Li-Po', 'lipo'),
(23, 5, 3, '8', '8'),
(23, 4, 3, 'Exynos 9610', 'exynos9610'),
(23, 2, 3, '4 ГБ', '4gb'),
(23, 1, 3, 'Android', 'android'),
(23, 3, 3, '#ffffff', 'ffffff'),
(23, 4, 1, 'Exynos 9610', 'exynos9610'),
(23, 2, 1, '4 ГБ', '4gb'),
(23, 1, 1, 'Android', 'android'),
(23, 3, 1, '#ffffff', 'ffffff'),
(30, 4, 2, 'Exynos 7884', 'exynos7884'),
(30, 2, 2, '3 GB', '3gb'),
(30, 1, 2, 'Android', 'android'),
(30, 3, 2, '#000000', '000000'),
(28, 5, 2, '8', '8'),
(28, 4, 2, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 2, 2, '1 GB', '1gb'),
(28, 1, 2, 'Android', 'android'),
(29, 4, 2, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 2, '8 GB', '8gb'),
(29, 1, 2, 'Android', 'android'),
(31, 11, 2, '7 MP', '7mp'),
(31, 12, 2, 'IPS', 'ips'),
(32, 11, 2, '5 MP', '5mp'),
(32, 12, 2, 'Super AMOLED', 'superamoled'),
(32, 13, 2, '5.5\"', '55'),
(33, 12, 2, 'OLED', 'oled'),
(33, 13, 2, '5.8\"', '58'),
(33, 14, 2, 'Li-Ion', 'liion'),
(39, 11, 2, '12 MP', '12mp'),
(39, 10, 2, '12 MP + 12 MP', '12mp12mp'),
(39, 9, 2, 'No', 'no'),
(31, 1, 2, 'IOS', 'ios'),
(31, 3, 2, '#000000', '000000'),
(39, 3, 2, '#d9534f', 'd9534f'),
(39, 3, 2, '#5cb85c', '5cb85c'),
(23, 1, 2, 'Android', 'android'),
(21, 5, 2, '8', '8'),
(21, 4, 2, 'Exynos 7 Octa 7904', 'exynos7octa7904'),
(21, 2, 2, '3 GB', '3gb'),
(21, 1, 2, 'Android', 'android'),
(32, 4, 2, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(39, 3, 3, '#5cb85c', '5cb85c'),
(39, 3, 3, '#d9534f', 'd9534f'),
(39, 3, 3, '#ffffff', 'ffffff'),
(39, 1, 3, 'IOS', 'ios'),
(39, 2, 3, '4 ГБ', '4gb'),
(39, 4, 3, 'Apple A14 Bionic', 'applea14bionic'),
(39, 14, 2, 'Li-Ion', 'liion'),
(39, 13, 2, '6.1\"', '61'),
(39, 12, 2, 'OLED', 'oled'),
(31, 4, 3, 'A10', 'a10'),
(31, 2, 3, '2 ГБ', '2gb'),
(31, 1, 3, 'IOS', 'ios'),
(31, 3, 3, '#000000', '000000'),
(31, 17, 3, 'Nano-SIM', 'nanosim'),
(32, 9, 3, 'microSDXC', 'microsdxc'),
(32, 10, 3, '12 МП', '12mp'),
(32, 11, 3, '5 MP', '5mp'),
(32, 12, 3, 'Super AMOLED', 'superamoled'),
(32, 1, 3, 'Android', 'android'),
(30, 15, 3, '3000 мА·ч', '3000mach'),
(30, 16, 3, '2 SIM', '2sim'),
(30, 17, 3, 'Nano-SIM', 'nanosim'),
(30, 3, 3, '#000000', '000000'),
(29, 12, 3, 'Super AMOLED', 'superamoled'),
(29, 13, 3, '6.7\"', '67'),
(29, 4, 3, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 3, '8 ГБ', '8gb'),
(29, 1, 3, 'Android', 'android'),
(28, 4, 3, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 2, 3, '1 ГБ', '1gb'),
(28, 1, 3, 'Android', 'android'),
(28, 16, 3, '2 SIM', '2sim'),
(28, 17, 3, 'micro-SIM', 'microsim'),
(23, 15, 2, '4000 mAh', '4000mah'),
(23, 16, 2, '2 SIM', '2sim'),
(23, 17, 2, 'Nano-SIM', 'nanosim'),
(23, 15, 3, '4000 мА·ч', '4000mach'),
(23, 16, 3, '2 SIM', '2sim'),
(23, 17, 3, 'Nano-SIM', 'nanosim'),
(21, 14, 2, 'Li-Ion', 'liion'),
(21, 15, 2, '4000 mAh', '4000mah'),
(21, 16, 2, '2 SIM', '2sim'),
(21, 17, 2, 'Nano-SIM', 'nanosim'),
(39, 15, 2, '2775 mAh', '2775mah'),
(39, 16, 2, '1 SIM', '1sim'),
(39, 17, 2, 'Nano-SIM', 'nanosim'),
(32, 14, 2, 'Li-Ion', 'liion'),
(32, 15, 2, '3000 mAh', '3000mah'),
(32, 17, 2, 'Nano-SIM', 'nanosim'),
(32, 2, 2, '4 GB', '4gb'),
(32, 1, 2, 'Android', 'android'),
(32, 3, 2, '#000000', '000000'),
(29, 12, 2, 'Super AMOLED', 'superamoled'),
(29, 13, 2, '6.7\"', '67'),
(29, 14, 2, 'Li-Polymer', 'lipolymer'),
(29, 15, 2, '3700 мAh', '3700mah'),
(28, 14, 2, 'Li-Ion', 'liion'),
(28, 15, 2, '2600 mAh', '2600mah'),
(28, 16, 2, '2 SIM', '2sim'),
(28, 17, 2, 'micro-SIM', 'microsim'),
(29, 16, 2, '2 SIM', '2sim'),
(29, 17, 2, 'Nano-SIM', 'nanosim'),
(30, 12, 2, 'PLS', 'pls'),
(30, 13, 2, '5.8\"', '58'),
(30, 14, 2, 'Li-Polymer', 'lipolymer'),
(30, 15, 2, '3000 mAh', '3000mah'),
(30, 16, 2, '2 SIM', '2sim'),
(30, 17, 2, 'Nano-SIM', 'nanosim'),
(33, 2, 2, '3 GB', '3gb'),
(33, 1, 2, 'IOS', 'ios'),
(33, 3, 2, '#000000', '000000'),
(31, 13, 2, '4.7\"', '47'),
(39, 3, 2, '#000000', '000000'),
(39, 3, 2, '#337ab7', '337ab7'),
(31, 14, 2, 'Li-Ion', 'liion'),
(31, 15, 2, '1960 mAh', '1960mah'),
(31, 17, 2, 'Nano-SIM', 'nanosim'),
(23, 3, 2, '#ffffff', 'ffffff'),
(23, 3, 2, '#337ab7', '337ab7'),
(23, 3, 2, '#000000', '000000'),
(23, 13, 1, '6.4\"', '64'),
(23, 14, 1, 'Li-Po', 'lipo'),
(23, 3, 3, '#337ab7', '337ab7'),
(23, 3, 3, '#000000', '000000'),
(23, 15, 1, '4000 мА·ч', '4000mach'),
(23, 16, 1, '2 SIM', '2sim'),
(23, 3, 1, '#337ab7', '337ab7'),
(23, 3, 1, '#000000', '000000'),
(39, 17, 3, 'Nano-SIM', 'nanosim'),
(39, 13, 3, '6.1\"', '61'),
(39, 14, 3, 'Li-Ion', 'liion'),
(39, 15, 3, '2775 мА·ч', '2775mach'),
(39, 3, 3, '#337ab7', '337ab7'),
(39, 3, 3, '#000000', '000000'),
(39, 3, 1, '#ffffff', 'ffffff'),
(39, 3, 1, '#d9534f', 'd9534f'),
(39, 3, 1, '#5cb85c', '5cb85c'),
(39, 3, 1, '#337ab7', '337ab7'),
(39, 3, 1, '#000000', '000000'),
(23, 17, 1, 'Nano-SIM', 'nanosim'),
(39, 15, 1, '2775 мА·ч', '2775mach'),
(39, 16, 1, '1 SIM', '1sim'),
(39, 17, 1, 'Nano-SIM', 'nanosim'),
(12, 1, 3, 'Tizen', 'tizen'),
(12, 1, 2, 'Tizen', 'tizen'),
(35, 1, 2, 'Tizen', 'tizen'),
(35, 1, 3, 'Tizen', 'tizen'),
(35, 12, 3, 'Super AMOLED', 'superamoled'),
(35, 13, 3, '1.1\"', '11'),
(35, 12, 2, 'Super AMOLED', 'superamoled'),
(35, 13, 2, '1.1\"', '11'),
(34, 8, 2, '4 GB', '4gb'),
(34, 12, 2, 'Super AMOLED', 'superamoled'),
(34, 13, 2, '1.1\"', '11'),
(34, 8, 3, '4 ГБ', '4gb'),
(34, 12, 3, 'Super AMOLED', 'superamoled'),
(34, 13, 3, '1.1\"', '11'),
(12, 12, 1, 'Super AMOLED', 'superamoled'),
(12, 13, 1, '1.1\"', '11'),
(12, 12, 3, 'Super AMOLED', 'superamoled'),
(12, 13, 3, '1.1\"', '11'),
(12, 12, 2, 'Super AMOLED', 'superamoled'),
(12, 13, 2, '1.1\"', '11'),
(33, 15, 2, '2716 mAh', '2716mah'),
(33, 17, 2, 'Nano-SIM', 'nanosim'),
(33, 12, 3, 'OLED', 'oled'),
(33, 13, 3, '5.8\"', '58'),
(33, 14, 3, 'Li-Ion', 'liion'),
(33, 15, 3, '2716 мА·ч', '2716mach'),
(33, 17, 3, 'Nano-SIM', 'nanosim'),
(33, 13, 1, '5.8\"', '58'),
(33, 14, 1, 'Li-Ion', 'liion'),
(33, 15, 1, '2716 мА·ч', '2716mach'),
(33, 17, 1, 'Nano-SIM', 'nanosim'),
(32, 13, 3, '5.5\"', '55'),
(32, 14, 3, 'Li-Ion', 'liion'),
(32, 15, 3, '3000 мА·ч', '3000mach'),
(32, 17, 3, 'Nano-SIM', 'nanosim'),
(32, 13, 1, '5.5\"', '55'),
(32, 14, 1, 'Li-Ion', 'liion'),
(32, 15, 1, '3000 мА·ч', '3000mach'),
(32, 17, 1, 'Nano-SIM', 'nanosim'),
(29, 14, 3, 'Li-Polymer', 'lipolymer'),
(29, 15, 3, '3700 мА·ч', '3700mach'),
(29, 16, 3, '2 SIM', '2sim'),
(29, 17, 3, 'Nano-SIM', 'nanosim'),
(29, 15, 1, '3700 мА·ч', '3700mach'),
(29, 16, 1, '2 SIM', '2sim'),
(29, 17, 1, 'Nano-SIM', 'nanosim');

-- --------------------------------------------------------

--
-- Table structure for table `t_orders`
--

DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` bigint(20) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  `payment_date` datetime NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` float(14,2) NOT NULL,
  `separate_delivery` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_orders`
--

INSERT INTO `t_orders` (`id`, `delivery_id`, `delivery_price`, `payment_method_id`, `paid`, `payment_date`, `closed`, `date`, `user_id`, `name`, `address`, `phone`, `email`, `comment`, `status`, `url`, `payment_details`, `ip`, `total_price`, `note`, `discount`, `coupon_discount`, `coupon_code`, `weight`, `separate_delivery`, `modified`, `lang_id`) VALUES
(1, 1, '0.00', 3, 0, '0000-00-00 00:00:00', 1, '2021-09-10 21:17:52', 0, 'Liam Payne', '', '', 'mail@site.com', '', 1, '38e5d32630b318737c03eb544deddbd5', '', '', '1309.42', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:16', 2),
(2, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-09-15 15:19:59', 0, 'Charlotte', '', '', 'charlotte@site.com', '', 2, '94670643965fcf1f5f8ae4604f073f10', '', '', '750.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:39:51', 2),
(3, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-09-16 16:24:02', 0, 'Noah', '', '545-65-34', 'ai@mail.ru', '', 1, 'fa1b494a7004358b4987c29f9cd8a7fe', '', '', '795.15', '', '5.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:09', 2),
(4, 1, '0.00', 4, 1, '0000-00-00 00:00:00', 1, '2021-09-12 08:32:55', 0, 'John Smith', ' 633 W College Ave, York, PA ; 906 E Market St, York, PA ; 561 Linden Ave, York, PA ', '207-767-0718', 'johnsmith@site.com', '', 2, 'da6e81cd23b0e9a3e66913adfa1cbaf0', '', '', '1296.87', '', '10.00', '0.00', '', 0.00, 0, '2022-04-18 14:46:11', 2),
(5, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-09-13 21:35:43', 0, 'Taras Melnik', 'Kyiv, Budivelnykiv str. 3', '333-23-23', 'mmkzz78@google.com', '', 0, '35e6c462f2f349dea6941fb2350cf32e', '', '', '1253.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:43:50', 3),
(6, 1, '0.00', 2, 1, '0000-00-00 00:00:00', 0, '2021-09-20 21:47:16', 0, 'Shevchenko Vitaly', 'Kharkiv, st. Bukova 34', '123456789', 'socolvzz34@gmail.com', '', 3, '37c6c99e6ee164d64a4fa76b78fef632', '', '', '1692.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-20 19:46:32', 3),
(7, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-09-10 12:48:21', 0, 'Oliver', '', '', 'mail123@site.com', '', 1, 'fa96fccd519a211023a6402471aa02d2', '', '', '1953.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:00', 2),
(8, 0, '0.00', 3, 1, '0000-00-00 00:00:00', 1, '2021-09-10 21:51:23', 0, 'Sophia', '', '', 'sophiamail@site.com', '', 2, 'c3146961b7460c4d25a0bd35c993bad7', '', '', '98.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:24', 2),
(9, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-09-10 21:53:36', 0, 'Alex', '', '', 'alex@site.com', '', 3, 'f46d90f4284abb451e2492ff23eccfeb', '', '', '279.99', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:49', 2),
(10, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-09-20 21:58:41', 0, 'Sebastian', '', '', 'Seb888@site.com', '', 0, '9bdb3edb7928ba2acb14f1b5f7d903aa', '', '', '1061.68', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:40:07', 2),
(11, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-09-20 22:00:51', 0, 'Samuel', '', '', 'samuel@site.com', '', 3, '53b5383e5ce0c5ee35899ba629dff4e4', '', '', '2194.14', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:47:41', 2),
(12, 2, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-09-20 22:02:41', 0, 'Amelia', '', '+1(888)888-88-88', 'amelia7899@site.com', '', 1, 'c1de5e6970cdcda6aa218817618cf5d9', '', '', '470.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:46:53', 2),
(13, 1, '0.00', 5, 0, '0000-00-00 00:00:00', 0, '2021-09-18 14:04:15', 0, 'Christian', '', '', 'me@example.com', '', 0, '42bc4be54c0ce1a8fdcf1e2e769a16d0', '', '', '417.00', '', '0.00', '0.00', '', 0.00, 0, '2022-04-19 14:39:58', 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_orders_labels`
--

DROP TABLE IF EXISTS `t_orders_labels`;
CREATE TABLE `t_orders_labels` (
  `order_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_orders_labels`
--

INSERT INTO `t_orders_labels` (`order_id`, `label_id`) VALUES
(3, 1),
(5, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(10, 2),
(11, 1),
(12, 1),
(13, 1),
(13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_pages`
--

DROP TABLE IF EXISTS `t_pages`;
CREATE TABLE `t_pages` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_pages`
--

INSERT INTO `t_pages` (`id`, `parent_id`, `url`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `menu_id`, `position`, `visible`, `header`, `last_modified`) VALUES
(1, 0, '', 'Home', 'Home', 'This store is a demonstration of the script for the online store Turbo CMS. All materials on this site are for demonstration purposes only.', 'Home', '<p>This store is a demonstration of the script for the online store <a href=\"https://turbo-cms.com/\"> Turbo </a>. All materials on this site are for demonstration purposes only.</p>', 2, 1, 1, 'Home', '2022-04-20 16:00:31'),
(2, 0, 'all-products', 'All products', 'All products', 'All products', 'All products', '', 2, 2, 1, 'All products', '2022-04-20 15:59:39'),
(3, 0, '404', '404', 'Page not found', 'Page not found', 'Page not found', '<p>Page not found</p>', 2, 3, 1, 'Page not found', '2022-04-20 15:59:08'),
(4, 0, 'sitemap', 'Sitemap', 'Sitemap', 'Sitemap', 'Sitemap', '', 2, 18, 1, 'Sitemap', '2022-04-20 16:00:40'),
(5, 0, 'new', 'New', 'New', 'New', 'New', '', 2, 5, 1, 'New', '2022-04-20 15:58:20'),
(6, 0, 'featured', 'Featured', 'Featured', 'Featured', 'Featured', '', 2, 6, 1, 'Featured', '2022-04-20 15:58:02'),
(7, 0, 'sale', 'Sale', 'Sale', 'Sale', 'Sale', '', 2, 7, 1, 'Sale', '2022-04-20 15:57:40'),
(8, 0, 'hit', 'Hit', 'Hit', 'Hit', 'Hit', '', 2, 8, 1, 'Hit', '2022-04-20 15:57:18'),
(9, 0, 'wishlist', 'Wishlist', 'Wishlist', 'Wishlist', 'Wishlist', '', 2, 9, 1, 'Wishlist', '2022-04-20 15:56:52'),
(10, 0, 'compare', 'Compare', 'Compare', 'Compare', 'Compare', '', 2, 10, 1, 'Compare', '2022-04-20 15:56:30'),
(11, 0, 'payments', 'Payment', 'Payment', 'Payment\r\n', 'Payment', '<h2>Cash</h2>\r\n<p>You can pay the courier directly in rubles at the time of delivery. The Express delivery within New York next day after order acceptance.</p>\r\n<h2>PayPal</h2>\r\n<p>Make purchases&nbsp;safely,&nbsp;without disclosing information&nbsp;about your credit card.&nbsp;PayPal&nbsp;will protect&nbsp;you if&nbsp;problems occur&nbsp;with purchase.</p>', 1, 11, 1, 'Payment', '2022-04-20 15:50:08'),
(12, 0, 'delivery', 'Delivery', 'Delivery', 'Delivery', 'Delivery', '<h2>Shipping within New York</h2>\r\n<p>Courier delivery is made&nbsp;the next day&nbsp;after ordering,&nbsp;if the item is in stock.&nbsp;Courier delivery is made&nbsp;within the New York&nbsp;daily from&nbsp;10.00 to&nbsp;21.00.&nbsp;For orders&nbsp;more than $300 delivered free of charge.<br /><br />Cost&nbsp;free delivery is calculated&nbsp;from&nbsp;the total order&nbsp;with&nbsp;the discount&nbsp;taken into account.&nbsp;If the order amount&nbsp;after applying the discount&nbsp;less than $300,&nbsp;is&nbsp;a paid service.</p>\r\n<p>For orders&nbsp;less than $300,&nbsp;the&nbsp;delivery&nbsp;cost is $50.</p>\r\n<h2>Store pickup</h2>\r\n<p>Convenient, free&nbsp;and&nbsp;fast way of receiving your order.</p>\r\n<p>Office address:&nbsp;41 West 40th Street New York, NY</p>\r\n<h2>C.O.D (Cash On Delivery)</h2>\r\n<p>On delivery order cash on delivery through \"mail of USA\", you will be able to pay for the order at the time goods are received.</p>', 1, 12, 1, 'Delivery', '2022-04-20 15:54:50'),
(13, 0, 'blog', 'Blog', 'Blog', '', 'Blog', '', 1, 25, 1, 'Blog', '2022-04-20 16:00:55'),
(14, 0, 'contact', 'Contacts', 'Contacts', 'Contacts', 'Contacts', '<p>41 West 40th Street New York, NY</p>\r\n<p>Phone: (210) 876-5432</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4399.518506840664!2d-73.97964170435294!3d40.75394620817656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259aa94a61b4f%3A0x8ebce7fe1262c134!2zNDEgVyA0MHRoIFN0LCBOZXcgWW9yaywgTlkgMTAwMTgsINCh0KjQkA!5e0!3m2!1sru!2sua!4v1609512981791!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 1, 26, 1, 'Contacts', '2022-04-20 16:01:02'),
(15, 0, 'brands', 'Brands', 'Brands', '', 'Brands', '', 3, 13, 1, 'Brands', '2022-04-20 16:01:15'),
(16, 0, 'articles', 'Articles', 'Articles', '', 'Articles', '', 3, 15, 1, 'Articles', '2022-04-20 16:01:21'),
(17, 0, 'catalog', 'Catalog', 'Catalog', '', 'Catalog', '', 3, 4, 1, 'Catalog', '2022-04-20 16:01:10'),
(18, 0, 'search', 'Search', 'Search', '', 'Search', '', 3, 16, 1, 'Search', '2022-04-20 16:01:27'),
(22, 0, 'catalog/smartphones/operatingsystem-ios', 'IOS smartphones', 'IOS smartphones', 'Smartphones operating system: IOS', 'IOS smartphones', '<p>Smartphones operating system: ios</p>', 4, 23, 1, 'IOS smartphones', '2022-04-20 16:01:49'),
(23, 0, 'catalog/smartphones/operatingsystem-android', 'Android smartphones', 'Android smartphones', 'Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.', 'Android smartphones', '<p>Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.</p>\r\n<p>Buying an Android smartphone is also an excellent solution for those who want to quickly receive up-to-date updates and use all the features provided by the OS. Many well-known manufacturers, competing with each other, offer customers new models of Android phones in any price range</p>', 4, 24, 1, 'Android smartphones', '2022-04-20 16:01:55'),
(21, 0, 'catalog/smartphones/brand-samsung', 'Samsung smartphones ', 'Samsung smartphones ', 'Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.', 'Samsung smartphones ', '<p>Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.</p>', 4, 22, 1, 'Samsung smartphones ', '2022-04-20 16:01:44'),
(24, 0, 'catalog/smartphones/brand-apple', 'Apple smartphones', 'Apple smartphones', 'Apple smartphones are presented in a wide range', 'Apple smartphones', '<p>Apple smartphones are presented in a wide range</p>', 4, 21, 1, 'Apple smartphones', '2022-04-20 16:01:38'),
(25, 0, 'faq', 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 3, 17, 1, 'FAQ', '2022-04-20 16:01:32'),
(26, 0, 'reviews', 'Reviews', 'Reviews', 'Reviews', 'Reviews', '', 1, 14, 1, 'Reviews', '2022-04-20 16:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `t_payment_methods`
--

DROP TABLE IF EXISTS `t_payment_methods`;
CREATE TABLE `t_payment_methods` (
  `id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` float NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_payment_methods`
--

INSERT INTO `t_payment_methods` (`id`, `module`, `name`, `description`, `currency_id`, `settings`, `enabled`, `position`) VALUES
(2, 'Liqpay', 'Liqpay', '<p>LiqPay is a payment system that allows you to pay with MasterCard and VISA credit cards, as well as in cash through Privatbank self-service terminals. Payment is possible after entering the account through a mobile phone number.</p>', 1, 'a:2:{s:17:\"liqpay_public_key\";s:0:\"\";s:18:\"liqpay_private_key\";s:0:\"\";}', 1, 3),
(3, 'null', 'Cash payment to courier', '<p>If you do not want to pre-pay the order, you have the opportunity to pay the courier in cash at the time of receipt of the parcel. To make the process as comfortable as possible for both you and the courier, we recommend that you prepare the required amount in advance.</p>', 1, 'N;', 1, 2),
(4, 'Paypal', 'PayPal', '<p>PayPal is a global e-commerce business allowing payments and money transfers to be made through the Internet. Online money transfers serve as electronic alternatives to paying with traditional paper methods, such as checks and money orders.</p>', 1, 'a:2:{s:8:\"business\";s:0:\"\";s:4:\"mode\";s:4:\"real\";}', 1, 4),
(5, 'WayForPay', 'WayForPay', '<p>WayForPay is an online service with payment through bank cards of VISA and MasterCard payment systems. Available payment methods: Privat 24, terminal, the service serves the acceptance of payments through the Bitcoin system.</p>', 1, 'a:3:{s:18:\"wayforpay_merchant\";s:0:\"\";s:19:\"wayforpay_secretkey\";s:0:\"\";s:18:\"wayforpay_language\";s:2:\"EN\";}', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `t_products`
--

DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `brand_id` int(11) DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `annotation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` float(3,1) NOT NULL DEFAULT '0.0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `is_hit` tinyint(1) DEFAULT '0',
  `to_export` tinyint(1) DEFAULT '0',
  `external_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_to` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_products`
--

INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_export`, `external_id`, `sale_to`, `last_modified`) VALUES
(1, 'apple-ipad-mini', 1, 'Apple iPad mini', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">7.9\" Retina display with True Tone technology.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">And Apple Pencil support to make it even easier for you to follow inspiration.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">It\'s still the same iPad mini, but now it can do more.</span></span></p>', '<p><strong>REALLY BIG</strong>&nbsp;<br><br>The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.&nbsp;<br><br><strong>COMPACT. PORTABLE. POCKET-ABLE</strong>&nbsp;<br><br>The iPad mini is incredibly compact and lightweight, making it easy to keep you company wherever you go. It weighs less than 400g and is 6.1mm thick and fits perfectly in a pocket or bag. It is very comfortable to hold in your hand and can be quickly pulled out of your pocket when inspiration calls for it.&nbsp;<br><br><strong>PERFORMANCE GOES BEYOND SIZE</strong>&nbsp;<br><br>The power and intelligence of iPad mini comes from the A12 Bionic Processor with Neural Engine. Using machine learning technologies, the processor quickly recognizes patterns, suggests options, and learns from experience. Work in Adobe Photoshop CC, augmented reality, immersive games with console-level graphics - there\'s enough power for everything.&nbsp;<br><br><strong>It\'s NOT THE DISPLAY SIZE, IT\'S THE PIXEL QUALITY</strong>&nbsp; <br><br>iPad mini has a stunning 7.9-inch display with over 3 million pixels. And Apple made the most of each. High brightness, wide color gamut, and anti-reflective coating make iPad mini perfect for any environment. Whether you\'re reading a book in the park or editing a video at home, images and text will always look as clear and natural as possible. And True Tone technology automatically adjusts white balance based on lighting, so colors look even more natural.&nbsp;<br><br><strong>STAY CONNECTED. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad mini let you capture amazing photos and videos. And that\'s not all. You can FaceTime with friends, scan documents, make notes on them, or even plan furniture rearrangements using AR (augmented reality) technology.&nbsp;<br><br><strong>APPLE PENCIL. FIT GREAT</strong>&nbsp;<br><br>Apple Pencil (sold separately) brings a million new possibilities to iPad. With it, iPad mini will turn into an incredibly convenient digital notebook. Take handwritten notes, fill out forms, and sign documents. Or get creative and sketch and draw on the go.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF YOUR IPAD</strong>&nbsp;<br><br>With iOS, the compact iPad mini lets you do the things you want iPad to do. Use multiple applications at the same time, move files with simple multi-touch gestures, open your favorite applications from the Dock. And with the Files app, all your content is always at your fingertips.&nbsp;<br><br><strong>A MILLION POSSIBILITIES IN ONE IPAD MINI</strong>&nbsp;<br><br>On iPad mini installed excellent Apple applications for everyday tasks - Photos, Maps, Messages, Mail, Safari and others. And there are over a million more iPad apps available in the App Store, making it easy to find the ones you need. Edit videos, socialize, sketch or immerse yourself in exciting online games.&nbsp;<br><br><strong>YOUR DATA BELONG TO YOU ONLY</strong>&nbsp;<br><br>How and all Apple products, iPad mini has been designed with strict privacy guidelines in mind. Touch ID is a simple and secure authentication system for iPad mini. And with Apple Pay, you can pay for purchases quickly and securely. Just touch the Touch ID sensor and you\'re done.&nbsp;</p>', 4.5, 4, 1, 1, 'Apple iPad mini', 'Apple iPad mini, Apple, Tablets', 'JUST AS BIG The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-08 00:18:26'),
(2, 'samsung-galaxy-tab', 2, 'Samsung Galaxy Tab', '<p>Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for entertainment and multitasking.</p>', '<p><strong>MULTITASKING WITHOUT LIMITS</strong>&nbsp;<br><br>Designed with your busy lifestyle and need to constantly work on the go, the new Samsung Galaxy Tab S4 is your ultimate entertainment and entertainment companion. multitasking.&nbsp;<br><br><strong>SAMSUNG DEX TO MAKE YOUR WORK PRODUCTIVE</strong>&nbsp;<br><br>Samsung DeX is now compatible with the Samsung Galaxy Tab for the first time S4. Now the high productivity of work on the PC has become available on the tablet. Multitasking is available via an HDMI adapter without the need for a Samsung DeX dock or DeX pad, and you can add a keyboard, mouse or monitor for greater efficiency.&nbsp;<br><br><strong>READY TO WORK</strong>&amp;nbsp ;<br><br>Everything is at hand for the working mode. The desktop on the screen of the Galaxy Tab S4 tablet is implemented as on a regular PC, i.e. with a taskbar, multi-window support and file drag and drop functionality. If you want to have a familiar desktop on your screen, just launch Samsung DeX from the Quick Access Toolbar and add an Android compatible keyboard and mouse.&nbsp;<br><br><strong>WORK MORE EFFICIENTLY</strong>&nbsp;&lt; br /&gt;<br>The productivity of your work depends on how comfortable the working environment is. This is where using Samsung DeX with an external monitor can help. On a large monitor screen, you can continue to use the Android interface of your tablet. Or look at the monitor and use the tablet as a touchpad, pad with S Pen or touch keyboard.&nbsp;<br><br><strong>IT IS NOT OFF - IT IS IN STANDBY MODE</strong>&nbsp;<br><br>If you have a new idea, capture it on the tablet screen so you don\'t forget. With the Galaxy Tab S4\'s off-screen note-taking feature, you can quickly jot down your thoughts even on a black screen with the versatile S Pen. The thinnest 0.7mm rubber tip lets you easily and accurately take notes and sketch.&nbsp;<br><br><strong>IMPROVED PERFORMANCE</strong>&nbsp;<br><br>Speed Samsung Galaxy Tab S4\'s LTE data transfer rate is up to 1Gbps, so you\'ll have plenty of time to do other things. And with 64GB of onboard storage, expandable up to 400GB with a microSD card slot, you\'ll have plenty of room to store your documents and videos.&nbsp;<br><br><strong>DIVE DOWN ENTERTAINMENT ATMOSPHERE</strong>&nbsp;<br><br>Despite its compact size, the Galaxy Tab S4 has a large visual workspace. Thanks to the narrowest possible frame and the absence of the Samsung logo and the Home button, the screen diagonal is actually 10.5 inches. And the enhanced 16:10 aspect ratio of the sAMOLED screen creates a more immersive viewing experience for your favorite content.&nbsp;<br><br><strong>SURROUND YOURSELF WITH HIGH QUALITY SOUND</strong>&nbsp;<br><br>Four speakers, tuned by the world famous AKG company, provide sound like in real life. Now you can experiment with the adaptive audio feature created by the experts at AKG. And Dolby Atmos delivers immersive 3D sound for a lifelike experience.&nbsp;<br><br><strong>WATCH VIDEOS WITHOUT TIME</strong>&nbsp;<br>&lt; br /&gt;Galaxy Tab S4 is equipped with a 7300 mAh battery that allows you to watch videos up to 16 hours, so you can watch your favorite movies or series without thinking about the time. And if the battery runs out, you can fully charge it in just 200 minutes thanks to the quick charge function.&nbsp;<br><br><strong>USEFUL EVEN IN STANDBY MODE</strong>&nbsp;<br>&lt; br /&gt;In sleep mode, the Galaxy Tab S4 turns into a smart home display. If the tablet is charging or \"sleeping\", then using the Daily Board function, you can set the display mode for your favorite photos on the screen. In addition, the tablet can be a useful assistant and display on the screen not only the current weather forecast, but also the date and time, acting as a calendar.&nbsp;<br><br><strong>UNLOCKING WITH THE HELP OF THE IRIS</strong> &nbsp;<br><br>In addition to face recognition, the Galaxy Tab S4 now supports iris scanning. To unlock your tablet, just scan your face or iris. Built-in encryption and a secure folder, combined with bio-identification functions, will ensure the safety of your files and applications.&nbsp;<br><br><strong>MULTIPLE SECURITY SYSTEM</strong>&nbsp;<br><br>Keep your data is secure. The Samsung Knox security platform is activated from the moment you turn on your tablet. Multi-layered real-time security puts your data in a secure folder that only you have access to. Keep your work and personal data separate.&nbsp;</p>', 0.0, 0, 1, 2, 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Tablets', 'MULTITASKING WITHOUT LIMITS Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for multitasking and entertainment.', '2020-12-31 03:55:00', NULL, 1, 0, 0, '', NULL, '2022-08-10 00:08:07'),
(3, 'apple-ipad-air', 1, 'Apple iPad Air', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">iPad Air gives you access to the most advanced Apple designs.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">A12 Bionic processor with Neural Engine.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">10.5\" Retina display with True Tone technology.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Support for Apple Pencil and Smart Keyboard.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Plus, at just 6.1mm thin, iPad Air weighs less than 500g, so you can easily carry it with you wherever you go.</span></span></p>', '<p><strong>TO ALL THE LOVE OF POWERFUL TECHNOLOGY</strong>&nbsp;<br><br>iPad Air gives you access to Apple\'s most advanced designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g so you can easily carry it with you.&nbsp;<br><br><strong>EVERYTHING YOU NEED. NO WEIGHT</strong>&nbsp;<br><br>Despite the large 10.5-inch Retina display, iPad Air is very compact. It is great for solving a variety of tasks literally on the go. To do this, it is equipped with the most advanced wireless technology, as well as a battery that lasts up to 10 hours without recharging. That\'s almost a whole day.&nbsp;<br><br><strong>POWER ENOUGH FOR EVERYTHING, AT ONCE</strong>&nbsp;<br><br>The power and intelligence of iPad Air comes from the A12 Bionic processor with Neural Engine. The processor uses real-time machine learning technology to deliver incredible experiences for photography, gaming, augmented reality and more. You can edit videos, make impressive presentations, design 3D models, watch your favorite series online. And do it all at the same time.&nbsp;<br><br><strong>SUPER-FAST GRAPHICS FOR GAMES AND APPS</strong>&nbsp;<br><br>Stunning AR performance, incredible graphics experience , photorealistic graphics in 3D games - the 4-core graphics system of the A12 Bionic processor is behind it all.&nbsp;<br><br><strong>EVERYTHING IS DONE BEAUTIFUL</strong>&nbsp;<br><br>iPad Air features a 10.5-inch Retina display with wide color gamut. I want to look at this display endlessly. Photos, videos and games look alive and natural down to the smallest detail. And regardless of the environment, True Tone technology, increased brightness and anti-reflective coating help to ensure the highest quality image.&nbsp;<br><br><strong>TRUE TONE. EASY ON THE EYES IN ANY LIGHT</strong>&nbsp;<br><br>True Tone technology automatically adjusts white balance based on ambient light. Therefore, the image on the display looks more natural and comfortable for the eyes in any conditions - both during the evening reading and when you paint a sunny landscape in the open air.&nbsp;<br><br><strong>Keep in touch. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad Air let you capture stunning photos and 1080p HD video. And that\'s not all. You can communicate via FaceTime with several interlocutors, scan and immediately send documents. And even create your own worlds - iPad Air cameras work great with augmented reality technologies (augmented reality).&nbsp;<br><br><strong>PLAY, WORK AND BE CREATIVE IN Augmented Reality</strong>&nbsp;<br><br>When virtual objects and data become part of the real world, completely new horizons open up before you. With front and rear cameras, an A12 Bionic processor with Neural Engine, a large natural color display, and accurate motion tracking, iPad is the perfect device for living in augmented reality.&nbsp;<br><br><strong>SEND. DRAW. FOLLOW INSPIRATION</strong>&nbsp;<br><br>Apple Pencil (sold separately) captures hand movements with amazing precision and speed. It is comfortable to hold in your hand like a regular pencil. However, he can do much more. With Apple Pencil, your iPad Air can become a notepad or an artist\'s canvas - you have many options.&nbsp;<br><br><strong>TAKE NOTES. COMMENT ON DOCUMENTS AND SCREENSHOTS. AND MORE</strong>&nbsp;<br><br>Taking notes or jotting down ideas on iPad Air is as easy as writing on a piece of paper. You can mark up documents, add pictures to your notes, take screenshots, and add comments to them.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF IPAD</strong>&nbsp;<br><br>iOS is an advanced mobile operating system that lets you control your iPad Air with simple taps. Apple calls them gestures, and they give you full access to all of the iPad Air\'s large display and smart technologies. With the multitasking feature, you can use your favorite applications at the same time - just select them from the Dock. And files can be moved from one application to another and sorted in the Files app in any way you like.&nbsp;<br><br><strong>ALL YOUR FILES HAVE BEEN GONE</strong>&nbsp;<br><br>The Files app lets you work with content that can be stored on your iPad Air, iCloud Drive, or other cloud services such as Box and Dropbox. Either way, your files will always be available - easy and simple.&nbsp;<br><br><strong>YOUR IPAD MAKES YOUR INTEREST</strong>&nbsp;<br><br>The iPad Air comes with excellent</p>', 5.0, 3, 1, 3, 'Apple iPad Air', 'Apple iPad Air, Apple, Tablets', 'iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-10 22:47:58'),
(4, 'dji-mavic-air', 3, 'DJI Mavic Air', '<p>DJI Mavic Air is a new compact drone that is even smaller, faster, more reliable and more comfortable to fly.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Its main advantage is the expanded functionality of the camera, which can now create spherical panoramas, ideal for viewing with virtual reality glasses.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">In addition, several selfie video scenarios are available to the user - slow distance, orbiting, spiraling, a sharp rise and an imitation of a boomerang flight.</span></span></p>', 0.0, 0, 1, 4, 'DJI Mavic Air', 'DJI Mavic Air, DJI, Quadcopters', 'The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-07 22:33:30'),
(5, 'dji-mavic-pro-fly-more-combo', 3, 'DJI Mavic Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Mavic Pro Fly More Combo is a model of an unmanned aerial vehicle from a famous manufacturer.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">You can take it with you on trips, outdoor photo shoots, sports competitions and any other events.</span></span></p>', 4.0, 1, 1, 5, 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Quadcopters', 'Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-07 23:10:06'),
(6, 'dji-phantom-4-pro', 3, 'DJI Phantom 4 Pro', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">DJI Phantom 4 Pro is an upgraded model of the famous aircraft.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.</span></span></p>', '<p>Quadcopter&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps. Such characteristics allow you to create full-size burst photos at up to 14 frames per second, as well as record videos with C4K resolution (4096 x 2160) and a frame rate of up to 60 per second. The user only needs to select the appropriate memory card &ndash; its maximum volume reaches 128 GB.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Improved dynamic capabilities</strong>. Despite the upgrade of the technical part, the mass of the quadrocopter has not increased &ndash; this was facilitated by the use of a frame made of magnesium, aluminum and titanium. The device can spend up to 30 minutes in the air, rising to a height of up to 6 kilometers above sea level. The maximum horizontal flight speed is 20 m / s (72 km / h), and the rise &ndash; 6 m/s (21.6 km/h). An advanced dual-band radio control system allows the aircraft to exchange signals with the remote control at a distance of up to 7 km in the absence of obstacles.</li>\r\n<li><strong>Total security</strong>. The FlightAutonomy system received two new micro-cameras and two infrared sensors located on the sides. Thanks to this, the quadcopter can recognize obstacles even in low light and automatically correct the course to avoid a collision. This feature is useful for both beginners and professional videographers, who get the opportunity to focus on the shooting process.</li>\r\n<li><strong>Easy management</strong>. There is nothing superfluous on the standard remote &ndash; the aircraft can be controlled using two mini-joysticks and two buttons. All additional functions are activated using a proprietary mobile application. In the standard version, the remote control is equipped with a holder for a smartphone, and in the PLUS version &ndash; retractable screen with a very bright backlight (1000 cd/m2), allowing you to see all the details of the image even when exposed to direct sunlight.</li>\r\n<li><strong>Automatic Flight Programs</strong>. DRAW technology allows you to draw the course of a quadrocopter on the touch screen &ndash; the device will follow it at a constant altitude, allowing you to pay maximum attention to the precise aiming of the camera. In addition, the aircraft can simply be shown the end point to which it will reach, bypassing all obstacles. Videographers will especially benefit from the automatic tracking of a moving object and the release of the shutter when gestures are recognized.</li>\r\n</ul>\r\n</div>', 5.0, 2, 1, 6, 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Quadcopters', 'Quadcopter DJI Phantom 4 Pro – modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-08 00:22:26'),
(7, 'havit-g1-blackred', 4, 'Havit G1 Black/Red', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">You can play sports for even longer, and secure earbuds will provide you with maximum comfort.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">One charge of the earbuds is enough for 3.5 hours of active use.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Headphones are protected from sweat and water, which makes it possible to use the headphones even under extreme load conditions.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">And two acoustic heads will blow your workouts with a bang.</span></span></p>', 3.5, 2, 1, 7, 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Accessories', 'With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-10 00:00:20'),
(8, '1more-quad-driver', 8, '1MORE Quad Driver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</span></span></p>', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>\r\n<p>The frequency range is amazing - from 20 Hz to 40 kHz, headphone sensitivity is 99 dB at a resistance of 32 ohms. The remote control has 3 buttons (volume control, call reception) and a microphone with noise and interference suppression. The 3.5mm mini jack is shaped like an \"L\" to ensure durability, even when carried in your pocket with your smartphone all the time.</p>\r\n<p>The polymer braid of the wires is resistant to wear, abrasion and creases, inside the structure is reinforced by Kevlar threads. The set includes a stylish gift box, a hard case, a 6.3 mm adapter, an air adapter, and 8 pairs of interchangeable ear tips of various sizes. Designed for uncompromising music enjoyment, these headphones are the best choice for true music lovers.</p>', 5.0, 1, 1, 8, '1MORE Quad Driver', '1MORE Quad Driver, 1More, Accessories', 'The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-09 23:45:43'),
(9, 'jbl-flip-4-red', 5, 'JBL Flip 4 Red', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 9, 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-07 23:35:01'),
(10, 'jbl-flip-4-blue', 5, 'JBL Flip 4 Blue', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 10, 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-07 23:32:55'),
(11, 'jbl-flip-4-black', 5, 'JBL Flip 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Excellent acoustics has already received a number of awards.</span></span></p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 11, 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2022-08-10 01:47:03'),
(12, 'samsung-galaxy-watch-active-green', 2, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 3.0, 1, 1, 14, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-10 22:45:34'),
(13, 'apple-watch-4-black', 1, 'Apple Watch 4 Black', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 4.5, 2, 1, 15, 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-07 23:47:14'),
(14, 'apple-watch-4-silver', 1, 'Apple Watch 4 Silver', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 0.0, 0, 1, 16, 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-07 23:39:05'),
(15, 'apple-watch-4-white', 1, 'Apple Watch 4 White', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Introducing Apple Watch Series 4. A watch with a completely new design and new technologies.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</span></span></p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 4.5, 2, 1, 17, 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.', '2020-12-31 03:55:01', NULL, 1, 0, 0, '', NULL, '2022-08-07 23:43:24'),
(16, 'apple-airpods', 1, 'Apple AirPods', '<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>', '<h2>Sound magic</h2>\r\n<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>\r\n<h2>Why a headphone processor?</h2>\r\n<p>In the list of technical characteristics of Apple AirPods, we can see the W1 processor. Moreover, he answers in this model not only for the formation of a sound signal. Headphones know what you are doing at the moment: Whether you are using 1 or 2 headphones, talking or listening to music - the system will automatically adjust to the required mode, create sound isolation, pause the music and turn it on again.</p>\r\n<h2>Decent autonomy</h2>\r\n<p>But from a mobile gadget, you need not only a range of capabilities, but also the possibility of long-term work. Apple AirPods will be able to play music continuously for 5:00. Using the charging case will make you autonomous for a day. At the same time, 15 minutes of recharging will give you another 3:00 of music and communication!</p>', 4.0, 1, 1, 18, 'Apple AirPods', 'Apple AirPods, Apple, Accessories ', 'Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. ', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-09 23:32:33'),
(17, 'motorola-moto-g6', 6, 'Motorola Moto G6', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.</p>', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system. The company\'s devices are famous for their optimization and the almost complete absence of any add-ons. Motorola Moto G6 Plus is equipped with a 5.9-inch IPS screen that will give you hours of reading or video viewing pleasure thanks to its large diagonal, high resolution and excellent color reproduction. You can comfortably perform everyday tasks and even play any modern mobile games thanks to the Qualcomm Snapdragon 630 processor. In addition, the Motorola Moto G6 Plus has IPX7 water protection, and another nice bonus is the NFC module.</p>', 3.0, 1, 1, 19, 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Smartphones ', 'Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-10 00:34:29');
INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_export`, `external_id`, `sale_to`, `last_modified`) VALUES
(18, 'nokia-42-ds-3', 7, 'Nokia 4.2 DS 3', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">With the Google Assistant at your fingertips, the pace is picking up.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">You can ask questions, check your schedule, or even dim the lights.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">An assistant can do a lot.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">And the longer you use it, the better it works.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\" data-number-of-phrases=\"5\"><span class=\"Q4iAWc\">Less time on the phone - more time for the joys of life.</span></span></p>', '<p><strong>Life is easier just around the corner</strong></p>\r\n<p>When the Google Life Assistant is at hand, it picks up the pace. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>\r\n<p><strong>We increased the design requirements, and then brought it to perfection</strong></p>\r\n<p>Skill and sophistication - for every day. Thickness 8.4 mm. Quality 2.5D glass with rounded corners on front and back. Not a phone, but a real pleasure to hold in your hand. 5.71 inch HD+ screen with 19:9 aspect ratio A sheer pleasure not only to hold but also to look at. A battery that adapts to you and lasts a long time.</p>\r\n<p><strong>Moments you remember have never looked so spectacular</strong></p>\r\n<p>Share your emotions. With a dual rear camera and a wide-angle selfie camera, all smiles will be in the frame. Get creative with the latest features like bokeh mode and advanced photo editing.</p>\r\n<p><strong>Continuous improvement</strong></p>\r\n<p>Nokia 4.2 - Android One smartphone on pure Android 9 Pie without third-party programs. Nothing extra - plus free security updates once a month, don\'t slow down your phone.<br>Add artificial intelligence that will suggest the necessary functions of applications based on its experience and help you manage your screen time with Digital Wellbeing.&lt; /p&gt;</p>', 5.0, 1, 1, 20, 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Smartphones', 'With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-10 00:48:28'),
(19, 'samsung-galaxy-fold', 2, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera. Equipped with a very powerful battery for</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">4380 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course USB port For music lovers there is a 3.5 mm audio output.</span></span></p>', 5.0, 1, 1, 21, 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Smartphones', 'Samsung Galaxy Fold is a wonderful Android smartphone with Exynos 7904 1800Mhz octa-core processor, HD Super AMOLED Plus display with up to 16 million colors, 4.6\" diagonal and 13 Mpx camera.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-09 23:28:58'),
(20, 'samsung-galaxy-s10', 2, 'Samsung Galaxy S10', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 5.0, 1, 1, 22, 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Smartphones', 'Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. ', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-09 23:23:34'),
(21, 'samsung-galaxy-a30', 2, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A30 is a wonderful Android smartphone with Exynos 9610 1800Mhz octa-core processor, Super AMOLED display with up to 16 million colors, 6.4\" diagonal and 16 Mpx camera. Equipped with a very powerful 4000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 5.0, 1, 1, 23, 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Smartphones', 'Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.', '2020-12-31 03:55:01', NULL, 0, 1, 0, '', NULL, '2022-08-09 23:20:36'),
(22, 'samsung-galaxy-m30', 0, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 5000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 5.0, 1, 1, 24, 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Smartphones', 'Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.', '2020-12-31 03:55:01', NULL, 0, 1, 0, '', NULL, '2022-08-10 01:52:59'),
(23, 'samsung-galaxy-a50', 2, 'Samsung Galaxy A50', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p><span id=\"hscc\">Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</span></p>', 5.0, 3, 1, 25, 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.', '2020-12-31 03:55:01', 1, 1, 1, 1, '', NULL, '2022-08-10 21:38:22'),
(24, 'samsung-galaxy-a10', 2, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with a 6.2\" IPS LCD display with up to 16 million colors and a 13 Mpx camera. Equipped with a very powerful 3400 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 0.0, 0, 1, 26, 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Smartphones', 'Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-09 22:50:34'),
(25, 'samsung-galaxy-a20', 2, 'Samsung Galaxy A20', '<p>The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A20 is an excellent smartphone running on the Android platform with an 8-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 4000 mAh battery</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</span></span></p>', 5.0, 1, 1, 27, 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Smartphones', 'The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2022-08-09 22:35:18'),
(26, 'samsung-galaxy-a70', 2, 'Samsung Galaxy A70', '<p>The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.</p>', '<p><span id=\"hscc\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a Super AMOLED display with up to 16 million colors, with a diagonal of 6.7 \"and a 32 Mpx camera. Equipped with a very powerful 4500 mAh battery. For communication, it can offer:</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"2\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port, for music lovers there is a 3.5 mm audio output.</span></span></span></p>', 5.0, 1, 1, 28, 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Smartphones', 'The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 02:00:44'),
(27, 'samsung-galaxy-a40', 2, 'Samsung Galaxy A40', '<p>The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.</p>', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 5.9 \"and a 16 Mpx camera. Equipped with a very powerful 3100 mAh battery. For communication it can offer:</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port.For music lovers, there is a 3.5 mm audio output.It is also worth noting that it is equipped with a GPS receiver, which will allow you not to get lost in any</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\" data-number-of-phrases=\"3\"><span class=\"Q4iAWc\">place!</span></span></p>', 4.0, 1, 1, 29, 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Smartphones', 'The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2022-08-10 01:57:15'),
(28, 'samsung-galaxy-a2', 2, 'Samsung Galaxy A2', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A2 Core on the rear packs 5-megapixel camera. The rear camera setup has autofocus. It sports a 5-megapixel camera on the front for selfies.</p>\r\n<p>Samsung Galaxy A2 Core based on Android 9.0 Pie (Go edition) and packs 16GB of inbuilt storage that can be expanded via microSD card. The Samsung Galaxy A2 Core is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards.</p>\r\n<p>Connectivity options on the Samsung Galaxy A2 Core include Wi-Fi 802.11 b/g/n, GPS, Micro-USB, FM radio, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer.</p>\r\n<p><span id=\"hscc\">&nbsp;</span></p>', 0.0, 0, 1, 30, 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Mobile phones', 'Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 787', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 01:54:20'),
(29, 'samsung-galaxy-a80', 2, 'Samsung Galaxy A80', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A80 on the rear packs a 48-megapixel primary camera with an f/2.0 aperture and a second 8-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus.</p>\r\n<p>The Samsung Galaxy A80 runs One UI based on Android 9.0 Pie and packs 128GB of inbuilt storage. The Samsung Galaxy A80 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy A80 measures 165.20 x 76.50 x 9.30mm (height x width x thickness) . It was launched in Angel Gold, Ghost White, and Phantom Black colours. It bears a glass body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A80 include Wi-Fi 802.11 b/g/n, GPS, USB Type-C, 3G, and 4G (with support for Band 40 used by some LTE networks in India) with active 4G on both SIM cards. Sensors on the phone include accelerometer, ambient light sensor, proximity sensor, and fingerprint sensor. The Samsung Galaxy A80 supports face unlock.</p>', 4.5, 2, 1, 31, 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Mobile phones', 'Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 co', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2022-08-11 00:00:06'),
(30, 'samsung-galaxy-a20e', 2, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 4.5, 2, 1, 32, 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 01:58:43'),
(31, 'apple-iphone-7-jet-black', 1, 'Apple iPhone 7 Black', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.&nbsp;</p>', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery.</p>\r\n<p>As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture. The rear camera setup has phase detection autofocus. It sports a 7-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Apple iPhone 7 based on iOS 10 and packs 32GB of inbuilt storage. The Apple iPhone 7 is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Apple iPhone 7 measures 138.30 x 67.10 x 7.10mm (height x width x thickness) and weighs 138.00 grams. It was launched in Black, Gold, Jet Black, Matte Black, Red, Rose Gold, and Silver colours.</p>\r\n<p>Connectivity options on the Apple iPhone 7 include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v4.20, NFC, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.</p>', 5.0, 1, 1, 33, 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Mobile phones', 'Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 02:09:37'),
(32, 'samsung-galaxy-s7', 2, 'Samsung Galaxy S7', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside.&nbsp;&nbsp;</p>', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The camera is absolutely amazing, especially in low light. This is a pragmatic phone, compared to its sibling the Galaxy S7 Edge, and is better value for money if you don\'t want to show off. However, with competition at an all-time high, you can also get most of its features and functions for one third this price.</p>', 3.3, 3, 1, 35, 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Mobile phones', 'Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The came', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 23:59:53'),
(33, 'apple-iphone-x', 1, 'Apple iPhone X', '<p>Apple iPhone X is the epitome of the best innovative solutions. A completely new design with a reimagined control system.</p>', '<p>Apple iPhone X is the epitome of the best innovative solutions. Brand new design<br>with a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful internal 64-bit architecture. Dramatically improved the world\'s most popular mobile camera.<br>This is exactly how Apple sees its flagship smartphone in 2017.</p>', 4.5, 2, 1, 34, 'Apple iPhone X', 'Apple iPhone X, Apple, Mobile phones', 'Apple iPhone X is the epitome of the best innovative solutions. Brand new design\r\nwith a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body.', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2022-08-10 22:56:52'),
(34, 'samsung-galaxy-watch-active', 2, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 4.5, 2, 1, 13, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.', '2021-01-08 23:47:40', NULL, 0, 0, 0, '', NULL, '2022-08-10 22:44:48'),
(35, 'samsung-galaxy-watch', 2, 'Samsung Galaxy Watch', '<p>The Samsung Galaxy Watch combines the elegant design of a classic watch with cutting-edge technology from the world of smart gadgets.</p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.</span></li>\r\n<li><span class=\"a-list-item\">Go nonstop for days on a single charge. The wireless charger lets you power up without slowing down. (Average expected performance based on typical use. Results may vary.)</span></li>\r\n<li><span class=\"a-list-item\">Available in two sizes and three colors, the Galaxy Watch offers stylish watch faces so realistic they hardly look digital. Plus, choose from a collection of interchangeable bands.</span></li>\r\n<li><span class=\"a-list-item\">Pairs with both Android and iOS smartphones via Bluetooth connection.</span></li>\r\n<li><span class=\"a-list-item\">Included in box: Galaxy Watch, Additional Strap (Large and Small included), Wireless charging Dock, Travel Adaptor, Quick Start Guide, User Manual (Warranty: 1 Year Standard Parts and Labor)</span></li>\r\n</ul>', 5.0, 2, 1, 12, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.', '2021-01-08 23:53:01', NULL, 0, 0, 0, '', NULL, '2022-08-10 22:44:05'),
(39, 'apple-iphone-12', 1, 'Apple iPhone 12', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.4, 5, 1, 39, 'Apple iPhone 12', 'Apple iPhone 12, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', '2021-01-23 18:29:10', 1, 1, 1, 0, '', NULL, '2022-08-10 22:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `t_products_categories`
--

DROP TABLE IF EXISTS `t_products_categories`;
CREATE TABLE `t_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_products_categories`
--

INSERT INTO `t_products_categories` (`product_id`, `category_id`, `position`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 3, 0),
(5, 3, 0),
(6, 3, 0),
(7, 4, 0),
(8, 4, 0),
(9, 5, 0),
(10, 5, 0),
(11, 5, 0),
(12, 6, 0),
(13, 6, 0),
(14, 6, 0),
(15, 6, 0),
(16, 4, 0),
(17, 7, 0),
(18, 7, 0),
(19, 7, 0),
(20, 7, 0),
(21, 7, 0),
(22, 7, 0),
(23, 7, 0),
(24, 7, 0),
(25, 7, 0),
(26, 7, 0),
(27, 7, 0),
(28, 7, 0),
(29, 7, 0),
(30, 7, 0),
(31, 7, 0),
(32, 7, 0),
(33, 7, 0),
(34, 6, 0),
(35, 6, 0),
(39, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_products_videos`
--

DROP TABLE IF EXISTS `t_products_videos`;
CREATE TABLE `t_products_videos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_products_videos`
--

INSERT INTO `t_products_videos` (`id`, `product_id`, `position`, `link`) VALUES
(59, 23, 59, 'https://www.youtube.com/watch?v=IDreNPM6-wk'),
(62, 39, 62, 'https://www.youtube.com/watch?v=9GA4gqLeeIQ');

-- --------------------------------------------------------

--
-- Table structure for table `t_purchases`
--

DROP TABLE IF EXISTS `t_purchases`;
CREATE TABLE `t_purchases` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `variant_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_color` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_purchases`
--

INSERT INTO `t_purchases` (`id`, `order_id`, `product_id`, `variant_id`, `product_name`, `variant_name`, `variant_color`, `price`, `amount`, `sku`) VALUES
(1, 1, 39, 67, 'Apple iPhone 12', '256 GB', 'Black', '1309.42', 1, '675360'),
(2, 2, 23, NULL, 'Samsung Galaxy A50', '128 GB', 'Orange', '600.00', 1, '002'),
(3, 2, 10, 10, 'JBL Flip 4 Blue', '', '', '150.00', 1, ''),
(4, 3, 18, 18, 'Nokia 4.2 DS 3', '', '', '238.00', 1, ''),
(5, 3, 20, 20, 'Samsung Galaxy S10', '', '', '599.00', 1, ''),
(6, 4, 16, 16, 'Apple AirPods', '', '', '210.00', 1, ''),
(7, 4, 3, 3, 'Apple iPad Air', '', '', '279.99', 1, ''),
(8, 4, 15, 15, 'Apple Watch 4 White', '', '', '503.00', 1, ''),
(9, 4, 33, 36, 'Apple iPhone X', '', '', '447.98', 1, ''),
(10, 5, 19, 19, 'Samsung Galaxy Fold', '', '', '1253.00', 1, ''),
(11, 6, 5, 5, 'DJI Mavic Pro', '', '', '1692.00', 1, ''),
(12, 7, 6, 6, 'DJI Phantom 4 Pro', '', '', '1953.00', 1, ''),
(13, 8, 7, 7, 'Havit G1 Black/Red', '', '', '98.00', 1, ''),
(14, 9, 3, 3, 'Apple iPad Air', '', '', '279.99', 1, ''),
(15, 10, 39, 65, 'Apple iPhone 12', '64 GB', 'Black', '1061.68', 1, '675370'),
(16, 11, 39, 65, 'Apple iPhone 12', '64 GB', 'Black', '1061.68', 1, '675370'),
(17, 11, 39, 72, 'Apple iPhone 12', '128 GB', 'Red', '1132.46', 1, '675351'),
(18, 12, 14, 14, 'Apple Watch 4 Silver', '', '', '470.00', 1, ''),
(19, 13, 29, 32, 'Samsung Galaxy A80', '', '', '417.00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_related_products`
--

DROP TABLE IF EXISTS `t_related_products`;
CREATE TABLE `t_related_products` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_related_products`
--

INSERT INTO `t_related_products` (`product_id`, `related_id`, `position`) VALUES
(23, 29, 2),
(23, 27, 1),
(23, 26, 0),
(31, 33, 1),
(31, 31, 0),
(31, 13, 2),
(29, 26, 0),
(29, 23, 1),
(29, 27, 2),
(28, 30, 1),
(28, 24, 0),
(28, 21, 2),
(33, 31, 0),
(33, 1, 1),
(33, 13, 2),
(39, 31, 0),
(39, 33, 1),
(39, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_seo`
--

DROP TABLE IF EXISTS `t_seo`;
CREATE TABLE `t_seo` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_seo`
--

INSERT INTO `t_seo` (`setting_id`, `name`, `value`) VALUES
(1, 'am_url', 'www.example.com'),
(2, 'am_name', 'Интернет-магазин Turbo Shop'),
(3, 'am_phone', '(123) 456-78-90'),
(4, 'am_email', 'me@example.com'),
(5, 'category_meta_title', ''),
(6, 'category_brand_meta_title', ''),
(7, 'brand_meta_title', ''),
(8, 'product_meta_title', ''),
(9, 'page_meta_title', ''),
(10, 'post_meta_title', ''),
(11, 'category_article_meta_title', ''),
(12, 'article_meta_title', ''),
(13, 'category_meta_keywords', ''),
(14, 'category_brand_meta_keywords', ''),
(15, 'brand_meta_keywords', ''),
(16, 'product_meta_keywords', ''),
(17, 'page_meta_keywords', ''),
(18, 'post_meta_keywords', ''),
(19, 'category_article_meta_keywords', ''),
(20, 'article_meta_keywords', ''),
(21, 'category_meta_description', ''),
(22, 'category_brand_meta_description', ''),
(23, 'brand_meta_description', ''),
(24, 'product_meta_description', ''),
(25, 'page_meta_description', ''),
(26, 'post_meta_description', ''),
(27, 'category_article_meta_description', ''),
(28, 'article_meta_description', ''),
(29, 'seo_automation', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `t_seo_lang`
--

DROP TABLE IF EXISTS `t_seo_lang`;
CREATE TABLE `t_seo_lang` (
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_seo_lang`
--

INSERT INTO `t_seo_lang` (`name`, `lang_id`, `value`) VALUES
('am_email', 1, 'me@example.com'),
('am_name', 1, 'Интернет-магазин Turbo Shop'),
('am_phone', 1, '(123) 456-78-90'),
('am_url', 1, 'www.example.com'),
('article_meta_description', 1, ''),
('article_meta_keywords', 1, ''),
('article_meta_title', 1, ''),
('brand_meta_description', 1, ''),
('brand_meta_keywords', 1, ''),
('brand_meta_title', 1, ''),
('category_article_meta_description', 1, ''),
('category_article_meta_keywords', 1, ''),
('category_article_meta_title', 1, ''),
('category_brand_meta_description', 1, ''),
('category_brand_meta_keywords', 1, ''),
('category_brand_meta_title', 1, ''),
('category_meta_description', 1, ''),
('category_meta_keywords', 1, ''),
('category_meta_title', 1, ''),
('page_meta_description', 1, ''),
('page_meta_keywords', 1, ''),
('page_meta_title', 1, ''),
('post_meta_description', 1, ''),
('post_meta_keywords', 1, ''),
('post_meta_title', 1, ''),
('product_meta_description', 1, ''),
('product_meta_keywords', 1, ''),
('product_meta_title', 1, ''),
('am_email', 2, 'me@example.com'),
('am_name', 2, 'Online store Turbo Shop'),
('am_phone', 2, '(123) 456-78-90'),
('am_url', 2, 'www.example.com'),
('article_meta_description', 2, ''),
('article_meta_keywords', 2, ''),
('article_meta_title', 2, ''),
('brand_meta_description', 2, ''),
('brand_meta_keywords', 2, ''),
('brand_meta_title', 2, ''),
('category_article_meta_description', 2, ''),
('category_article_meta_keywords', 2, ''),
('category_article_meta_title', 2, ''),
('category_brand_meta_description', 2, ''),
('category_brand_meta_keywords', 2, ''),
('category_brand_meta_title', 2, ''),
('category_meta_description', 2, ''),
('category_meta_keywords', 2, ''),
('category_meta_title', 2, ''),
('page_meta_description', 2, ''),
('page_meta_keywords', 2, ''),
('page_meta_title', 2, ''),
('post_meta_description', 2, ''),
('post_meta_keywords', 2, ''),
('post_meta_title', 2, ''),
('product_meta_description', 2, ''),
('product_meta_keywords', 2, ''),
('product_meta_title', 2, ''),
('am_email', 3, 'me@example.com'),
('am_name', 3, 'Інтернет-магазин Turbo Shop'),
('am_phone', 3, '(123) 456-78-90'),
('am_url', 3, 'www.example.com'),
('article_meta_description', 3, ''),
('article_meta_keywords', 3, ''),
('article_meta_title', 3, ''),
('brand_meta_description', 3, ''),
('brand_meta_keywords', 3, ''),
('brand_meta_title', 3, ''),
('category_article_meta_description', 3, ''),
('category_article_meta_keywords', 3, ''),
('category_article_meta_title', 3, ''),
('category_brand_meta_description', 3, ''),
('category_brand_meta_keywords', 3, ''),
('category_brand_meta_title', 3, ''),
('category_meta_description', 3, ''),
('category_meta_keywords', 3, ''),
('category_meta_title', 3, ''),
('page_meta_description', 3, ''),
('page_meta_keywords', 3, ''),
('page_meta_title', 3, ''),
('post_meta_description', 3, ''),
('post_meta_keywords', 3, ''),
('post_meta_title', 3, ''),
('product_meta_description', 3, ''),
('product_meta_keywords', 3, ''),
('product_meta_title', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_settings`
--

DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE `t_settings` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_settings`
--

INSERT INTO `t_settings` (`setting_id`, `name`, `value`) VALUES
(1, 'theme', 'default'),
(2, 'date_format', 'd.m.Y'),
(3, 'admin_email', 'me@example.com'),
(4, 'site_work', 'on'),
(5, 'captcha_product', '1'),
(6, 'captcha_post', '1'),
(7, 'captcha_cart', '1'),
(8, 'captcha_article', '1'),
(9, 'captcha_register', '1'),
(10, 'captcha_feedback', '1'),
(11, 'captcha_callback', '1'),
(12, 'captcha_fastorder', '1'),
(13, 'order_email', 'me@example.com'),
(14, 'comment_email', 'me@example.com'),
(15, 'notify_from_email', 'me@example.com'),
(16, 'email_lang', 'en'),
(17, 'decimals_point', '.'),
(18, 'thousands_separator', ' '),
(19, 'products_num', '9'),
(20, 'products_num_admin', '20'),
(21, 'max_order_amount', '50'),
(22, 'lang', 'en'),
(23, 'articles_num', '15'),
(24, 'articles_num_admin', '15'),
(25, 'blog_num', '15'),
(26, 'blog_num_admin', '15'),
(27, 'smart_resize', ''),
(28, 'webp_support', '1'),
(29, 'category_count', '1'),
(30, 'watermark_offset_x', '50'),
(31, 'watermark_offset_y', '50'),
(32, 'watermark_transparency', '50'),
(33, 'images_sharpen', '50'),
(34, 'export_export_not_in_stock', '1'),
(35, 'export_available_for_retail_store', '1'),
(36, 'export_available_for_reservation', '1'),
(37, 'export_short_description', ''),
(38, 'export_has_manufacturer_warranty', '1'),
(39, 'export_has_seller_warranty', '1'),
(40, 'export_no_export_without_price', '1'),
(41, 'export_sales_notes', ''),
(42, 'image_sizes', '55x55|110x110|90x90|240x240|570x570|800x800w|300x300|95x95|330x300|500x500|100x100|900x350|35x35|400x300|300x120|130x130|150x150|170x170|116x116|75x23|40x40|700x700|750x750|750x300|750x467|700x467|250x120|50x50|700x300|120x120|966x378|800x600|960x375|1024x768w|45x45|200x100|80x80|90x60|30x30|180x100|800x400|550x440|125x42|75x25'),
(43, 'comments_tree_blog', 'on'),
(44, 'comments_tree_articles', 'on'),
(45, 'lastModifyPosts', '2022-08-30 04:38:28'),
(46, 'chat_viber', '123456789'),
(47, 'chat_whats_app', '123456789'),
(48, 'chat_telegram', 'test'),
(49, 'chat_facebook', 'test'),
(50, 'features_num_admin', '25'),
(51, 'comments_tree_review', 'on'),
(52, 'captcha_review', '1'),
(53, 'comments_tree_reviews', 'on'),
(54, 'lastModifyFAQ', '2022-04-20 19:09:00'),
(56, 'lastModifyReviews', '2021-09-30 08:01:02'),
(58, 'comments_tree_products', 'on'),
(59, 'cached', '0'),
(60, 'cache_type', '0'),
(61, 'cache_time', '86400'),
(63, 'counters', ''),
(64, 'watermark_enable', '1'),
(65, 'tg_notify', ''),
(66, 'tg_token', ''),
(67, 'tg_apiurl', 'https://api.telegram.org/bot'),
(68, 'tg_channel', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_settings_lang`
--

DROP TABLE IF EXISTS `t_settings_lang`;
CREATE TABLE `t_settings_lang` (
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_settings_lang`
--

INSERT INTO `t_settings_lang` (`name`, `lang_id`, `value`) VALUES
('company_name', 1, 'Turbo CMS'),
('notify_from_name', 1, 'Администратор'),
('site_name', 1, 'Интернет-магазин Turbo Shop'),
('units', 1, 'шт'),
('weight_units', 1, 'г'),
('company_name', 2, 'Turbo CMS'),
('notify_from_name', 2, 'Admin'),
('site_name', 2, 'Online store Turbo Shop'),
('units', 2, 'pc'),
('weight_units', 2, 'g'),
('company_name', 3, 'Turbo CMS'),
('notify_from_name', 3, 'Адмін'),
('site_name', 3, 'Інтернет-магазин Turbo Shop'),
('units', 3, 'шт'),
('weight_units', 3, 'г');

-- --------------------------------------------------------

--
-- Table structure for table `t_subscribes`
--

DROP TABLE IF EXISTS `t_subscribes`;
CREATE TABLE `t_subscribes` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_translations`
--

DROP TABLE IF EXISTS `t_translations`;
CREATE TABLE `t_translations` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_ua` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_translations`
--

INSERT INTO `t_translations` (`id`, `label`, `lang_ru`, `lang_en`, `lang_ua`) VALUES
(39, 'callback', 'Заказать звонок', 'Request a call', 'Замовити дзвінок'),
(40, 'contact_details', 'Киев, ул. Глубочицкая, 32б', '41 West 40th Street New York, NY', 'Київ, вул. Глибочицька, 32б'),
(6, 'bloge', 'Блоге', 'entries', 'Блогу'),
(41, 'phone_number', '(903) 782-82-82', '(210) 876-5432', '(095) 545-54-54'),
(42, 'close', 'Закрыть', 'Close', 'Закрити'),
(43, 'catalog', 'Каталог', 'Catalog', 'Каталог'),
(9, 'aktsionnye_tovary', 'Акционные товары', 'Action goods', 'Акційні товари'),
(37, 'login', 'Вход', 'Login', 'Вхід'),
(22, 'votes', 'голосов', 'votes', 'голосів'),
(21, 'vote', 'голос', 'vote', 'голос'),
(38, 'logout', 'Выйти', 'Logout', 'Вихід'),
(16, 'add_cart', 'Купить', 'Add To Cart', 'Купити'),
(17, 'added_cart', 'В корзине', 'Added To Cart', 'В кошику'),
(18, 'more_details', 'Далее', 'More details', 'Далі'),
(19, 'not_available', 'Нет в наличии', 'Not available', 'Немає в наявності'),
(20, 'In_stock', 'В наличии', 'In stock', 'В наявності'),
(23, 'of_vote', 'голоса', 'vote', 'голоси'),
(24, 'add_to_wishlist', 'В избранное', 'Add to wishlist', 'У обране'),
(25, 'added_to_wishlist', 'В избранном', 'Added to wishlist', 'В обраному'),
(26, 'add_to_compare', 'В сравнение', 'Add to compare', 'До порівняння'),
(27, 'added_to_compare', 'В сравнении ', 'Added to compare', 'В порівнянні'),
(28, 'delete', 'Удалить', 'Delete', 'Видалити'),
(29, 'featured_products', 'Рекомендуемые товары', 'Featured products', 'Рекомендовані товари'),
(30, 'badge_new', 'Новинка', 'New', 'Новинка'),
(31, 'badge_hit', 'Хит', 'Hit', 'Хіт'),
(32, 'badge_sale', 'Акция', 'Sale', 'Акція'),
(33, 'new_arrivals', 'Новинки', 'New arrivals', 'Новинки'),
(34, 'sale', 'Акционные товары', 'Sale', 'Акційні товари'),
(35, 'index_cart', 'Корзина', 'Cart', 'Кошик'),
(36, 'registration', 'Регистрация', 'Registration', 'Реєстрація'),
(44, 'currency', 'Валюта', 'Currency', 'Валюта'),
(45, 'product_search', 'Поиск товара...', 'Product search...', 'Пошук товару...'),
(46, 'all_products', 'Все товары', 'All products', 'Усі товари'),
(47, 'all_brands', 'Все бренды', 'All Brands', 'Всі бренди'),
(48, 'viewed_products', 'Просмотренные товары', 'Viewed products', 'Переглянуті товари'),
(49, 'index_blog', 'Блог', 'Blog', 'Блог'),
(50, 'enter_your_email', 'Оставьте свой e-mail', 'Enter your Email', 'Залиште свій e-mail'),
(51, 'main_description', 'Этот магазин является демонстрацией скрипта интернет-магазина Turbo CMS. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.', 'This store is a demo of the script of the Turbo CMS online store. All materials on this site are present for demonstration purposes only.', 'Цей магазин є демонстрацією скрипта інтернет-магазину Turbo CMS. Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.'),
(53, 'about_shop', 'О магазине', 'About Shop', 'Про магазин'),
(54, 'information', 'Информация', 'Information', 'Інформація'),
(55, 'contacts', 'Контакты', 'Contacts', 'Контакти'),
(56, 'request_a_call', 'Заказать звонок', 'Request a call', 'Замовити дзвінок'),
(57, 'your_phone_number', 'Оставьте свой номер телефона', 'Leave your phone number', 'Залиште свій номер телефону'),
(58, 'enter_your_name', 'Введите имя', 'Enter your name', 'Введіть ім\'я'),
(59, 'enter_phone_number', 'Введите номер телефона', 'Enter your phone number', 'Введіть номер телефону'),
(60, 'captcha_incorrect', 'Неверно введена капча', 'Captcha entered incorrectly', 'Невірно введена капча'),
(61, 'enter_the_address', 'Введите адрес', 'Enter the address', 'Введіть адресу'),
(62, 'enter_captcha', 'Введите капчу', 'Enter captcha', 'Введіть капчу'),
(63, 'name', 'Имя', 'Name', 'Ім\'я'),
(64, 'enter_a_comment', 'Введите комментарий', 'Enter a comment', 'Введіть коментар'),
(80, 'buy_one_click', 'Купить в один клик', 'Buy in one click', 'Купити в один клік'),
(66, 'home', 'Главная', 'Home', 'Головна'),
(67, 'password', 'Пароль', 'Password', 'Пароль'),
(68, 'forgot_password', 'Забыли пароль?', 'Forgot your password', 'Забули пароль?'),
(69, 'enter_password', 'Введите пароль', 'Enter password', 'Введіть пароль'),
(70, 'phone', 'Телефон', 'Phone', 'Телефон'),
(71, 'address', 'Адрес', 'Address', 'Адреса'),
(72, 'email_already_registered', 'Пользователь с таким email уже зарегистрирован', 'User with this email is already registered', 'Користувач з таким email вже зареєстрований'),
(73, 'send', 'Отправить', 'Send', 'Надіслати'),
(74, 'short_description', 'Краткое описание', 'Short description', 'Короткий опис'),
(75, 'end_promotion', 'До конца акции осталось:', 'Until the end of the promotion is left:', 'До кінця акції залишилося:'),
(76, 'colour', 'Цвет', 'Colour', 'Колір'),
(77, 'size', 'Размер', 'Size', 'Розмір'),
(78, 'sku', 'Артикул', 'SKU', 'Артикул'),
(81, 'description', 'Описание', 'Description', 'Опис'),
(82, 'feature', 'Характиристики', 'Feature', 'Характеристики'),
(83, 'comments_global', 'Комментарии', 'Comments', 'Коментарі'),
(84, 'awaiting_moderation', 'ожидает модерации', 'awaiting moderation', 'очікує модерації'),
(85, 'comment_1', 'Комментарий', 'Comment', 'Коментар'),
(86, 'comment_on', 'Комментировать', 'Comment on', 'Коментувати'),
(87, 'no_comments', 'Пока нет комментариев', 'No comments', 'Поки немає коментарів'),
(88, 'related_products', 'Сопутствующие товары', 'Related products', 'Супутні товари'),
(89, 'email_order_title', 'Ваш заказ №', 'Your Order No.', 'Ваше замовлення №'),
(90, 'email_order_on_total', 'на сумму', 'for the amount', 'на суму'),
(92, 'badge_featured', 'Рекомендуем', 'featured', 'Рекомендуємо'),
(111, 'reply', 'Ответить', 'Reply', 'Відповісти'),
(96, 'files_global', 'Файлы', 'Files', 'Файли'),
(97, 'videos_global', 'Видео', 'Video', 'Відео'),
(98, 'wishlist_no_products', 'Список избранного пуст', 'Wishlist is empty', 'Список обраного порожній'),
(99, 'sort_by', 'Сортировать по', 'Sort by', 'Сортувати за'),
(100, 'default', 'Умолчанию', 'Default', 'Замовчуванням'),
(101, 'name_a_z', 'По имени от А до Я', 'By name from A to Z', 'На ім\'я від А до Я'),
(102, 'name_z_a', 'По имени от Я до А', 'By name from Z to A', 'На ім\'я від Я до А'),
(103, 'cheap_expensive', 'От дешевых к дорогим', 'Cheap to expensive', 'Від дешевих до дорогих'),
(104, 'expensive_cheap', 'От дорогих к дешевым', 'From expensive to cheap', 'Від дорогих до дешевих'),
(105, 'by_rating', 'По рейтингу', 'By rating', 'за рейтингом'),
(106, 'no_products_found', 'Товары не найдены', 'No products found', 'Товари не знайдені'),
(107, 'search', 'Поиск', 'Search', 'Пошук'),
(108, 'nothing_found', 'Ничего не найдено', 'Nothing found', 'Нічого не знайдено'),
(109, 'enter_search_query', 'Введите поисковый запрос', 'Enter your search term', 'Введіть пошуковий запит'),
(110, 'site_search', 'Поиск по сайту', 'Site search', 'Пошук по сайту'),
(112, 'at', 'в', 'at', 'в'),
(113, 'popular', 'Популярные', 'Popular', 'Популярні'),
(114, 'in_order', 'По порядку', 'In order', 'По порядку'),
(115, 'comment_2', 'Комментариев', 'Comments', 'Коментарів'),
(116, 'table_of_contents', 'Содержание', 'Table of Contents', 'Зміст'),
(117, 'already_voted', 'Вы уже голосовали!', 'You have already voted!', 'Ви вже голосували!'),
(118, 'vote_counted', 'Спасибо! Ваш голос учтен.', 'Thank you! Your vote has been counted.', 'Спасибі! Ваш голос враховано.'),
(119, 'message_sent', 'Сообщение отправлено', 'Message sent', 'Повідомлення відправлено'),
(120, 'success_subscribe', 'Вы были успешно подписаны', 'You have been successfully subscribed', 'Ви були успішно підписані'),
(121, 'already_subscribe', 'Вы уже подписаны', 'You are already subscribed', 'Ви вже підписані'),
(122, 'subscribe_to', 'Подписаться', 'Subscribe to', 'Підписатися'),
(123, 'search_article', 'Поиск статьи...', 'Search article...', 'Пошук статті...'),
(124, 'sitemap', 'Карта сайта', 'Sitemap', 'Карта сайту'),
(125, 'index_articles', 'Статьи', 'Articles', 'Статті'),
(126, 'index_products', 'Продукты', 'Products', 'Продукти'),
(127, 'sort_date', 'По дате', 'Date', 'За датою'),
(128, 'search_blog', 'Поиск в блоге...', 'Search blog...', 'Пошук в блозі...'),
(129, 'filter_by_price', 'Фильтр по цене', 'Filter by price', 'Фільтр по ціні'),
(130, 'apply', 'Применить', 'Apply', 'Застосувати'),
(131, 'reset', 'Сбросить', 'Reset', 'Скинути'),
(132, 'index_brands', 'Бренды', 'Brands', 'Бренди'),
(133, 'index_feedback', 'Обратная связь', 'Feedback', 'Зворотній зв\'язок'),
(134, 'feedback_message_sent', 'ваше сообщение отправлено.', 'your message has been sent.', 'ваше повідомлення відправлено.'),
(135, 'enter_your_message', 'Введите сообщение', 'Enter your message', 'Введіть повідомлення'),
(136, 'message', 'Сообщение', 'Message', 'Повідомлення'),
(137, 'password_reminder', 'Напоминание пароля', 'Password reminder', 'Нагадування пароля'),
(138, 'email_sent', 'Вам отправлено письмо', 'An email has been sent to you', 'Вам надіслано листа'),
(139, 'user_not_found', 'Пользователь не найден', 'User is not found', 'Користувач не знайдений'),
(140, 'password_recovery_email', 'отправлено письмо для восстановления пароля.', 'password recovery email has been sent.', 'відправлено лист для відновлення пароля.'),
(141, 'enter_email_registration', 'Введите email, который вы указывали при регистрации', 'Enter the email you provided during registration', 'Введіть email, який ви вказали при реєстрації'),
(142, 'wrong_login_password', 'Неверный логин или пароль', 'Wrong login or password', 'Невірний логін або пароль'),
(143, 'not_activated', 'Ваш аккаунт еще не активирован.', 'Your account has not been activated yet.', 'Ваш аккаунт ще не був активований.'),
(144, 'no_post_found', 'Записи не найдены', 'No post found', 'Публікації не знайдено'),
(145, 'your_discount', 'Ваша скидка', 'Your discount', 'Ваша знижка'),
(146, 'change_password', 'Изменить пароль', 'Change Password', 'Змінити пароль'),
(147, 'save', 'Сохранить', 'Save', 'Зберегти'),
(148, 'your_orders', 'Ваши заказы', 'Your orders', 'Ваші заказы'),
(149, 'index_order', 'Заказ №', 'Order №', 'Заказ №'),
(150, 'paid', 'оплачен', 'paid', 'оплачений'),
(151, 'waiting_processing', 'ждет обработки', 'waiting for processing', 'чекає обробки'),
(152, 'in_processing', 'в обработке', 'in processing', 'в обробці'),
(153, 'completed', 'выполнен', 'completed', 'виконаний'),
(154, 'site_closed', 'Сайт закрыт на техническое обслуживание', 'Site closed for maintenance', 'Сайт зараз закритий на технічне обслуговування'),
(155, 'apologize', 'Приносим извинения за неудобство, но в данный момент сайт находится на техническом обслуживание. Скоро мы вернемся online!', 'We apologize for the inconvenience, but the site is currently undergoing maintenance. We\'ll be back online soon!', 'Приносимо вибачення за незручність, але в даний момент сайт знаходиться на технічному обслуговуванні. Скоро ми повернемося online!'),
(156, 'forward', 'вперед', 'forward', 'вперед'),
(157, 'back', 'назад', 'back', 'назад'),
(158, 'all_at_once', 'все сразу', 'all at once', 'всі відразу'),
(159, 'order_page', 'Страница заказа', 'Order page', 'Сторінка замовлення'),
(160, 'accepted', 'принят', 'accepted', 'прийнятий'),
(161, 'general_name', 'Название', 'Name', 'Назва'),
(162, 'general_price', 'Цена', 'Price', 'Ціна'),
(163, 'number', 'Количество', 'Number', 'Кількість'),
(164, 'sum', 'Сумма', 'Sum', 'Сума'),
(165, 'discount', 'Скидка', 'Discount', 'Знижка'),
(166, 'coupon', 'Купон', 'Coupon', 'Купон'),
(167, 'total', 'Итого', 'Total', 'Разом'),
(168, 'choose_payment', 'Выбрать другой способ оплаты', 'Choose another payment method', 'Вибрати інший спосіб оплати'),
(169, 'payment_method', 'Способ оплаты', 'Payment method', 'Спосіб оплати'),
(170, 'select_payment_method', 'Выберите способ оплаты', 'Select a Payment Method', 'Оберіть спосіб оплати\r\n'),
(171, 'order_details', 'Детали заказа', 'Order details', 'Деталі замовлення'),
(172, 'order_date', 'Дата заказа', 'Order date', 'Дата замовлення'),
(173, 'delivery_address', 'Адрес доставки', 'Delivery address', 'Адреса доставки'),
(174, 'finish_the_order', 'Закончить заказ', 'Finish the order', 'Закінчити замовлення'),
(175, 'to_pay', 'К оплате', 'To pay', 'До оплати'),
(176, 'to_pay_small', 'к оплате', 'to pay', 'до оплати'),
(177, 'proceed_to_checkout', 'Перейти к оплате', 'Proceed to checkout', 'Перейти до оплати'),
(178, 'global_cart', 'Корзина', 'Cart', 'Кошик'),
(180, 'coupon_is_invalid', 'Купон недействителен', 'Coupon is invalid', 'Купон недійсний'),
(181, 'coupon_valid', 'действует для заказов от', 'valid for orders from', 'діє для замовлень від'),
(182, 'enter_coupon_code', 'Введите код купона...', 'Enter coupon code...', 'Введіть код купона...'),
(183, 'apply_coupon', 'Применить купон', 'Apply coupon', 'Застосувати купон'),
(184, 'select_delivery_method', 'Выберите способ доставки', 'Select delivery method', 'Виберіть спосіб доставки'),
(185, 'free', 'бесплатно', 'free', 'безкоштовно'),
(186, 'address_recipient', 'Адрес получателя', 'Address of the recipient', 'Адреса отримувача'),
(187, 'general_full_name', 'ФИО', 'Full name', 'ПІБ'),
(188, 'checkout', 'Оформить заказ', 'Checkout', 'Оформити замовлення\r\n'),
(189, 'cart_no_products', 'В корзине нет товаров', 'There are no products in the cart', 'У кошику немає товарів'),
(190, 'new_password', 'Новый пароль', 'New password', 'Новий пароль'),
(191, 'on_the_site', 'на сайте', 'on the site', 'на сайті'),
(192, 'email_password_reply', 'был сделан запрос на восстановление вашего пароля.', 'a request was made to recover your password.', 'був зроблений запит на відновлення вашого пароля.'),
(193, 'email_password_change', 'Вы можете изменить пароль, перейдя по следующей ссылке', 'You can change your password by following the link below', 'Ви можете змінити пароль, перейшовши за наступним посиланням'),
(194, 'email_password_text', 'Эта ссылка действует в течение нескольких минут. <br> Если это письмо пришло вам по ошибке, проигнорируйте его.', 'This link is effective for a few minutes. <br> If you received this error in error, ignore it.', 'Це посилання діє протягом декількох хвилин. <br>  Якщо цей лист прийшло вам помилково, ігноруйте його.'),
(226, 'email_order_status', 'Статус заказа', 'Order status', 'Статус замовлення'),
(196, 'not_paid', 'не оплачен', 'not paid', 'не сплачено'),
(197, 'canceled', 'отменен', 'canceled', 'скасований'),
(198, 'payment', 'Оплата', 'Payment', 'Оплата'),
(199, 'you_ordered', 'Вы заказали', 'You ordered', 'Ви замовили'),
(200, 'status', 'Статус', 'Status', 'Статус'),
(201, 'status_order_link', 'Вы всегда можете проверить состояние заказа по ссылке:', 'You can always check the status of your order by following the link:', 'Ви завжди можете перевірити стан замовлення за посиланням:'),
(202, 'compare', 'Сравнение', 'Compare', 'Порівняння'),
(203, 'compare_no_products', 'Нет товаров для сравнения', 'There are no products to compare', 'Немає товарів для порівняння'),
(204, 'no_brands_found', 'Бренды не найдены', 'No brands found', 'Бренди не знайдені'),
(205, 'no_articles_found', 'Статьи не найдены', 'No articles found', 'Статті не знайдені'),
(206, 'popular_categories', 'Популярные категории', 'Popular Categories', 'Популярні категорії'),
(207, 'bestsellers', 'Хиты продаж', 'Bestsellers', 'Хіти продажів'),
(208, 'empty_trash', 'Очистить корзину', 'Empty trash', 'Очистити кошик'),
(209, 'products_from_category', 'Товары той же категории', 'Products from category', 'Товари тієї ж категорії'),
(210, 'products_from_brand', 'Товары того же бренда', 'Products from brand', 'Товари того ж бренду'),
(211, 'see_all', 'Посмотреть все', 'See all', 'Переглянути всі'),
(212, 'captcha', 'Капча', 'Captcha', 'Капча'),
(214, 'fast_order', 'Быстрый заказ', 'Fast order', 'Швидке замовлення'),
(215, 'weight', 'Вес', 'Weight', 'Вага'),
(216, 'email_order_heading', 'Спасибо за ваш заказ', 'Thanks for your order', 'Дякуємо за ваше замовлення'),
(217, 'email_comment_hello', 'Здравствуйте,', 'Hello,', 'Вітаємо,'),
(218, 'email_order_message', 'Сообщаем вам, что вашему заказу', 'We inform you that your order', 'Повідомляємо вам, що ваше замовлення'),
(219, 'email_from', 'от', 'of', 'від'),
(220, 'email_order_text_status', 'присвоен статуc', 'assigned status', 'присвоєно статуc'),
(221, 'email_order_button', 'Перейти к заказу', 'Go to order', 'Перейти до замовлення'),
(222, 'email_order_number', 'Номер заказа', 'Order number', 'Номер замовлення'),
(223, 'general_payment', 'Оплата', 'Payment', 'Оплата'),
(224, 'password_remind_title', 'Восстановление пароля', 'Password recovery', 'Відновлення пароля'),
(225, 'option', 'Вариант', 'Option', 'Варіант'),
(227, 'contact_us', 'Связаться с нами', 'To contact us', 'Зв\'язатися з нами'),
(228, 'license_is_invalid', 'Лицензия недействительна', 'License is invalid', 'Ліцензія є недійсною'),
(230, 'reviews_global', 'Отзывы', 'Reviews', 'Відгуки'),
(231, 'voice', 'голос', 'voice', 'голос'),
(232, 'comment_3', 'Комментария', 'Comment', 'Коментаря'),
(233, 'heading', 'Рубрика', 'Heading', 'Рубрика'),
(234, 'comment', 'Комментарий', 'Comment', 'Коментар'),
(235, 'quick_view', 'Быстрый просмотр', 'Quick view', 'Швидкий перегляд'),
(236, 'general_all', 'Все', 'All', 'Всі'),
(237, 'next', 'Вперёд', 'Next', 'Вперед'),
(238, 'previous', 'Назад', 'Prev', 'Назад');

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`id`, `email`, `password`, `name`, `phone`, `address`, `group_id`, `enabled`, `last_ip`, `created`) VALUES
(1, 'me@example.com', '003ff6279857ddb9bb1ccf7a1c86f710', 'John Smith', '+1(234) 567-89-01', '', 1, 1, '127.0.0.1', '2021-01-24 00:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `t_variants`
--

DROP TABLE IF EXISTS `t_variants`;
CREATE TABLE `t_variants` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_ids` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(14,2) DEFAULT NULL,
  `weight` float(8,2) NOT NULL,
  `stock` mediumint(9) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `external_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_variants`
--

INSERT INTO `t_variants` (`id`, `product_id`, `sku`, `name`, `color`, `color_code`, `images_ids`, `price`, `compare_price`, `weight`, `stock`, `position`, `external_id`, `currency_id`) VALUES
(1, 1, '', '', '', '', '', '500.00', '0.00', 0.00, NULL, 1, '', 1),
(2, 2, '', '64 GB', '', '', '', '274.99', '349.99', 0.00, NULL, 2, '', 1),
(3, 3, '', '', '', '', '', '280.00', '400.00', 0.00, NULL, 3, '', 1),
(4, 4, '', '', '', '', '', '989.00', '0.00', 0.00, NULL, 4, '', 1),
(5, 5, '', '', '', '', '', '1692.00', '0.00', 0.00, NULL, 5, '', 1),
(6, 6, '', '', '', '', '', '1953.00', '0.00', 0.00, NULL, 6, '', 1),
(7, 7, '', '', '', '', '', '98.00', '0.00', 0.00, NULL, 7, '', 1),
(8, 8, '', '', '', '', '', '130.00', '0.00', 0.00, NULL, 8, '', 1),
(9, 9, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 9, '', 1),
(10, 10, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 10, '', 1),
(11, 11, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 11, '', 1),
(12, 12, '', '', '', '', '', '250.00', '0.00', 0.00, NULL, 12, '', 1),
(13, 13, '', '', '', '', '', '500.00', '0.00', 0.00, NULL, 13, '', 1),
(14, 14, '', '', '', '', '', '470.00', '0.00', 0.00, NULL, 14, '', 1),
(15, 15, '', '', '', '', '', '503.00', '0.00', 0.00, NULL, 15, '', 1),
(16, 16, '', '', '', '', '', '210.00', '0.00', 0.00, NULL, 16, '', 1),
(17, 17, '', '', '', '', '', '165.00', '0.00', 0.00, NULL, 17, '', 1),
(18, 18, '', '', '', '', '', '238.00', '0.00', 0.00, NULL, 18, '', 1),
(19, 19, '', '', '', '', '', '1253.00', '0.00', 0.00, NULL, 19, '', 1),
(20, 20, '', '', '', '', '', '599.00', '0.00', 0.00, NULL, 20, '', 1),
(21, 21, '', '32 GB', '', '', '', '223.00', '0.00', 0.00, NULL, 21, '', 1),
(22, 22, '', '', '', '', '', '254.00', '0.00', 0.00, NULL, 22, '', 1),
(23, 23, '001', '64 GB', 'Black', '#000000', '277,278', '400.00', '600.00', 0.00, NULL, 23, '', 1),
(24, 23, '003', '128 GB', 'Blue', '#337ab7', '277,279', '399.99', '449.99', 0.00, NULL, 25, '', 1),
(25, 23, '006', '256 GB', 'White', '#ffffff', '277,280', '499.99', '549.99', 0.00, NULL, 39, '', 1),
(26, 23, '005', '256 GB', 'Blue', '#337ab7', '277,279', '499.99', '549.99', 0.00, NULL, 26, '', 1),
(27, 24, '', '', '', '', '', '300.00', '0.00', 0.00, NULL, 27, '', 1),
(28, 25, '', '', '', '', '', '216.00', '0.00', 0.00, NULL, 28, '', 1),
(29, 26, '', '', '', '', '', '800.00', '0.00', 0.00, NULL, 29, '', 1),
(30, 27, '', '', '', '', '', '400.00', '0.00', 0.00, NULL, 30, '', 1),
(31, 28, '', '', '', '', '', '160.00', '0.00', 0.00, NULL, 31, '', 1),
(32, 29, '', '', '', '', '', '417.00', '0.00', 0.00, NULL, 32, '', 1),
(33, 30, '', '', '', '', '', '400.00', '0.00', 0.00, NULL, 33, '', 1),
(34, 31, '', '', '', '', '', '300.00', '0.00', 0.00, NULL, 34, '', 1),
(35, 32, '', '', '', '', '', '298.00', '0.00', 0.00, NULL, 35, '', 1),
(36, 33, '', '', '', '#ffffff', '', '447.98', '0.00', 100.00, NULL, 36, '', 1),
(38, 23, '004', '512 GB', 'Blue', '#337ab7', '277,279', '599.99', '649.99', 0.00, NULL, 38, '', 1),
(39, 23, '002', '512 GB', 'Black', '#000000', '277,278', '599.99', '649.99', 0.00, NULL, 24, '', 1),
(40, 34, '', '', '', '', '', '242.00', '0.00', 0.00, NULL, 40, '', 1),
(41, 35, '', '', '', '', '', '373.00', '0.00', 0.00, NULL, 41, '', 1),
(64, 21, '', '64 GB', '', '', '', '300.00', '0.00', 0.00, NULL, 64, '', 1),
(65, 39, '675370', '64 GB', 'Black', '#000000', '342,343', '400.00', '450.00', 162.00, NULL, 65, '', 1),
(66, 39, '675348', '128 GB', 'Black', '#000000', '342,343', '500.00', '550.00', 162.00, NULL, 66, '', 1),
(67, 39, '675360', '256 GB', 'Black', '#000000', '342,343', '700.00', '800.00', 162.00, NULL, 67, '', 1),
(68, 39, '675375', '64 GB', 'Blue', '#337ab7', '352,353', '400.00', '450.00', 162.00, NULL, 68, '', 1),
(69, 39, '675357', '128 GB', 'Blue', '#337ab7', '352,353', '500.00', '550.00', 162.00, NULL, 69, '', 1),
(70, 39, '675369', '256 GB', 'Blue', '#337ab7', '352,353', '700.00', '800.00', 162.00, NULL, 70, '', 1),
(74, 39, '675371', '64 GB', 'Green', '#5cb85c', '350,351', '400.00', '450.00', 162.00, NULL, 74, '', 1),
(71, 39, '675372', '64 GB', 'Red', '#d9534f', '346,347', '400.00', '450.00', 162.00, NULL, 71, '', 1),
(72, 39, '675351', '128 GB', 'Red', '#d9534f', '346,347', '500.00', '550.00', 162.00, NULL, 72, '', 1),
(73, 39, '675367', '256 GB', 'Red', '#d9534f', '346,347', '700.00', '800.00', 162.00, NULL, 73, '', 1),
(75, 39, '675350', '128 GB', 'Green', '#5cb85c', '350,351', '500.00', '550.00', 162.00, NULL, 75, '', 1),
(76, 39, '675363', '256 GB', 'Green', '#5cb85c', '350,351', '700.00', '800.00', 162.00, NULL, 76, '', 1),
(77, 39, '675374', '64 GB', 'White', '#ffffff', '348,349', '400.00', '450.00', 162.00, NULL, 77, '', 1),
(78, 39, '675354', '128 GB', 'White', '#ffffff', '348,349', '500.00', '550.00', 162.00, NULL, 78, '', 1),
(79, 39, '675368', '256 GB', 'White', '#ffffff', '348,349', '700.00', '800.00', 162.00, NULL, 79, '', 1),
(81, 23, '007', '512 GB', 'White', '#ffffff', '277,280', '599.99', '649.99', 0.00, NULL, 81, '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_articles`
--
ALTER TABLE `t_articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`visible`),
  ADD KEY `url` (`url`(250));

--
-- Indexes for table `t_articles_categories`
--
ALTER TABLE `t_articles_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(250)),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`);

--
-- Indexes for table `t_banners`
--
ALTER TABLE `t_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `show_all_pages` (`show_all_pages`),
  ADD KEY `category` (`categories`),
  ADD KEY `pages` (`pages`),
  ADD KEY `brands` (`brands`),
  ADD KEY `articles` (`articles_categories`);

--
-- Indexes for table `t_banners_images`
--
ALTER TABLE `t_banners_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`);

--
-- Indexes for table `t_blog`
--
ALTER TABLE `t_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`visible`),
  ADD KEY `url` (`url`(250));

--
-- Indexes for table `t_brands`
--
ALTER TABLE `t_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(250)),
  ADD KEY `url` (`url`(250));

--
-- Indexes for table `t_callbacks`
--
ALTER TABLE `t_callbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_categories`
--
ALTER TABLE `t_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(250)),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `external_id` (`external_id`),
  ADD KEY `featured` (`featured`);

--
-- Indexes for table `t_categories_features`
--
ALTER TABLE `t_categories_features`
  ADD PRIMARY KEY (`category_id`,`feature_id`);

--
-- Indexes for table `t_comments`
--
ALTER TABLE `t_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`object_id`),
  ADD KEY `type` (`type`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `t_coupons`
--
ALTER TABLE `t_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_currencies`
--
ALTER TABLE `t_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `t_delivery`
--
ALTER TABLE `t_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `t_delivery_payment`
--
ALTER TABLE `t_delivery_payment`
  ADD PRIMARY KEY (`delivery_id`,`payment_method_id`);

--
-- Indexes for table `t_faq`
--
ALTER TABLE `t_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_features`
--
ALTER TABLE `t_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `in_filter` (`in_filter`);

--
-- Indexes for table `t_feedbacks`
--
ALTER TABLE `t_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_files`
--
ALTER TABLE `t_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_groups`
--
ALTER TABLE `t_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_images`
--
ALTER TABLE `t_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename` (`filename`(250)),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `t_labels`
--
ALTER TABLE `t_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_languages`
--
ALTER TABLE `t_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_lang_articles`
--
ALTER TABLE `t_lang_articles`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`article_id`);

--
-- Indexes for table `t_lang_articles_categories`
--
ALTER TABLE `t_lang_articles_categories`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`article_category_id`);

--
-- Indexes for table `t_lang_banners_images`
--
ALTER TABLE `t_lang_banners_images`
  ADD PRIMARY KEY (`lang_id`,`banner_image_id`);

--
-- Indexes for table `t_lang_blog`
--
ALTER TABLE `t_lang_blog`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`blog_id`);

--
-- Indexes for table `t_lang_brands`
--
ALTER TABLE `t_lang_brands`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`brand_id`);

--
-- Indexes for table `t_lang_categories`
--
ALTER TABLE `t_lang_categories`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`category_id`);

--
-- Indexes for table `t_lang_currencies`
--
ALTER TABLE `t_lang_currencies`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`currency_id`);

--
-- Indexes for table `t_lang_delivery`
--
ALTER TABLE `t_lang_delivery`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`delivery_id`);

--
-- Indexes for table `t_lang_faq`
--
ALTER TABLE `t_lang_faq`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`faq_id`);

--
-- Indexes for table `t_lang_features`
--
ALTER TABLE `t_lang_features`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`feature_id`);

--
-- Indexes for table `t_lang_files`
--
ALTER TABLE `t_lang_files`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`file_id`);

--
-- Indexes for table `t_lang_pages`
--
ALTER TABLE `t_lang_pages`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`page_id`);

--
-- Indexes for table `t_lang_payment_methods`
--
ALTER TABLE `t_lang_payment_methods`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`payment_id`);

--
-- Indexes for table `t_lang_products`
--
ALTER TABLE `t_lang_products`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`product_id`);

--
-- Indexes for table `t_lang_variants`
--
ALTER TABLE `t_lang_variants`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`variant_id`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_options`
--
ALTER TABLE `t_options`
  ADD PRIMARY KEY (`lang_id`,`product_id`,`feature_id`,`value`) USING BTREE,
  ADD KEY `value` (`value`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `feature_id` (`feature_id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `translit` (`translit`);

--
-- Indexes for table `t_orders`
--
ALTER TABLE `t_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user_id`),
  ADD KEY `written_off` (`closed`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`),
  ADD KEY `code` (`url`(250)),
  ADD KEY `payment_status` (`paid`);

--
-- Indexes for table `t_orders_labels`
--
ALTER TABLE `t_orders_labels`
  ADD PRIMARY KEY (`order_id`,`label_id`);

--
-- Indexes for table `t_pages`
--
ALTER TABLE `t_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(250)),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`) USING BTREE;

--
-- Indexes for table `t_payment_methods`
--
ALTER TABLE `t_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `t_products`
--
ALTER TABLE `t_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(250)),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`),
  ADD KEY `name` (`name`(250)),
  ADD KEY `is_new` (`is_new`),
  ADD KEY `is_hit` (`is_hit`),
  ADD KEY `to_export` (`to_export`),
  ADD KEY `featured` (`featured`) USING BTREE;

--
-- Indexes for table `t_products_categories`
--
ALTER TABLE `t_products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `position` (`position`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `t_products_videos`
--
ALTER TABLE `t_products_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_purchases`
--
ALTER TABLE `t_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `t_related_products`
--
ALTER TABLE `t_related_products`
  ADD PRIMARY KEY (`product_id`,`related_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `t_seo`
--
ALTER TABLE `t_seo`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `t_seo_lang`
--
ALTER TABLE `t_seo_lang`
  ADD PRIMARY KEY (`lang_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `t_settings`
--
ALTER TABLE `t_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `t_settings_lang`
--
ALTER TABLE `t_settings_lang`
  ADD PRIMARY KEY (`lang_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `t_subscribes`
--
ALTER TABLE `t_subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_translations`
--
ALTER TABLE `t_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`(250));

--
-- Indexes for table `t_variants`
--
ALTER TABLE `t_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sku` (`sku`(250)),
  ADD KEY `price` (`price`),
  ADD KEY `stock` (`stock`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_articles`
--
ALTER TABLE `t_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_articles_categories`
--
ALTER TABLE `t_articles_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_banners`
--
ALTER TABLE `t_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_banners_images`
--
ALTER TABLE `t_banners_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_blog`
--
ALTER TABLE `t_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_brands`
--
ALTER TABLE `t_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_callbacks`
--
ALTER TABLE `t_callbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_categories`
--
ALTER TABLE `t_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_comments`
--
ALTER TABLE `t_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_coupons`
--
ALTER TABLE `t_coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_currencies`
--
ALTER TABLE `t_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_delivery`
--
ALTER TABLE `t_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_faq`
--
ALTER TABLE `t_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_features`
--
ALTER TABLE `t_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `t_feedbacks`
--
ALTER TABLE `t_feedbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_files`
--
ALTER TABLE `t_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_groups`
--
ALTER TABLE `t_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_images`
--
ALTER TABLE `t_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `t_labels`
--
ALTER TABLE `t_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_languages`
--
ALTER TABLE `t_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_orders`
--
ALTER TABLE `t_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `t_payment_methods`
--
ALTER TABLE `t_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_products`
--
ALTER TABLE `t_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `t_products_videos`
--
ALTER TABLE `t_products_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `t_purchases`
--
ALTER TABLE `t_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `t_seo`
--
ALTER TABLE `t_seo`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `t_settings`
--
ALTER TABLE `t_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `t_subscribes`
--
ALTER TABLE `t_subscribes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_translations`
--
ALTER TABLE `t_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_variants`
--
ALTER TABLE `t_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;