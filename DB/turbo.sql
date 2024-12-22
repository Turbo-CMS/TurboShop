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
(1, 1, 'Consec tetadip scinelit', 'consec-tetadip-scinelit', 'Consec tetadip scinelit', 'Articles, Business, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system\r\n', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-01-02 21:00:00', '2024-08-02 18:44:04', 1, 'article_4.jpg', 0, 1, 'Webmaster'),
(2, 2, 'Proin tincidunt felis', 'proin-tincidunt-felis', 'Proin tincidunt felis', 'Articles, Projects, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-06-19 21:00:00', '2024-08-02 18:44:14', 2, 'article_2.jpg', 3, 1, 'Webmaster'),
(3, 3, 'Lorem ipsum dolor', 'lorem-ipsum-dolor', 'Lorem ipsum dolor', 'Articles, Sales, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-08-22 21:00:00', '2024-08-02 17:36:21', 3, 'article_1.jpg', 1, 0, 'Webmaster'),
(4, 1, 'Etiam magna egestas', 'etiam-magna-egestas', 'Etiam magna egestas', 'Articles, Business, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2023-03-20 21:00:00', '2024-08-02 18:45:26', 4, 'article_3.jpg', 0, 0, 'Webmaster');

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
(1, 0, 'Business advice', '', 'Business advice', 'Business advice', '', '', 'business-advice', '', 1, 1, '2024-08-02 18:45:26'),
(2, 0, 'Project management', '', 'Project management', 'Project management', '', '', 'project-management', '', 2, 1, '2024-08-02 18:44:14'),
(3, 0, 'Increased sales', '', 'Increased sales', 'Increased sales', '', '', 'increased-sales', '', 3, 1, '2024-08-02 17:36:21');

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
(1, '1', 'Default Slider', 1, 1, 0, '0', '1', '0', '0'),
(2, '2', 'Big Banners', 2, 1, 0, '0', '1', '0', '0'),
(3, '3', 'Banners Text', 3, 1, 0, '0', '1', '0', '0'),
(5, '5', 'Category Banner', 5, 1, 1, '0', '0', '0', '0'),
(4, '4', 'Teasers', 4, 1, 0, '0', '1', '0', '0'),
(6, '6', 'Bottom Banners', 6, 1, 1, '0', '1', '0', '0');

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
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `side` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_banners_images`
--

INSERT INTO `t_banners_images` (`id`, `banner_id`, `name`, `alt`, `title`, `description`, `url`, `color`, `style`, `code`, `side`, `button`, `image`, `background`, `position`, `visible`) VALUES
(1, 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'starting at $129.00', '/', '', '', '', '', 'Shop Now', 'hero-slide01.png', '', 1, 1),
(2, 1, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'for only $1,459.99', '/', '', '', '', 'right', 'Shop Now', 'hero-slide02.png', '', 2, 1),
(3, 1, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'starting at $349.50', '/', '', '', '', 'left', 'Shop Now', 'hero-slide03.png', '', 3, 1),
(4, 2, 'Bicycles<br>for city traffic', 'Bicycles for city traffic', 'Bicycles for city traffic', 'Conquer new territories on bicycles! Mountain, folding, city or two-suspension - there is everything.', '/', '#ffffff', 'light', '', '', 'Shop Now', 'image_1.png', 'background_1.jpg', 7, 1),
(5, 2, 'Week of discounts<br>on children\'s products', 'Week of discounts on children\'s products', 'Week of discounts on children\'s products', 'Soft and educational toys, strollers, car seats and other products at discounted prices. Only until the end of the week. Don\'t miss out on the benefits!', '/', '#ffffff', 'dark', '', '', 'Get it now', 'image_2.png', 'background_2.jpg', 6, 1),
(6, 2, 'Tools for construction and repair', 'Tools for construction and repair', 'Tools for construction and repair', 'Saws, hammer drills, drills, accessories and other tools. Suitable for professionals and home use. Safe, reliable, high quality.', '', '#ffffff', 'light', 'btn-transparent-bg', '', 'Go to catalog', 'image_3.png', 'background_3.jpg', 5, 1),
(8, 3, 'Smart electronics for running', 'Smart electronics for running', 'Smart electronics for running', 'Sports and devices', 'catalog/gadgets', '#ffffff', 'light', '', '', '', 'gadgets.jpg', '', 13, 1),
(9, 3, 'Cooking utensils', 'Cooking utensils', 'Cooking utensils', 'New', '', '#ffffff', 'light', '', '', '', 'cooking.jpg', '', 12, 1),
(7, 2, 'Connections change the world', 'Connections change the world', 'Connections change the world', 'Stay mobile 24/7 with our new smartphones. Design for every taste, professional camera and powerful processor!', 'catalog/smartphones', '#ffffff', 'light', '', '', 'Select smartphone', 'image_4.png', 'background_4.jpg', 4, 1),
(10, 4, 'Fast delivery', '', '', 'Fast delivery within 24 hours', 'deliveries', '#ffffff', 'light', '', '', '', 'delivery.svg', '', 16, 1),
(11, 4, 'Customer service', '', '', 'We answer customer questions within 10 minutes', '/', '#ffffff', 'light', '', '', '', 'service.svg', '', 15, 1),
(12, 4, 'Bonuses for purchases', '', '', 'We give gifts and discounts up to 70% to all customers', '', '#ffffff', 'light', '', '', '', 'purchases.svg', '', 14, 1),
(13, 4, 'Affordable prices', '', '', 'We work directly with leading manufacturers', '', '#ffffff', 'light', '', '', '', 'prices.svg', '', 17, 1),
(14, 5, '', '', '', '', '/', '#ffffff', 'light', '', '', '', 'shoes.jpg', '', 18, 1),
(15, 6, '', '', '', '', '/', '#ffffff', 'light', '', '', '', 'bottom_banners.jpg', '', 19, 1),
(16, 3, 'Everything you need to conquer mountain peaks by bike', 'Everything you need to conquer mountain peaks by bike', 'Everything you need to conquer mountain peaks by bike', 'Bicycles', '/', '', 'light', '', '', '', 'bike.jpg', '', 11, 1),
(17, 3, 'Motorcycle parts', 'Motorcycle parts', 'Motorcycle parts', 'Motorcycles', '/', '', 'light', '', '', '', 'moto.jpg', '', 10, 1),
(18, 3, 'Pet products', 'Pet products', 'Pet products', 'Care and health', '/', '', 'light', '', '', '', 'pets.jpg', '', 9, 1),
(19, 3, 'Stylish looks for summer', 'Stylish looks for summer', 'Stylish looks for summer', 'Women', '/', '', 'light', '', '', '', 'clothes.jpg', '', 8, 1);

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
(1, 'Lorem ipsum dolor', 'lorem-ipsum-dolor', 'Lorem ipsum dolor', 'Cats, Pets', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.&nbsp;</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-08-01 21:00:00', '2024-08-02 18:47:06', 'blog_1.jpg', 0, 0),
(2, 'Consec tetadip scinelit', 'consec-tetadip-scinelit', 'Consec tetadip scinelit', 'Clothing, Women\'s clothing', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-07-14 21:00:00', '2024-08-02 18:46:18', 'blog_2.jpg', 6, 2),
(3, 'Proin tincidunt felis', 'proin-tincidunt-felis', 'Proin tincidunt felis', 'Sports, Sports products', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-07-16 21:00:00', '2024-08-02 15:27:34', 'blog_3.jpg', 2, 5),
(4, 'Etiam magna egestas', 'etiam-magna-egestas', 'Etiam magna egestas', 'Game consoles, Smartphones, Audio equipment', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', 1, '2024-08-02 21:00:00', '2024-08-21 22:14:49', 'blog_4.jpg', 1, 0);

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
(1, 'Apple', '', 'apple', 'Apple', 'Apple', 'Apple is an American corporation, a developer of personal and tablet computers, audio players, smartphones, software and digital content.', '<p>Apple is an American corporation, a developer of personal and tablet computers, audio players, smartphones, software and digital content. Headquarters are located in Cupertino, California.&nbsp;</p>', 'apple-logo.png', 1, '2024-07-08 18:23:04'),
(2, 'Samsung', '', 'samsung', 'Samsung', 'Samsung', 'Samsung', '', 'samsung-logo.png', 1, '2024-04-27 03:20:25'),
(3, 'DJI', '', 'dji', 'DJI', 'DJI', 'DJI', '', 'djl-logo.png', 1, '2024-04-27 02:50:08'),
(4, 'Havit', '', 'havit', 'Havit', 'Havit', 'Havit', '', 'havit-logo.png', 1, '2024-04-27 02:27:52'),
(5, 'JBL', '', 'jbl', 'JBL', 'JBL', 'JBL', '', 'jbl-logo.png', 1, '2024-04-27 03:11:27'),
(6, 'Motorola', '', 'motorola', 'Motorola', 'Motorola', 'Motorola', '', 'motorola-logo.png', 1, '2024-04-27 01:23:53'),
(7, 'Nokia', '', 'nokia', 'Nokia', 'Nokia', 'Nokia', '', 'nokia-logo.png', 1, '2024-04-27 03:10:50'),
(8, '1More', '', '1more', '1More', '1More', '1More', '', '1more-logo.png', 1, '2024-08-21 22:20:44');

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
(1, '2024-05-22 02:11:42', 'John Smith', '+1(234) 567-89-01', '', 0);

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
(1, 0, 'Tablets', '', 'Tablets', 'Tablets', 'Tablets', '', 'tablets', 'tablets-category.png', 'tablet.svg', 'tablet', 7, 1, '', 1, '2024-07-04 15:38:01'),
(2, 0, 'Gadgets', '', 'Gadgets', 'Gadgets', 'Gadgets', '', 'gadgets', 'apple-watch-4-black-1.png', 'watch.svg', 'watch', 2, 1, '', 1, '2024-07-03 15:40:10'),
(3, 2, 'Quadcopters', '', 'Quadcopters', 'Quadcopters', 'Quadcopters', '', 'quadcopters', 'drone.png', 'drone.svg', 'drone', 3, 1, '', 0, '2024-07-06 12:33:55'),
(4, 0, 'Accessories', '', 'Accessories', 'Accessories', 'Accessories', '', 'accessories', 'accessories-category.png', 'accessories.svg', 'headphones', 6, 1, '', 1, '2024-07-03 15:40:39'),
(5, 2, 'Portable acoustics', '', 'Portable acoustics', 'Portable acoustics', 'Portable acoustics', '', 'portable-acoustics', 'acoustics.png', 'acoustics.svg', 'speaker', 4, 1, '', 0, '2024-07-06 12:29:31'),
(6, 2, 'Watch', '', 'Watch', 'Watch', 'Watch', '', 'watch', 'apple-watch-4-white-1.png', 'watch.svg', 'watch-fitness', 5, 1, '', 0, '2024-07-06 18:49:39'),
(7, 0, 'Smartphones', '', 'Smartphones', 'Smartphones', 'A smartphone is a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies.', '<p><strong> Smartphone </strong>- a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies. How to choose a smartphone? The catalog of smartphones is extremely wide, and it is not easy to understand this variety. The first thing to start with is operating system. You can purchase: <a href=\"en/catalog/smartphones/operatingsystem-android\"> Android smartphones </a> the most common;<a href=\"en/catalog/smartphones/operatingsystem-ios\"> iOS smartphones </a> they are appreciated for their reliability and high speed of work; Other important criteria ; screen size and resolution, processor type, camera capabilities. \'Turbo Shop\' an online smartphone store, which features many models from leading manufacturers. Here you can buy cheap smartphones as well as mid-range devices and top models with delivery in New York and other regions of the USA.</p>', 'smartphones', 'smartphones-category.png', 'smartphones.svg', 'mobile', 1, 1, '', 1, '2024-07-06 11:53:58'),
(8, 0, 'Clothes', '', 'Clothes', 'Clothes', '', '', 'clothes', 'black.png', 'clothes.svg', 'tshirt', 8, 1, '', 1, '2024-07-04 15:42:02');

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
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(3, 1),
(3, 3),
(3, 5),
(3, 6),
(3, 7),
(3, 10),
(3, 11),
(3, 15),
(3, 16),
(4, 1),
(5, 1),
(5, 15),
(5, 16),
(6, 1),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 1),
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
(7, 18),
(8, 1),
(8, 2);

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
(1, '2024-07-24 05:10:00', '127.0.0.1', 0, 'Olivia', 'Satisfied with everything, thank you. Everything was delivered quickly.', 'review', 1, 0, 0, 2, 4),
(2, '2024-07-24 05:08:00', '127.0.0.1', 0, 'Oliver', 'Reliable store! Quickly give feedback on the order placed, delivery within 3 days. Fast and quality service.', 'review', 1, 0, 0, 0, 5),
(4, '2024-07-07 14:44:00', '127.0.0.1', 0, 'Admin', 'Oliver, thank you for your feedback! We are glad that we were able to please you. Come back for more purchases!', 'review', 1, 2, 1, 0, 0);

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
(2, 'TESTCOUPON', '2024-01-23 22:00:00', 'percentage', '30.00', '0.00', 0, 0),
(3, 'THANKYOU', '2024-01-23 22:00:00', 'percentage', '50.00', '2000.00', 1, 0);

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
(1, 'USD', '$', 'USD', '8.98', '8.98', 2, 1, 1),
(2, 'UAH', '₴', 'UAH', '30.00', '1.00', 2, 2, 1),
(3, 'EUR', '€', 'EUR', '0.92', '1.00', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_delivery`
--

DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery` (
  `id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `separate_payment` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_delivery`
--

INSERT INTO `t_delivery` (`id`, `module`, `name`, `icon`, `code`, `description`, `free_from`, `price`, `settings`, `enabled`, `position`, `separate_payment`) VALUES
(1, 'ExpressDelivery', 'Express Delivery', '', 'shipping-fast', '<p>Courier delivery is carried out by the service of the carrier companies of the city. Your order will be shipped the day after the order. Delivery takes from 1 to 3 days.</p>', '200.00', '20.00', 'N;', 1, 1, NULL),
(2, 'null', 'Pickup', '', 'dolly', '<p>Convenient, free and fast way to receive an order.</p>', '0.00', '0.00', 'N;', 1, 2, 1),
(3, 'NovaPoshta', 'Nova Poshta', 'NovaPoshta.svg', '', '<p>\"Nova poshta\" is the No. 1 operator on the express delivery market, providing services for fast, convenient and reliable delivery of parcels and cargo to any point in Ukraine.</p>', '5000.00', '10.00', 'a:2:{s:7:\"api_key\";s:32:\"23987441b81c3d5b0d921d6607fdba3a\";s:11:\"np_language\";s:2:\"ua\";}', 1, 3, NULL);

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
(1, 6),
(2, 3),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6);

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
(1, 'What to do if the product does not fit by form, color or size and other reasons?', '<p><span class=\"tlid-translation translation\" lang=\"en\">Within 14 days from the date of purchase of the goods (not including the date of purchase) - you can goods that have not been used, the presentation and consumer properties are preserved, and are not in the list of goods not subject to exchange or return: Exchange for a similar item without recounting the value Exchange for any other with appropriate recalculation of value Return and receive the money paid for it How to assess the safety of presentation: In good lighting, without the use of special means, the product should not have visible traces of lzovaniya as fine scratches, abrasions, and even more chips, nicks or cracks. The easiest way is to evaluate whether the presentation is preserved by answering the question: &ldquo;Would I buy this product in the same condition as a new one?&rdquo;</span></p>', 1, 1, '2024-08-21 22:15:02'),
(2, 'What is the warranty duration of my product?', '<p>The warranty period of the goods is calculated from the date of its sale. It is usually indicated in the product&rsquo;s operating document (warranty card, data sheet, label, or other document attached to the product)On the website of the manufacturer of your product.</p>', 1, 2, '2024-04-20 16:08:55'),
(3, 'Do you deliver to the apartment and rise to the floor?', '<p>Please note that targeted delivery takes place before entering the building.<br />The goods from the &ldquo;Home Appliances and Interior&rdquo; section, bulky goods from the &ldquo;Fitness&rdquo; and &ldquo;Detsky Mir&rdquo; sections (exercise machines, cribs, children\'s furniture, mattresses, etc.) are delivered to the apartment.&gt;<br />The cost of manually entering the apartment depends on: the dimensions of the equipment, the difficulty of lifting and the availability of an elevator (where the goods are placed in the package).</p>', 1, 3, '2024-04-20 16:08:50');

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
  `is_size` tinyint(1) DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url_in_product` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_features`
--

INSERT INTO `t_features` (`id`, `name`, `position`, `in_filter`, `is_color`, `is_size`, `url`, `url_in_product`) VALUES
(1, 'Color', 1, 1, 1, 0, 'color', 0),
(2, 'Size', 2, 1, 0, 1, 'size', 1),
(3, 'Operating System', 3, 1, 0, 0, 'operatingsystem', 1),
(4, 'RAM', 8, 0, 0, 0, 'ram', 0),
(5, 'CPU', 4, 0, 0, 0, 'cpu', 0),
(6, 'Cores', 5, 0, 0, 0, 'cores', 0),
(7, 'Clock Rate', 6, 0, 0, 0, 'clockrate', 0),
(8, 'GPU', 7, 0, 0, 0, 'gpu', 0),
(9, 'Memory', 9, 0, 0, 0, 'memory', 0),
(10, 'Memory Card', 10, 0, 0, 0, 'memorycard', 0),
(11, 'Camera', 11, 0, 0, 0, 'camera', 0),
(12, 'Front Camera', 12, 0, 0, 0, 'frontcamera', 0),
(13, 'Display', 13, 0, 0, 0, 'display', 0),
(14, 'Diagonal', 14, 0, 0, 0, 'diagonal', 0),
(15, 'Battery', 15, 0, 0, 0, 'battery', 0),
(16, 'Battery Capacity', 16, 0, 0, 0, 'batterycapacity', 0),
(17, 'SIM Card', 17, 0, 0, 0, 'simcard', 0),
(18, 'SIM Card Type', 18, 0, 0, 0, 'simcardtype', 0);

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
(1, '2024-05-22 02:08:45', '127.0.0.1', 'David Jones', 'test@gmail.com', 'How to get to you?', 0);

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
(3, '', 39, 'iphone-12-mini-ios14-info-rs.pdf', 'product', 0),
(6, 'Instructions for use (PIE)', 50, 'sm-a505_a705_ds_um_open_pie_rus_rev.1.0_190607.pdf', 'product', 0),
(7, 'Instructions for use (QQ)', 50, 'sm-a505_a705fn_um_cis_qq_rus_rev.1.0_200407.pdf', 'product', 1),
(8, 'Instructions for use (PIE)', 51, 'sm-a505_a705_ds_um_open_pie_rus_rev.1.0_190607.pdf', 'product', 0),
(9, 'Instructions for use (QQ)', 51, 'sm-a505_a705fn_um_cis_qq_rus_rev.1.0_200407.pdf', 'product', 1);

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
(269, '', 1, 'apple-ipad-mini-2.png', 1),
(268, '', 1, 'apple-ipad-mini-1.png', 0),
(309, '', 2, 'samsung-galaxy-tab-1.png', 0),
(310, '', 2, 'samsung-galaxy-tab-2.png', 1),
(271, '', 3, 'apple-ipad-air-1.png', 0),
(272, '', 3, 'apple-ipad-air-2.png', 1),
(246, '', 5, 'dji-mavic-pro-1.png', 0),
(240, '', 4, 'dji-mavic-air-1.png', 0),
(241, '', 4, 'dji-mavic-air-2.png', 1),
(247, '', 5, 'dji-mavic-pro-2.png', 1),
(248, '', 5, 'dji-mavic-pro-3.png', 2),
(238, '', 6, 'dji-phantom-4-2.png', 1),
(270, '', 6, 'dji-phantom-4-1.png', 0),
(264, '', 35, 'samsung-galaxy-watch-1.png', 0),
(308, '', 7, 'havit-g1.png', 0),
(256, '', 9, 'jbl-flip-4-red-1.png', 0),
(257, '', 9, 'jbl-flip-4-red-2.png', 1),
(254, '', 10, 'jbl-flip-4-blue-1.png', 0),
(255, '', 10, 'jbl-flip-4-blue-2.png', 1),
(253, '', 11, 'jbl-flip-4-black-2.png', 1),
(252, '', 11, 'jbl-flip-4-black-1.png', 0),
(263, '', 12, 'samsung-galaxy-watch-active-green-1.png', 0),
(259, '', 13, 'apple-watch-4-black-1.png', 0),
(324, '', 34, 'samsung-galaxy-watch-active-1.png', 0),
(258, '', 14, 'apple-watch-4-silver-1.png', 0),
(260, '', 15, 'apple-watch-4-white-1.png', 0),
(306, '', 8, '1more-quad-driver-1.png', 0),
(319, '', 17, 'motorola-moto-g6-1.png', 0),
(320, '', 17, 'motorola-moto-g6-2.png', 1),
(321, '', 18, 'nokia-42-ds-3-2.png', 1),
(322, '', 18, 'nokia-42-ds-3-1.png', 0),
(285, '', 19, 'samsung-galaxy-fold-1.png', 0),
(286, '', 19, 'samsung-galaxy-fold-2.png', 1),
(287, '', 19, 'samsung-galaxy-fold-3.png', 2),
(288, '', 19, 'samsung-galaxy-fold-4.png', 3),
(296, '', 16, 'apple-airpods-4.png', 3),
(293, '', 16, 'apple-airpods-1.png', 0),
(294, '', 16, 'apple-airpods-2.png', 1),
(295, '', 16, 'apple-airpods-3.png', 2),
(283, '', 20, 'samsung-galaxy-s10-1.png', 0),
(284, '', 20, 'samsung-galaxy-s10-2.png', 1),
(282, '', 21, 'samsung-galaxy-a30-2.png', 1),
(281, '', 21, 'samsung-galaxy-a30-1.png', 0),
(325, '', 22, 'samsung-galaxy-m30-1.png', 0),
(326, '', 22, 'samsung-galaxy-m30-2.png', 1),
(278, '', 23, 'samsung-galaxy-a50-2.png', 1),
(277, '', 23, 'samsung-galaxy-a50-1.png', 0),
(275, '', 24, 'samsung-galaxy-a10-1.png', 0),
(276, '', 24, 'samsung-galaxy-a10-2.png', 1),
(273, '', 25, 'samsung-galaxy-a20-2.png', 1),
(274, '', 25, 'samsung-galaxy-a20-1.png', 0),
(338, '', 26, 'samsung-galaxy-a70-1.png', 0),
(339, '', 26, 'samsung-galaxy-a70-2.png', 1),
(341, '', 33, 'apple-iphone-x-2.png', 1),
(331, '', 27, 'samsung-galaxy-a40-1.png', 0),
(332, '', 27, 'samsung-galaxy-a40-2.png', 1),
(330, '', 29, 'samsung-galaxy-a80-2.png', 1),
(333, '', 30, 'samsung-galaxy-a20-1.png', 0),
(335, '', 32, 'samsung-galaxy-s7-1.png', 0),
(336, '', 32, 'samsung-galaxy-s7-2.png', 1),
(337, '', 32, 'samsung-galaxy-s7-3.png', 2),
(354, '', 31, 'apple-iphone-7-1.png', 0),
(355, '', 31, 'apple-iphone-7-2.png', 1),
(329, '', 29, 'samsung-galaxy-a80-1.png', 0),
(334, '', 30, 'samsung-galaxy-a20-2.png', 1),
(340, '', 33, 'apple-iphone-x-1.png', 0),
(342, '', 39, 'apple-iphone-12-black-1.png', 0),
(343, '', 39, 'apple-iphone-12-black-2.png', 1),
(327, '', 28, 'samsung-galaxy-a2-1.png', 0),
(328, '', 28, 'samsung-galaxy-a2-2.png', 1),
(423, '', 45, 'green.png', 0),
(374, '', 41, 'apple-iphone-12-white-1.png', 0),
(375, '', 41, 'apple-iphone-12-white-2.png', 1),
(382, '', 42, 'apple-iphone-12-green-1.png', 0),
(383, '', 42, 'apple-iphone-12-green-2.png', 1),
(390, '', 43, 'apple-iphone-12-red-1.png', 0),
(391, '', 43, 'apple-iphone-12-red-2.png', 1),
(398, '', 44, 'apple-iphone-12-blue-1.png', 0),
(399, '', 44, 'apple-iphone-12-blue-2.png', 1),
(430, '', 46, 'white.png', 0),
(446, '', 50, 'samsung-galaxy-a50-1.png', 0),
(434, '', 47, 'black.png', 0),
(450, '', 51, 'samsung-galaxy-a50-1.png', 0),
(449, '', 50, 'samsung-galaxy-a50-white-2.png', 1),
(438, '', 48, 'blue.png', 0),
(452, '', 51, 'samsung-galaxy-a50-blue-2.png', 1),
(442, '', 49, 'red.png', 0);

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
(1, 'call back', '#dc3545', 1),
(2, 'expected product', '#3b7ddd', 2);

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
(1, '', 1, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Бизнес, Вебмастер', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только.</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Consec tetadip scinelit', 'Webmaster', 'Consec tetadip scinelit', 'Articles, Business, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system\r\n', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Проекты, Вебмастер', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только.</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Бізнес, Вебмайстер', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(2, '', 4, 'Etiam magna egestas', 'Webmaster', 'Etiam magna egestas', 'Articles, Business, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(2, '', 2, 'Proin tincidunt felis', 'Webmaster', 'Proin tincidunt felis', 'Articles, Projects, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Проекти, Вебмайстер', 'Заголовок демонстраційної статті h2 Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(3, '', 4, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Бізнес, Вебмайстер', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum.</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 4, 'Название демонстрационной статьи', 'Вебмастер', 'Etiam magna egestas', 'Статьи, Бизнес, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только.</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong> - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(1, '', 3, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Статьи, Продажи, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только.</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Lorem ipsum dolor', 'Webmaster', 'Lorem ipsum dolor', 'Articles, Sales, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 3, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Статті, Продажі, Вебмайстер', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum.</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>');

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
  `button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_banners_images`
--

INSERT INTO `t_lang_banners_images` (`lang_id`, `lang_label`, `banner_image_id`, `name`, `alt`, `title`, `description`, `button`) VALUES
(1, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'от $129.00', 'Купить'),
(2, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'starting at $129.00', 'Shop Now'),
(3, '', 1, 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'Google Home Smart Speaker', 'від $129,00', 'Купити'),
(1, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'всего за $1459,99', 'Купить'),
(2, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'for only $1,459.99', 'Shop Now'),
(3, '', 2, 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'Modern Powerful Vaio Laptop', 'всього за $1459,99', 'Купити'),
(1, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'от $349,50', 'Купить'),
(2, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'starting at $349.50', 'Shop Now'),
(3, '', 3, 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'Wireless Beats Studio by Dr.Dre', 'від $349,50', 'Купити'),
(2, '', 4, 'Bicycles<br>for city traffic', 'Bicycles for city traffic', 'Bicycles for city traffic', 'Conquer new territories on bicycles! Mountain, folding, city or two-suspension - there is everything.', 'Shop Now'),
(3, '', 4, 'Велосипеди<br>для руху у місті', 'Велосипеди для руху у місті', 'Велосипеди для руху у місті', 'Підкорюйте нові території на велосипедах! Гірські, складні, міські чи двопідвісні – знайдеться все.', 'Купити'),
(1, '', 4, 'Велосипеды<br>для движения в городе', 'Велосипеды для движения в городе', 'Велосипеды для движения в городе', 'Покоряйте новые территории на велосипедах! Горные, складные, городские или двухподвесные — найдется все.', 'Купить'),
(2, '', 5, 'Week of discounts<br>on children\'s products', 'Week of discounts on children\'s products', 'Week of discounts on children\'s products', 'Soft and educational toys, strollers, car seats and other products at discounted prices. Only until the end of the week. Don\'t miss out on the benefits!', 'Get it now'),
(2, '', 6, 'Tools for construction and repair', 'Tools for construction and repair', 'Tools for construction and repair', 'Saws, hammer drills, drills, accessories and other tools. Suitable for professionals and home use. Safe, reliable, high quality.', 'Go to catalog'),
(3, '', 5, 'Тиждень знижок<br>на дитячі товари', 'Тиждень знижок на дитячі товари', 'Тиждень знижок на дитячі товари', 'М\'які та розвиваючі іграшки, коляски, автокрісла та інші товари за зниженими цінами. Лише до кінця тижня. Не проґавте вигоду!', 'Встигни купити'),
(1, '', 5, 'Неделя скидок<br>на детские товары', 'Неделя скидок на детские товары', 'Неделя скидок на детские товары', 'Мягкие и развивающие игрушки, коляски, автокресла и другие товары по сниженным ценам. Только до конца недели. Не упустите выгоду!', 'Успеть купить'),
(2, '', 7, 'Connections change the world', 'Connections change the world', 'Connections change the world', 'Stay mobile 24/7 with our new smartphones. Design for every taste, professional camera and powerful processor!', 'Select smartphone'),
(3, '', 6, 'Інструменти для будівництва та ремонту', 'Інструменти для будівництва та ремонту', 'Інструменти для будівництва та ремонту', 'Пилки, перфоратори, дрилі, оснащення та інші інструменти. Підходять для професіоналів та домашнього використання. Безпечні, надійні, якісні.', 'Перейти до каталогу'),
(1, '', 6, 'Инструменты для строительства и ремонта', 'Инструменты для строительства и ремонта', 'Инструменты для строительства и ремонта', 'Пилы, перфораторы, дрели, оснастка и другие инструменты. Подходят для профессионалов и домашнего использования. Безопасные, надежные, качественные.', 'Перейти в каталог'),
(3, '', 7, 'Світ змінюють зв\'язки', 'Світ змінюють зв\'язки', 'Світ змінюють зв\'язки', 'Зберігайте мобільність 24/7 разом із нашими новими смартфонами. Дизайн на будь-який смак, професійна камера та потужний процесор!', 'Вибрати смартфон'),
(1, '', 7, 'Мир меняют связи', 'Мир меняют связи', 'Мир меняют связи', 'Сохраняйте мобильность 24/7 вместе с нашими новыми смартфонами. Дизайн на любой вкус, профессиональная камера и мощный процессор!', 'Выбрать смартфон '),
(2, '', 8, 'Smart electronics for running', 'Smart electronics for running', 'Smart electronics for running', 'Sports and devices', ''),
(3, '', 8, 'Smart electronics for running', 'Smart electronics for running', 'Smart electronics for running', 'Sports and devices', ''),
(1, '', 8, 'Smart electronics for running', 'Smart electronics for running', 'Smart electronics for running', 'Sports and devices', ''),
(2, '', 9, 'Cooking utensils', 'Cooking utensils', 'Cooking utensils', 'New', ''),
(3, '', 9, 'Cooking utensils', 'Cooking utensils', 'Cooking utensils', 'New', ''),
(1, '', 9, 'Cooking utensils', 'Cooking utensils', 'Cooking utensils', 'New', ''),
(2, '', 10, 'Fast delivery', '', '', 'Fast delivery within 24 hours', ''),
(3, '', 10, 'Швидка доставка', '', '', 'Швидка доставка за 24 години', ''),
(1, '', 10, 'Быстрая доставка', '', '', 'Быстрая доставка за 24 часа', ''),
(2, '', 11, 'Customer service', '', '', 'We answer customer questions within 10 minutes', ''),
(3, '', 11, 'Клієнтський сервіс', '', '', 'Відповідаємо на запитання покупців упродовж 10 хвилин', ''),
(1, '', 11, 'Клиентский сервис', '', '', 'Отвечаем на вопросы покупателей в течение 10 минут', ''),
(2, '', 12, 'Bonuses for purchases', '', '', 'We give gifts and discounts up to 70% to all customers', ''),
(3, '', 12, 'Бонуси за покупки', '', '', 'Даруємо подарунки та знижки до 70% усім покупцям', ''),
(1, '', 12, 'Бонусы за покупки', '', '', 'Дарим подарки и скидки до 70% всем покупателям', ''),
(2, '', 13, 'Affordable prices', '', '', 'We work directly with leading manufacturers', ''),
(3, '', 13, 'Доступні ціни', '', '', 'Працюємо безпосередньо з провідними виробниками', ''),
(1, '', 13, 'Доступные цены', '', '', 'Работаем напрямую с ведущими производителями', ''),
(2, '', 14, 'Category Banner', '', '', '', ''),
(3, '', 14, 'Category Banner', '', '', '', ''),
(1, '', 14, 'Category Banner', '', '', '', ''),
(2, '', 15, 'Bottom Banner', '', '', '', ''),
(3, '', 15, 'Bottom Banner', '', '', '', ''),
(1, '', 15, 'Bottom Banner', '', '', '', ''),
(2, '', 16, 'Everything you need to conquer mountain peaks by bike', 'Everything you need to conquer mountain peaks by bike', 'Everything you need to conquer mountain peaks by bike', 'Bicycles', ''),
(2, '', 17, 'Motorcycle parts', 'Motorcycle parts', 'Motorcycle parts', 'Motorcycles', ''),
(3, '', 16, 'Все для підкорення гірських вершин на велосипеді', 'Все для підкорення гірських вершин на велосипеді', 'Все для підкорення гірських вершин на велосипеді', 'Велосипеди', ''),
(1, '', 16, 'Все для покорения горных вершин на велосипеде', 'Все для покорения горных вершин на велосипеде', 'Все для покорения горных вершин на велосипеде', 'Велосипеды', ''),
(2, '', 18, 'Pet products', 'Pet products', 'Pet products', 'Care and health', ''),
(3, '', 17, 'Запчастини для мотоциклів', 'Запчастини для мотоциклів', 'Запчастини для мотоциклів', 'Мотоцикли', ''),
(1, '', 17, 'Запчасти для мотоциклов', 'Запчасти для мотоциклов', 'Запчасти для мотоциклов', 'Мотоциклы', ''),
(2, '', 19, 'Stylish looks for summer', 'Stylish looks for summer', 'Stylish looks for summer', 'Women', ''),
(3, '', 18, 'Товари для домашніх тварин', 'Товари для домашніх тварин', 'Товари для домашніх тварин', 'Турбота та здоров\'я', ''),
(1, '', 18, 'Товары для домашних животных', 'Товары для домашних животных', 'Товары для домашних животных', 'Забота и здоровье', ''),
(3, '', 19, 'Стильні образи на літо', 'Стильні образи на літо', 'Стильні образи на літо', 'Жінкам', ''),
(1, '', 19, 'Стильные образы на лето', 'Стильные образы на лето', 'Стильные образы на лето', 'Женщинам', '');

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
(1, '', 1, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Кошки, Домашние животные', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.&nbsp;</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Lorem ipsum dolor', 'Lorem ipsum dolor', 'Cats, Pets', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.&nbsp;</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Коти, Домашні тварини', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Одежда, Женская одежда', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.&nbsp;</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 2, 'Consec tetadip scinelit', 'Consec tetadip scinelit', 'Clothing, Women\'s clothing', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Одяг, Жіночий одяг', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. ', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 3, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Спорт, Товары для спорта', 'Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века.', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.&nbsp;</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Proin tincidunt felis', 'Proin tincidunt felis', 'Sports, Sports products', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 3, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Спорт, Товари для спорту', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(2, '', 4, 'Etiam magna egestas', 'Etiam magna egestas', 'Game consoles, Smartphones, Audio equipment', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;undertakes laborious&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 4, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Ігрові приставки, Смартфони, Аудіотехніка', 'Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття.', '<p>Lorem Ipsum - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки.</p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong>- це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p>Lorem Ipsum &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 4, 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Игровые приставки, Смартфоны, Аудиотехника', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. ', '<p>Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.&nbsp;</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p>Lorem Ipsum&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>');

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
(1, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple - американская корпорация, разработчик персональных и планшетных компьютеров, аудиоплееров, смартфонов, программного обеспечения и цифрового контента.', '<p>Apple &mdash; американская корпорация, разработчик персональных и планшетных компьютеров, аудиоплееров, смартфонов, программного обеспечения и цифрового контента. Штаб-квартира расположена в Купертино, штат Калифорния.&nbsp;</p>'),
(2, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple is an American corporation, a developer of personal and tablet computers, audio players, smartphones, software and digital content.', '<p>Apple is an American corporation, a developer of personal and tablet computers, audio players, smartphones, software and digital content. Headquarters are located in Cupertino, California.&nbsp;</p>'),
(3, '', 1, 'Apple', '', 'Apple', 'Apple', 'Apple - американська корпорація, розробник персональних та планшетних комп\'ютерів, аудіоплеєрів, смартфонів, програмного забезпечення та цифрового контенту.', '<p>Apple &mdash; американська корпорація, розробник персональних та планшетних комп\'ютерів, аудіоплеєрів, смартфонів, програмного забезпечення та цифрового контенту. Штаб-квартира розташована в Купертіно, штат Каліфорнія.</p>'),
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
(3, 'ua', 7, 'Смартфони', '', 'Смартфони', 'Смартфони', 'Смартфон - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. ', '<p><strong>Смартфон</strong> - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. Як вибрати смартфон? Каталог смартфонів надзвичайно широкий, і розібратися в цьому різноманітті нелегко. Перше, з чого варто почати, - операційна система. Ви можете придбати: &bull; смартфони Android - найбільш поширені; &bull; смартфони iOS - їх цінують за надійність і високу швидкість роботи; Інші важливі критерії - розмір і дозвіл екрана, тип процесора, можливості камери. &laquo;Turbo Shop&raquo; - інтернет-магазин смартфонів, в якому представлено безліч моделей від провідних виробників. Тут ви можете купити як дешеві смартфони, так і пристрої середнього класу і топові моделі з доставкою по Києву та іншим регіонам України.</p>'),
(2, '', 8, 'Clothes', '', 'Clothes', 'Clothes', '', ''),
(3, '', 8, 'Одяг', '', 'Одяг', 'Одяг', '', ''),
(1, '', 8, 'Одежда', '', 'Одежда', 'Одежда', '', '');

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
(1, '', 1, 'Курьерская доставка', '<p>Курьерская доставка осуществляется службой компаний-перевозчиков города. Ваш заказ будет отправлен на следующий день после заказа. Доставка занимает от 1 до 3 дней.</p>'),
(2, '', 1, 'Express Delivery', '<p>Courier delivery is carried out by the service of the carrier companies of the city. Your order will be shipped the day after the order. Delivery takes from 1 to 3 days.</p>'),
(1, '', 2, 'Самовывоз', '<p>Удобный, бесплатный и быстрый способ получения заказа.</p>'),
(3, '', 1, 'Кур\'єрська доставка', '<p>Кур\'єрська доставка здійснюється службою компаній-перевізників міста. Ваше замовлення буде відправлений на наступний день після замовлення. Доставка займає від 1 до 3 днів.</p>'),
(2, '', 2, 'Pickup', '<p>Convenient, free and fast way to receive an order.</p>'),
(3, '', 2, 'Самовивіз', '<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення.</p>'),
(2, '', 3, 'Nova Poshta', '<p>\"Nova poshta\" is the No. 1 operator on the express delivery market, providing services for fast, convenient and reliable delivery of parcels and cargo to any point in Ukraine.</p>'),
(3, '', 3, 'Нова Пошта', '<p>&laquo;Нова пошта&raquo; &ndash; оператор №1 на ринку експрес-доставки, надає послуги швидкої, зручної та надійної доставки посилок та вантажів у будь-яку точку України.</p>'),
(1, '', 3, 'Новая Почта', '<p>&laquo;Новая почта&raquo; &ndash; оператор №1 на рынке экспресс-доставки, предоставляет услуги быстрой, удобной и надежной доставки посылок и грузов в любую точку Украины.</p>');

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
(2, '', 1, 'Color'),
(3, '', 1, 'Колір'),
(1, '', 1, 'Цвет'),
(2, '', 2, 'Size'),
(3, '', 2, 'Розмір'),
(1, '', 2, 'Размер'),
(2, '', 3, 'Operating System'),
(3, '', 3, 'Операційна система'),
(1, '', 3, 'Операционная система'),
(2, '', 4, 'RAM'),
(3, '', 4, 'Оперативна пам\'ять'),
(1, '', 4, 'Оперативная память'),
(2, '', 5, 'CPU'),
(3, '', 5, 'Процесор'),
(1, '', 5, 'Процессор'),
(2, '', 6, 'Cores'),
(3, '', 6, 'Кількість ядер'),
(1, '', 6, 'Количество ядер'),
(2, '', 7, 'Clock Rate'),
(3, '', 7, 'Тактова частота'),
(1, '', 7, 'Тактовая частота'),
(2, '', 8, 'GPU'),
(3, '', 8, 'Графічний процесор'),
(1, '', 8, 'Графический процессор'),
(2, '', 9, 'Memory'),
(3, '', 9, 'Пам\'ять'),
(1, '', 9, 'Встроенная память'),
(2, '', 10, 'Memory Card'),
(3, '', 10, 'Карта пам\'яті'),
(1, '', 10, 'Карта памяти'),
(2, '', 11, 'Camera'),
(3, '', 11, 'Камера'),
(1, '', 11, 'Камера'),
(2, '', 12, 'Front Camera'),
(3, '', 12, 'Фронтальна камера'),
(1, '', 12, 'Фронтальная камера'),
(2, '', 13, 'Display'),
(3, '', 13, 'Екран'),
(1, '', 13, 'Экран'),
(2, '', 14, 'Diagonal'),
(3, '', 14, 'Діагональ'),
(1, '', 14, 'Диагональ'),
(2, '', 15, 'Battery'),
(3, '', 15, 'Тип акумулятора'),
(1, '', 15, 'Тип аккумулятора'),
(2, '', 16, 'Battery Capacity'),
(3, '', 16, 'Ємність аккумулятору'),
(1, '', 16, 'Емкость аккумулятора'),
(2, '', 17, 'SIM Card'),
(3, '', 17, 'SIM-карта'),
(1, '', 17, 'SIM-карта'),
(2, '', 18, 'SIM Card Type'),
(3, '', 18, 'Тип SIM-карти'),
(1, '', 18, 'Тип SIM-карты');

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
(3, '', 3, ''),
(2, '', 6, 'Instructions for use (PIE)'),
(3, '', 6, 'Інструкція з використання (PIE)'),
(1, '', 6, 'Инструкция по использованию (PIE)'),
(2, '', 7, 'Instructions for use (QQ)'),
(3, '', 7, 'Інструкція з використання (QQ)'),
(1, '', 7, 'Инструкция по использованию (QQ)'),
(2, '', 8, 'Instructions for use (PIE)'),
(3, '', 8, 'Інструкція з використання (PIE)'),
(1, '', 8, 'Инструкция по использованию (PIE)'),
(2, '', 9, 'Instructions for use (QQ)'),
(3, '', 9, 'Інструкція з використання (QQ)'),
(1, '', 9, 'Инструкция по использованию (QQ)');

-- --------------------------------------------------------

--
-- Table structure for table `t_lang_options`
--

DROP TABLE IF EXISTS `t_lang_options`;
CREATE TABLE `t_lang_options` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_lang_options`
--

INSERT INTO `t_lang_options` (`lang_id`, `lang_label`, `option_id`, `feature_id`, `value`) VALUES
(2, '', 1, 1, '#000000'),
(3, '', 1, 1, '#000000'),
(1, '', 1, 1, '#000000'),
(2, '', 2, 3, 'IOS'),
(3, '', 2, 3, 'IOS'),
(1, '', 2, 3, 'IOS'),
(2, '', 3, 5, 'Apple A11 Bionic'),
(3, '', 3, 5, 'Apple A11 Bionic'),
(1, '', 3, 5, 'Apple A11 Bionic'),
(2, '', 4, 6, '6'),
(3, '', 4, 6, '6'),
(1, '', 4, 6, '6'),
(2, '', 5, 7, '2.39 GHz'),
(3, '', 5, 7, '2.39 ГГц'),
(1, '', 5, 7, '2.39 ГГц'),
(2, '', 6, 8, 'Apple A11 GPU'),
(3, '', 6, 8, 'Apple A11 GPU'),
(1, '', 6, 8, 'Apple A11 GPU'),
(2, '', 7, 4, '3 GB'),
(3, '', 7, 4, '3 ГБ'),
(1, '', 7, 4, '3 GB'),
(2, '', 8, 9, '64 GB'),
(3, '', 8, 9, '64 ГБ'),
(1, '', 8, 9, '64 ГБ'),
(2, '', 9, 10, 'No'),
(3, '', 9, 10, 'Немає'),
(1, '', 9, 10, 'Нет'),
(2, '', 10, 11, '12 MP'),
(3, '', 10, 11, '12 Мп'),
(1, '', 10, 11, '12 Мп'),
(2, '', 11, 12, '7 MP'),
(3, '', 11, 12, '7 Мп'),
(1, '', 11, 12, '7 Мп'),
(2, '', 12, 13, 'OLED'),
(3, '', 12, 13, 'OLED'),
(1, '', 12, 13, 'OLED'),
(2, '', 13, 14, '5.8\"'),
(3, '', 13, 14, '5.8\"'),
(1, '', 13, 14, '5.8\"'),
(2, '', 14, 15, 'Li-Ion'),
(3, '', 14, 15, 'Li-Ion'),
(1, '', 14, 15, 'Li-Ion'),
(2, '', 15, 16, '2716 mAh'),
(3, '', 15, 16, '2716 мА·ч'),
(1, '', 15, 16, '2716 мА·ч'),
(2, '', 16, 17, '1 SIM'),
(3, '', 16, 17, '1 SIM'),
(1, '', 16, 17, '1 SIM'),
(2, '', 17, 18, 'Nano-SIM'),
(3, '', 17, 18, 'Nano-SIM'),
(1, '', 17, 18, 'Nano-SIM'),
(2, '', 18, 5, 'Apple A10 Fusion'),
(3, '', 18, 5, 'Apple A10 Fusion'),
(1, '', 18, 5, 'Apple A10 Fusion'),
(2, '', 19, 6, '4'),
(3, '', 19, 6, '4'),
(1, '', 19, 6, '4'),
(2, '', 20, 7, '2.34 GHz'),
(3, '', 20, 7, '2.34 ГГц'),
(1, '', 20, 7, '2.34 ГГц'),
(2, '', 21, 8, 'PowerVR Series7XT Plus'),
(3, '', 21, 8, 'PowerVR Series7XT Plus'),
(1, '', 21, 8, 'PowerVR Series7XT Plus'),
(2, '', 22, 4, '2 GB'),
(3, '', 22, 4, '2 ГБ'),
(1, '', 22, 4, '2 ГБ'),
(2, '', 23, 9, '32 GB'),
(3, '', 23, 9, '32 ГБ'),
(1, '', 23, 9, '32 GB'),
(2, '', 24, 13, 'IPS'),
(3, '', 24, 13, 'IPS'),
(1, '', 24, 13, 'IPS'),
(2, '', 25, 14, '4.7\"'),
(3, '', 25, 14, '4.7\"'),
(1, '', 25, 14, '4.7\"'),
(2, '', 26, 16, '1960 mAh'),
(3, '', 26, 16, '1960 мА·ч'),
(1, '', 26, 16, '1960 мА·ч'),
(2, '', 27, 3, 'Android'),
(3, '', 27, 3, 'Android'),
(1, '', 27, 3, 'Android'),
(2, '', 28, 5, 'Qualcomm Snapdragon 820'),
(3, '', 28, 5, 'Qualcomm Snapdragon 820'),
(1, '', 28, 5, 'Qualcomm Snapdragon 820'),
(2, '', 29, 7, '2.6 GHz'),
(3, '', 29, 7, '2.6 ГГц'),
(1, '', 29, 7, '2.6 ГГц'),
(2, '', 30, 8, 'Qualcomm Adreno 530'),
(3, '', 30, 8, 'Qualcomm Adreno 530'),
(1, '', 30, 8, 'Qualcomm Adreno 530'),
(2, '', 31, 4, '4 GB'),
(3, '', 31, 4, '4 ГБ'),
(1, '', 31, 4, '4 ГБ'),
(2, '', 32, 10, 'microSDXC'),
(3, '', 32, 10, 'microSDXC'),
(1, '', 32, 10, 'microSDXC'),
(2, '', 33, 12, '5 MP'),
(3, '', 33, 12, '5 Мп'),
(1, '', 33, 12, '5 Мп'),
(2, '', 34, 13, 'Super AMOLED'),
(3, '', 34, 13, 'Super AMOLED'),
(1, '', 34, 13, 'Super AMOLED'),
(2, '', 35, 14, '5.5\"'),
(3, '', 35, 14, '5.5\"'),
(1, '', 35, 14, '5.5\"'),
(2, '', 36, 16, '3000 mAh'),
(3, '', 36, 16, '3000 мА·ч'),
(1, '', 36, 16, '3000 mAh'),
(2, '', 37, 17, '2 SIM'),
(3, '', 37, 17, '2 SIM'),
(1, '', 37, 17, '2 SIM'),
(2, '', 38, 5, 'Exynos 7884'),
(3, '', 38, 5, 'Exynos 7884'),
(1, '', 38, 5, 'Exynos 7884'),
(2, '', 39, 6, '8'),
(3, '', 39, 6, '8'),
(1, '', 39, 6, '8'),
(2, '', 40, 7, '1.6 GHz'),
(3, '', 40, 7, '1.6 ГГц'),
(1, '', 40, 7, '1.6 GHz'),
(2, '', 41, 8, 'ARM Mali-G71'),
(3, '', 41, 8, 'ARM Mali-G71'),
(1, '', 41, 8, 'ARM Mali-G71'),
(2, '', 42, 11, '13 MP + 5 MP'),
(3, '', 42, 11, '13 Мп + 5 Мп'),
(1, '', 42, 11, '13 MP + 5 MP'),
(2, '', 43, 12, '8 MP'),
(3, '', 43, 12, '8 Мп'),
(1, '', 43, 12, '8 MP'),
(2, '', 44, 13, 'PLS'),
(3, '', 44, 13, 'PLS'),
(1, '', 44, 13, 'PLS'),
(2, '', 45, 15, 'Li-Pol'),
(3, '', 45, 15, 'Li-Pol'),
(1, '', 45, 15, 'Li-Pol'),
(2, '', 46, 1, '#ff0000'),
(3, '', 46, 1, '#ff0000'),
(1, '', 46, 1, '#ff0000'),
(2, '', 47, 5, 'Apple A14 Bionic'),
(3, '', 47, 5, 'Apple A14 Bionic'),
(1, '', 47, 5, 'Apple A14 Bionic'),
(2, '', 48, 7, '3.1 GHz'),
(3, '', 48, 7, '3.1 ГГц'),
(1, '', 48, 7, '3.1 ГГц'),
(2, '', 49, 8, 'Apple A14 GPU'),
(3, '', 49, 8, 'Apple A14 GPU'),
(1, '', 49, 8, 'Apple A14 GPU'),
(2, '', 50, 9, '128 GB'),
(3, '', 50, 9, '128 ГБ'),
(1, '', 50, 9, '128 ГБ'),
(2, '', 51, 9, '256 GB'),
(3, '', 51, 9, '256 ГБ'),
(1, '', 51, 9, '256 ГБ'),
(2, '', 52, 11, '12 MP + 12 MP'),
(3, '', 52, 11, '12 Мп + 12 Мп'),
(1, '', 52, 11, '12 Мп + 12 Мп'),
(2, '', 53, 12, '12 MP'),
(3, '', 53, 12, '12 Мп'),
(1, '', 53, 12, '12 Мп'),
(2, '', 54, 14, '6.1\"'),
(3, '', 54, 14, '6.1\"'),
(1, '', 54, 14, '6.1\"'),
(2, '', 55, 16, '2775 mAh'),
(3, '', 55, 16, '2775 мА·ч'),
(1, '', 55, 16, '2775 мА·ч'),
(2, '', 56, 18, 'e-SIM'),
(3, '', 56, 18, 'e-SIM'),
(1, '', 56, 18, 'e-SIM'),
(2, '', 57, 1, '#0000ff'),
(3, '', 57, 1, '#0000ff'),
(1, '', 57, 1, '#0000ff'),
(2, '', 58, 1, '#008000'),
(3, '', 58, 1, '#008000'),
(1, '', 58, 1, '#000000'),
(2, '', 59, 1, '#ffffff'),
(3, '', 59, 1, '#ffffff'),
(1, '', 59, 1, '#ffffff'),
(2, '', 60, 3, 'Watch OS'),
(3, '', 60, 3, 'Watch OS'),
(1, '', 60, 3, 'Watch OS'),
(2, '', 61, 5, 'Apple S4'),
(3, '', 61, 5, 'Apple S4'),
(1, '', 61, 5, 'Apple S4'),
(2, '', 62, 6, '2'),
(3, '', 62, 6, '2'),
(1, '', 62, 6, '2'),
(2, '', 63, 9, '16 GB'),
(3, '', 63, 9, '16 ГБ'),
(1, '', 63, 9, '16 ГБ'),
(2, '', 64, 14, '1.78”'),
(3, '', 64, 14, '1.78”'),
(1, '', 64, 14, '1.78”'),
(2, '', 65, 1, '#808080'),
(3, '', 65, 1, '#808080'),
(1, '', 65, 1, '#808080'),
(2, '', 66, 5, 'Exynos 7870'),
(3, '', 66, 5, 'Exynos 7870'),
(1, '', 66, 5, 'Exynos 7870'),
(2, '', 67, 8, 'ARM Mali-T830'),
(3, '', 67, 8, 'ARM Mali-T830'),
(1, '', 67, 8, 'ARM Mali-T830'),
(2, '', 68, 4, '1 GB'),
(3, '', 68, 4, '1 ГБ'),
(1, '', 68, 4, '1 ГБ'),
(2, '', 69, 9, '8 GB'),
(3, '', 69, 9, '8 ГБ'),
(1, '', 69, 9, '8 ГБ'),
(2, '', 70, 10, 'microSD'),
(3, '', 70, 10, 'microSD'),
(1, '', 70, 10, 'microSD'),
(2, '', 71, 11, '8 MP'),
(3, '', 71, 11, '8 Мп'),
(1, '', 71, 11, '8 Мп'),
(2, '', 72, 14, '5\"'),
(3, '', 72, 14, '5\"'),
(1, '', 72, 14, '5\"'),
(2, '', 73, 16, '2600 mAh'),
(3, '', 73, 16, '2600 мА·ч'),
(1, '', 73, 16, '2600 мА·ч'),
(2, '', 74, 18, 'micro-SIM'),
(3, '', 74, 18, 'micro-SIM'),
(1, '', 74, 18, 'micro-SIM'),
(2, '', 75, 3, 'iPadOS'),
(3, '', 75, 3, 'iPadOS'),
(1, '', 75, 3, 'iPadOS'),
(2, '', 76, 5, 'Apple A12 Bionic'),
(3, '', 76, 5, 'Apple A12 Bionic'),
(1, '', 76, 5, 'Apple A12 Bionic'),
(2, '', 77, 7, '2.4 GHz'),
(3, '', 77, 7, '2.4 ГГц'),
(1, '', 77, 7, '2.4 ГГц'),
(2, '', 78, 14, '10.5\"'),
(3, '', 78, 14, '10.5\"'),
(1, '', 78, 14, '10.5\"'),
(2, '', 79, 16, '8650 mAh'),
(3, '', 79, 16, '8650 мА·ч'),
(1, '', 79, 16, '8650 мА·ч'),
(2, '', 80, 5, 'Qualcomm Snapdragon 675'),
(3, '', 80, 5, 'Qualcomm Snapdragon 675'),
(1, '', 80, 5, 'Qualcomm Snapdragon 675'),
(2, '', 81, 7, '2.0 GHz'),
(3, '', 81, 7, '2.0 ГГц'),
(1, '', 81, 7, '2.0 ГГц'),
(2, '', 82, 8, 'Adreno 612'),
(3, '', 82, 8, 'Adreno 612'),
(1, '', 82, 8, 'Adreno 612'),
(2, '', 83, 4, '6 GB'),
(3, '', 83, 4, '6 ГБ'),
(1, '', 83, 4, '6 ГБ'),
(2, '', 84, 11, '32 MP + 5 MP + 8 MP'),
(3, '', 84, 11, '32 Мп + 5 Мп + 8 Мп'),
(1, '', 84, 11, '32 Мп + 5 Мп + 8 Мп'),
(2, '', 85, 12, '32 MP'),
(3, '', 85, 12, '32 Мп'),
(1, '', 85, 12, '32 Мп'),
(2, '', 86, 14, '6.7\"'),
(3, '', 86, 14, '6.7\"'),
(1, '', 86, 14, '6.7\"'),
(2, '', 87, 16, '4500 mAh'),
(3, '', 87, 16, '4500 мА·ч'),
(1, '', 87, 16, '4500 мА·ч'),
(2, '', 88, 14, '6.4\"'),
(3, '', 88, 14, '6.4\"'),
(1, '', 88, 14, '6.4\"'),
(2, '', 89, 16, '4000 mAh'),
(3, '', 89, 16, '4000 мА·ч'),
(1, '', 89, 16, '4000 мА·ч'),
(2, '', 90, 11, '13 MP'),
(3, '', 90, 11, '13 Мп'),
(1, '', 90, 11, '13 Мп'),
(2, '', 91, 14, '6.2\"'),
(3, '', 91, 14, '6.2\"'),
(1, '', 91, 14, '6.2\"'),
(2, '', 92, 16, '3400 mAh'),
(3, '', 92, 16, '3400 мА·ч'),
(1, '', 92, 16, '3400 мА·ч'),
(2, '', 93, 5, 'Exynos 9610'),
(3, '', 93, 5, 'Exynos 9610'),
(1, '', 93, 5, 'Exynos 9610'),
(2, '', 94, 7, '2.3 GHz'),
(3, '', 94, 7, '2.3 ГГц'),
(1, '', 94, 7, '2.3 ГГц'),
(2, '', 95, 8, 'ARM Mali-G72 MP3'),
(3, '', 95, 8, 'ARM Mali-G72 MP3'),
(1, '', 95, 8, 'ARM Mali-G72 MP3'),
(2, '', 96, 9, '512 GB'),
(3, '', 96, 9, '512 ГБ'),
(1, '', 96, 9, '512 ГБ'),
(2, '', 97, 11, '25 MP + 5 MP + 8 MP'),
(3, '', 97, 11, '25 Мп + 5 Мп + 8 Мп'),
(1, '', 97, 11, '25 Мп + 5 Мп + 8 Мп'),
(2, '', 98, 12, '25 MP'),
(3, '', 98, 12, '25 Мп'),
(1, '', 98, 12, '25 Мп'),
(2, '', 99, 5, 'Exynos 9820'),
(3, '', 99, 5, 'Exynos 9820'),
(1, '', 99, 5, 'Exynos 9820'),
(2, '', 100, 7, '2.7 GHz'),
(3, '', 100, 7, '2.7 ГГц'),
(1, '', 100, 7, '2.7 ГГц'),
(2, '', 101, 8, 'Adreno 640'),
(3, '', 101, 8, 'Adreno 640'),
(1, '', 101, 8, 'Adreno 640'),
(2, '', 102, 11, '48 MP + 12 MP + 5 MP'),
(3, '', 102, 11, '48 Мп + 12 Мп + 5 Мп'),
(1, '', 102, 11, '48 Мп + 12 Мп + 5 Мп'),
(2, '', 103, 5, 'Qualcomm Snapdragon 888'),
(3, '', 103, 5, 'Qualcomm Snapdragon 888'),
(1, '', 103, 5, 'Qualcomm Snapdragon 888'),
(2, '', 104, 7, '2.84 GHz'),
(3, '', 104, 7, '2.84 ГГц'),
(1, '', 104, 7, '2.84 ГГц'),
(2, '', 105, 8, 'Adreno 660'),
(3, '', 105, 8, 'Adreno 660'),
(1, '', 105, 8, 'Adreno 660'),
(2, '', 106, 4, '12 GB'),
(3, '', 106, 4, '12 ГБ'),
(1, '', 106, 4, '12 ГБ'),
(2, '', 107, 11, '12 MP + 12 MP + 12 MP'),
(3, '', 107, 11, '12 Мп + 12 Мп + 12 Мп'),
(1, '', 107, 11, '12 Мп + 12 Мп + 12 Мп'),
(2, '', 108, 12, '10 MP'),
(3, '', 108, 12, '10 Мп'),
(1, '', 108, 12, '10 Мп'),
(2, '', 109, 13, 'Dynamic AMOLED'),
(3, '', 109, 13, 'Dynamic AMOLED'),
(1, '', 109, 13, 'Dynamic AMOLED'),
(2, '', 110, 14, '7.6\"'),
(3, '', 110, 14, '7.6\"'),
(1, '', 110, 14, '7.6\"'),
(2, '', 111, 16, '4400 mAh'),
(3, '', 111, 16, '4400 мА·ч'),
(1, '', 111, 16, '4400 мА·ч'),
(2, '', 112, 5, 'Qualcomm Snapdragon 439'),
(3, '', 112, 5, 'Qualcomm Snapdragon 439'),
(1, '', 112, 5, 'Qualcomm Snapdragon 439'),
(2, '', 113, 8, 'Adreno 505'),
(3, '', 113, 8, 'Adreno 505'),
(1, '', 113, 8, 'Adreno 505'),
(2, '', 114, 11, '13 MP + 2 MP'),
(3, '', 114, 11, '13 Мп + 2 Мп'),
(1, '', 114, 11, '13 Мп + 2 Мп'),
(2, '', 115, 14, '5.7\"'),
(3, '', 115, 14, '5.7\"'),
(1, '', 115, 14, '5.7\"'),
(2, '', 116, 2, 'XS'),
(3, '', 116, 2, 'XS'),
(1, '', 116, 2, 'XS'),
(2, '', 117, 2, 'S'),
(3, '', 117, 2, 'S'),
(1, '', 117, 2, 'S'),
(2, '', 118, 2, 'L'),
(3, '', 118, 2, 'L'),
(1, '', 118, 2, 'L'),
(2, '', 119, 2, 'XL'),
(3, '', 119, 2, 'XL'),
(1, '', 119, 2, 'XL'),
(2, '', 120, 2, 'XXL'),
(3, '', 120, 2, 'XXL'),
(1, '', 120, 2, 'XXL'),
(2, '', 121, 2, 'M'),
(3, '', 121, 2, 'M'),
(1, '', 121, 2, 'M'),
(2, '', 122, 5, 'Qualcomm Snapdragon 835'),
(3, '', 122, 5, 'Qualcomm Snapdragon 835'),
(1, '', 122, 5, 'Qualcomm Snapdragon 835'),
(2, '', 123, 7, '2.35 GHz'),
(3, '', 123, 7, '2.35 ГГц'),
(1, '', 123, 7, '2.35 ГГц'),
(2, '', 124, 8, 'Adreno 540'),
(3, '', 124, 8, 'Adreno 540'),
(1, '', 124, 8, 'Adreno 540'),
(2, '', 125, 16, '7300 mAh'),
(3, '', 125, 16, '7300 мА·ч'),
(1, '', 125, 16, '7300 мА·ч'),
(2, '', 126, 5, 'Qualcomm Snapdragon 730'),
(3, '', 126, 5, 'Qualcomm Snapdragon 730'),
(1, '', 126, 5, 'Qualcomm Snapdragon 730'),
(2, '', 127, 7, '2.2 GHz'),
(3, '', 127, 7, '2.2 ГГц'),
(1, '', 127, 7, '2.2 ГГц'),
(2, '', 128, 8, 'Adreno 618'),
(3, '', 128, 8, 'Adreno 618'),
(1, '', 128, 8, 'Adreno 618'),
(2, '', 129, 4, '8 GB'),
(3, '', 129, 4, '8 ГБ'),
(1, '', 129, 4, '8 ГБ'),
(2, '', 130, 11, '48 MP + 8 MP + TOF 3D camera'),
(3, '', 130, 11, '48 Мп + 8 Мп + TOF 3D камера'),
(1, '', 130, 11, '48 Мп + 8 Мп + TOF 3D камера'),
(2, '', 131, 12, '48 MP + 8 MP + TOF 3D camera'),
(3, '', 131, 12, '48 Мп + 8 Мп + TOF 3D камера'),
(1, '', 131, 12, '48 Мп + 8 Мп + TOF 3D камера'),
(2, '', 132, 16, '3700 mAh'),
(3, '', 132, 16, '3700 мА·ч'),
(1, '', 132, 16, '3700 мА·ч'),
(2, '', 133, 5, 'Exynos 7904'),
(3, '', 133, 5, 'Exynos 7904'),
(1, '', 133, 5, 'Exynos 7904'),
(2, '', 134, 7, '1.8 GHz'),
(3, '', 134, 7, '1.8 ГГц'),
(1, '', 134, 7, '1.8 ГГц'),
(2, '', 135, 11, '13 MP + 5 MP + 5 MP'),
(3, '', 135, 11, '13 Мп + 5 Мп + 5 Мп'),
(1, '', 135, 11, '13 Мп + 5 Мп + 5 Мп'),
(2, '', 136, 12, '16 MP'),
(3, '', 136, 12, '16 Мп'),
(1, '', 136, 12, '16 MP'),
(2, '', 137, 16, '5000 mAh'),
(3, '', 137, 16, '5000 мА·ч'),
(1, '', 137, 16, '5000 мА·ч'),
(2, '', 138, 11, '16 MP + 5 MP'),
(3, '', 138, 11, '16 Мп + 5 Мп'),
(1, '', 138, 11, '16 Мп + 5 Мп'),
(2, '', 139, 14, '5.9\"'),
(3, '', 139, 14, '5.9\"'),
(1, '', 139, 14, '5.9\"'),
(2, '', 140, 16, '3100 mAh'),
(3, '', 140, 16, '3100 мА·ч'),
(1, '', 140, 16, '3100 мА·ч');

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
(1, '', 1, 'Интернет-магазин Турбошоп', 'Главная', 'Турбошоп — магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов.', 'Интернет-магазин Турбошоп', '<p>Турбошоп &mdash; магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов. Работаем с проверенными производителями с 2008 года. Доставляем товары точно в срок.</p>\r\n<p>Покупка товара проста только на первый взгляд. Нужно думать о том, как оформить доставку, кто соберет шкаф или установит кондиционер. В нашем магазине эти услуги уже продуманы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход &mdash; наша команда выполнит все задачи!</p>', 'Главная'),
(2, '', 1, 'Online store Turboshop', 'Home', 'Turboshop — a store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.', 'Online store Turboshop', '<p>Turboshop &mdash; a store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles. We have been working with trusted manufacturers since 2008. We deliver products on time.</p>\r\n<p>Buying a product is only simple at first glance. You need to think about how to arrange delivery, who will assemble the wardrobe or install the air conditioner. In our store, these services are already thought out. Just think about selecting products in the catalog. For this, we offer a comprehensive approach &mdash; our team will do all the tasks!</p>', 'Home'),
(3, '', 1, 'Інтернет-магазин Турбошоп', 'Головна', 'Турбошоп — магазин корисних речей для себе, дому, офісу та дачі. Тут ви знайдете товари під свої уподобання: від аудіотехніки та одягу до будівельних матеріалів і велосипедів.', 'Інтернет-магазин Турбошоп', '<p>Турбошоп &mdash; магазин корисних речей для себе, дому, офісу та дачі. Тут ви знайдете товари під свої уподобання: від аудіотехніки та одягу до будівельних матеріалів і велосипедів. Працюємо з перевіреними виробниками з 2008 року. Доставляємо товари вчасно.</p>\r\n<p>Покупка товару проста тільки на перший погляд. Потрібно думати про те, як оформити доставку, хто збере шафу або встановить кондиціонер. У нашому магазині ці послуги вже продумані. Думайте тільки про підбір товарів у каталозі. Для цього пропонуємо комплексний підхід &mdash; наша команда виконає всі завдання!</p>', 'Головна'),
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
(1, '', 12, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Курьерская доставка по Киеву</h2>\r\n<p>Курьерская доставка осуществляется на следующий день после оформления заказа, если товар есть в наличии. Курьерская доставка осуществляется в пределах Киева ежедневно с 10.00 до 21.00. Заказ на сумму свыше 1000 гривен доставляется бесплатно.<br><br>Стоимость бесплатной доставки раcсчитывается от суммы заказа с учтенной скидкой. В случае если сумма заказа после применения скидки менее 1000 грн, осуществляется платная доставка.<br><br>При сумме заказа менее 1000 грн стоимость доставки составляет от 100 грн.</p>\r\n<h2>Самовывоз</h2>\r\n<p>Удобный,&nbsp;бесплатный и быстрый способ получения заказа. Адрес офиса: Киев, ул. Глубочицкая, 32б.</p>\r\n<h2>Доставка с помощью предприятия &laquo;Новая Почта&raquo;</h2>\r\n<p>Удобный и быстрый способ доставки в города Украины. Посылка доставляется в офис &laquo;Новая Почта&raquo; в вашем городе. Для получения необходимо предъявить паспорт и номер грузовой декларации (сообщит наш менеджер после отправки). Посылку желательно получить в течение 24 часов с момента прихода груза, иначе компания &laquo;Новая Почта&raquo; может взыскать с вас дополнительную оплату за хранение. Срок доставки и стоимость вы можете рассчитать на сайте компании.</p>\r\n<h2>Наложенным платежом</h2>\r\n<p>При доставке заказа наложенным платежом с помощью &laquo;Новая Почта&raquo;, вы сможете оплатить заказ непосредственно в момент получения товаров.</p>', 'Доставка'),
(2, '', 12, 'Delivery', 'Delivery', 'Delivery', 'Delivery', '<h2>Shipping within New York</h2>\r\n<p>Courier delivery is made&nbsp;the next day&nbsp;after ordering,&nbsp;if the item is in stock.&nbsp;Courier delivery is made&nbsp;within the New York&nbsp;daily from&nbsp;10.00 to&nbsp;21.00.&nbsp;For orders&nbsp;more than $300 delivered free of charge.<br><br>Cost&nbsp;free delivery is calculated&nbsp;from&nbsp;the total order&nbsp;with&nbsp;the discount&nbsp;taken into account.&nbsp;If the order amount&nbsp;after applying the discount&nbsp;less than $300,&nbsp;is&nbsp;a paid service.</p>\r\n<p>For orders&nbsp;less than $300,&nbsp;the&nbsp;delivery&nbsp;cost is $50.</p>\r\n<h2>Store pickup</h2>\r\n<p>Convenient, free&nbsp;and&nbsp;fast way of receiving your order.</p>\r\n<p>Office address:&nbsp;41 West 40th Street New York, USA</p>\r\n<h2>C.O.D (Cash On Delivery)</h2>\r\n<p>On delivery order cash on delivery through \"mail of USA\", you will be able to pay for the order at the time goods are received.</p>', 'Delivery'),
(3, '', 12, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Кур\'єрська доставка по Києву</h2>\r\n<p>Кур\'єрська доставка здійснюється на наступний день після оформлення замовлення, якщо товар є в наявності. Кур\'єрська доставка здійснюється в межах Києва; щодня з 10.00 до 21.00. Замовлення на суму понад 300 грн доставляється безкоштовно. Вартість безкоштовної доставки Розраховувати від суми замовлення з врахованої знижкою. У разі якщо сума замовлення після застосування знижки менш 300 грн, здійснюється платна доставка. При сумі замовлення менше 300 грн вартість доставки складає від 50 грн.</p>\r\n<h2>Самовивіз</h2>\r\n<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення. Місцезнаходження компанії: Київ, вул. Глибочицька, 32б.</p>\r\n<h2>Доставка за допомогою підприємства &laquo;Нова Пошта&raquo;</h2>\r\n<p>Зручний і швидкий спосіб доставки у великі міста України. Посилка доставляється в офіс &laquo;Нова пошта&raquo; у Вашому місті. Для отримання необхідно пред\'явити паспорт і номер вантажної декларації (повідомить наш менеджер після відправки). Посилку бажано отримати протягом 24 годин з моменту приходу вантажу, інакше компанія &laquo;Нова Пошта&raquo; може стягнути з Вас додаткову оплату за зберігання. Термін доставки і вартість Ви можете розрахувати на сайті компанії.</p>\r\n<h2>Післяплата</h2>\r\n<p>При доставці замовлення післяплатою за допомогою &laquo;Нова Пошта&raquo;, ви зможете оплатити замовлення безпосередньо в момент отримання товарів.</p>', 'Доставка'),
(1, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(2, '', 13, 'Blog', 'Blog', '', 'Blog', '', 'Blog'),
(3, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(1, '', 14, 'Контакты', 'Контакты', 'Контакты', 'Контакты', '', 'Контакты'),
(2, '', 27, 'Licenses', 'Licenses', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Licenses', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>\r\n<blockquote>\r\n<h5>&ldquo; But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. &rdquo;</h5>\r\n</blockquote>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.But I must explain to you how all this mistaken idea of denouncing pleasure and praising.</p>', 'Licenses'),
(3, '', 27, 'Конфіденційність', 'Конфіденційність', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Конфіденційність', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>\r\n<blockquote>\r\n<h5>&ldquo; But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. &rdquo;</h5>\r\n</blockquote>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.But I must explain to you how all this mistaken idea of denouncing pleasure and praising.</p>', 'Конфіденційність'),
(1, '', 27, 'Конфиденциальность', 'Конфиденциальность', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Конфиденциальность', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>\r\n<blockquote>\r\n<h5>&ldquo; But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. &rdquo;</h5>\r\n</blockquote>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.But I must explain to you how all this mistaken idea of denouncing pleasure and praising.</p>', 'Конфиденциальность'),
(2, '', 28, 'Offer', 'Offer', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Offer', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>', 'Offer'),
(3, '', 28, 'Оферта', 'Оферта', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Оферта', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>', 'Оферта'),
(1, '', 28, 'Оферта', 'Оферта', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. ', 'Оферта', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>', 'Оферта'),
(2, '', 14, 'Contacts', 'Contacts', 'Contacts', 'Contacts', '', 'Contacts'),
(3, '', 14, 'Контакти', 'Контакти', 'Контакти', 'Контакти', '', 'Контакти'),
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
(1, '', 22, 'Смартфоны на IOS', 'Смартфоны на IOS', 'Смартфоны операционная система IOS', 'Смартфоны на IOS', '<p>Смартфоны операционная система IOS</p>', 'Смартфоны на IOS'),
(2, '', 22, 'IOS smartphones', 'IOS smartphones', 'Smartphones operating system IOS', 'IOS smartphones', '<p>Smartphones operating system IOS</p>', 'IOS smartphones'),
(1, '', 23, 'Смартфоны на Android', 'Смартфоны на Android', 'Телефоны на «Андроиде» снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться', 'Смартфоны на Android', '<p>Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться.</p>\r\n<p>Покупка смартфона Android &mdash; отличное решение и для тех, кто желает быстро получать актуальные обновления и пользоваться всеми возможностями, предоставляемыми ОС. Многие известные производители, конкурируя друг с другом, предлагают покупателям новые модели телефонов на Android в любых ценовых категориях.</p>', 'Смартфоны на Android'),
(3, '', 22, 'Смартфони на IOS', 'Смартфони на IOS', 'Смартфони операційна система IOS', 'Смартфони на IOS', '<p>Смартфони операційна система IOS</p>', 'Смартфони на IOS'),
(1, '', 21, 'Смартфоны Samsung', 'Смартфоны Samsung', 'Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.', 'Смартфоны Samsung', '<p>Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.</p>', 'Смартфоны Samsung'),
(2, '', 21, 'Samsung smartphones ', 'Samsung smartphones ', 'Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.', 'Samsung smartphones ', '<p>Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.</p>', 'Samsung smartphones '),
(3, '', 21, 'Смартфони Samsung', 'Смартфони Samsung', 'Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.', 'Смартфони Samsung', '<p>Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.</p>', 'Смартфони Samsung'),
(2, '', 23, 'Android smartphones', 'Android smartphones', 'Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.', 'Android smartphones', '<p>Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.</p>\r\n<p>Buying an Android smartphone is also an excellent solution for those who want to quickly receive up-to-date updates and use all the features provided by the OS. Many well-known manufacturers, competing with each other, offer customers new models of Android phones in any price range</p>', 'Android smartphones'),
(2, '', 24, 'Apple smartphones', 'Apple smartphones', 'Apple smartphones are presented in a wide range', 'Apple smartphones', '<p>Apple smartphones are presented in a wide range</p>', 'Apple smartphones'),
(3, '', 24, 'Смартфони Apple', 'Смартфони Apple', 'Смартфони Apple представлені в широкому асортименті', 'Смартфони Apple', '<p>Смартфони Apple представлені в широкому асортименті</p>', 'Смартфони Apple'),
(3, '', 23, 'Смартфони на Android', 'Смартфони на Android', 'Телефони на «Андроїд» забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися', 'Смартфони на Android', '<p>Телефони на &laquo;Андроїд&raquo; забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися.</p>\r\n<p>Купівля смартфона Android - відмінне рішення і для тих, хто бажає швидко отримувати оновлення й пакети користуватися всіма можливостями, наданими ОС. Багато відомих виробників, конкуруючи один з одним, пропонують покупцям нові моделі телефонів на Android в будь-яких цінових категоріях.</p>', 'Смартфони на Android'),
(1, '', 24, 'Смартфоны Apple', 'Смартфоны Apple', 'Смартфоны Apple представлены в широком ассортименте', 'Смартфоны Apple', '<p>Смартфоны Apple представлены в широком ассортименте</p>', 'Смартфоны Apple'),
(1, '', 25, 'Часто задаваемые вопросы', 'Часто задаваемые вопросы', 'Часто задаваемые вопросы', 'Часто задаваемые вопросы', '', 'Часто задаваемые вопросы'),
(2, '', 25, 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 'FAQ'),
(3, '', 25, 'Часті питання', 'Часті питання', 'Часті питання', 'Часті питання', '', 'Часті питання'),
(1, '', 26, 'Отзывы', 'Отзывы', 'Отзывы', 'Отзывы', '<p>Мы благодарны нашим клиентам за оказанное доверие и положительные отзывы о сотрудничестве с нашим интернет-магазином. Если хотите, можем помочь и вам: подберем подходящие товары и сопутствующие услуги. Просто свяжитесь с нами!</p>', 'Отзывы'),
(2, '', 26, 'Reviews', 'Reviews', 'Reviews', 'Reviews', '<p>We are grateful to our customers for their trust and positive feedback on cooperation with our online store. If you want, we can help you too: we will select suitable products and related services. Just contact us!</p>', 'Reviews'),
(3, '', 26, 'Відгуки', 'Відгуки', 'Відгуки', 'Відгуки', '<p>Ми вдячні нашим клієнтам за довіру та позитивні відгуки про співпрацю з нашим інтернет-магазином. Якщо хочете, можемо допомогти і вам: підберемо відповідні товари та супутні послуги. Просто зв\'яжіться з нами!</p>', 'Відгуки'),
(2, '', 29, 'About shop', 'About shop', 'Turboshop an online store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.', 'About shop', '<p>Turboshop &mdash; an online store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.</p>\r\n<p>We have been operating since 2008, so we have identified reliable partners through personal experience. We cooperate with trusted manufacturers whose products meet standards. As well as &mdash; with delivery services that deliver orders on time.</p>\r\n<h3>Excellent customer service!</h3>\r\n<p>Our managers &mdash; assistants and consultants. They will help you choose the size of the T-shirt, the model of the laptop, and the wardrobe for the living room. They will also advise on how to place an order and make a payment. Managers answer questions in the online chat and through feedback forms. The average response time is 10 minutes.</p>\r\n<blockquote>We consider the history of purchases and communication to personalize responses and offers. It is important for us to solve the issue quickly and efficiently. Building long-term relationships &mdash; one of the main goals. We understand that it is easier to buy goods in a store where preferences are already known and help with the choice.</blockquote>\r\n<h3>Comprehensive approach to products and services</h3>\r\n<p>Buying a product is only simple at first glance. You need to think about how to arrange delivery, who will lift the wardrobe to the 8th floor and install the air conditioner in the bedroom. In our store, these processes are already set up. Just think about selecting products in the catalog. For this, we offer a comprehensive approach &mdash; our team will do all the tasks!</p>\r\n<ul>\r\n<li>Delivery of goods to the apartment within 24 hours.</li>\r\n<li>A manager who knows the details of the orders.</li>\r\n<li>Services for installation, setup, connection, and others.</li>\r\n</ul>\r\n<p>We will make life brighter, cozier, and more comfortable. In our online store, you will find the product you need. If you have any questions, write to the online chat. We will be happy to help with the choice and provide details of the order.</p>', 'Shop'),
(3, '', 29, 'Про магазин', 'Про магазин', 'Турбошоп інтернет-магазин корисних речей для себе, дому, офісу та дачі. Тут ви знайдете товари під свої уподобання: від аудіотехніки та одягу до будівельних матеріалів і велосипедів.', 'Про магазин', '<p>Турбошоп &mdash; інтернет-магазин корисних речей для себе, дому, офісу та дачі. Тут ви знайдете товари під свої уподобання: від аудіотехніки та одягу до будівельних матеріалів і велосипедів.</p>\r\n<p>Працюємо з 2008 року, тому на власному досвіді виявили надійних партнерів. Співпрацюємо з перевіреними виробниками, чиї товари відповідають стандартам. А також &mdash; зі службами доставки, які привозять замовлення вчасно.</p>\r\n<h3>Клієнтський сервіс на висоті!</h3>\r\n<p>Наші менеджери &mdash; помічники та консультанти. Допоможуть підібрати розмір футболки, модель ноутбука і шафу у вітальню. А також підкажуть, як оформити замовлення та здійснити оплату. Менеджери відповідають на запитання в онлайн-чаті та через форми зворотного зв\'язку. Середній час відповіді &mdash; 10 хвилин.</p>\r\n<blockquote>Враховуємо історію покупок і спілкування, щоб персоналізувати відповіді та пропозиції. Нам важливо вирішити питання швидко і якісно. Формування довгострокових відносин &mdash; одна з головних цілей. Розуміємо, що легше купувати товари в магазині, де вподобання вже знають і допомагають з вибором.</blockquote>\r\n<h3>Комплексний підхід до товарів і послуг</h3>\r\n<p>Покупка товару проста тільки на перший погляд. Потрібно думати про те, як оформити доставку, хто підніме на 8 поверх шафу і встановить кондиціонер у спальню. У нашому магазині ці процеси вже створені. Думайте тільки про підбір товарів у каталозі. Для цього пропонуємо комплексний підхід &mdash; наша команда виконає всі завдання!</p>\r\n<ul>\r\n<li>Доставка товарів до квартири протягом 24 годин.</li>\r\n<li>Менеджер, який знає деталі замовлень.</li>\r\n<li>Послуги з монтажу, встановлення, підключення та інші.</li>\r\n</ul>\r\n<p>Зробимо життя яскравішим, затишнішим і комфортнішим. У нашому інтернет-магазині знайдеться товар, який потрібен саме вам. Якщо виникнуть питання, пишіть в онлайн-чат. Із задоволенням допоможемо з вибором і підкажемо деталі замовлення.</p>', 'Магазин'),
(1, '', 29, 'О магазине', 'О магазине', 'Турбошоп интернет-магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов.', 'О магазине', '<p>Турбошоп &mdash; интернет-магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов.</p>\r\n<p>Работаем с 2008 года, поэтому на личном опыте выявили надежных партнеров. Сотрудничаем с проверенными производителями, чьи товары соответствуют гостам. А также &mdash; со службами доставки, которые привозят заказы в срок.</p>\r\n<h3>Клиентский сервис на высоте!</h3>\r\n<p>Наши менеджеры &mdash; помощники и консультанты. Помогут подобрать размер футболки, модель ноутбука и шкаф в гостиную. А также подскажут, как оформить заказ и совершить оплату. Менеджеры отвечают на вопросы в онлайн-чате и через формы обратной связи. Среднее время ответа &mdash; 10 минут.</p>\r\n<blockquote>Учитываем историю покупок и общения, чтобы персонализировать ответы и предложения. Нам важно решить вопрос быстро и качественно. Формирование долгосрочных отношений &mdash; одна из главных целей. Понимаем, что проще покупать товары в магазине, где предпочтения уже знают и помогают с выбором.</blockquote>\r\n<h3>Комплексный подход к товарам и услугам</h3>\r\n<p>Покупка товара проста только на первый взгляд. Нужно думать о том, как оформить доставку, кто поднимет на 8 этаж шкаф и установит кондиционер в спальню. В нашем магазине эти процессы уже созданы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход &mdash; наша команда выполнит все задачи!</p>\r\n<ul>\r\n<li>Доставка товаров до квартиры в течение 24 часов.</li>\r\n<li>Менеджер, который знает детали заказов.</li>\r\n<li>Услуги по монтажу, установке, подключению и другие.</li>\r\n</ul>\r\n<p>Сделаем жизнь ярче, уютнее и комфортнее. В нашем интернет-магазине найдется товар, который нужен именно вам. Если возникнут вопросы, пишите в онлайн-чат. С удовольствием поможем с выбором и подскажем детали заказа.</p>', 'Магазин'),
(2, '', 30, 'Business advice', 'Business advice', '', 'Business advice', '', 'Business advice'),
(3, '', 30, 'Бізнес-поради', 'Бізнес-поради', '', 'Бізнес-поради', '', 'Бізнес-поради'),
(1, '', 30, 'Бизнес-советы', 'Бизнес-советы', '', 'Бизнес-советы', '', 'Бизнес-советы'),
(2, '', 31, 'Project management', 'Project management', '', 'Project management', '', 'Project management'),
(3, '', 31, 'Управління проектами', 'Управління проектами', '', 'Управління проектами', '', 'Управління проектами'),
(1, '', 31, 'Управление проектами', 'Управление проектами', '', 'Управление проектами', '', 'Управление проектами'),
(2, '', 32, 'Increased sales', 'Increased sales', '', 'Increased sales', '', 'Increased sales'),
(3, '', 32, 'Підвищення продажів', 'Підвищення продажів', '', 'Підвищення продажів', '', 'Підвищення продажів'),
(1, '', 32, 'Повышение продаж', 'Повышение продаж', '', 'Повышение продаж', '', 'Повышение продаж'),
(2, '', 33, 'Requisites', 'Requisites', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Requisites', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Requisites');
INSERT INTO `t_lang_pages` (`lang_id`, `lang_label`, `page_id`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `header`) VALUES
(3, '', 33, 'Реквізити', 'Реквізити', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Реквізити', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Реквізити'),
(1, '', 33, 'Реквизиты', 'Реквизиты', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Реквизиты', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Реквизиты'),
(2, '', 34, 'Shops', 'Shops', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Shops', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Shops'),
(3, '', 34, 'Магазини', 'Магазини', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Магазини', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Магазини'),
(1, '', 34, 'Магазины', 'Магазины', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Магазины', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Магазины'),
(2, '', 35, 'Certificates', 'Certificates', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Certificates', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Certificates'),
(3, '', 35, 'Сертифікати', 'Сертифікати', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Сертифікати', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Сертифікати'),
(1, '', 35, 'Сертификаты', 'Сертификаты', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Сертификаты', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 'Сертификаты'),
(2, '', 36, 'Information', 'Information', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Information', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Information'),
(3, '', 36, 'Інформація', 'Інформація', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Інформація', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Інформація'),
(1, '', 36, 'Информация', 'Информация', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Информация', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Информация'),
(2, '', 37, 'Help', 'Help', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Help', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Help'),
(3, '', 37, 'Довідка', 'Довідка', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Довідка', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Довідка'),
(1, '', 37, 'Помощь', 'Помощь', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Помощь', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 'Помощь');

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
(1, '', 2, 'Liqpay', '<p>LiqPay &mdash; платежная система, позволяющая проводить оплату банковскими картами MasterСard и VISA, а также наличными через терминалы самообслуживания Приватбанка. Оплата возможна после входа в аккаунт через номер мобильного телефона.</p>'),
(2, '', 2, 'Liqpay', '<p>LiqPay is a payment system that allows you to pay with MasterCard and VISA credit cards, as well as in cash through Privatbank self-service terminals. Payment is possible after entering the account through a mobile phone number.</p>'),
(1, '', 3, 'Оплата курьеру', '<p>Если вы не хотите предварительно оплачивать заказ, у вас есть возможность рассчитаться с курьером наличными в момент получения посылки. Чтобы процесс был максимально комфортным и для вас, и для курьера, рекомендуем заранее подготовить нужную сумму.</p>'),
(3, '', 2, 'Liqpay', '<p>LiqPay - платіжна система, що дозволяє проводити оплату банківськими картами MasterСard і VISA, а також готівкою через термінали самообслуговування Приватбанку. Оплата можлива після входу в обліковий запис через номер мобільного телефону.</p>'),
(2, '', 3, 'Cash Payment', '<p>If you do not want to pre-pay the order, you have the opportunity to pay the courier in cash at the time of receipt of the parcel. To make the process as comfortable as possible for both you and the courier, we recommend that you prepare the required amount in advance.</p>'),
(1, '', 4, 'PayPal', '<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>'),
(3, '', 3, 'Оплата кур\'єру', '<p>Якщо ви не хочете попередньо оплачувати замовлення, у вас є можливість розрахуватися з кур\'єром готівкою в момент отримання посилки. Щоб процес був максимально комфортним і для вас, і для кур\'єра, рекомендуємо заздалегідь підготувати потрібну суму.</p>'),
(2, '', 4, 'PayPal', '<p>PayPal is a global e-commerce business allowing payments and money transfers to be made through the Internet. Online money transfers serve as electronic alternatives to paying with traditional paper methods, such as checks and money orders.</p>'),
(3, '', 4, 'PayPal', '<p>Робіть покупки безпечно, без розкриття інформації про свою кредитну картку. PayPal захистить вас, якщо виникнуть проблеми з покупкою.</p>'),
(1, '', 5, 'WayForPay', '<p>WayForPay &mdash; это онлайн-сервис с оплатой через банковские карты платежных систем VISA и MasterCard. Доступные методы платежа: Приват 24, терминал, сервис обслуживает прием платежей через систему Bitcoin.</p>'),
(2, '', 5, 'WayForPay', '<p>WayForPay is an online service with payment through bank cards of VISA and MasterCard payment systems. Available payment methods: Privat 24, terminal, the service serves the acceptance of payments through the Bitcoin system.</p>'),
(3, '', 5, 'WayForPay', '<p>WayForPay - це онлайн-сервіс з оплатою через банківські картки платіжних систем VISA і MasterCard. Доступні методи платежу: Приват 24, термінал, сервіс обслуговує прийом платежів через систему Bitcoin.</p>'),
(2, '', 6, 'Fondy', '<p>Fondy is an international payment service for entrepreneurs from all over the world.</p>'),
(3, '', 6, 'Fondy', '<p>Fondy &ndash; це міжнародний платіжний сервіс для підприємців із усього світу.</p>'),
(1, '', 6, 'Fondy', '<p>Fondy &ndash; это международный платежный сервис для предпринимателей со всего мира.</p>');

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
(1, '', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br><br>iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br><br><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br><br>iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br><br><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br><br>Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br><br><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br><br>iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br><br><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br><br>Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br><br><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br><br>Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br><br><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br><br>Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br><br><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br><br>На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br><br><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br><br>Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. '),
(1, '', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br><br>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br><br><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br><br>Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br><br><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br><br>Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br><br><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br><br>Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br><br><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br><br>Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br><br><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br><br>Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br><br><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br><br>Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br><br><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br><br>Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br><br><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br><br>Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br><br><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br><br>В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br><br><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br><br>Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br><br><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br><br>Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме. '),
(1, '', 3, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br><br>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br><br><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br><br>Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br><br><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br><br>Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br><br><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br><br>Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br><br><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br><br>iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br><br><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br><br>Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br><br><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br><br>Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br><br><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br><br>Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br><br><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br><br>Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br><br><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br><br>Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br><br><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br><br>iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br><br><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br><br>Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br><br><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br><br>На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br><br><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br><br>В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br><br><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br><br>Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone'),
(1, '', 4, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'DJI Mavic Air – новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.'),
(1, '', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'DJI Mavic Pro Fly More Combo – модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.'),
(1, '', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'DJI Phantom 4 Pro – модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. '),
(1, '', 7, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. '),
(1, '', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. '),
(1, '', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.\r\n'),
(1, '', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.'),
(1, '', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 — это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.'),
(1, '', 12, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br><br>Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br><br><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br><br>Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br><br><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br><br>Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br><br><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br><br>Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br><br>Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br><br><strong>SAMSUNG HEALTH</strong>&nbsp;<br><br>С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br><br><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br><br>Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br><br>Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br><br><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br><br>Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br><br><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br><br>Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br><br><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br><br>Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br><br><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br><br>С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br><br><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br><br>Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов. '),
(1, '', 13, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br><br>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br><br><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br><br>Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br><br><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br><br>Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br><br><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br><br>Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br><br><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br><br>Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br><br><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br><br>Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 14, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br><br>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br><br><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br><br>Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br><br><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br><br>Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br><br><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br><br>Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br><br><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br><br>Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br><br><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br><br>Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 15, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br><br>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br><br><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br><br>Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br><br><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br><br>Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br><br><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br><br>Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br><br><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br><br>Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br><br><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br><br>Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.'),
(1, '', 16, 'Apple AirPods', '<p>Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;Это вещи самодостаточные и часто уникальные.&nbsp;Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей. Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</p>', '<h2>Магия звука</h2>\r\n<p>Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;Это вещи самодостаточные и часто уникальные.&nbsp;Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</p>\r\n<h2>Зачем наушников процессор?</h2>\r\n<p>В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</p>\r\n<h2>Достойная автономность</h2>\r\n<p>Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение. Это вещи самодостаточные и часто уникальные. Именно так можно охарактеризовать и Apple AirPods.Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.'),
(1, '', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. '),
(1, '', 18, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br>Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Смартфоны', 'Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. '),
(1, '', 19, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold 5G &mdash; один из самых необычных технологических решений на рынке, который отобрал привлекательный экран.</p>', '<p>Samsung Galaxy Fold 5G &mdash; один из самых необычных технологических решений на рынке, который отобрал привлекательный экран. Смартфон находится в разборном корпусе, в котором имеется небольшой запас габаритов. На переднюю панель Samsung Galaxy Fold 5G внесен 4,6-дюймовый динамический AMOLED-экран с разрешением 1960х840 пикселей.</p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Samsung Galaxy Fold 5G — один из самых необычных технологических решений на рынке, который отобрал привлекательный экран'),
(1, '', 20, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. '),
(1, '', 21, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Смартфоны', 'Самсунг Галакси A30 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.'),
(1, '', 22, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 23, 'Samsung Galaxy A50 Black', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A50 Black', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.'),
(1, '', 24, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.'),
(1, '', 25, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 — отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.'),
(1, '', 26, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.'),
(1, '', 27, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 — замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.'),
(1, '', 28, 'Samsung Galaxy A2', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.</p>', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобильные телефоны', 'Самсунг Галакси A2 Core — отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.'),
(1, '', 29, 'Samsung Galaxy A80', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx. Оснащен очень мощным аккумулятором на 3700 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте! Подробней с техническими характеристиками смартфона Galaxy A80 можно ознакомиться ниже.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.'),
(1, '', 30, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p'),
(1, '', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>', '<p>ВЕЛИКОЛЕПНАЯ СЕМЕРКА</p>\r\n<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>\r\n<p>ПРИТЯГИВАЕТ ВНИМАНИЕ</p>\r\n<p>iPhone 7 притягивает к себе внимание. Уникальный цвет &laquo;черный оникс&raquo; радует глаз благородной игрой света на глянцевой поверхности и гранях. Корпус защищен от брызг и воды. Обновлены кнопка &laquo;Домой&raquo; и дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОМОЙ&raquo;</p>\r\n<p>Стала сенсорной и получила чувствительность к силе нажатия. Благодаря встроенному Taptic Engine тактильный отклик при нажатии получил несколько уровней интенсивности. Чем сильнее нажатие на кнопку, тем сильнее отклик телефона &mdash; это новый опыт использования и восприятия.</p>\r\n<p>ВЛАГОЗАЩИТА КОРПУСА</p>\r\n<p>Конструкция корпуса iPhone изменилась и внутри. Смартфон нового поколения защищен по стандарту IP67 от влаги и пыли.</p>\r\n<p>КАРДИНАЛЬНО НОВЫЙ ВЗГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 установлен новый модуль камеры с 6-линзовым объективом со светосилой &fnof;/1.8 и оптической стабилизацией. Сенсор стал в 2 раза быстрее. Вспышка с 4 диодами. Специальный ISP-процессор управляет работой камеры. Все это выводит качество снимков на новый уровень, особенно в условиях недостаточной освещенности. Фронтальная камера оснащена сенсором 7 Мп с улучшенным цветовым диапазоном. Получить четкие и яркие селфи теперь еще проще.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильные телефоны', 'Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка «Домой» теперь поддерживает Force Touch.'),
(1, '', 32, 'Samsung Galaxy S7', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px.</p>', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ик-порт, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобильные телефоны', 'Самсунг Галакси S7 — замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн.'),
(1, '', 33, 'Apple iPhone X', '<p>Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;с переосмысленной системой управления.&nbsp;</p>', '<p>&nbsp;Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;<br>с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благодаря мощнейшей внутренней 64 битной архитектуре. Разительно улучшенная самая популярная в мире мобильная камера.&nbsp;<br>Именно таким видит свой флагманский смартфон компания Apple в 2017 году.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобильные телефоны', 'Apple iPhone X – воплощение лучших инновационных решений. Абсолютно новый дизайн с переосмысленной системой управления. '),
(2, 'en', 1, 'Apple iPad mini', '<p>7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.</p>', '<p><strong>REALLY BIG</strong>&nbsp;<br><br>The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.&nbsp;<br><br><strong>COMPACT. PORTABLE. POCKET-ABLE</strong>&nbsp;<br><br>The iPad mini is incredibly compact and lightweight, making it easy to keep you company wherever you go. It weighs less than 400g and is 6.1mm thick and fits perfectly in a pocket or bag. It is very comfortable to hold in your hand and can be quickly pulled out of your pocket when inspiration calls for it.&nbsp;<br><br><strong>PERFORMANCE GOES BEYOND SIZE</strong>&nbsp;<br><br>The power and intelligence of iPad mini comes from the A12 Bionic Processor with Neural Engine. Using machine learning technologies, the processor quickly recognizes patterns, suggests options, and learns from experience. Work in Adobe Photoshop CC, augmented reality, immersive games with console-level graphics - there\'s enough power for everything.&nbsp;<br><br><strong>It\'s NOT THE DISPLAY SIZE, IT\'S THE PIXEL QUALITY</strong>&nbsp; <br><br>iPad mini has a stunning 7.9-inch display with over 3 million pixels. And Apple made the most of each. High brightness, wide color gamut, and anti-reflective coating make iPad mini perfect for any environment. Whether you\'re reading a book in the park or editing a video at home, images and text will always look as clear and natural as possible. And True Tone technology automatically adjusts white balance based on lighting, so colors look even more natural.&nbsp;<br><br><strong>STAY CONNECTED. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad mini let you capture amazing photos and videos. And that\'s not all. You can FaceTime with friends, scan documents, make notes on them, or even plan furniture rearrangements using AR (augmented reality) technology.&nbsp;<br><br><strong>APPLE PENCIL. FIT GREAT</strong>&nbsp;<br><br>Apple Pencil (sold separately) brings a million new possibilities to iPad. With it, iPad mini will turn into an incredibly convenient digital notebook. Take handwritten notes, fill out forms, and sign documents. Or get creative and sketch and draw on the go.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF YOUR IPAD</strong>&nbsp;<br><br>With iOS, the compact iPad mini lets you do the things you want iPad to do. Use multiple applications at the same time, move files with simple multi-touch gestures, open your favorite applications from the Dock. And with the Files app, all your content is always at your fingertips.&nbsp;<br><br><strong>A MILLION POSSIBILITIES IN ONE IPAD MINI</strong>&nbsp;<br><br>On iPad mini installed excellent Apple applications for everyday tasks - Photos, Maps, Messages, Mail, Safari and others. And there are over a million more iPad apps available in the App Store, making it easy to find the ones you need. Edit videos, socialize, sketch or immerse yourself in exciting online games.&nbsp;<br><br><strong>YOUR DATA BELONG TO YOU ONLY</strong>&nbsp;<br><br>How and all Apple products, iPad mini has been designed with strict privacy guidelines in mind. Touch ID is a simple and secure authentication system for iPad mini. And with Apple Pay, you can pay for purchases quickly and securely. Just touch the Touch ID sensor and you\'re done.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Tablets', 'JUST AS BIG The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine '),
(2, 'en', 2, 'Samsung Galaxy Tab', '<p>Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for entertainment and multitasking.</p>', '<p><strong>MULTITASKING WITHOUT LIMITS</strong>&nbsp;<br><br>Designed with your busy lifestyle and need to constantly work on the go, the new Samsung Galaxy Tab S4 is your ultimate entertainment and entertainment companion. multitasking.&nbsp;<br><br><strong>SAMSUNG DEX TO MAKE YOUR WORK PRODUCTIVE</strong>&nbsp;<br><br>Samsung DeX is now compatible with the Samsung Galaxy Tab for the first time S4. Now the high productivity of work on the PC has become available on the tablet. Multitasking is available via an HDMI adapter without the need for a Samsung DeX dock or DeX pad, and you can add a keyboard, mouse or monitor for greater efficiency.&nbsp;<br><br><strong>READY TO WORK</strong>&amp;nbsp ;<br><br>Everything is at hand for the working mode. The desktop on the screen of the Galaxy Tab S4 tablet is implemented as on a regular PC, i.e. with a taskbar, multi-window support and file drag and drop functionality. If you want to have a familiar desktop on your screen, just launch Samsung DeX from the Quick Access Toolbar and add an Android compatible keyboard and mouse.&nbsp;<br><br><strong>WORK MORE EFFICIENTLY</strong>&nbsp;&lt; br /&gt;<br>The productivity of your work depends on how comfortable the working environment is. This is where using Samsung DeX with an external monitor can help. On a large monitor screen, you can continue to use the Android interface of your tablet. Or look at the monitor and use the tablet as a touchpad, pad with S Pen or touch keyboard.&nbsp;<br><br><strong>IT IS NOT OFF - IT IS IN STANDBY MODE</strong>&nbsp;<br><br>If you have a new idea, capture it on the tablet screen so you don\'t forget. With the Galaxy Tab S4\'s off-screen note-taking feature, you can quickly jot down your thoughts even on a black screen with the versatile S Pen. The thinnest 0.7mm rubber tip lets you easily and accurately take notes and sketch.&nbsp;<br><br><strong>IMPROVED PERFORMANCE</strong>&nbsp;<br><br>Speed Samsung Galaxy Tab S4\'s LTE data transfer rate is up to 1Gbps, so you\'ll have plenty of time to do other things. And with 64GB of onboard storage, expandable up to 400GB with a microSD card slot, you\'ll have plenty of room to store your documents and videos.&nbsp;<br><br><strong>DIVE DOWN ENTERTAINMENT ATMOSPHERE</strong>&nbsp;<br><br>Despite its compact size, the Galaxy Tab S4 has a large visual workspace. Thanks to the narrowest possible frame and the absence of the Samsung logo and the Home button, the screen diagonal is actually 10.5 inches. And the enhanced 16:10 aspect ratio of the sAMOLED screen creates a more immersive viewing experience for your favorite content.&nbsp;<br><br><strong>SURROUND YOURSELF WITH HIGH QUALITY SOUND</strong>&nbsp;<br><br>Four speakers, tuned by the world famous AKG company, provide sound like in real life. Now you can experiment with the adaptive audio feature created by the experts at AKG. And Dolby Atmos delivers immersive 3D sound for a lifelike experience.&nbsp;<br><br><strong>WATCH VIDEOS WITHOUT TIME</strong>&nbsp;<br>&lt; br /&gt;Galaxy Tab S4 is equipped with a 7300 mAh battery that allows you to watch videos up to 16 hours, so you can watch your favorite movies or series without thinking about the time. And if the battery runs out, you can fully charge it in just 200 minutes thanks to the quick charge function.&nbsp;<br><br><strong>USEFUL EVEN IN STANDBY MODE</strong>&nbsp;<br>&lt; br /&gt;In sleep mode, the Galaxy Tab S4 turns into a smart home display. If the tablet is charging or \"sleeping\", then using the Daily Board function, you can set the display mode for your favorite photos on the screen. In addition, the tablet can be a useful assistant and display on the screen not only the current weather forecast, but also the date and time, acting as a calendar.&nbsp;<br><br><strong>UNLOCKING WITH THE HELP OF THE IRIS</strong> &nbsp;<br><br>In addition to face recognition, the Galaxy Tab S4 now supports iris scanning. To unlock your tablet, just scan your face or iris. Built-in encryption and a secure folder, combined with bio-identification functions, will ensure the safety of your files and applications.&nbsp;<br><br><strong>MULTIPLE SECURITY SYSTEM</strong>&nbsp;<br><br>Keep your data is secure. The Samsung Knox security platform is activated from the moment you turn on your tablet. Multi-layered real-time security puts your data in a secure folder that only you have access to. Keep your work and personal data separate.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Tablets', 'MULTITASKING WITHOUT LIMITS Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for multitasking and entertainment.'),
(2, 'en', 3, 'Apple iPad Air', '<p>iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g, so you can easily carry it with you wherever you go.</p>', '<p><strong>TO ALL THE LOVE OF POWERFUL TECHNOLOGY</strong>&nbsp;<br><br>iPad Air gives you access to Apple\'s most advanced designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g so you can easily carry it with you.&nbsp;<br><br><strong>EVERYTHING YOU NEED. NO WEIGHT</strong>&nbsp;<br><br>Despite the large 10.5-inch Retina display, iPad Air is very compact. It is great for solving a variety of tasks literally on the go. To do this, it is equipped with the most advanced wireless technology, as well as a battery that lasts up to 10 hours without recharging. That\'s almost a whole day.&nbsp;<br><br><strong>POWER ENOUGH FOR EVERYTHING, AT ONCE</strong>&nbsp;<br><br>The power and intelligence of iPad Air comes from the A12 Bionic processor with Neural Engine. The processor uses real-time machine learning technology to deliver incredible experiences for photography, gaming, augmented reality and more. You can edit videos, make impressive presentations, design 3D models, watch your favorite series online. And do it all at the same time.&nbsp;<br><br><strong>SUPER-FAST GRAPHICS FOR GAMES AND APPS</strong>&nbsp;<br><br>Stunning AR performance, incredible graphics experience , photorealistic graphics in 3D games - the 4-core graphics system of the A12 Bionic processor is behind it all.&nbsp;<br><br><strong>EVERYTHING IS DONE BEAUTIFUL</strong>&nbsp;<br><br>iPad Air features a 10.5-inch Retina display with wide color gamut. I want to look at this display endlessly. Photos, videos and games look alive and natural down to the smallest detail. And regardless of the environment, True Tone technology, increased brightness and anti-reflective coating help to ensure the highest quality image.&nbsp;<br><br><strong>TRUE TONE. EASY ON THE EYES IN ANY LIGHT</strong>&nbsp;<br><br>True Tone technology automatically adjusts white balance based on ambient light. Therefore, the image on the display looks more natural and comfortable for the eyes in any conditions - both during the evening reading and when you paint a sunny landscape in the open air.&nbsp;<br><br><strong>Keep in touch. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad Air let you capture stunning photos and 1080p HD video. And that\'s not all. You can communicate via FaceTime with several interlocutors, scan and immediately send documents. And even create your own worlds - iPad Air cameras work great with augmented reality technologies (augmented reality).&nbsp;<br><br><strong>PLAY, WORK AND BE CREATIVE IN Augmented Reality</strong>&nbsp;<br><br>When virtual objects and data become part of the real world, completely new horizons open up before you. With front and rear cameras, an A12 Bionic processor with Neural Engine, a large natural color display, and accurate motion tracking, iPad is the perfect device for living in augmented reality.&nbsp;<br><br><strong>SEND. DRAW. FOLLOW INSPIRATION</strong>&nbsp;<br><br>Apple Pencil (sold separately) captures hand movements with amazing precision and speed. It is comfortable to hold in your hand like a regular pencil. However, he can do much more. With Apple Pencil, your iPad Air can become a notepad or an artist\'s canvas - you have many options.&nbsp;<br><br><strong>TAKE NOTES. COMMENT ON DOCUMENTS AND SCREENSHOTS. AND MORE</strong>&nbsp;<br><br>Taking notes or jotting down ideas on iPad Air is as easy as writing on a piece of paper. You can mark up documents, add pictures to your notes, take screenshots, and add comments to them.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF IPAD</strong>&nbsp;<br><br>iOS is an advanced mobile operating system that lets you control your iPad Air with simple taps. Apple calls them gestures, and they give you full access to all of the iPad Air\'s large display and smart technologies. With the multitasking feature, you can use your favorite applications at the same time - just select them from the Dock. And files can be moved from one application to another and sorted in the Files app in any way you like.&nbsp;<br><br><strong>ALL YOUR FILES HAVE BEEN GONE</strong>&nbsp;<br><br>The Files app lets you work with content that can be stored on your iPad Air, iCloud Drive, or other cloud services such as Box and Dropbox. Either way, your files will always be available - easy and simple.&nbsp;<br><br><strong>YOUR IPAD MAKES YOUR INTEREST</strong>&nbsp;<br><br>The iPad Air comes with excellent</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Tablets', 'iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. '),
(2, 'en', 4, 'DJI Mavic Air', '<p>DJI Mavic Air is a new compact drone that is even smaller, faster, more reliable and more comfortable to fly.</p>', '<p>The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. Its main advantage is the expanded functionality of the camera, which can now create spherical panoramas, ideal for viewing with virtual reality glasses. In addition, several selfie video scenarios are available to the user - slow distance, orbiting, spiraling, a sharp rise and an imitation of a boomerang flight.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Quadcopters', 'The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. '),
(2, 'en', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo is a model of an unmanned aerial vehicle from a famous manufacturer. More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</p>', '<p>Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer. More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements. You can take it with you on trips, outdoor photo shoots, sports competitions and any other events.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Quadcopters', 'Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.'),
(2, 'en', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro is an upgraded model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.</p>', '<p>Quadcopter&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps. Such characteristics allow you to create full-size burst photos at up to 14 frames per second, as well as record videos with C4K resolution (4096 x 2160) and a frame rate of up to 60 per second. The user only needs to select the appropriate memory card &ndash; its maximum volume reaches 128 GB.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Improved dynamic capabilities</strong>. Despite the upgrade of the technical part, the mass of the quadrocopter has not increased &ndash; this was facilitated by the use of a frame made of magnesium, aluminum and titanium. The device can spend up to 30 minutes in the air, rising to a height of up to 6 kilometers above sea level. The maximum horizontal flight speed is 20 m / s (72 km / h), and the rise &ndash; 6 m/s (21.6 km/h). An advanced dual-band radio control system allows the aircraft to exchange signals with the remote control at a distance of up to 7 km in the absence of obstacles.</li>\r\n<li><strong>Total security</strong>. The FlightAutonomy system received two new micro-cameras and two infrared sensors located on the sides. Thanks to this, the quadcopter can recognize obstacles even in low light and automatically correct the course to avoid a collision. This feature is useful for both beginners and professional videographers, who get the opportunity to focus on the shooting process.</li>\r\n<li><strong>Easy management</strong>. There is nothing superfluous on the standard remote &ndash; the aircraft can be controlled using two mini-joysticks and two buttons. All additional functions are activated using a proprietary mobile application. In the standard version, the remote control is equipped with a holder for a smartphone, and in the PLUS version &ndash; retractable screen with a very bright backlight (1000 cd/m2), allowing you to see all the details of the image even when exposed to direct sunlight.</li>\r\n<li><strong>Automatic Flight Programs</strong>. DRAW technology allows you to draw the course of a quadrocopter on the touch screen &ndash; the device will follow it at a constant altitude, allowing you to pay maximum attention to the precise aiming of the camera. In addition, the aircraft can simply be shown the end point to which it will reach, bypassing all obstacles. Videographers will especially benefit from the automatic tracking of a moving object and the release of the shutter when gestures are recognized.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Quadcopters', 'Quadcopter DJI Phantom 4 Pro – modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.'),
(2, 'en', 7, 'Havit G1 Black/Red', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</p>', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort. One charge of the earbuds is enough for 3.5 hours of active use. Headphones are protected from sweat and water, which makes it possible to use the headphones even under extreme load conditions. And two acoustic heads will blow your workouts with a bang.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Accessories', 'With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort.'),
(2, 'en', 8, '1MORE Quad Driver', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>\r\n<p>The frequency range is amazing - from 20 Hz to 40 kHz, headphone sensitivity is 99 dB at a resistance of 32 ohms. The remote control has 3 buttons (volume control, call reception) and a microphone with noise and interference suppression. The 3.5mm mini jack is shaped like an \"L\" to ensure durability, even when carried in your pocket with your smartphone all the time.</p>\r\n<p>The polymer braid of the wires is resistant to wear, abrasion and creases, inside the structure is reinforced by Kevlar threads. The set includes a stylish gift box, a hard case, a 6.3 mm adapter, an air adapter, and 8 pairs of interchangeable ear tips of various sizes. Designed for uncompromising music enjoyment, these headphones are the best choice for true music lovers.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Accessories', 'The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.'),
(2, 'en', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.'),
(2, 'en', 12, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.'),
(2, 'en', 13, 'Apple Watch 4 Black', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.'),
(2, 'en', 14, 'Apple Watch 4 Silver', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.'),
(2, 'en', 15, 'Apple Watch 4 White', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(2, 'en', 16, 'Apple AirPods', '<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>', '<h2>Sound magic</h2>\r\n<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>\r\n<h2>Why a headphone processor?</h2>\r\n<p>In the list of technical characteristics of Apple AirPods, we can see the W1 processor. Moreover, he answers in this model not only for the formation of a sound signal. Headphones know what you are doing at the moment: Whether you are using 1 or 2 headphones, talking or listening to music - the system will automatically adjust to the required mode, create sound isolation, pause the music and turn it on again.</p>\r\n<h2>Decent autonomy</h2>\r\n<p>But from a mobile gadget, you need not only a range of capabilities, but also the possibility of long-term work. Apple AirPods will be able to play music continuously for 5:00. Using the charging case will make you autonomous for a day. At the same time, 15 minutes of recharging will give you another 3:00 of music and communication!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Accessories ', 'Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. '),
(2, 'en', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.</p>', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system. The company\'s devices are famous for their optimization and the almost complete absence of any add-ons. Motorola Moto G6 Plus is equipped with a 5.9-inch IPS screen that will give you hours of reading or video viewing pleasure thanks to its large diagonal, high resolution and excellent color reproduction. You can comfortably perform everyday tasks and even play any modern mobile games thanks to the Qualcomm Snapdragon 630 processor. In addition, the Motorola Moto G6 Plus has IPX7 water protection, and another nice bonus is the NFC module.</p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Smartphones ', 'Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.'),
(2, 'en', 18, 'Nokia 4.2 DS 3', '<p>With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>', '<p><strong>Life is easier just around the corner</strong></p>\r\n<p>When the Google Life Assistant is at hand, it picks up the pace. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>\r\n<p><strong>We increased the design requirements, and then brought it to perfection</strong></p>\r\n<p>Skill and sophistication - for every day. Thickness 8.4 mm. Quality 2.5D glass with rounded corners on front and back. Not a phone, but a real pleasure to hold in your hand. 5.71 inch HD+ screen with 19:9 aspect ratio A sheer pleasure not only to hold but also to look at. A battery that adapts to you and lasts a long time.</p>\r\n<p><strong>Moments you remember have never looked so spectacular</strong></p>\r\n<p>Share your emotions. With a dual rear camera and a wide-angle selfie camera, all smiles will be in the frame. Get creative with the latest features like bokeh mode and advanced photo editing.</p>\r\n<p><strong>Continuous improvement</strong></p>\r\n<p>Nokia 4.2 - Android One smartphone on pure Android 9 Pie without third-party programs. Nothing extra - plus free security updates once a month, don\'t slow down your phone.<br>Add artificial intelligence that will suggest the necessary functions of applications based on its experience and help you manage your screen time with Digital Wellbeing.&lt; /p&gt;</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Smartphones', 'With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works.'),
(2, 'en', 19, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen.</p>', '<p>Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen. The smartphone has a folding case, so it was decided to save on small dimensions. On the front panel of the Samsung Galaxy Fold 5G there is a 4.6-inch Dynamic AMOLED display with a separate size of 1960x840 pixels.</p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Smartphones', 'Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen'),
(2, 'en', 20, 'Samsung Galaxy S10', '<p>Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', '<p>Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Smartphones', 'Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. '),
(2, 'en', 21, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.</p>', '<p>Samsung Galaxy A30 is a wonderful Android smartphone with Exynos 9610 1800Mhz octa-core processor, Super AMOLED display with up to 16 million colors, 6.4\" diagonal and 16 Mpx camera. Equipped with a very powerful 4000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Smartphones', 'Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.'),
(2, 'en', 22, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.</p>', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 5000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Smartphones', 'Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.'),
(2, 'en', 23, 'Samsung Galaxy A50 Black', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 'Samsung Galaxy A50 Black', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.'),
(2, 'en', 24, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.</p>', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with a 6.2\" IPS LCD display with up to 16 million colors and a 13 Mpx camera. Equipped with a very powerful 3400 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Smartphones', 'Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.'),
(2, 'en', 25, 'Samsung Galaxy A20', '<p>The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.</p>', '<p>Samsung Galaxy A20 is an excellent smartphone running on the Android platform with an 8-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 4000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Smartphones', 'The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.'),
(2, 'en', 26, 'Samsung Galaxy A70', '<p>The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.</p>', '<p>Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a Super AMOLED display with up to 16 million colors, with a diagonal of 6.7 \"and a 32 Mpx camera. Equipped with a very powerful 4500 mAh battery. For communication, it can offer: EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port, for music lovers there is a 3.5 mm audio output.</p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Smartphones', 'The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.'),
(2, 'en', 27, 'Samsung Galaxy A40', '<p>The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.</p>', '<p>Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 5.9 \"and a 16 Mpx camera. Equipped with a very powerful 3100 mAh battery. For communication it can offer: EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port.For music lovers, there is a 3.5 mm audio output.It is also worth noting that it is equipped with a GPS receiver, which will allow you not to get lost in any place!</p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Smartphones', 'The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.'),
(2, 'en', 28, 'Samsung Galaxy A2', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A2 Core on the rear packs 5-megapixel camera. The rear camera setup has autofocus. It sports a 5-megapixel camera on the front for selfies.</p>\r\n<p>Samsung Galaxy A2 Core based on Android 9.0 Pie (Go edition) and packs 16GB of inbuilt storage that can be expanded via microSD card. The Samsung Galaxy A2 Core is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards.</p>\r\n<p>Connectivity options on the Samsung Galaxy A2 Core include Wi-Fi 802.11 b/g/n, GPS, Micro-USB, FM radio, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer.</p>\r\n<p><span id=\"hscc\">&nbsp;</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Mobile phones', 'Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 787'),
(2, 'en', 29, 'Samsung Galaxy A80', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A80 on the rear packs a 48-megapixel primary camera with an f/2.0 aperture and a second 8-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus.</p>\r\n<p>The Samsung Galaxy A80 runs One UI based on Android 9.0 Pie and packs 128GB of inbuilt storage. The Samsung Galaxy A80 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy A80 measures 165.20 x 76.50 x 9.30mm (height x width x thickness) . It was launched in Angel Gold, Ghost White, and Phantom Black colours. It bears a glass body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A80 include Wi-Fi 802.11 b/g/n, GPS, USB Type-C, 3G, and 4G (with support for Band 40 used by some LTE networks in India) with active 4G on both SIM cards. Sensors on the phone include accelerometer, ambient light sensor, proximity sensor, and fingerprint sensor. The Samsung Galaxy A80 supports face unlock.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Mobile phones', 'Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 co'),
(2, 'en', 30, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p'),
(2, 'en', 31, 'Apple iPhone 7 Black', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.&nbsp;</p>', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery.</p>\r\n<p>As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture. The rear camera setup has phase detection autofocus. It sports a 7-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Apple iPhone 7 based on iOS 10 and packs 32GB of inbuilt storage. The Apple iPhone 7 is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Apple iPhone 7 measures 138.30 x 67.10 x 7.10mm (height x width x thickness) and weighs 138.00 grams. It was launched in Black, Gold, Jet Black, Matte Black, Red, Rose Gold, and Silver colours.</p>\r\n<p>Connectivity options on the Apple iPhone 7 include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v4.20, NFC, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Mobile phones', 'Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a'),
(2, 'en', 32, 'Samsung Galaxy S7', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside.&nbsp;&nbsp;</p>', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The camera is absolutely amazing, especially in low light. This is a pragmatic phone, compared to its sibling the Galaxy S7 Edge, and is better value for money if you don\'t want to show off. However, with competition at an all-time high, you can also get most of its features and functions for one third this price.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Mobile phones', 'Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The came'),
(2, 'en', 33, 'Apple iPhone X', '<p>Apple iPhone X is the epitome of the best innovative solutions. A completely new design with a reimagined control system.</p>', '<p>Apple iPhone X is the epitome of the best innovative solutions. Brand new design<br>with a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful internal 64-bit architecture. Dramatically improved the world\'s most popular mobile camera.<br>This is exactly how Apple sees its flagship smartphone in 2017.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Mobile phones', 'Apple iPhone X is the epitome of the best innovative solutions. Brand new design\r\nwith a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body.'),
(3, 'ua', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйми з технологією True Tone. І підтримка Apple Pencil, щоб вам було ще простіше слідувати за натхненням. Це все той самий iPad mini, але тепер він вміє більше.</p>', '<p><strong>ЗОВСІМ ЯК ВЕЛИКИЙ</strong></p>\r\n<p>iPad mini ідеально поєднує в собі компактність та продуктивність - за це його і люблять. Тепер для кохання з\'явилося ще більше приводів. Процесор A12 Bionic із системою Neural Engine. Дисплей Retina 7,9 дюйми з технологією True Tone. І підтримка Apple Pencil, щоб вам було ще простіше слідувати за натхненням. Це все той самий iPad mini, але тепер він вміє більше.</p>\r\n<p><strong>КОМПАКТНИЙ. ПОРТАТИВНИЙ. КИШЕНЬКОВИЙ</strong></p>\r\n<p>iPad mini неймовірно компактний і легкий, тому легко складе вам компанію, де б ви не знаходилися. Він важить менше 400 г при товщині 6,1 мм і чудово поміщається у кишеню чи сумку. Його дуже зручно тримати в руці і можна швидко дістати з кишені, коли цього вимагатиме натхнення.</p>\r\n<p><strong>ПРОДУКТИВНІСТЬ ВИХОДИТЬ ЗА РАМКИ РОЗМІРУ </strong></p>\r\n<p>Потужність та інтелект iPad mini забезпечуються процесором A12 Bionic із системою Neural Engine. Використовуючи технології машинного навчання, процесор швидко розпізнає закономірності, пропонує свої варіанти та навчається на основі набутого досвіду. Робота в Adobe Photoshop CC, доповнена реальність, захоплюючі ігри з графікою консольного рівня &ndash; потужності вистачить на все.</p>\r\n<p><strong>СПРАВА НЕ В РОЗМІРІ ДИСПЛЕЮ, А В ЯКОСТІ ПІКСЕЛЕЙ </strong></p>\r\n<p>iPad mini оснащений чудовим дисплеєм 7,9 дюйма, який відображає понад 3 мільйони пікселів. І Apple витягли максимум із кожного. Висока яскравість, широкий колірний охоплення і покриття антивідблиску дозволяють використовувати iPad mini в будь-яких умовах. Неважливо, що ви робите: читаєте книгу в парку або монтуєте відео вдома - зображення та текст завжди виглядатимуть максимально чітко та природно. А технологія True Tone автоматично налаштовує баланс білого з урахуванням освітлення, тому тепер кольори виглядатимуть ще натуральніше.</p>\r\n<p><strong>БУДЬТЕ НА ЗВ\'ЯЗКУ. Знімайте в HD. ГРАЙТЕ В AR </strong></p>\r\n<p>Камери на iPad mini дозволяють знімати чудові фотографії та відео. І це далеко ще не все. Ви можете спілкуватися з друзями по FaceTime, сканувати документи, робити позначки або навіть планувати перестановку меблів за допомогою технологій AR (доповненої реальності).</p>\r\n<p><strong>APPLE PENCIL. ВІДМІННО ВПИСУЄТЬСЯ</strong></p>\r\n<p>Apple Pencil (продається окремо) розкриває в iPad мільйон нових можливостей. З ним iPad mini перетвориться на неймовірно зручний цифровий блокнот. Робіть записи від руки, заповнюйте форми та підписуйте документи. Або підійдіть до справи творчо: робіть начерки та малюнки прямо на ходу. IOS.</p>\r\n<p><strong>ДОПОМОЖЕ ВАМ РОЗКРИТИ ПОТЕНЦІАЛ IPAD </strong></p>\r\n<p>Завдяки iOS на компактному iPad mini можна виконувати завдання, які ви ставите перед iPad. Використовуйте кілька програм одночасно, переміщуйте файли простими жестами Multi-Touch, відкривайте улюблені програми з панелі Dock. А з додатком \"Файли\" весь ваш контент завжди буде під рукою.</p>\r\n<p><strong>МІЛЬЙОН МОЖЛИВОСТЕЙ В ОДНОМУ IPAD MINI </strong></p>\r\n<p>На iPad mini встановлені чудові програми Apple для повсякденних завдань - Фото, Карти, Повідомлення, Пошта, Safari та інші. А в App Store доступно ще більше мільйона програм для iPad &ndash; серед них легко знайти необхідні саме вам. Монтуйте відео, спілкуйтеся в соціальних мережах, робіть начерки або занурюйтесь у захоплюючі мережеві ігри.</p>\r\n<p><strong>ВАШІ ДАНІ НАЛЕЖАТЬ ТІЛЬКИ ВАМ </strong></p>\r\n<p>Як і всі продукти Apple, iPad mini розроблявся з урахуванням строгих вимог щодо захисту особистої інформації. Touch ID &ndash; це проста та надійна система аутентифікації на iPad mini. А за допомогою Apple Pay можна швидко та безпечно оплачувати покупки. Просто торкніться датчика Touch ID - і готово.</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшети', 'ЗОВСІМ ЯК ВЕЛИКИЙ iPad mini ідеально поєднує в собі компактність та продуктивність - за це його і люблять. Тепер для кохання з\'явилось ще більше приводів. Процесор A12 Bionic із системою Neural Engine.'),
(3, 'ua', 2, 'Samsung Galaxy Tab', '<p>Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим найкращим супутником у розвагах та роботі у багатозадачному режимі.</p>', '<p><strong>БАГАТОЗАДАЧНІСТЬ БЕЗ КОРДОНІВ</strong></p>\r\n<p>Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим найкращим супутником у розвагах та роботі у багатозадачному режимі.</p>\r\n<p><strong>SAMSUNG DEX ДЛЯ ЗБІЛЬШЕННЯ ПРОДУКТИВНОСТІ ВАШОЇ РОБОТИ </strong></p>\r\n<p>Режим Samsung DeX вперше став сумісним із планшетом Samsung Galaxy Tab S4. Тепер висока продуктивність роботи на ПК стала доступною на планшеті. Багатозадачний режим роботи доступний через адаптер HDMI без використання док-станції Samsung DeX або DeX pad, для більшої ефективності можна додати клавіатуру, мишу або монітор.</p>\r\n<p><strong>ГОТОВИЙ ДЛЯ РОБОТИ </strong></p>\r\n<p>Все під рукою для робочого режиму. Робочий стіл на екрані планшета Galaxy Tab S4 реалізований як у звичайному ПК, тобто. з панеллю завдань, підтримкою багатовіконного режиму та функцією перетягування файлів. Якщо ви хочете мати на екрані звичний робочий стіл, просто запустіть Samsung DeX через панель швидкого доступу та додайте Android-сумісну клавіатуру та мишу.</p>\r\n<p><strong>ПРАЦЮЙТЕ ЕФЕКТИВНІШЕ</strong></p>\r\n<p>Продуктивність вашої роботи залежить від того, наскільки комфортне робоче середовище. Саме тут може допомогти використання Samsung DeX із зовнішнім монітором. На великому екрані монітора можна продовжувати користуватися Android інтерфейсом вашого планшета. Або дивитися на монітор, а планшет використовувати як тачпад, панель із S Pen або сенсорну клавіатуру.</p>\r\n<p><strong>ВІН НЕ ВИКЛЮЧЕНИЙ - ВІН В РЕЖИМІ ОЧІКУВАННЯ </strong></p>\r\n<p>Якщо у вас виникла нова ідея, зафіксуйте її на екрані планшета, щоб не забути. Завдяки функції запису нотаток на вимкненому екрані планшета Galaxy Tab S4 ви можете швидко записати ваші думки навіть на чорному екрані за допомогою багатофункціонального електронного пера S Pen. Найтонший 0,7-мм гумовий кінчик пера дозволяє легко і точно робити нотатки та малювати ескізи.</p>\r\n<p><strong>ПОЛІПШЕНІ РОБОЧІ ХАРАКТЕРИСТИКИ </strong></p>\r\n<p>Швидкість передачі даних Samsung Galaxy Tab S4 в режимі LTE досягає 1 Гбіт/с, тому у вас буде достатньо часу і для інших справ. А завдяки наявності в планшеті 64 Гб вбудованої пам\'яті та можливості розширення її до 400 Гб за допомогою слота для MicroSD карт пам\'яті, у вас буде достатньо місця для зберігання ваших документів та відео.</p>\r\n<p><strong>ЗАНУРИТИСЯ В АТМОСФЕРУ РОЗВАГ</strong></p>\r\n<p>Незважаючи на компактні розміри, планшет Galaxy Tab S4 оснащений великим площею візуальним простором для роботи. Завдяки максимально вузькій рамці та відсутності логотипу Samsung та кнопки Home, діагональ екрану реально становить 10,5 дюймів. А покращене співвідношення сторін 16:10 sAMOLED екрану створює ефект повнішого занурення при перегляді вашого улюбленого контенту.</p>\r\n<p><strong>ОКРУЖІТЬ СЕБЕ ЗВУКОМ ВИСОКОЇ ЯКОСТІ</strong></p>\r\n<p>Чотири динаміки, налаштовані спеціалістами всесвітньо відомої компанії AKG, забезпечують звук як у реальному житті. Тепер ви можете експериментувати з адаптивним аудіо, створеним експертами AKG. А технологія Dolby Atmos забезпечує об\'ємний 3D звук, завдяки чому те, що відбувається на екрані, не відрізняється від реальності.</p>\r\n<p><strong>ДИВІТЬСЯ ВІДЕО, НЕ ДУМАЮЧИ ПРО ЧАС</strong></p>\r\n<p>Galaxy Tab S4 оснащений батареєю ємністю 7300 мАг, що дозволяє переглядати відео до 16 годин, так що ви зможете дивитися ваші улюблені фільми або серіали, не думаючи про час. А якщо батарея розрядиться, завдяки функції швидкої зарядки ви зможете повністю зарядити її всього за 200 хвилин.</p>\r\n<p><strong>КОРИСНИЙ НАВІТЬ У РЕЖИМІ ОЧІКУВАННЯ</strong></p>\r\n<p>У сплячому режимі планшет Galaxy Tab S4 перетворюється на розумний домашній дисплей. Якщо планшет заряджається або \"спить\", за допомогою функції Daily Board ви можете налаштувати режим відображення на екрані ваших улюблених фотографій. Крім того, планшет може бути корисним помічником і відображати на екрані не просто поточний прогноз погоди, але також дату та час, виконуючи роль календаря.</p>\r\n<p><strong>РОЗБЛОКУВАННЯ ЗА ДОПОМОГОЮ РАДУЖКИ ОКА</strong></p>\r\n<p>Крім технології розпізнавання облич Galaxy Tab S4 тепер підтримує функцію сканування райдужної оболонки ока. Для розблокування вашого планшета достатньо відсканувати ваше обличчя або райдужку очей. Вбудована система шифрування та захищена папка у поєднанні з функціями біоідентифікації забезпечать безпеку ваших файлів та програм.</p>\r\n<p><strong>БАГОТОРІВНЕВА СИСТЕМА ЗАХИСТУ</strong></p>\r\n<p>Тримайте дані під надійним захистом. Платформа безпеки Samsung Knox активізується з моменту увімкнення вашого планшета. Багаторівнева система захисту в реальному часі поміщає ваші дані до захищеної папки, доступ до якої є тільки у вас. Зберігайте ваші робочі та особисті дані окремо.</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшети', 'Багатозадачність без кордонів Створений з урахуванням вашої зайнятості та необхідності постійно працювати \"на ходу\", новий планшет Samsung Galaxy Tab S4 стане вашим кращим супутником у розвагах та роботі в багатозадачному режимі.'),
(3, 'ua', 3, 'Apple iPad Air', '<p>iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. Крім того, при товщині всього 6,1 мм iPad Air важить менше 500 г &mdash; ви легко зможете завжди тримати його при собі.</p>', '<h3>iPad Air - всім любителям потужних технологій</h3>\r\n<p>iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. Крім того, при товщині всього 6,1 мм iPad Air важить менше 500 г &mdash; ви легко зможете завжди тримати його при собі.</p>\r\n<h3>Все, що вам потрібно. Ніякої зайвої ваги</h3>\r\n<p>Попри великий дисплей Retina 10,5 дюйма, iPad Air дуже компактний. Він чудово підходить для вирішення найрізноманітніших завдань буквально на ходу. Для цього він оснащений найбільш передовими технологіями бездротового зв\'язку, а також акумулятором, який працює без підзарядки до 10 годин. Тобто майже цілий день.</p>\r\n<h3>На зв\'язку практично де завгодно</h3>\r\n<p>iPad Air підтримує швидкі бездротові мережі 4G LTE та передавання даних зі швидкістю до 866 Мбіт/с по Wi-Fi.&nbsp;Це означає &mdash; жодних дротів і жодних складнощів. А з технологією eSIM ви можете підключити тарифний план бездротового зв\'язку прямо з iPad Air &mdash; практично у будь-якій точці світу.</p>\r\n<h3>Вдосталь потужності для всього й одразу</h3>\r\n<p>Потужність та інтелект iPad Air забезпечуються процесором A12 Bionic з системою Neural Engine. Процесор задіює технології машинного навчання у режимі реального часу й відкриває неймовірні можливості для фотографії, ігор, доповненої реальності та багато чого іншого. Ви можете редагувати відео, робити приголомшливі презентації, проектувати 3D-моделі, дивитися улюблені серіали онлайн. І робити все це одночасно.</p>\r\n<h3>Надзвичайно швидка графіка для ігор та додатків</h3>\r\n<p>Приголомшлива продуктивність у додатках з доповненою реальністю, неймовірні графічні можливості, фотореалістична графіка в 3D-іграх &mdash; за всім цим стоїть 4-ядерна графічна система процесора A12 Bionic.</p>\r\n<h3>Дисплей Retina - все робиться красиво</h3>\r\n<p>iPad Air оснащений дисплеєм Retina 10,5 дюйма з широким колірним охопленням. На цей дисплей хочеться дивитися нескінченно. Фотографії, відео та ігри виглядають живо і природно аж до найдрібніших деталей. І незалежно від зовнішніх умов, технологія True Tone, підвищена яскравість та покриття антивідблиску допоможуть зробити зображення максимально якісним.</p>\r\n<h3>True Tone. Легко для очей при будь-якому освітленні</h3>\r\n<p>Технологія True Tone автоматично налаштовує баланс білого з урахуванням зовнішнього освітлення. Тому зображення на дисплеї виглядає більш природно та комфортно для очей за будь-яких умов &mdash; і під час вечірнього читання, і коли ви малюєте сонячний пейзаж на пленері.</p>\r\n<h3>Будьте на зв\'язку. Знімайте в HD. Грайте в AR</h3>\r\n<p>Камери iPad Air дозволяють знімати приголомшливі фотографії та HD-відео 1080p. І це далеко не все. Можна спілкуватися по FaceTime з кількома співрозмовниками, сканувати і відразу надсилати документи. І навіть створювати власні світи &mdash; камери iPad Air чудово працюють з технологіями augmented reality (доповненої реальності).</p>\r\n<h3>Грайте, працюйте та займайтеся творчістю у доповненій реальності</h3>\r\n<p>Коли віртуальні об\'єкти і дані стають частиною реального світу, перед вами відкриваються абсолютно нові горизонти. Камери на передній та задній панелях, процесор A12 Bionic з системою Neural Engine, великий дисплей з природним передаванням кольору і точне відстеження руху роблять iPad ідеальним пристроєм для життя у доповненій реальності.</p>\r\n<h3>Пишіть. Малюйте. Прямуйте за натхненням</h3>\r\n<p>Apple Pencil передає рухи руки з приголомшливою точністю та швидкістю.&nbsp;Його зручно тримати в руці, як звичайний олівець. При цьому він вміє набагато більше. З Apple Pencil ваш iPad Air може стати блокнотом або полотном художника &mdash; у вас безліч варіантів.</p>\r\n<h3>Робіть нотатки. Коментуйте документи та скріншоти. І багато іншого</h3>\r\n<p>Робити нотатки або записувати ідеї на iPad Air так само легко, як на звичайному аркуші паперу. Ви можете розмічати документи, доповнювати нотатки малюнками, робити знімки екрану та додавати до них коментарі.</p>\r\n<h3>Smart Keyboard. Повний розмір. Повний захист</h3>\r\n<p>Smart Keyboard &mdash; це повнорозмірна клавіатура, яка дуже допоможе у підготовці важливої презентації або підсумкового твору.&nbsp;Її не потрібно заряджати й спеціально налаштовувати. Просто приєднайте Smart Keyboard до iPad Air і починайте працювати. А коли закінчите, складіть клавіатуру, і вона перетвориться на легку та елегантну обкладинку.</p>\r\n<h3>iOS - допоможе вам розкрити потенціал iPad</h3>\r\n<p>iOS &mdash; це передова мобільна операційна система, яка дозволяє керувати iPad Air простими дотиками. Ми називаємо їх жестами, і вони забезпечують повний доступ до всіх можливостей великого дисплея та інтелектуальних технологій iPad Air. З функцією багатозадачності ви зможете одночасно користуватися улюбленими додатками &mdash; досить просто вибрати їх на панелі Dock. А файли можна переміщувати з однієї програми до іншої та сортувати у додатку &laquo;Файли&raquo; так, як вам зручно.</p>\r\n<h3>Всі ваші файли зібрані разом</h3>\r\n<p>Додаток &laquo;Файли&raquo; дає можливість працювати з контентом, який може зберігатися на iPad Air, в iCloud Drive або інших хмарних сервісах, таких як Box та Dropbox. У будь-якому випадку, файли завжди будуть доступні &mdash; легко й просто.</p>\r\n<h3>Ваш iPad відповідає вашим інтересам</h3>\r\n<p>На iPad Air встановлені чудові додатки Apple для повсякденних завдань, такі як Фото, Карти, Повідомлення, Пошта та Safari. Потужні додатки Pages, Numbers і Keynote допоможуть у роботі, а GarageBand та iMovie вже готові стати вашими улюбленими творчими інструментами.</p>\r\n<h3>Понад мільйон додатків для iPad в App Store</h3>\r\n<p>В App Store можна знайти будь-які додатки: для фотографії, малювання, офісної роботи та багато чого іншого. Розробники проектують їх з урахуванням приголомшливої продуктивності та великого дисплея iPad Air, а також роблять сумісними з Apple Pencil. І кожного дня в App Store з\'являються рекомендації нових цікавих додатків.</p>\r\n<h3>iCloud. Ідеальне місце для ваших фотографій, файлів та інших цінностей</h3>\r\n<p>Завдяки iCloud ваші фотографії, документи, нотатки та багато інших файлів завжди оновлені й доступні на всіх ваших пристроях.&nbsp;А додаток &laquo;Файли&raquo; дозволяє працювати з файлами, що зберігаються як в iCloud Drive, так і на iPad Air.</p>\r\n<h3>Ваша особиста інформація належить лише вам. І крапка</h3>\r\n<p>Як і всі продукти Apple, iPad Air розроблявся з урахуванням суворих вимог до захисту особистої інформації. Touch ID &mdash; це проста та надійна система аутентифікації на iPad Air. А за допомогою Apple Pay можна швидко та безпечно сплачувати за покупки. Просто доторкніться до датчика Touch ID &mdash; і готово.</p>\r\n<h3>Універсальний доступ. Підтримає кожного</h3>\r\n<p>Технології стають дійсно потужними, коли ними може користуватися кожен. Тому на iPad так багато можливостей для людей з порушеннями зору, слуху, здатності до навчання, а також зі складнощами у спілкуванні. У їх числі функція VoiceOver, яка озвучує те, що відбувається на екрані, та Switch Control, що дозволяє працювати з iPad Air, не торкаючись дисплея.</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшети', 'iPad Air відкриває широкий доступ до наших найбільш передових розробок. Процесор A12 Bionic з системою Neural Engine. Дисплей Retina 10,5 дюйма з технологією True Tone. Підтримка Apple Pencil та клавіатури Smart Keyboard. '),
(3, 'ua', 4, 'DJI Mavic Air', '<p><strong>DJI Mavic Air</strong> &ndash; нова модель компактного дрону, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні.</p>', '<p>Квадрокоптер DJI Mavic Air &ndash; нова модель компактного дрона, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні. Його головна перевага &ndash; розширений функціонал камери, яка тепер може створювати сферичні панорами, які ідеально підходять для перегляду в окулярах віртуальної реальності. Крім того, користувачеві доступно кілька сценаріїв селфі-відео - повільне віддалення, обертання по орбіті, рух по спіралі, різке піднесення та імітація польоту бумерангу.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптери', 'Квадрокоптер DJI Mavic Air – нова модель компактного дрона, яка стала ще меншою, швидше, надійнішою та зручнішою в управлінні. '),
(3, 'ua', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo &ndash; модель безпілотного літального апарату від знаменитого виробника. Більш компактний, ніж Phantom, він легко поміщається в рюкзак, який не обмежує рухів користувача.</p>', '<p>Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;молодша&raquo; модель безпілотного літального апарата від знаменитого виробника. Більш компактний, ніж Phantom, він легко поміщається в рюкзак, який не обмежує рухів користувача. Його можна брати з собою у подорожі, на виїзні фотосесії, на спортивні змагання та на будь-які інші заходи.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптери', 'Квадрокоптер DJI Mavic Pro Fly More Combo – «молодша» модель безпілотного літального апарата від знаменитого виробника. '),
(3, 'ua', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro &ndash; модернізована модель знаменитого літального апарату. Його головна відмінність від попередньої версії представлена новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернізована модель знаменитого літального апарату. Його головна відмінність від попередньої версії представлена ​​новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с. Такі характеристики дозволяють створювати повнорозмірні серійні фотографії зі швидкістю до 14 кадрів в секунду, а також записувати ролики з роздільною здатністю C4K (4096 х 2160) та частотою зміни кадрів до 60 в секунду. Користувачеві залишається лише підібрати відповідну картку пам\'яті &ndash; її максимальний об\'єм досягає 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Покращені динамічні можливості</strong>. Незважаючи на проведене оновлення технічної частини, маса квадрокоптера не зросла. цьому сприяло застосування рами з магнію, алюмінію та титану. Пристрій може проводити в повітрі до 30 хвилин, піднімаючись на висоту до 6 км над рівнем моря. Максимальна швидкість горизонтального польоту дорівнює 20 м/с (72 км/год), а підйому &ndash; 6 м/с (21,6 км/год). Удосконалена дводіапазонна система радіокерування дозволяє літальному апарату обмінюватися сигналами з пультом на дистанції до 7 км за відсутності перешкод.</li>\r\n<li><strong>Повна безпека</strong>. Система FlightAutonomy отримала дві нові мікрокамери та два інфрачервоні датчики, розташовані з боків. Завдяки цьому квадрокоптер може розпізнавати перешкоди навіть при слабкому освітленні та автоматично виправляти курс, запобігаючи зіткненню. Така функція є корисною як для новачків, так і для професійних відеооператорів, які отримують можливість зосередитися на процесі зйомки.</li>\r\n<li><strong>Зручне керування</strong>. На стандартному пульті немає нічого зайвого &ndash; літальним апаратом можна керувати за допомогою двох міні-джойстиків та двох кнопок. Всі додаткові функції активуються за допомогою мобільного додатка. У стандартній версії пульт забезпечений тримачем для смартфона, а в модифікації PLUS &ndash; ndash; висувним екраном з дуже яскравим підсвічуванням (1000 кд/м2), що дозволяє розглянути всі деталі зображення навіть при попаданні на нього прямого сонячного проміння.</li>\r\n<li><strong>Автоматичні програми польоту</strong>. Технологія DRAW дозволяє намалювати курс квадрокоптера на сенсорному екрані &ndash; пристрій буде слідувати йому на постійній висоті, дозволяючи приділити максимум уваги точному наведенню камери. Крім того, літальному апарату можна просто показати кінцеву точку, до якої він дістанеться, обминаючи всі перешкоди. Для відеооператорів будуть особливо корисними функції автоматичного стеження за об\'єктом, що рухається, і спуску затвора при розпізнаванні жестів.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптери', 'DJI Phantom 4 Pro – модернізована модель знаменитого літального апарату. Його головна відмінність від попередньої версії представлена новою камерою з 20-мегапіксельним сенсором та високопродуктивним процесором, що забезпечує бітрейт до 100 Мбіт/с.'),
(3, 'ua', 7, 'Havit G1 Black/Red', '<p>З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні.</p>', '<p>З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні. Ви зможете займатися спортом ще довше, а надійні кріплення навушників забезпечать максимальний комфорт. Одного заряду навушників вистачає на 3.5 годин активного використання. Навушники захищені від поту та води, що дає можливість використовувати навушники навіть в екстремальних умовах навантаження. А дві акустичні головки підірвуть ваші тренування на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксесуари', 'З бездротовими навушниками Havit G1, які можуть працювати до 24 годин без підзарядки, ваші тренування будуть проходити більш енергійні. Ви зможете займатися спортом ще довше, а надійні кріплення навушників забезпечать максимальний комфорт. '),
(3, 'ua', 8, '1MORE Quad Driver', '<p>Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді. В алюмінієвому корпусі анатомічної форми 4 випромінювачі &ndash; динамічний з карбону та 3 арматурних драйвера, що відповідають за низькі та високі частоти.</p>', '<p>Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді. В алюмінієвому корпусі анатомічної форми 4 випромінювачі &ndash; динамічний з карбону та 3 арматурних драйвера, що відповідають за низькі та високі частоти.</p>\r\n<p>Частотний діапазон дивує від 20 Гц до 40 кГц, чутливість навушників 99 дБ при опорі 32 Ом. Пульт дистанційного керування має 3 кнопки (регулятор гучності, прийом дзвінка) та мікрофон з придушенням шумів та перешкод. Роз\'єм mini jack 3,5 мм має форму літери &laquo;L&raquo;, що забезпечує його довговічність навіть при постійному носінні в кишені разом зі смартфоном.</p>\r\n<p>Полімерне обплетення проводів стійке до зносу, стирання та заломів, усередині конструкцію посилює кевларові нитки. У комплекті стильне подарункове упакування, жорсткий чохол, перехідник на 6,3 мм, авіаадаптер, а також 8 пар змінних амбушюр різного розміру. Ці навушники створені для безкомпромісної насолоди музикою &ndash; найкращий вибір для справжніх меломанів.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксесуари', 'Дротові навушники даної моделі завоювали нагороду LAAS в Лос-Анджелесі, завдяки неперевершеній якості звучання та тонкому настроюванню від звукорежисера Лука Бігнарді. ');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 'ua', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Black, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>', '<p>JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.</p>\r\n<p>Особливістю моделі є технологія шумо- та ехоподавлення спікера, яка використовується для отримання кришталево чистого звуку. Також за допомогою простого натискання кнопки, ви можете активувати та поговорити з Siri або Google Now з вашого JBL Flip 4. Відсутність перешкод, чіткість звуку роблять зв\'язок надзвичайно якісним та комфортним.</p>\r\n<p>JBL Flip 4 - водонепроникна портативна колонка з діапазоном відтворюваних частот 70 Гц - 20 кГц, яка гарантує напрочуд потужне і чисте відтворення вашої улюбленої музики. Її незаперечні переваги - висока технологічність, практичність, невибагливість і свій відомий стиль, які дозволяють JBL Flip 4 залишатися на висоті.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативна акустика', 'JBL Flip 4 - це черговий флагман лінійки Flip, який є наступним поколінням серії портативної акустики JBL Flip. Чудова акустика вже встигла здобути низку премій.'),
(3, 'ua', 12, 'Samsung Galaxy Watch', '<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>', '<p><strong>Смарт-годинник Samsung Galaxy Watch Active</strong></p>\r\n<p>Ваш новий рівень функціональних можливостей</p>\r\n<p><strong>Нові можливості</strong></p>\r\n<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>\r\n<p><strong>Дизайн для активних користувачів</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active &ndash; це сучасний гаджет, укладений в гармонійний спортивний корпус. Чи плануєте відвідати вечірку або конференцію? Великий вибір ремінців різних кольорів допоможе вам легко змінити стиль та імідж в залежності від настрою або дрес-коду.</p>\r\n<p><strong>Проста лаконічна краса</strong></p>\r\n<p>Маючи в запасі різні візуальні варіанти, циферблат Samsung Galaxy Watch Active налаштовується на ваш ритм, щоб відповідати стилю і функціональним потребам. Яку б ви не ставили мета перед собою, смарт &ndash; годинник Samsung допоможуть її досягти.</p>\r\n<p><strong>Завжди залишайтеся в формі</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active мотивують вас підтримувати форму. Режим &laquo;Денна активність&raquo; допоможе вам досягати намічених цілей:не сидіть, рухайтеся, будьте активними. Вдосконалені високочутливі сенсори руху автоматично виконують виміри і відстежують сім різних типів активності, щоб надати вам точну інформацію про ваших денних фізичних навантаженнях. У годиннику встановлено датчик GPS. Ступінь їх водозащити становить 5ATM.</p>\r\n<p><strong>Керуйте рівнем стресу</strong></p>\r\n<p>Інтегрований датчик серцебиття відстежує ваш серцевий ритм і, в разі виявлення аномальних відхилень, відправляє вам повідомлення. Годинники Samsung Galaxy Watch Active визначать рівень вашого стресу і запропонують зробити дихальні вправи на розслаблення. Спостерігайте за рівнем стресу до і після розслабляючого дихання.</p>\r\n<ul>\r\n<li>Контроль стресу і енергії в кілька торкань</li>\r\n<li>Розслаблюючі дихальні вправи допоможуть вам прийти в норму</li>\r\n<li>Медитативних вправи для відновлення внутрішнього балансу</li>\r\n</ul>\r\n<p><strong>Слідкуйте за здоров\'ям</strong></p>\r\n<p>Додаток Samsung Health допоможе вам здійснювати постійний контроль за своїм самопочуттям. Переглядайте дані про стан вашого здоров\'я на дисплеї годин, користуйтеся великою кількістю інструментів, щоб керувати не тільки своєю фізичною активністю, а й загальним самопочуттям.</p>\r\n<p><strong>Не завершуйте спілкування</strong></p>\r\n<p>Завжди залишайтеся на зв\'язку. Надсилайте смайлики, текстові або голосові повідомлення за допомогою Galaxy Watch Active, навіть коли ваш телефон знаходиться на підзарядці.</p>\r\n<p><strong>Передові технології заряду</strong></p>\r\n<p>Інноваційна технологія бездротової зарядки Wireless Power Share допоможе швидко поповнити заряд пристрою. Galaxy Watch Active відстежують вашу активність до 45 годин без підзарядки.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес – годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.'),
(3, 'ua', 13, 'Apple Watch 4 Black', '<p>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br><br>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br><br>Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br><br><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br><br>Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br><br><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br><br>Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 14, 'Apple Watch 4 Silver', '<p>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br><br>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br><br>Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br><br><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br><br>Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br><br><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br><br>Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 15, 'Apple Watch 4 White', '<p>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.</p>', '<p><strong>ПОЧИНАЄМО НОВЕ ЖИТТЯ</strong>&nbsp;<br><br>Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном і новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку. Найбільший дисплей у лінійці Apple Watch. Новий електричний датчик серцевої активності. Удосконалене коліщатко Digital Crown з тактильним відгуком. Такі знайомі і разом з тим принципово нові Apple Watch Series 4 змінюють усі уявлення про можливості годин.&nbsp; ПОКЛЮЧИТЬСЯ. ПІДСКАЖЕ&nbsp;<br><br>Повідомлення про занадто низький і високий пульс. Функції виявлення падіння та виклику екстрених служб. Нові циферблати \"Дихання\". Цей годинник створений, щоб захищати вас і допомагати вам вести більш здоровий спосіб життя.&nbsp; розпізнавання тренувань. Нові види тренувань: йога та піший туризм. Передові функції для любителів бігу, наприклад, вимірювання каденсу та попередження про зміну темпу. При цьому на екран можна вивести до п\'яти показників, щоб відстежувати свою статистику.&nbsp;<br><br><strong>МОТИВАЦІЯ. МОТИВАЦІЯ. МОТИВАЦІЯ</strong>&nbsp;<br><br>Новий вид змагань: віч-на-віч. Можливість ділитися показниками активності із друзями. Персональні тренерські підказки. Щомісячні цілі, що мотивують. Віртуальні нагороди за досягнення. Все, щоб надихнути вас закривати кільця Активності кожен день.&nbsp;<br><br><strong>ВСЕ ВАЖЛИВЕ ПІД РУКОМ</strong>&nbsp;<br><br>Рація, телефонні дзвінки та повідомлення. Музика з Apple Music та програма \"Подкасти\" від Apple. Нові можливості програм зі швидкими командами Siri. Стільки всього важливого та потрібного - прямо у вас на зап\'ясті.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Годинники', 'Представляємо Apple Watch Series 4. Годинник з абсолютно новим дизайном та новими технологіями. Вони допомагають вести ще активніший спосіб життя, краще стежити за здоров\'ям і завжди залишатися на зв\'язку.'),
(3, 'ua', 16, 'Apple AirPods', '<p>Усі звикли, що аксесуари від Apple &ndash; це більше, ніж просто доповнення. Це речі самодостатні та часто унікальні. Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних для всіх речей. Відсутність дротів, гідна якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.</p>', '<h2><strong>Магія звуку </strong></h2>\r\n<p>Всі звикли, що аксесуари від Apple &ndash; це більше, ніж просто доповнення. Це речі самодостатні та часто унікальні. Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.</p>\r\n<h2>Навіщо навушників процесор?</h2>\r\n<p>У списку технічних характеристик Apple AirPods ми бачимо процесор W1. Причому відповідає він у цій моделі як формування звукового сигналу. Навушники знають, що ви робите в даний момент: Чи використовуєте ви 1 або 2 навушники, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставити музику на паузу і знову включити.</p>\r\n<h2>Гідна автономність</h2>\r\n<p>Але від мобільного гаджета потрібний не тільки спектр можливостей, а й можливість тривалої роботи. Apple AirPods зможуть безперервно працювати на відтворення музики п\'ять годин. Використання чохла для заряджання зробить вас автономним на добу. При цьому 15 хвилин підзарядки дадуть вам ще три години музики та спілкування!</p>', 'Apple AirPods', 'Apple AirPods, Apple, Аксесуари', 'Усі звикли, що аксесуари від Apple – це більше, ніж просто доповнення. Це речі самодостатні та часто унікальні. Саме так можна охарактеризувати і Apple AirPods. Нова бездротова гарнітура змінить ваше сприйняття простих і звичних для всіх речей. Відсутніст'),
(3, 'ua', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo. Пристрої компанії славляться своєю оптимізацією та практично повною відсутністю будь-яких надбудов. Motorola Moto G6 Plus оснащується 5.9-дюймовим IPS&nbsp;екраном, який подарує довгі години задоволення від читання або перегляду відео, завдяки великій діагоналі, високій роздільній здатності та чудовій кольоропередачі. З комфортом виконувати повсякденні завдання і навіть пограти в будь-які сучасні мобільні ігри можна завдяки процесору Qualcomm Snapdragon 630. До того ж Motorola Moto G6 Plus має захист від води за стандартом IPX7, а ще одним приємним бонусом виступає модуль NFC.</p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Смартфони', 'Motorola Moto G6 – смартфон для тих, хто хоче отримати універсальне рішення, що поєднує у собі відмінне виконання, непогану продуктивність та всі переваги операційної системи Android 8.0 Oreo.'),
(3, 'ua', 18, 'Nokia 4.2 DS 3', '<p>Коли під рукою Google Асистент життя набирає темпу. Можна ставити запитання, дивитися свій розклад або навіть приглушити світло. Помічник може багато чого. І чим довше ви використовуєте, тим краще він працює. Менше часу по телефону &ndash; більше часу для радощів життя.</p>', '<p><strong>Легше життя зовсім поруч - варто лише натиснути кнопку</strong></p>\r\n<p>Коли під рукою Google Асистент життя набирає темпу. Можна ставити запитання, дивитися свій розклад або навіть приглушити світло. Помічник може багато чого. І чим довше ви використовуєте, тим краще він працює. Менше часу по телефону &ndash; більше часу для радощів життя.</p>\r\n<p><strong>Ми підвищили вимоги до дизайну, а потім довели його до досконалості</strong></p>\r\n<p>Майстерність та витонченість - на кожен день. Товщина 8,4 мм. Якісне скло 2.5D із закругленими кутами з передньої та задньої сторони. Чи не телефон, а суцільне задоволення тримати в руці. Екран HD + 5,71 дюймів із співвідношенням сторін 19:9 Суцільне задоволення не тільки тримати, але й дивитися. Батарея, яка підлаштовується під вас та довго тримає заряд.</p>\r\n<p><strong>Пам\'ятні моменти ще ніколи не виглядали так ефектно</strong></p>\r\n<p>Діліться емоціями. За допомогою подвійної основної камери і ширококутної Selfie камери всі посмішки будуть у кадрі. Виявіть свої творчі здібності, використовуючи новітні функції, такі як режим боке та розширене редагування знімків.</p>\r\n<p><strong>Постійно вдосконалюється</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистій Android 9 Pie без сторонніх програм. Нічого зайвого &ndash; плюс безкоштовні оновлення безпеки раз на місяць, не уповільнюють роботу телефону.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Смартфони', 'Коли під рукою Google Асистент життя набирає темпу. Можна ставити запитання, дивитися свій розклад або навіть приглушити світло. Помічник може багато чого. І чим довше ви використовуєте, тим краще він працює. '),
(3, 'ua', 19, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold 5G - одне з найбільш незвичайних технологічних рішень на ринку, що отримало гнучкий екран.</p>', '<p>Samsung Galaxy Fold 5G - одне з найбільш незвичайних технологічних рішень на ринку, що отримало гнучкий екран. Смартфон виконаний у розкладному корпусі, завдяки чому вдалося зберегти невеликі габарити. На передню панель Samsung Galaxy Fold 5G винесено 4,6-дюймовий Dynamic AMOLED дисплей з роздільною здатністю 1960х840 точок.</p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Смартфони', 'Samsung Galaxy Fold 5G - одне з найбільш незвичайних технологічних рішень на ринку, що отримало гнучкий екран'),
(3, 'ua', 20, 'Samsung Galaxy S10', '<p>Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 1. на 4500 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', '<p>Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 1. на 4500 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Смартфони', 'Samsung Galaxy S10 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9 Octa 9820 2700Mhz, оснащений Curved Dynamic AMOLED-дисплеєм, що відображає до 16 млн. кольорів,'),
(3, 'ua', 21, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx.</p>', '<p>Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx 0 . Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Смартфони', 'Samsung Galaxy A30 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 9610 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 16 Mpx.'),
(3, 'ua', 22, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.</p>', '<p>Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx. Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Смартфони', 'Samsung Galaxy M30 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7904 1800Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx.'),
(3, 'ua', 23, 'Samsung Galaxy A50 Black', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', 'Samsung Galaxy A50 Black', 'Samsung Galaxy A50, Samsung, Мобільні телефони', 'Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер'),
(3, 'ua', 24, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн.</p>', '<p>Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.2\" і камерою на 13 Mpx . Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Смартфони', 'Samsung Galaxy A10 - чудовий смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений IPS LCD-дисплеєм, що відображає до 16 млн.'),
(3, 'ua', 25, 'Samsung Galaxy A20', '<p>Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн.</p>', '<p>Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8х-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.4\" і камерою на 13 Mpx. Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Смартфони', 'Samsung Galaxy A20 - відмінний смартфон, що працює на платформі Android з 8-ядерним процесором Exynos 7884 1600Mhz, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн.'),
(3, 'ua', 26, 'Samsung Galaxy A70', '<p>Samsung Galaxy A70 - відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx.</p>', '<p>Samsung Galaxy A70 &mdash; відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx. Оснащений дуже потужним акумулятором на 4500 mAh. EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Смартфони', 'Samsung Galaxy A70 - відмінний смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7\" і камерою на 32 Mpx.'),
(3, 'ua', 27, 'Samsung Galaxy A40', '<p>Samsung Galaxy A40 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx.</p>', '<p>Samsung Galaxy A40 &mdash; чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx. Оснащений дуже потужним акумулятором на 3100 mAh. EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, і, звичайно, USB-порт.Для любителів музики є аудіо вихід на 3.5 мм.Також варто відзначити, що він оснащений GPS-приймачем, який дозволить Вам не заблукати в будь-якому місці!</p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Смартфони', 'Samsung Galaxy A40 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 5.9\" і камерою на 16 Mpx.'),
(3, 'ua', 28, 'Samsung Galaxy A2', '<p>GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</p>', '<p><span id=\"hscc\">GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобільні телефони', 'GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графіч'),
(3, 'ua', 29, 'Samsung Galaxy A80', '<p>Самсунг Галаксі A80 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7 \"і камерою на 48 Mpx.</p>', '<h3>Більш живі й природні кадри</h3>\r\n<p>Режим Scene Optimizer допомагає вашим фотографіям стати дійсно приголомшливими. Використовуючи штучний інтелект, смартфон визначає, що знаходиться в кадрі, і покращує фото для отримання більш живою і яскравої картинки. А також пропонує оптимальні настройки освітлення для зйомки в темряві, щоб ваші знімки вийшли якнайкраще.</p>\r\n<h3>Суцільне задоволення</h3>\r\n<p>Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою без всяких відволікаючих деталей. А роздільна здатність Full HD + робить зображення максимально детальним.</p>\r\n<h3>Акумулятор, який тримає заряд довше</h3>\r\n<p>Спілкуйтеся, шукайте потрібну інформацію в мережі, слухайте улюблену музику і діліться свіжими фото з друзями в соціальних мережах. Samsung Galaxy A80 з ємною батареєю на 3700 мАг дозволяє користуватися смартфоном весь день, без обмежень. Режим адаптивного енергоощадження оптимізує енергоспоживання, закриваючи невикористовувані додатки, а технологія швидкої зарядки потужністю 25 Вт дозволяє заряджати батарею неймовірно швидко.</p>\r\n<h3>Готовий прийняти виклик</h3>\r\n<p>Маючи потужний 8-ядерний процесор і 8 Гб оперативної пам\'яті, Galaxy A80 здатний впоратися з будь-яким завданням. Тим більше, що функція Intelligent Performance Enhancer, яка розпізнає звички користувача, робить роботу системи ще більш ефективною. Завдяки цьому ви можете комфортно працювати, грати і використовувати свій телефон по максимуму кожен раз.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильні телефони', 'Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою '),
(3, 'ua', 30, 'Samsung Galaxy A20e', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки.</p>', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки. Апарат оснастили IPS-дисплеєм Infinity-V діагоналлю 5,8 дюйма з роздільною здатністю 1560x720 пікселів з невеликим вирізом для селф-камери у верхній частині. Сканер відбитків пальців, на відміну від старших моделей лінійки, розташувався на задній кришці пристрою. Під &laquo;капотом&raquo; Galaxy A20e встановлений процесор Exynos 7884, який працює за підтримки 3 ГБ оперативної пам\'яті. Вбудоване сховище об\'ємом 32 ГБ можна додатково розширити за допомогою карти microSD. Ємність акумулятора новинки з підтримкою швидкої зарядки потужністю 15 Вт складає 3000 мАг. Основна камера гаджета складається з двох сенсорів: основного з дозволом 16 Мп (f / 1.9) і допоміжного 5-мегапіксельного з діафрагмою f / 2.2. Фронталки представлена ​​єдиним датчиком на 8 Мп (f / 2.0).</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильні телефони', 'Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з «краплею», подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидк'),
(3, 'ua', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився.&nbsp;</p>', '<p>ПРЕКРАСНА СІМКА</p>\r\n<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка &laquo;Додому&raquo; тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корпус в нових кольорах з допрацьованим дизайном.</p>\r\n<p>притягують увагу</p>\r\n<p>iPhone 7 притягує до себе увагу. Унікальний колір &laquo;чорний онікс&raquo; радує око благородної грою світла на глянцевому поверхні і гранях. Корпус захищений від бризок і води. Оновлені кнопка &laquo;Додому&raquo; і дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОДОМУ&raquo;</p>\r\n<p>Стала сенсорної і отримала чутливість до сили натискання. Завдяки вбудованому Taptic Engine тактильний відгук при натисненні отримав кілька рівнів інтенсивності. Чим сильніше натискання на кнопку, тим сильніше відгук телефону - це новий досвід використання і сприйняття.</p>\r\n<p>вологозахистом КОРПУСУ</p>\r\n<p>Конструкція корпусу iPhone змінилася і всередині. Смартфон нового покоління захищений за стандартом IP67 від вологи і пилу.</p>\r\n<p>КАРДИНАЛЬНО НОВИЙ ПОГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 виявлено новий модуль камери з 6-лінзовий об\'єктивом зі світлосилою &fnof; / 1.8 і оптичною стабілізацією. Сенсор став в 2 рази швидше. Спалах з 4 діодами. Спеціальний ISP-процесор керує роботою камери. Все це виводить якість знімків на новий рівень, особливо в умовах недостатньої освітленості. Фронтальна камера оснащена сенсором 7 Мп з поліпшеним колірним діапазоном. Отримати чіткі і яскраві Селфі тепер ще простіше.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильні телефони', 'Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка «Додому» тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корп'),
(1, '', 34, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br><br>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br><br><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br><br>Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br><br><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br><br>Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br><br><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br><br>Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br><br><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br><br>Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br><br><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br><br>Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br><br><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br><br>Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br><br><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br><br>Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br><br><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br><br>Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br><br><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br><br>Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!'),
(3, 'ua', 32, 'Samsung Galaxy S7', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px.</p>', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px. Оснащений потужним акумулятором на 3000 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ік-порт, стерео Bluetooth, і, звичайно, USB-порт. Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобільні телефони', 'Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з р'),
(3, 'ua', 33, 'Apple iPhone X', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн з переосмисленої системою управління.</p>', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн<br>з переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. Досконале апаратне ядро, завдяки найпотужнішою внутрішньої 64 бітної архітектури. Разюче поліпшена найпопулярніша в світі мобільна камера.<br>Саме таким бачить свій флагманський смартфон компанія Apple в 2017 році.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобільні телефони', 'Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн\r\nз переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. '),
(2, '', 34, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.'),
(3, '', 34, 'Samsung Galaxy Watch', '<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>', '<p><strong>Смарт-годинник Samsung Galaxy Watch Active</strong></p>\r\n<p>Ваш новий рівень функціональних можливостей</p>\r\n<p><strong>Нові можливості</strong></p>\r\n<p>Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес &ndash; годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.</p>\r\n<p><strong>Дизайн для активних користувачів</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active &ndash; це сучасний гаджет, укладений в гармонійний спортивний корпус. Чи плануєте відвідати вечірку або конференцію? Великий вибір ремінців різних кольорів допоможе вам легко змінити стиль та імідж в залежності від настрою або дрес-коду.</p>\r\n<p><strong>Проста лаконічна краса</strong></p>\r\n<p>Маючи в запасі різні візуальні варіанти, циферблат Samsung Galaxy Watch Active налаштовується на ваш ритм, щоб відповідати стилю і функціональним потребам. Яку б ви не ставили мета перед собою, смарт &ndash; годинник Samsung допоможуть її досягти.</p>\r\n<p><strong>Завжди залишайтеся в формі</strong></p>\r\n<p>Годинники Samsung Galaxy Watch Active мотивують вас підтримувати форму. Режим &laquo;Денна активність&raquo; допоможе вам досягати намічених цілей:не сидіть, рухайтеся, будьте активними. Вдосконалені високочутливі сенсори руху автоматично виконують виміри і відстежують сім різних типів активності, щоб надати вам точну інформацію про ваших денних фізичних навантаженнях. У годиннику встановлено датчик GPS. Ступінь їх водозащити становить 5ATM.</p>\r\n<p><strong>Керуйте рівнем стресу</strong></p>\r\n<p>Інтегрований датчик серцебиття відстежує ваш серцевий ритм і, в разі виявлення аномальних відхилень, відправляє вам повідомлення. Годинники Samsung Galaxy Watch Active визначать рівень вашого стресу і запропонують зробити дихальні вправи на розслаблення. Спостерігайте за рівнем стресу до і після розслабляючого дихання.</p>\r\n<ul>\r\n<li>Контроль стресу і енергії в кілька торкань</li>\r\n<li>Розслаблюючі дихальні вправи допоможуть вам прийти в норму</li>\r\n<li>Медитативних вправи для відновлення внутрішнього балансу</li>\r\n</ul>\r\n<p><strong>Слідкуйте за здоров\'ям</strong></p>\r\n<p>Додаток Samsung Health допоможе вам здійснювати постійний контроль за своїм самопочуттям. Переглядайте дані про стан вашого здоров\'я на дисплеї годин, користуйтеся великою кількістю інструментів, щоб керувати не тільки своєю фізичною активністю, а й загальним самопочуттям.</p>\r\n<p><strong>Не завершуйте спілкування</strong></p>\r\n<p>Завжди залишайтеся на зв\'язку. Надсилайте смайлики, текстові або голосові повідомлення за допомогою Galaxy Watch Active, навіть коли ваш телефон знаходиться на підзарядці.</p>\r\n<p><strong>Передові технології заряду</strong></p>\r\n<p>Інноваційна технологія бездротової зарядки Wireless Power Share допоможе швидко поповнити заряд пристрою. Galaxy Watch Active відстежують вашу активність до 45 годин без підзарядки.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Зустрічайте оновлену генерацію Samsung Galaxy Watch Active. Ці унікальні фітнес – годинник не тільки збирають дані про вашої активності та систематизують їх, вони дають корисні поради, щоб ви завжди залишалися лідером.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br><br>Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br><br><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br><br>Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br><br><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br><br>Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br><br><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br><br>Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br><br>Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br><br><strong>SAMSUNG HEALTH</strong>&nbsp;<br><br>С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br><br><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br><br>Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br><br><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br><br>Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br><br><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br><br>Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br><br><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br><br>Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br><br><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br><br>Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br><br><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br><br>С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br><br><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br><br>Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов. '),
(2, '', 35, 'Samsung Galaxy Watch', '<p>The Samsung Galaxy Watch combines the elegant design of a classic watch with cutting-edge technology from the world of smart gadgets.</p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.</span></li>\r\n<li><span class=\"a-list-item\">Go nonstop for days on a single charge. The wireless charger lets you power up without slowing down. (Average expected performance based on typical use. Results may vary.)</span></li>\r\n<li><span class=\"a-list-item\">Available in two sizes and three colors, the Galaxy Watch offers stylish watch faces so realistic they hardly look digital. Plus, choose from a collection of interchangeable bands.</span></li>\r\n<li><span class=\"a-list-item\">Pairs with both Android and iOS smartphones via Bluetooth connection.</span></li>\r\n<li><span class=\"a-list-item\">Included in box: Galaxy Watch, Additional Strap (Large and Small included), Wireless charging Dock, Travel Adaptor, Quick Start Guide, User Manual (Warranty: 1 Year Standard Parts and Labor)</span></li>\r\n</ul>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.'),
(3, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.</p>', '<p><strong>НЕМАЄ МЕЖІ ДОСКОНАЛОСТІ </strong></p>\r\n<p>Знайомтеся: ваш провідник у світ персональної ефективності. Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.</p>\r\n<p><strong>НОВИЙ ПОГЛЯД НА АУТЕНТИЧНІСТЬ </strong></p>\r\n<p>Оригінальне дизайнерське рішення Samsung Galaxy Watch пропонує можливість вибору об\'ємного 3D циферблата з імітацією справжніх стрілок та звуку цокання, як ніколи наближаючи досвід використання до відчуттів від традиційних механічних годинників.</p>\r\n<p><strong>ОБЕРІТЬ СВІЙ СТИЛЬ </strong></p>\r\n<p>Підкресліть свою індивідуальність із Galaxy Watch. Виберіть модель, яка підходить вам за кольором і розміром корпусу: з діаметром 42 мм (колір Глибокий чорний або Рожеве золото) або 46 мм (колір Срібляста сталь). Надайте образу завершеність, підібравши сподобався дизайн циферблата і ремінця.</p>\r\n<p><strong>ЗАВЖДИ АКТИВНИЙ ЕКРАН </strong></p>\r\n<p>Налаштуйте режим Always On Display так, щоб sAMOLED екран ваших Galaxy Watch показував час завжди - без необхідності натискати на кнопку увімкнення або повертати безіль.</p>\r\n<p><strong>ПЕРСОНАЛЬНИЙ ФІТНЕС-ТРЕНЕР </strong></p>\r\n<p>Виведіть ефективність ваших тренувань на новий рівень із персональним тренером - Samsung Galaxy Watch! Ваш розумний пристрій виміряє частоту серцевого ритму та автоматично зафіксує різні типи активності. Виберіть додаткову активність для відстеження зі списку до 39 можливих варіантів.</p>\r\n<p><strong>SAMSUNG HEALTH </strong></p>\r\n<p>За допомогою сервісу Samsung Health ви можете розширити існуючі функції Galaxy Watch та ще й детальніше фіксувати параметри стану вашого здоров\'я.</p>\r\n<p><strong>НА СТРАЖІ ЗДОРОВ\'Я ВДЕНЬ І ВНІЧІ </strong></p>\r\n<p>Всі знають, наскільки важливим є здоровий сон і як він впливає на самопочуття. Samsung Galaxy Watch проаналізує параметри сну протягом ночі, фіксуючи в журналі його фази.</p>\r\n<p><strong>ПЕРСОНАЛЬНИЙ АСИСТЕНТ </strong></p>\r\n<p>Galaxy Watch фіксує ваше пробудження та виводить на екран інформацію про погоду, а також список справ на сьогодні та нагадування. Зведення подій перед сном відображає пропущені нагадування, результати тренувань та активності, погоду на завтра та стан заряду акумулятора.</p>\r\n<p><strong>ТАЙМ МЕНЕДЖМЕНТ </strong></p>\r\n<p>Переведіть Samsung Galaxy Watch в режим My Day для зручного та ефективного керування своїм часом. Швидкий та зручний доступ до запланованих подій, відстеження часу до наступного сповіщення та нагадування, які не дадуть нічого пропустити. Плануйте свій день ефективно та легко. Менше часу на плани, більше на їхню реалізацію.</p>\r\n<p><strong>ВЕЛИКА БІБЛІОТЕКА ДОДАТКІВ </strong></p>\r\n<p>Бібліотека програм Galaxy Apps дозволить вибрати не тільки найзручніші інструменти для виконання щоденних завдань, але й різні ігри, розроблені спеціально для круглого дисплея Galaxy Watch.</p>\r\n<p><strong>КОМПАКТНИЙ НАВІГАТОР </strong></p>\r\n<p>Вбудований модуль GPS допоможе визначити місцезнаходження та відстежити маршрут руху. А вбудовані альтиметр та барометр допоможуть, якщо ви вирішите зійти з наміченого маршруту.</p>\r\n<p><strong>ЗАЛИШАЙТЕ ГАМАНЕЦЬ ВДОМА</strong></p>\r\n<p>За допомогою зручного та надійного сервісу безконтактної оплати Samsung Pay, покупки можна робити одним помахом руки &ndash; вам навіть не потрібно виймати з кишені смартфон чи гаманець.</p>\r\n<p><strong>ЗАРЯДЖАЙТЕСЯ БЕЗ ДРОТІВ</strong></p>\r\n<p>Зарядити акумулятор простіше. Помістіть Galaxy Watch на бездротовий зарядний пристрій і процес заряджання розпочнеться автоматично.</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Годинники', 'Samsung Galaxy Watch - це поєднання елегантного дизайну класичного годинника з передовими технологіями зі світу розумних гаджетів.'),
(1, '', 39, 'Apple iPhone 12 Black', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12 Black', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 39, 'Apple iPhone 12 Black', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12 Black', 'Apple iPhone 12 Black, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 39, 'Apple iPhone 12 Black', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12 Black', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.'),
(2, '', 45, 'Man T-shirt Green', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 'Man T-shirt Green', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.'),
(3, '', 45, 'Футболка зелена', '<p>Якісна чоловіча футболка зі стрейч-бавовни.</p>', '<p>Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт. Футболка виготовлена із зносостійкого матеріалу та витримує багаторазове прання після яких не кашлатиться та зберігає колір. Широкий розмірний ряд: XS, S, M, L, XL, XXL. Щільність: 200 г/м2 Матеріал чоловічих футболок зносостійкий і витримує багаторазове прання, при цьому зберігає колір і не кашлатається. Щільність футболки дозволяє робити на ній вишивку логотипу, а також наносити фірмові знаки за допомогою шовкотрафаретного друку.</p>', 'Футболка зелена', 'Футболка зелена', 'Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт.'),
(1, '', 45, 'Футболка зелёная', '<p>Качественная мужская футболка из стрейч-хлопка</p>', '<p>Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. Футболка изготовлена из износостойкого материала и выдерживает многократные стирки после которых не кашлатится и сохраняет цвет. Широкий размерный ряд: XS, S, M, L, XL, XXL. Плотность: 200 г/м2 Материал мужских футболок износостойкий и выдерживает многократные стирки при этом сохраняет цвет и не кашлатится. Плотность футболки позволяет делать на ней вышивку логотипа, а так же наносить фирменные знаки при помощи шелкотрафаретной печати.</p>', 'Футболка зелёная', 'Футболка зелёная', 'Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. '),
(2, '', 41, 'Apple iPhone 12 White', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12 White', 'Apple iPhone 12 White, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 41, 'Apple iPhone 12 White', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12 White', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.'),
(1, '', 41, 'Apple iPhone 12 White', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12 White', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 42, 'Apple iPhone 12 Green', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12 Green', 'Apple iPhone 12 Green, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 42, 'Apple iPhone 12 Green', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.'),
(1, '', 42, 'Apple iPhone 12 Green', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(2, '', 43, 'Apple iPhone 12 Red', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12 Red', 'Apple iPhone 12 Red, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 43, 'Apple iPhone 12 Red', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.'),
(1, '', 43, 'Apple iPhone 12 Red', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 44, 'Apple iPhone 12 Blue', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12 Blue', 'Apple iPhone 12 Blue, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.'),
(3, '', 44, 'Apple iPhone 12 Blue', '<p>У всіх новинок традиційно найшвидший процесор Apple і підтримка 5G. Ще із загального - найміцніший екран за всю історію iPhone.</p>', '<h3>Плоский і зухвалий</h3>\r\n<p>Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове &laquo;залізо&raquo;, в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Неймовірно міцний</h3>\r\n<p>Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Приголомшливо швидкий</h3>\r\n<p>Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Замінює кіностудію</h3>\r\n<p>iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Інноваційно гарний</h3>\r\n<p>Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.'),
(1, '', 44, 'Apple iPhone 12 Blue', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 46, 'Man T-shirt White', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 'Man T-shirt White', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.'),
(3, '', 46, 'Футболка біла', '<p>Якісна чоловіча футболка зі стрейч-бавовни.</p>', '<p>Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт. Футболка виготовлена із зносостійкого матеріалу та витримує багаторазове прання після яких не кашлатиться та зберігає колір. Широкий розмірний ряд: XS, S, M, L, XL, XXL. Щільність: 200 г/м2 Матеріал чоловічих футболок зносостійкий і витримує багаторазове прання, при цьому зберігає колір і не кашлатається. Щільність футболки дозволяє робити на ній вишивку логотипу, а також наносити фірмові знаки за допомогою шовкотрафаретного друку.</p>', 'Футболка біла', 'Футболка біла', 'Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт.'),
(1, '', 46, 'Футболка белая', '<p>Качественная мужская футболка из стрейч-хлопка</p>', '<p>Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. Футболка изготовлена из износостойкого материала и выдерживает многократные стирки после которых не кашлатится и сохраняет цвет. Широкий размерный ряд: XS, S, M, L, XL, XXL. Плотность: 200 г/м2 Материал мужских футболок износостойкий и выдерживает многократные стирки при этом сохраняет цвет и не кашлатится. Плотность футболки позволяет делать на ней вышивку логотипа, а так же наносить фирменные знаки при помощи шелкотрафаретной печати.</p>', 'Футболка белая', 'Футболка белая', 'Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. '),
(2, '', 47, 'Man T-shirt Black', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 'Man T-shirt Black', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.'),
(3, '', 47, 'Футболка чорна', '<p>Якісна чоловіча футболка зі стрейч-бавовни.</p>', '<p>Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт. Футболка виготовлена із зносостійкого матеріалу та витримує багаторазове прання після яких не кашлатиться та зберігає колір. Широкий розмірний ряд: XS, S, M, L, XL, XXL. Щільність: 200 г/м2 Матеріал чоловічих футболок зносостійкий і витримує багаторазове прання, при цьому зберігає колір і не кашлатається. Щільність футболки дозволяє робити на ній вишивку логотипу, а також наносити фірмові знаки за допомогою шовкотрафаретного друку.</p>', 'Футболка чорна', 'Футболка чорна', 'Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт.'),
(1, '', 47, 'Футболка чёрная', '<p>Качественная мужская футболка из стрейч-хлопка</p>', '<p>Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. Футболка изготовлена из износостойкого материала и выдерживает многократные стирки после которых не кашлатится и сохраняет цвет. Широкий размерный ряд: XS, S, M, L, XL, XXL. Плотность: 200 г/м2 Материал мужских футболок износостойкий и выдерживает многократные стирки при этом сохраняет цвет и не кашлатится. Плотность футболки позволяет делать на ней вышивку логотипа, а так же наносить фирменные знаки при помощи шелкотрафаретной печати.</p>', 'Футболка чёрная', 'Футболка чёрная', 'Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. '),
(2, '', 48, 'Man T-shirt Blue', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 'Man T-shirt Blue', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.'),
(3, '', 48, 'Футболка синя', '<p>Якісна чоловіча футболка зі стрейч-бавовни.</p>', '<p>Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт. Футболка виготовлена із зносостійкого матеріалу та витримує багаторазове прання після яких не кашлатиться та зберігає колір. Широкий розмірний ряд: XS, S, M, L, XL, XXL. Щільність: 200 г/м2 Матеріал чоловічих футболок зносостійкий і витримує багаторазове прання, при цьому зберігає колір і не кашлатається. Щільність футболки дозволяє робити на ній вишивку логотипу, а також наносити фірмові знаки за допомогою шовкотрафаретного друку.</p>', 'Футболка синя', 'Футболка синя', 'Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт.'),
(1, '', 48, 'Футболка синяя', '<p>Качественная мужская футболка из стрейч-хлопка</p>', '<p>Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. Футболка изготовлена из износостойкого материала и выдерживает многократные стирки после которых не кашлатится и сохраняет цвет. Широкий размерный ряд: XS, S, M, L, XL, XXL. Плотность: 200 г/м2 Материал мужских футболок износостойкий и выдерживает многократные стирки при этом сохраняет цвет и не кашлатится. Плотность футболки позволяет делать на ней вышивку логотипа, а так же наносить фирменные знаки при помощи шелкотрафаретной печати.</p>', 'Футболка синяя', 'Футболка синяя', 'Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. '),
(2, '', 49, 'Man T-shirt Red', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 'Man T-shirt Red', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.'),
(3, '', 49, 'Футболка червона', '<p>Якісна чоловіча футболка зі стрейч-бавовни.</p>', '<p>Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт. Футболка виготовлена із зносостійкого матеріалу та витримує багаторазове прання після яких не кашлатиться та зберігає колір. Широкий розмірний ряд: XS, S, M, L, XL, XXL. Щільність: 200 г/м2 Матеріал чоловічих футболок зносостійкий і витримує багаторазове прання, при цьому зберігає колір і не кашлатається. Щільність футболки дозволяє робити на ній вишивку логотипу, а також наносити фірмові знаки за допомогою шовкотрафаретного друку.</p>', 'Футболка червона', 'Футболка червона', 'Недорога чоловіча футболка з якісного стрейчу матеріалу ідеально сидить на будь-якій фігурі. В наявності великий вибір кольорів та розмірів, футболка підходить для щоденного носіння та для брендування під вишивку або принт.'),
(1, '', 49, 'Футболка красная', '<p>Качественная мужская футболка из стрейч-хлопка</p>', '<p>Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. Футболка изготовлена из износостойкого материала и выдерживает многократные стирки после которых не кашлатится и сохраняет цвет. Широкий размерный ряд: XS, S, M, L, XL, XXL. Плотность: 200 г/м2 Материал мужских футболок износостойкий и выдерживает многократные стирки при этом сохраняет цвет и не кашлатится. Плотность футболки позволяет делать на ней вышивку логотипа, а так же наносить фирменные знаки при помощи шелкотрафаретной печати.</p>', 'Футболка красная', 'Футболка красная', 'Недорогая мужская футболка из качественного стрейч материала идеально сидит на любой фигуре. В наличии большой выбор цветов и размеров, футболка подходит для ежедневной носки и для брендированния под вышивку или принт. '),
(2, '', 50, 'Samsung Galaxy A50 White', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 'Samsung Galaxy A50 White', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.'),
(3, '', 50, 'Samsung Galaxy A50 White', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', 'Samsung Galaxy A50 White', 'Samsung Galaxy A50, Samsung, Мобільні телефони', 'Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер'),
(1, '', 50, 'Samsung Galaxy A50 White', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A50 White', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.'),
(2, '', 51, 'Samsung Galaxy A50 Blue', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 'Samsung Galaxy A50 Blue', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.'),
(3, '', 51, 'Samsung Galaxy A50 Blue', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', 'Samsung Galaxy A50 Blue', 'Samsung Galaxy A50, Samsung, Мобільні телефони', 'Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер'),
(1, '', 51, 'Samsung Galaxy A50 Blue', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br></span></p>', 'Samsung Galaxy A50 Blue', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 — отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.');

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
(1, '', 9, '', 'Красный'),
(1, '', 10, '', 'Синий'),
(1, '', 11, '', 'Черный'),
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
(2, 'en', 9, '', 'Red'),
(2, 'en', 10, '', 'Blue'),
(2, 'en', 11, '', 'Black'),
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
(3, 'ua', 9, '', 'Червоний'),
(3, 'ua', 10, '', 'Синій'),
(3, 'ua', 11, '', 'Чорний'),
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
(1, '', 159, 'L', 'Зелёный'),
(2, '', 159, 'L', 'Green'),
(3, '', 158, 'M', 'Зелений'),
(2, '', 158, 'M', 'Green'),
(3, '', 157, 'S', 'Зелений'),
(3, '', 159, 'L', 'Зелений'),
(1, '', 157, 'S', 'Зелёный'),
(1, '', 158, 'M', 'Зелёный'),
(2, '', 157, 'S', 'Green'),
(2, '', 109, '64 GB', 'White'),
(3, '', 109, '64 ГБ', 'Білий'),
(1, '', 109, '64 ГБ', 'Белый'),
(2, '', 110, '128 GB', 'White'),
(3, '', 110, '128 ГБ', 'Білий'),
(1, '', 110, '128 ГБ', 'Белый'),
(2, '', 111, '256 GB', 'White'),
(3, '', 111, '256 ГБ', 'Білий'),
(1, '', 111, '256 ГБ', 'Белый'),
(2, '', 121, '64 GB', 'Green'),
(3, '', 121, '64 ГБ', 'Зелений'),
(1, '', 121, '64 ГБ', 'Зеленый'),
(2, '', 122, '128 GB', 'Green'),
(3, '', 122, '128 ГБ', 'Зелений'),
(1, '', 122, '128 ГБ', 'Зеленый'),
(2, '', 123, '256 GB', 'Green'),
(3, '', 123, '256 ГБ', 'Зелений'),
(1, '', 123, '256 ГБ', 'Зеленый'),
(2, '', 133, '64 GB', 'Red'),
(3, '', 133, '64 ГБ', 'Червоний'),
(1, '', 133, '64 ГБ', 'Красный'),
(2, '', 134, '128 GB', 'Red'),
(3, '', 134, '128 ГБ', 'Червоний'),
(1, '', 134, '128 ГБ', 'Красный'),
(2, '', 135, '256 GB', 'Red'),
(3, '', 135, '256 ГБ', 'Червоний'),
(1, '', 135, '256 ГБ', 'Красный'),
(2, '', 145, '64 GB', 'Blue'),
(3, '', 145, '64 ГБ', 'Синій'),
(1, '', 145, '64 ГБ', 'Синий'),
(2, '', 146, '128 GB', 'Blue'),
(3, '', 146, '128 ГБ', 'Синій'),
(1, '', 146, '128 ГБ', 'Синий'),
(2, '', 147, '256 GB', 'Blue'),
(3, '', 147, '256 ГБ', 'Синій'),
(1, '', 147, '256 ГБ', 'Синий'),
(2, '', 238, '512 GB', 'White'),
(1, '', 237, '256 ГБ', 'Белый'),
(3, '', 237, '256 ГБ', 'Білий'),
(2, '', 184, 'L', 'White'),
(3, '', 184, 'L', 'Білий'),
(1, '', 184, 'L', 'Белый'),
(2, '', 185, 'XL', 'White'),
(3, '', 185, 'XL', 'Білий'),
(1, '', 185, 'XL', 'Белый'),
(2, '', 186, 'XXL', 'White'),
(3, '', 186, 'XXL', 'Білий'),
(1, '', 186, 'XXL', 'Белый'),
(1, '', 238, '512 ГБ', 'Белый'),
(2, '', 237, '256 GB', 'White'),
(3, '', 238, '512 ГБ', 'Білий'),
(3, '', 241, '128 ГБ', 'Синій'),
(2, '', 196, 'XS', 'Black'),
(3, '', 196, 'XS', 'Чорний'),
(1, '', 196, 'XS', 'Черный'),
(2, '', 197, 'M', 'Black'),
(3, '', 197, 'M', 'Чорний'),
(1, '', 197, 'M', 'Черный'),
(2, '', 198, 'XXL', 'Black'),
(3, '', 198, 'XXL', 'Чорний'),
(1, '', 198, 'XXL', 'Черный'),
(1, '', 243, '256 ГБ', 'Синий'),
(3, '', 243, '256 ГБ', 'Синій'),
(3, '', 242, '512 ГБ', 'Синій'),
(2, '', 242, '256 GB', 'Blue'),
(2, '', 241, '128 GB', 'Blue'),
(2, '', 243, '512 GB', 'Blue'),
(1, '', 242, '512 ГБ', 'Синий'),
(1, '', 241, '128 ГБ', 'Синий'),
(2, '', 208, 'L', 'Blue'),
(3, '', 208, 'L', 'Синій'),
(1, '', 208, 'L', 'Синий'),
(2, '', 209, 'M', 'Blue'),
(3, '', 209, 'M', 'Синій'),
(1, '', 209, 'M', 'Синий'),
(2, '', 210, 'XXL', 'Blue'),
(3, '', 210, 'XXL', 'Синій'),
(1, '', 210, 'XXL', 'Синий'),
(2, '', 220, 'XS', 'Red'),
(3, '', 220, 'XS', 'Червоний'),
(1, '', 220, 'XS', 'Красный'),
(2, '', 221, 'S', 'Red'),
(3, '', 221, 'S', 'Червоний'),
(1, '', 221, 'S', 'Красный'),
(2, '', 222, 'M', 'Red'),
(3, '', 222, 'M', 'Червоний'),
(1, '', 222, 'M', 'Красный');

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
(2, 'Catalog', 2),
(3, 'Information', 3),
(4, 'Help', 4),
(5, 'Landing pages', 5),
(6, 'Other pages', 6),
(7, 'Confidentiality', 7),
(8, 'Hidden', 8);

-- --------------------------------------------------------

--
-- Table structure for table `t_options`
--

DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translit` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_options`
--

INSERT INTO `t_options` (`id`, `feature_id`, `value`, `translit`, `position`) VALUES
(1, 1, '#000000', '000000', 1),
(2, 3, 'IOS', 'ios', 2),
(3, 5, 'Apple A11 Bionic', 'applea11bionic', 3),
(4, 6, '6', '6', 4),
(5, 7, '2.39 GHz', '239ghz', 5),
(6, 8, 'Apple A11 GPU', 'applea11gpu', 6),
(7, 4, '3 GB', '3gb', 7),
(8, 9, '64 GB', '64gb', 23),
(9, 10, 'No', 'no', 9),
(10, 11, '12 MP', '12mp', 10),
(11, 12, '7 MP', '7mp', 11),
(12, 13, 'OLED', 'oled', 12),
(13, 14, '5.8\"', '58', 13),
(14, 15, 'Li-Ion', 'liion', 14),
(15, 16, '2716 mAh', '2716mah', 15),
(16, 17, '1 SIM', '1sim', 16),
(17, 18, 'Nano-SIM', 'nanosim', 17),
(18, 5, 'Apple A10 Fusion', 'applea10fusion', 18),
(19, 6, '4', '4', 19),
(20, 7, '2.34 GHz', '234ghz', 20),
(21, 8, 'PowerVR Series7XT Plus', 'powervrseries7xtplus', 21),
(22, 4, '2 GB', '2gb', 22),
(23, 9, '32 GB', '32gb', 8),
(24, 13, 'IPS', 'ips', 24),
(25, 14, '4.7\"', '47', 25),
(26, 16, '1960 mAh', '1960mah', 26),
(27, 3, 'Android', 'android', 27),
(28, 5, 'Qualcomm Snapdragon 820', 'qualcommsnapdragon820', 28),
(29, 7, '2.6 GHz', '26ghz', 29),
(30, 8, 'Qualcomm Adreno 530', 'qualcommadreno530', 30),
(31, 4, '4 GB', '4gb', 31),
(32, 10, 'microSDXC', 'microsdxc', 32),
(33, 12, '5 MP', '5mp', 33),
(34, 13, 'Super AMOLED', 'superamoled', 34),
(35, 14, '5.5\"', '55', 35),
(36, 16, '3000 mAh', '3000mah', 36),
(37, 17, '2 SIM', '2sim', 37),
(38, 5, 'Exynos 7884', 'exynos7884', 38),
(39, 6, '8', '8', 39),
(40, 7, '1.6 GHz', '16ghz', 40),
(41, 8, 'ARM Mali-G71', 'armmalig71', 41),
(42, 11, '13 MP + 5 MP', '13mp5mp', 42),
(43, 12, '8 MP', '8mp', 43),
(44, 13, 'PLS', 'pls', 44),
(45, 15, 'Li-Pol', 'lipol', 45),
(46, 1, '#ff0000', 'ff0000', 46),
(47, 5, 'Apple A14 Bionic', 'applea14bionic', 47),
(48, 7, '3.1 GHz', '31ghz', 48),
(49, 8, 'Apple A14 GPU', 'applea14gpu', 49),
(50, 9, '128 GB', '128gb', 50),
(51, 9, '256 GB', '256gb', 51),
(52, 11, '12 MP + 12 MP', '12mp12mp', 52),
(53, 12, '12 MP', '12mp', 53),
(54, 14, '6.1\"', '61', 54),
(55, 16, '2775 mAh', '2775mah', 55),
(56, 18, 'e-SIM', 'esim', 56),
(57, 1, '#0000ff', '0000ff', 57),
(58, 1, '#008000', '008000', 58),
(59, 1, '#ffffff', 'ffffff', 59),
(60, 3, 'Watch OS', 'watchos', 60),
(61, 5, 'Apple S4', 'apples4', 61),
(62, 6, '2', '2', 62),
(63, 9, '16 GB', '16gb', 63),
(64, 14, '1.78”', '178', 64),
(65, 1, '#808080', '808080', 65),
(66, 5, 'Exynos 7870', 'exynos7870', 66),
(67, 8, 'ARM Mali-T830', 'armmalit830', 67),
(68, 4, '1 GB', '1gb', 68),
(69, 9, '8 GB', '8gb', 69),
(70, 10, 'microSD', 'microsd', 70),
(71, 11, '8 MP', '8mp', 71),
(72, 14, '5\"', '5', 72),
(73, 16, '2600 mAh', '2600mah', 73),
(74, 18, 'micro-SIM', 'microsim', 74),
(75, 3, 'iPadOS', 'ipados', 75),
(76, 5, 'Apple A12 Bionic', 'applea12bionic', 76),
(77, 7, '2.4 GHz', '24ghz', 77),
(78, 14, '10.5\"', '105', 78),
(79, 16, '8650 mAh', '8650mah', 79),
(80, 5, 'Qualcomm Snapdragon 675', 'qualcommsnapdragon675', 80),
(81, 7, '2.0 GHz', '20ghz', 81),
(82, 8, 'Adreno 612', 'adreno612', 82),
(83, 4, '6 GB', '6gb', 83),
(84, 11, '32 MP + 5 MP + 8 MP', '32mp5mp8mp', 84),
(85, 12, '32 MP', '32mp', 85),
(86, 14, '6.7\"', '67', 86),
(87, 16, '4500 mAh', '4500mah', 87),
(88, 14, '6.4\"', '64', 88),
(89, 16, '4000 mAh', '4000mah', 89),
(90, 11, '13 MP', '13mp', 90),
(91, 14, '6.2\"', '62', 91),
(92, 16, '3400 mAh', '3400mah', 92),
(93, 5, 'Exynos 9610', 'exynos9610', 93),
(94, 7, '2.3 GHz', '23ghz', 94),
(95, 8, 'ARM Mali-G72 MP3', 'armmalig72mp3', 95),
(96, 9, '512 GB', '512gb', 96),
(97, 11, '25 MP + 5 MP + 8 MP', '25mp5mp8mp', 97),
(98, 12, '25 MP', '25mp', 98),
(99, 5, 'Exynos 9820', 'exynos9820', 99),
(100, 7, '2.7 GHz', '27ghz', 100),
(101, 8, 'Adreno 640', 'adreno640', 101),
(102, 11, '48 MP + 12 MP + 5 MP', '48mp12mp5mp', 102),
(103, 5, 'Qualcomm Snapdragon 888', 'qualcommsnapdragon888', 103),
(104, 7, '2.84 GHz', '284ghz', 104),
(105, 8, 'Adreno 660', 'adreno660', 105),
(106, 4, '12 GB', '12gb', 106),
(107, 11, '12 MP + 12 MP + 12 MP', '12mp12mp12mp', 107),
(108, 12, '10 MP', '10mp', 108),
(109, 13, 'Dynamic AMOLED', 'dynamicamoled', 109),
(110, 14, '7.6\"', '76', 110),
(111, 16, '4400 mAh', '4400mah', 111),
(112, 5, 'Qualcomm Snapdragon 439', 'qualcommsnapdragon439', 112),
(113, 8, 'Adreno 505', 'adreno505', 113),
(114, 11, '13 MP + 2 MP', '13mp2mp', 114),
(115, 14, '5.7\"', '57', 115),
(116, 2, 'XS', 'xs', 116),
(117, 2, 'S', 's', 117),
(118, 2, 'L', 'l', 119),
(119, 2, 'XL', 'xl', 120),
(120, 2, 'XXL', 'xxl', 121),
(121, 2, 'M', 'm', 118),
(122, 5, 'Qualcomm Snapdragon 835', 'qualcommsnapdragon835', 122),
(123, 7, '2.35 GHz', '235ghz', 123),
(124, 8, 'Adreno 540', 'adreno540', 124),
(125, 16, '7300 mAh', '7300mah', 125),
(126, 5, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730', 126),
(127, 7, '2.2 GHz', '22ghz', 127),
(128, 8, 'Adreno 618', 'adreno618', 128),
(129, 4, '8 GB', '8gb', 129),
(130, 11, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera', 130),
(131, 12, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera', 131),
(132, 16, '3700 mAh', '3700mah', 132),
(133, 5, 'Exynos 7904', 'exynos7904', 133),
(134, 7, '1.8 GHz', '18ghz', 134),
(135, 11, '13 MP + 5 MP + 5 MP', '13mp5mp5mp', 135),
(136, 12, '16 MP', '16mp', 136),
(137, 16, '5000 mAh', '5000mah', 137),
(138, 11, '16 MP + 5 MP', '16mp5mp', 138),
(139, 14, '5.9\"', '59', 139),
(140, 16, '3100 mAh', '3100mah', 140);

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
(1, 1, '0.00', 3, 0, '0000-00-00 00:00:00', 1, '2024-07-10 21:17:52', 0, 'Liam Payne', '', '', 'mail@site.com', '', 1, '38e5d32630b318737c03eb544deddbd5', '', '', '1309.42', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:47:16', 2),
(2, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2024-07-15 15:19:59', 0, 'Charlotte', '', '', 'charlotte@site.com', '', 2, '94670643965fcf1f5f8ae4604f073f10', '', '', '549.99', '', '0.00', '0.00', '', 0.00, 0, '2023-12-06 21:03:24', 2),
(3, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2024-07-16 16:24:02', 0, 'Noah', '', '545-65-34', 'ai@mail.ru', '', 1, 'fa1b494a7004358b4987c29f9cd8a7fe', '', '', '795.15', '', '5.00', '0.00', '', 0.00, 0, '2024-04-19 14:47:09', 2),
(4, 1, '0.00', 4, 1, '0000-00-00 00:00:00', 1, '2024-07-17 08:32:55', 1, 'John Smith', '633 W College Ave, York, PA ; 906 E Market St, York, PA ; 561 Linden Ave, York, PA ', '+1(234) 567-89-01', 'me@example.com', '', 2, 'da6e81cd23b0e9a3e66913adfa1cbaf0', '', '', '1296.87', '', '10.00', '0.00', '', 0.00, 0, '2024-07-08 18:29:02', 2),
(5, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2024-07-13 21:35:43', 0, 'Taras Melnik', 'Kyiv, Budivelnykiv str. 3', '333-23-23', 'mmkzz78@google.com', '', 0, '35e6c462f2f349dea6941fb2350cf32e', '', '', '1253.00', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:43:50', 3),
(6, 1, '0.00', 2, 1, '0000-00-00 00:00:00', 0, '2024-07-20 21:47:16', 0, 'Shevchenko Vitaly', 'Kharkiv, st. Bukova 34', '123456789', 'socolvzz34@gmail.com', '', 3, '37c6c99e6ee164d64a4fa76b78fef632', '', '', '1692.00', '', '0.00', '0.00', '', 0.00, 0, '2024-05-20 19:46:32', 3),
(7, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2024-07-10 12:48:21', 0, 'Oliver', '', '', 'mail123@site.com', '', 1, 'fa96fccd519a211023a6402471aa02d2', '', '', '1953.00', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:47:00', 2),
(8, 0, '0.00', 3, 1, '0000-00-00 00:00:00', 1, '2024-07-10 21:51:23', 0, 'Sophia', '', '', 'sophiamail@site.com', '', 2, 'c3146961b7460c4d25a0bd35c993bad7', '', '', '98.00', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:47:24', 2),
(9, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2024-07-10 21:53:36', 0, 'Alex', '', '', 'alex@site.com', '', 3, 'f46d90f4284abb451e2492ff23eccfeb', '', '', '279.99', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:47:49', 2),
(10, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2024-07-20 21:58:41', 0, 'Sebastian', '', '', 'Seb888@site.com', '', 0, '9bdb3edb7928ba2acb14f1b5f7d903aa', '', '', '1061.68', '', '0.00', '0.00', '', 0.00, 0, '2023-12-06 21:02:10', 2),
(11, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2024-07-20 22:00:51', 0, 'Samuel', '', '', 'samuel@site.com', '', 3, '53b5383e5ce0c5ee35899ba629dff4e4', '', '', '1061.68', '', '0.00', '0.00', '', 0.00, 0, '2023-12-06 21:01:36', 2),
(12, 2, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2024-07-20 22:02:41', 0, 'Amelia', '', '+1(888)888-88-88', 'amelia7899@site.com', '', 1, 'c1de5e6970cdcda6aa218817618cf5d9', '', '', '470.00', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:46:53', 2),
(13, 1, '0.00', 5, 0, '0000-00-00 00:00:00', 0, '2024-07-18 14:04:15', 0, 'Christian', '', '', 'me@example.com', '', 0, '42bc4be54c0ce1a8fdcf1e2e769a16d0', '', '', '417.00', '', '0.00', '0.00', '', 0.00, 0, '2024-04-19 14:39:58', 2);

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
(1, 0, '', 'Online store Turboshop', 'Home', 'Turboshop — a store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.', 'Online store Turboshop', '<p>Turboshop &mdash; a store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles. We have been working with trusted manufacturers since 2008. We deliver products on time.</p>\r\n<p>Buying a product is only simple at first glance. You need to think about how to arrange delivery, who will assemble the wardrobe or install the air conditioner. In our store, these services are already thought out. Just think about selecting products in the catalog. For this, we offer a comprehensive approach &mdash; our team will do all the tasks!</p>', 8, 1, 1, 'Home', '2024-08-21 21:41:13'),
(2, 0, 'all-products', 'All products', 'All products', 'All products', 'All products', '', 8, 2, 1, 'All products', '2024-08-21 21:41:21'),
(3, 0, '404', '404', 'Page not found', 'Page not found', 'Page not found', '<p>Page not found</p>', 8, 4, 1, 'Page not found', '2024-08-21 21:41:36'),
(4, 0, 'sitemap', 'Sitemap', 'Sitemap', 'Sitemap', 'Sitemap', '', 4, 18, 1, 'Sitemap', '2024-07-04 16:33:36'),
(5, 0, 'new', 'New', 'New', 'New', 'New', '', 2, 5, 1, 'New', '2023-12-06 21:05:39'),
(6, 0, 'featured', 'Featured', 'Featured', 'Featured', 'Featured', '', 2, 6, 1, 'Featured', '2024-04-20 15:58:02'),
(7, 0, 'sale', 'Sale', 'Sale', 'Sale', 'Sale', '', 2, 7, 1, 'Sale', '2024-04-20 15:57:40'),
(8, 0, 'hit', 'Hit', 'Hit', 'Hit', 'Hit', '', 2, 8, 1, 'Hit', '2024-04-20 15:57:18'),
(9, 0, 'wishlist', 'Wishlist', 'Wishlist', 'Wishlist', 'Wishlist', '', 3, 9, 1, 'Wishlist', '2024-07-04 16:41:42'),
(10, 0, 'compare', 'Compare', 'Compare', 'Compare', 'Compare', '', 3, 10, 1, 'Compare', '2024-07-04 16:41:48'),
(11, 0, 'payments', 'Payment', 'Payment', 'Payment\r\n', 'Payment', '<h2>Cash</h2>\r\n<p>You can pay the courier directly in rubles at the time of delivery. The Express delivery within New York next day after order acceptance.</p>\r\n<h2>PayPal</h2>\r\n<p>Make purchases&nbsp;safely,&nbsp;without disclosing information&nbsp;about your credit card.&nbsp;PayPal&nbsp;will protect&nbsp;you if&nbsp;problems occur&nbsp;with purchase.</p>', 4, 11, 1, 'Payment', '2024-07-05 13:00:08'),
(12, 0, 'deliveries', 'Delivery', 'Delivery', 'Delivery', 'Delivery', '<h2>Shipping within New York</h2>\r\n<p>Courier delivery is made&nbsp;the next day&nbsp;after ordering,&nbsp;if the item is in stock.&nbsp;Courier delivery is made&nbsp;within the New York&nbsp;daily from&nbsp;10.00 to&nbsp;21.00.&nbsp;For orders&nbsp;more than $300 delivered free of charge.<br><br>Cost&nbsp;free delivery is calculated&nbsp;from&nbsp;the total order&nbsp;with&nbsp;the discount&nbsp;taken into account.&nbsp;If the order amount&nbsp;after applying the discount&nbsp;less than $300,&nbsp;is&nbsp;a paid service.</p>\r\n<p>For orders&nbsp;less than $300,&nbsp;the&nbsp;delivery&nbsp;cost is $50.</p>\r\n<h2>Store pickup</h2>\r\n<p>Convenient, free&nbsp;and&nbsp;fast way of receiving your order.</p>\r\n<p>Office address:&nbsp;41 West 40th Street New York, USA</p>\r\n<h2>C.O.D (Cash On Delivery)</h2>\r\n<p>On delivery order cash on delivery through \"mail of USA\", you will be able to pay for the order at the time goods are received.</p>', 4, 12, 1, 'Delivery', '2024-07-05 13:00:00'),
(13, 0, 'blog', 'Blog', 'Blog', '', 'Blog', '', 1, 26, 1, 'Blog', '2024-07-06 18:50:23'),
(14, 0, 'contact', 'Contacts', 'Contacts', 'Contacts', 'Contacts', '', 1, 29, 1, 'Contacts', '2024-07-06 18:50:23'),
(27, 0, 'licenses', 'Licenses', 'Licenses', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Licenses', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>\r\n<blockquote>\r\n<h5>&ldquo; But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. &rdquo;</h5>\r\n</blockquote>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.But I must explain to you how all this mistaken idea of denouncing pleasure and praising.</p>', 7, 27, 1, 'Licenses', '2024-07-05 12:17:42'),
(28, 0, 'offer', 'Offer', 'Offer', 'No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 'Offer', '<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself.</p>\r\n<p>Because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee.</p>', 7, 28, 1, 'Offer', '2024-07-05 12:06:12'),
(15, 0, 'brands', 'Brands', 'Brands', '', 'Brands', '', 2, 13, 1, 'Brands', '2024-07-04 16:37:14'),
(16, 0, 'articles', 'Articles', 'Articles', '', 'Articles', '', 1, 25, 1, 'Articles', '2024-07-06 18:50:23'),
(17, 0, 'catalog', 'Catalog', 'Catalog', '', 'Catalog', '', 8, 3, 1, 'Catalog', '2024-08-21 21:41:30'),
(18, 0, 'search', 'Search', 'Search', '', 'Search', '', 4, 16, 1, 'Search', '2024-07-04 16:37:22'),
(22, 0, 'catalog/smartphones/operatingsystem-ios', 'IOS smartphones', 'IOS smartphones', 'Smartphones operating system IOS', 'IOS smartphones', '<p>Smartphones operating system IOS</p>', 5, 23, 1, 'IOS smartphones', '2024-07-04 16:31:25'),
(23, 0, 'catalog/smartphones/operatingsystem-android', 'Android smartphones', 'Android smartphones', 'Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.', 'Android smartphones', '<p>Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.</p>\r\n<p>Buying an Android smartphone is also an excellent solution for those who want to quickly receive up-to-date updates and use all the features provided by the OS. Many well-known manufacturers, competing with each other, offer customers new models of Android phones in any price range</p>', 5, 24, 1, 'Android smartphones', '2024-07-04 16:31:31'),
(21, 0, 'catalog/smartphones/brand-samsung', 'Samsung smartphones ', 'Samsung smartphones ', 'Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.', 'Samsung smartphones ', '<p>Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.</p>', 5, 22, 1, 'Samsung smartphones ', '2024-07-04 16:31:18'),
(24, 0, 'catalog/smartphones/brand-apple', 'Apple smartphones', 'Apple smartphones', 'Apple smartphones are presented in a wide range', 'Apple smartphones', '<p>Apple smartphones are presented in a wide range</p>', 5, 21, 1, 'Apple smartphones', '2024-07-04 16:31:11'),
(25, 0, 'faq', 'FAQ', 'FAQ', 'FAQ', 'FAQ', '', 4, 17, 1, 'FAQ', '2024-07-04 16:37:28'),
(26, 0, 'reviews', 'Reviews', 'Reviews', 'Reviews', 'Reviews', '<p>We are grateful to our customers for their trust and positive feedback on cooperation with our online store. If you want, we can help you too: we will select suitable products and related services. Just contact us!</p>', 1, 15, 1, 'Reviews', '2024-07-06 18:50:23'),
(29, 0, 'shop', 'About shop', 'About shop', 'Turboshop an online store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.', 'About shop', '<p>Turboshop &mdash; an online store of useful things for yourself, your home, office, and cottage. Here you will find products to suit your preferences: from audio equipment and clothing to building materials and bicycles.</p>\r\n<p>We have been operating since 2008, so we have identified reliable partners through personal experience. We cooperate with trusted manufacturers whose products meet standards. As well as &mdash; with delivery services that deliver orders on time.</p>\r\n<h3>Excellent customer service!</h3>\r\n<p>Our managers &mdash; assistants and consultants. They will help you choose the size of the T-shirt, the model of the laptop, and the wardrobe for the living room. They will also advise on how to place an order and make a payment. Managers answer questions in the online chat and through feedback forms. The average response time is 10 minutes.</p>\r\n<blockquote>We consider the history of purchases and communication to personalize responses and offers. It is important for us to solve the issue quickly and efficiently. Building long-term relationships &mdash; one of the main goals. We understand that it is easier to buy goods in a store where preferences are already known and help with the choice.</blockquote>\r\n<h3>Comprehensive approach to products and services</h3>\r\n<p>Buying a product is only simple at first glance. You need to think about how to arrange delivery, who will lift the wardrobe to the 8th floor and install the air conditioner in the bedroom. In our store, these processes are already set up. Just think about selecting products in the catalog. For this, we offer a comprehensive approach &mdash; our team will do all the tasks!</p>\r\n<ul>\r\n<li>Delivery of goods to the apartment within 24 hours.</li>\r\n<li>A manager who knows the details of the orders.</li>\r\n<li>Services for installation, setup, connection, and others.</li>\r\n</ul>\r\n<p>We will make life brighter, cozier, and more comfortable. In our online store, you will find the product you need. If you have any questions, write to the online chat. We will be happy to help with the choice and provide details of the order.</p>', 1, 14, 1, 'Shop', '2024-07-06 19:01:45'),
(30, 16, 'articles/business-advice', 'Business advice', 'Business advice', '', 'Business advice', '', 1, 30, 1, 'Business advice', '2024-07-06 19:02:49'),
(31, 16, 'articles/project-management', 'Project management', 'Project management', '', 'Project management', '', 1, 31, 1, 'Project management', '2024-07-06 19:04:10'),
(32, 16, 'articles/increased-sales', 'Increased sales', 'Increased sales', '', 'Increased sales', '', 1, 32, 1, 'Increased sales', '2024-07-06 19:25:24'),
(33, 0, 'requisites', 'Requisites', 'Requisites', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Requisites', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 3, 33, 1, 'Requisites', '2024-07-07 11:22:50'),
(34, 0, 'shops', 'Shops', 'Shops', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Shops', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 3, 34, 1, 'Shops', '2024-07-07 11:24:36'),
(35, 0, 'certificates', 'Certificates', 'Certificates', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus.', 'Certificates', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum vulputate semper. Proin iaculis porta aliquet. Etiam at purus dignissim, feugiat sem quis, condimentum lacus. Quisque ut erat a ex consectetur sagittis. Aenean id diam vel justo tempor mollis vitae eu justo. Vestibulum quis pellentesque libero. Nunc quis auctor purus, id mollis quam. Integer volutpat est quis dolor venenatis, ut luctus lacus consectetur. Aenean interdum et urna ultricies pulvinar. Sed vel justo sed magna ornare blandit. Curabitur non venenatis enim. Integer sed vulputate est. Donec tristique orci eu orci porta, id facilisis tortor pharetra. Proin in augue vitae nisl malesuada auctor.</p>\r\n<p>Vivamus placerat nisl non odio imperdiet molestie. Praesent pulvinar maximus sodales. Vestibulum nunc dolor, aliquam sit amet venenatis nec, feugiat vel nulla. Etiam ullamcorper accumsan tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin feugiat porta. Maecenas in venenatis justo. Donec imperdiet mollis nisi, ut ornare augue tincidunt quis. Integer blandit, libero eu volutpat tempus, dolor est ullamcorper nunc, ac porta lacus nisl sed justo. Vivamus mollis lectus eu fringilla ultrices. Nullam sagittis justo id sagittis varius. Phasellus sapien orci, porttitor a nisi eget, pretium interdum tellus.</p>\r\n<p>Suspendisse tempor, justo non egestas fringilla, mi nisl faucibus neque, ac auctor ligula nulla at turpis. Donec dapibus, velit et ultrices egestas, mauris nulla dapibus nibh, ac consequat nulla nunc vitae nunc. Integer in euismod leo. Nam quis risus felis. Sed eget leo hendrerit, laoreet lorem sit amet, tempor neque. Integer hendrerit libero laoreet libero egestas, vitae tincidunt dolor semper. Integer interdum elit at tellus iaculis, at maximus elit fermentum. Praesent dolor metus, scelerisque nec porta in, maximus et tellus. In sed porta metus. Pellentesque mauris augue, vehicula ac rutrum in, tristique nec tortor. Duis consequat lorem eu arcu varius consectetur. Praesent finibus porttitor lorem eu condimentum. Etiam egestas sollicitudin tellus eget pretium. Fusce vehicula egestas ante sit amet suscipit.</p>\r\n<p>Morbi eu quam auctor, ornare mi vel, imperdiet justo. Cras finibus metus nibh. Morbi consequat sem eget lacus maximus, semper volutpat nisi feugiat. Morbi congue sed mi lobortis laoreet. Duis sed nisi a massa auctor suscipit. Pellentesque malesuada ex at enim sodales blandit. Nullam et odio sed sem mollis dignissim. In interdum vulputate congue.</p>\r\n<p>Maecenas efficitur dictum quam, a pretium est consectetur sit amet. Nullam lobortis, sem sed elementum laoreet, nisi lorem pretium sapien, non sollicitudin elit felis et massa. Duis et eros ligula. Aliquam nunc risus, viverra eu sagittis eget, sagittis nec justo. Mauris eu fermentum ligula. Fusce sed neque vitae lorem varius mattis. Quisque vestibulum neque quis commodo finibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin a rutrum ante. Proin est eros, imperdiet ut nisi non, lobortis mollis ex. Donec convallis, nulla sed sodales dapibus, nisl orci hendrerit justo, ut pretium tortor leo sed velit. Nullam ac mattis lorem.</p>', 3, 35, 1, 'Certificates', '2024-07-07 11:29:32'),
(36, 0, 'info', 'Information', 'Information', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Information', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 6, 36, 1, 'Information', '2024-08-21 21:43:04'),
(37, 0, 'help', 'Help', 'Help', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis.', 'Help', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nisl ut facilisis cursus, lacus lectus interdum justo, nec luctus sem orci vel felis. Curabitur fringilla lorem a erat efficitur, in tempor mauris ultricies. Sed accumsan risus ac arcu vulputate, at placerat risus aliquet. Aenean quis nunc vel risus sodales lacinia. Ut ut metus nulla. Donec at turpis enim. Nam eget mauris id purus consectetur scelerisque. Aliquam erat volutpat. Morbi varius, nisi ut lobortis dapibus, augue eros convallis mauris, sit amet commodo magna justo ut ligula.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur gravida turpis sed odio dictum, ut vestibulum est auctor. Integer eget justo magna. Suspendisse eget elit nec risus fermentum blandit. Sed euismod, mi vel tincidunt elementum, mi mauris consectetur odio, non pharetra orci est id sapien. Nam varius, magna nec viverra ullamcorper, elit sapien egestas nisi, sed aliquet felis eros vel lorem. Duis vehicula felis non sapien gravida feugiat.</p>', 6, 37, 1, 'Help', '2024-08-21 21:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_payment_methods`
--

DROP TABLE IF EXISTS `t_payment_methods`;
CREATE TABLE `t_payment_methods` (
  `id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` float NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_payment_methods`
--

INSERT INTO `t_payment_methods` (`id`, `module`, `name`, `icon`, `code`, `description`, `currency_id`, `settings`, `enabled`, `position`) VALUES
(2, 'Liqpay', 'Liqpay', 'Liqpay.svg', '', '<p>LiqPay is a payment system that allows you to pay with MasterCard and VISA credit cards, as well as in cash through Privatbank self-service terminals. Payment is possible after entering the account through a mobile phone number.</p>', 1, 'a:2:{s:17:\"liqpay_public_key\";s:0:\"\";s:18:\"liqpay_private_key\";s:0:\"\";}', 1, 3),
(3, 'null', 'Cash Payment', '', 'hand-holding-usd', '<p>If you do not want to pre-pay the order, you have the opportunity to pay the courier in cash at the time of receipt of the parcel. To make the process as comfortable as possible for both you and the courier, we recommend that you prepare the required amount in advance.</p>', 2, 'N;', 1, 2),
(4, 'PayPal', 'PayPal', 'PayPal.svg', '', '<p>PayPal is a global e-commerce business allowing payments and money transfers to be made through the Internet. Online money transfers serve as electronic alternatives to paying with traditional paper methods, such as checks and money orders.</p>', 1, 'a:2:{s:8:\"business\";s:0:\"\";s:4:\"mode\";s:7:\"sandbox\";}', 1, 4),
(5, 'WayForPay', 'WayForPay', 'WayForPay.svg', '', '<p>WayForPay is an online service with payment through bank cards of VISA and MasterCard payment systems. Available payment methods: Privat 24, terminal, the service serves the acceptance of payments through the Bitcoin system.</p>', 1, 'a:3:{s:18:\"wayforpay_merchant\";s:13:\"test_merch_n1\";s:19:\"wayforpay_secretkey\";s:24:\"flk3409refn54t54t*FNJRET\";s:18:\"wayforpay_language\";s:2:\"UA\";}', 1, 5),
(6, 'Fondy', 'Fondy', 'Fondy.svg', '', '<p>Fondy is an international payment service for entrepreneurs from all over the world.</p>', 1, 'a:4:{s:16:\"fondy_merchantid\";s:7:\"1396424\";s:12:\"fondy_secret\";s:4:\"test\";s:13:\"fondy_paymode\";s:1:\"Y\";s:10:\"fondy_lang\";s:2:\"ua\";}', 1, 6);

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
  `to_xml` tinyint(1) DEFAULT '0',
  `external_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_to` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_products`
--

INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_xml`, `external_id`, `sale_to`, `last_modified`) VALUES
(1, 'apple-ipad-mini', 1, 'Apple iPad mini', '<p>7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.</p>', '<p><strong>REALLY BIG</strong>&nbsp;<br><br>The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine. 7.9\" Retina display with True Tone technology. And Apple Pencil support to make it even easier for you to follow inspiration. It\'s still the same iPad mini, but now it can do more.&nbsp;<br><br><strong>COMPACT. PORTABLE. POCKET-ABLE</strong>&nbsp;<br><br>The iPad mini is incredibly compact and lightweight, making it easy to keep you company wherever you go. It weighs less than 400g and is 6.1mm thick and fits perfectly in a pocket or bag. It is very comfortable to hold in your hand and can be quickly pulled out of your pocket when inspiration calls for it.&nbsp;<br><br><strong>PERFORMANCE GOES BEYOND SIZE</strong>&nbsp;<br><br>The power and intelligence of iPad mini comes from the A12 Bionic Processor with Neural Engine. Using machine learning technologies, the processor quickly recognizes patterns, suggests options, and learns from experience. Work in Adobe Photoshop CC, augmented reality, immersive games with console-level graphics - there\'s enough power for everything.&nbsp;<br><br><strong>It\'s NOT THE DISPLAY SIZE, IT\'S THE PIXEL QUALITY</strong>&nbsp; <br><br>iPad mini has a stunning 7.9-inch display with over 3 million pixels. And Apple made the most of each. High brightness, wide color gamut, and anti-reflective coating make iPad mini perfect for any environment. Whether you\'re reading a book in the park or editing a video at home, images and text will always look as clear and natural as possible. And True Tone technology automatically adjusts white balance based on lighting, so colors look even more natural.&nbsp;<br><br><strong>STAY CONNECTED. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad mini let you capture amazing photos and videos. And that\'s not all. You can FaceTime with friends, scan documents, make notes on them, or even plan furniture rearrangements using AR (augmented reality) technology.&nbsp;<br><br><strong>APPLE PENCIL. FIT GREAT</strong>&nbsp;<br><br>Apple Pencil (sold separately) brings a million new possibilities to iPad. With it, iPad mini will turn into an incredibly convenient digital notebook. Take handwritten notes, fill out forms, and sign documents. Or get creative and sketch and draw on the go.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF YOUR IPAD</strong>&nbsp;<br><br>With iOS, the compact iPad mini lets you do the things you want iPad to do. Use multiple applications at the same time, move files with simple multi-touch gestures, open your favorite applications from the Dock. And with the Files app, all your content is always at your fingertips.&nbsp;<br><br><strong>A MILLION POSSIBILITIES IN ONE IPAD MINI</strong>&nbsp;<br><br>On iPad mini installed excellent Apple applications for everyday tasks - Photos, Maps, Messages, Mail, Safari and others. And there are over a million more iPad apps available in the App Store, making it easy to find the ones you need. Edit videos, socialize, sketch or immerse yourself in exciting online games.&nbsp;<br><br><strong>YOUR DATA BELONG TO YOU ONLY</strong>&nbsp;<br><br>How and all Apple products, iPad mini has been designed with strict privacy guidelines in mind. Touch ID is a simple and secure authentication system for iPad mini. And with Apple Pay, you can pay for purchases quickly and securely. Just touch the Touch ID sensor and you\'re done.&nbsp;</p>', 4.5, 4, 1, 1, 'Apple iPad mini', 'Apple iPad mini, Apple, Tablets', 'JUST AS BIG The iPad mini is the perfect combination of compactness and performance, and that\'s why they love it. Now there are even more reasons for love. A12 Bionic processor with Neural Engine ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-04-27 02:45:34'),
(2, 'samsung-galaxy-tab', 2, 'Samsung Galaxy Tab', '<p>Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for entertainment and multitasking.</p>', '<p><strong>MULTITASKING WITHOUT LIMITS</strong>&nbsp;<br><br>Designed with your busy lifestyle and need to constantly work on the go, the new Samsung Galaxy Tab S4 is your ultimate entertainment and entertainment companion. multitasking.&nbsp;<br><br><strong>SAMSUNG DEX TO MAKE YOUR WORK PRODUCTIVE</strong>&nbsp;<br><br>Samsung DeX is now compatible with the Samsung Galaxy Tab for the first time S4. Now the high productivity of work on the PC has become available on the tablet. Multitasking is available via an HDMI adapter without the need for a Samsung DeX dock or DeX pad, and you can add a keyboard, mouse or monitor for greater efficiency.&nbsp;<br><br><strong>READY TO WORK</strong>&amp;nbsp ;<br><br>Everything is at hand for the working mode. The desktop on the screen of the Galaxy Tab S4 tablet is implemented as on a regular PC, i.e. with a taskbar, multi-window support and file drag and drop functionality. If you want to have a familiar desktop on your screen, just launch Samsung DeX from the Quick Access Toolbar and add an Android compatible keyboard and mouse.&nbsp;<br><br><strong>WORK MORE EFFICIENTLY</strong>&nbsp;&lt; br /&gt;<br>The productivity of your work depends on how comfortable the working environment is. This is where using Samsung DeX with an external monitor can help. On a large monitor screen, you can continue to use the Android interface of your tablet. Or look at the monitor and use the tablet as a touchpad, pad with S Pen or touch keyboard.&nbsp;<br><br><strong>IT IS NOT OFF - IT IS IN STANDBY MODE</strong>&nbsp;<br><br>If you have a new idea, capture it on the tablet screen so you don\'t forget. With the Galaxy Tab S4\'s off-screen note-taking feature, you can quickly jot down your thoughts even on a black screen with the versatile S Pen. The thinnest 0.7mm rubber tip lets you easily and accurately take notes and sketch.&nbsp;<br><br><strong>IMPROVED PERFORMANCE</strong>&nbsp;<br><br>Speed Samsung Galaxy Tab S4\'s LTE data transfer rate is up to 1Gbps, so you\'ll have plenty of time to do other things. And with 64GB of onboard storage, expandable up to 400GB with a microSD card slot, you\'ll have plenty of room to store your documents and videos.&nbsp;<br><br><strong>DIVE DOWN ENTERTAINMENT ATMOSPHERE</strong>&nbsp;<br><br>Despite its compact size, the Galaxy Tab S4 has a large visual workspace. Thanks to the narrowest possible frame and the absence of the Samsung logo and the Home button, the screen diagonal is actually 10.5 inches. And the enhanced 16:10 aspect ratio of the sAMOLED screen creates a more immersive viewing experience for your favorite content.&nbsp;<br><br><strong>SURROUND YOURSELF WITH HIGH QUALITY SOUND</strong>&nbsp;<br><br>Four speakers, tuned by the world famous AKG company, provide sound like in real life. Now you can experiment with the adaptive audio feature created by the experts at AKG. And Dolby Atmos delivers immersive 3D sound for a lifelike experience.&nbsp;<br><br><strong>WATCH VIDEOS WITHOUT TIME</strong>&nbsp;<br>&lt; br /&gt;Galaxy Tab S4 is equipped with a 7300 mAh battery that allows you to watch videos up to 16 hours, so you can watch your favorite movies or series without thinking about the time. And if the battery runs out, you can fully charge it in just 200 minutes thanks to the quick charge function.&nbsp;<br><br><strong>USEFUL EVEN IN STANDBY MODE</strong>&nbsp;<br>&lt; br /&gt;In sleep mode, the Galaxy Tab S4 turns into a smart home display. If the tablet is charging or \"sleeping\", then using the Daily Board function, you can set the display mode for your favorite photos on the screen. In addition, the tablet can be a useful assistant and display on the screen not only the current weather forecast, but also the date and time, acting as a calendar.&nbsp;<br><br><strong>UNLOCKING WITH THE HELP OF THE IRIS</strong> &nbsp;<br><br>In addition to face recognition, the Galaxy Tab S4 now supports iris scanning. To unlock your tablet, just scan your face or iris. Built-in encryption and a secure folder, combined with bio-identification functions, will ensure the safety of your files and applications.&nbsp;<br><br><strong>MULTIPLE SECURITY SYSTEM</strong>&nbsp;<br><br>Keep your data is secure. The Samsung Knox security platform is activated from the moment you turn on your tablet. Multi-layered real-time security puts your data in a secure folder that only you have access to. Keep your work and personal data separate.&nbsp;</p>', 5.0, 1, 1, 2, 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Tablets', 'MULTITASKING WITHOUT LIMITS Designed with you busy and on the go, the new Samsung Galaxy Tab S4 is your best companion for multitasking and entertainment.', '2020-12-31 03:55:00', NULL, 1, 1, 0, '', NULL, '2024-07-27 22:09:52'),
(3, 'apple-ipad-air', 1, 'Apple iPad Air', '<p>iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g, so you can easily carry it with you wherever you go.</p>', '<p><strong>TO ALL THE LOVE OF POWERFUL TECHNOLOGY</strong>&nbsp;<br><br>iPad Air gives you access to Apple\'s most advanced designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. Plus, at just 6.1mm thin, iPad Air weighs less than 500g so you can easily carry it with you.&nbsp;<br><br><strong>EVERYTHING YOU NEED. NO WEIGHT</strong>&nbsp;<br><br>Despite the large 10.5-inch Retina display, iPad Air is very compact. It is great for solving a variety of tasks literally on the go. To do this, it is equipped with the most advanced wireless technology, as well as a battery that lasts up to 10 hours without recharging. That\'s almost a whole day.&nbsp;<br><br><strong>POWER ENOUGH FOR EVERYTHING, AT ONCE</strong>&nbsp;<br><br>The power and intelligence of iPad Air comes from the A12 Bionic processor with Neural Engine. The processor uses real-time machine learning technology to deliver incredible experiences for photography, gaming, augmented reality and more. You can edit videos, make impressive presentations, design 3D models, watch your favorite series online. And do it all at the same time.&nbsp;<br><br><strong>SUPER-FAST GRAPHICS FOR GAMES AND APPS</strong>&nbsp;<br><br>Stunning AR performance, incredible graphics experience , photorealistic graphics in 3D games - the 4-core graphics system of the A12 Bionic processor is behind it all.&nbsp;<br><br><strong>EVERYTHING IS DONE BEAUTIFUL</strong>&nbsp;<br><br>iPad Air features a 10.5-inch Retina display with wide color gamut. I want to look at this display endlessly. Photos, videos and games look alive and natural down to the smallest detail. And regardless of the environment, True Tone technology, increased brightness and anti-reflective coating help to ensure the highest quality image.&nbsp;<br><br><strong>TRUE TONE. EASY ON THE EYES IN ANY LIGHT</strong>&nbsp;<br><br>True Tone technology automatically adjusts white balance based on ambient light. Therefore, the image on the display looks more natural and comfortable for the eyes in any conditions - both during the evening reading and when you paint a sunny landscape in the open air.&nbsp;<br><br><strong>Keep in touch. SHOT IN HD. PLAY AR</strong>&nbsp;<br><br>The cameras on iPad Air let you capture stunning photos and 1080p HD video. And that\'s not all. You can communicate via FaceTime with several interlocutors, scan and immediately send documents. And even create your own worlds - iPad Air cameras work great with augmented reality technologies (augmented reality).&nbsp;<br><br><strong>PLAY, WORK AND BE CREATIVE IN Augmented Reality</strong>&nbsp;<br><br>When virtual objects and data become part of the real world, completely new horizons open up before you. With front and rear cameras, an A12 Bionic processor with Neural Engine, a large natural color display, and accurate motion tracking, iPad is the perfect device for living in augmented reality.&nbsp;<br><br><strong>SEND. DRAW. FOLLOW INSPIRATION</strong>&nbsp;<br><br>Apple Pencil (sold separately) captures hand movements with amazing precision and speed. It is comfortable to hold in your hand like a regular pencil. However, he can do much more. With Apple Pencil, your iPad Air can become a notepad or an artist\'s canvas - you have many options.&nbsp;<br><br><strong>TAKE NOTES. COMMENT ON DOCUMENTS AND SCREENSHOTS. AND MORE</strong>&nbsp;<br><br>Taking notes or jotting down ideas on iPad Air is as easy as writing on a piece of paper. You can mark up documents, add pictures to your notes, take screenshots, and add comments to them.&nbsp;<br><br><strong>IOS. HELP YOU UNLOCK THE POTENTIAL OF IPAD</strong>&nbsp;<br><br>iOS is an advanced mobile operating system that lets you control your iPad Air with simple taps. Apple calls them gestures, and they give you full access to all of the iPad Air\'s large display and smart technologies. With the multitasking feature, you can use your favorite applications at the same time - just select them from the Dock. And files can be moved from one application to another and sorted in the Files app in any way you like.&nbsp;<br><br><strong>ALL YOUR FILES HAVE BEEN GONE</strong>&nbsp;<br><br>The Files app lets you work with content that can be stored on your iPad Air, iCloud Drive, or other cloud services such as Box and Dropbox. Either way, your files will always be available - easy and simple.&nbsp;<br><br><strong>YOUR IPAD MAKES YOUR INTEREST</strong>&nbsp;<br><br>The iPad Air comes with excellent</p>', 5.0, 3, 1, 3, 'Apple iPad Air', 'Apple iPad Air, Apple, Tablets', 'iPad Air gives you access to the most advanced Apple designs. A12 Bionic processor with Neural Engine. 10.5\" Retina display with True Tone technology. Support for Apple Pencil and Smart Keyboard. ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:10:07'),
(4, 'dji-mavic-air', 3, 'DJI Mavic Air', '<p>DJI Mavic Air is a new compact drone that is even smaller, faster, more reliable and more comfortable to fly.</p>', '<p>The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. Its main advantage is the expanded functionality of the camera, which can now create spherical panoramas, ideal for viewing with virtual reality glasses. In addition, several selfie video scenarios are available to the user - slow distance, orbiting, spiraling, a sharp rise and an imitation of a boomerang flight.</p>', 0.0, 0, 1, 4, 'DJI Mavic Air', 'DJI Mavic Air, DJI, Quadcopters', 'The DJI Mavic Air quadcopter is a new model of a compact drone that is even smaller, faster, more reliable and easier to fly. ', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:10:31'),
(5, 'dji-mavic-pro-fly-more-combo', 3, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo is a model of an unmanned aerial vehicle from a famous manufacturer. More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements.</p>', '<p>Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer. More compact than the Phantom, it fits easily into a backpack without restricting the wearer\'s movements. You can take it with you on trips, outdoor photo shoots, sports competitions and any other events.</p>', 4.0, 1, 1, 5, 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Quadcopters', 'Quadcopter DJI Mavic Pro Fly More Combo is the \"younger\" model of an unmanned aerial vehicle from the famous manufacturer.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:10:48'),
(6, 'dji-phantom-4-pro', 3, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro is an upgraded model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.</p>', '<p>Quadcopter&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps. Such characteristics allow you to create full-size burst photos at up to 14 frames per second, as well as record videos with C4K resolution (4096 x 2160) and a frame rate of up to 60 per second. The user only needs to select the appropriate memory card &ndash; its maximum volume reaches 128 GB.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Improved dynamic capabilities</strong>. Despite the upgrade of the technical part, the mass of the quadrocopter has not increased &ndash; this was facilitated by the use of a frame made of magnesium, aluminum and titanium. The device can spend up to 30 minutes in the air, rising to a height of up to 6 kilometers above sea level. The maximum horizontal flight speed is 20 m / s (72 km / h), and the rise &ndash; 6 m/s (21.6 km/h). An advanced dual-band radio control system allows the aircraft to exchange signals with the remote control at a distance of up to 7 km in the absence of obstacles.</li>\r\n<li><strong>Total security</strong>. The FlightAutonomy system received two new micro-cameras and two infrared sensors located on the sides. Thanks to this, the quadcopter can recognize obstacles even in low light and automatically correct the course to avoid a collision. This feature is useful for both beginners and professional videographers, who get the opportunity to focus on the shooting process.</li>\r\n<li><strong>Easy management</strong>. There is nothing superfluous on the standard remote &ndash; the aircraft can be controlled using two mini-joysticks and two buttons. All additional functions are activated using a proprietary mobile application. In the standard version, the remote control is equipped with a holder for a smartphone, and in the PLUS version &ndash; retractable screen with a very bright backlight (1000 cd/m2), allowing you to see all the details of the image even when exposed to direct sunlight.</li>\r\n<li><strong>Automatic Flight Programs</strong>. DRAW technology allows you to draw the course of a quadrocopter on the touch screen &ndash; the device will follow it at a constant altitude, allowing you to pay maximum attention to the precise aiming of the camera. In addition, the aircraft can simply be shown the end point to which it will reach, bypassing all obstacles. Videographers will especially benefit from the automatic tracking of a moving object and the release of the shutter when gestures are recognized.</li>\r\n</ul>\r\n</div>', 5.0, 2, 1, 6, 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Quadcopters', 'Quadcopter DJI Phantom 4 Pro – modernized model of the famous aircraft. Its main difference from the previous version is represented by a new camera with a 20-megapixel sensor and a high-performance processor that provides bit rates up to 100 Mbps.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:11:03'),
(7, 'havit-g1-blackred', 4, 'Havit G1 Black/Red', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic.</p>', '<p>With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort. One charge of the earbuds is enough for 3.5 hours of active use. Headphones are protected from sweat and water, which makes it possible to use the headphones even under extreme load conditions. And two acoustic heads will blow your workouts with a bang.</p>', 3.5, 2, 1, 7, 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Accessories', 'With up to 24 hours of battery life on a single charge, Havit G1 Wireless Earphones will make your workouts more energetic. You can play sports for even longer, and secure earbuds will provide you with maximum comfort.', '2020-12-31 03:55:00', NULL, 0, 1, 0, '', NULL, '2024-07-27 22:11:20'),
(8, '1more-quad-driver', 8, '1MORE Quad Driver', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>', '<p>The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi. In an anatomically shaped aluminum case there are 4 emitters - a dynamic one made of carbon fiber and 3 reinforcement drivers responsible for low and high frequencies.</p>\r\n<p>The frequency range is amazing - from 20 Hz to 40 kHz, headphone sensitivity is 99 dB at a resistance of 32 ohms. The remote control has 3 buttons (volume control, call reception) and a microphone with noise and interference suppression. The 3.5mm mini jack is shaped like an \"L\" to ensure durability, even when carried in your pocket with your smartphone all the time.</p>\r\n<p>The polymer braid of the wires is resistant to wear, abrasion and creases, inside the structure is reinforced by Kevlar threads. The set includes a stylish gift box, a hard case, a 6.3 mm adapter, an air adapter, and 8 pairs of interchangeable ear tips of various sizes. Designed for uncompromising music enjoyment, these headphones are the best choice for true music lovers.</p>', 5.0, 1, 1, 8, '1MORE Quad Driver', '1MORE Quad Driver, 1More, Accessories', 'The wired headphones of this model won the LAAS award in Los Angeles, thanks to unsurpassed sound quality and fine tuning from sound engineer Luca Bignardi.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:12:08'),
(9, 'jbl-flip-4-red', 5, 'JBL Flip 4 Red', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 9, 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:12:20'),
(10, 'jbl-flip-4-blue', 5, 'JBL Flip 4 Blue', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 10, 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', 1, 0, 0, 0, '', NULL, '2024-07-27 22:12:33'),
(11, 'jbl-flip-4-black', 5, 'JBL Flip 4 Black', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>', '<p>JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.</p>\r\n<p>A feature of the model is the speaker\'s noise and echo cancellation technology, which is used to produce crystal clear sound. Also, with a simple push of a button, you can activate and talk to Siri or Google Now from your JBL Flip 4. The absence of interference, the clarity of the sound makes communication extremely high quality and comfortable.</p>\r\n<p>JBL Flip 4 is a waterproof portable speaker with a frequency response of 70Hz - 20kHz that guarantees amazingly powerful and clear reproduction of your favorite music. Its undeniable advantages are high technology, practicality, unpretentiousness and its own recognizable style, which allow JBL Flip 4 to stay on top.</p>', 5.0, 1, 1, 11, 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Portable acoustics', 'JBL Flip 4 is the next flagship of the Flip line, which is the next generation in the JBL Flip series of portable acoustics. Excellent acoustics has already received a number of awards.', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:12:47'),
(12, 'samsung-galaxy-watch-active-green', 2, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 4.0, 2, 1, 12, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.', '2020-12-31 03:55:01', 1, 0, 0, 0, '', NULL, '2024-07-27 22:13:02'),
(13, 'apple-watch-4-black', 1, 'Apple Watch 4 Black', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 4.5, 2, 1, 13, 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:13:13'),
(14, 'apple-watch-4-silver', 1, 'Apple Watch 4 Silver', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 0.0, 0, 1, 14, 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:13:27'),
(15, 'apple-watch-4-white', 1, 'Apple Watch 4 White', '<p>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.</p>', '<p><strong>STARTING A NEW LIFE</strong>&nbsp;<br><br>Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you stay active, stay healthy and stay connected.&nbsp;<br><br><strong>CHANGES THAT CHANGE EVERYTHING</strong>&nbsp;<br><br>Largest display in the Apple Watch lineup. New electrical heart rate sensor. Enhanced Digital Crown with tactile feedback. So familiar and at the same time fundamentally new Apple Watch Series 4 changes all ideas about the capabilities of the watch.&nbsp;<br><br><strong>FEEL. TAKE CARE. PROMPT</strong>&nbsp;<br><br>Alerts for too low and too high heart rate. Fall detection and emergency call functions. New dials \"Breath\". This watch is designed to protect you and help you lead a healthier life.&nbsp;<br><br><strong>AT THE PEAK WITH YOU</strong>&nbsp;<br><br>Automatic training recognition. New types of training: yoga and hiking. Advanced features for runners such as cadence and pace alerts. At the same time, you can display up to five indicators on the screen to accurately track your statistics.&nbsp;<br><br><strong>MOTIVATION. MOTIVATION. MOTIVATION</strong>&nbsp;<br><br>A new type of competition: one on one. The ability to share activity indicators with friends. Personal coaching tips. Monthly motivational goals. Virtual awards for achievements. Everything to inspire you to close your Activity rings every day.&nbsp;<br><br><strong>EVERYTHING IMPORTANT AT YOUR HAND</strong>&nbsp;<br><br>Walkie, phone calls and messages. Music from Apple Music and Apple\'s Podcasts app. New app experience with Siri shortcuts. So many important and necessary things - right on your wrist.&nbsp;</p>', 4.5, 2, 1, 15, 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Watch', 'Introducing Apple Watch Series 4. A watch with a completely new design and new technologies. They help you lead an even more active lifestyle, better monitor your health and always stay in touch.', '2020-12-31 03:55:01', NULL, 1, 0, 0, '', NULL, '2024-07-27 22:13:41'),
(16, 'apple-airpods', 1, 'Apple AirPods', '<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>', '<h2>Sound magic</h2>\r\n<p>Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. The new wireless headset will change your perception of simple and familiar things. No wires, decent sound quality, incredible and stylish corporate design - these headphones undoubtedly deserve attention.</p>\r\n<h2>Why a headphone processor?</h2>\r\n<p>In the list of technical characteristics of Apple AirPods, we can see the W1 processor. Moreover, he answers in this model not only for the formation of a sound signal. Headphones know what you are doing at the moment: Whether you are using 1 or 2 headphones, talking or listening to music - the system will automatically adjust to the required mode, create sound isolation, pause the music and turn it on again.</p>\r\n<h2>Decent autonomy</h2>\r\n<p>But from a mobile gadget, you need not only a range of capabilities, but also the possibility of long-term work. Apple AirPods will be able to play music continuously for 5:00. Using the charging case will make you autonomous for a day. At the same time, 15 minutes of recharging will give you another 3:00 of music and communication!</p>', 4.0, 1, 1, 16, 'Apple AirPods', 'Apple AirPods, Apple, Accessories ', 'Everyone is used to the fact that Apple accessories are more than just an addition. These things are self-sufficient and often unique. This is how Apple AirPods can be described. ', '2020-12-31 03:55:01', 1, 0, 0, 0, '', NULL, '2024-07-27 22:13:54'),
(17, 'motorola-moto-g6', 6, 'Motorola Moto G6', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.</p>', '<p>Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system. The company\'s devices are famous for their optimization and the almost complete absence of any add-ons. Motorola Moto G6 Plus is equipped with a 5.9-inch IPS screen that will give you hours of reading or video viewing pleasure thanks to its large diagonal, high resolution and excellent color reproduction. You can comfortably perform everyday tasks and even play any modern mobile games thanks to the Qualcomm Snapdragon 630 processor. In addition, the Motorola Moto G6 Plus has IPX7 water protection, and another nice bonus is the NFC module.</p>', 3.0, 1, 1, 17, 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Smartphones ', 'Motorola Moto G6 is a smartphone for those who want to get a universal solution that combines excellent performance, good performance and all the advantages of the Android 8.0 Oreo operating system.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:14:05'),
(18, 'nokia-42-ds-3', 7, 'Nokia 4.2 DS 3', '<p>With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>', '<p><strong>Life is easier just around the corner</strong></p>\r\n<p>When the Google Life Assistant is at hand, it picks up the pace. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works. Less time on the phone - more time for the joys of life.</p>\r\n<p><strong>We increased the design requirements, and then brought it to perfection</strong></p>\r\n<p>Skill and sophistication - for every day. Thickness 8.4 mm. Quality 2.5D glass with rounded corners on front and back. Not a phone, but a real pleasure to hold in your hand. 5.71 inch HD+ screen with 19:9 aspect ratio A sheer pleasure not only to hold but also to look at. A battery that adapts to you and lasts a long time.</p>\r\n<p><strong>Moments you remember have never looked so spectacular</strong></p>\r\n<p>Share your emotions. With a dual rear camera and a wide-angle selfie camera, all smiles will be in the frame. Get creative with the latest features like bokeh mode and advanced photo editing.</p>\r\n<p><strong>Continuous improvement</strong></p>\r\n<p>Nokia 4.2 - Android One smartphone on pure Android 9 Pie without third-party programs. Nothing extra - plus free security updates once a month, don\'t slow down your phone.<br>Add artificial intelligence that will suggest the necessary functions of applications based on its experience and help you manage your screen time with Digital Wellbeing.&lt; /p&gt;</p>', 5.0, 1, 1, 18, 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Smartphones', 'With the Google Assistant at your fingertips, the pace is picking up. You can ask questions, check your schedule, or even dim the lights. An assistant can do a lot. And the longer you use it, the better it works.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:14:19'),
(19, 'samsung-galaxy-fold', 2, 'Samsung Galaxy Fold', '<p>Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen.</p>', '<p>Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen. The smartphone has a folding case, so it was decided to save on small dimensions. On the front panel of the Samsung Galaxy Fold 5G there is a 4.6-inch Dynamic AMOLED display with a separate size of 1960x840 pixels.</p>', 5.0, 1, 1, 19, 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Smartphones', 'Samsung Galaxy Fold 5G is one of the most innovative technological solutions on the market that has a flimsy screen', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:14:31'),
(20, 'samsung-galaxy-s10', 2, 'Samsung Galaxy S10', '<p>Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', '<p>Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. Equipped with a very powerful battery on 4500 mAh For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), NFC, stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 5.0, 1, 1, 20, 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Smartphones', 'Samsung Galaxy S10 is an excellent Android smartphone with an octa-core Exynos 9 Octa 9820 2700Mhz processor, equipped with a 6.7\" Curved Dynamic AMOLED display that displays up to 16 million colors and a 16 Mpx camera. ', '2020-12-31 03:55:01', NULL, 1, 0, 0, '', NULL, '2024-07-27 22:14:45'),
(21, 'samsung-galaxy-a30', 2, 'Samsung Galaxy A30', '<p>Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.</p>', '<p>Samsung Galaxy A30 is a wonderful Android smartphone with Exynos 9610 1800Mhz octa-core processor, Super AMOLED display with up to 16 million colors, 6.4\" diagonal and 16 Mpx camera. Equipped with a very powerful 4000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 5.0, 1, 1, 21, 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Smartphones', 'Samsung Galaxy A30 is a wonderful smartphone running on the Android platform with an 8-core Exynos 9610 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 16 Mpx camera.', '2020-12-31 03:55:01', NULL, 0, 1, 0, '', NULL, '2024-07-27 22:15:00'),
(22, 'samsung-galaxy-m30', 2, 'Samsung Galaxy M30', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.</p>', '<p>Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 5000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 5.0, 1, 1, 22, 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Smartphones', 'Samsung Galaxy M30 is an excellent smartphone running on the Android platform with an 8-core Exynos 7904 1800Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera.', '2020-12-31 03:55:01', NULL, 0, 1, 0, '', NULL, '2024-07-27 22:15:17'),
(23, 'samsung-galaxy-a50-black', 2, 'Samsung Galaxy A50 Black', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 5.0, 3, 1, 23, 'Samsung Galaxy A50 Black', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.', '2020-12-31 03:55:01', 1, 0, 1, 1, '', NULL, '2024-07-27 22:15:31'),
(24, 'samsung-galaxy-a10', 2, 'Samsung Galaxy A10', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.</p>', '<p>Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with a 6.2\" IPS LCD display with up to 16 million colors and a 13 Mpx camera. Equipped with a very powerful 3400 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 0.0, 0, 1, 24, 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Smartphones', 'Samsung Galaxy A10 is a wonderful Android smartphone with Exynos 7884 1600Mhz octa-core processor, equipped with an IPS LCD display that displays up to 16 million colors.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:15:44'),
(25, 'samsung-galaxy-a20', 2, 'Samsung Galaxy A20', '<p>The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.</p>', '<p>Samsung Galaxy A20 is an excellent smartphone running on the Android platform with an 8-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 6.4 \"and a 13 Mpx camera. Equipped with a very powerful 4000 mAh battery For communication it can offer: WAP browser, EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and, of course, a USB port.For music lovers there is a 3.5 mm audio output.</p>', 5.0, 1, 1, 25, 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Smartphones', 'The Samsung Galaxy A20 is an excellent Android smartphone with an octa-core Exynos 7884 1600Mhz processor, equipped with a Super AMOLED display that displays up to 16 million colors.', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:15:58');
INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_xml`, `external_id`, `sale_to`, `last_modified`) VALUES
(26, 'samsung-galaxy-a70', 2, 'Samsung Galaxy A70', '<p>The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.</p>', '<p>Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a Super AMOLED display with up to 16 million colors, with a diagonal of 6.7 \"and a 32 Mpx camera. Equipped with a very powerful 4500 mAh battery. For communication, it can offer: EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port, for music lovers there is a 3.5 mm audio output.</p>', 5.0, 1, 1, 26, 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Smartphones', 'The Samsung Galaxy A70 is an excellent smartphone running on the Android platform, equipped with a 6.7\" Super AMOLED display with up to 16 million colors and a 32 Mpx camera.', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:16:15'),
(27, 'samsung-galaxy-a40', 2, 'Samsung Galaxy A40', '<p>The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.</p>', '<p>Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a Super AMOLED display that displays up to 16 million colors, with a diagonal of 5.9 \"and a 16 Mpx camera. Equipped with a very powerful 3100 mAh battery. For communication it can offer: EDGE, HSDPA, WiFi, LTE (4G), stereo Bluetooth, and of course a USB port.For music lovers, there is a 3.5 mm audio output.It is also worth noting that it is equipped with a GPS receiver, which will allow you not to get lost in any place!</p>', 4.0, 1, 1, 27, 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Smartphones', 'The Samsung Galaxy A40 is a wonderful smartphone running on the Android platform, equipped with a 5.9\" Super AMOLED display with up to 16 million colors and a 16 Mpx camera.', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2024-07-27 22:16:32'),
(28, 'samsung-galaxy-a2', 2, 'Samsung Galaxy A2', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A2 Core on the rear packs 5-megapixel camera. The rear camera setup has autofocus. It sports a 5-megapixel camera on the front for selfies.</p>\r\n<p>Samsung Galaxy A2 Core based on Android 9.0 Pie (Go edition) and packs 16GB of inbuilt storage that can be expanded via microSD card. The Samsung Galaxy A2 Core is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards.</p>\r\n<p>Connectivity options on the Samsung Galaxy A2 Core include Wi-Fi 802.11 b/g/n, GPS, Micro-USB, FM radio, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer.</p>\r\n<p><span id=\"hscc\">&nbsp;</span></p>', 5.0, 1, 1, 28, 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Mobile phones', 'Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 787', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:16:46'),
(29, 'samsung-galaxy-a80', 2, 'Samsung Galaxy A80', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A80 on the rear packs a 48-megapixel primary camera with an f/2.0 aperture and a second 8-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus.</p>\r\n<p>The Samsung Galaxy A80 runs One UI based on Android 9.0 Pie and packs 128GB of inbuilt storage. The Samsung Galaxy A80 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy A80 measures 165.20 x 76.50 x 9.30mm (height x width x thickness) . It was launched in Angel Gold, Ghost White, and Phantom Black colours. It bears a glass body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A80 include Wi-Fi 802.11 b/g/n, GPS, USB Type-C, 3G, and 4G (with support for Band 40 used by some LTE networks in India) with active 4G on both SIM cards. Sensors on the phone include accelerometer, ambient light sensor, proximity sensor, and fingerprint sensor. The Samsung Galaxy A80 supports face unlock.</p>', 4.5, 2, 1, 29, 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Mobile phones', 'Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 co', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2024-07-27 22:17:00'),
(30, 'samsung-galaxy-a20e', 2, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 4.5, 2, 1, 30, 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:17:17'),
(31, 'apple-iphone-7-black', 1, 'Apple iPhone 7 Black', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.&nbsp;</p>', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery.</p>\r\n<p>As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture. The rear camera setup has phase detection autofocus. It sports a 7-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Apple iPhone 7 based on iOS 10 and packs 32GB of inbuilt storage. The Apple iPhone 7 is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Apple iPhone 7 measures 138.30 x 67.10 x 7.10mm (height x width x thickness) and weighs 138.00 grams. It was launched in Black, Gold, Jet Black, Matte Black, Red, Rose Gold, and Silver colours.</p>\r\n<p>Connectivity options on the Apple iPhone 7 include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v4.20, NFC, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.</p>', 5.0, 1, 1, 31, 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Mobile phones', 'Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:17:30'),
(32, 'samsung-galaxy-s7', 2, 'Samsung Galaxy S7', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside.&nbsp;&nbsp;</p>', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The camera is absolutely amazing, especially in low light. This is a pragmatic phone, compared to its sibling the Galaxy S7 Edge, and is better value for money if you don\'t want to show off. However, with competition at an all-time high, you can also get most of its features and functions for one third this price.</p>', 3.7, 4, 1, 32, 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Mobile phones', 'Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The came', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:17:43'),
(33, 'apple-iphone-x', 1, 'Apple iPhone X', '<p>Apple iPhone X is the epitome of the best innovative solutions. A completely new design with a reimagined control system.</p>', '<p>Apple iPhone X is the epitome of the best innovative solutions. Brand new design<br>with a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful internal 64-bit architecture. Dramatically improved the world\'s most popular mobile camera.<br>This is exactly how Apple sees its flagship smartphone in 2017.</p>', 4.5, 2, 1, 33, 'Apple iPhone X', 'Apple iPhone X, Apple, Mobile phones', 'Apple iPhone X is the epitome of the best innovative solutions. Brand new design\r\nwith a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body.', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:17:56'),
(34, 'samsung-galaxy-watch-active', 2, 'Samsung Galaxy Watch', '<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>', '<p><strong>Galaxy Watch Active </strong></p>\r\n<p>The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.</p>\r\n<p><strong>Track your way to real results </strong></p>\r\n<p>Automatically detects up to seven exercises while tracking up to 39 more, right from your wrist.</p>\r\n<p><strong>Let your body be your guide </strong></p>\r\n<p>Sends you real-time alerts if ever detecting a high or low heart rate, so you can be more proactive about your heart health.</p>\r\n<p><strong>Resolve to rest better</strong></p>\r\n<p>A good night&rsquo;s sleep is key to boosting your performance while decreasing stress. Galaxy Watch Active helps you analyze your sleep patterns and encourages you to wind down to keep you refreshed and at your best. Proactively focus more on yourself with interactive meditation and breathing exercises, powered by Calm. Day or night, Galaxy Watch Active has you covered.</p>\r\n<p><strong>Thin. Light. Durable. </strong></p>\r\n<p>A thin, lightweight and durable swim-ready design comes in a variety of colors and interchangeable bands.</p>\r\n<p><strong>Tough, like you </strong></p>\r\n<p>Made with a military grade protection and a protective Gorilla Glass coating that prevents scratching.</p>\r\n<p><strong>Lasts for days </strong></p>\r\n<p>Go non-stop with a long-lasting battery that lasts for days on a single charge. In a hurry to make a yoga class, but need a quick recharge? Just place your Galaxy Watch Active on your compatible phone to get an extra boost.</p>\r\n<p><strong>Connect and do more </strong></p>\r\n<p>Use your watch to schedule events, set a reminder or a timer. Sync with your phone to get notifications at your wrist, so you&rsquo;ll never miss a beat. Pair Galaxy Buds to stream your playlist wirelessly, and for a power up, just place Galaxy Watch Active on your compatible phone.</p>', 4.5, 2, 1, 34, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'The lightweight, yet durable Galaxy Watch Active understands the way you work out. With auto workout tracking, you\'ll have the power to reach new goals. Plus a suite of apps help you to monitor your stress and sleep while you stay connected.', '2024-01-08 23:47:40', NULL, 1, 1, 0, '', NULL, '2024-07-07 11:55:28'),
(35, 'samsung-galaxy-watch', 2, 'Samsung Galaxy Watch', '<p>The Samsung Galaxy Watch combines the elegant design of a classic watch with cutting-edge technology from the world of smart gadgets.</p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.</span></li>\r\n<li><span class=\"a-list-item\">Go nonstop for days on a single charge. The wireless charger lets you power up without slowing down. (Average expected performance based on typical use. Results may vary.)</span></li>\r\n<li><span class=\"a-list-item\">Available in two sizes and three colors, the Galaxy Watch offers stylish watch faces so realistic they hardly look digital. Plus, choose from a collection of interchangeable bands.</span></li>\r\n<li><span class=\"a-list-item\">Pairs with both Android and iOS smartphones via Bluetooth connection.</span></li>\r\n<li><span class=\"a-list-item\">Included in box: Galaxy Watch, Additional Strap (Large and Small included), Wireless charging Dock, Travel Adaptor, Quick Start Guide, User Manual (Warranty: 1 Year Standard Parts and Labor)</span></li>\r\n</ul>', 5.0, 2, 1, 35, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Watch', 'Live a stronger, smarter life with Galaxy Watch at your wrist. Rest well and stay active with built-in health tracking and a Bluetooth connection that keeps everything at your wrist. Plus, go for days without charging.', '2024-01-08 23:53:01', NULL, 1, 0, 0, '', NULL, '2024-07-07 11:55:10'),
(39, 'apple-iphone-12-black', 1, 'Apple iPhone 12 Black', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.4, 5, 1, 39, 'Apple iPhone 12 Black', 'Apple iPhone 12 Black, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', '2024-01-23 18:29:10', 1, 1, 1, 0, '', NULL, '2024-07-27 22:18:38'),
(45, 'man-t-shirt-green', 0, 'Man T-shirt Green', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 5.0, 1, 1, 45, 'Man T-shirt Green', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.', '2023-03-07 18:14:22', NULL, 0, 0, 0, '', NULL, '2024-07-27 22:18:52'),
(41, 'apple-iphone-12-white', 1, 'Apple iPhone 12 White', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.4, 5, 1, 41, 'Apple iPhone 12 White', 'Apple iPhone 12 White, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', NULL, 1, 1, 1, 0, '', NULL, '2024-07-27 22:19:25'),
(42, 'apple-iphone-12-green', 1, 'Apple iPhone 12 Green', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.5, 6, 1, 42, 'Apple iPhone 12 Green', 'Apple iPhone 12 Green, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', NULL, 1, 1, 1, 0, '', NULL, '2024-07-27 22:19:43'),
(43, 'apple-iphone-12-red', 1, 'Apple iPhone 12 Red', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.5, 6, 1, 43, 'Apple iPhone 12 Red', 'Apple iPhone 12 Red, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', NULL, 1, 1, 1, 0, '', NULL, '2024-07-27 22:20:04'),
(44, 'apple-iphone-12-blue', 1, 'Apple iPhone 12 Blue', '<p>All new products traditionally have the fastest Apple processor and support for 5G. Another common feature is the most durable screen ever on an iPhone.</p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\"></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"img-zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\"></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 4.4, 5, 1, 44, 'Apple iPhone 12 Blue', 'Apple iPhone 12 Blue, Apple, Smartphones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.', NULL, 1, 1, 1, 0, '', NULL, '2024-07-27 22:20:19'),
(46, 'man-t-shirt-white', 0, 'Man T-shirt White', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 5.0, 1, 1, 46, 'Man T-shirt White', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.', NULL, NULL, 0, 0, 0, '', NULL, '2024-07-27 22:20:36'),
(47, 'man-t-shirt-black', 0, 'Man T-shirt Black', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 5.0, 1, 1, 47, 'Man T-shirt Black', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.', NULL, NULL, 0, 0, 0, '', NULL, '2024-07-27 22:20:50'),
(48, 'man-t-shirt-blue', 0, 'Man T-shirt Blue', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 5.0, 1, 1, 48, 'Man T-shirt Blue', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.', NULL, NULL, 0, 0, 0, '', NULL, '2024-07-07 11:55:21'),
(49, 'man-t-shirt-red', 0, 'Man T-shirt Red', '<p>Quality men\'s T-shirt made of stretch cotton</p>', '<p>An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print. The T-shirt is made of wear-resistant material and can withstand repeated washes after which it does not cough and retains its color. Wide range of sizes: XS, S, M, L, XL, XXL. Density: 200 g/m2 The material of men\'s T-shirts is wear-resistant and withstands repeated washings while retaining color and does not cough. The density of the T-shirt allows you to embroider a logo on it, as well as apply brand names using silk screen printing.</p>', 5.0, 1, 1, 49, 'Man T-shirt Red', 'Man T-shirt, Clothes', 'An inexpensive men\'s t-shirt made of high-quality stretch material fits perfectly on any figure. Available in a wide range of colors and sizes, the T-shirt is suitable for daily wear and for branding with embroidery or print.', NULL, NULL, 0, 0, 0, '', NULL, '2024-07-27 22:21:27'),
(51, 'samsung-galaxy-a50-blue', 2, 'Samsung Galaxy A50 Blue', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 5.0, 3, 1, 51, 'Samsung Galaxy A50 Blue', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.', NULL, 1, 0, 1, 1, '', NULL, '2024-07-27 22:21:44'),
(50, 'samsung-galaxy-a50-white', 2, 'Samsung Galaxy A50 White', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', 5.0, 4, 1, 50, 'Samsung Galaxy A50 White', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.', NULL, 1, 0, 1, 1, '', NULL, '2024-07-27 22:21:59');

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
(39, 7, 0),
(45, 8, 0),
(41, 7, 0),
(42, 7, 0),
(43, 7, 0),
(44, 7, 0),
(46, 8, 0),
(47, 8, 0),
(48, 8, 0),
(49, 8, 0),
(50, 7, 0),
(51, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_products_options`
--

DROP TABLE IF EXISTS `t_products_options`;
CREATE TABLE `t_products_options` (
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_products_options`
--

INSERT INTO `t_products_options` (`product_id`, `option_id`) VALUES
(2, 1),
(2, 8),
(2, 14),
(2, 27),
(2, 31),
(2, 34),
(2, 39),
(2, 43),
(2, 70),
(2, 78),
(2, 90),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(3, 4),
(3, 7),
(3, 11),
(3, 14),
(3, 24),
(3, 65),
(3, 71),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(9, 36),
(9, 45),
(9, 46),
(10, 36),
(10, 45),
(10, 57),
(11, 1),
(11, 36),
(11, 45),
(13, 1),
(13, 12),
(13, 60),
(13, 61),
(13, 62),
(13, 63),
(13, 64),
(14, 12),
(14, 60),
(14, 61),
(14, 62),
(14, 63),
(14, 64),
(14, 65),
(15, 12),
(15, 59),
(15, 60),
(15, 61),
(15, 62),
(15, 63),
(15, 64),
(18, 1),
(18, 7),
(18, 14),
(18, 17),
(18, 23),
(18, 24),
(18, 27),
(18, 36),
(18, 37),
(18, 39),
(18, 43),
(18, 70),
(18, 81),
(18, 112),
(18, 113),
(18, 114),
(18, 115),
(19, 1),
(19, 9),
(19, 17),
(19, 27),
(19, 37),
(19, 39),
(19, 45),
(19, 51),
(19, 103),
(19, 104),
(19, 105),
(19, 106),
(19, 107),
(19, 108),
(19, 109),
(19, 110),
(19, 111),
(20, 1),
(20, 17),
(20, 27),
(20, 34),
(20, 37),
(20, 39),
(20, 45),
(20, 50),
(20, 70),
(20, 83),
(20, 85),
(20, 86),
(20, 87),
(20, 99),
(20, 100),
(20, 101),
(20, 102),
(21, 1),
(21, 7),
(21, 14),
(21, 17),
(21, 23),
(21, 27),
(21, 33),
(21, 34),
(21, 37),
(21, 39),
(21, 41),
(21, 70),
(21, 88),
(21, 89),
(21, 133),
(21, 134),
(21, 138),
(22, 1),
(22, 8),
(22, 17),
(22, 27),
(22, 31),
(22, 34),
(22, 37),
(22, 39),
(22, 41),
(22, 45),
(22, 70),
(22, 88),
(22, 133),
(22, 134),
(22, 135),
(22, 136),
(22, 137),
(23, 1),
(23, 8),
(23, 17),
(23, 27),
(23, 31),
(23, 32),
(23, 34),
(23, 37),
(23, 39),
(23, 45),
(23, 50),
(23, 51),
(23, 88),
(23, 89),
(23, 93),
(23, 94),
(23, 95),
(23, 96),
(23, 97),
(23, 98),
(24, 1),
(24, 14),
(24, 17),
(24, 22),
(24, 23),
(24, 27),
(24, 33),
(24, 34),
(24, 37),
(24, 38),
(24, 39),
(24, 40),
(24, 41),
(24, 70),
(24, 90),
(24, 91),
(24, 92),
(25, 1),
(25, 7),
(25, 14),
(25, 17),
(25, 23),
(25, 27),
(25, 34),
(25, 37),
(25, 38),
(25, 39),
(25, 40),
(25, 41),
(25, 42),
(25, 43),
(25, 70),
(25, 88),
(25, 89),
(26, 1),
(26, 14),
(26, 17),
(26, 27),
(26, 34),
(26, 37),
(26, 39),
(26, 50),
(26, 70),
(26, 80),
(26, 81),
(26, 82),
(26, 83),
(26, 84),
(26, 85),
(26, 86),
(26, 87),
(27, 1),
(27, 8),
(27, 14),
(27, 17),
(27, 27),
(27, 31),
(27, 34),
(27, 37),
(27, 39),
(27, 41),
(27, 70),
(27, 98),
(27, 133),
(27, 134),
(27, 138),
(27, 139),
(27, 140),
(28, 1),
(28, 14),
(28, 24),
(28, 27),
(28, 33),
(28, 37),
(28, 39),
(28, 40),
(28, 66),
(28, 67),
(28, 68),
(28, 69),
(28, 70),
(28, 71),
(28, 72),
(28, 73),
(28, 74),
(29, 1),
(29, 9),
(29, 17),
(29, 27),
(29, 34),
(29, 37),
(29, 39),
(29, 45),
(29, 50),
(29, 86),
(29, 126),
(29, 127),
(29, 128),
(29, 129),
(29, 130),
(29, 131),
(29, 132),
(30, 1),
(30, 7),
(30, 13),
(30, 17),
(30, 23),
(30, 27),
(30, 32),
(30, 36),
(30, 37),
(30, 38),
(30, 39),
(30, 40),
(30, 41),
(30, 42),
(30, 43),
(30, 44),
(30, 45),
(31, 1),
(31, 2),
(31, 9),
(31, 10),
(31, 11),
(31, 14),
(31, 16),
(31, 17),
(31, 18),
(31, 19),
(31, 20),
(31, 21),
(31, 22),
(31, 23),
(31, 24),
(31, 25),
(31, 26),
(32, 1),
(32, 10),
(32, 14),
(32, 17),
(32, 19),
(32, 23),
(32, 27),
(32, 28),
(32, 29),
(32, 30),
(32, 31),
(32, 32),
(32, 33),
(32, 34),
(32, 35),
(32, 36),
(32, 37),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(33, 10),
(33, 11),
(33, 12),
(33, 13),
(33, 14),
(33, 15),
(33, 16),
(33, 17),
(39, 1),
(39, 2),
(39, 4),
(39, 8),
(39, 9),
(39, 12),
(39, 14),
(39, 17),
(39, 31),
(39, 37),
(39, 47),
(39, 48),
(39, 49),
(39, 50),
(39, 51),
(39, 52),
(39, 53),
(39, 54),
(39, 55),
(39, 56),
(41, 2),
(41, 4),
(41, 8),
(41, 9),
(41, 12),
(41, 14),
(41, 17),
(41, 31),
(41, 37),
(41, 47),
(41, 48),
(41, 49),
(41, 50),
(41, 51),
(41, 52),
(41, 53),
(41, 54),
(41, 55),
(41, 56),
(41, 59),
(42, 2),
(42, 4),
(42, 8),
(42, 9),
(42, 12),
(42, 14),
(42, 17),
(42, 31),
(42, 37),
(42, 47),
(42, 48),
(42, 49),
(42, 50),
(42, 51),
(42, 52),
(42, 53),
(42, 54),
(42, 55),
(42, 56),
(42, 58),
(43, 2),
(43, 4),
(43, 8),
(43, 9),
(43, 12),
(43, 14),
(43, 17),
(43, 31),
(43, 37),
(43, 46),
(43, 47),
(43, 48),
(43, 49),
(43, 50),
(43, 51),
(43, 52),
(43, 53),
(43, 54),
(43, 55),
(43, 56),
(44, 2),
(44, 4),
(44, 8),
(44, 9),
(44, 12),
(44, 14),
(44, 17),
(44, 31),
(44, 37),
(44, 47),
(44, 48),
(44, 49),
(44, 50),
(44, 51),
(44, 52),
(44, 53),
(44, 54),
(44, 55),
(44, 56),
(44, 57),
(45, 58),
(45, 117),
(45, 118),
(45, 121),
(46, 59),
(46, 118),
(46, 119),
(46, 120),
(47, 1),
(47, 116),
(47, 120),
(47, 121),
(48, 57),
(48, 118),
(48, 120),
(48, 121),
(49, 46),
(49, 116),
(49, 117),
(49, 121),
(50, 8),
(50, 17),
(50, 27),
(50, 31),
(50, 32),
(50, 34),
(50, 37),
(50, 39),
(50, 45),
(50, 50),
(50, 51),
(50, 59),
(50, 88),
(50, 89),
(50, 93),
(50, 94),
(50, 95),
(50, 96),
(50, 97),
(50, 98),
(51, 8),
(51, 17),
(51, 27),
(51, 31),
(51, 32),
(51, 34),
(51, 37),
(51, 39),
(51, 45),
(51, 50),
(51, 51),
(51, 57),
(51, 88),
(51, 89),
(51, 93),
(51, 94),
(51, 95),
(51, 96),
(51, 97),
(51, 98);

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
(196, 23, 196, 'https://www.youtube.com/watch?v=IDreNPM6-wk'),
(202, 39, 202, 'https://www.youtube.com/watch?v=MHL4JoyWSb4'),
(199, 41, 199, 'https://www.youtube.com/watch?v=MHL4JoyWSb4'),
(204, 42, 204, 'https://www.youtube.com/watch?v=MHL4JoyWSb4'),
(200, 43, 200, 'https://www.youtube.com/watch?v=MHL4JoyWSb4'),
(201, 44, 201, 'https://www.youtube.com/watch?v=MHL4JoyWSb4'),
(194, 50, 194, 'https://www.youtube.com/watch?v=IDreNPM6-wk'),
(198, 51, 198, 'https://www.youtube.com/watch?v=IDreNPM6-wk');

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
(20, 2, 23, NULL, 'Samsung Galaxy A50', '128 GB', 'Blue', '399.99', 1, '0003'),
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
(18, 12, 14, 14, 'Apple Watch 4 Silver', '', '', '470.00', 1, ''),
(19, 13, 29, 32, 'Samsung Galaxy A80', '', '', '417.00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_recommended_products`
--

DROP TABLE IF EXISTS `t_recommended_products`;
CREATE TABLE `t_recommended_products` (
  `product_id` int(11) NOT NULL,
  `recommended_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_recommended_products`
--

INSERT INTO `t_recommended_products` (`product_id`, `recommended_id`, `position`) VALUES
(39, 16, 0),
(39, 3, 1),
(39, 1, 2),
(44, 16, 0),
(44, 13, 2),
(44, 1, 1),
(43, 33, 2),
(43, 16, 0),
(42, 16, 0),
(42, 15, 1),
(42, 3, 2),
(41, 16, 0),
(41, 1, 1),
(41, 14, 2),
(61, 16, 0),
(61, 15, 0),
(61, 33, 0),
(43, 15, 1);

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
(9, 9, 2),
(9, 10, 1),
(9, 11, 0),
(10, 9, 2),
(10, 10, 1),
(10, 11, 0),
(11, 9, 2),
(11, 10, 1),
(11, 11, 0),
(39, 43, 2),
(39, 42, 3),
(39, 41, 4),
(39, 39, 0),
(39, 44, 1),
(44, 39, 0),
(44, 44, 1),
(44, 43, 2),
(44, 42, 3),
(44, 41, 4),
(43, 39, 0),
(43, 43, 2),
(43, 44, 1),
(43, 42, 3),
(43, 41, 4),
(42, 41, 4),
(42, 39, 0),
(42, 43, 2),
(42, 44, 1),
(42, 42, 3),
(41, 39, 0),
(41, 44, 1),
(41, 43, 2),
(41, 42, 3),
(41, 41, 4),
(45, 45, 4),
(45, 46, 0),
(45, 49, 3),
(45, 48, 2),
(45, 47, 1),
(46, 49, 3),
(46, 48, 2),
(46, 47, 1),
(46, 46, 0),
(46, 45, 4),
(47, 47, 1),
(47, 46, 0),
(47, 48, 2),
(47, 49, 3),
(47, 45, 4),
(48, 46, 0),
(48, 47, 1),
(48, 48, 2),
(48, 49, 3),
(48, 45, 4),
(49, 49, 3),
(49, 48, 2),
(49, 47, 1),
(49, 46, 0),
(49, 45, 4),
(23, 51, 1),
(23, 50, 2),
(23, 23, 0),
(51, 51, 1),
(51, 50, 2),
(51, 23, 0),
(50, 51, 1),
(50, 50, 2),
(50, 23, 0);

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
(1, 'date_format', 'd.m.Y'),
(2, 'admin_email', 'me@example.com'),
(3, 'admintooltip', 'on'),
(4, 'site_work', 'on'),
(5, 'admin_theme', 'default'),
(6, 'sidebar', 'default'),
(7, 'layout', 'fluid'),
(8, 'position', 'left'),
(9, 'captcha_product', '1'),
(10, 'captcha_post', '1'),
(11, 'captcha_cart', '1'),
(12, 'captcha_article', '1'),
(13, 'captcha_register', '1'),
(14, 'captcha_feedback', '1'),
(15, 'captcha_callback', '1'),
(16, 'captcha_fastorder', '1'),
(17, 'captcha_review', '1'),
(18, 'order_email', 'me@example.com'),
(19, 'comment_email', 'me@example.com'),
(20, 'notify_from_email', 'me@example.com'),
(21, 'email_lang', 'en'),
(22, 'use_smtp', ''),
(23, 'smtp_server', 'smtp.gmail.com'),
(24, 'smtp_port', '465'),
(25, 'smtp_user', ''),
(26, 'smtp_pass', ''),
(27, 'tg_notify', ''),
(28, 'tg_token', ''),
(29, 'tg_apiurl', 'https://api.telegram.org/bot'),
(30, 'tg_channel', ''),
(31, 'gpt_key', ''),
(32, 'model', 'gpt-3.5-turbo'),
(33, 'max_tokens', '800'),
(34, 'temperature', '0.7'),
(35, 'decimals_point', '.'),
(36, 'thousands_separator', ' '),
(37, 'products_num', '12'),
(38, 'products_num_admin', '20'),
(39, 'features_num_admin', '25'),
(40, 'brands_num', '15'),
(41, 'brands_num_admin', '15'),
(42, 'faq_num', '15'),
(43, 'faq_num_admin', '15'),
(44, 'max_order_amount', '50'),
(45, 'lang', 'en'),
(46, 'articles_num', '15'),
(47, 'articles_num_admin', '15'),
(48, 'blog_num', '15'),
(49, 'blog_num_admin', '15'),
(50, 'comments_num', '15'),
(51, 'comments_num_admin', '15'),
(52, 'smart_resize', ''),
(53, 'webp_support', '1'),
(54, 'chat_viber', '123456789'),
(55, 'chat_whats_app', '123456789'),
(56, 'chat_telegram', 'test'),
(57, 'chat_facebook', 'test'),
(58, 'cached', '0'),
(59, 'cache_type', '0'),
(60, 'cache_time', '86400'),
(61, 'category_count', '1'),
(62, 'watermark_enable', '1'),
(63, 'watermark_offset_x', '50'),
(64, 'watermark_offset_y', '50'),
(65, 'watermark_transparency', '50'),
(66, 'images_sharpen', '50'),
(67, 'lastModifyReviews', '2024-08-22 01:14:19'),
(68, 'theme', 'turboshop'),
(69, 'image_sizes', '|240x310|56x56|72x72|160x160|700x464|45x45|200x100|1200x1200|800x600|700x700|120x120|1920x660|1080x1080|40x40|150x50|694x463|1919x180|150x25|330x300|1500x738|400x300|30x30|180x100|50x50|35x35|90x60|800x400|240x240|550x440|125x42|750x300|570x570|800x800w|300x300|95x95|75x25|116x116|170x170|400x400|60x60|100x40|64x64|1000x1000w|800x800|96x96|80x80|340x340'),
(70, 'lastModifyPosts', '2024-08-22 01:14:49'),
(71, 'lastModifyFAQ', '2024-08-22 01:15:02'),
(72, 'lastModifyBrands', '2024-08-22 01:20:44'),
(73, 'image_quality', '90');

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
('notify_from_name', 1, 'Admin'),
('site_name', 1, 'Интернет-магазин Турбошоп'),
('units', 1, 'pc'),
('weight_units', 1, 'g'),
('company_name', 2, 'Turbo CMS'),
('notify_from_name', 2, 'Admin'),
('site_name', 2, 'Online store Turboshop'),
('units', 2, 'pc'),
('weight_units', 2, 'g'),
('company_name', 3, 'Turbo CMS'),
('notify_from_name', 3, 'Адмін'),
('site_name', 3, 'Інтернет-магазин Турбошоп'),
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

--
-- Dumping data for table `t_subscribes`
--

INSERT INTO `t_subscribes` (`id`, `date`, `email`, `processed`) VALUES
(1, '2023-10-29 18:10:54', 'mail@site.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_theme_settings`
--

DROP TABLE IF EXISTS `t_theme_settings`;
CREATE TABLE `t_theme_settings` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_theme_settings`
--

INSERT INTO `t_theme_settings` (`setting_id`, `name`, `value`) VALUES
(1, 'colors', '#dc2f2f'),
(2, 'custom_color', '#5b7fff'),
(3, 'user_color', '1'),
(4, 'more_colors_on', '0'),
(5, 'more_colors', '#dc2f2f'),
(6, 'more_custom_color', ''),
(7, 'more_user_color', '0'),
(8, 'site_width', '1500px'),
(9, 'font_family', 'Inter'),
(10, 'font_size', '16px'),
(11, 'border_radius', '8px'),
(12, 'title_weight', '600'),
(13, 'phone_1', '+38 (095) 000-00-01'),
(14, 'phone_2', '+38 (095) 000-00-02'),
(15, 'phone_3', '+38 (095) 000-00-03'),
(16, 'phone_mask', '+38 (999) 999-99-99'),
(17, 'email', 'mail@site.com'),
(18, 'map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4399.518506840664!2d-73.97964170435294!3d40.75394620817656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259aa94a61b4f%3A0x8ebce7fe1262c134!2zNDEgVyA0MHRoIFN0LCBOZXcgWW9yaywgTlkgMTAwMTgsINCh0KjQkA!5e0!3m2!1sru!2sua!4v1609512981791!5m2!1sru!2sua'),
(19, 'header_type', '1'),
(20, 'landing_pages_header', '0'),
(21, 'content_width', '1'),
(22, 'header_padding_top', '1'),
(23, 'categories_header_type', '1'),
(24, 'categories_header_position', '1'),
(25, 'categories_header_images_type', '1'),
(26, 'menu_header_id', '1'),
(27, 'block_1', '1'),
(28, 'visible_1', '1'),
(29, 'block_2', '2'),
(30, 'visible_2', '1'),
(31, 'block_3', '3'),
(32, 'visible_3', '1'),
(33, 'block_4', '4'),
(34, 'visible_4', '1'),
(35, 'block_5', '5'),
(36, 'visible_5', '1'),
(37, 'block_6', '6'),
(38, 'visible_6', '1'),
(39, 'block_7', '7'),
(40, 'visible_7', '1'),
(41, 'block_8', '8'),
(42, 'visible_8', '1'),
(43, 'block_9', '9'),
(44, 'visible_9', '1'),
(45, 'block_10', '10'),
(46, 'visible_10', '1'),
(47, 'big_banners_type', '2'),
(48, 'banners_height', '3'),
(49, 'wide_text', '0'),
(50, 'banners_adaptive_type', '2'),
(51, 'banners_slides_show_speed', '5000'),
(52, 'banners_animation_speed', '600'),
(53, 'catalog_main_sections_type', '1'),
(54, 'catalog_main_grid_column', '8'),
(55, 'catalog_main_bordered', '1'),
(56, 'catalog_main_title', '0'),
(57, 'catalog_main_delimiter', '1'),
(58, 'catalog_main_background', '0'),
(59, 'catalog_main_images_type', '1'),
(60, 'catalog_main_images_bg', '0'),
(61, 'catalog_main_padding_top', '40'),
(62, 'catalog_main_padding_bottom', '80'),
(63, 'products_tab_grid_column', '5'),
(64, 'products_tab_products_limit', '10'),
(65, 'products_tab_bordered', '0'),
(66, 'products_tab_title', '1'),
(67, 'products_tab_delimiter', '0'),
(68, 'products_tab_background', '1'),
(69, 'products_tab_padding_top', '80'),
(70, 'products_tab_padding_bottom', '40'),
(71, 'brands_main_type', '2'),
(72, 'brands_main_limit', '10'),
(73, 'brands_main_bordered', '1'),
(74, 'brands_main_title', '0'),
(75, 'brands_main_delimiter', '1'),
(76, 'brands_main_background', '1'),
(77, 'brands_main_padding_top', '40'),
(78, 'brands_main_padding_bottom', '80'),
(79, 'banners_text_grid_type', '3'),
(80, 'banners_text_position', '1'),
(81, 'banners_text_wide', '0'),
(82, 'banners_text_title', '0'),
(83, 'banners_text_delimiter', '0'),
(84, 'banners_text_background', '0'),
(85, 'banners_text_padding_top', '80'),
(86, 'banners_text_padding_bottom', '80'),
(87, 'teasers_grid_type', '4'),
(88, 'teasers_position', '1'),
(89, 'teasers_delimiter', '0'),
(90, 'teasers_background', '0'),
(91, 'teasers_padding_top', '40'),
(92, 'teasers_padding_bottom', '80'),
(93, 'bottom_banners_wide', '0'),
(94, 'bottom_banners_indented', '1'),
(95, 'bottom_banners_delimiter', '0'),
(96, 'bottom_banners_background', '1'),
(97, 'bottom_banners_padding_top', '80'),
(98, 'bottom_banners_padding_bottom', '80'),
(99, 'custom_products_grid_column', '5'),
(100, 'custom_products_category_id', '2'),
(101, 'custom_products_products_limit', '5'),
(102, 'custom_products_sort', 'position'),
(103, 'custom_products_title', '1'),
(104, 'custom_products_delimiter', '0'),
(105, 'custom_products_background', '0'),
(106, 'custom_products_bordered', '1'),
(107, 'custom_products_padding_top', '80'),
(108, 'custom_products_padding_bottom', '40'),
(109, 'company_text_button', '1'),
(110, 'company_text_url', 'shop'),
(111, 'company_text_bordered', '1'),
(112, 'company_text_image', '1'),
(113, 'company_text_delimiter', '0'),
(114, 'company_text_background', '0'),
(115, 'company_text_padding_top', '40'),
(116, 'company_text_padding_bottom', '0'),
(117, 'blog_main_grid_type', '4'),
(118, 'blog_main_title', '1'),
(119, 'blog_main_delimiter', '1'),
(120, 'blog_main_background', '0'),
(121, 'blog_main_padding_top', '80'),
(122, 'blog_main_padding_bottom', '80'),
(123, 'footer_type', '1'),
(124, 'footer_color', '2'),
(125, 'id_menu_footer_1', '1'),
(126, 'id_menu_footer_2', '2'),
(127, 'id_menu_footer_3', '3'),
(128, 'id_menu_footer_4', '4'),
(129, 'catalog_grid_column', '5'),
(130, 'catalog_images_type', '1'),
(131, 'catalog_bordered', '1'),
(132, 'catalog_category_type', '1'),
(133, 'catalog_category_grid_column', '8'),
(134, 'catalog_category_images_type', '1'),
(135, 'catalog_category_bordered', '1'),
(136, 'products_grid_bordered', '1'),
(137, 'products_grid_img_corner', '0'),
(138, 'products_img_gallery', '1'),
(139, 'products_img_gallery_limit', '5'),
(140, 'view_recommended_products', '1'),
(141, 'recommended_products_grid_type', '5'),
(142, 'brands_type', '2'),
(143, 'brands_grid_column', '6'),
(144, 'blog_grid_type', '3'),
(145, 'articles_grid_type', '4'),
(146, 'twitterx', 'https://x.com/'),
(147, 'telegram', 'https://t.me/'),
(148, 'youtube', 'https://www.youtube.com/'),
(149, 'tiktok', 'https://www.tiktok.com/'),
(150, 'whatsapp', 'https://wa.me/'),
(151, 'viber', 'viber://chat?number=ххххххххх'),
(152, 'instagram', 'https://www.instagram.com/'),
(153, 'facebook', ''),
(154, 'big_banners_id', '2'),
(155, 'banners_text_id', '3'),
(156, 'teasers_type', '1'),
(157, 'teasers_banners_id', '4'),
(158, 'teasers_wide', '0'),
(159, 'teasers_indented', '0'),
(160, 'bottom_banners_id', '6'),
(161, 'blog_main_sort', 'date'),
(162, 'blog_main_limit', '4'),
(163, 'block_11', '11'),
(164, 'visible_11', '1'),
(165, 'articles_main_grid_type', '4'),
(166, 'articles_main_sort', 'position'),
(167, 'articles_main_limit', '4'),
(168, 'articles_main_title', '1'),
(169, 'articles_main_delimiter', '1'),
(170, 'articles_main_background', '1'),
(171, 'articles_main_padding_top', '40'),
(172, 'articles_main_padding_bottom', '40'),
(173, 'theme_color', 'theme_default'),
(174, 'id_banner_account', '6'),
(175, 'linkedin', ''),
(176, 'landing_pages_header_id', '5'),
(177, 'watermark', '0'),
(178, 'id_menu_sitemap_1', '1'),
(179, 'id_menu_sitemap_2', '2'),
(180, 'id_menu_sitemap_3', '3'),
(181, 'id_menu_sitemap_4', '4'),
(182, 'header_banners_id', '5');

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
(16, 'add_cart', 'В корзину', 'Add To Cart', 'В кошик'),
(17, 'added_cart', 'В корзине', 'Added To Cart', 'В кошику'),
(18, 'more_details', 'Далее', 'More details', 'Далі'),
(19, 'not_available', 'Нет в наличии', 'Not available', 'Немає в наявності'),
(20, 'in_stock', 'В наличии', 'In stock', 'В наявності'),
(23, 'of_vote', 'голоса', 'vote', 'голоси'),
(24, 'add_to_wishlist', 'В избранное', 'Add to wishlist', 'У обране'),
(25, 'added_to_wishlist', 'В избранном', 'Added to wishlist', 'В обраному'),
(26, 'add_to_compare', 'В сравнение', 'Add to compare', 'До порівняння'),
(27, 'added_to_compare', 'В сравнении ', 'Added to compare', 'В порівнянні'),
(28, 'delete', 'Удалить', 'Delete', 'Видалити'),
(29, 'best_products', 'Лучшие предложения', 'Best products', 'Найкращі пропозиції'),
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
(49, 'global_blog', 'Блог', 'Blog', 'Блог'),
(50, 'enter_your_email', 'Оставьте свой e-mail', 'Enter your Email', 'Залиште свій e-mail'),
(51, 'main_description', 'Этот магазин является демонстрацией скрипта интернет-магазина Turbo CMS. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.', 'This store is a demo of the script of the Turbo CMS online store. All materials on this site are present for demonstration purposes only.', 'Цей магазин є демонстрацією скрипта інтернет-магазину Turbo CMS. Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.'),
(53, 'about_shop', 'О магазине', 'About Shop', 'Про магазин'),
(54, 'information', 'Информация', 'Information', 'Інформація'),
(55, 'contacts', 'Контакты', 'Contacts', 'Контакти'),
(259, 'text_success', 'Наш менеджер перезвонит вам в ближайшее время.', 'Our manager will call you back shortly.', 'Наш менеджер передзвонить вам найближчим часом.'),
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
(83, 'comments_global', 'Отзывы', 'Reviews', 'Відгуки'),
(84, 'awaiting_moderation', 'ожидает модерации', 'awaiting moderation', 'очікує модерації'),
(85, 'comment_1', 'отзыв', 'review', 'відгук'),
(86, 'comment_on', 'Комментировать', 'Comment on', 'Коментувати'),
(87, 'no_comments', 'Пока нет комментариев', 'No comments', 'Поки немає коментарів'),
(88, 'related_products', 'Сопутствующие товары', 'Related products', 'Супутні товари'),
(89, 'email_order_title', 'Ваш заказ №', 'Your Order No.', 'Ваше замовлення №'),
(90, 'email_order_on_total', 'на сумму', 'for the amount', 'на суму'),
(92, 'badge_featured', 'Советуем', 'Featured', 'Радимо'),
(111, 'reply', 'Ответить', 'Reply', 'Відповісти'),
(96, 'files_global', 'Файлы', 'Files', 'Файли'),
(97, 'videos_global', 'Видео', 'Video', 'Відео'),
(98, 'wishlist_no_products', 'Список избранного пуст', 'Wishlist is empty', 'Список обраного порожній'),
(99, 'sort_by', 'Сортировать по', 'Sort by', 'Сортувати за'),
(100, 'default', 'Умолчанию', 'Default', 'Замовчуванням'),
(101, 'name_a_z', 'По имени от А до Я', 'By name from A to Z', 'За назвою від А до Я'),
(102, 'name_z_a', 'По имени от Я до А', 'By name from Z to A', 'За назвою від Я до А'),
(103, 'cheap_expensive', 'От дешевых к дорогим', 'Cheap to expensive', 'Від дешевих до дорогих'),
(104, 'expensive_cheap', 'От дорогих к дешевым', 'From expensive to cheap', 'Від дорогих до дешевих'),
(105, 'by_rating', 'По рейтингу', 'By rating', 'За рейтингом'),
(106, 'no_products_found', 'Товары не найдены', 'No products found', 'Товари не знайдені'),
(107, 'search', 'Поиск', 'Search', 'Пошук'),
(108, 'nothing_found', 'Ничего не найдено', 'Nothing found', 'Нічого не знайдено'),
(109, 'enter_search_query', 'Введите поисковый запрос', 'Enter your search term', 'Введіть пошуковий запит'),
(110, 'site_search', 'Поиск по сайту', 'Site search', 'Пошук по сайту'),
(112, 'at', 'в', 'at', 'в'),
(113, 'popular', 'Популярные', 'Popular', 'Популярні'),
(114, 'in_order', 'По порядку', 'In order', 'По порядку'),
(115, 'comment_2', 'отзывов', 'reviews', 'відгуків'),
(116, 'table_of_contents', 'Содержание', 'Table of Contents', 'Зміст'),
(117, 'already_voted', 'Вы уже голосовали!', 'You have already voted!', 'Ви вже голосували!'),
(118, 'vote_counted', 'Спасибо! Ваш голос учтен.', 'Thank you! Your vote has been counted.', 'Спасибі! Ваш голос враховано.'),
(119, 'message_sent', 'Сообщение отправлено', 'Message sent', 'Повідомлення відправлено'),
(120, 'success_subscribe', 'Вы были успешно подписаны', 'You have been successfully subscribed', 'Ви були успішно підписані'),
(121, 'already_subscribe', 'Вы уже подписаны', 'You are already subscribed', 'Ви вже підписані'),
(122, 'subscribe_to', 'Подписаться', 'Subscribe to', 'Підписатися'),
(123, 'search_article', 'Поиск статьи...', 'Search article...', 'Пошук статті...'),
(124, 'sitemap', 'Карта сайта', 'Sitemap', 'Карта сайту'),
(125, 'global_articles', 'Статьи', 'Articles', 'Статті'),
(126, 'global_products', 'Продукты', 'Products', 'Продукти'),
(127, 'sort_date', 'По дате', 'Date', 'За датою'),
(128, 'search_blog', 'Поиск в блоге...', 'Search blog...', 'Пошук в блозі...'),
(129, 'filter_by_price', 'Фильтр по цене', 'Filter by price', 'Фільтр по ціні'),
(130, 'apply', 'Применить', 'Apply', 'Застосувати'),
(131, 'reset', 'Сбросить', 'Reset', 'Скасувати'),
(132, 'global_brands', 'Бренды', 'Brands', 'Бренди'),
(133, 'global_feedback', 'Обратная связь', 'Feedback', 'Зворотній зв\'язок'),
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
(160, 'accepted', 'принят', 'accepted', 'прийнято'),
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
(189, 'cart_no_products', 'Ваша корзина пуста', 'Your basket is empty', 'Ваш кошик порожній'),
(190, 'new_password', 'Новый пароль', 'New password', 'Новий пароль'),
(191, 'on_the_site', 'на сайте', 'on the site', 'на сайті'),
(192, 'email_password_reply', 'был сделан запрос на восстановление вашего пароля.', 'a request was made to recover your password.', 'був зроблений запит на відновлення вашого пароля.'),
(193, 'email_password_change', 'Вы можете изменить пароль, перейдя по следующей ссылке', 'You can change your password by following the link below', 'Ви можете змінити пароль, перейшовши за наступним посиланням'),
(194, 'email_password_text', 'Эта ссылка действует в течение нескольких минут. <br> Если это письмо пришло вам по ошибке, проигнорируйте его.', 'This link is effective for a few minutes. <br> If you received this error in error, ignore it.', 'Це посилання діє протягом декількох хвилин. <br> Якщо цей лист прийшло вам помилково, ігноруйте його.'),
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
(230, 'global_reviews', 'Отзывы', 'Reviews', 'Відгуки'),
(231, 'voice', 'голос', 'voice', 'голос'),
(232, 'comment_3', 'отзыва', 'review', 'відгука'),
(233, 'heading', 'Рубрика', 'Heading', 'Рубрика'),
(234, 'comment', 'Комментарий', 'Comment', 'Коментар'),
(235, 'quick_view', 'Быстрый просмотр', 'Quick view', 'Швидкий перегляд'),
(236, 'general_all', 'Все', 'All', 'Всі'),
(237, 'next', 'Вперёд', 'Next', 'Вперед'),
(238, 'previous', 'Назад', 'Prev', 'Назад'),
(239, 'whole_catalog', 'Весь каталог', 'Whole catalog', 'Весь каталог'),
(240, 'all_discounts', 'Узнать о скидках', 'All Discounts', 'Дізнатись про знижки'),
(241, 'no_ratings', 'Нет оценок', 'No ratings', 'Немає оцінок'),
(242, 'rating', 'Рейтинг', 'Rating', 'Рейтинг'),
(243, 'out_of', 'из', 'out of', 'з'),
(244, 'go_to_cart', 'В корзину', 'Go to cart', 'До кошику'),
(245, 'wishlist', 'Избранное', 'Wishlist', 'Обране'),
(246, 'subscribe', 'Подписаться', 'Subscribe', 'Підписатися'),
(247, 'subscribe_text', 'Подписаться на новости и акции', 'Subscribe to news and promotions', 'Підписатися на новини та акції'),
(248, 'error_required', 'Заполните это поле!', 'Fill out this field!', 'Заповніть це поле!'),
(249, 'error_format', 'Неверный формат!', 'Wrong format!', 'Невірний формат!'),
(250, 'online_store', 'Интернет-магазин', 'Online store', 'Інтернет магазин'),
(251, 'help', 'Помощь', 'Help', 'Допомога'),
(252, 'account', 'Кабинет', 'Account', 'Кабінет'),
(253, 'powered_by', 'Работает на', 'Powered by', 'Працює на'),
(254, 'more', 'ещё', 'more', 'ще'),
(255, 'login_account', 'Вход в личный кабинет', 'Login to your personal account', 'Вхід в особистий кабінет'),
(256, 'licenses_text', 'Продолжая, вы соглашаетесь с', 'By continuing, you agree to', 'Продовжуючи, ви погоджуєтесь з'),
(257, 'licenses_link', 'политикой конфиденциальности', 'privacy policy', 'політикою конфіденційності'),
(258, 'global_languages', 'Языки', 'Languages', 'Мови'),
(260, 'thank_you', 'Спасибо!', 'Thank you!', 'Дякуємо!'),
(261, 'callback_text', 'Представьтесь, мы вам перезвоним.', 'Introduce yourself, we will call you back.', 'Представтесь, ми вам передзвонимо.'),
(262, 'captcha_label', 'Подтвердите, что вы не робот', 'Confirm that you are not a robot', 'Підтвердіть, що ви не робот'),
(263, 'category', 'Категория', 'Category', 'Категорія'),
(264, 'filter', 'Фильтр', 'Filter', 'Фільтр'),
(265, 'show', 'Показать', 'Show', 'Показати'),
(266, 'show_all', 'Показать все', 'Show all', 'Показати всі'),
(267, 'load_more', 'Загрузить еще', 'Load more', 'Завантажити ще'),
(268, 'all_features', 'Все характеристики', 'All features', 'Усі характеристики'),
(269, 'all_description', 'Все описание', 'All description', 'Весь опис'),
(270, 'all_products_category', 'Все товары категории', 'All products category', 'Усі товари категорії'),
(271, 'prices_for_brands', 'Доступные цены на лучшие бренды', 'Affordable prices for the best brands', 'Доступні ціни на найкращі бренди'),
(273, 'quality_guarantee', 'Гарантия качества от производителей', 'Quality guarantee from manufacturers', 'Гарантія якості від виробників'),
(274, 'color', 'Цвет', 'Color', 'Колір'),
(275, 'thanks_order', 'Спасибо за заказ!', 'Thanks for your order', 'Дякуємо за ваше замовлення'),
(276, 'your_order_no', 'Ваш заказ №', 'Your Order No.', 'Ваше замовлення №'),
(277, 'add_review', 'Добавить отзыв', 'Add Review', 'Додати відгук'),
(278, 'post_review', 'Опубликовать отзыв', 'Post Review', 'Опублікувати відгук'),
(279, 'your_rating', 'Ваша оценка', 'Your rating', 'Ваша оцінка'),
(280, 'very_bad', 'Очень плохо', 'Very bad', 'Дуже погано'),
(281, 'add_comment', 'Комментировать', 'Comment', 'Коментувати'),
(282, 'bad', 'Плохо', 'Bad', 'Погано'),
(283, 'fine', 'Хорошо', 'Fine', 'Добре'),
(284, 'normal', 'Нормально', 'Normally', 'Нормально'),
(285, 'great', 'Отлично', 'Great', 'Відмінно'),
(286, 'no_rating', 'Без оценки', 'No rating', 'Без оцінки'),
(287, 'comments_order', 'Комментарий к заказу', 'Comments', 'Коментар до замовлення'),
(288, 'size_table', 'Таблица размеров', 'Size table', 'Таблиця розмірів'),
(289, 'you_may_also_like', 'Вам также может понравиться', 'You may also like', 'Вам також може сподобатися'),
(290, 'help_other_users', 'Помогите другим пользователям с выбором - будьте первым, кто поделится своим мнением об этом товаре', 'Help other users with their choice - be the first to share your opinion about this product', 'Допоможіть іншим користувачам з вибором – будьте першим, хто поділиться своєю думкою про цей товар'),
(291, 'no_reviews', 'Нет отзывов', 'No reviews', 'Немає відгуків'),
(292, 'more_details_product', 'Подробнее о товаре', 'More details product', 'Докладніше про товар'),
(293, 'promo_code', 'Есть промокод?', 'Have a promo code?', 'Чи є промокод?'),
(294, 'not_found', 'Не найден', 'Not found', 'Не знайдений'),
(295, 'paid_separate', 'оплачивается отдельно', 'paid separately', 'оплачується окремо'),
(296, 'global_delivery', 'Доставка', 'Delivery', 'Доставка'),
(297, 'download', 'Скачать', 'Download', 'Завантажити'),
(298, 'delivery_method', 'Способ доставки', 'Delivery method', 'Спосіб доставки'),
(299, 'print', 'Распечатать', 'Print', 'Роздрукувати'),
(300, 'click_here', 'Нажмите здесь', 'Click here', 'Натисніть тут'),
(301, 'to_continue_shopping', 'чтобы продолжить покупки', 'to continue shopping', 'щоб продовжити покупки'),
(302, 'all', 'Все', 'All', 'Всі'),
(303, 'moredetails', 'Подробнее', 'More details', 'Детальніше'),
(304, 'grid_display', 'Плиточное отображение', 'Grid display', 'Плиткове відображення'),
(305, 'list_display', 'Строчный вывод', 'List display', 'Відображення списком'),
(306, 'price_display', 'Вывод прайсом', 'Price display', 'Відображення прайсом'),
(307, 'subscribe_newsletter', 'Подписка на рассылку', 'Subscribe to the newsletter', 'Підписка на розсилку'),
(308, 'subscribe_to_newsletter', 'Подпишитесь на рассылку наших новостей и акций', 'Subscribe to our newsletter and promotions', 'Підпишіться на розсилку наших новин та акцій'),
(310, 'add_comments', 'Добавить комментарий', 'Add comment', 'Додати коментар'),
(311, 'global_comments', 'Комментарии', 'Comments', 'Коментарі'),
(312, 'like', 'Нравится', 'Like', 'Подобається'),
(313, 'dislike', 'Не нравится', 'Dislike', 'Не подобається'),
(314, 'all_publications', 'Все публикации', 'All publications', 'Усі публікації'),
(315, 'author', 'Автор', 'Author', 'Автор'),
(316, 'feedback_message', 'Менеджеры компании с радостью ответят на ваши вопросы и произведут расчет стоимости услуг и подготовят индивидуальное коммерческое предложение.', 'The company\'s managers will be happy to answer your questions and calculate the cost of services and prepare an individual commercial offer.', 'Менеджери компанії з радістю дадуть відповіді на ваші запитання і зроблять розрахунок вартості послуг і підготують індивідуальну комерційну пропозицію.'),
(317, 'ask_question', 'Задать вопрос', 'Ask a Question', 'Задати питання'),
(318, 'text_question', 'Менеджеры компании с радостью ответят на ваши вопросы и произведут расчет стоимости услуг и подготовят индивидуальное коммерческое предложение. ', 'The company\'s managers will be happy to answer your questions and calculate the cost of services and prepare an individual commercial offer.', 'Менеджери компанії з радістю дадуть відповіді на ваші запитання і зроблять розрахунок вартості послуг і підготують індивідуальну комерційну пропозицію.'),
(319, 'text_faq', 'Не нашли ответа на свой вопрос? Свяжитесь с нами, и мы предоставим необходимую информацию.', 'Didn\'t find the answer to your question? Contact us and we will provide the necessary information.', 'Чи не знайшли відповіді на своє запитання? Зв\'яжіться з нами і ми надамо необхідну інформацію.'),
(320, 'write_message', 'Написать сообщение', 'To write a message', 'Написати повідомлення'),
(321, 'search_text', 'Введите поисковый запрос и нажмите кнопку \"Найти\".', 'Enter your search query and click the \"Find\" button.', 'Введіть пошуковий запит і натисніть кнопку \"Знайти\".'),
(322, 'register', 'Зарегистрироваться', 'Register', 'Зареєструватись'),
(323, 'authorization', 'Авторизация', 'Authorization', 'Авторизація'),
(324, 'authorization_text', 'Авторизовавшись, вы сможете управлять своими личными данными, следить за состоянием заказов.', 'Once logged in, you will be able to manage your personal data and monitor the status of your orders.', 'Авторизувавшись, ви зможете керувати своїми особистими даними, стежити за станом замовлень.'),
(325, 'restore', 'Восстановить', 'Restore', 'Відновити'),
(326, 'password_recovery', 'Восстановление пароля', 'Password recovery', 'Відновлення паролю'),
(327, 'password_recovery_text', 'Если вы забыли пароль, введите логин.', 'If you have forgotten your password, enter your login.', 'Якщо ви забули пароль, введіть логін.'),
(328, 'recovery_text', 'Контрольная строка для смены пароля, а также ваши регистрационные данные, будут высланы вам по E-Mail.', 'The control line for changing your password, as well as your registration data, will be sent to you by E-Mail.', 'Контрольний рядок для зміни пароля, а також ваші реєстраційні дані будуть надіслані вам по E-Mail.'),
(329, 'registraion_login_text', 'Является также логином для входа на сайт', 'It is also the login to enter the site', 'Є також логіном для входу на сайт'),
(330, 'registraion_password_text', 'Длина пароля не менее 6 символов', 'Password length must be at least 6 characters', 'Довжина пароля не менше 6 символів'),
(331, 'personal_area', 'Личный кабинет', 'Personal Area', 'Особистий кабінет'),
(332, 'order_from', 'Заказ от', 'Order from', 'Замовлення від'),
(333, 'view_order', 'Посмотреть заказ', 'View order', 'Переглянути замовлення'),
(334, 'payment_awaited', 'ожидается оплата', 'payment awaited', 'очікується оплата'),
(348, 'products_1', 'товар', 'product', 'товар'),
(335, 'accepted_text', 'Заказ принят, но пока не обрабатывается (например, заказ только что создан или ожидается оплата заказа)', 'The order has been accepted, but is not yet being processed (for example, the order has just been created or payment is pending for the order)', 'Замовлення прийняте, але поки що не обробляється (наприклад, замовлення щойно створене або очікується оплата замовлення)'),
(336, 'accepted_name', 'Принят', 'Accepted', 'Прийнятий'),
(344, 'all_orders', 'Все заказы', 'All orders', 'Усі замовлення'),
(345, 'personal_data', 'Личные данные', 'Personal data', 'Особисті дані'),
(346, 'no_products', 'Нет товаров', 'No products', 'Немає товарів'),
(347, 'products_3', 'товара', 'products', 'товару'),
(338, 'in_processing_name', 'В обработке', 'In processing', 'В обробці'),
(342, 'in_processing_text', 'Заказ находится в обработке', 'The order is being processed', 'Замовлення знаходиться в обробці'),
(343, 'new_orders', 'Новые заказы', 'New orders', 'Нові замовлення'),
(340, 'completed_name', 'Выполнен', 'Completed', 'Виконаний'),
(341, 'completed_text', 'Заказ доставлен и оплачен', 'The order has been delivered and paid for', 'Замовлення доставлено та оплачено'),
(349, 'products_2', 'товаров', 'products', 'товарів'),
(350, 'orders_global', 'Заказы', 'Orders', 'Замовлення'),
(351, 'orders_3', 'заказа', 'order', 'замовлення'),
(352, 'orders_1', 'заказ', 'order', 'замовлення'),
(353, 'orders_2', 'заказов', 'orders', 'замовлень'),
(354, 'subscriptions', 'Подписки', 'Subscriptions', 'Підписки'),
(355, 'newsletters_products', 'Рассылки и товары', 'Newsletters and products', 'Розсилки та товари'),
(356, 'profile', 'Профиль', 'Profile', 'Профіль'),
(357, 'ask_a_question', 'Задайте вопрос', 'Ask a question', 'Задайте питання'),
(358, 'my_account', 'Мой кабинет', 'My account', 'Мій кабінет'),
(359, 'wishlist_products', 'Избранные товары', 'Wishlist products', 'Вибрані товари'),
(360, 'no_orders', 'Нет заказов', 'No orders', 'Немає замовлень'),
(361, 'contact_details_user', 'Контактные данные', 'Contact details', 'Контактні дані'),
(362, 'user_email_text', 'Для отправки уведомлений о статусе заказа. Используйте как логин для входа в личный кабинет', 'To send notifications about order status. Use as a login to enter your personal account', 'Для надсилання повідомлень про статус замовлення. Використовуйте як логін для входу до особистого кабінету'),
(363, 'user_phone_text', 'Необходим для уточнения деталей заказа', 'Required to clarify order details', 'Необхідний для уточнення деталей замовлення'),
(364, 'shipping_address', 'Адрес для доставки', 'Shipping address', 'Адреса для доставки'),
(365, 'save_changes', 'Сохранить изменения', 'Save changes', 'зберегти зміни'),
(366, 'message_success', 'Успешно сохранено', 'Saved successfully', 'Успішно збережено'),
(367, 'phones', 'Телефоны', 'Phones', 'Телефони'),
(368, 'page_not_found', 'Страница не найдена', 'Page not found', 'Сторінка не знайдена'),
(369, 'text_404', 'Неправильно набран адрес или такой страницы не существует', 'The address is incorrectly typed or the page does not exist', 'Неправильно набрана адреса або такої сторінки не існує'),
(370, 'come_back', 'Вернуться назад', 'Come back', 'Повернутися назад'),
(371, 'to_main', 'На главную', 'To main', 'На головну'),
(372, 'all_results', 'Все результаты', 'All results', 'Усі результати'),
(373, 'all_site', 'По всему сайту', 'All site', 'По всьому сайту'),
(374, 'by_blog', 'По блогу', 'By blog', 'По блогу'),
(375, 'by_article', 'По статьям', 'By article', 'По сатьям'),
(376, 'by_catalog', 'По каталогу', 'By catalog', 'По каталогу'),
(377, 'find', 'Найти', 'Search', 'Знайти'),
(378, 'all_search', 'Везде', 'All', 'Скрізь'),
(379, 'the_request_failed', 'Ошибка запроса', 'The request failed', 'Помилка запиту'),
(380, 'error', 'Ошибка', 'Error', 'Помилка'),
(381, 'hide', 'Скрыть', 'Hide', 'Приховати'),
(382, 'enable_dark_theme', 'Включить темное оформление', 'Enable dark theme', 'Увімкнути темне оформлення'),
(383, 'enable_light_theme', 'Включить светлое оформление', 'Enable light theme', 'Увімкнути світле оформлення'),
(384, 'agree_to_the_terms', 'Согласитесь с условиями', 'Agree to the terms', 'Погодьтеся з умовами'),
(385, 'minimum_6_characters', 'Минимум 6 символов!', 'Minimum 6 characters!', 'Мінімум 6 символів!'),
(386, 'filled_in_incorrectly', 'Неверно заполнено поле!', 'The field is filled in incorrectly!', 'Невірно заповнене поле!'),
(387, 'password_mismatch', 'Пароли не совпадают!', 'Password mismatch!', 'Паролі не співпадають!'),
(388, 'more_global', 'Еще', 'More', 'Ще'),
(389, 'sec', 'сек', 'sec', 'сек'),
(390, 'min', 'мин', 'min', 'хв'),
(391, 'hour', 'час', 'hour', 'год'),
(392, 'day', 'дн', 'day', 'дн'),
(393, 'week_0', 'Недель', 'Weeks', 'Тижнів'),
(394, 'week_1', 'Неделя', 'Week', 'Тиждень'),
(395, 'week_2', 'Недели', 'Weeks', 'Тижні'),
(396, 'month_0', 'Месяцев', 'Months', 'Місяців'),
(397, 'month_1', 'Месяц', 'Month', 'Місяць'),
(398, 'month_2', 'Месяца', 'Months', 'Місяця'),
(399, 'year_0', 'Лет', 'Years', 'Років'),
(400, 'year_1', 'Год', 'Year', 'Рік'),
(401, 'year_2', 'Года', 'Years', 'Роки'),
(402, 'compact_sec', 'с', 's', 'с'),
(403, 'compact_min', 'м', 'm', 'хв'),
(404, 'compact_hour', 'ч', 'h', 'год'),
(405, 'compact_day', 'д', 'd', 'д'),
(406, 'compact_weak', 'н', 'w', 'т'),
(407, 'compact_month', 'м', 'm', 'м'),
(408, 'compact_year_0', 'л', 'y', 'р'),
(409, 'compact_year_1', 'г', 'y', 'р'),
(410, 'no_products_text', 'В данный момент нет активных товаров', 'There are currently no active products', 'На даний момент немає активних товарів'),
(411, 'section_empty', 'К сожалению, раздел пуст', 'Sorry, this section is empty', 'На жаль, розділ порожній'),
(412, 'loading', 'Загрузка...', 'Loading...', 'Завантаження...'),
(420, 'sizing', 'Подбор размера', 'Sizing', 'Підбір розміру'),
(421, 'mens_clothing', 'Мужская одежда', 'Men\'s clothing', 'Чоловічий одяг'),
(422, 'womens_clothing', 'Женская одежда', 'Women\'s clothing', 'Жіночий одяг'),
(423, 'baby_clothes', 'Детская одежда', 'Baby clothes', 'Дитячий одяг'),
(424, 'mens_size', 'Таблица соответствия мужских размеров', 'Men\'s size conversion chart', 'Таблиця відповідності чоловічих розмірів'),
(425, 'chest_cm', 'Обхват груди (см)', 'Chest (cm)', 'Обхват грудей (см)'),
(426, 'waist_cm', 'Обхват талии (см)', 'Waist (cm)', 'Обхват талії (см)'),
(427, 'hip_circumference_cm', 'Обхват бедер (см)', 'Hip circumference (cm)', 'Обхват стегон (см)'),
(428, 'neck_circumference_cm', 'Обхват шеи (см)', 'Neck circumference (cm)', 'Обхват шиї (см)'),
(429, 'ukrainian_size', 'Украинский размер (UA)', 'Ukrainian size (UA)', 'Український розмір (UA)'),
(430, 'europe_germany', 'Европа / Германия (EUR / GER)', 'Europe / Germany (EUR / GER)', 'Європа / Німеччина (EUR / GER)'),
(431, 'germany', 'Германия (GER)', 'Germany (GER)', 'Німеччина (GER)'),
(432, 'usa_uk', 'США / Великобритания (USA / UK)', 'USA / Great Britain (USA / UK)', 'США / Великобританія (USA / UK)'),
(433, 'international', 'Международный (INT)', 'International (INT)', 'Міжнародний (INT)'),
(434, 'outerwear', 'Верхняя одежда', 'Outerwear', 'Верхній одяг'),
(435, 'outerwear_text_1', 'Для определения своего размера вам понадобится только один инструмент — сантиметровая лента. Все полученные измерения нужно будет сравнить с данными в таблице.Проследите, чтобы лента прилегала плотно к телу.', 'To determine your size, you only need one tool - a measuring tape. All measurements obtained will need to be compared with the data in the table. Make sure that the tape fits tightly to the body.', 'Для визначення свого розміру вам знадобиться лише один інструмент – сантиметрова стрічка. Всі отримані вимірювання потрібно буде порівняти з даними в таблиці. Простежте, щоб стрічка щільно прилягала до тіла.'),
(436, 'outerwear_text_2', 'Чтобы измерить обхват груди, лента должна проходить по выступающим точкам груди спереди. А сбоку через подмышечные впади. Замыкается лента на лопатках.', 'To measure your chest circumference, the tape should pass along the protruding points of your chest in front. And from the side through the armpits. The tape closes on the shoulder blades.', 'Щоб виміряти обхват грудей, стрічка повинна проходити по точках грудей, що виступають, спереду. А збоку через пахвові упади. Замикається стрічка на лопатках.'),
(437, 'outerwear_text_3', 'При измерении обхвата талии, лента должна проходить по самой узкой части тела, проходя через самую выступающую точку живота. Держите ленту строго горизонтально.', 'When measuring waist circumference, the tape should pass along the narrowest part of the body, passing through the most protruding point of the abdomen. Keep the tape strictly horizontal.', 'При вимірюванні обхвату талії, стрічка повинна проходити вузькою частиною тіла, проходячи через саму виступаючу точку живота. Тримайте стрічку горизонтально.'),
(438, 'outerwear_text_4', 'Обхват бедер измеряется строго горизонтально. Лента должна проходить по бедрам по самым выступающим точкам ягодиц.', 'Hip circumference is measured strictly horizontally. The tape should run along the thighs at the most protruding points of the buttocks.', 'Обхват стегон вимірюється горизонтально. Стрічка повинна проходити по стегнах по найточніших точках сідниць.'),
(439, 'shirts_and_blouses', 'Сорочки и рубашки', 'Shirts and blouses', 'Рубашки та сорочки'),
(440, 'shirts_text_1', 'Для определения размера вам также понадобится сантиметровая лента.', 'You will also need a measuring tape to determine the size.', 'Для визначення розміру вам також знадобиться сантиметрова стрічка.'),
(441, 'shirts_text_2', 'Чтобы измерить обхват шеи, оберните ленту вокруг нее примерно на два сантиметра выше места соединения шеи с плечами. Прибавьте один сантиметр к полученному результату. Сравните полученный резльтат с данными в таблице.', 'To measure your neck circumference, wrap the tape around your neck about two centimeters above where your neck meets your shoulders. Add one centimeter to the result. Compare the result obtained with the data in the table.', 'Щоб виміряти обхват шиї, оберніть стрічку навколо неї приблизно на два сантиметри вище за місце з\'єднання шиї з плечами. Додайте один сантиметр до отриманого результату. Порівняйте отриманий результат з даними у таблиці.'),
(442, 'womens_size', 'Таблица соответствия женских размеров', 'Women\'s size conversion chart', 'Таблиця відповідності жіночих розмірів'),
(443, 'france', 'Франция (FR)', 'France (FR)', 'Франція (FR)'),
(444, 'italy', 'Италия (IT)', 'Italy (IT)', 'Італія (IT)'),
(445, 'usa', 'США (USA)', 'USA', 'США (USA)'),
(446, 'great_britain', 'Великобритания (UK)', 'Great Britain (UK)', 'Великобританія (UK)'),
(447, 'childrens_size', 'Таблица соответствия детских размеров', 'Children\'s size conversion chart', 'Таблиця відповідності дитячих розмірів'),
(448, 'height_cm', 'Рост (см)', 'Height (cm)', 'Зріст (см)'),
(449, 'age', 'Возраст', 'Age', 'Вік'),
(450, 'manufacturer_size', 'Размер производителя (см)', 'Manufacturer size (cm)', 'Розмір виробника (см)'),
(451, 'baby_clothing', 'Одежда для новорожденных', 'Baby Clothing', 'Одяг для новонароджених'),
(452, 'baby_clothing_text_1', 'Ползунки, распашонки и комбинезоны — первые элементы гардероба малыша. При выборе одежды ориентируйтесь на качество и состав ткани. А также подбирайте размер по росту ребенка. Его измеряют у доктора. ', 'Rompers, baby vests and overalls are the first elements of a baby\'s wardrobe. When choosing clothes, focus on the quality and composition of the fabric. And also choose the size according to the child’s height. It is measured by a doctor.', 'Повзунки, сорочечки та комбінезони — перші елементи гардеробу малюка. При виборі одягу орієнтуйтеся на якість та склад тканини. А також підбирайте розмір зростання дитини. Його вимірюють у лікаря.'),
(455, 'baby_clothing_text_2', 'Или эту процедуру можно сделать самостоятельно в домашних условиях. Помните, что дети быстро растут. Поэтому одежда не должна идти размер в размер.', 'Or you can do this procedure yourself at home. Remember that children grow quickly. Therefore, clothes should not fit true to size.', 'Або цю процедуру можна зробити самостійно в домашніх умовах. Пам\'ятайте, що швидко ростуть. Тому одяг не повинен йти розміром у розмір.'),
(453, 'overalls_sizes', 'Размеры комбинезонов', 'Overalls sizes', 'Розміри комбінезонів'),
(454, 'overalls_sizes_text_1', 'Комбинезоны для прогулок имеют свободный крой. Под них можно одевать ползунки, кофты или хлопковые комбинезоны. Даже в подгузнике ребенку будет комфортно. Так как дети быстро растут, верхняя одежда прослужит 1–2 сезона.', 'Overalls for walking have a loose fit. You can wear rompers, sweaters or cotton overalls under them. The baby will be comfortable even in a diaper. Since children grow quickly, outerwear will last 1-2 seasons.', 'Комбінезони для прогулянок мають вільний крій. Під них можна одягати повзунки, кофти чи бавовняні комбінезони. Навіть у підгузку дитині буде комфортно. Так як діти швидко ростуть, верхній одяг прослужить 1-2 сезони.'),
(456, 'overalls_sizes_text_2', 'Поэтому рекомендуем покупать комбинезон максимум за месяц до начала сезона. При выборе ориентируйтесь на рост малыша. Если он 73 см, то ориентируйтесь на длину 75–80 см.', 'Therefore, we recommend buying overalls a maximum of a month before the start of the season. When choosing, focus on the baby\'s height. If it is 73 cm, then focus on a length of 75–80 cm.', 'Тому рекомендуємо купувати комбінезон максимум за місяць до початку сезону. При виборі орієнтуйтеся зростання малюка. Якщо він 73 см, то орієнтуйтесь на довжину 75-80 см.'),
(457, 'months', 'мес', 'months', 'міс'),
(458, 'year', 'года', 'year', 'роки'),
(459, 'years', 'лет', 'years', 'років'),
(460, 'news', 'Новости', 'News', 'Новини'),
(461, 'only_differences', 'Только отличия ', 'Only differences', 'Тільки відмінності'),
(462, 'sales_department', 'Отдел продаж', 'Sales department', 'Відділ продажу'),
(463, 'accounting', 'Бухгалтерия', 'Accounting', 'Бухгалтерія'),
(464, 'director', 'Директор', 'Director', 'Директор'),
(465, 'office', 'Киев, ул. Шевченко 21, 3 этаж, офис 4', 'Kyiv, st. Shevchenko 21, 3rd floor, office 4', 'Київ, вул. Шевченка 21, 3 поверх, офіс 4'),
(466, 'operating_mode', 'Режим работы', 'Operating mode', 'Режим роботи'),
(467, 'operating_mode_text', 'Пн - Вс: 11.00 - 19.00', 'Mon - Sun: 11.00 - 19.00', 'Пн - Нд: 11.00 - 19.00'),
(468, 'main_office', 'Центральный офис', 'Main office', 'Центральний офіс'),
(469, 'global_banners', 'Баннеры', 'Banners', 'Банери'),
(470, 'fast_delivery', 'Быстрая доставка за 24 часа', 'Fast delivery within 24 hours', 'Швидка доставка за 24 години'),
(471, 'faq_name', 'Часто задаваемые вопросы', 'FAQ', 'Часті питання'),
(472, 'no_faqs_found', 'Вопросы не найдены', 'No questions found', 'Запитання не знайдено');

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
(1, 'me@example.com', '003ff6279857ddb9bb1ccf7a1c86f710', 'John Smith', '+1(234) 567-89-01', '633 W College Ave, York, PA ; 906 E Market St, York, PA ; 561 Linden Ave, York, PA', 1, 1, '127.0.0.1', '2024-01-24 00:52:13');

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
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(14,2) DEFAULT NULL,
  `weight` float(8,2) NOT NULL,
  `stock` mediumint(9) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `external_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_variants`
--

INSERT INTO `t_variants` (`id`, `product_id`, `sku`, `name`, `color`, `color_code`, `price`, `compare_price`, `weight`, `stock`, `position`, `attachment`, `attachment_url`, `external_id`, `currency_id`) VALUES
(1, 1, '', '', '', '', '500.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(2, 2, '', '64 GB', '', '', '274.99', '349.99', 0.00, NULL, 0, '', '', '', 1),
(3, 3, '', '', '', '', '280.00', '400.00', 0.00, NULL, 0, '', '', '', 1),
(4, 4, '', '', '', '', '989.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(5, 5, '', '', '', '', '1692.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(6, 6, '', '', '', '', '1953.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(7, 7, '', '', '', '', '98.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(8, 8, '', '', '', '', '130.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(9, 9, '', '', 'Red', '#ff0000', '150.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(10, 10, '', '', 'Blue', '#0000ff', '150.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(11, 11, '', '', 'Black', '#000000', '150.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(12, 12, '', '', '', '', '250.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(13, 13, '', '', '', '', '500.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(14, 14, '', '', '', '', '470.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(15, 15, '', '', '', '', '503.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(16, 16, '', '', '', '', '210.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(17, 17, '', '', '', '', '165.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(18, 18, '', '', '', '', '238.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(19, 19, '', '', '', '', '1253.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(20, 20, '', '', '', '', '599.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(21, 21, '', '32 GB', '', '', '223.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(22, 22, '', '', '', '', '254.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(23, 23, '0001', '64 GB', 'Black', '#000000', '400.00', '600.00', 0.00, NULL, 0, '', '', '', 1),
(27, 24, '', '', '', '', '300.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(28, 25, '', '', '', '', '216.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(29, 26, '', '', '', '', '800.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(30, 27, '', '', '', '', '400.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(31, 28, '', '', '', '', '160.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(32, 29, '', '', '', '', '417.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(33, 30, '', '', '', '', '400.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(34, 31, '', '', '', '', '300.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(35, 32, '', '', '', '', '298.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(36, 33, '', '', '', '#ffffff', '447.98', '0.00', 100.00, NULL, 0, '', '', '', 1),
(39, 23, '0002', '512 GB', 'Black', '#000000', '599.99', '649.99', 0.00, NULL, 1, '', '', '', 1),
(40, 34, '', '', '', '', '242.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(41, 35, '', '', '', '', '373.00', '0.00', 0.00, NULL, 0, '', '', '', 1),
(64, 21, '', '64 GB', '', '', '300.00', '0.00', 0.00, NULL, 1, '', '', '', 1),
(65, 39, '675370', '64 GB', 'Black', '#000000', '400.00', '450.00', 162.00, NULL, 0, '', '', '', 1),
(66, 39, '675348', '128 GB', 'Black', '#000000', '500.00', '550.00', 162.00, NULL, 1, '', '', '', 1),
(67, 39, '675360', '256 GB', 'Black', '#000000', '700.00', '800.00', 162.00, NULL, 2, '', '', '', 1),
(157, 45, '001', 'S', 'Green', '#008000', '47.00', '77.00', 0.00, NULL, 0, '', '', '', 1),
(158, 45, '002', 'M', 'Green', '#008000', '48.00', '78.00', 0.00, NULL, 1, '', '', '', 1),
(159, 45, '003', 'L', 'Green', '#008000', '49.00', '79.00', 0.00, NULL, 2, '', '', '', 1),
(109, 41, '675374', '64 GB', 'White', '#ffffff', '400.00', '450.00', 162.00, NULL, 0, '', '', '', 1),
(110, 41, '675354', '128 GB', 'White', '#ffffff', '500.00', '550.00', 162.00, NULL, 1, '', '', '', 1),
(111, 41, '675368', '256 GB', 'White', '#ffffff', '700.00', '800.00', 162.00, NULL, 2, '', '', '', 1),
(121, 42, '675371', '64 GB', 'Green', '#008000', '400.00', '450.00', 162.00, NULL, 0, '', '', '', 1),
(122, 42, '675350', '128 GB', 'Green', '#008000', '500.00', '550.00', 162.00, 0, 1, '', '', '', 1),
(123, 42, '675363', '256 GB', 'Green', '#008000', '700.00', '800.00', 162.00, NULL, 2, '', '', '', 1),
(133, 43, '675372', '64 GB', 'Red', '#ff0000', '400.00', '450.00', 162.00, NULL, 0, '', '', '', 1),
(134, 43, '675351', '128 GB', 'Red', '#ff0000', '500.00', '550.00', 162.00, NULL, 1, '', '', '', 1),
(135, 43, '675367', '256 GB', 'Red', '#ff0000', '700.00', '800.00', 162.00, NULL, 2, '', '', '', 1),
(145, 44, '675375', '64 GB', 'Blue', '#0000ff', '400.00', '450.00', 162.00, NULL, 0, '', '', '', 1),
(146, 44, '675357', '128 GB', 'Blue', '#0000ff', '500.00', '550.00', 162.00, NULL, 1, '', '', '', 1),
(147, 44, '675369', '256 GB', 'Blue', '#0000ff', '700.00', '800.00', 162.00, NULL, 2, '', '', '', 1),
(184, 46, '013', 'L', 'White', '#ffffff', '47.00', '77.00', 0.00, NULL, 0, '', '', '', 1),
(185, 46, '014', 'XL', 'White', '#ffffff', '48.00', '78.00', 0.00, NULL, 1, '', '', '', 1),
(186, 46, '015', 'XXL', 'White', '#ffffff', '49.00', '79.00', 0.00, NULL, 2, '', '', '', 1),
(196, 47, '010', 'XS', 'Black', '#000000', '47.00', '77.00', 0.00, NULL, 0, '', '', '', 1),
(197, 47, '011', 'M', 'Black', '#000000', '48.00', '78.00', 0.00, NULL, 1, '', '', '', 1),
(198, 47, '012', 'XXL', 'Black', '#000000', '49.00', '79.00', 0.00, NULL, 2, '', '', '', 1),
(208, 48, '008', 'L', 'Blue', '#0000ff', '47.00', '77.00', 0.00, NULL, 1, '', '', '', 1),
(209, 48, '007', 'M', 'Blue', '#0000ff', '48.00', '78.00', 0.00, NULL, 0, '', '', '', 1),
(210, 48, '009', 'XXL', 'Blue', '#0000ff', '49.00', '79.00', 0.00, NULL, 2, '', '', '', 1),
(220, 49, '004', 'XS', 'Red', '#ff0000', '45.00', '75.00', 0.00, NULL, 0, '', '', '', 1),
(221, 49, '005', 'S', 'Red', '#ff0000', '47.00', '77.00', 0.00, NULL, 1, '', '', '', 1),
(222, 49, '006', 'M', 'Red', '#ff0000', '48.00', '78.00', 0.00, NULL, 2, '', '', '', 1),
(237, 50, '0006', '256 GB', 'White', '#ffffff', '499.99', '549.99', 0.00, NULL, 0, '', '', '', 1),
(238, 50, '0007', '512 GB', 'White', '#ffffff', '599.99', '649.99', 0.00, NULL, 1, '', '', '', 1),
(241, 51, '0003', '128 GB', 'Blue', '#0000ff', '399.99', '449.99', 0.00, NULL, 0, '', '', '', 1),
(242, 51, '0005', '256 GB', 'Blue', '#0000ff', '499.99', '549.99', 0.00, NULL, 1, '', '', '', 1),
(243, 51, '0004', '512 GB', 'Blue', '#0000ff', '599.99', '649.99', 0.00, NULL, 2, '', '', '', 1);

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
  ADD KEY `in_filter` (`in_filter`),
  ADD KEY `is_color` (`is_color`),
  ADD KEY `url_in_product` (`url_in_product`),
  ADD KEY `is_size` (`is_size`);

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
-- Indexes for table `t_lang_options`
--
ALTER TABLE `t_lang_options`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`option_id`);

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
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `value` (`value`),
  ADD KEY `feature_id` (`feature_id`),
  ADD KEY `translit` (`translit`),
  ADD KEY `position` (`position`);

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
  ADD KEY `to_xml` (`to_xml`),
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
-- Indexes for table `t_products_options`
--
ALTER TABLE `t_products_options`
  ADD PRIMARY KEY (`product_id`,`option_id`);

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
-- Indexes for table `t_recommended_products`
--
ALTER TABLE `t_recommended_products`
  ADD PRIMARY KEY (`product_id`,`recommended_id`),
  ADD KEY `position` (`position`);

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
-- Indexes for table `t_theme_settings`
--
ALTER TABLE `t_theme_settings`
  ADD PRIMARY KEY (`setting_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_articles_categories`
--
ALTER TABLE `t_articles_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_banners`
--
ALTER TABLE `t_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_banners_images`
--
ALTER TABLE `t_banners_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `t_blog`
--
ALTER TABLE `t_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_comments`
--
ALTER TABLE `t_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_faq`
--
ALTER TABLE `t_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_features`
--
ALTER TABLE `t_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_feedbacks`
--
ALTER TABLE `t_feedbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_files`
--
ALTER TABLE `t_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_groups`
--
ALTER TABLE `t_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_images`
--
ALTER TABLE `t_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_options`
--
ALTER TABLE `t_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `t_orders`
--
ALTER TABLE `t_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `t_payment_methods`
--
ALTER TABLE `t_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_products`
--
ALTER TABLE `t_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `t_products_videos`
--
ALTER TABLE `t_products_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `t_purchases`
--
ALTER TABLE `t_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_seo`
--
ALTER TABLE `t_seo`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_settings`
--
ALTER TABLE `t_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `t_subscribes`
--
ALTER TABLE `t_subscribes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_theme_settings`
--
ALTER TABLE `t_theme_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `t_translations`
--
ALTER TABLE `t_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=473;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_variants`
--
ALTER TABLE `t_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;
COMMIT;