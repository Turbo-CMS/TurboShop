SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Структура таблицы `t_articles`
--

DROP TABLE IF EXISTS `t_articles`;
CREATE TABLE `t_articles` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) NOT NULL,
  `url` varchar(255) NOT NULL,
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `text` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_articles`
--

INSERT INTO `t_articles` (`id`, `category_id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`, `visible`, `date`, `last_modified`, `position`, `image`, `views`, `rate`, `author`) VALUES
(1, 1, 'Название демонстрационной статьи', 'consec-tetadip-scinelit', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Заголовок демонстрационной статьи h2 \r\n Lorem Ipsum  - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую кол', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2021-01-02 22:00:00', '2021-01-02 21:50:11', 1, 'adult-businessman-businesswomen-1061588.jpg', 0, 0, 'Вебмастер'),
(2, 1, 'Название демонстрационной статьи', 'proin-tincidunt-felis', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2021-01-02 22:00:00', '2021-02-17 19:01:03', 2, 'analysis-brainstorming-chart-1571699.jpg', 3, 0, 'Вебмастер'),
(3, 3, 'Название демонстрационной статьи', 'lorem-ipsum-dolor', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2021-01-02 22:00:00', '2021-01-24 00:39:03', 3, 'beverage-chat-chatting-1243365.jpg', 0, 0, 'Вебмастер');

-- --------------------------------------------------------

--
-- Структура таблицы `t_articles_categories`
--

DROP TABLE IF EXISTS `t_articles_categories`;
CREATE TABLE `t_articles_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `name_h1` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(36) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_articles_categories`
--

INSERT INTO `t_articles_categories` (`id`, `parent_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `url`, `image`, `position`, `visible`, `external_id`, `last_modified`) VALUES
(1, 0, 'Бизнес-советы', '', 'Бизнес-советы', 'Бизнес-советы', '', '', 'biznes-sovety', '', 1, 1, '', '2021-01-02 22:07:19'),
(2, 0, 'Управление проектами', '', 'Управление проектами', 'Управление проектами', '', '', 'upravlenie-proektami', '', 2, 1, '', '2021-01-02 21:38:11'),
(3, 0, 'Повышение продаж', '', 'Повышение продаж', 'Повышение продаж', '', '', 'povyshenie-prodazh', '', 3, 1, '', '2021-01-02 22:16:33');

-- --------------------------------------------------------

--
-- Структура таблицы `t_banners`
--

DROP TABLE IF EXISTS `t_banners`;
CREATE TABLE `t_banners` (
  `id` int(11) NOT NULL,
  `group_id` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `show_all_pages` tinyint(1) NOT NULL DEFAULT '0',
  `categories` varchar(200) NOT NULL DEFAULT '0',
  `pages` varchar(200) NOT NULL DEFAULT '0',
  `brands` varchar(200) NOT NULL DEFAULT '0',
  `articles_categories` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_banners`
--

INSERT INTO `t_banners` (`id`, `group_id`, `name`, `description`, `position`, `visible`, `show_all_pages`, `categories`, `pages`, `brands`, `articles_categories`) VALUES
(1, '1', 'Главный слайдер', '', 1, 1, 0, '0', '1', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `t_banners_images`
--

DROP TABLE IF EXISTS `t_banners_images`;
CREATE TABLE `t_banners_images` (
  `id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `button` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_banners_images`
--

INSERT INTO `t_banners_images` (`id`, `banner_id`, `name`, `alt`, `title`, `description`, `url`, `button`, `image`, `position`, `visible`) VALUES
(1, 1, '', '', '', '', '', '', 'j3s.png', 1, 1),
(2, 1, '', '', '', '', '', '', 'Note8s.png', 2, 1),
(3, 1, '', '', '', '', '', '', 'iphoneX.png', 3, 1),
(4, 1, '', '', '', '', '', '', 'Banner02_RU.JPG', 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `url` varchar(255) NOT NULL,
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `text` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) NOT NULL DEFAULT '',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_blog`
--

INSERT INTO `t_blog` (`id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`, `visible`, `date`, `last_modified`, `image`, `views`, `rate`) VALUES
(1, 'Название  демонстрационной статьи', 'lorem-ipsum-dolor', 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Заголовок демонстрационной статьи h2 \r\n  Lorem Ipsum  - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую ко', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2020-12-31 22:00:00', '2021-01-02 21:27:09', 'blog-1.jpg', 0, 0),
(2, 'Название демонстрационной статьи', 'consec-tetadip-scinelit', 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2021-01-02 22:00:00', '2021-01-24 00:36:23', 'blog-2.jpg', 6, 0),
(3, 'Название  демонстрационной статьи', 'proin-tincidunt-felis', 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', 1, '2021-01-02 22:00:00', '2021-01-02 21:33:01', 'blog-5.jpg', 2, 1),
(4, 'Типографика', 'tipografika', 'Типографика', 'Типографика', 'В блоге есть встроенные настройки содержания статьи. \r\n Как формируется содержание \r\n Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги  &lt;h2&gt; ,  &lt;h3&gt; ,', '<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>', '<p>В блоге есть встроенные настройки содержания статьи.</p>\r\n<h2>Как формируется содержание</h2>\r\n<p>Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code>.&nbsp;</p>\r\n<h2>Где выводится содержание</h2>\r\n<p>Это можно настроить. По умолчанию, оно выводится перед первым подзаголовком, как в этой статье. Но вы можете задать другой вывод &mdash; сразу в начале статьи, перед текстом.</p>\r\n<h2>Можно ли его отключить</h2>\r\n<p>Да, конечно.&nbsp;</p>\r\n<h3>Содержание древовидное</h3>\r\n<p>И опять да, древовидное. Вы просто указываете теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code> . Чем больше число в заголовке &mdash; тем более вложенный пункт получается.</p>\r\n<h3 id=\"tochno-drevovidnye\">Точно древовидные?</h3>\r\n<blockquote class=\"wp-block-quote is-style-info\">\r\n<p>Точно-точно! Это еще один заголовок третьего уровня, который будет отображаться как дочерний.</p>\r\n</blockquote>\r\n<h4>Заголовок h4</h4>\r\n<p>Встроенные настройки содержания статьи это очень удобно.</p>\r\n<h2 id=\"customizing-headings\"><span class=\"bd-content-title\">Настройка заголовков</span></h2>\r\n<p>Используйте имеющиеся общие классы для воссоздания маленького вторичного текста-подзаголовка&nbsp;</p>\r\n<h5>Заголовок отображения <small class=\"text-muted\">С выцветшим вторичным текстом</small></h5>\r\n<h2 id=\"display-headings\"><span class=\"bd-content-title\">Заголовок дисплея</span></h2>\r\n<p>Традиционные заголовки созданы для &laquo;работы&raquo; &laquo;в глубине&raquo; вашей страницы. Если вам необходимо выделить заголовок, используйте&nbsp;<strong>&laquo;заголовок дисплея&raquo;</strong>&nbsp;- большего размера, слегка более вычурный.</p>\r\n<h1 class=\"display-1\">Display 1</h1>\r\n<h1 class=\"display-2\">Display 2</h1>\r\n<h1 class=\"display-3\">Display 3</h1>\r\n<h1 class=\"display-4\">Display 4</h1>\r\n<pre class=\"language-markup\"><code>&lt;h1 class=\"display-1\"&gt;Display 1&lt;/h1&gt;\r\n&lt;h1 class=\"display-2\"&gt;Display 2&lt;/h1&gt;\r\n&lt;h1 class=\"display-3\"&gt;Display 3&lt;/h1&gt;\r\n&lt;h1 class=\"display-4\"&gt;Display 4&lt;/h1&gt;</code></pre>\r\n<h2 id=\"lead\"><span class=\"bd-content-title\">Лид</span></h2>\r\n<p>Создайте выделяющийся, отличающийся от остальных параграф добавлением класса <code class=\"highlighter-rouge\">.lead</code>.</p>\r\n<p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>\r\n<pre class=\"language-markup\"><code>&lt;p class=\"lead\"&gt;\r\n  Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.\r\n&lt;/p&gt;</code></pre>\r\n<h2 id=\"blockquotes\"><span class=\"bd-content-title\">Цитаты</span></h2>\r\n<p>Для цитат с другого источника в вашей статье.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&nbsp; &nbsp;</p>\r\n</blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h3 id=\"naming-a-source\"><span class=\"bd-content-title\">Наименование источника</span></h3>\r\n<p>Добавьте&nbsp;<code class=\"highlighter-rouge\">&lt;footer class=\"blockquote-footer\"&gt;</code>&nbsp;для идентификации источника. Оберните имя источника в&nbsp;<code class=\"highlighter-rouge\">&lt;cite&gt;</code>.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n<footer class=\"blockquote-footer\">Кто-то знаменитый в <cite title=\"Название источника\">Source Title</cite></footer></blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n  &lt;footer class=\"blockquote-footer\"&gt;Кто-то знаменитый в &lt;cite title=\"Название источника\"&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h2 id=\"content\" class=\"bd-title\">Фигуры</h2>\r\n<p class=\"bd-lead\">Документация и примеры для отображения связанных изображений и текста с помощью компонента figure.</p>\r\n<div data-nosnippet=\"\">&nbsp;</div>\r\n<p>Когда вам понадобится отобразить часть контента &ndash; такого как изображение с определенной сопроводительной надписью &ndash; используйте <code class=\"highlighter-rouge\">&lt;figure&gt;</code>.</p>\r\n<p>Используйте классы&nbsp;<code class=\"highlighter-rouge\">.figure</code>&nbsp;,&nbsp;<code class=\"highlighter-rouge\">.figure-img</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">.figure-caption</code> для изменения некоторых базовых стилей в элементы HTML5 <code class=\"highlighter-rouge\">&lt;figure&gt;</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">&lt;figcaption&gt;</code>. Изображения в&nbsp;<code class=\"highlighter-rouge\">figure</code>&rsquo;s не имеют точного размера, так что убедитесь, что добавили в <code class=\"highlighter-rouge\">&lt;img&gt;</code>&nbsp;класс&nbsp;<code class=\"highlighter-rouge\">.img-fluid</code>&nbsp;для придания&nbsp;<code class=\"highlighter-rouge\">&lt;img&gt;</code> адаптивности.</p>\r\n<figure class=\"figure\"><img class=\"\" src=\"http://placehold.it/400x300\" alt=\"Figure\" />\r\n<figcaption class=\"figure-caption text-right\">A caption for the above image.</figcaption>\r\n</figure>\r\n<pre class=\"language-markup\"><code>&lt;figure class=\"figure\"&gt;\r\n  &lt;img src=\"...\" class=\"figure-img img-fluid rounded\" alt=\"...\"&gt;\r\n  &lt;figcaption class=\"figure-caption text-right\"&gt;A caption for the above image.&lt;/figcaption&gt;\r\n&lt;/figure&gt;</code></pre>\r\n<h2>Таблицы</h2>\r\n<p>Вот так таблицы, основанные на классе <code class=\"highlighter-rouge\">.table</code>, выглядят в базовой разметке таблиц.</p>\r\n<table class=\"table\">\r\n<thead>\r\n<tr>\r\n<th scope=\"col\">#</th>\r\n<th scope=\"col\">Имя</th>\r\n<th scope=\"col\">Фамилия</th>\r\n<th scope=\"col\">Username</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th scope=\"row\">1</th>\r\n<td>Mark</td>\r\n<td>Otto</td>\r\n<td>@mdo</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">2</th>\r\n<td>Jacob</td>\r\n<td>Thornton</td>\r\n<td>@fat</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">3</th>\r\n<td>Larry</td>\r\n<td>the Bird</td>\r\n<td>@twitter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<pre class=\"language-markup\"><code>&lt;table class=\"table\"&gt;\r\n  &lt;thead&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"col\"&gt;#&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Имя&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Фамилия&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Username&lt;/th&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/thead&gt;\r\n  &lt;tbody&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;1&lt;/th&gt;\r\n      &lt;td&gt;Mark&lt;/td&gt;\r\n      &lt;td&gt;Otto&lt;/td&gt;\r\n      &lt;td&gt;@mdo&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;2&lt;/th&gt;\r\n      &lt;td&gt;Jacob&lt;/td&gt;\r\n      &lt;td&gt;Thornton&lt;/td&gt;\r\n      &lt;td&gt;@fat&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;3&lt;/th&gt;\r\n      &lt;td&gt;Larry&lt;/td&gt;\r\n      &lt;td&gt;the Bird&lt;/td&gt;\r\n      &lt;td&gt;@twitter&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/tbody&gt;\r\n&lt;/table&gt;</code></pre>\r\n<h2>Изображения</h2>\r\n<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/workspacee_3.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p>Классы&nbsp;<strong>image_slider</strong>&nbsp;и<strong>&nbsp;image_gallery&nbsp;</strong>формируют карусель из загруженных друг за другом изображений. Главное различие между ними в том, что&nbsp;<strong>image_gallery</strong>&nbsp;формирует карусель из трех слайдов, в&nbsp;<strong>image_slider&nbsp;</strong>из одного.</p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/audio_cassette.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/gallery_5.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/xbox_360_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy_icon.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/nintendo_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>', 1, '2020-12-30 22:00:00', '2021-01-09 01:37:29', 'typewriter.jpg', 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_brands`
--

DROP TABLE IF EXISTS `t_brands`;
CREATE TABLE `t_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_brands`
--

INSERT INTO `t_brands` (`id`, `name`, `url`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `image`, `visible`, `last_modified`) VALUES
(1, '', 'apple', '', '', '', '', 'Apple.jpg', 1, '2021-01-23 18:29:10'),
(2, 'Samsung', 'samsung', 'Samsung', 'Samsung', 'Samsung', '', 'Samsung_Logo.png', 1, '2021-05-25 06:30:08'),
(3, 'DJI', 'dji', 'DJI', 'DJI', 'DJI', '', 'DJL.jpg', 1, '2020-12-31 19:36:29'),
(4, 'Havit', 'havit', 'Havit', 'Havit', 'Havit', '', 'Havit.jpg', 1, '2020-12-31 19:36:57'),
(5, 'JBL', 'jbl', 'JBL', 'JBL', 'JBL', '', 'JBL.jpg', 1, '2021-01-10 01:07:12'),
(6, 'Motorola', 'motorola', 'Motorola', 'Motorola', 'Motorola', '', 'Motorola.jpg', 1, '2020-12-31 19:37:51'),
(7, 'Nokia', 'nokia', 'Nokia', 'Nokia', 'Nokia', '', 'nokia.png', 1, '2020-12-31 19:38:16'),
(8, '1More', '1more', '1More', '1More', '1More', '', '1MORE-LOGO.jpg', 1, '2020-12-31 19:40:56');

-- --------------------------------------------------------

--
-- Структура таблицы `t_callbacks`
--

DROP TABLE IF EXISTS `t_callbacks`;
CREATE TABLE `t_callbacks` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_callbacks`
--

INSERT INTO `t_callbacks` (`id`, `date`, `name`, `phone`, `message`, `processed`) VALUES
(1, '2021-05-22 02:11:42', 'Роман', '+1(234) 567-89-01', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_categories`
--

DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE `t_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `name_h1` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(36) NOT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_categories`
--

INSERT INTO `t_categories` (`id`, `parent_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `url`, `image`, `position`, `visible`, `external_id`, `featured`, `last_modified`) VALUES
(1, 0, 'Планшеты', '', 'Планшеты', 'Планшеты', 'Планшеты', '', 'planshety', '1398914.png', 7, 1, '', 1, '2021-01-24 00:25:20'),
(2, 0, 'Гаджеты', '', 'Гаджеты', 'Гаджеты', 'Гаджеты', '', 'gadzhety', '', 2, 1, '', 0, '2021-01-24 00:25:20'),
(3, 2, 'Квадрокоптеры', '', 'Квадрокоптеры', 'Квадрокоптеры', 'Квадрокоптеры', '', 'kvadrokoptery', '', 3, 1, '', 0, '2021-01-24 00:25:20'),
(4, 0, 'Аксессуары', '', 'Аксессуары', 'Аксессуары', 'Аксессуары', '', 'aksessuary', '1735761.jpeg', 6, 1, '', 1, '2021-01-24 00:25:20'),
(5, 2, 'Портативная акустика', '', 'Портативная акустика', 'Портативная акустика', 'Портативная акустика', '', 'portativnaya-akustika', '', 4, 1, '', 0, '2021-01-24 00:25:20'),
(6, 2, 'Часы', '', 'Часы', 'Часы', 'Часы', '', 'chasy', '', 5, 1, '', 0, '2021-05-25 06:30:08'),
(7, 0, 'Смартфоны', '', 'Смартфоны', 'Смартфоны', 'Смартфон – универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов.', '<p><strong>Смартфон</strong> &ndash; универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов. Как выбрать смартфон? Каталог смартфонов чрезвычайно широк, и разобраться в этом многообразии нелегко. Первое, с чего стоит начать, &ndash; операционная система. Вы можете приобрести: <a href=\"catalog/smartfony/operatingsystem-android\">смартфоны Android&nbsp;</a>&ndash; наиболее распространенные; <a href=\"catalog/smartfony/operatingsystem-ios\">смартфоны iOS</a> &ndash; их ценят за надежность и высокую скорость работы; Другие важные критерии &ndash; размер и разрешение экрана, тип процессора, возможности камеры. &laquo;Turbo Shop&raquo; &ndash; интернет-магазин смартфонов, в котором представлено множество моделей от ведущих производителей. Здесь вы можете купить как дешевые смартфоны, так и устройства среднего класса и топовые модели с доставкой по Москве и другим регионам РФ.</p>', 'smartfony', '1643707.png', 1, 1, '', 1, '2021-05-25 05:22:00');

-- --------------------------------------------------------

--
-- Структура таблицы `t_categories_features`
--

DROP TABLE IF EXISTS `t_categories_features`;
CREATE TABLE `t_categories_features` (
  `category_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_categories_features`
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
-- Структура таблицы `t_comments`
--

DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `type` enum('product','blog','article') NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_comments`
--

INSERT INTO `t_comments` (`id`, `date`, `ip`, `object_id`, `name`, `text`, `type`, `approved`, `parent_id`, `admin`, `rate`) VALUES
(1, '2021-01-24 03:46:28', '127.0.0.1', 39, 'Андрей', 'Прекрасный смартфон.', 'product', 1, 0, 0, 0),
(2, '2021-05-22 02:10:14', '127.0.0.1', 39, 'Администратор', 'Андрей,  Мы рады, что вам понравилось!', 'product', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_coupons`
--

DROP TABLE IF EXISTS `t_coupons`;
CREATE TABLE `t_coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(256) NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `type` enum('absolute','percentage') NOT NULL DEFAULT 'absolute',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) DEFAULT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  `usages` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_coupons`
--

INSERT INTO `t_coupons` (`id`, `code`, `expire`, `type`, `value`, `min_order_price`, `single`, `usages`) VALUES
(1, 'TURBOCMS', NULL, 'percentage', '15.00', '1000.00', 0, 1),
(2, 'TESTCOUPON', '2021-01-23 22:00:00', 'percentage', '30.00', '0.00', 0, 0),
(3, 'THANKYOU', '2021-01-23 22:00:00', 'percentage', '50.00', '2000.00', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_currencies`
--

DROP TABLE IF EXISTS `t_currencies`;
CREATE TABLE `t_currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `sign` varchar(20) NOT NULL,
  `code` char(3) NOT NULL DEFAULT '',
  `rate_from` decimal(10,2) NOT NULL DEFAULT '1.00',
  `rate_to` decimal(10,2) NOT NULL DEFAULT '1.00',
  `cents` int(1) NOT NULL DEFAULT '2',
  `position` int(11) NOT NULL,
  `enabled` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_currencies`
--

INSERT INTO `t_currencies` (`id`, `name`, `sign`, `code`, `rate_from`, `rate_to`, `cents`, `position`, `enabled`) VALUES
(1, 'доллары', '$', 'USD', '1.00', '1.00', 0, 1, 1),
(2, 'гривны', 'грн', 'UAH', '28.00', '1.00', 0, 2, 1),
(3, 'рубли', 'руб', 'RUR', '73.00', '1.00', 0, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `t_delivery`
--

DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `separate_payment` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_delivery`
--

INSERT INTO `t_delivery` (`id`, `name`, `description`, `free_from`, `price`, `enabled`, `position`, `separate_payment`) VALUES
(1, 'Курьерская доставка по городу', '<p>Курьерская доставка осуществляется службой компаний-перевозчиков города. Ваш заказ будет отправлен на следующий день после заказа. Доставка занимает от 1 до 3 дней.</p>', '200.00', '20.00', 1, 1, NULL),
(2, 'Самовывоз', '<p>Удобный, бесплатный и быстрый способ получения заказа.</p>\r\n<p>Адрес офиса: Москва, шоссе Энтузиастов 45/31, офис 453</p>', '0.00', '0.00', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `t_delivery_payment`
--

DROP TABLE IF EXISTS `t_delivery_payment`;
CREATE TABLE `t_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Связка способом оплаты и способов доставки';

--
-- Дамп данных таблицы `t_delivery_payment`
--

INSERT INTO `t_delivery_payment` (`delivery_id`, `payment_method_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `t_features`
--

DROP TABLE IF EXISTS `t_features`;
CREATE TABLE `t_features` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `in_filter` tinyint(1) DEFAULT NULL,
  `is_color` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `url_in_product` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_features`
--

INSERT INTO `t_features` (`id`, `name`, `position`, `in_filter`, `is_color`, `url`, `url_in_product`) VALUES
(1, 'Операционная система', 2, 1, 0, 'operatingsystem', 1),
(2, 'Оперативная память', 3, 0, 0, 'ram', 0),
(3, 'Цвет', 1, 1, 1, 'cololr', 0),
(4, 'Процессор', 4, 0, 0, 'protsessor', 0),
(5, 'Количество ядер', 5, 0, 0, 'cores', 0),
(6, 'Тактовая частота', 6, 0, 0, 'clockrate', 0),
(7, 'Графический процессор', 7, 0, 0, 'gpu', 0),
(8, 'Встроенная память', 8, 1, 0, 'memory', 0),
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
-- Структура таблицы `t_feedbacks`
--

DROP TABLE IF EXISTS `t_feedbacks`;
CREATE TABLE `t_feedbacks` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_feedbacks`
--

INSERT INTO `t_feedbacks` (`id`, `date`, `ip`, `name`, `email`, `message`, `processed`) VALUES
(1, '2021-05-22 02:08:45', '127.0.0.1', 'Роман', 'test@gmail.com', 'Как к вам пройти?', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_files`
--

DROP TABLE IF EXISTS `t_files`;
CREATE TABLE `t_files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `type` enum('product','blog','page','order') NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_files`
--

INSERT INTO `t_files` (`id`, `name`, `object_id`, `filename`, `type`, `position`) VALUES
(1, 'Инструкция по использованию (PIE)', 23, 'sm-a505_a705_ds_um_open_pie_rus_rev.1.0_190607.pdf', 'product', 0),
(2, 'Инструкция по использованию (QQ)', 23, 'sm-a505_a705fn_um_cis_qq_rus_rev.1.0_200407.pdf', 'product', 1),
(3, '', 39, 'iphone-12-mini-ios14-info-rs.pdf', 'product', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_groups`
--

DROP TABLE IF EXISTS `t_groups`;
CREATE TABLE `t_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_groups`
--

INSERT INTO `t_groups` (`id`, `name`, `discount`) VALUES
(1, 'Постоянный покупатель', '5.00');

-- --------------------------------------------------------

--
-- Структура таблицы `t_images`
--

DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_images`
--

INSERT INTO `t_images` (`id`, `name`, `product_id`, `filename`, `position`) VALUES
(1, '', 1, 'ipadmini-gold-360_ru-ru-screen1.jpg', 1),
(2, '', 1, 'ipadmini-gold-cell-360_ru-ru-screen3.jpg', 2),
(3, '', 1, 'ipadmini-gold-cell-360_ru-ru-screen2.jpg', 3),
(4, '', 1, 'zagruzheno-2.jpg', 4),
(5, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-frontblack-110719531.jpg', 5),
(6, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-backblack-110719514.jpg', 6),
(7, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-leftblack-110719515.jpg', 7),
(8, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-rsideblack-110719517.jpg', 8),
(9, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-spenfblack-110719519.jpg', 9),
(10, '', 2, 'ru-galaxy-tabs4-t835-sm-t835nzkaser-lsideblack-110719518.jpg', 10),
(11, '', 3, '_vfqmco---2.jpg', 11),
(12, '', 3, '_ijqtel---4.jpg', 12),
(13, '', 3, '_txjvbc---3.jpg', 13),
(14, '', 3, '_dycgcz.jpg', 14),
(15, '', 4, '40067505b.jpg', 15),
(16, '', 4, '1516731348000_img_934236.jpg', 16),
(17, '', 4, '1.jpg', 17),
(18, '', 4, 'red_fold-efbbfa7c5463ee7d12dd89a7843682b6.jpg', 18),
(19, '', 4, '1516731348000_img_934235.jpg', 19),
(20, '', 5, 'medium_4058afad-4331-40ab-9a4e-30b49c72447b.jpg', 20),
(21, '', 5, '1474993063000_img_690938.jpg', 21),
(22, '', 5, '1474993063000_img_690937.jpg', 22),
(23, '', 5, '1474993063000_img_690940.jpg', 23),
(24, '', 5, '1474993064000_img_691317.jpg', 24),
(25, '', 5, '1474993064000_img_691318.jpg', 25),
(26, '', 5, '1484084740000_1285010.jpg', 26),
(27, '', 6, 'phantom-4-pro-v2.jpg', 27),
(28, '', 6, 'phantom4.jpg', 28),
(29, '', 6, 'phantom4_3.jpg', 29),
(30, '', 6, 'phantom4_4.jpg', 30),
(31, '', 6, 'phantom4_2.jpg', 31),
(32, '', 6, 'phantom4_5.jpg', 32),
(33, '', 6, 'phantom4_6.jpg', 33),
(34, '', 6, 'phantom4_1.jpg', 34),
(35, '', 7, 'bluetooth-navushniki-havit-g1-black-redid-32988818316526.jpg', 0),
(161, '', 35, 'ru-galaxy-watch-r800-sm-r800nzsaser-sidesilver-111704884.jpg', 3),
(36, '', 7, 'bluetooth-navushniki-havit-g1-black-redid-54147954920048.jpg', 1),
(37, '', 7, 'bluetooth-navushniki-havit-g1-black-redid-90772409604182.jpg', 2),
(38, '', 8, 'navushniki-1more-quad-driver-in-ear-mic-gray-97887628198921.jpg', 0),
(39, '', 8, 'navushniki-1more-quad-driver-in-ear-mic-gray-34677864051936.jpg', 1),
(40, '', 8, 'navushniki-1more-quad-driver-in-ear-mic-gray-75520435520855.jpg', 2),
(41, '', 9, 'akustika-jbl-flip-4-redid-36487122752012.jpg', 41),
(42, '', 9, 'akustika-jbl-flip-4-redid-92494831604564.jpg', 42),
(43, '', 9, 'akustika-jbl-flip-4-redid-75375349928708.jpg', 43),
(44, '', 10, 'akustika-jbl-flip-4-blueid-94616201825941.jpg', 44),
(45, '', 10, 'akustika-jbl-flip-4-blueid-68207712674875.jpg', 45),
(46, '', 10, 'akustika-jbl-flip-4-blueid-47804421117556.jpg', 46),
(47, '', 11, 'akustika-jbl-flip-4-black-jblflip4blk-49196216122966.jpg', 47),
(48, '', 11, 'akustika-jbl-flip-4-black-jblflip4blk-29315732675620.jpg', 48),
(49, '', 11, 'akustika-jbl-flip-4-black-jblflip4blk-87030673111114.jpg', 49),
(50, '', 11, 'akustika-jbl-flip-4-black-jblflip4blk-31799161798553.jpg', 50),
(51, '', 11, 'akustika-jbl-flip-4-black-jblflip4blk-52760880514722.jpg', 51),
(52, '', 12, 'smart-godinnik-samsung-galaxy-watch-active-green-sm-r500nzgasek-31208679162006.jpg', 0),
(53, '', 12, 'smart-godinnik-samsung-galaxy-watch-active-green-sm-r500nzgasek-50617179971154.jpg', 1),
(54, '', 12, 'smart-godinnik-samsung-galaxy-watch-active-green-sm-r500nzgasek-34872841509516.jpg', 2),
(160, '', 35, 'ru-galaxy-watch-r800-sm-r800nzsaser-rperspectivesilver-111704882.jpg', 0),
(159, '', 35, 'ru-galaxy-watch-r800-sm-r800nzsaser-frontsilver-111704892.jpg', 1),
(158, '', 35, 'ru-galaxy-watch-r800-sm-r800nzsaser-dynamicsilver-111704881.jpg', 2),
(157, '', 34, 'obrazek_027.jpg', 4),
(156, '', 34, 'obrazek_026.jpg', 0),
(155, '', 34, 'obrazek_013.jpg', 3),
(154, '', 34, 'obrazek_008.jpg', 1),
(153, '', 34, 'obrazek_004.jpg', 2),
(64, '', 13, 'smart-godinnik-apple-watch-series-4-gps-44mm-space-grey-aluminium-case-with-black-sport-band-mu6d2ua-a-26185985809584.jpg', 64),
(65, '', 13, 'smart-godinnik-apple-watch-series-4-gps-44mm-space-grey-aluminium-case-with-black-sport-band-mu6d2ua-a-78812144927482.jpg', 65),
(66, '', 13, 'smart-godinnik-apple-watch-series-4-gps-44mm-space-grey-aluminium-case-with-black-sport-band-mu6d2ua-a-24264749321485.jpg', 66),
(67, '', 14, 'smart-godinnik-apple-watch-series-4-44mm-silver-aluminium-case-with-seashell-sport-loop-mu6c2-31416238340533.jpg', 67),
(68, '', 14, 'smart-godinnik-apple-watch-series-4-44mm-silver-aluminium-case-with-seashell-sport-loop-mu6c2-99806942486949.jpg', 68),
(69, '', 15, 'smart-godinnik-applewatch-series4-gps40mm-silver-aluminium-case-with-white-sport-band-mu642uaa-74850832243181.jpg', 69),
(70, '', 15, 'smart-godinnik-applewatch-series4-gps40mm-silver-aluminium-case-with-white-sport-band-mu642uaa-64304149819273.jpg', 70),
(71, '', 15, 'smart-godinnik-applewatch-series4-gps40mm-silver-aluminium-case-with-white-sport-band-mu642uaa-48700603317145.jpg', 71),
(72, '', 16, 'navushniki-apple-air-pods-white-23036509454069.jpg', 72),
(73, '', 16, 'navushniki-apple-air-pods-white-73708186741804.jpg', 73),
(74, '', 17, '71fjqhoegyl._ac_sl1500_.jpg', 74),
(75, '', 17, '71pnwtsvb9l._ac_sl1500_.jpg', 75),
(76, '', 17, '61mvv2lf2al._ac_sl1500_.jpg', 76),
(77, '', 17, '71iar0vxrcl._ac_sl1500_.jpg', 77),
(78, '', 17, '81km5le6xpl._ac_sl1500_.jpg', 78),
(79, '', 17, '71oko5gxbll._ac_sl1500_.jpg', 79),
(80, '', 18, 'smartfon-nokia-4.2-ds-3-32-black-67706840755470.jpg', 0),
(81, '', 18, 'smartfon-nokia-4.2-ds-3-32-black-32311791624479.jpg', 1),
(82, '', 18, 'smartfon-nokia-4.2-ds-3-32-black-54168853766413.jpg', 2),
(83, '', 18, 'smartfon-nokia-4.2-ds-3-32-black-76048112799420.jpg', 3),
(84, '', 18, 'smartfon-nokia-4.2-ds-3-32-black-47849835211348.jpg', 4),
(85, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-69075430644668.jpg', 85),
(86, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-83216239997865.jpg', 86),
(87, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-99713460022339.jpg', 87),
(88, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-66920103837930.jpg', 88),
(89, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-98818084535169.jpg', 89),
(90, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-29342158903919.jpg', 90),
(91, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-39016854160625.jpg', 91),
(92, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-66415371628958.jpg', 92),
(93, '', 19, 'smartfon-samsung-galaxy-fold-12512gb-cosmos-black-sm-f900f-44115285558206.jpg', 93),
(94, '', 20, 'smartfon-samsung-galaxy-s10-plus-512-gb-ceramic-white-sm-g975fcwgsek-39009617612848.jpg', 94),
(95, '', 20, 'smartfon-samsung-galaxy-s10-plus-512-gb-ceramic-white-sm-g975fcwgsek-83737713663021.jpg', 95),
(96, '', 20, 'smartfon-samsung-galaxy-s10-plus-512-gb-ceramic-white-sm-g975fcwgsek-22161511186875.jpg', 96),
(97, '', 20, 'smartfon-samsung-galaxy-s10-plus-512-gb-ceramic-white-sm-g975fcwgsek-53563988347990.jpg', 97),
(98, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-70308128611260.jpg', 0),
(99, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-62670024249419.jpg', 1),
(100, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-83131572363733.jpg', 2),
(101, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-53741446354305.jpg', 3),
(102, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-52067331415849.jpg', 4),
(103, '', 21, 'smartfon-samsung-galaxy-a30-332gb-black-26952905746814.jpg', 5),
(104, '', 22, '4029803990fedff0872d37d32bdf4ca71b6aa82b.jpg', 104),
(105, '', 22, 'ff0f1e3d9328f7fd62427ed3342528a14d3fe51a.jpg', 105),
(106, '', 22, 'cea43cfe6791c4598f95716342e1f458fc0d182d.jpg', 106),
(107, '', 22, 'ef484daa1bdd5d712152db0dff0d04c87ffcf999.jpg', 107),
(108, '', 22, 'd0cdca7189591e9a231845de14c60195a54bee84.jpg', 108),
(109, '', 23, 'smartfon-samsung-galaxy-a50-464gb-black-69055234313115.jpg', 0),
(110, '', 23, 'smartfon-samsung-galaxy-a50-464gb-black-24215274589637.jpg', 1),
(111, '', 23, 'smartfon-samsung-galaxy-a50-464gb-black-35616530453562.jpg', 2),
(112, '', 23, 'smartfon-samsung-galaxy-a50-464gb-black-94028845938432.jpg', 3),
(113, '', 23, 'samsung_galaxya50_6.jpg', 4),
(114, '', 23, 'samsung_galaxya50_4.jpg', 5),
(115, '', 23, 'samsung_galaxya50_7.jpg', 6),
(116, '', 23, 'samsung_galaxya50_8.jpg', 7),
(117, '', 24, 'smartfon-samsung-galaxy-a10-2-32gb-red-sm-a105fz-18197949876691.jpg', 117),
(118, '', 24, 'smartfon-samsung-galaxy-a10-2-32gb-red-sm-a105fz-25623128489735.jpg', 118),
(119, '', 24, 'smartfon-samsung-galaxy-a10-2-32gb-red-sm-a105fz-17999802951371.jpg', 119),
(120, '', 25, 'smartfon-samsung-galaxy-a20-3-32gb-blue-sm-a205fz-95714431914642.jpg', 120),
(121, '', 25, 'smartfon-samsung-galaxy-a20-3-32gb-blue-sm-a205fz-42443312316736.jpg', 121),
(122, '', 25, 'smartfon-samsung-galaxy-a20-3-32gb-blue-sm-a205fz-69422461393426.jpg', 122),
(123, '', 25, 'smartfon-samsung-galaxy-a20-3-32gb-blue-sm-a205fz-68835397371413.jpg', 123),
(124, '', 26, 'samsung_galaxya70_1.jpg', 124),
(125, '', 26, 'samsung_galaxya70_4.jpg', 125),
(126, '', 26, 'samsung_galaxya70_3.jpg', 126),
(127, '', 26, 'samsung_galaxya70_5.jpg', 127),
(128, '', 26, 'samsung_galaxya70_6.jpg', 128),
(129, '', 26, 'samsung_galaxya70_9.jpg', 129),
(130, '', 27, 'samsung_galaxya40_1.jpg', 130),
(131, '', 27, 'samsung_galaxya40_4.jpg', 131),
(132, '', 27, 'samsung_galaxya40_3.jpg', 132),
(133, '', 27, 'samsung_galaxya40_5.jpg', 133),
(134, '', 27, 'samsung_galaxya40_7.jpg', 134),
(135, '', 27, 'samsung_galaxya40_8.jpg', 135),
(136, '', 28, 'samsung_galaxya2core_1.jpg', 0),
(137, '', 28, 'samsung_galaxya2core_2.jpg', 1),
(138, '', 29, 'samsung_galaxya80_1.jpg', 0),
(139, '', 29, 'samsung_galaxya80_5.jpg', 1),
(140, '', 30, 'samsung_galaxya20e_1.jpg', 0),
(141, '', 30, 'samsung_galaxya20e_2.jpg', 1),
(142, '', 31, 'smartfon-appleiphone7128gba1660cpojetblackeuromobi-54939126454915.jpeg', 0),
(143, '', 31, 'smartfon-appleiphone7128gba1660cpojetblackeuromobi-43520203892437.jpeg', 1),
(144, '', 31, 'smartfon-appleiphone7128gba1660cpojetblackeuromobi-12532935230360.jpeg', 2),
(145, '', 31, 'smartfon-appleiphone7128gba1660cpojetblackeuromobi-22223855191946.jpeg', 3),
(146, '', 32, 'samsung_galaxys7_4.jpg', 0),
(147, '', 32, 'samsung_galaxys7_5.jpg', 1),
(148, '', 32, 'samsung_galaxys7_6.jpg', 2),
(149, '', 32, 'samsung_galaxys7_7.jpg', 3),
(150, '', 33, '100609_p_28.png', 0),
(151, '', 33, '100609_p_29.png', 1),
(180, '', 39, '991945af2d299e636dc00cd32d41549b.jpg', 1),
(181, '', 39, '839452defe42b04a09b30f1915720093.jpg', 0),
(189, '', 39, '3030e14d9fa4d900c1ebbb0fd5603ccb.jpg', 6),
(188, '', 39, '0f3a28bdf0a29653836cb75b22eb8770.jpg', 7),
(184, '', 39, '2d26d0fe9da60bb96d10e1181d987c9a.jpg', 3),
(185, '', 39, '21c6dc6eebbbbdf5a291e66367f81acc.jpg', 2),
(186, '', 39, 'fa26c46e6581de65c0f7823591e05ba1.jpg', 5),
(187, '', 39, 'd75d4340caebeaef61aea69f18598021.jpg', 4),
(190, '', 39, '033c16464aa9a53b63531def5a61072f.jpg', 9),
(191, '', 39, '8e90d4590a2e6092795cef266ecba090.jpg', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `t_labels`
--

DROP TABLE IF EXISTS `t_labels`;
CREATE TABLE `t_labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_labels`
--

INSERT INTO `t_labels` (`id`, `name`, `color`, `position`) VALUES
(1, 'перезвонить', 'ff00ff', 1),
(2, 'ожидается товар', '00d5fa', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `t_languages`
--

DROP TABLE IF EXISTS `t_languages`;
CREATE TABLE `t_languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(10) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_languages`
--

INSERT INTO `t_languages` (`id`, `name`, `label`, `is_default`, `enabled`, `position`) VALUES
(1, 'Russian', 'ru', 0, 1, 1),
(2, 'English', 'en', 0, 1, 2),
(3, 'Ukrainian', 'ua', 0, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_articles`
--

DROP TABLE IF EXISTS `t_lang_articles`;
CREATE TABLE `t_lang_articles` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `article_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_articles`
--

INSERT INTO `t_lang_articles` (`lang_id`, `lang_label`, `article_id`, `name`, `author`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(1, '', 1, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Заголовок демонстрационной статьи h2 \r\n Lorem Ipsum  - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую кол', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Consec tetadip scinelit', 'Webmaster', 'Consec tetadip scinelit', 'Consec tetadip scinelit, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human h', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Назва демонстраційної статті, Вебмайстер', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(2, '', 2, 'Proin tincidunt felis', 'Webmaster', 'Proin tincidunt felis', 'Proin tincidunt felis, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human h', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Назва демонстраційної статті, Вебмайстер', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 3, 'Название демонстрационной статьи', 'Вебмастер', 'Название демонстрационной статьи', 'Название демонстрационной статьи, Вебмастер', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Lorem ipsum dolor', 'Webmaster', 'Lorem ipsum dolor', 'Lorem ipsum dolor, Webmaster', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human h', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>');
INSERT INTO `t_lang_articles` (`lang_id`, `lang_label`, `article_id`, `name`, `author`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(3, '', 3, 'Назва демонстраційної статті', 'Вебмайстер', 'Назва демонстраційної статті', 'Назва демонстраційної статті, Вебмайстер', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_articles_categories`
--

DROP TABLE IF EXISTS `t_lang_articles_categories`;
CREATE TABLE `t_lang_articles_categories` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_h1` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_articles_categories`
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
-- Структура таблицы `t_lang_banners_images`
--

DROP TABLE IF EXISTS `t_lang_banners_images`;
CREATE TABLE `t_lang_banners_images` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `banner_image_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `button` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_banners_images`
--

INSERT INTO `t_lang_banners_images` (`lang_id`, `lang_label`, `banner_image_id`, `name`, `alt`, `title`, `description`, `url`, `button`) VALUES
(1, '', 1, '', '', '', '', '', ''),
(2, '', 1, '', '', '', '', '', ''),
(3, '', 1, '', '', '', '', '', ''),
(1, '', 2, '', '', '', '', '', ''),
(2, '', 2, '', '', '', '', '', ''),
(3, '', 2, '', '', '', '', '', ''),
(1, '', 3, '', '', '', '', '', ''),
(2, '', 3, '', '', '', '', '', ''),
(3, '', 3, '', '', '', '', '', ''),
(1, '', 4, '', '', '', '', '', ''),
(2, '', 4, '', '', '', '', '', ''),
(3, '', 4, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_blog`
--

DROP TABLE IF EXISTS `t_lang_blog`;
CREATE TABLE `t_lang_blog` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_blog`
--

INSERT INTO `t_lang_blog` (`lang_id`, `lang_label`, `blog_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(1, '', 1, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Заголовок демонстрационной статьи h2 \r\n  Lorem Ipsum  - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую ко', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 1, 'Lorem ipsum dolor', 'Lorem ipsum dolor', 'Lorem ipsum dolor', 'Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the mas', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 1, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 2, 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Название демонстрационной статьи', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 2, 'Consec tetadip scinelit', 'Consec tetadip scinelit', 'Consec tetadip scinelit', 'Demo article title h2 \r\nBut I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the m', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>'),
(3, '', 2, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">...</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 3, 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Название  демонстрационной статьи', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '<p>Заголовок демонстрационной статьи h2 Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только...</p>', '<h2>Заголовок демонстрационной статьи h2</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстрационной статьи h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\">Lorem Ipsum</a>&nbsp;- это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>'),
(2, '', 3, 'Proin tincidunt felis', 'Proin tincidunt felis', 'Proin tincidunt felis', 'Demo article title h2 \r\n But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the ', '<p>Demo article title h2 But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is...</p>', '<h2>Demo article title h2</h2>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue&nbsp;<strong>pleasure rationally encounter</strong>&nbsp;consequences that are extremely painful.</p>\r\n<h3>Demo article title h3</h3>\r\n<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever&nbsp;<a href=\"https://turbo-cms.com/\">undertakes laborious</a>&nbsp;physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>');
INSERT INTO `t_lang_blog` (`lang_id`, `lang_label`, `blog_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `annotation`, `text`) VALUES
(3, '', 3, 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Назва демонстраційної статті', 'Lorem Ipsum & nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, ви', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Заголовок</span>&nbsp;<span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">демонстраційної</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">статті</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">h2 Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">текст-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">риба</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">часто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">використовуваний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">у пресі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">та</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">веб</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">-</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">дизайні</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">є</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">стандартною</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">\"</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">рибою</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">\"</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">текстів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">на</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">латиниці</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">початку</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">XVI</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">століття</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">У той</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">якийсь</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">безіменний</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">друкар</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">створив</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">велику</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">колекцію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">розмірів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">форм</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">шрифтів</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"47\">використовуючи</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"48\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"49\">для</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"50\">роздруківки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"51\">зразків</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"52\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"53\">Lorem Ipsum</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"54\">не тільки</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"55\">.</span></p>', '<h2>Заголовок демонстраційної статті h2</h2>\r\n<p><strong> Lorem Ipsum </strong> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. consequences that are extremely painful.</p>\r\n<h3>Заголовок демонстраційної статті h3</h3>\r\n<p><a href=\"https://turbo-cms.com/\"> Lorem Ipsum </a> &amp; nbsp; - це текст- \"риба\", часто використовуваний у пресі та веб-дизайні. Lorem Ipsum є стандартною \"рибою\" для текстів на латиниці з початку XVI століття. У той час якийсь безіменний друкар створив велику колекцію розмірів і форм шрифтів, використовуючи Lorem Ipsum для роздруківки зразків. Lorem Ipsum не тільки успішно пережив без помітних змін п\'ять століть, але й прижилася в електронному дизайн. Його популяризації в новий час послужили публікація листів Letraset із зразками Lorem Ipsum в 60-х роках і, в більш недавні часи, програми електронної верстки типу Aldus PageMaker, в шаблонах яких використовується Lorem Ipsum. physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>Давно з\'ясовано, що при оцінці дизайну і композиції читається текст заважає зосередитися. Lorem Ipsum використовують тому, що той забезпечує більш-менш стандартний заповнення шаблону, а також реальний розподіл букв і пробілів в абзацах, яке не виходить за простій дублікації \"Тут ваш текст .. Тут ваш текст .. Тут ваш текст ..\" Багато програм електронної верстки та редактори HTML використовують Lorem Ipsum як текст за замовчуванням, так що пошук за ключовими словами \"lorem ipsum\" відразу показує, як багато веб-сторінок все ще чекають свого справжнього народження. За минулі роки текст Lorem Ipsum отримав багато версій. Деякі версії з\'явилися помилково, деякі - навмисно (наприклад, гумористичні варіанти).</p>'),
(1, '', 4, 'Типографика', 'Типографика', 'Типографика', 'В блоге есть встроенные настройки содержания статьи. \r\n Как формируется содержание \r\n Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги  &lt;h2&gt; ,  &lt;h3&gt; ,', '<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>', '<p>В блоге есть встроенные настройки содержания статьи.</p>\r\n<h2>Как формируется содержание</h2>\r\n<p>Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code>.&nbsp;</p>\r\n<h2>Где выводится содержание</h2>\r\n<p>Это можно настроить. По умолчанию, оно выводится перед первым подзаголовком, как в этой статье. Но вы можете задать другой вывод &mdash; сразу в начале статьи, перед текстом.</p>\r\n<h2>Можно ли его отключить</h2>\r\n<p>Да, конечно.&nbsp;</p>\r\n<h3>Содержание древовидное</h3>\r\n<p>И опять да, древовидное. Вы просто указываете теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code> . Чем больше число в заголовке &mdash; тем более вложенный пункт получается.</p>\r\n<h3 id=\"tochno-drevovidnye\">Точно древовидные?</h3>\r\n<blockquote class=\"wp-block-quote is-style-info\">\r\n<p>Точно-точно! Это еще один заголовок третьего уровня, который будет отображаться как дочерний.</p>\r\n</blockquote>\r\n<h4>Заголовок h4</h4>\r\n<p>Встроенные настройки содержания статьи это очень удобно.</p>\r\n<h2 id=\"customizing-headings\"><span class=\"bd-content-title\">Настройка заголовков</span></h2>\r\n<p>Используйте имеющиеся общие классы для воссоздания маленького вторичного текста-подзаголовка&nbsp;</p>\r\n<h5>Заголовок отображения <small class=\"text-muted\">С выцветшим вторичным текстом</small></h5>\r\n<h2 id=\"display-headings\"><span class=\"bd-content-title\">Заголовок дисплея</span></h2>\r\n<p>Традиционные заголовки созданы для &laquo;работы&raquo; &laquo;в глубине&raquo; вашей страницы. Если вам необходимо выделить заголовок, используйте&nbsp;<strong>&laquo;заголовок дисплея&raquo;</strong>&nbsp;- большего размера, слегка более вычурный.</p>\r\n<h1 class=\"display-1\">Display 1</h1>\r\n<h1 class=\"display-2\">Display 2</h1>\r\n<h1 class=\"display-3\">Display 3</h1>\r\n<h1 class=\"display-4\">Display 4</h1>\r\n<pre class=\"language-markup\"><code>&lt;h1 class=\"display-1\"&gt;Display 1&lt;/h1&gt;\r\n&lt;h1 class=\"display-2\"&gt;Display 2&lt;/h1&gt;\r\n&lt;h1 class=\"display-3\"&gt;Display 3&lt;/h1&gt;\r\n&lt;h1 class=\"display-4\"&gt;Display 4&lt;/h1&gt;</code></pre>\r\n<h2 id=\"lead\"><span class=\"bd-content-title\">Лид</span></h2>\r\n<p>Создайте выделяющийся, отличающийся от остальных параграф добавлением класса <code class=\"highlighter-rouge\">.lead</code>.</p>\r\n<p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>\r\n<pre class=\"language-markup\"><code>&lt;p class=\"lead\"&gt;\r\n  Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.\r\n&lt;/p&gt;</code></pre>\r\n<h2 id=\"blockquotes\"><span class=\"bd-content-title\">Цитаты</span></h2>\r\n<p>Для цитат с другого источника в вашей статье.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&nbsp; &nbsp;</p>\r\n</blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h3 id=\"naming-a-source\"><span class=\"bd-content-title\">Наименование источника</span></h3>\r\n<p>Добавьте&nbsp;<code class=\"highlighter-rouge\">&lt;footer class=\"blockquote-footer\"&gt;</code>&nbsp;для идентификации источника. Оберните имя источника в&nbsp;<code class=\"highlighter-rouge\">&lt;cite&gt;</code>.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n<footer class=\"blockquote-footer\">Кто-то знаменитый в <cite title=\"Название источника\">Source Title</cite></footer></blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n  &lt;footer class=\"blockquote-footer\"&gt;Кто-то знаменитый в &lt;cite title=\"Название источника\"&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h2 id=\"content\" class=\"bd-title\">Фигуры</h2>\r\n<p class=\"bd-lead\">Документация и примеры для отображения связанных изображений и текста с помощью компонента figure.</p>\r\n<div data-nosnippet=\"\">&nbsp;</div>\r\n<p>Когда вам понадобится отобразить часть контента &ndash; такого как изображение с определенной сопроводительной надписью &ndash; используйте <code class=\"highlighter-rouge\">&lt;figure&gt;</code>.</p>\r\n<p>Используйте классы&nbsp;<code class=\"highlighter-rouge\">.figure</code>&nbsp;,&nbsp;<code class=\"highlighter-rouge\">.figure-img</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">.figure-caption</code> для изменения некоторых базовых стилей в элементы HTML5 <code class=\"highlighter-rouge\">&lt;figure&gt;</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">&lt;figcaption&gt;</code>. Изображения в&nbsp;<code class=\"highlighter-rouge\">figure</code>&rsquo;s не имеют точного размера, так что убедитесь, что добавили в <code class=\"highlighter-rouge\">&lt;img&gt;</code>&nbsp;класс&nbsp;<code class=\"highlighter-rouge\">.img-fluid</code>&nbsp;для придания&nbsp;<code class=\"highlighter-rouge\">&lt;img&gt;</code> адаптивности.</p>\r\n<figure class=\"figure\"><img class=\"\" src=\"http://placehold.it/400x300\" alt=\"Figure\" />\r\n<figcaption class=\"figure-caption text-right\">A caption for the above image.</figcaption>\r\n</figure>\r\n<pre class=\"language-markup\"><code>&lt;figure class=\"figure\"&gt;\r\n  &lt;img src=\"...\" class=\"figure-img img-fluid rounded\" alt=\"...\"&gt;\r\n  &lt;figcaption class=\"figure-caption text-right\"&gt;A caption for the above image.&lt;/figcaption&gt;\r\n&lt;/figure&gt;</code></pre>\r\n<h2>Таблицы</h2>\r\n<p>Вот так таблицы, основанные на классе <code class=\"highlighter-rouge\">.table</code>, выглядят в базовой разметке таблиц.</p>\r\n<table class=\"table\">\r\n<thead>\r\n<tr>\r\n<th scope=\"col\">#</th>\r\n<th scope=\"col\">Имя</th>\r\n<th scope=\"col\">Фамилия</th>\r\n<th scope=\"col\">Username</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th scope=\"row\">1</th>\r\n<td>Mark</td>\r\n<td>Otto</td>\r\n<td>@mdo</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">2</th>\r\n<td>Jacob</td>\r\n<td>Thornton</td>\r\n<td>@fat</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">3</th>\r\n<td>Larry</td>\r\n<td>the Bird</td>\r\n<td>@twitter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<pre class=\"language-markup\"><code>&lt;table class=\"table\"&gt;\r\n  &lt;thead&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"col\"&gt;#&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Имя&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Фамилия&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Username&lt;/th&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/thead&gt;\r\n  &lt;tbody&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;1&lt;/th&gt;\r\n      &lt;td&gt;Mark&lt;/td&gt;\r\n      &lt;td&gt;Otto&lt;/td&gt;\r\n      &lt;td&gt;@mdo&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;2&lt;/th&gt;\r\n      &lt;td&gt;Jacob&lt;/td&gt;\r\n      &lt;td&gt;Thornton&lt;/td&gt;\r\n      &lt;td&gt;@fat&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;3&lt;/th&gt;\r\n      &lt;td&gt;Larry&lt;/td&gt;\r\n      &lt;td&gt;the Bird&lt;/td&gt;\r\n      &lt;td&gt;@twitter&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/tbody&gt;\r\n&lt;/table&gt;</code></pre>\r\n<h2>Изображения</h2>\r\n<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/workspacee_3.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p>Классы&nbsp;<strong>image_slider</strong>&nbsp;и<strong>&nbsp;image_gallery&nbsp;</strong>формируют карусель из загруженных друг за другом изображений. Главное различие между ними в том, что&nbsp;<strong>image_gallery</strong>&nbsp;формирует карусель из трех слайдов, в&nbsp;<strong>image_slider&nbsp;</strong>из одного.</p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/audio_cassette.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/gallery_5.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/xbox_360_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy_icon.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/nintendo_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>'),
(2, '', 4, 'Типографика', 'Типографика', 'Типографика', 'В блоге есть встроенные настройки содержания статьи. \r\n Как формируется содержание \r\n Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги  &lt;h2&gt; ,  &lt;h3&gt; ,', '<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>', '<p>В блоге есть встроенные настройки содержания статьи.</p>\r\n<h2>Как формируется содержание</h2>\r\n<p>Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code>.&nbsp;</p>\r\n<h2>Где выводится содержание</h2>\r\n<p>Это можно настроить. По умолчанию, оно выводится перед первым подзаголовком, как в этой статье. Но вы можете задать другой вывод &mdash; сразу в начале статьи, перед текстом.</p>\r\n<h2>Можно ли его отключить</h2>\r\n<p>Да, конечно.&nbsp;</p>\r\n<h3>Содержание древовидное</h3>\r\n<p>И опять да, древовидное. Вы просто указываете теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code> . Чем больше число в заголовке &mdash; тем более вложенный пункт получается.</p>\r\n<h3 id=\"tochno-drevovidnye\">Точно древовидные?</h3>\r\n<blockquote class=\"wp-block-quote is-style-info\">\r\n<p>Точно-точно! Это еще один заголовок третьего уровня, который будет отображаться как дочерний.</p>\r\n</blockquote>\r\n<h4>Заголовок h4</h4>\r\n<p>Встроенные настройки содержания статьи это очень удобно.</p>\r\n<h2 id=\"customizing-headings\"><span class=\"bd-content-title\">Настройка заголовков</span></h2>\r\n<p>Используйте имеющиеся общие классы для воссоздания маленького вторичного текста-подзаголовка&nbsp;</p>\r\n<h5>Заголовок отображения <small class=\"text-muted\">С выцветшим вторичным текстом</small></h5>\r\n<h2 id=\"display-headings\"><span class=\"bd-content-title\">Заголовок дисплея</span></h2>\r\n<p>Традиционные заголовки созданы для &laquo;работы&raquo; &laquo;в глубине&raquo; вашей страницы. Если вам необходимо выделить заголовок, используйте&nbsp;<strong>&laquo;заголовок дисплея&raquo;</strong>&nbsp;- большего размера, слегка более вычурный.</p>\r\n<h1 class=\"display-1\">Display 1</h1>\r\n<h1 class=\"display-2\">Display 2</h1>\r\n<h1 class=\"display-3\">Display 3</h1>\r\n<h1 class=\"display-4\">Display 4</h1>\r\n<pre class=\"language-markup\"><code>&lt;h1 class=\"display-1\"&gt;Display 1&lt;/h1&gt;\r\n&lt;h1 class=\"display-2\"&gt;Display 2&lt;/h1&gt;\r\n&lt;h1 class=\"display-3\"&gt;Display 3&lt;/h1&gt;\r\n&lt;h1 class=\"display-4\"&gt;Display 4&lt;/h1&gt;</code></pre>\r\n<h2 id=\"lead\"><span class=\"bd-content-title\">Лид</span></h2>\r\n<p>Создайте выделяющийся, отличающийся от остальных параграф добавлением класса <code class=\"highlighter-rouge\">.lead</code>.</p>\r\n<p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>\r\n<pre class=\"language-markup\"><code>&lt;p class=\"lead\"&gt;\r\n  Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.\r\n&lt;/p&gt;</code></pre>\r\n<h2 id=\"blockquotes\"><span class=\"bd-content-title\">Цитаты</span></h2>\r\n<p>Для цитат с другого источника в вашей статье.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&nbsp; &nbsp;</p>\r\n</blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h3 id=\"naming-a-source\"><span class=\"bd-content-title\">Наименование источника</span></h3>\r\n<p>Добавьте&nbsp;<code class=\"highlighter-rouge\">&lt;footer class=\"blockquote-footer\"&gt;</code>&nbsp;для идентификации источника. Оберните имя источника в&nbsp;<code class=\"highlighter-rouge\">&lt;cite&gt;</code>.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n<footer class=\"blockquote-footer\">Кто-то знаменитый в <cite title=\"Название источника\">Source Title</cite></footer></blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n  &lt;footer class=\"blockquote-footer\"&gt;Кто-то знаменитый в &lt;cite title=\"Название источника\"&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h2 id=\"content\" class=\"bd-title\">Фигуры</h2>\r\n<p class=\"bd-lead\">Документация и примеры для отображения связанных изображений и текста с помощью компонента figure.</p>\r\n<div data-nosnippet=\"\">&nbsp;</div>\r\n<p>Когда вам понадобится отобразить часть контента &ndash; такого как изображение с определенной сопроводительной надписью &ndash; используйте <code class=\"highlighter-rouge\">&lt;figure&gt;</code>.</p>\r\n<p>Используйте классы&nbsp;<code class=\"highlighter-rouge\">.figure</code>&nbsp;,&nbsp;<code class=\"highlighter-rouge\">.figure-img</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">.figure-caption</code> для изменения некоторых базовых стилей в элементы HTML5 <code class=\"highlighter-rouge\">&lt;figure&gt;</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">&lt;figcaption&gt;</code>. Изображения в&nbsp;<code class=\"highlighter-rouge\">figure</code>&rsquo;s не имеют точного размера, так что убедитесь, что добавили в <code class=\"highlighter-rouge\">&lt;img&gt;</code>&nbsp;класс&nbsp;<code class=\"highlighter-rouge\">.img-fluid</code>&nbsp;для придания&nbsp;<code class=\"highlighter-rouge\">&lt;img&gt;</code> адаптивности.</p>\r\n<figure class=\"figure\"><img class=\"\" src=\"http://placehold.it/400x300\" alt=\"Figure\" />\r\n<figcaption class=\"figure-caption text-right\">A caption for the above image.</figcaption>\r\n</figure>\r\n<pre class=\"language-markup\"><code>&lt;figure class=\"figure\"&gt;\r\n  &lt;img src=\"...\" class=\"figure-img img-fluid rounded\" alt=\"...\"&gt;\r\n  &lt;figcaption class=\"figure-caption text-right\"&gt;A caption for the above image.&lt;/figcaption&gt;\r\n&lt;/figure&gt;</code></pre>\r\n<h2>Таблицы</h2>\r\n<p>Вот так таблицы, основанные на классе <code class=\"highlighter-rouge\">.table</code>, выглядят в базовой разметке таблиц.</p>\r\n<table class=\"table\">\r\n<thead>\r\n<tr>\r\n<th scope=\"col\">#</th>\r\n<th scope=\"col\">Имя</th>\r\n<th scope=\"col\">Фамилия</th>\r\n<th scope=\"col\">Username</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th scope=\"row\">1</th>\r\n<td>Mark</td>\r\n<td>Otto</td>\r\n<td>@mdo</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">2</th>\r\n<td>Jacob</td>\r\n<td>Thornton</td>\r\n<td>@fat</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">3</th>\r\n<td>Larry</td>\r\n<td>the Bird</td>\r\n<td>@twitter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<pre class=\"language-markup\"><code>&lt;table class=\"table\"&gt;\r\n  &lt;thead&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"col\"&gt;#&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Имя&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Фамилия&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Username&lt;/th&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/thead&gt;\r\n  &lt;tbody&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;1&lt;/th&gt;\r\n      &lt;td&gt;Mark&lt;/td&gt;\r\n      &lt;td&gt;Otto&lt;/td&gt;\r\n      &lt;td&gt;@mdo&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;2&lt;/th&gt;\r\n      &lt;td&gt;Jacob&lt;/td&gt;\r\n      &lt;td&gt;Thornton&lt;/td&gt;\r\n      &lt;td&gt;@fat&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;3&lt;/th&gt;\r\n      &lt;td&gt;Larry&lt;/td&gt;\r\n      &lt;td&gt;the Bird&lt;/td&gt;\r\n      &lt;td&gt;@twitter&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/tbody&gt;\r\n&lt;/table&gt;</code></pre>\r\n<h2>Изображения</h2>\r\n<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/workspacee_3.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p>Классы&nbsp;<strong>image_slider</strong>&nbsp;и<strong>&nbsp;image_gallery&nbsp;</strong>формируют карусель из загруженных друг за другом изображений. Главное различие между ними в том, что&nbsp;<strong>image_gallery</strong>&nbsp;формирует карусель из трех слайдов, в&nbsp;<strong>image_slider&nbsp;</strong>из одного.</p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/audio_cassette.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/gallery_5.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/xbox_360_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy_icon.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/nintendo_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>'),
(3, '', 4, 'Типографика', 'Типографика', 'Типографика', 'В блоге есть встроенные настройки содержания статьи. \r\n Как формируется содержание \r\n Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги  &lt;h2&gt; ,  &lt;h3&gt; ,', '<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>', '<p>В блоге есть встроенные настройки содержания статьи.</p>\r\n<h2>Как формируется содержание</h2>\r\n<p>Чтобы на странице мы увидели содержание, нам необходимо создать несколько заголовков в контенте. Минимум 3 подзаголовка. Сюда включаются теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code>.&nbsp;</p>\r\n<h2>Где выводится содержание</h2>\r\n<p>Это можно настроить. По умолчанию, оно выводится перед первым подзаголовком, как в этой статье. Но вы можете задать другой вывод &mdash; сразу в начале статьи, перед текстом.</p>\r\n<h2>Можно ли его отключить</h2>\r\n<p>Да, конечно.&nbsp;</p>\r\n<h3>Содержание древовидное</h3>\r\n<p>И опять да, древовидное. Вы просто указываете теги <code>&lt;h2&gt;</code>, <code>&lt;h3&gt;</code>, <code>&lt;h4&gt;</code> . Чем больше число в заголовке &mdash; тем более вложенный пункт получается.</p>\r\n<h3 id=\"tochno-drevovidnye\">Точно древовидные?</h3>\r\n<blockquote class=\"wp-block-quote is-style-info\">\r\n<p>Точно-точно! Это еще один заголовок третьего уровня, который будет отображаться как дочерний.</p>\r\n</blockquote>\r\n<h4>Заголовок h4</h4>\r\n<p>Встроенные настройки содержания статьи это очень удобно.</p>\r\n<h2 id=\"customizing-headings\"><span class=\"bd-content-title\">Настройка заголовков</span></h2>\r\n<p>Используйте имеющиеся общие классы для воссоздания маленького вторичного текста-подзаголовка&nbsp;</p>\r\n<h5>Заголовок отображения <small class=\"text-muted\">С выцветшим вторичным текстом</small></h5>\r\n<h2 id=\"display-headings\"><span class=\"bd-content-title\">Заголовок дисплея</span></h2>\r\n<p>Традиционные заголовки созданы для &laquo;работы&raquo; &laquo;в глубине&raquo; вашей страницы. Если вам необходимо выделить заголовок, используйте&nbsp;<strong>&laquo;заголовок дисплея&raquo;</strong>&nbsp;- большего размера, слегка более вычурный.</p>\r\n<h1 class=\"display-1\">Display 1</h1>\r\n<h1 class=\"display-2\">Display 2</h1>\r\n<h1 class=\"display-3\">Display 3</h1>\r\n<h1 class=\"display-4\">Display 4</h1>\r\n<pre class=\"language-markup\"><code>&lt;h1 class=\"display-1\"&gt;Display 1&lt;/h1&gt;\r\n&lt;h1 class=\"display-2\"&gt;Display 2&lt;/h1&gt;\r\n&lt;h1 class=\"display-3\"&gt;Display 3&lt;/h1&gt;\r\n&lt;h1 class=\"display-4\"&gt;Display 4&lt;/h1&gt;</code></pre>\r\n<h2 id=\"lead\"><span class=\"bd-content-title\">Лид</span></h2>\r\n<p>Создайте выделяющийся, отличающийся от остальных параграф добавлением класса <code class=\"highlighter-rouge\">.lead</code>.</p>\r\n<p class=\"lead\">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>\r\n<pre class=\"language-markup\"><code>&lt;p class=\"lead\"&gt;\r\n  Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.\r\n&lt;/p&gt;</code></pre>\r\n<h2 id=\"blockquotes\"><span class=\"bd-content-title\">Цитаты</span></h2>\r\n<p>Для цитат с другого источника в вашей статье.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&nbsp; &nbsp;</p>\r\n</blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h3 id=\"naming-a-source\"><span class=\"bd-content-title\">Наименование источника</span></h3>\r\n<p>Добавьте&nbsp;<code class=\"highlighter-rouge\">&lt;footer class=\"blockquote-footer\"&gt;</code>&nbsp;для идентификации источника. Оберните имя источника в&nbsp;<code class=\"highlighter-rouge\">&lt;cite&gt;</code>.</p>\r\n<blockquote class=\"blockquote\">\r\n<p class=\"mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n<footer class=\"blockquote-footer\">Кто-то знаменитый в <cite title=\"Название источника\">Source Title</cite></footer></blockquote>\r\n<pre class=\"language-markup\"><code>&lt;blockquote class=\"blockquote\"&gt;\r\n  &lt;p class=\"mb-0\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n  &lt;footer class=\"blockquote-footer\"&gt;Кто-то знаменитый в &lt;cite title=\"Название источника\"&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;\r\n&lt;/blockquote&gt;</code></pre>\r\n<h2 id=\"content\" class=\"bd-title\">Фигуры</h2>\r\n<p class=\"bd-lead\">Документация и примеры для отображения связанных изображений и текста с помощью компонента figure.</p>\r\n<div data-nosnippet=\"\">&nbsp;</div>\r\n<p>Когда вам понадобится отобразить часть контента &ndash; такого как изображение с определенной сопроводительной надписью &ndash; используйте <code class=\"highlighter-rouge\">&lt;figure&gt;</code>.</p>\r\n<p>Используйте классы&nbsp;<code class=\"highlighter-rouge\">.figure</code>&nbsp;,&nbsp;<code class=\"highlighter-rouge\">.figure-img</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">.figure-caption</code> для изменения некоторых базовых стилей в элементы HTML5 <code class=\"highlighter-rouge\">&lt;figure&gt;</code>&nbsp;и&nbsp;<code class=\"highlighter-rouge\">&lt;figcaption&gt;</code>. Изображения в&nbsp;<code class=\"highlighter-rouge\">figure</code>&rsquo;s не имеют точного размера, так что убедитесь, что добавили в <code class=\"highlighter-rouge\">&lt;img&gt;</code>&nbsp;класс&nbsp;<code class=\"highlighter-rouge\">.img-fluid</code>&nbsp;для придания&nbsp;<code class=\"highlighter-rouge\">&lt;img&gt;</code> адаптивности.</p>\r\n<figure class=\"figure\"><img class=\"\" src=\"http://placehold.it/400x300\" alt=\"Figure\" />\r\n<figcaption class=\"figure-caption text-right\">A caption for the above image.</figcaption>\r\n</figure>\r\n<pre class=\"language-markup\"><code>&lt;figure class=\"figure\"&gt;\r\n  &lt;img src=\"...\" class=\"figure-img img-fluid rounded\" alt=\"...\"&gt;\r\n  &lt;figcaption class=\"figure-caption text-right\"&gt;A caption for the above image.&lt;/figcaption&gt;\r\n&lt;/figure&gt;</code></pre>\r\n<h2>Таблицы</h2>\r\n<p>Вот так таблицы, основанные на классе <code class=\"highlighter-rouge\">.table</code>, выглядят в базовой разметке таблиц.</p>\r\n<table class=\"table\">\r\n<thead>\r\n<tr>\r\n<th scope=\"col\">#</th>\r\n<th scope=\"col\">Имя</th>\r\n<th scope=\"col\">Фамилия</th>\r\n<th scope=\"col\">Username</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th scope=\"row\">1</th>\r\n<td>Mark</td>\r\n<td>Otto</td>\r\n<td>@mdo</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">2</th>\r\n<td>Jacob</td>\r\n<td>Thornton</td>\r\n<td>@fat</td>\r\n</tr>\r\n<tr>\r\n<th scope=\"row\">3</th>\r\n<td>Larry</td>\r\n<td>the Bird</td>\r\n<td>@twitter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<pre class=\"language-markup\"><code>&lt;table class=\"table\"&gt;\r\n  &lt;thead&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"col\"&gt;#&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Имя&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Фамилия&lt;/th&gt;\r\n      &lt;th scope=\"col\"&gt;Username&lt;/th&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/thead&gt;\r\n  &lt;tbody&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;1&lt;/th&gt;\r\n      &lt;td&gt;Mark&lt;/td&gt;\r\n      &lt;td&gt;Otto&lt;/td&gt;\r\n      &lt;td&gt;@mdo&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;2&lt;/th&gt;\r\n      &lt;td&gt;Jacob&lt;/td&gt;\r\n      &lt;td&gt;Thornton&lt;/td&gt;\r\n      &lt;td&gt;@fat&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n    &lt;tr&gt;\r\n      &lt;th scope=\"row\"&gt;3&lt;/th&gt;\r\n      &lt;td&gt;Larry&lt;/td&gt;\r\n      &lt;td&gt;the Bird&lt;/td&gt;\r\n      &lt;td&gt;@twitter&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/tbody&gt;\r\n&lt;/table&gt;</code></pre>\r\n<h2>Изображения</h2>\r\n<p>В текстовом редакторе для изображений, добавлены несколько классов для их оформления. Если изображению добавить класс&nbsp;<strong>image_zoom</strong>, то по клику на него, откроется модальное окно с увеличенной версией этого изображения.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/workspacee_3.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p>Классы&nbsp;<strong>image_slider</strong>&nbsp;и<strong>&nbsp;image_gallery&nbsp;</strong>формируют карусель из загруженных друг за другом изображений. Главное различие между ними в том, что&nbsp;<strong>image_gallery</strong>&nbsp;формирует карусель из трех слайдов, в&nbsp;<strong>image_slider&nbsp;</strong>из одного.</p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/audio_cassette.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_slider img-fluid\" src=\"../files/uploads/gallery_5.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/xbox_360_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy_icon.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/gameboy.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>\r\n<p><img class=\"fn_img_gallery img-fluid\" src=\"../files/uploads/nintendo_controller.jpg\" alt=\"\" width=\"800\" height=\"600\" /></p>');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_brands`
--

DROP TABLE IF EXISTS `t_lang_brands`;
CREATE TABLE `t_lang_brands` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_brands`
--

INSERT INTO `t_lang_brands` (`lang_id`, `lang_label`, `brand_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, '', 1, 'Apple', 'Apple', 'Apple', 'Apple', ''),
(2, '', 1, 'Apple', 'Apple', 'Apple', 'Apple', ''),
(3, '', 1, 'Apple', 'Apple', 'Apple', 'Apple', ''),
(1, '', 2, 'Samsung', 'Samsung', 'Samsung', 'Samsung', ''),
(2, '', 2, 'Samsung', 'Samsung', 'Samsung', 'Samsung', ''),
(3, '', 2, 'Samsung', 'Samsung', 'Samsung', 'Samsung', ''),
(1, '', 3, 'DJI', 'DJI', 'DJI', 'DJI', ''),
(2, '', 3, 'DJI', 'DJI', 'DJI', 'DJI', ''),
(3, '', 3, 'DJI', 'DJI', 'DJI', 'DJI', ''),
(1, '', 4, 'Havit', 'Havit', 'Havit', 'Havit', ''),
(2, '', 4, 'Havit', 'Havit', 'Havit', 'Havit', ''),
(3, '', 4, 'Havit', 'Havit', 'Havit', 'Havit', ''),
(1, '', 5, 'JBL', 'JBL', 'JBL', 'JBL', ''),
(2, '', 5, 'JBL', 'JBL', 'JBL', 'JBL', ''),
(3, '', 5, 'JBL', 'JBL', 'JBL', 'JBL', ''),
(1, '', 6, 'Motorola', 'Motorola', 'Motorola', 'Motorola', ''),
(2, '', 6, 'Motorola', 'Motorola', 'Motorola', 'Motorola', ''),
(3, '', 6, 'Motorola', 'Motorola', 'Motorola', 'Motorola', ''),
(1, '', 7, 'Nokia', 'Nokia', 'Nokia', 'Nokia', ''),
(2, '', 7, 'Nokia', 'Nokia', 'Nokia', 'Nokia', ''),
(3, '', 7, 'Nokia', 'Nokia', 'Nokia', 'Nokia', ''),
(1, '', 8, '1More', '1More', '1More', '1More', ''),
(2, '', 8, '1More', '1More', '1More', '1More', ''),
(3, '', 8, '1More', '1More', '1More', '1More', '');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_categories`
--

DROP TABLE IF EXISTS `t_lang_categories`;
CREATE TABLE `t_lang_categories` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_h1` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_categories`
--

INSERT INTO `t_lang_categories` (`lang_id`, `lang_label`, `category_id`, `name`, `name_h1`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, '', 1, 'Планшеты', '', 'Планшеты', 'Планшеты', 'Планшеты', ''),
(1, '', 2, 'Гаджеты', '', 'Гаджеты', 'Гаджеты', 'Гаджеты', ''),
(1, '', 3, 'Квадрокоптеры', '', 'Квадрокоптеры', 'Квадрокоптеры', 'Квадрокоптеры', ''),
(1, '', 4, 'Аксессуары', '', 'Аксессуары', 'Аксессуары', 'Аксессуары', ''),
(1, '', 5, 'Портативная акустика', '', 'Портативная акустика', 'Портативная акустика', 'Портативная акустика', ''),
(1, '', 6, 'Часы', '', 'Часы', 'Часы', 'Часы', ''),
(1, '', 7, 'Смартфоны', '', 'Смартфоны', 'Смартфоны', 'Смартфон – универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов.', '<p><strong>Смартфон</strong> &ndash; универсальное устройство, предназначенное для общения, работы и развлечений. В отличие от обычного кнопочного телефона, у него есть сенсорный экран, открывающий широкие возможности для веб-серфинга, игр, просмотра фильмов. Как выбрать смартфон? Каталог смартфонов чрезвычайно широк, и разобраться в этом многообразии нелегко. Первое, с чего стоит начать, &ndash; операционная система. Вы можете приобрести: <a href=\"catalog/smartfony/operatingsystem-android\">смартфоны Android&nbsp;</a>&ndash; наиболее распространенные; <a href=\"catalog/smartfony/operatingsystem-ios\">смартфоны iOS</a> &ndash; их ценят за надежность и высокую скорость работы; Другие важные критерии &ndash; размер и разрешение экрана, тип процессора, возможности камеры. &laquo;Turbo Shop&raquo; &ndash; интернет-магазин смартфонов, в котором представлено множество моделей от ведущих производителей. Здесь вы можете купить как дешевые смартфоны, так и устройства среднего класса и топовые модели с доставкой по Москве и другим регионам РФ.</p>'),
(2, 'en', 1, 'Tablets', '', 'Tablets', 'Tablets', 'Tablets', ''),
(2, 'en', 2, 'Gadgets', '', 'Gadgets', 'Gadgets', 'Gadgets', ''),
(2, 'en', 3, 'Quadcopters', '', 'Quadcopters', 'Quadcopters', 'Quadcopters', ''),
(2, 'en', 4, 'Accessories', '', 'Accessories', 'Accessories', 'Accessories', ''),
(2, 'en', 5, 'Portable acoustics', '', 'Portable acoustics', 'Portable acoustics', 'Portable acoustics', ''),
(2, 'en', 6, 'Clock', '', 'Clock', 'Clock', 'Clock', ''),
(2, 'en', 7, 'Smartphones', '', 'Smartphones', 'Smartphones', 'A smartphone is a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies.', '<p><strong> Smartphone </strong>- a versatile device designed for communication, work and entertainment. Unlike a conventional push-button telephone, it has a touch screen that opens up wide possibilities for surfing the web, playing games, watching movies. How to choose a smartphone? The catalog of smartphones is extremely wide, and it is not easy to understand this variety. The first thing to start with is operating system. You can purchase: <a href=\"en/catalog/smartfony/operatingsystem-android\"> Android smartphones </a> the most common;<a href=\"en/catalog/smartfony/operatingsystem-ios\"> iOS smartphones </a> they are appreciated for their reliability and high speed of work; Other important criteria ; screen size and resolution, processor type, camera capabilities. \'Turbo Shop\' an online smartphone store, which features many models from leading manufacturers. Here you can buy cheap smartphones as well as mid-range devices and top models with delivery in New York and other regions of the USA.</p>'),
(3, 'ua', 1, 'Планшети', '', 'Планшети', 'Планшети', 'Планшети', ''),
(3, 'ua', 2, 'Гаджети', '', 'Гаджети', 'Гаджети', 'Гаджети', ''),
(3, 'ua', 3, 'Квадрокоптери', '', 'Квадрокоптери', 'Квадрокоптери', 'Квадрокоптери', ''),
(3, 'ua', 4, 'Аксесуари', '', 'Аксесуари', 'Аксесуари', 'Аксесуари', ''),
(3, 'ua', 5, 'Портативна акустика', '', 'Портативна акустика', 'Портативна акустика', 'Портативна акустика', ''),
(3, 'ua', 6, 'Годинники', '', 'Годинники', 'Годинники', 'Годинники', ''),
(3, 'ua', 7, 'Смартфони', '', 'Смартфони', 'Смартфони', 'Смартфон - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. ', '<p><strong>Смартфон</strong> - універсальний пристрій, призначене для спілкування, роботи і розваг. На відміну від звичайного кнопкового телефону, у нього є сенсорний екран, що відкриває широкі можливості для веб-серфінгу, ігор, перегляду фільмів. Як вибрати смартфон? Каталог смартфонів надзвичайно широкий, і розібратися в цьому різноманітті нелегко. Перше, з чого варто почати, - операційна система. Ви можете придбати: &bull; смартфони Android - найбільш поширені; &bull; смартфони iOS - їх цінують за надійність і високу швидкість роботи; Інші важливі критерії - розмір і дозвіл екрана, тип процесора, можливості камери. &laquo;Turbo Shop&raquo; - інтернет-магазин смартфонів, в якому представлено безліч моделей від провідних виробників. Тут ви можете купити як дешеві смартфони, так і пристрої середнього класу і топові моделі з доставкою по Києву та іншим регіонам України.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_currencies`
--

DROP TABLE IF EXISTS `t_lang_currencies`;
CREATE TABLE `t_lang_currencies` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sign` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_currencies`
--

INSERT INTO `t_lang_currencies` (`lang_id`, `lang_label`, `currency_id`, `name`, `sign`) VALUES
(1, '', 1, 'доллары', '$'),
(2, '', 1, ' dollars', '$'),
(3, '', 1, 'доллари', '$'),
(1, '', 2, 'гривны', 'грн'),
(2, '', 2, 'hryvnia', 'грн'),
(3, '', 2, 'гривні', 'грн'),
(1, '', 3, 'рубли', 'руб'),
(2, '', 3, ' rubles', 'руб'),
(3, '', 3, 'рублі', 'руб');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_delivery`
--

DROP TABLE IF EXISTS `t_lang_delivery`;
CREATE TABLE `t_lang_delivery` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_delivery`
--

INSERT INTO `t_lang_delivery` (`lang_id`, `lang_label`, `delivery_id`, `name`, `description`) VALUES
(1, '', 1, 'Курьерская доставка по городу', '<p>Курьерская доставка осуществляется службой компаний-перевозчиков города. Ваш заказ будет отправлен на следующий день после заказа. Доставка занимает от 1 до 3 дней.</p>'),
(2, '', 1, 'Courier delivery in the city', '<p>Courier delivery is carried out by the service of the carrier companies of the city. Your order will be shipped the day after the order. Delivery takes from 1 to 3 days.</p>'),
(1, '', 2, 'Самовывоз', '<p>Удобный, бесплатный и быстрый способ получения заказа.</p>\r\n<p>Адрес офиса: Москва, шоссе Энтузиастов 45/31, офис 453</p>'),
(3, '', 1, 'Кур\'єрська доставка по місту', '<p>Кур\'єрська доставка здійснюється службою компаній-перевізників міста. Ваше замовлення буде відправлений на наступний день після замовлення. Доставка займає від 1 до 3 днів.</p>'),
(2, '', 2, 'Pickup', '<p>Convenient, free and fast way to receive an order.</p>\r\n<p>Office address: 41 West 40th Street New York, NY</p>'),
(3, '', 2, 'Самовивіз', '<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення.</p>\r\n<p>Місцезнаходження компанії: Київ, вул. Глибочицька, 32б</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_features`
--

DROP TABLE IF EXISTS `t_lang_features`;
CREATE TABLE `t_lang_features` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_features`
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
-- Структура таблицы `t_lang_files`
--

DROP TABLE IF EXISTS `t_lang_files`;
CREATE TABLE `t_lang_files` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `file_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_files`
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
-- Структура таблицы `t_lang_pages`
--

DROP TABLE IF EXISTS `t_lang_pages`;
CREATE TABLE `t_lang_pages` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `header` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_pages`
--

INSERT INTO `t_lang_pages` (`lang_id`, `lang_label`, `page_id`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `header`) VALUES
(1, '', 1, 'Главная', 'Главная', 'Этот магазин является демонстрацией скрипта интернет-магазина  Turbo . Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.', 'Главная', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href=\"https://turbo-cms.com/\">Turbo</a>. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.</p>', 'Главная'),
(2, '', 1, 'Home', 'Home', 'This store is a demonstration of the script for the online store   Turbo  . All materials on this site are for demonstration purposes only.', 'Home', '<p>This store is a demonstration of the script for the online store <a href=\"https://turbo-cms.com/\"> Turbo </a>. All materials on this site are for demonstration purposes only.</p>', 'Home'),
(3, '', 1, 'Головна', 'Головна', 'Цей магазин є демонстрацією скрипта інтернет-магазину   Turbo  . Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.', 'Головна', '<p>Цей магазин є демонстрацією скрипта інтернет-магазину <a href=\"https://turbo-cms.com/\"> Turbo </a>. Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.</p>', 'Головна'),
(1, '', 2, 'Все товары', 'Все товары', '', 'Все товары', '', 'Все товары'),
(2, '', 2, 'All products', 'All products', '', 'All products', '', 'All products'),
(3, '', 2, 'Всі товари', 'Всі товари', '', 'Всі товари', '', 'Всі товари'),
(1, '', 3, '404', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(2, '', 3, '404', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(3, '', 3, '404', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(1, '', 4, 'Карта сайта', 'Карта сайта', 'Карта сайта', 'Карта сайта', '', 'Карта сайта'),
(2, '', 4, 'Sitemap', 'Sitemap', 'Карта сайта', 'Sitemap', '', 'Sitemap'),
(3, '', 4, 'Карта сайту', 'Карта сайту', 'Карта сайта', 'Карта сайту', '', 'Карта сайту'),
(1, '', 5, 'Новинки', 'Новинки', '', 'Новинки', '', 'Новинки'),
(2, '', 5, 'New', 'New', '', 'New', '', 'New'),
(3, '', 5, 'Новинки', 'Новинки', '', 'Новинки', '', 'Новинки'),
(1, '', 6, 'Рекомендуемые', 'Рекомендуемые', '', 'Рекомендуемые', '', 'Рекомендуемые'),
(2, '', 6, 'Featured', 'Featured', '', 'Featured', '', 'Featured'),
(3, '', 6, 'Рекомендовані', 'Рекомендовані', '', 'Рекомендовані', '', 'Рекомендовані'),
(1, '', 7, 'Распродажа', 'Распродажа', '', 'Распродажа', '', 'Распродажа'),
(2, '', 7, 'Sale', 'Sale', '', 'Sale', '', 'Sale'),
(3, '', 7, 'Розпродаж', 'Розпродаж', '', 'Розпродаж', '', 'Розпродаж'),
(1, '', 8, 'Хиты', 'Хиты', '', 'Хиты', '', 'Хиты'),
(2, '', 8, 'Hit', 'Hit', '', 'Hit', '', 'Hit'),
(3, '', 8, 'Хіти', 'Хіти', '', 'Хіти', '', 'Хіти'),
(1, '', 9, 'Избранное', 'Избранное', '', 'Избранное', '', 'Избранное'),
(2, '', 9, 'Wishlist', 'Wishlist', '', 'Wishlist', '', 'Wishlist'),
(3, '', 9, 'Обране', 'Обране', '', 'Обране', '', 'Обране'),
(1, '', 10, 'Сравнение', 'Сравнение', '', 'Сравнение', '', 'Сравнение'),
(2, '', 10, 'Compare', 'Compare', '', 'Compare', '', 'Compare'),
(3, '', 10, 'Порівняння', 'Порівняння', '', 'Порівняння', '', 'Порівняння'),
(1, '', 11, 'Оплата', 'Оплата', 'Наличными курьеру \r\n Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа. \r\n Яндекс.Деньги \r\n Яндекс.Деньги &mdash; доступный и безопасный способ платить за товары и услуги через интернет. \r\n Банковская карта \r\n Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги. \r\n Через терминал \r\n Оплатите наличными через многочисленные терминалы в любом городе России. Можно запл', 'Оплата', '<h2>Наличными курьеру</h2>\r\n<p>Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p>\r\n<h2>Яндекс.Деньги</h2>\r\n<p>Яндекс.Деньги&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет.</p>\r\n<h2>Банковская карта</h2>\r\n<p>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</p>\r\n<h2>Через терминал</h2>\r\n<p>Оплатите наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</p>\r\n<h2>Со счета мобильного телефона</h2>\r\n<p>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</p>\r\n<h2>Webmoney</h2>\r\n<p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p>\r\n<h2>Квитанция</h2>\r\n<p>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</p>\r\n<h2>Робокасса</h2>\r\n<p>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</p>\r\n<h2>PayPal</h2>\r\n<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>\r\n<h2>Оплата через Интеркассу</h2>\r\n<p>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</p>\r\n<h2>Оплата картой через Liqpay.com</h2>\r\n<p>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</p>\r\n<h2>Оплата через Pay2Pay</h2>\r\n<p>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</p>\r\n<h2>Оплатить через QIWI</h2>\r\n<p>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</p>\r\n<h2>Наличными в офисе Автолюкса</h2>\r\n<p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 'Оплата'),
(2, '', 11, 'Payment', 'Payment', 'Cash \r\nYou can pay the courier directly in rubles at the time of delivery. The Express delivery within New York next day after order acceptance. \r\nPayPal \r\nMake purchases safely, without disclosing information about your credit card. PayPal will protect you if problems occur with purchase.', 'Payment', '<h2>Cash</h2>\r\n<p>You can pay the courier directly in rubles at the time of delivery. The Express delivery within New York next day after order acceptance.</p>\r\n<h2>PayPal</h2>\r\n<p>Make purchases&nbsp;safely,&nbsp;without disclosing information&nbsp;about your credit card.&nbsp;PayPal&nbsp;will protect&nbsp;you if&nbsp;problems occur&nbsp;with purchase.</p>', 'Payment'),
(3, '', 11, 'Оплата', 'Оплата', 'Готівкою кур\'єру \r\n Ви можете оплатити замовлення кур\'єру в гривнях безпосередньо в момент доставки. Кур\'єрська доставка здійснюється по Києву на наступний день після прийняття замовлення. \r\n Банківська картка \r\n Оплата банківською картою Visa або MasterCard. \r\n Робокасса \r\n ROBOKASSA - сервіс для організації прийому платежів на сайті, інтернет магазині і соціальних мережах. Прийом платежів здійснюється при мінімальних комісіях. \r\n PayPal \r\n Робіть покупки безпечно, без розкриття інформації про ', 'Оплата', '<h2>Готівкою кур\'єру</h2>\r\n<p>Ви можете оплатити замовлення кур\'єру в гривнях безпосередньо в момент доставки. Кур\'єрська доставка здійснюється по Києву на наступний день після прийняття замовлення.</p>\r\n<h2>Банківська картка</h2>\r\n<p>Оплата банківською картою Visa або MasterCard.</p>\r\n<h2>Робокасса</h2>\r\n<p>ROBOKASSA - сервіс для організації прийому платежів на сайті, інтернет магазині і соціальних мережах. Прийом платежів здійснюється при мінімальних комісіях.</p>\r\n<h2>PayPal</h2>\r\n<p>Робіть покупки безпечно, без розкриття інформації про свою кредитну картку. PayPal захистить вас, якщо виникнуть проблеми з покупкою.</p>\r\n<h2>Оплата через Інтеркаса</h2>\r\n<p>Це зручний у використанні сервіс, підключення до якого дозволить Інтернет-магазинам, веб-сайтам та іншим торговим майданчикам приймати всі можливі форми оплати в максимально короткі терміни.</p>\r\n<h2>Оплата карткою через Liqpay</h2>\r\n<p>Завдяки своїй відкритості та універсальності LiqPAY стрімко інтегрується з багатьма платіжними системами і платформами і стає стандартом платіжних операцій.</p>\r\n<h2>Оплата через Pay2Pay</h2>\r\n<p>Універсальний платіжний сервіс Pay2Pay покликаний полегшити і максимально спростити процес прийому електронних платежів на Вашому сайті. Ми відкриті для всього нового і надсучасного.</p>\r\n<h2>Готівкою в офісі Нова Пошта</h2>\r\n<p>При доставці замовлення системою Нова Пошта, ви зможете оплатити замовлення в їхньому офісі безпосередньо в момент отримання товарів.</p>', 'Оплата'),
(1, '', 12, 'Доставка', 'Доставка', 'Курьерская доставка по Москве \r\nКурьерская доставка осуществляется на следующий день после оформления заказа, если товар есть в наличии. Курьерская доставка осуществляется в пределах Томска и Северска ежедневно с 10.00 до 21.00. Заказ на сумму свыше 300 рублей доставляется бесплатно.  Стоимость бесплатной доставки раcсчитывается от суммы заказа с учтенной скидкой. В случае если сумма заказа после применения скидки менее 300р, осуществляется платная доставка.  При сумме заказа менее 300 рублей ст', 'Доставка', '<h2>Курьерская доставка по&nbsp;Москве</h2>\r\n<p>Курьерская доставка осуществляется на следующий день после оформления заказа,&nbsp;если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно.<br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р,&nbsp;осуществляется платная доставка.<br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p>\r\n<h2>Самовывоз</h2>\r\n<p>Удобный,&nbsp;бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва,&nbsp;ул. Арбат,&nbsp;1/3,&nbsp;офис 419.</p>\r\n<h2>Доставка с&nbsp;помощью предприятия&nbsp;&laquo;Автотрейдинг&raquo;</h2>\r\n<p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис&nbsp;&laquo;Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации&nbsp;(сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза,&nbsp;иначе компания&nbsp;&laquo;Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p>\r\n<h2>Наложенным платежом</h2>\r\n<p>При доставке заказа наложенным платежом с помощью&nbsp;&laquo;Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 'Доставка'),
(2, '', 12, 'Delivery', 'Delivery', 'Shipping within New York \r\nCourier delivery is made the next day after ordering, if the item is in stock. Courier delivery is made within the New York daily from 10.00 to 21.00. For orders more than $300 delivered free of charge.  Cost free delivery is calculated from the total order with the discount taken into account. If the order amount after applying the discount less than $300, is a paid service. \r\n For orders less than $300, the delivery cost is $50. \r\n Store pickup \r\n Convenient, free an', 'Delivery', '<h2>Shipping within New York</h2>\r\n<p>Courier delivery is made&nbsp;the next day&nbsp;after ordering,&nbsp;if the item is in stock.&nbsp;Courier delivery is made&nbsp;within the New York&nbsp;daily from&nbsp;10.00 to&nbsp;21.00.&nbsp;For orders&nbsp;more than $300 delivered free of charge.<br /><br />Cost&nbsp;free delivery is calculated&nbsp;from&nbsp;the total order&nbsp;with&nbsp;the discount&nbsp;taken into account.&nbsp;If the order amount&nbsp;after applying the discount&nbsp;less than $300,&nbsp;is&nbsp;a paid service.</p>\r\n<p>For orders&nbsp;less than $300,&nbsp;the&nbsp;delivery&nbsp;cost is $50.</p>\r\n<h2>Store pickup</h2>\r\n<p>Convenient, free&nbsp;and&nbsp;fast way of receiving your order.</p>\r\n<p>Office address:&nbsp;41 West 40th Street New York, NY</p>\r\n<h2>C.O.D (Cash On Delivery)</h2>\r\n<p>On delivery order cash on delivery through \"mail of USA\", you will be able to pay for the order at the time goods are received.</p>', 'Delivery'),
(3, '', 12, 'Доставка', 'Доставка', 'Кур\'єрська доставка по Києву \r\nКур\'єрська доставка здійснюється на наступний день після оформлення замовлення, якщо товар є в наявності. Кур\'єрська доставка здійснюється в межах Києва; щодня з 10.00 до 21.00. Замовлення на суму понад 300 грн доставляється безкоштовно. Вартість безкоштовної доставки Розраховувати від суми замовлення з врахованої знижкою. У разі якщо сума замовлення після застосування знижки менш 300 грн, здійснюється платна доставка. При сумі замовлення менше 300 грн вартість дос', 'Доставка', '<h2>Кур\'єрська доставка по Києву</h2>\r\n<p>Кур\'єрська доставка здійснюється на наступний день після оформлення замовлення, якщо товар є в наявності. Кур\'єрська доставка здійснюється в межах Києва; щодня з 10.00 до 21.00. Замовлення на суму понад 300 грн доставляється безкоштовно. Вартість безкоштовної доставки Розраховувати від суми замовлення з врахованої знижкою. У разі якщо сума замовлення після застосування знижки менш 300 грн, здійснюється платна доставка. При сумі замовлення менше 300 грн вартість доставки складає від 50 грн.</p>\r\n<h2>Самовивіз</h2>\r\n<p>Зручний, безкоштовний і швидкий спосіб отримання замовлення. Місцезнаходження компанії: Київ, вул. Глибочицька, 32б.</p>\r\n<h2>Доставка за допомогою підприємства &laquo;Нова Пошта&raquo;</h2>\r\n<p>Зручний і швидкий спосіб доставки у великі міста України. Посилка доставляється в офіс &laquo;Нова пошта&raquo; у Вашому місті. Для отримання необхідно пред\'явити паспорт і номер вантажної декларації (повідомить наш менеджер після відправки). Посилку бажано отримати протягом 24 годин з моменту приходу вантажу, інакше компанія &laquo;Нова Пошта&raquo; може стягнути з Вас додаткову оплату за зберігання. Термін доставки і вартість Ви можете розрахувати на сайті компанії.</p>\r\n<h2>Післяплата</h2>\r\n<p>При доставці замовлення післяплатою за допомогою &laquo;Нова Пошта&raquo;, ви зможете оплатити замовлення безпосередньо в момент отримання товарів.</p>', 'Доставка'),
(1, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(2, '', 13, 'Blog', 'Blog', '', 'Blog', '', 'Blog'),
(3, '', 13, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(1, '', 14, 'Контакты', 'Контакты', 'Москва, шоссе Энтузиастов 45/31, офис 453 \r\nТелефон: (123) 456-78-90', 'Контакты', '<p>Москва, шоссе Энтузиастов 45/31, офис 453</p>\r\n<p>Телефон: (123) 456-78-90</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2244.995568814811!2d37.748330116259496!3d55.758579180554854!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x414acaad7a99045d%3A0xbcd5235cf8b0f3b3!2z0YguINCt0L3RgtGD0LfQuNCw0YHRgtC-0LIsIDQ1LzMxLCA0NTMsINCc0L7RgdC60LLQsCwg0KDQvtGB0YHQuNGPLCAxMTExMjM!5e0!3m2!1sru!2sua!4v1609513338246!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Контакты'),
(2, '', 14, 'Contacts', 'Contacts', '41 West 40th Street New York, NY \r\nPhone: (210) 876-5432', 'Contacts', '<p>41 West 40th Street New York, NY</p>\r\n<p>Phone: (210) 876-5432</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4399.518506840664!2d-73.97964170435294!3d40.75394620817656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259aa94a61b4f%3A0x8ebce7fe1262c134!2zNDEgVyA0MHRoIFN0LCBOZXcgWW9yaywgTlkgMTAwMTgsINCh0KjQkA!5e0!3m2!1sru!2sua!4v1609512981791!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Contacts'),
(3, '', 14, 'Контакти', 'Контакти', 'Мой город, ул. Фруктовая 47, офис 217 \r\nТелефон: (123) 456-78-90', 'Контакти', '<p>Київ, вул. Глибочицька, 32б, 02000</p>\r\n<p>Телефон: (095) 545-54-54</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1269.9307677918514!2d30.49195294945491!3d50.46230305803582!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x84a28f327eb7dc52!2z0JDRgNC10L3QtNCwINC-0YTQuNGB!5e0!3m2!1sru!2sua!4v1609513285692!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 'Контакти'),
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
(2, '', 22, 'Ios smartphones', 'Ios smartphones', 'Smartphones operating system: ios', 'Ios smartphones', '<p>Smartphones operating system: ios</p>', 'Ios smartphones'),
(1, '', 23, 'Смартфоны на android', 'Смартфоны на android', 'Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться. ', 'Смартфоны на android', '<p>Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться.</p>\r\n<p>Покупка смартфона Android &mdash; отличное решение и для тех, кто желает быстро получать актуальные обновления и пользоваться всеми возможностями, предоставляемыми ОС. Многие известные производители, конкурируя друг с другом, предлагают покупателям новые модели телефонов на Android в любых ценовых категориях.</p>', 'Смартфоны на android'),
(3, '', 22, 'Смартфони на ios', 'Смартфони на ios', 'Смартфони операційна система: ios', 'Смартфони на ios', '<p>Смартфони операційна система: ios</p>', 'Смартфони на ios'),
(1, '', 21, 'Смартфоны Samsung', 'Смартфоны Samsung', 'Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.', 'Смартфоны Samsung', '<p>Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.</p>', 'Смартфоны Samsung'),
(2, '', 21, 'Samsung smartphones ', 'Samsung smartphones ', 'Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.', 'Samsung smartphones ', '<p>Samsung smartphones are practically the leader in the high-tech devices market. The company launches premium flagships such as the Galaxy S20, Galaxy Z Flip; mid-range smartphones Galaxy S10 Lite, Galaxy A71 and economy class options.</p>', 'Samsung smartphones '),
(3, '', 21, 'Смартфони Samsung', 'Смартфони Samsung', 'Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.', 'Смартфони Samsung', '<p>Смартфони Samsung займають практично лідируючі позиції на ринку високотехнологічних пристроїв. Компанія випускає флагмани преміум-класу, такі як Galaxy S20, Galaxy Z Flip; смартфони середнього сегмента Galaxy S10 Lite, Galaxy A71 і варіанти економ-класу.</p>', 'Смартфони Samsung'),
(2, '', 23, 'Android smartphones', 'Android smartphones', 'Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.', 'Android smartphones', '<p>Phones on \"Android\" are equipped with a huge number of indisputable advantages that set them apart from competitors\' products. Such a smartphone is suitable for a person who is unnerved by intrusive proprietary software and widgets, the presence of which has to be tolerated.</p>\r\n<p>Buying an Android smartphone is also an excellent solution for those who want to quickly receive up-to-date updates and use all the features provided by the OS. Many well-known manufacturers, competing with each other, offer customers new models of Android phones in any price range</p>', 'Android smartphones'),
(2, '', 24, 'Apple smartphones', 'Apple smartphones', 'Apple smartphones are presented in a wide range', 'Apple smartphones', '<p>Apple smartphones are presented in a wide range</p>', 'Apple smartphones'),
(3, '', 24, 'Смартфони Apple', 'Смартфони Apple', 'Смартфони Apple представлені в широкому асортименті', 'Смартфони Apple', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Смартфони Apple</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">представлені</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">в</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">широкому</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">асортименті</span></p>', 'Смартфони Apple'),
(3, '', 23, 'Смартфони на android', 'Смартфони на android', 'Телефони на «Андроїд» забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися.', 'Смартфони на android', '<p>Телефони на &laquo;Андроїд&raquo; забезпечені величезною кількістю незаперечних переваг, які виділяють їх на тлі продукції конкурентів. Такий смартфон підійде людині, якого нервує нав\'язливе фірмове ПО і віджети, з наявністю яких доводиться миритися.</p>\r\n<p>Купівля смартфона Android - відмінне рішення і для тих, хто бажає швидко отримувати оновлення й пакети користуватися всіма можливостями, наданими ОС. Багато відомих виробників, конкуруючи один з одним, пропонують покупцям нові моделі телефонів на Android в будь-яких цінових категоріях.</p>', 'Смартфони на android'),
(1, '', 24, 'Смартфоны Apple', 'Смартфоны Apple', 'Смартфоны Apple представлены в широком ассортименте', 'Смартфоны Apple', '<p>Смартфоны Apple представлены в широком ассортименте</p>', 'Смартфоны Apple');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_payment_methods`
--

DROP TABLE IF EXISTS `t_lang_payment_methods`;
CREATE TABLE `t_lang_payment_methods` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_payment_methods`
--

INSERT INTO `t_lang_payment_methods` (`lang_id`, `lang_label`, `payment_id`, `name`, `description`) VALUES
(1, '', 1, 'Яндекс Касса', '<p>Яндекс.Касса &mdash; российский платёжный провайдер, сервис по приёму платежей через интернет в пользу юридических лиц, индивидуальных предпринимателей и некоммерческих организаций.</p>'),
(2, '', 1, 'Yandex Cashier', '<p>Yandex.Kassa is a Russian payment provider, a service for accepting payments via the Internet in favor of legal entities, individual entrepreneurs and non-profit organizations.</p>'),
(1, '', 2, 'Оплата картой через Liqpay', '<p>LiqPay &mdash; платежная система, позволяющая проводить оплату банковскими картами MasterСard и VISA, а также наличными через терминалы самообслуживания Приватбанка. Оплата возможна после входа в аккаунт через номер мобильного телефона.</p>'),
(3, '', 1, 'Яндекс Каса', '<p>Яндекс.Касса - російський платіжний провайдер, сервіс з прийому платежів через інтернет на користь юридичних осіб, індивідуальних підприємців і некомерційних організацій.</p>'),
(2, '', 2, 'Card payment through Liqpay', '<p>LiqPay is a payment system that allows you to pay with MasterCard and VISA credit cards, as well as in cash through Privatbank self-service terminals. Payment is possible after entering the account through a mobile phone number.</p>'),
(1, '', 3, 'Оплата наличными курьеру', '<p>Если вы не хотите предварительно оплачивать заказ, у вас есть возможность рассчитаться с курьером наличными в момент получения посылки. Чтобы процесс был максимально комфортным и для вас, и для курьера, рекомендуем заранее подготовить нужную сумму.</p>'),
(3, '', 2, 'Оплата карткою через Liqpay', '<p>LiqPay - платіжна система, що дозволяє проводити оплату банківськими картами MasterСard і VISA, а також готівкою через термінали самообслуговування Приватбанку. Оплата можлива після входу в обліковий запис через номер мобільного телефону.</p>'),
(2, '', 3, 'Cash payment to courier', '<p>If you do not want to pre-pay the order, you have the opportunity to pay the courier in cash at the time of receipt of the parcel. To make the process as comfortable as possible for both you and the courier, we recommend that you prepare the required amount in advance.</p>'),
(1, '', 4, 'PayPal', '<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>'),
(3, '', 3, 'Оплата готівкою кур\'єру', '<p>Якщо ви не хочете попередньо оплачувати замовлення, у вас є можливість розрахуватися з кур\'єром готівкою в момент отримання посилки. Щоб процес був максимально комфортним і для вас, і для кур\'єра, рекомендуємо заздалегідь підготувати потрібну суму.</p>'),
(2, '', 4, 'PayPal', '<p>PayPal is a global e-commerce business allowing payments and money transfers to be made through the Internet. Online money transfers serve as electronic alternatives to paying with traditional paper methods, such as checks and money orders.</p>'),
(3, '', 4, 'PayPal', '<p>Робіть покупки безпечно, без розкриття інформації про свою кредитну картку. PayPal захистить вас, якщо виникнуть проблеми з покупкою.</p>'),
(1, '', 5, 'Оплата через WayForPay', '<p>WayForPay &mdash; это онлайн-сервис с оплатой через банковские карты платежных систем VISA и MasterCard. Доступные методы платежа: Приват 24, терминал, сервис обслуживает прием платежей через систему Bitcoin.</p>'),
(2, '', 5, 'Payment via WayForPay', '<p>WayForPay is an online service with payment through bank cards of VISA and MasterCard payment systems. Available payment methods: Privat 24, terminal, the service serves the acceptance of payments through the Bitcoin system.</p>'),
(3, '', 5, 'Оплата через WayForPay', '<p>WayForPay - це онлайн-сервіс з оплатою через банківські картки платіжних систем VISA і MasterCard. Доступні методи платежу: Приват 24, термінал, сервіс обслуговує прийом платежів через систему Bitcoin.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_products`
--

DROP TABLE IF EXISTS `t_lang_products`;
CREATE TABLE `t_lang_products` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `body` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_products`
--

INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br /><br />iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br /><br />iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br /><br /><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br /><br />Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br /><br /><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br /><br />iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br /><br /><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br /><br /><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br /><br />На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br /><br /><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone'),
(1, '', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br /><br />Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br /><br /><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br /><br />Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br /><br /><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br /><br />Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br /><br /><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br /><br />Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br /><br /><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br /><br /><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br /><br />Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br /><br /><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br /><br />Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br /><br /><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br /><br />Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br /><br /><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br /><br />Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br /><br /><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br /><br /><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br /><br />Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br /><br /><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br /><br />Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ    Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.    SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ'),
(1, '', 3, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br /><br />iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br /><br /><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br /><br />Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br /><br /><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br /><br />Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br /><br /><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br /><br /><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br /><br />iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br /><br /><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br /><br />Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br /><br /><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br /><br />Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br /><br /><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br /><br /><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br /><br />Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br /><br /><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br /><br />Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br /><br /><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br /><br />На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br /><br /><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br /><br />В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br /><br /><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ    iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard'),
(1, '', 4, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Mavic Air   &ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы,'),
(1, '', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно бра'),
(1, '', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Phantom 4 Pro   &ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим би'),
(1, '', 7, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного'),
(1, '', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона'),
(1, '', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(1, '', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(1, '', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(1, '', 12, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(1, '', 13, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(1, '', 14, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(1, '', 15, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(1, '', 16, 'Apple AirPods', '<p><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span></p>', '<div class=\"product__column-item\" data-view-block=\"group_3\">\r\n<div class=\"product__group product__group--tabs\">\r\n<div id=\"opisanie-2\">\r\n<div class=\"product__section\">\r\n<div class=\"text\">\r\n<p><span id=\"result_box\" lang=\"ru\" tabindex=\"-1\"><strong><span title=\"Магія звуку\r\n\r\n\">Магия звука</span></strong><br /><br /><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span><br /><strong><span title=\"Навіщо навушників процесор?\r\n\r\n\">Зачем наушников процессор?</span></strong><br /><br /><span title=\"У переліку технічних характеристик Apple AirPods ми можемо бачити процесор W1.\">В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;</span><span title=\"Причому відповідає він в даній моделі не тільки для формування звукового сигналу.\">Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;</span><span title=\"Навушники знають, що ви робите в даний момент: використовуєте ви 1 або 2 навушника, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставить музику на паузу і включить знову.\r\n\">Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</span><br /><strong><span title=\"Гідна автономність\r\n\r\n\">Достойная автономность</span></strong><br /><br /><span title=\"Але від мобільного гаджета потрібно не тільки спектр можливостей, але і можливість тривалої роботи.\">Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;</span><span title=\"Apple AirPods зможуть безперервно працювати на відтворення музики 5 годин.\">Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;</span><span title=\"Використання чохла для підзарядки зробить вас автономним на добу.\">Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;</span><span title=\"При цьому 15 хвилин підзарядки дадуть вам ще 3 години музики і спілкування!\">При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</span></span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Магия звука     Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.   Это вещи самодостаточные и часто уникальные.   Именно так можно охарактеризовать и Apple AirPods.  Новая беспроводная гарнитура изменит ваше восприятие простых и'),
(1, '', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизаци'),
(1, '', 18, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br />Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Мобильные телефоны', 'Легче жизни совсем рядом - стоит только нажать кнопку  \r\n Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше о');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, '', 19, 'Samsung Galaxy Fold', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4380 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.<span id=\"hscc\"></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен оче'),
(1, '', 20, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен о'),
(1, '', 21, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Мобильные телефоны', 'Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным'),
(1, '', 22, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(1, '', 23, 'Samsung Galaxy A50', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может'),
(1, '', 24, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(1, '', 25, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(1, '', 26, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может'),
(1, '', 27, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации м'),
(1, '', 28, 'Samsung Galaxy A2', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.</p>', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобильные телефоны', 'Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для ком'),
(1, '', 29, 'Samsung Galaxy A80', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx. Оснащен очень мощным аккумулятором на 3700 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте! Подробней с техническими характеристиками смартфона Galaxy A80 можно ознакомиться ниже.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.'),
(1, '', 30, 'Samsung Galaxy A20e', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. Оснащен мощным аккумулятором'),
(1, '', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>', '<p>ВЕЛИКОЛЕПНАЯ СЕМЕРКА</p>\r\n<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>\r\n<p>ПРИТЯГИВАЕТ ВНИМАНИЕ</p>\r\n<p>iPhone 7 притягивает к себе внимание. Уникальный цвет &laquo;черный оникс&raquo; радует глаз благородной игрой света на глянцевой поверхности и гранях. Корпус защищен от брызг и воды. Обновлены кнопка &laquo;Домой&raquo; и дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОМОЙ&raquo;</p>\r\n<p>Стала сенсорной и получила чувствительность к силе нажатия. Благодаря встроенному Taptic Engine тактильный отклик при нажатии получил несколько уровней интенсивности. Чем сильнее нажатие на кнопку, тем сильнее отклик телефона &mdash; это новый опыт использования и восприятия.</p>\r\n<p>ВЛАГОЗАЩИТА КОРПУСА</p>\r\n<p>Конструкция корпуса iPhone изменилась и внутри. Смартфон нового поколения защищен по стандарту IP67 от влаги и пыли.</p>\r\n<p>КАРДИНАЛЬНО НОВЫЙ ВЗГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 установлен новый модуль камеры с 6-линзовым объективом со светосилой &fnof;/1.8 и оптической стабилизацией. Сенсор стал в 2 раза быстрее. Вспышка с 4 диодами. Специальный ISP-процессор управляет работой камеры. Все это выводит качество снимков на новый уровень, особенно в условиях недостаточной освещенности. Фронтальная камера оснащена сенсором 7 Мп с улучшенным цветовым диапазоном. Получить четкие и яркие селфи теперь еще проще.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильные телефоны', 'Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch.'),
(1, '', 32, 'Samsung Galaxy S7', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px.</p>', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ик-порт, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобильные телефоны', 'Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающ'),
(1, '', 33, 'Apple iPhone X', '<p>Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;с переосмысленной системой управления.&nbsp;</p>', '<p>&nbsp;Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;<br />с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благодаря мощнейшей внутренней 64 битной архитектуре. Разительно улучшенная самая популярная в мире мобильная камера.&nbsp;<br />Именно таким видит свой флагманский смартфон компания Apple в 2017 году.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобильные телефоны', 'Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн  с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благода'),
(2, 'en', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br /><br />iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br /><br />iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br /><br /><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br /><br />Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br /><br /><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br /><br />iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br /><br /><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br /><br /><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br /><br />На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br /><br /><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone'),
(2, 'en', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br /><br />Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br /><br /><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br /><br />Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br /><br /><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br /><br />Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br /><br /><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br /><br />Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br /><br /><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br /><br /><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br /><br />Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br /><br /><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br /><br />Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br /><br /><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br /><br />Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br /><br /><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br /><br />Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br /><br /><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br /><br /><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br /><br />Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br /><br /><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br /><br />Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ    Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.    SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ'),
(2, 'en', 3, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br /><br />iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br /><br /><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br /><br />Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br /><br /><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br /><br />Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br /><br /><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br /><br /><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br /><br />iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br /><br /><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br /><br />Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br /><br /><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br /><br />Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br /><br /><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br /><br /><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br /><br />Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br /><br /><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br /><br />Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br /><br /><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br /><br />На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br /><br /><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br /><br />В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br /><br /><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ    iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard'),
(2, 'en', 4, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Mavic Air   &ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы,'),
(2, 'en', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно бра'),
(2, 'en', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Phantom 4 Pro   &ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим би'),
(2, 'en', 7, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного'),
(2, 'en', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона'),
(2, 'en', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(2, 'en', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(2, 'en', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(2, 'en', 12, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(2, 'en', 13, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(2, 'en', 14, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(2, 'en', 15, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(2, 'en', 16, 'Apple AirPods', '<p><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span></p>', '<div class=\"product__column-item\" data-view-block=\"group_3\">\r\n<div class=\"product__group product__group--tabs\">\r\n<div id=\"opisanie-2\">\r\n<div class=\"product__section\">\r\n<div class=\"text\">\r\n<p><span id=\"result_box\" lang=\"ru\" tabindex=\"-1\"><strong><span title=\"Магія звуку\r\n\r\n\">Магия звука</span></strong><br /><br /><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span><br /><strong><span title=\"Навіщо навушників процесор?\r\n\r\n\">Зачем наушников процессор?</span></strong><br /><br /><span title=\"У переліку технічних характеристик Apple AirPods ми можемо бачити процесор W1.\">В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;</span><span title=\"Причому відповідає він в даній моделі не тільки для формування звукового сигналу.\">Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;</span><span title=\"Навушники знають, що ви робите в даний момент: використовуєте ви 1 або 2 навушника, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставить музику на паузу і включить знову.\r\n\">Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</span><br /><strong><span title=\"Гідна автономність\r\n\r\n\">Достойная автономность</span></strong><br /><br /><span title=\"Але від мобільного гаджета потрібно не тільки спектр можливостей, але і можливість тривалої роботи.\">Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;</span><span title=\"Apple AirPods зможуть безперервно працювати на відтворення музики 5 годин.\">Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;</span><span title=\"Використання чохла для підзарядки зробить вас автономним на добу.\">Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;</span><span title=\"При цьому 15 хвилин підзарядки дадуть вам ще 3 години музики і спілкування!\">При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</span></span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Магия звука     Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.   Это вещи самодостаточные и часто уникальные.   Именно так можно охарактеризовать и Apple AirPods.  Новая беспроводная гарнитура изменит ваше восприятие простых и'),
(2, 'en', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизаци'),
(2, 'en', 18, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br />Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Мобильные телефоны', 'Легче жизни совсем рядом - стоит только нажать кнопку  \r\n Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше о'),
(2, 'en', 19, 'Samsung Galaxy Fold', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4380 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.<span id=\"hscc\"></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен оче'),
(2, 'en', 20, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен о'),
(2, 'en', 21, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Мобильные телефоны', 'Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным'),
(2, 'en', 22, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(2, 'en', 23, 'Samsung Galaxy A50', '<p>Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</p>', '<p><span id=\"hscc\">Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.</span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Mobile phones', 'Samsung Galaxy A50 berlayar FHD+ Super AMOLED 6.4\" dengan on-screen sensor sidik jari, dibenami Exynos 9610, triple kamera belakang, kamera depan 25MP, baterai berkapasitas 4000 mAh dengan fast charging.'),
(2, 'en', 24, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(2, 'en', 25, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(2, 'en', 26, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может'),
(2, 'en', 27, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации м'),
(2, 'en', 28, 'Samsung Galaxy A2', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>', '<p>Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 7870 processor. It comes with 1GB of RAM. The Samsung Galaxy A2 Core runs Android 9.0 Pie (Go edition) and is powered by a 2600mAh battery.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A2 Core on the rear packs 5-megapixel camera. The rear camera setup has autofocus. It sports a 5-megapixel camera on the front for selfies.</p>\r\n<p>Samsung Galaxy A2 Core based on Android 9.0 Pie (Go edition) and packs 16GB of inbuilt storage that can be expanded via microSD card. The Samsung Galaxy A2 Core is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards.</p>\r\n<p>Connectivity options on the Samsung Galaxy A2 Core include Wi-Fi 802.11 b/g/n, GPS, Micro-USB, FM radio, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer.</p>\r\n<p><span id=\"hscc\">&nbsp;</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Mobile phones', 'Samsung Galaxy A2 Core smartphone was launched in April 2019. The phone comes with a 5.00-inch touchscreen display with a resolution of 540x960 pixels and an aspect ratio of 16:9. Samsung Galaxy A2 Core is powered by an octa-core Samsung Exynos 7 Octa 787'),
(2, 'en', 29, 'Samsung Galaxy A80', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>', '<p>Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 cores clocked at 2.2GHz and 6 cores clocked at 1.7GHz. It comes with 8GB of RAM. The Samsung Galaxy A80 runs Android 9.0 Pie and is powered by a 3700mAh battery. The Samsung Galaxy A80 supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A80 on the rear packs a 48-megapixel primary camera with an f/2.0 aperture and a second 8-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus.</p>\r\n<p>The Samsung Galaxy A80 runs One UI based on Android 9.0 Pie and packs 128GB of inbuilt storage. The Samsung Galaxy A80 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy A80 measures 165.20 x 76.50 x 9.30mm (height x width x thickness) . It was launched in Angel Gold, Ghost White, and Phantom Black colours. It bears a glass body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A80 include Wi-Fi 802.11 b/g/n, GPS, USB Type-C, 3G, and 4G (with support for Band 40 used by some LTE networks in India) with active 4G on both SIM cards. Sensors on the phone include accelerometer, ambient light sensor, proximity sensor, and fingerprint sensor. The Samsung Galaxy A80 supports face unlock.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Mobile phones', 'Samsung Galaxy A80 smartphone was launched in April 2019. The phone comes with a 6.70-inch touchscreen display with a resolution of 1080x2400 pixels. Samsung Galaxy A80 is powered by a 1.7GHz octa-core Qualcomm Snapdragon 730G processor that features 2 co'),
(2, 'en', 30, 'Samsung Galaxy A20e', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM.</p>', '<p>Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 processor. It comes with 3GB of RAM. The Samsung Galaxy A20e runs Android and is powered by a 3000mAh battery. The Samsung Galaxy A20e supports proprietary fast charging.</p>\r\n<p>As far as the cameras are concerned, the Samsung Galaxy A20e on the rear packs a 13-megapixel primary camera with an f/1.9 aperture and a second 5-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 8-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Samsung Galaxy A20e based on Android and packs 32GB of inbuilt storage. The Samsung Galaxy A20e is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. It was launched in Black and White colours. It bears a plastic body.</p>\r\n<p>Connectivity options on the Samsung Galaxy A20e include Wi-Fi, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer and fingerprint sensor.</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Mobile phones', 'Samsung Galaxy A20e smartphone was launched in April 2019. The phone comes with a 5.80-inch touchscreen display with a resolution of 720x1560 pixels and an aspect ratio of 19.5:9. Samsung Galaxy A20e is powered by a 1.35GHz octa-core Samsung Exynos 7884 p'),
(2, 'en', 31, 'Apple iPhone 7 Black', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.&nbsp;</p>', '<p>Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a 2.34GHz quad-core Apple A10 Fusion processor. It comes with 2GB of RAM. The Apple iPhone 7 runs iOS 10 and is powered by a 1960mAh non-removable battery.</p>\r\n<p>As far as the cameras are concerned, the Apple iPhone 7 on the rear packs a 12-megapixel camera with an f/1.8 aperture. The rear camera setup has phase detection autofocus. It sports a 7-megapixel camera on the front for selfies, with an f/2.2 aperture.</p>\r\n<p>Apple iPhone 7 based on iOS 10 and packs 32GB of inbuilt storage. The Apple iPhone 7 is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Apple iPhone 7 measures 138.30 x 67.10 x 7.10mm (height x width x thickness) and weighs 138.00 grams. It was launched in Black, Gold, Jet Black, Matte Black, Red, Rose Gold, and Silver colours.</p>\r\n<p>Connectivity options on the Apple iPhone 7 include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v4.20, NFC, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Mobile phones', 'Apple iPhone 7 smartphone was launched in September 2016. The phone comes with a 4.70-inch touchscreen display with a resolution of 750x1334 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9. Apple iPhone 7 is powered by a'),
(2, 'en', 32, 'Samsung Galaxy S7', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside.&nbsp;&nbsp;</p>', '<p>Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The camera is absolutely amazing, especially in low light. This is a pragmatic phone, compared to its sibling the Galaxy S7 Edge, and is better value for money if you don\'t want to show off. However, with competition at an all-time high, you can also get most of its features and functions for one third this price.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Mobile phones', 'Samsung\'s brand new Galaxy S7 is a subtle improvement over its predecessor on the outside, but a whole new beast on the inside. Powered by the Exynos 8890 SoC, this phone can blaze through absolutely anything you throw at it, with power to spare. The came'),
(2, 'en', 33, 'Apple iPhone X', '<p>Apple iPhone X is the epitome of the best innovative solutions. A completely new design with a reimagined control system.</p>', '<p>Apple iPhone X is the epitome of the best innovative solutions. Brand new design<br />with a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful internal 64-bit architecture. Dramatically improved the world\'s most popular mobile camera.<br />This is exactly how Apple sees its flagship smartphone in 2017.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Mobile phones', 'Apple iPhone X is the epitome of the best innovative solutions. Brand new design\r\nwith a reimagined control system. The bezel-less design takes the user experience to the next level. Glass and metal body. Perfect hardware core, thanks to the most powerful'),
(3, 'ua', 1, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br /><br />iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br /><br />iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br /><br /><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br /><br />Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br /><br /><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br /><br />iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br /><br /><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br /><br /><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br /><br />На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br /><br /><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone'),
(3, 'ua', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br /><br />Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br /><br /><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br /><br />Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br /><br /><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br /><br />Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br /><br /><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br /><br />Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br /><br /><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br /><br /><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br /><br />Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br /><br /><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br /><br />Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br /><br /><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br /><br />Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br /><br /><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br /><br />Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br /><br /><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br /><br /><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br /><br />Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br /><br /><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br /><br />Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ    Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.    SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 'ua', 3, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br /><br />iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br /><br /><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br /><br />Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br /><br /><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br /><br />Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br /><br /><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br /><br /><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br /><br />iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br /><br /><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br /><br />Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br /><br /><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br /><br />Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br /><br /><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br /><br /><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br /><br />Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br /><br /><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br /><br />Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br /><br /><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br /><br />На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br /><br /><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br /><br />В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br /><br /><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ    iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard'),
(3, 'ua', 4, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Mavic Air   &ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы,'),
(3, 'ua', 5, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно бра'),
(3, 'ua', 6, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Phantom 4 Pro   &ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим би'),
(3, 'ua', 7, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного'),
(3, 'ua', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона'),
(3, 'ua', 9, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(3, 'ua', 10, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(3, 'ua', 11, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик'),
(3, 'ua', 12, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(3, 'ua', 13, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(3, 'ua', 14, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(3, 'ua', 15, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ'),
(3, 'ua', 16, 'Apple AirPods', '<p><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span></p>', '<div class=\"product__column-item\" data-view-block=\"group_3\">\r\n<div class=\"product__group product__group--tabs\">\r\n<div id=\"opisanie-2\">\r\n<div class=\"product__section\">\r\n<div class=\"text\">\r\n<p><span id=\"result_box\" lang=\"ru\" tabindex=\"-1\"><strong><span title=\"Магія звуку\r\n\r\n\">Магия звука</span></strong><br /><br /><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span><br /><strong><span title=\"Навіщо навушників процесор?\r\n\r\n\">Зачем наушников процессор?</span></strong><br /><br /><span title=\"У переліку технічних характеристик Apple AirPods ми можемо бачити процесор W1.\">В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;</span><span title=\"Причому відповідає він в даній моделі не тільки для формування звукового сигналу.\">Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;</span><span title=\"Навушники знають, що ви робите в даний момент: використовуєте ви 1 або 2 навушника, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставить музику на паузу і включить знову.\r\n\">Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</span><br /><strong><span title=\"Гідна автономність\r\n\r\n\">Достойная автономность</span></strong><br /><br /><span title=\"Але від мобільного гаджета потрібно не тільки спектр можливостей, але і можливість тривалої роботи.\">Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;</span><span title=\"Apple AirPods зможуть безперервно працювати на відтворення музики 5 годин.\">Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;</span><span title=\"Використання чохла для підзарядки зробить вас автономним на добу.\">Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;</span><span title=\"При цьому 15 хвилин підзарядки дадуть вам ще 3 години музики і спілкування!\">При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</span></span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Магия звука     Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.   Это вещи самодостаточные и часто уникальные.   Именно так можно охарактеризовать и Apple AirPods.  Новая беспроводная гарнитура изменит ваше восприятие простых и'),
(3, 'ua', 17, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизаци'),
(3, 'ua', 18, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br />Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Мобильные телефоны', 'Легче жизни совсем рядом - стоит только нажать кнопку  \r\n Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше о'),
(3, 'ua', 19, 'Samsung Galaxy Fold', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4380 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.<span id=\"hscc\"></span></p>', 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен оче'),
(3, 'ua', 20, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен о'),
(3, 'ua', 21, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Мобильные телефоны', 'Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным'),
(3, 'ua', 22, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(3, 'ua', 23, 'Samsung Galaxy A50', '<p>Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</p>', '<p><span id=\"hscc\">Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер відбитків пальців.</span></p>', 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Мобільні телефони', 'Samsung Galaxy A50 укладений в супертонкий корпус з округленими гранями і кутами. Задня панель зі склопластику з 3D ефектом надає смартфону стильний і яскравий вигляд. Фронтальна панель покрита міцним склом Corning Gorilla Glass 3, в неї вбудований сканер'),
(3, 'ua', 24, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(3, 'ua', 25, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку'),
(3, 'ua', 26, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может'),
(3, 'ua', 27, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации м');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 'ua', 28, 'Samsung Galaxy A2', '<p>GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</p>', '<p><span id=\"hscc\">GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графічний процесор: ARM Mali-T830; ОЗП (ГБ): 1</span></p>', 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобільні телефони', 'GSM; 3G; 4G (LTE); VoLTE; ОС: Android v 8.1 Go Edition; Кількість SIM: SIM + SIM/microSD; Корпус: моноблок; Основний дисплей: дисплей (\"): 5; роздільна здатність: 960x540; сенсорний екран; Модель процесора: Samsung Exynos 7870; Процесор (ГГц): 1.6; Графіч'),
(3, 'ua', 29, 'Samsung Galaxy A80', '<p>Самсунг Галаксі A80 - чудовий смартфон, що працює на платформі Android, оснащений Super AMOLED-дисплеєм, що відображає до 16 млн. кольорів, з діагоналлю 6.7 \"і камерою на 48 Mpx.</p>', '<h3>Більш живі й природні кадри</h3>\r\n<p>Режим Scene Optimizer допомагає вашим фотографіям стати дійсно приголомшливими. Використовуючи штучний інтелект, смартфон визначає, що знаходиться в кадрі, і покращує фото для отримання більш живою і яскравої картинки. А також пропонує оптимальні настройки освітлення для зйомки в темряві, щоб ваші знімки вийшли якнайкраще.</p>\r\n<h3>Суцільне задоволення</h3>\r\n<p>Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою без всяких відволікаючих деталей. А роздільна здатність Full HD + робить зображення максимально детальним.</p>\r\n<h3>Акумулятор, який тримає заряд довше</h3>\r\n<p>Спілкуйтеся, шукайте потрібну інформацію в мережі, слухайте улюблену музику і діліться свіжими фото з друзями в соціальних мережах. Samsung Galaxy A80 з ємною батареєю на 3700 мАг дозволяє користуватися смартфоном весь день, без обмежень. Режим адаптивного енергоощадження оптимізує енергоспоживання, закриваючи невикористовувані додатки, а технологія швидкої зарядки потужністю 25 Вт дозволяє заряджати батарею неймовірно швидко.</p>\r\n<h3>Готовий прийняти виклик</h3>\r\n<p>Маючи потужний 8-ядерний процесор і 8 Гб оперативної пам\'яті, Galaxy A80 здатний впоратися з будь-яким завданням. Тим більше, що функція Intelligent Performance Enhancer, яка розпізнає звички користувача, робить роботу системи ще більш ефективною. Завдяки цьому ви можете комфортно працювати, грати і використовувати свій телефон по максимуму кожен раз.</p>', 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильні телефони', 'Великий 6,7-дюймовий Super AMOLED екран Galaxy A80 ідеально підходить для перегляду відео, спілкування, ігор і творчості. Без вирізів для камери, датчиків і практично без рамок він займає всю передню панель смартфона, дозволяючи насолоджуватися картинкою '),
(3, 'ua', 30, 'Samsung Galaxy A20e', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки.</p>', '<p>Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з &laquo;краплею&raquo;, подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидкої зарядки. Апарат оснастили IPS-дисплеєм Infinity-V діагоналлю 5,8 дюйма з роздільною здатністю 1560x720 пікселів з невеликим вирізом для селф-камери у верхній частині. Сканер відбитків пальців, на відміну від старших моделей лінійки, розташувався на задній кришці пристрою. Під &laquo;капотом&raquo; Galaxy A20e встановлений процесор Exynos 7884, який працює за підтримки 3 ГБ оперативної пам\'яті. Вбудоване сховище об\'ємом 32 ГБ можна додатково розширити за допомогою карти microSD. Ємність акумулятора новинки з підтримкою швидкої зарядки потужністю 15 Вт складає 3000 мАг. Основна камера гаджета складається з двох сенсорів: основного з дозволом 16 Мп (f / 1.9) і допоміжного 5-мегапіксельного з діафрагмою f / 2.2. Фронталки представлена ​​єдиним датчиком на 8 Мп (f / 2.0).</p>', 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильні телефони', 'Samsung розширила лінійку смартфонів Galaxy A випуском моделі початкового рівня під назвою Galaxy A20e. Найкомпактніший гаджет А-серії отримав дисплей з «краплею», подвійну камеру з ширококутним об\'єктивом, восьміядерний процесор і підтримку функції швидк'),
(3, 'ua', 31, 'Apple iPhone 7 Black', '<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився.&nbsp;</p>', '<p>ПРЕКРАСНА СІМКА</p>\r\n<p>Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка &laquo;Додому&raquo; тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корпус в нових кольорах з допрацьованим дизайном.</p>\r\n<p>притягують увагу</p>\r\n<p>iPhone 7 притягує до себе увагу. Унікальний колір &laquo;чорний онікс&raquo; радує око благородної грою світла на глянцевому поверхні і гранях. Корпус захищений від бризок і води. Оновлені кнопка &laquo;Додому&raquo; і дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОДОМУ&raquo;</p>\r\n<p>Стала сенсорної і отримала чутливість до сили натискання. Завдяки вбудованому Taptic Engine тактильний відгук при натисненні отримав кілька рівнів інтенсивності. Чим сильніше натискання на кнопку, тим сильніше відгук телефону - це новий досвід використання і сприйняття.</p>\r\n<p>вологозахистом КОРПУСУ</p>\r\n<p>Конструкція корпусу iPhone змінилася і всередині. Смартфон нового покоління захищений за стандартом IP67 від вологи і пилу.</p>\r\n<p>КАРДИНАЛЬНО НОВИЙ ПОГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 виявлено новий модуль камери з 6-лінзовий об\'єктивом зі світлосилою &fnof; / 1.8 і оптичною стабілізацією. Сенсор став в 2 рази швидше. Спалах з 4 діодами. Спеціальний ISP-процесор керує роботою камери. Все це виводить якість знімків на новий рівень, особливо в умовах недостатньої освітленості. Фронтальна камера оснащена сенсором 7 Мп з поліпшеним колірним діапазоном. Отримати чіткі і яскраві Селфі тепер ще простіше.</p>', 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильні телефони', 'Флагман оснастили новим 4-ядерним процесором Apple A10 Fusion. З\'явилися стереодинаміки і захист від вологи і пилу за стандартом IP67. Модуль камери принципово оновився. Кнопка «Додому» тепер підтримує Force Touch. iPhone 7 отримав прекрасний Unibody-корп'),
(1, '', 34, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br /><br />Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br /><br /><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br /><br />Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br /><br /><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br /><br />Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br /><br /><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br /><br />Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br /><br /><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br /><br />Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br /><br /><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br /><br />Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br /><br />Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br /><br /><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br /><br />Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br /><br /><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br /><br />Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br /><br /><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br /><br />Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE    Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch A'),
(3, 'ua', 32, 'Samsung Galaxy S7', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px.</p>', '<p>Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з роздільною здатністю 4992 х 3744 px. Оснащений потужним акумулятором на 3000 mAh Для комунікації може запропонувати: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ік-порт, стерео Bluetooth, і, звичайно, USB-порт. Для любителів музики є аудіо вихід на 3.5 мм.</p>', 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобільні телефони', 'Самсунг Галаксі S7 - чудовий смартфон, що працює на платформі Android з 8х-ядерним процесором Qualcomm Snapdragon 820 2300Mhz, оснащений HD Super AMOLED-дисплеєм, що відображає до 16 млн. Квітів, з діагоналлю 5.1 \"і камерою на 12 Mpx, що робить знімки з р'),
(3, 'ua', 33, 'Apple iPhone X', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн з переосмисленої системою управління.</p>', '<p>Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн<br />з переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. Досконале апаратне ядро, завдяки найпотужнішою внутрішньої 64 бітної архітектури. Разюче поліпшена найпопулярніша в світі мобільна камера.<br />Саме таким бачить свій флагманський смартфон компанія Apple в 2017 році.</p>', 'Apple iPhone X', 'Apple iPhone X, Apple, Мобільні телефони', 'Apple iPhone X - втілення кращих інноваційних рішень. Абсолютно новий дизайн\r\nз переосмисленої системою управління. Безрамковий дизайн виводить досвід використання на новий рівень. Корпус зі скла і металу. Досконале апаратне ядро, завдяки найпотужнішою вн'),
(2, '', 34, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br /><br />Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br /><br /><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br /><br />Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br /><br /><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br /><br />Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br /><br /><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br /><br />Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br /><br /><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br /><br />Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br /><br /><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br /><br />Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br /><br />Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br /><br /><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br /><br />Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br /><br /><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br /><br />Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br /><br /><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br /><br />Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE    Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch A'),
(3, '', 34, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br /><br />Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br /><br /><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br /><br />Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br /><br /><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br /><br />Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br /><br /><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br /><br />Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br /><br /><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br /><br />Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br /><br /><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br /><br />Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br /><br />Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br /><br /><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br /><br />Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br /><br /><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br /><br />Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br /><br /><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br /><br />Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE    Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch A'),
(1, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(2, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(3, '', 35, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг'),
(1, '', 39, 'Apple iPhone 12', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\" /></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.'),
(2, '', 39, 'Apple iPhone 12', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">All new products traditionally have the fastest Apple processor and support for 5G.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">Another common feature is the most durable screen ever on an iPhone.</span></p>', '<h3>Flat and cocky</h3>\r\n<p>Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Incredibly durable</h3>\r\n<p>Apple iPhone 12 is housed in an aluminum case with flat side edges. The entire front panel is occupied by a beautiful 6.1-inch OLED display with Super Retina XDR technology. This smartphone introduces for the first time a completely new coating technology - Ceramic Shield. It is glass with nano-inclusions of transparent ceramics, which make it incredibly durable. Now you can not be afraid to drop your smartphone - the probability of breaking the screen when falling is now less than 4 times.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Amazingly fast</h3>\r\n<p>Apple iPhone 12 is powered by the most powerful new generation A14 Bionic chip. The overall performance of the smartphone has increased by 40% compared to the previous model. The 4-core graphics accelerator is 30% more powerful, and the improved 16-core Neural Engine is 10 times faster than its predecessor. At the same time, the power consumption of the new processor has decreased. This smartphone will perform any applications, any operations without the slightest delay. The iPhone 12 now makes it possible to execute the most complex algorithms of processing and machine learning, best seen in the incredible capabilities of its cameras.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Replaces film studio</h3>\r\n<p>iPhone 12 received two cameras: wide-angle and ultra-wide-angle. Apple\'s excellent cameras have received an upgrade this year with improved imaging technology. Night mode is now supported for both modules. This means shots taken in low light will be more detailed and sharper. In addition, you can now shoot a time-lapse in night mode. The new smartphone can shoot video in HDR 4K mode in the Dolby Vision standard, which is an absolute record not only among smartphone cameras, but also among many professional camcorders.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\" /></p>\r\n<h3>Innovatively beautiful</h3>\r\n<p>Apple iPhone 12 comes in 5 colors: standard white and black, special PRODUCT (RED), which proceeds to the COVID-19 fund, green and in the new 2020 color blue. The phone case is protected from moisture according to the IP68 standard, this protection will allow you to swim without taking the phone out of your pocket. And on the back panel of the case there is now a magnetic mount, thanks to which the iPhone can be conveniently placed on a wireless charger, and, if desired, you can &ldquo;glue&rdquo; special cases and pockets for cards on the back panel, which the manufacturer also announced for the first time this year.</p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Mobile phones', 'Apple iPhone 12 is one of the most powerful smartphones of 2020. Inside it has the most advanced hardware, while its design will be appreciated by those who are migrating from previous versions, and lovers of the classic iPhone 4 and iPhone 5.');
INSERT INTO `t_lang_products` (`lang_id`, `lang_label`, `product_id`, `name`, `annotation`, `body`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, '', 39, 'Apple iPhone 12', '<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">У</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">всіх</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">новинок</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"3\">традиційно</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">найшвидший</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">процесор</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">Apple</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">підтримка</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">5G</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">Ще</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">із загального</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">найміцніший</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">екран</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">за</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">всю</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">історію</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">iPhone</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">.</span></p>', '<h3><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"0\">Плоский</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"1\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"2\">зухвалий</span></h3>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"4\">Apple iPhone</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"5\">12</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"6\">-</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"7\">це</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"8\">один</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"9\">з найбільш</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"10\">потужних</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"11\">смартфонів</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"12\">2020 року.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"13\">Всередині</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"14\">у</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"15\">нього</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"16\">знаходиться</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"17\">саме</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"18\">передове</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"19\">&laquo;</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"20\">залізо</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"21\">&raquo;</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"22\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"23\">в</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"24\">той же</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"25\">час</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"26\">його</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"27\">дизайн</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"28\">оцінять</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"29\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"30\">ті</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"31\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"32\">хто</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"33\">переходить</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"34\">з</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"35\">попередніх</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"36\">версій</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"37\">,</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"38\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"39\">любителі</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"40\">класичних</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"41\">iPhone</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"42\">4</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"43\">і</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"44\">iPhone</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"45\">5</span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">.</span></p>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\"><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></span></p>\r\n<h3><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Неймовірно міцний </span></h3>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Apple iPhone 12 укладений в корпус з алюмінію з плоскими бічними гранями. Всю передню панель займає прекрасний 6,1-дюймовий OLED-дисплей з технологією Super Retina XDR. У цьому смартфоні вперше представлена абсолютно нова технологія покриття - Ceramic Shield. Це скло з нановкрапленіямі прозорою кераміки, які роблять його неймовірно міцним. Тепер ви можете не боятися впустити смартфон - ймовірність розбити екран при падінні тепер менше в 4 рази.</span></p>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\"><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></span></p>\r\n<h3><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Приголомшливо швидкий </span></h3>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Працює Apple iPhone 12 на найпотужнішому чипі нового покоління A14 Bionic. Загальна продуктивність смартфона в порівнянні з попередньою моделлю зросла на 40%. 4-ядерний графічний прискорювач став на 30% могутніше, а поліпшений 16-ядерний нейропроцесори Neural Engine працює в 10 разів швидше за свого попередника. При цьому енергоспоживання нового процесора скоротилося. Будь-які додатки, будь-які операції цей смартфон виконає без найменшої затримки. В iPhone 12 стало можливо виконувати найскладніші алгоритми обробки і машинного навчання: найкраще це помітно в неймовірні можливості його камер.</span></p>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\"><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></span></p>\r\n<h3><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Замінює кіностудію</span></h3>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\"> iPhone 12 отримав дві камери: широкоугольную і надширококутний. Прекрасні камери Apple в цьому році отримали апгрейд за рахунок вдосконалення технологій обробки зображень. Тепер нічний режим підтримується для обох модулів. Це означає, що знімки, зроблені при недостатньому освітленні, стануть більш деталізованими і чіткими. Крім того, в нічному режимі тепер можна знімати таймлапс. Відео новий смартфон може знімати в режимі HDR 4K в стандарті Dolby Vision, це абсолютний рекорд не тільки серед камер смартфонів, але і серед багатьох професійних відеокамер.</span></p>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\"><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\" /></span></p>\r\n<h3><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Інноваційно гарний </span></h3>\r\n<p><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"uk\" data-language-to-translate-into=\"ru\" data-phrase-index=\"46\">Apple iPhone 12 поставляється в 5 кольорах: стандартних білому і чорному, спеціальному PRODUCT (RED), доходи з продажів якого направляються до фонду боротьби з COVID-19, зеленому і в новому кольорі 2020 року - синьому. Корпус телефону захищений від вологи за стандартом IP68, такий захист дозволить вам плавати, не виймаючи телефон з кишені. А на задній панелі корпусу тепер знаходиться магнітне кріплення, завдяки якому iPhone зручно класти на бездротову зарядку, а, при бажанні, на задню панель ви зможете &laquo;приклеїти&raquo; спеціальні чохли і кишені для карт, які в цьому році також вперше анонсував виробник.</span></p>', 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобільні телефони', 'Apple iPhone 12 - це один з найбільш потужних смартфонів 2020 року. Всередині у нього знаходиться саме передове «залізо», в той же час його дизайн оцінять і ті, хто переходить з попередніх версій, і любителі класичних iPhone 4 і iPhone 5.');

-- --------------------------------------------------------

--
-- Структура таблицы `t_lang_variants`
--

DROP TABLE IF EXISTS `t_lang_variants`;
CREATE TABLE `t_lang_variants` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_lang_variants`
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
(1, '', 23, '64 МБ', 'Черный'),
(1, '', 24, '128 ГБ', 'Синий'),
(1, '', 25, '256 ГБ', 'Серый'),
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
(2, 'en', 2, '64 ГБ', ''),
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
(2, 'en', 21, '', ''),
(2, 'en', 22, '', ''),
(2, 'en', 23, '64 GB', 'Black'),
(2, 'en', 24, '128 GB', 'Blue'),
(2, 'en', 25, '256 GB', 'Grey'),
(2, 'en', 26, '512 GB', 'Blue'),
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
(3, 'ua', 21, '', ''),
(3, 'ua', 22, '', ''),
(3, 'ua', 23, '64 МБ', 'Чорний'),
(3, 'ua', 24, '128 ГБ', 'Синій'),
(3, 'ua', 25, '256 ГБ', 'Сірий'),
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
(1, '', 37, '128 ГБ', 'Оранжевый'),
(2, '', 37, '128 GB', 'Orange'),
(3, '', 37, '128 ГБ', 'Помаранчевий'),
(1, '', 38, '256 ГБ', 'Синий'),
(2, '', 38, '256 GB', 'Blue'),
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
(2, '', 64, '63004 ГБ', ''),
(3, '', 64, '63004 ГБ', ''),
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
(3, '', 79, '256 ГБ', 'Білий');

-- --------------------------------------------------------

--
-- Структура таблицы `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_menu`
--

INSERT INTO `t_menu` (`id`, `name`, `position`) VALUES
(1, 'Основное меню', 1),
(2, 'Другие страницы', 2),
(3, 'Информация', 3),
(4, 'Посадочные страницы', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `t_options`
--

DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL,
  `translit` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_options`
--

INSERT INTO `t_options` (`product_id`, `feature_id`, `lang_id`, `value`, `translit`) VALUES
(1, 1, 1, 'IOS', 'ios'),
(1, 2, 1, '5 GB', '5gb'),
(23, 5, 2, '8', '8'),
(23, 17, 1, 'Nano-SIM', 'nanosim'),
(23, 16, 1, '2 SIM', '2sim'),
(23, 15, 1, '4000 мА·ч', '4000mach'),
(23, 14, 1, 'Li-Po', 'lipo'),
(23, 13, 1, '6.4', '64'),
(23, 12, 1, 'Super AMOLED', 'superamoled'),
(23, 11, 1, '25 Мп', '25mp'),
(23, 10, 1, '25 Мп + 5 Мп + 8 Мп', '25mp5mp8mp'),
(23, 9, 1, 'microSDXC', 'microsdxc'),
(23, 8, 1, '64 ГБ', '64gb'),
(23, 7, 1, 'Mali-G72 MP3', 'malig72mp3'),
(29, 15, 2, '3700 мAh', '3700mah'),
(23, 5, 1, '8', '8'),
(23, 6, 1, '2.3 MГц', '23mhz'),
(29, 11, 1, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(29, 10, 1, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(29, 8, 1, '128 ГБ', '128gb'),
(29, 7, 1, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(29, 6, 1, '2.2 MГц', '22mgts'),
(29, 5, 1, '8', '8'),
(29, 4, 1, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 1, '8 ГБ', '8gb'),
(29, 1, 1, 'Android', 'android'),
(29, 3, 1, '#999999', '999999'),
(30, 3, 1, '#000000', '000000'),
(30, 1, 1, 'Android', 'android'),
(30, 4, 1, 'Exynos 7884', 'exynos7884'),
(30, 5, 1, '8', '8'),
(30, 6, 1, '1.6 MГц', '16mhz'),
(30, 2, 1, '3 GB', '3gb'),
(30, 7, 1, 'ARM Mali-G71', 'armmalig71'),
(30, 8, 1, '32 ГБ', '32gb'),
(30, 9, 1, 'microSDXC', 'microsdxc'),
(30, 10, 1, '13 MP + 5 MP', '13mp5mp'),
(30, 11, 1, '8 MP', '8mp'),
(30, 12, 1, 'PLS', 'pls'),
(30, 13, 1, '5.8', '58'),
(30, 14, 1, 'Li-Polymer', 'lipolymer'),
(30, 15, 1, '3000 мА·ч', '3000mah'),
(30, 16, 1, '2 SIM', '2sim'),
(30, 17, 1, 'Nano-SIM', 'nanosim'),
(31, 6, 1, '2.3 MГц', '23mgts'),
(31, 7, 1, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(31, 8, 1, '32 ГБ', '32gb'),
(31, 10, 1, '12 MP', '12mp'),
(31, 11, 1, '7 MP', '7mp'),
(31, 12, 1, 'IPS', 'ips'),
(31, 13, 1, '4.7', '47'),
(31, 14, 1, 'Li-Ion', 'liion'),
(31, 15, 1, '1960 мА·ч', '1960mach'),
(31, 17, 1, 'Nano-SIM', 'nanosim'),
(32, 11, 1, '5 MP', '5mp'),
(32, 10, 1, '12 MP', '12mp'),
(32, 9, 1, 'microSDXC', 'microsdxc'),
(32, 8, 1, '32 ГБ', '32gb'),
(32, 7, 1, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(32, 6, 1, '2.6 MГц', '26mgts'),
(32, 5, 1, '4', '4'),
(32, 4, 1, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(32, 2, 1, '4 ГБ', '4gb'),
(32, 1, 1, 'Android', 'android'),
(32, 3, 1, '#c0c0c0', 'c0c0c0'),
(33, 10, 1, '12 МП', '12mp'),
(33, 8, 1, '64 ГБ', '64gb'),
(33, 6, 1, '2.1 MГц', '21mgts'),
(33, 5, 1, '6', '6'),
(33, 4, 1, 'A11', 'a11'),
(33, 2, 1, '3 ГБ', '3gb'),
(1, 1, 2, 'IOS', 'ios'),
(1, 2, 2, '5 GB', '5gb'),
(23, 16, 2, '2 SIM', '2sim'),
(23, 15, 2, '4000 mAh', '4000mah'),
(23, 14, 2, 'Li-Po', 'lipo'),
(23, 13, 2, '6.4', '64'),
(23, 12, 2, 'Super AMOLED', 'superamoled'),
(23, 11, 2, '25 MP', '25mp'),
(23, 10, 2, '25 MP + 5 MP + 8 MP', '25mp5mp8mp'),
(23, 9, 2, 'microSDXC', 'microsdxc'),
(23, 8, 2, '64 GB', '64gb'),
(29, 5, 2, '8', '8'),
(29, 6, 2, '2.2 MHz', '22mhz'),
(29, 7, 2, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(29, 8, 2, '128 GB', '128gb'),
(29, 10, 2, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera'),
(29, 11, 2, '48 MP + 8 MP + TOF 3D camera', '48mp8mptof3dcamera'),
(29, 12, 2, 'Super AMOLED', 'superamoled'),
(29, 13, 2, '6.7', '67'),
(30, 2, 2, '3 GB', '3gb'),
(30, 4, 2, 'Exynos 7884', 'exynos7884'),
(30, 5, 2, '8', '8'),
(30, 6, 2, '1.6 MHz', '16mhz'),
(30, 7, 2, 'ARM Mali-G71', 'armmalig71'),
(30, 8, 2, '32 GB', '32gb'),
(30, 9, 2, 'microSDXC', 'microsdxc'),
(30, 10, 2, '13 MP + 5 MP', '13mp5mp'),
(30, 11, 2, '8 MP', '8mp'),
(30, 12, 2, 'PLS', 'pls'),
(31, 14, 2, 'Li-Ion', 'liion'),
(31, 13, 2, '4.7', '47'),
(31, 12, 2, 'IPS', 'ips'),
(31, 11, 2, '7 MP', '7mp'),
(31, 10, 2, '12 MP', '12mp'),
(31, 8, 2, '32 GB', '32gb'),
(31, 7, 2, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(32, 4, 2, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(32, 5, 2, '4', '4'),
(32, 6, 2, '2.6 MHz', '26mhz'),
(32, 7, 2, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(32, 8, 2, '32 GB', '32gb'),
(32, 9, 2, 'microSDXC', 'microsdxc'),
(32, 10, 2, '12 MP', '12mp'),
(32, 11, 2, '5 MP', '5mp'),
(32, 12, 2, 'Super AMOLED', 'superamoled'),
(33, 11, 2, '7 MP', '7mp'),
(33, 6, 2, '2.1 MHz', '21mhz'),
(33, 4, 2, 'A11', 'a11'),
(33, 2, 2, '3 GB', '3gb'),
(1, 1, 3, 'IOS', 'ios'),
(1, 2, 3, '5 GB', '5gb'),
(23, 4, 3, 'Exynos 9610', 'exynos9610'),
(23, 5, 3, '8', '8'),
(23, 6, 3, '2.3 MГц', '23mgts'),
(23, 7, 3, 'Mali-G72 MP3', 'malig72mp3'),
(23, 8, 3, '64 ГБ', '64gb'),
(23, 9, 3, 'microSDXC', 'microsdxc'),
(23, 10, 3, '25 Мп + 5 Мп + 8 Мп', '25mp5mp8mp'),
(23, 11, 3, '25 Мп', '25mp'),
(23, 12, 3, 'Super AMOLED', 'superamoled'),
(23, 13, 3, '6.4', '64'),
(23, 14, 3, 'Li-Po', 'lipo'),
(29, 5, 3, '8', '8'),
(29, 6, 3, '2.2 MГц', '22mgts'),
(29, 7, 3, 'Qualcomm Adreno 618', 'qualcommadreno618'),
(29, 8, 3, '128 ГБ', '128gb'),
(29, 10, 3, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(29, 11, 3, '48 Мп + 8 Мп + TOF 3D камера', '48mp8mptof3dkamera'),
(29, 12, 3, 'Super AMOLED', 'superamoled'),
(29, 13, 3, '6.7', '67'),
(30, 12, 3, 'PLS', 'pls'),
(30, 11, 3, '8 Мп', '8mp'),
(30, 10, 3, '13 MP + 5 MP', '13mp5mp'),
(30, 9, 3, 'microSDXC', 'microsdxc'),
(30, 8, 3, '32 ГБ', '32gb'),
(30, 6, 3, '1.6 MГц', '16mgts'),
(30, 5, 3, '8', '8'),
(30, 2, 3, '3 ГБ', '3gb'),
(31, 5, 3, '4', '4'),
(31, 6, 3, '2.3 MГц', '23mgts'),
(31, 7, 3, 'PowerVR GT7600 Plus', 'powervrgt7600plus'),
(31, 8, 3, '32 ГБ', '32gb'),
(31, 10, 3, '12 МП', '12mp'),
(31, 11, 3, '7 МП', '7mp'),
(31, 12, 3, 'IPS', 'ips'),
(31, 13, 3, '4.7', '47'),
(31, 14, 3, 'Li-Ion', 'liion'),
(32, 10, 3, '12 МП', '12mp'),
(32, 9, 3, 'microSDXC', 'microsdxc'),
(32, 8, 3, '32 ГБ', '32gb'),
(32, 5, 3, '4', '4'),
(32, 4, 3, 'Qualcomm MSM8996 Snapdragon 820', 'qualcommmsm8996snapdragon820'),
(33, 4, 3, 'A11', 'a11'),
(33, 5, 3, '6', '6'),
(33, 6, 3, '2.1 MГц', '21mgts'),
(33, 8, 3, '64 ГБ', '64gb'),
(33, 10, 3, '12 МП', '12mp'),
(33, 11, 3, '7 МП', '7mp'),
(33, 12, 3, 'OLED', 'oled'),
(33, 13, 3, '5.8', '58'),
(23, 6, 2, '2.3 MHz', '23mhz'),
(23, 15, 3, '4000 мА·ч', '4000mach'),
(29, 14, 3, 'Li-Polymer', 'lipolymer'),
(30, 14, 3, 'Li-Polymer', 'lipolymer'),
(32, 12, 3, 'Super AMOLED', 'superamoled'),
(30, 13, 2, '5.8', '58'),
(33, 13, 2, '5.8', '58'),
(30, 15, 3, '3000 мА·ч', '3000mach'),
(33, 15, 3, '2716 мА·ч', '2716mach'),
(29, 14, 2, 'Li-Polymer', 'lipolymer'),
(23, 7, 2, 'Mali-G72 MP3', 'malig72mp3'),
(32, 13, 2, '5.5', '55'),
(30, 17, 2, 'Nano-SIM', 'nanosim'),
(23, 17, 2, 'Nano-SIM', 'nanosim'),
(23, 16, 3, '2 SIM', '2sim'),
(29, 17, 2, 'Nano-SIM', 'nanosim'),
(31, 1, 2, 'IOS', 'ios'),
(33, 3, 2, '#000000', '000000'),
(23, 17, 3, 'Nano-SIM', 'nanosim'),
(29, 16, 3, '2 SIM', '2sim'),
(30, 3, 3, '#000000', '000000'),
(21, 5, 1, '8', '8'),
(32, 3, 3, '#c0c0c0', 'c0c0c0'),
(33, 2, 3, '3 ГБ', '3gb'),
(33, 1, 3, 'IOS', 'ios'),
(33, 3, 3, '#000000', '000000'),
(31, 5, 1, '4', '4'),
(31, 4, 1, 'A10', 'a10'),
(31, 2, 1, '2 ГБ', '2gb'),
(31, 1, 1, 'IOS', 'ios'),
(31, 3, 1, '#000000', '000000'),
(23, 4, 1, 'Exynos 9610', 'exynos9610'),
(23, 3, 1, '#ff9900', 'ff9900'),
(23, 3, 1, '#c0c0c0', 'c0c0c0'),
(23, 3, 1, '#0000ff', '0000ff'),
(23, 1, 1, 'Android', 'android'),
(23, 2, 1, '4 GB', '4gb'),
(23, 3, 1, '#000000', '000000'),
(23, 4, 2, 'Exynos 9610', 'exynos9610'),
(23, 2, 2, '4 GB', '4gb'),
(23, 1, 2, 'Android', 'android'),
(23, 3, 2, '#0000ff', '0000ff'),
(23, 3, 2, '#c0c0c0', 'c0c0c0'),
(23, 3, 2, '#ff9900', 'ff9900'),
(23, 2, 3, '4 ГБ', '4gb'),
(23, 3, 3, '#0000ff', '0000ff'),
(23, 3, 3, '#c0c0c0', 'c0c0c0'),
(23, 3, 3, '#ff9900', 'ff9900'),
(23, 1, 3, 'Android', 'android'),
(32, 14, 2, 'Li-Ion', 'liion'),
(32, 11, 3, '5 MP', '5mp'),
(30, 14, 2, 'Li-Polymer', 'lipolymer'),
(33, 12, 2, 'OLED', 'oled'),
(30, 13, 3, '5.8', '58'),
(31, 6, 2, '2.3 MHz', '23mhz'),
(31, 15, 3, '1960 мА·ч', '1960mach'),
(33, 10, 2, '12 MP', '12mp'),
(29, 15, 3, '3700 мА·ч', '3700mach'),
(32, 15, 2, '3000 mAh', '3000mah'),
(31, 5, 2, '4', '4'),
(29, 16, 2, '2 SIM', '2sim'),
(33, 8, 2, '64 GB', '64gb'),
(30, 15, 2, '3000 mAh', '3000mah'),
(32, 7, 3, 'Qualcomm Adreno 530', 'qualcommadreno530'),
(32, 17, 2, 'Nano-SIM', 'nanosim'),
(32, 6, 3, '2.6 MГц', '26mgts'),
(30, 7, 3, 'ARM Mali-G71', 'armmalig71'),
(29, 12, 1, 'Super AMOLED', 'superamoled'),
(23, 3, 2, '#000000', '000000'),
(29, 13, 1, '6.7', '67'),
(29, 14, 1, 'Li-Polymer', 'lipolymer'),
(29, 15, 1, '3700 мА·ч', '3700mach'),
(29, 16, 1, '2 SIM', '2sim'),
(29, 17, 1, 'Nano-SIM', 'nanosim'),
(29, 4, 2, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 2, '8 GB', '8gb'),
(29, 1, 2, 'Android', 'android'),
(29, 3, 2, '#999999', '999999'),
(29, 4, 3, 'Qualcomm Snapdragon 730', 'qualcommsnapdragon730'),
(29, 2, 3, '8 ГБ', '8gb'),
(29, 1, 3, 'Android', 'android'),
(29, 3, 3, '#999999', '999999'),
(30, 16, 2, '2 SIM', '2sim'),
(31, 4, 2, 'A10', 'a10'),
(33, 5, 2, '6', '6'),
(31, 17, 3, 'Nano-SIM', 'nanosim'),
(30, 4, 3, 'Exynos 7884', 'exynos7884'),
(32, 2, 3, '4 ГБ', '4gb'),
(31, 15, 2, '1960 mAh', '1960mah'),
(32, 1, 3, 'Android', 'android'),
(33, 1, 2, 'IOS', 'ios'),
(31, 2, 2, '2 GB', '2gb'),
(30, 1, 3, 'Android', 'android'),
(33, 11, 1, '7 МП', '7mp'),
(33, 12, 1, 'OLED', 'oled'),
(32, 12, 1, 'Super AMOLED', 'superamoled'),
(32, 13, 1, '5.5', '55'),
(32, 14, 1, 'Li-Ion', 'liion'),
(32, 15, 1, '3000 мА·ч', '3000mach'),
(32, 17, 1, 'Nano-SIM', 'nanosim'),
(32, 2, 2, '4 GB', '4gb'),
(32, 1, 2, 'Android', 'android'),
(32, 3, 2, '#c0c0c0', 'c0c0c0'),
(32, 13, 3, '5.5', '55'),
(32, 14, 3, 'Li-Ion', 'liion'),
(32, 15, 3, '3000 мА·ч', '3000mach'),
(32, 17, 3, 'Nano-SIM', 'nanosim'),
(31, 3, 2, '#000000', '000000'),
(31, 4, 3, 'A10', 'a10'),
(31, 2, 3, '2 ГБ', '2gb'),
(31, 1, 3, 'IOS', 'ios'),
(31, 3, 3, '#000000', '000000'),
(30, 1, 2, 'Android', 'android'),
(30, 3, 2, '#000000', '000000'),
(30, 16, 3, '2 SIM', '2sim'),
(30, 17, 3, 'Nano-SIM', 'nanosim'),
(29, 17, 3, 'Nano-SIM', 'nanosim'),
(28, 1, 1, 'Android', 'android'),
(28, 2, 1, '1 ГБ', '1gb'),
(28, 4, 1, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 5, 1, '8', '8'),
(28, 6, 1, '1.6 MГц', '16mgts'),
(28, 7, 1, 'ARM Mali-T830', 'armmalit830'),
(28, 8, 1, '8 ГБ', '8gb'),
(28, 9, 1, 'microSD', 'microsd'),
(28, 10, 1, '8 МП', '8mp'),
(28, 11, 1, '5 МП', '5mp'),
(28, 12, 1, 'IPS', 'ips'),
(28, 13, 1, '5', '5'),
(28, 14, 1, 'Li-Ion', 'liion'),
(28, 15, 1, '2600 мА·ч', '2600mach'),
(28, 16, 1, '2 SIM', '2sim'),
(28, 17, 1, 'micro-SIM', 'microsim'),
(28, 9, 2, 'microSD', 'microsd'),
(28, 8, 2, '8 GB', '8gb'),
(28, 7, 2, 'ARM Mali-T830', 'armmalit830'),
(28, 6, 2, '1.6 MHz', '16mhz'),
(28, 5, 2, '8', '8'),
(28, 4, 2, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 2, 2, '1 GB', '1gb'),
(28, 1, 2, 'Android', 'android'),
(28, 1, 3, 'Android', 'android'),
(28, 2, 3, '1 ГБ', '1gb'),
(28, 4, 3, 'Samsung Exynos 7870', 'samsungexynos7870'),
(28, 5, 3, '8', '8'),
(28, 6, 3, '1.6 MГц', '16mgts'),
(28, 7, 3, 'ARM Mali-T830', 'armmalit830'),
(28, 8, 3, '8 ГБ', '8gb'),
(28, 9, 3, 'microSD', 'microsd'),
(28, 10, 3, '8 МП', '8mp'),
(28, 11, 3, '5 МП', '5mp'),
(28, 12, 3, 'IPS', 'ips'),
(28, 13, 3, '5', '5'),
(28, 14, 3, 'Li-Ion', 'liion'),
(28, 15, 3, '2600 мА·ч', '2600mach'),
(28, 16, 3, '2 SIM', '2sim'),
(28, 17, 3, 'micro-SIM', 'microsim'),
(23, 3, 3, '#000000', '000000'),
(28, 10, 2, '8 MP', '8mp'),
(28, 11, 2, '5 MP', '5mp'),
(28, 12, 2, 'IPS', 'ips'),
(28, 13, 2, '5', '5'),
(28, 14, 2, 'Li-Ion', 'liion'),
(28, 15, 2, '2600 mAh', '2600mah'),
(28, 16, 2, '2 SIM', '2sim'),
(28, 17, 2, 'micro-SIM', 'microsim'),
(33, 15, 2, '2716 mAh', '2716mah'),
(33, 17, 2, 'Nano-SIM', 'nanosim'),
(33, 17, 3, 'Nano-SIM', 'nanosim'),
(31, 17, 2, 'Nano-SIM', 'nanosim'),
(21, 6, 1, '1.8 MГц', '18mgts'),
(21, 7, 1, 'Mali-G71 MP2', 'malig71mp2'),
(21, 8, 1, '32 ГБ', '32gb'),
(21, 9, 1, 'microSD', 'microsd'),
(21, 10, 1, '16 + 5', '165'),
(21, 11, 1, '16 МП', '16mp'),
(21, 12, 1, 'Super AMOLED', 'superamoled'),
(21, 13, 1, '6.4', '64'),
(21, 14, 1, 'Li-Ion', 'liion'),
(21, 15, 1, '4000 мА·ч', '4000mach'),
(21, 16, 1, '2 SIM', '2sim'),
(21, 1, 2, 'Android', 'android'),
(21, 2, 2, '3 GB', '3gb'),
(21, 4, 2, 'Exynos 7 Octa 7904', 'exynos7octa7904'),
(21, 5, 2, '8', '8'),
(21, 6, 2, '1.8 MHz', '18mhz'),
(21, 7, 2, 'Mali-G71 MP2', 'malig71mp2'),
(21, 8, 2, '32 GB', '32gb'),
(21, 9, 2, 'microSD', 'microsd'),
(21, 10, 2, '16 + 5', '165dvojnaya'),
(21, 11, 2, '16 MP', '16mp'),
(21, 12, 2, 'Super AMOLED', 'superamoled'),
(21, 13, 2, '6.4', '64'),
(21, 14, 2, 'Li-Ion', 'liion'),
(21, 15, 2, '4000 mAh', '4000mah'),
(21, 16, 2, '2 SIM', '2sim'),
(21, 17, 2, 'Nano-SIM', 'nanosim'),
(34, 13, 1, '1.1', '11'),
(34, 8, 1, '4 ГБ', '4gb'),
(34, 12, 1, 'Super AMOLED', 'superamoled'),
(34, 1, 1, 'Tizen', 'tizen'),
(35, 13, 1, '1.1', '11'),
(35, 8, 1, '4 ГБ', '4gb'),
(35, 12, 1, 'Super AMOLED', 'superamoled'),
(35, 1, 1, 'Tizen', 'tizen'),
(12, 1, 1, 'Tizen', 'tizen'),
(12, 12, 1, 'Super AMOLED', 'superamoled'),
(12, 13, 1, '1.1', '11'),
(33, 13, 1, '5.8', '58'),
(33, 15, 1, '2716 мА·ч', '2716mach'),
(33, 17, 1, 'Nano-SIM', 'nanosim'),
(33, 1, 1, 'IOS', 'ios'),
(33, 3, 1, '#000000', '000000'),
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
(21, 4, 1, 'Exynos 7 Octa 7904', 'exynos7octa7904'),
(21, 2, 1, '3 ГБ', '3gb'),
(21, 1, 1, 'Android', 'android'),
(21, 17, 1, 'Nano-SIM', 'nanosim'),
(39, 13, 2, '6.1', '61'),
(39, 14, 1, 'Li-Ion', 'liion'),
(39, 13, 1, '6.1', '61'),
(39, 12, 1, 'OLED', 'oled'),
(39, 11, 1, '12 МП', '12mp'),
(39, 10, 1, '12 Мп + 12 Мп', '12mp12mp'),
(39, 9, 1, 'Нет', 'net'),
(39, 8, 1, '256 ГБ', '256gb'),
(39, 6, 1, '3.1 MГц', '31mgts'),
(39, 8, 1, '64 ГБ', '64gb'),
(39, 8, 1, '128 ГБ', '128gb'),
(39, 5, 1, '6', '6'),
(39, 4, 1, 'Apple A14 Bionic', 'applea14bionic'),
(39, 2, 1, '4 ГБ', '4gb'),
(39, 1, 1, 'IOS', 'ios'),
(39, 3, 1, '#ffffff', 'ffffff'),
(39, 3, 1, '#ff0000', 'ff0000'),
(39, 3, 1, '#99cc00', '99cc00'),
(39, 3, 1, '#0000ff', '0000ff'),
(39, 12, 2, 'OLED', 'oled'),
(39, 11, 2, '12 MP', '12mp'),
(39, 10, 2, '12 MP + 12 MP', '12mp12mp'),
(39, 9, 2, 'No', 'no'),
(39, 8, 2, '256 GB', '256gb'),
(39, 6, 2, '3.1 MHz', '31mhz'),
(39, 8, 2, '64 GB', '64gb'),
(39, 8, 2, '128 GB', '128gb'),
(39, 5, 2, '6', '6'),
(39, 4, 2, 'Apple A14 Bionic', 'applea14bionic'),
(39, 2, 2, '4 GB', '4gb'),
(39, 1, 2, 'IOS', 'ios'),
(39, 3, 2, '#ffffff', 'ffffff'),
(39, 3, 2, '#ff0000', 'ff0000'),
(39, 3, 2, '#99cc00', '99cc00'),
(39, 15, 1, '2775 мА·ч', '2775mach'),
(39, 16, 1, '1 SIM', '1sim'),
(39, 17, 1, 'Nano-SIM', 'nanosim'),
(39, 14, 2, 'Li-Ion', 'liion'),
(39, 15, 2, '2775 mAh', '2775mah'),
(39, 16, 2, '1 SIM', '1sim'),
(39, 17, 2, 'Nano-SIM', 'nanosim'),
(39, 3, 1, '#000000', '000000'),
(39, 3, 2, '#0000ff', '0000ff'),
(39, 3, 2, '#000000', '000000'),
(39, 1, 3, 'IOS', 'ios'),
(39, 2, 3, '4 ГБ', '4gb'),
(39, 4, 3, 'Apple A14 Bionic', 'applea14bionic'),
(39, 5, 3, '6', '6'),
(39, 6, 3, '3.1 MГц', '31mgts'),
(39, 8, 3, '64 ГБ', '64gb'),
(39, 8, 3, '128 ГБ', '128gb'),
(39, 8, 3, '256 ГБ', '256gb'),
(39, 9, 3, 'Немає', 'nemae'),
(39, 10, 3, '12 Мп + 12 Мп', '12mp12mp'),
(39, 11, 3, '12 МП', '12mp'),
(39, 12, 3, 'OLED', 'oled'),
(39, 13, 3, '6.1', '61'),
(39, 14, 3, 'Li-Ion', 'liion'),
(39, 15, 3, '2775 мА·ч', '2775mach'),
(39, 16, 3, '1 SIM', '1sim'),
(39, 17, 3, 'Nano-SIM', 'nanosim'),
(12, 1, 2, 'Tizen', 'tizen'),
(12, 1, 3, 'Tizen', 'tizen'),
(34, 1, 3, 'Tizen', 'tizen'),
(34, 1, 2, 'Tizen', 'tizen'),
(35, 1, 2, 'Tizen', 'tizen'),
(35, 1, 3, 'Tizen', 'tizen');

-- --------------------------------------------------------

--
-- Структура таблицы `t_orders`
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
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `payment_details` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(1024) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) NOT NULL,
  `weight` float(14,2) NOT NULL,
  `separate_delivery` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lang_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_orders`
--

INSERT INTO `t_orders` (`id`, `delivery_id`, `delivery_price`, `payment_method_id`, `paid`, `payment_date`, `closed`, `date`, `user_id`, `name`, `address`, `phone`, `email`, `comment`, `status`, `url`, `payment_details`, `ip`, `total_price`, `note`, `discount`, `coupon_discount`, `coupon_code`, `weight`, `separate_delivery`, `modified`, `lang_id`) VALUES
(1, 1, '0.00', 3, 0, '0000-00-00 00:00:00', 1, '2021-05-10 21:17:52', 0, 'Иванов Иван Иванович', '', '', 'mail@site.com', '', 1, '38e5d32630b318737c03eb544deddbd5', '', '', '1309.42', '', '0.00', '0.00', '', 0.00, 0, '2021-05-10 18:17:52', 1),
(2, 1, '0.00', 1, 0, '0000-00-00 00:00:00', 1, '2021-05-15 15:19:59', 0, 'Шилина Юлия', '', '', 'shilinayulya@site.com', '', 2, '94670643965fcf1f5f8ae4604f073f10', '', '', '750.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-15 12:20:29', 1),
(3, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-05-16 16:24:02', 0, 'Артемий Иванов', 'Москва, Шоссе Энтузиастов 56', '545-65-34', 'ai@mail.ru', '', 1, 'fa1b494a7004358b4987c29f9cd8a7fe', '', '', '795.15', '', '5.00', '0.00', '', 0.00, 0, '2021-05-16 13:36:18', 1),
(4, 1, '0.00', 4, 1, '0000-00-00 00:00:00', 1, '2021-05-12 08:32:55', 0, 'John Smith', ' 633 W College Ave, York, PA ; 906 E Market St, York, PA ; 561 Linden Ave, York, PA ', '207-767-0718', 'johnsmith@site.com', '', 2, 'da6e81cd23b0e9a3e66913adfa1cbaf0', '', '', '1296.87', '', '10.00', '0.00', '', 0.00, 0, '2021-05-12 05:32:55', 1),
(5, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-05-13 21:35:43', 0, 'Константин Мельников', 'Москва, ул. Строителей 3', '333-23-23', 'mmkzz78@yandex.ru', '', 0, '35e6c462f2f349dea6941fb2350cf32e', '', '', '1253.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-13 18:35:43', 1),
(6, 1, '0.00', 2, 1, '0000-00-00 00:00:00', 0, '2021-05-20 21:47:16', 0, 'Соколов Виталий', 'г. Харьков ул. Молодежная 34', '123456789', 'socolvzz34@gmail.com', '', 3, '37c6c99e6ee164d64a4fa76b78fef632', '', '', '1692.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-20 19:46:32', 3),
(7, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-05-10 12:48:21', 0, 'Сергей Петров', '', '', 'mail123@site.com', '', 1, 'fa96fccd519a211023a6402471aa02d2', '', '', '1953.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-20 18:50:04', 1),
(8, 0, '0.00', 3, 1, '0000-00-00 00:00:00', 1, '2021-05-10 21:51:23', 0, 'Наталья Петрова', '', '', 'petrovamail@site.com', '', 2, 'c3146961b7460c4d25a0bd35c993bad7', '', '', '98.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-10 18:51:23', 1),
(9, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-05-10 21:53:36', 0, 'Анатолий Алексеев', '', '', 'alex@site.com', '', 3, 'f46d90f4284abb451e2492ff23eccfeb', '', '', '279.99', '', '0.00', '0.00', '', 0.00, 0, '2021-05-10 18:54:39', 1),
(10, 1, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-05-20 21:58:41', 0, 'Андрей Кузнецов', '', '', 'kuz888@site.com', '', 0, '9bdb3edb7928ba2acb14f1b5f7d903aa', '', '', '1061.68', '', '0.00', '0.00', '', 0.00, 0, '2021-05-20 18:58:41', 1),
(11, 0, '0.00', 0, 0, '0000-00-00 00:00:00', 0, '2021-05-20 22:00:51', 0, 'Женя', '', '', 'gheka@site.com', '', 3, '53b5383e5ce0c5ee35899ba629dff4e4', '', '', '2194.14', '', '0.00', '0.00', '', 0.00, 0, '2021-05-21 23:01:00', 1),
(12, 2, '0.00', 0, 0, '0000-00-00 00:00:00', 1, '2021-05-20 22:02:41', 0, 'Антонина Попова', '', '+7(888)888-88-88', 'antonina7899@site.com', '', 1, 'c1de5e6970cdcda6aa218817618cf5d9', '', '', '470.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-20 19:02:41', 1),
(13, 1, '0.00', 5, 0, '0000-00-00 00:00:00', 0, '2021-05-18 14:04:15', 0, 'Сергей Иванов', '', '', 'me@example.com', '', 0, '42bc4be54c0ce1a8fdcf1e2e769a16d0', '', '', '417.00', '', '0.00', '0.00', '', 0.00, 0, '2021-05-21 23:07:07', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `t_orders_labels`
--

DROP TABLE IF EXISTS `t_orders_labels`;
CREATE TABLE `t_orders_labels` (
  `order_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_orders_labels`
--

INSERT INTO `t_orders_labels` (`order_id`, `label_id`) VALUES
(1, 2),
(3, 2),
(5, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `t_pages`
--

DROP TABLE IF EXISTS `t_pages`;
CREATE TABLE `t_pages` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `header` varchar(1024) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_pages`
--

INSERT INTO `t_pages` (`id`, `parent_id`, `url`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `menu_id`, `position`, `visible`, `header`, `last_modified`) VALUES
(1, 0, '', 'Главная', 'Главная', 'Этот магазин является демонстрацией скрипта интернет-магазина  Turbo . Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.', 'Главная', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href=\"https://turbo-cms.com/\">Turbo</a>. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.</p>', 1, 1, 1, 'Главная', '2021-01-10 01:05:58'),
(2, 0, 'products', 'Все товары', 'Все товары', '', 'Все товары', '', 2, 2, 1, 'Все товары', '2021-01-01 14:46:00'),
(3, 0, '404', '404', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 2, 3, 1, 'Страница не найдена', '2020-12-31 04:24:46'),
(4, 0, 'sitemap', 'Карта сайта', 'Карта сайта', 'Карта сайта', 'Карта сайта', '', 3, 18, 1, 'Карта сайта', '2021-01-01 15:17:18'),
(5, 0, 'new', 'Новинки', 'Новинки', '', 'Новинки', '', 2, 5, 1, 'Новинки', '2021-01-01 14:46:28'),
(6, 0, 'featured', 'Рекомендуемые', 'Рекомендуемые', '', 'Рекомендуемые', '', 2, 6, 1, 'Рекомендуемые', '2021-01-01 14:47:48'),
(7, 0, 'sale', 'Распродажа', 'Распродажа', '', 'Распродажа', '', 2, 7, 1, 'Распродажа', '2021-01-01 14:48:48'),
(8, 0, 'hit', 'Хиты', 'Хиты', '', 'Хиты', '', 2, 8, 1, 'Хиты', '2021-01-01 14:48:30'),
(9, 0, 'wishlist', 'Избранное', 'Избранное', '', 'Избранное', '', 2, 9, 1, 'Избранное', '2021-01-01 14:49:27'),
(10, 0, 'compare', 'Сравнение', 'Сравнение', '', 'Сравнение', '', 2, 10, 1, 'Сравнение', '2021-01-01 14:50:14'),
(11, 0, 'oplata', 'Оплата', 'Оплата', 'Наличными курьеру \r\n Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа. \r\n Яндекс.Деньги \r\n Яндекс.Деньги &mdash; доступный и безопасный способ платить за товары и услуги через интернет. \r\n Банковская карта \r\n Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги. \r\n Через терминал \r\n Оплатите наличными через многочисленные терминалы в любом городе России. Можно запл', 'Оплата', '<h2>Наличными курьеру</h2>\r\n<p>Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p>\r\n<h2>Яндекс.Деньги</h2>\r\n<p>Яндекс.Деньги&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет.</p>\r\n<h2>Банковская карта</h2>\r\n<p>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</p>\r\n<h2>Через терминал</h2>\r\n<p>Оплатите наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</p>\r\n<h2>Со счета мобильного телефона</h2>\r\n<p>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</p>\r\n<h2>Webmoney</h2>\r\n<p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p>\r\n<h2>Квитанция</h2>\r\n<p>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</p>\r\n<h2>Робокасса</h2>\r\n<p>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</p>\r\n<h2>PayPal</h2>\r\n<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>\r\n<h2>Оплата через Интеркассу</h2>\r\n<p>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</p>\r\n<h2>Оплата картой через Liqpay.com</h2>\r\n<p>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</p>\r\n<h2>Оплата через Pay2Pay</h2>\r\n<p>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</p>\r\n<h2>Оплатить через QIWI</h2>\r\n<p>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</p>\r\n<h2>Наличными в офисе Автолюкса</h2>\r\n<p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 1, 11, 1, 'Оплата', '2021-01-10 01:05:58'),
(12, 0, 'delivery', 'Доставка', 'Доставка', 'Курьерская доставка по Москве \r\nКурьерская доставка осуществляется на следующий день после оформления заказа, если товар есть в наличии. Курьерская доставка осуществляется в пределах Томска и Северска ежедневно с 10.00 до 21.00. Заказ на сумму свыше 300 рублей доставляется бесплатно.  Стоимость бесплатной доставки раcсчитывается от суммы заказа с учтенной скидкой. В случае если сумма заказа после применения скидки менее 300р, осуществляется платная доставка.  При сумме заказа менее 300 рублей ст', 'Доставка', '<h2>Курьерская доставка по&nbsp;Москве</h2>\r\n<p>Курьерская доставка осуществляется на следующий день после оформления заказа,&nbsp;если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно.<br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р,&nbsp;осуществляется платная доставка.<br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p>\r\n<h2>Самовывоз</h2>\r\n<p>Удобный,&nbsp;бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва,&nbsp;ул. Арбат,&nbsp;1/3,&nbsp;офис 419.</p>\r\n<h2>Доставка с&nbsp;помощью предприятия&nbsp;&laquo;Автотрейдинг&raquo;</h2>\r\n<p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис&nbsp;&laquo;Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации&nbsp;(сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза,&nbsp;иначе компания&nbsp;&laquo;Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p>\r\n<h2>Наложенным платежом</h2>\r\n<p>При доставке заказа наложенным платежом с помощью&nbsp;&laquo;Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 1, 12, 1, 'Доставка', '2021-01-10 01:05:58'),
(13, 0, 'blog', 'Блог', 'Блог', '', 'Блог', '', 1, 13, 1, 'Блог', '2021-01-10 01:05:58'),
(14, 0, 'contact', 'Контакты', 'Контакты', 'Москва, шоссе Энтузиастов 45/31, офис 453 \r\nТелефон: (123) 456-78-90', 'Контакты', '<p>Москва, шоссе Энтузиастов 45/31, офис 453</p>\r\n<p>Телефон: (123) 456-78-90</p>\r\n<p><iframe style=\"border: 0;\" tabindex=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2244.995568814811!2d37.748330116259496!3d55.758579180554854!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x414acaad7a99045d%3A0xbcd5235cf8b0f3b3!2z0YguINCt0L3RgtGD0LfQuNCw0YHRgtC-0LIsIDQ1LzMxLCA0NTMsINCc0L7RgdC60LLQsCwg0KDQvtGB0YHQuNGPLCAxMTExMjM!5e0!3m2!1sru!2sua!4v1609513338246!5m2!1sru!2sua\" width=\"100%\" height=\"450\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" aria-hidden=\"false\"></iframe></p>', 1, 14, 1, 'Контакты', '2021-01-10 01:05:58'),
(15, 0, 'brands', 'Бренды', 'Бренды', '', 'Бренды', '', 3, 15, 1, 'Бренды', '2021-01-01 15:17:18'),
(16, 0, 'articles', 'Статьи', 'Статьи', '', 'Статьи', '', 3, 16, 1, 'Статьи', '2021-01-01 15:17:18'),
(17, 0, 'catalog', '', '', '', '', '', 3, 4, 1, '', '2021-01-01 15:17:18'),
(18, 0, 'search', 'Поиск', 'Поиск', '', 'Поиск', '', 3, 17, 1, 'Поиск', '2021-01-01 15:17:18'),
(22, 0, 'catalog/smartfony/operatingsystem-ios', 'Смартфоны на ios', 'Смартфоны на ios', 'Смартфоны операционная система: ios', 'Смартфоны на ios', '<p>Смартфоны операционная система: ios</p>', 4, 23, 1, 'Смартфоны на ios', '2021-05-25 06:25:41'),
(23, 0, 'catalog/smartfony/operatingsystem-android', 'Смартфоны на android', 'Смартфоны на android', 'Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться. ', 'Смартфоны на android', '<p>Телефоны на &laquo;Андроиде&raquo; снабжены огромным количеством неоспоримых преимуществ, выделяющих их на фоне продукции конкурентов. Такой смартфон подойдет человеку, которого нервирует навязчивое фирменное ПО и виджеты, с наличием которых приходится мириться.</p>\r\n<p>Покупка смартфона Android &mdash; отличное решение и для тех, кто желает быстро получать актуальные обновления и пользоваться всеми возможностями, предоставляемыми ОС. Многие известные производители, конкурируя друг с другом, предлагают покупателям новые модели телефонов на Android в любых ценовых категориях.</p>', 4, 24, 1, 'Смартфоны на android', '2021-05-25 06:25:41'),
(21, 0, 'catalog/smartfony/brand-samsung', 'Смартфоны Samsung', 'Смартфоны Samsung', 'Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.', 'Смартфоны Samsung', '<p>Смартфоны Samsung занимают практически лидирующие позиции на рынке высокотехнологичных устройств. Компания выпускает флагманы премиум-класса, такие как Galaxy S20, Galaxy Z Flip; смартфоны среднего сегмента Galaxy S10 Lite, Galaxy A71 и варианты экономкласса.</p>', 4, 22, 1, 'Смартфоны Samsung', '2021-05-25 06:25:41'),
(24, 0, 'catalog/smartfony/brand-apple', 'Смартфоны Apple', 'Смартфоны Apple', 'Смартфоны Apple представлены в широком ассортименте', 'Смартфоны Apple', '<p>Смартфоны Apple представлены в широком ассортименте</p>', 4, 21, 1, 'Смартфоны Apple', '2021-05-25 06:25:41');

-- --------------------------------------------------------

--
-- Структура таблицы `t_payment_methods`
--

DROP TABLE IF EXISTS `t_payment_methods`;
CREATE TABLE `t_payment_methods` (
  `id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `currency_id` float NOT NULL,
  `settings` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_payment_methods`
--

INSERT INTO `t_payment_methods` (`id`, `module`, `name`, `description`, `currency_id`, `settings`, `enabled`, `position`) VALUES
(1, 'YandexMoneyApi', 'Яндекс Касса', '<p>Яндекс.Касса &mdash; российский платёжный провайдер, сервис по приёму платежей через интернет в пользу юридических лиц, индивидуальных предпринимателей и некоммерческих организаций.</p>', 1, 'a:12:{s:17:\"yandex_api_shopid\";s:0:\"\";s:19:\"yandex_api_password\";s:0:\"\";s:18:\"yandex_api_paymode\";s:5:\"kassa\";s:22:\"yandex_api_paymenttype\";s:0:\"\";s:27:\"yandex_description_template\";s:0:\"\";s:23:\"ya_kassa_api_send_check\";s:1:\"1\";s:16:\"ya_kassa_api_tax\";s:1:\"1\";s:25:\"ya_kassa_api_payment_mode\";s:15:\"full_prepayment\";s:28:\"ya_kassa_api_payment_subject\";s:9:\"commodity\";s:32:\"ya_kassa_api_send_second_receipt\";s:1:\"1\";s:34:\"ya_kassa_api_second_receipt_status\";s:1:\"0\";s:14:\"ya_kassa_debug\";s:1:\"1\";}', 1, 1),
(2, 'Liqpay', 'Оплата картой через Liqpay', '<p>LiqPay &mdash; платежная система, позволяющая проводить оплату банковскими картами MasterСard и VISA, а также наличными через терминалы самообслуживания Приватбанка. Оплата возможна после входа в аккаунт через номер мобильного телефона.</p>', 1, 'a:2:{s:17:\"liqpay_public_key\";s:0:\"\";s:18:\"liqpay_private_key\";s:0:\"\";}', 1, 2),
(3, 'null', 'Оплата наличными курьеру', '<p>Если вы не хотите предварительно оплачивать заказ, у вас есть возможность рассчитаться с курьером наличными в момент получения посылки. Чтобы процесс был максимально комфортным и для вас, и для курьера, рекомендуем заранее подготовить нужную сумму.</p>', 1, 'N;', 1, 3),
(4, 'Paypal', 'PayPal', '<p>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</p>', 1, 'a:2:{s:8:\"business\";s:0:\"\";s:4:\"mode\";s:4:\"real\";}', 1, 4),
(5, 'WayForPay', 'Оплата через WayForPay', '<p>WayForPay &mdash; это онлайн-сервис с оплатой через банковские карты платежных систем VISA и MasterCard. Доступные методы платежа: Приват 24, терминал, сервис обслуживает прием платежей через систему Bitcoin.</p>', 1, 'a:3:{s:18:\"wayforpay_merchant\";s:0:\"\";s:19:\"wayforpay_secretkey\";s:0:\"\";s:18:\"wayforpay_language\";s:2:\"RU\";}', 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `t_products`
--

DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `body` longtext NOT NULL,
  `rating` float(3,1) NOT NULL DEFAULT '0.0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` tinyint(1) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hit` tinyint(1) NOT NULL,
  `to_export` tinyint(1) NOT NULL,
  `external_id` varchar(36) NOT NULL,
  `sale_to` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_products`
--

INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_export`, `external_id`, `sale_to`, `last_modified`) VALUES
(1, 'apple-ipad-mini', NULL, 'Apple iPad mini', '<p>Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;</p>', '<p><strong>СОВСЕМ КАК БОЛЬШОЙ</strong>&nbsp;<br /><br />iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone. И поддержка Apple Pencil, чтобы вам было ещё проще следовать за вдохновением. Это все тот же iPad mini, но теперь он умеет больше.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ. ПОРТАТИВНЫЙ. КАРМАННЫЙ</strong>&nbsp;<br /><br />iPad mini невероятно компактный и легкий, поэтому без труда составит вам компанию, где бы вы ни находились. Он весит меньше 400 г при толщине 6,1 мм и прекрасно помещается в карман или сумку. Его очень удобно держать в руке и можно быстро достать из кармана, когда этого потребует вдохновение.&nbsp;<br /><br /><strong>ПРОИЗВОДИТЕЛЬНОСТЬ ВЫХОДИТ ЗА РАМКИ РАЗМЕРА</strong>&nbsp;<br /><br />Мощь и интеллект iPad mini обеспечиваются процессором A12 Bionic с системой Neural Engine. Используя технологии машинного обучения, процессор быстро распознает закономерности, предлагает свои варианты и учится на основе полученного опыта. Работа в Adobe Photoshop CC, дополненная реальность, захватывающие игры с графикой консольного уровня - мощности хватит на все.&nbsp;<br /><br /><strong>ДЕЛО НЕ В РАЗМЕРЕ ДИСПЛЕЯ, А В КАЧЕСТВЕ ПИКСЕЛЕЙ</strong>&nbsp;<br /><br />iPad mini оснащен великолепным дисплеем 7,9 дюйма, который отображает более 3 миллионов пикселей. И Apple извлекли максимум из каждого. Высокая яркость, широкий цветовой охват и антибликовое покрытие позволяют использовать iPad mini в любых условиях. Неважно, что вы делаете: читаете книгу в парке или монтируете видео дома - изображение и текст всегда будут выглядеть максимально четко и естественно. А технология True Tone автоматически настраивает баланс белого с учетом освещения, поэтому теперь цвета будут смотреться еще натуральнее.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры на iPad mini позволяют снимать потрясающие фотографии и видео. И это далеко не все. Вы можете общаться с друзьями по FaceTime, сканировать документы, делать в них пометки или даже планировать перестановку мебели с помощью технологий AR (дополненной реальности).&nbsp;<br /><br /><strong>APPLE PENCIL. ОТЛИЧНО ВПИСЫВАЕТСЯ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) раскрывает в iPad миллион новых возможностей. С ним iPad mini превратится в невероятно удобный цифровой блокнот. Делайте записи от руки, заполняйте формы и подписывайте документы. Или подойдите к делу творчески: делайте наброски и рисунки прямо на ходу.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />Благодаря iOS на компактном iPad mini можно выполнять задачи, которые вы ставите перед iPad. Пользуйтесь несколькими приложениями одновременно, перемещайте файлы простыми жестами Multi-Touch, открывайте любимые приложения из панели Dock. А с приложением \"Файлы\" весь ваш контент будет всегда под рукой.&nbsp;<br /><br /><strong>МИЛЛИОН ВОЗМОЖНОСТЕЙ В ОДНОМ IPAD MINI</strong>&nbsp;<br /><br />На iPad mini установлены отличные приложения Apple для повседневных задач - Фото, Карты, Сообщения, Почта, Safari и другие. А в App Store доступно еще более миллиона приложений для iPad - среди них легко найти необходимые именно вам. Монтируйте видео, общайтесь в социальных сетях, делайте наброски или погружайтесь в увлекательные сетевые игры.&nbsp;<br /><br /><strong>ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ ТОЛЬКО ВАМ</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad mini разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad mini. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 0.0, 0, 1, 1, 'Apple iPad mini', 'Apple iPad mini, Apple, Планшеты', 'СОВСЕМ КАК БОЛЬШОЙ    iPad mini идеально сочетает в себе компактность и производительность - за это его и любят. Теперь для любви появилось еще больше поводов. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 7,9 дюйма с технологией True Tone', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(2, 'samsung-galaxy-tab', 2, 'Samsung Galaxy Tab', '<p>Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;</p>', '<p><strong>МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ</strong>&nbsp;<br /><br />Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.&nbsp;<br /><br /><strong>SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ ПРОДУКТИВНОСТИ ВАШЕЙ РАБОТЫ</strong>&nbsp;<br /><br />Режим Samsung DeX впервые стал совместимым с планшетом Samsung Galaxy Tab S4. Теперь высокая продуктивность работы на ПК стала доступной и на планшете. Многозадачный режим работы доступен через HDMI адаптер без использования док-станции Samsung DeX или DeX pad, для большей эффективности можно добавить клавиатуру, мышь или монитор.&nbsp;<br /><br /><strong>ГОТОВ ДЛЯ РАБОТЫ</strong>&nbsp;<br /><br />Все под рукой для рабочего режима. Рабочий стол на экране планшета Galaxy Tab S4 реализован как на обычном ПК, т.е. с панелью задач, поддержкой многооконного режима и функцией перетаскивания файлов. Если вы хотите иметь на экране привычный рабочий стол, просто запустите Samsung DeX через панель быстрого доступа и добавьте Android-совместимую клавиатуру и мышь.&nbsp;<br /><br /><strong>РАБОТАЙТЕ БОЛЕЕ ЭФФЕКТИВНО</strong>&nbsp;<br /><br />Продуктивность вашей работы зависит от того, насколько комфортна рабочая среда. Именно здесь может помочь использование Samsung DeX с внешним монитором. На большом экране монитора вы можете продолжать пользоваться Android интерфейсом вашего планшета. Либо смотреть на монитор, а планшет использовать как тачпад, панель с S Pen или сенсорную клавиатуру.&nbsp;<br /><br /><strong>ОН НЕ ВЫКЛЮЧЕН - ОН В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />Если у вас возникла новая идея, зафиксируйте ее на экране планшета, чтобы не забыть. Благодаря функции записи заметок на выключенном экране планшета Galaxy Tab S4, вы можете быстро записать ваши мысли даже на черном экране с помощью многофункционального электронного пера S Pen. Тончайший 0,7-мм резиновый кончик пера позволяет легко и точно делать заметки и рисовать эскизы.&nbsp;<br /><br /><strong>УЛУЧШЕННЫЕ РАБОЧИЕ ХАРАКТЕРИСТИКИ</strong>&nbsp;<br /><br />Скорость передачи данных Samsung Galaxy Tab S4 в режиме LTE достигает 1 Гбит/с, так что у вас будет достаточно времени и для других дел. А благодаря наличию в планшете 64 Гб встроенной памяти и возможности расширения ее до 400 Гб с помощью слота для MicroSD карт памяти, у вас будет достаточно места для хранения ваших документов и видео.&nbsp;<br /><br /><strong>ПОГРУЗИТЕСЬ В АТМОСФЕРУ РАЗВЛЕЧЕНИЙ</strong>&nbsp;<br /><br />Несмотря на компактные размеры, планшет Galaxy Tab S4 оснащен большим по площади визуальным пространством для работы. Благодаря максимально узкой рамке и отсутствию логотипа Samsung и кнопки Home, диагональ экрана реально составляет 10,5 дюймов. А улучшенное соотношение сторон 16:10 sAMOLED экрана создает эффект более полного погружения при просмотре вашего любимого контента.&nbsp;<br /><br /><strong>ОКРУЖИТЕ СЕБЯ ЗВУКОМ ВЫСОКОГО КАЧЕСТВА</strong>&nbsp;<br /><br />Четыре динамика, настроенные специалистами всемирно известной компании AKG, обеспечивают звук как в реальной жизни. Теперь вы можете экспериментировать с функцией адаптивного аудио, созданной экспертами AKG. А технология Dolby Atmos обеспечивает объемный 3D звук, благодаря чему происходящее на экране не отличимо от реальности.&nbsp;<br /><br /><strong>СМОТРИТЕ ВИДЕО, НЕ ДУМАЯ О ВРЕМЕНИ</strong>&nbsp;<br /><br />Galaxy Tab S4 оснащен батареей емкостью 7300 мАч, позволяющей просматривать видео до 16 часов, так что вы сможете смотреть ваши любимые фильмы или сериалы, не думая о времени. А если батарея разрядится, то благодаря функции быстрой зарядки, вы сможете полностью зарядить ее всего за 200 минут.&nbsp;<br /><br /><strong>ПОЛЕЗНЫЙ ДАЖЕ В РЕЖИМЕ ОЖИДАНИЯ</strong>&nbsp;<br /><br />В спящем режиме планшет Galaxy Tab S4 превращается в умный домашний дисплей. Если планшет заряжается или \"спит\", то с помощью функции Daily Board вы можете настроить режим отображения на экране ваших любимых фотографий. Кроме того, планшет может быть полезным помощником и отображать на экране не просто текущий прогноз погоды, но также дату и время, выполняя роль календаря.&nbsp;<br /><br /><strong>РАЗБЛОКИРОВКА С ПОМОЩЬЮ РАДУЖКИ ГЛАЗА</strong>&nbsp;<br /><br />Кроме технологии распознавания лиц Galaxy Tab S4 теперь поддерживает функцию сканирования радужки глаза. Для разблокировки вашего планшета достаточно отсканировать ваше лицо или радужку глаз. Встроенная система шифрования и защищенная папка в сочетании с функциями биоидентификации обеспечат безопасность ваших файлов и приложений.&nbsp;<br /><br /><strong>МНОГОУРОВНЕВАЯ СИСТЕМА ЗАЩИТЫ</strong>&nbsp;<br /><br />Держите ваши данные под надежной защитой. Платформа безопасности Samsung Knox активизируется с момента включения вашего планшета. Многоуровневая система защиты в реальном времени помещает ваши данные в защищенную папку, доступ к которой есть только у вас. Храните ваши рабочие и личные данные отдельно.&nbsp;</p>', 0.0, 0, 1, 2, 'Samsung Galaxy Tab', 'Samsung Galaxy Tab, Samsung, Планшеты', 'МНОГОЗАДАЧНОСТЬ БЕЗ ГРАНИЦ    Созданный с учетом вашей занятости и необходимости постоянно работать \"на ходу\", новый планшет Samsung Galaxy Tab S4 станет вашим лучшим спутником в развлечениях и работе в многозадачном режиме.    SAMSUNG DEX ДЛЯ УВЕЛИЧЕНИЯ', '2020-12-31 03:55:00', 0, 1, 0, 0, '', NULL, '2021-01-09 01:32:22'),
(3, 'apple-ipad-air', 1, 'Apple iPad Air', '<p>iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;</p>', '<p><strong>ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ</strong>&nbsp;<br /><br />iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard. Кроме того, при толщине всего 6,1 мм iPad Air весит менее 500 г - вы легко сможете всегда держать его при себе.&nbsp;<br /><br /><strong>ВСЕ, ЧТО ВАМ НУЖНО. НИКАКОГО ЛИШНЕГО ВЕСА</strong>&nbsp;<br /><br />Несмотря на большой дисплей Retina 10,5 дюйма, iPad Air очень компактный. Он отлично подходит для решения самых разных задач буквально на ходу. Для этого он оснащен самыми передовыми технологиями беспроводной связи, а также аккумулятором, который работает без подзарядки до 10 часов. То есть почти целый день.&nbsp;<br /><br /><strong>ДОСТАТОЧНО МОЩИ ДЛЯ ВСЕГО И СРАЗУ</strong>&nbsp;<br /><br />Мощь и интеллект iPad Air обеспечиваются процессором A12 Bionic с системой Neural Engine. Процессор задействует технологии машинного обучения в режиме реального времени и открывает невероятные возможности для фотографии, игр, дополненной реальности и многого другого. Вы можете редактировать видео, делать впечатляющие презентации, проектировать 3D?модели, смотреть любимые сериалы онлайн. И делать все это одновременно.&nbsp;<br /><br /><strong>СВЕРХБЫСТРАЯ ГРАФИКА ДЛЯ ИГР И ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Потрясающая производительность в приложениях с дополненной реальностью, невероятные графические возможности, фотореалистичная графика в 3D-играх - за всем этим стоит 4-ядерная графическая система процессора A12 Bionic.&nbsp;<br /><br /><strong>ВСЕ ДЕЛАЕТСЯ КРАСИВО</strong>&nbsp;<br /><br />iPad Air оснащен дисплеем Retina 10,5 дюйма с широким цветовым охватом. На этот дисплей хочется смотреть бесконечно. Фотографии, видео и игры выглядят живо и естественно вплоть до мельчайших деталей. И независимо от внешних условий, технология True Tone, повышенная яркость и антибликовое покрытие помогут сделать изображение максимально качественным.&nbsp;<br /><br /><strong>TRUE TONE. ЛЕГКО ДЛЯ ГЛАЗ ПРИ ЛЮБОМ ОСВЕЩЕНИИ</strong>&nbsp;<br /><br />Технология True Tone автоматически настраивает баланс белого с учетом внешнего освещения. Поэтому изображение на дисплее выглядит более естественно и комфортно для глаз в любых условиях - и во время вечернего чтения, и когда вы рисуете солнечный пейзаж на пленэре.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ. СНИМАЙТЕ В HD. ИГРАЙТЕ В AR</strong>&nbsp;<br /><br />Камеры iPad Air позволяют снимать потрясающие фотографии и HD-видео 1080p. И это далеко не все. Можно общаться по FaceTime с несколькими собеседниками, сканировать и сразу отправлять документы. И даже создавать собственные миры - камеры iPad Air отлично работают с технологиями augmented reality (дополненной реальности).&nbsp;<br /><br /><strong>ИГРАЙТЕ, РАБОТАЙТЕ И ЗАНИМАЙТЕСЬ ТВОРЧЕСТВОМ В ДОПОЛНЕННОЙ РЕАЛЬНОСТИ</strong>&nbsp;<br /><br />Когда виртуальные объекты и данные становятся частью реального мира, перед вами открываются совершенно новые горизонты. Камеры на передней и задней панелях, процессор A12 Bionic с системой Neural Engine, большой дисплей с естественной цветопередачей и точное отслеживание движения делают iPad идеальным устройством для жизни в дополненной реальности.&nbsp;<br /><br /><strong>ПИШИТЕ. РИСУЙТЕ. СЛЕДУЙТЕ ЗА ВДОХНОВЕНИЕМ</strong>&nbsp;<br /><br />Apple Pencil (продается отдельно) передает движения руки с потрясающей точностью и скоростью. Его удобно держать в руке, как обычный карандаш. При этом он умеет намного больше. С Apple Pencil ваш iPad Air может стать блокнотом или холстом художника - у вас множество вариантов.&nbsp;<br /><br /><strong>ДЕЛАЙТЕ ЗАМЕТКИ. КОММЕНТИРУЙТЕ ДОКУМЕНТЫ И СКРИНШОТЫ. И МНОГОЕ ДРУГОЕ</strong>&nbsp;<br /><br />Делать заметки или записывать идеи на iPad Air так же легко, как на обычном листе бумаги. Вы можете размечать документы, дополнять заметки рисунками, делать снимки экрана и добавлять к ним комментарии.&nbsp;<br /><br /><strong>IOS. ПОМОЖЕТ ВАМ РАСКРЫТЬ ПОТЕНЦИАЛ IPAD</strong>&nbsp;<br /><br />iOS - это передовая мобильная операционная система, которая позволяет управлять iPad Air простыми касаниями. В Apple называют их жестами, и они обеспечивают полный доступ ко всем возможностям большого дисплея и интеллектуальным технологиям iPad Air. С функцией многозадачности вы сможете одновременно пользоваться любимыми приложениями - достаточно просто выбрать их на панели Dock. А файлы можно перемещать из одного приложения в другое и сортировать в приложении \"Файлы\" так, как вам удобно.&nbsp;<br /><br /><strong>ВСЕ ВАШИ ФАЙЛЫ СОБРАНЫ ВМЕСТЕ</strong>&nbsp;<br /><br />Приложение \"Файлы\" дает возможность работать с контентом, который может храниться на iPad Air, в iCloud Drive или других облачных сервисах, таких как Box и Dropbox. В любом случае, файлы всегда будут доступны - легко и просто.&nbsp;<br /><br /><strong>ВАШ IPAD ОТВЕЧАЕТ ВАШИМ ИНТЕРЕСАМ</strong>&nbsp;<br /><br />На iPad Air установлены отличные приложения Apple для повседневных задач, такие как Фото, Карты, Сообщения, Почта и Safari. Мощные приложения Pages, Numbers и Keynote помогут в работе, а GarageBand и iMovie уже готовы стать вашими любимыми творческими инструментами.&nbsp;<br /><br /><strong>БОЛЕЕ МИЛЛИОНА ПРИЛОЖЕНИЙ ДЛЯ IPAD В APP STORE</strong>&nbsp;<br /><br />В App Store можно найти любые приложения: для фотографии, рисования, офисной работы и многого другого. Разработчики проектируют их с учетом впечатляющей производительности и большого дисплея iPad Air, а также делают совместимыми с Apple Pencil. И каждый день в App Store появляются рекомендации новых интересных приложений.&nbsp;<br /><br /><strong>ВАША ЛИЧНАЯ ИНФОРМАЦИЯ ПРИНАДЛЕЖИТ ТОЛЬКО ВАМ. И ТОЧКА</strong>&nbsp;<br /><br />Как и все продукты Apple, iPad Air разрабатывался с учетом строгих требований к защите личной информации. Touch ID - это простая и надежная система аутентификации на iPad Air. А с помощью Apple Pay можно быстро и безопасно оплачивать покупки. Просто прикоснитесь к датчику Touch ID - и готово.&nbsp;</p>', 0.0, 0, 1, 3, 'Apple iPad Air', 'Apple iPad Air, Apple, Планшеты', 'ВСЕМ ЛЮБИТЕЛЯМ МОЩНЫХ ТЕХНОЛОГИЙ    iPad Air открывает широкий доступ к самым передовым разработкам Apple. Процессор A12 Bionic с системой Neural Engine. Дисплей Retina 10,5 дюйма с технологией True Tone. Поддержка Apple Pencil и клавиатуры Smart Keyboard', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(4, 'dji-mavic-air', 3, 'DJI Mavic Air', '<p><strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении.</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Mavic Air</strong></strong>&nbsp;&ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы, идеально подходящие для просмотра в очках виртуальной реальности. Кроме того, пользователю доступно несколько сценариев селфи-видео &ndash; медленное отдаление, вращение по орбите, движение по спирали, резкий подъем и имитация полета бумеранга.</p>', 0.0, 0, 1, 4, 'DJI Mavic Air', 'DJI Mavic Air, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Mavic Air   &ndash; новая модель компактного дрона, которая стала еще меньше, быстрее, надежнее и удобнее в управлении. Его главное преимущество &ndash; расширенный функционал камеры, которая теперь может создавать сферические панорамы,', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(5, 'dji-mavic-pro-fly-more-combo', 3, 'DJI Mavic Pro', '<p>DJI Mavic Pro Fly More Combo&nbsp;&ndash; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя.</p>', '<p>Квадрокоптер&nbsp;DJI Mavic Pro Fly More Combo&nbsp;&ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно брать с собой в путешествия, на выездные фотосессии, на спортивные соревнования и на любые другие мероприятия.</p>', 0.0, 0, 1, 5, 'DJI Mavic Pro', 'DJI Mavic Pro, DJI, Квадрокоптеры', 'Квадрокоптер DJI Mavic Pro Fly More Combo &ndash; &laquo;младшая&raquo; модель беспилотного летательного аппарата от знаменитого производителя. Более компактный, чем Phantom, он легко помещается в рюкзак, не стесняющий движений пользователя. Его можно бра', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(6, 'dji-phantom-4-pro', 3, 'DJI Phantom 4 Pro', '<p>DJI Phantom 4 Pro&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с.&nbsp;</p>', '<p>Квадрокоптер&nbsp;<strong><strong>DJI Phantom 4 Pro</strong></strong>&nbsp;&ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим битрейт до 100 Мбит/с. Такие характеристики позволяют создавать полноразмерные серийные фотографии со скоростью до 14 кадров в секунду, а также записывать ролики с разрешением C4K (4096 х 2160) и частотой смены кадров до 60 в секунду. Пользователю остается только подобрать соответствующую карту памяти &ndash; ее максимальный объем достигает 128 Гб.</p>\r\n<div>\r\n<ul>\r\n<li><strong>Улучшенные динамические возможности</strong>. Несмотря на произведенное обновление технической части, масса квадрокоптера не выросла &ndash; этом способствовало применение рамы из магния, алюминия и титана. Устройство может проводить в воздухе до 30 минут, поднимаясь на высоту до 6 километров над уровнем моря. Максимальная скорость горизонтального полета равняется 20 м/с (72 км/ч), а подъема &ndash; 6 м/с (21,6 км/ч). Усовершенствованная двухдиапазонная система радиоуправления позволяет летательному аппарату обмениваться сигналами с пультом на дистанции до 7 км при отсутствии препятствий.</li>\r\n<li><strong>Полная безопасность</strong>. Система FlightAutonomy получила две новые микрокамеры и два инфракрасных датчика, расположенных по бокам. Благодаря этому квадрокоптер может распознавать препятствия даже при слабом освещении и автоматически исправлять курс, предотвращая столкновение. Такая функция полезна как для новичков, так и для профессиональных видеооператоров, которые получают возможность сосредоточиться на процессе съемки.</li>\r\n<li><strong>Удобное управление</strong>. На стандартном пульте нет ничего лишнего &ndash; летательным аппаратом можно управлять с помощью двух мини-джойстиков и двух кнопок. Все дополнительные функции активируются с помощью фирменного мобильного приложения. В стандартной версии пульт снабжен держателем для смартфона, а в модификации PLUS &ndash; выдвижным экраном с очень яркой подсветкой (1000 кд/м2), позволяющим рассмотреть все детали изображения даже при попадании на него прямых солнечных лучей.</li>\r\n<li><strong>Автоматические программы полета</strong>. Технология DRAW позволяет нарисовать курс квадрокоптера на сенсорном экране &ndash; устройство будет следовать ему на постоянной высоте, позволяя уделить максимум внимания точному наведению камеры. Кроме того, летательному аппарату можно просто показать конечную точку, к которой он доберется, обходя все препятствия. Для видеооператоров будут особенно полезными функции автоматического слежения за движущимся объектом и спуска затвора при распознавании жестов.</li>\r\n</ul>\r\n</div>', 0.0, 0, 1, 6, 'DJI Phantom 4 Pro', 'DJI Phantom 4 Pro, DJI, Квадрокоптеры', 'Квадрокоптер   DJI Phantom 4 Pro   &ndash; модернизированная модель знаменитого летательного аппарата. Его главное отличие от предыдущей версии представлено новой камерой с 20-мегапиксельным сенсором и высокопроизводительным процессором, обеспечивающим би', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(7, 'havit-g1-blackred', 4, 'Havit G1 Black/Red', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные.&nbsp;</p>', '<p>С беспроводными наушниками&nbsp;<strong>Havit G1</strong>, которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного заряда наушников хватает на 3.5 часа активного использования. Наушники защищены от пота и воды что дает возможность использовать наушники даже в экстремальных условиях нагрузки. А две акустические головки взорвут ваши тренировки на ура.</p>', 0.0, 0, 1, 7, 'Havit G1 Black/Red', 'Havit G1 Black/Red, Havit, Аксессуары', 'С беспроводными наушниками  Havit G1 , которые могут работать до 24 часов без подзарядки, ваши тренировки будут проходить более энергичные. Вы сможете заниматься спортом ещё дольше, а надёжные крепления наушников обеспечат вам максимальный комфорт. Одного', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2020-12-31 19:42:00'),
(8, '1more-quad-driver', 8, '1MORE Quad Driver', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>', '<p>Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона и 3 арматурных драйвера, отвечающие за низкие и высокие частоты.</p>\r\n<p><br />Частотный диапазон удивляет &ndash; от 20 Гц до 40 кГц, чувствительность наушников 99 дБ при сопротивлении 32 Ом. Пульт дистанционного управления имеет 3 кнопки (регулятор громкости, прием звонка) и микрофон с подавлением шумов и помех. Разъем mini jack 3,5 мм имеет форму буквы &laquo;L&raquo;, что обеспечивает его долговечность, даже при постоянном ношении в кармане вместе со смартфоном.</p>\r\n<p><br />Полимерная оплетка проводов устойчива к износу, истиранию и заломам, внутри конструкцию усиливает кевларовые нити. В комплекте стильная подарочная упаковка, жесткий чехол, переходник на 6,3 мм, авиаадаптер, а также 8 пар сменных амбушюр различного размера. Эти наушники созданы для бескомпромиссного наслаждения музыкой &ndash; лучший выбор для настоящих меломанов.</p>', 0.0, 0, 1, 8, '1MORE Quad Driver', '1MORE Quad Driver, 1More, Аксессуары', 'Проводные наушники данной модели завоевали награду LAAS в Лос-Анжелесе, благодаря непревзойденному качеству звучания и тонкой настройке от звукорежиссера Лука Бигнарди. В алюминиевом корпусе анатомической формы 4 излучателя &ndash; динамический из карбона', '2020-12-31 03:55:00', NULL, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(9, 'jbl-flip-4-red', 5, 'JBL Flip 4 Red', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 0.0, 0, 1, 9, 'JBL Flip 4 Red', 'JBL Flip 4 Red, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(10, 'jbl-flip-4-blue', 5, 'JBL Flip 4 Blue', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 0.0, 0, 1, 10, 'JBL Flip 4 Blue', 'JBL Flip 4 Blue, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(11, 'jbl-flip-4-black', 5, 'JBL Flip 4 Black', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>', '<p>JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий.</p>\r\n<p>Особенностью модели является технология шумо- и эхоподавления спикера, которая используется для получения кристально чистого звука. Также с помощью простого нажатия кнопки, вы можете активировать и поговорить с Siri или Google Now с вашего JBL Flip 4. Отсутствие помех, четкость звука делают связь необычайно качественной и комфортной.</p>\r\n<p>JBL Flip 4 &mdash; водонепроницаемая портативная колонка с диапазоном воспроизводимых частот 70 Гц - 20 кГц, которая гарантирует удивительно мощное и чистое воспроизведение вашей любимой музыки. Ее неоспоримые преимущества &mdash; высокая технологичность, практичность, неприхотливость и собственный узнаваемый стиль, которые позволяют JBL Flip 4 оставаться на высоте.</p>', 0.0, 0, 1, 11, 'JBL Flip 4 Black', 'JBL Flip 4 Black, JBL, Портативная акустика', 'JBL Flip 4 &mdash; это очередной флагман линейки Flip, который является следующим поколением в серии портативной акустики JBL Flip. Великолепная акустика уже успела получить ряд премий. \r\n Особенностью модели является технология шумо- и эхоподавления спик', '2020-12-31 03:55:00', 0, 0, 0, 0, '', NULL, '2020-12-31 19:41:36'),
(12, 'samsung-galaxy-watch-active-green', 2, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 0.0, 0, 1, 14, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2021-05-25 06:29:27'),
(13, 'apple-watch-4-black', 1, 'Apple Watch 4 Black', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 0.0, 0, 1, 15, 'Apple Watch 4 Black', 'Apple Watch 4 Black, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-01-08 23:55:09'),
(14, 'apple-watch-4-silver', 1, 'Apple Watch 4 Silver', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 0.0, 0, 1, 16, 'Apple Watch 4 Silver', 'Apple Watch 4 Silver, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-01-08 23:55:09'),
(15, 'apple-watch-4-white', 1, 'Apple Watch 4 White', '<p>Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.</p>', '<p><strong>НАЧИНАЕМ НОВУЮ ЖИЗНЬ</strong>&nbsp;<br /><br />Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.&nbsp;<br /><br /><strong>ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ</strong>&nbsp;<br /><br />Самый большой дисплей в линейке Apple Watch. Новый электрический датчик сердечной активности. Усовершенствованное колесико Digital Crown с тактильным откликом. Такие знакомые и вместе с тем принципиально новые Apple Watch Series 4 меняют все представления о возможностях часов.&nbsp;<br /><br /><strong>ПОЧУВСТВУЕТ. ПОЗАБОТИТСЯ. ПОДСКАЖЕТ</strong>&nbsp;<br /><br />Уведомления о слишком низком и высоком пульсе. Функции обнаружения падения и вызова экстренных служб. Новые циферблаты \"Дыхание\". Эти часы созданы, чтобы защищать вас и помогать вам вести более здоровый образ жизни.&nbsp;<br /><br /><strong>НА ПИКЕ ФОРМЫ ВМЕСТЕ С ВАМИ</strong>&nbsp;<br /><br />Автоматическое распознавание тренировок. Новые виды тренировок: йога и пеший туризм. Передовые функции для любителей бега, например измерение каденса и предупреждения об изменении темпа. При этом на экран можно вывести до пяти показателей, чтобы точно отслеживать свою статистику.&nbsp;<br /><br /><strong>МОТИВАЦИЯ. МОТИВАЦИЯ. МОТИВАЦИЯ</strong>&nbsp;<br /><br />Новый вид соревнований: один на один. Возможность делиться показателями активности с друзьями. Персональные тренерские подсказки. Ежемесячные мотивирующие цели. Виртуальные награды за достижения. Все, чтобы вдохновить вас закрывать кольца Активности каждый день.&nbsp;<br /><br /><strong>ВСЕ ВАЖНОЕ ПОД РУКОЙ</strong>&nbsp;<br /><br />Рация, телефонные звонки и сообщения. Музыка из Apple Music и приложение \"Подкасты\" от Apple. Новые возможности приложений с быстрыми командами Siri. Столько всего важного и нужного - прямо у вас на запястье.&nbsp;</p>', 0.0, 0, 1, 17, 'Apple Watch 4 White', 'Apple Watch 4 White, Apple, Часы', 'НАЧИНАЕМ НОВУЮ ЖИЗНЬ    Представляем Apple Watch Series 4. Часы с абсолютно новым дизайном и новыми технологиями. Они помогают вести еще более активный образ жизни, лучше следить за здоровьем и всегда оставаться на связи.    ИЗМЕНЕНИЯ, КОТОРЫЕ МЕНЯЮТ ВСЕ', '2020-12-31 03:55:01', 0, 1, 0, 0, '', NULL, '2021-01-22 22:44:57'),
(16, 'apple-airpods', 1, 'Apple AirPods', '<p><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span></p>', '<div class=\"product__column-item\" data-view-block=\"group_3\">\r\n<div class=\"product__group product__group--tabs\">\r\n<div id=\"opisanie-2\">\r\n<div class=\"product__section\">\r\n<div class=\"text\">\r\n<p><span id=\"result_box\" lang=\"ru\" tabindex=\"-1\"><strong><span title=\"Магія звуку\r\n\r\n\">Магия звука</span></strong><br /><br /><span title=\"Всі звикли, що аксесуари від Apple - це більше, ніж просто доповнення.\">Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.&nbsp;</span><span title=\"Це речі самодостатні і часто унікальні.\">Это вещи самодостаточные и часто уникальные.&nbsp;</span><span title=\"Саме так можна охарактеризувати і Apple AirPods.\">Именно так можно охарактеризовать и Apple AirPods.</span><span title=\"Нова бездротова гарнітура змінить ваше сприйняття простих і звичних всім речей.\">Новая беспроводная гарнитура изменит ваше восприятие простых и привычных всем вещей.</span><span title=\"Відсутність проводів, гідне якість звучання, неймовірний і стильний фірмовий дизайн - дані навушники безсумнівно заслуговують на увагу.\r\n\">Отсутствие проводов, достойное качество звучания, невероятный и стильный фирменный дизайн - данные наушники несомненно заслуживают внимания.</span><br /><strong><span title=\"Навіщо навушників процесор?\r\n\r\n\">Зачем наушников процессор?</span></strong><br /><br /><span title=\"У переліку технічних характеристик Apple AirPods ми можемо бачити процесор W1.\">В перечне технических характеристик Apple AirPods мы можем видеть процессор W1.&nbsp;</span><span title=\"Причому відповідає він в даній моделі не тільки для формування звукового сигналу.\">Причем отвечает он в данной модели не только для формирования звукового сигнала.&nbsp;</span><span title=\"Навушники знають, що ви робите в даний момент: використовуєте ви 1 або 2 навушника, говорите або слухаєте музику - система автоматично налаштується на необхідний режим, створить звукоізоляцію, поставить музику на паузу і включить знову.\r\n\">Наушники знают, что вы делаете в данный момент: Используете ли вы 1 или 2 наушника, говорите или слушаете музыку - система автоматически настроится на необходимый режим, создаст звукоизоляцию, поставить музыку на паузу и включить снова.</span><br /><strong><span title=\"Гідна автономність\r\n\r\n\">Достойная автономность</span></strong><br /><br /><span title=\"Але від мобільного гаджета потрібно не тільки спектр можливостей, але і можливість тривалої роботи.\">Но от мобильного гаджета нужно не только спектр возможностей, но и возможность длительной работы.&nbsp;</span><span title=\"Apple AirPods зможуть безперервно працювати на відтворення музики 5 годин.\">Apple AirPods смогут непрерывно работать на воспроизведение музыки 5:00.&nbsp;</span><span title=\"Використання чохла для підзарядки зробить вас автономним на добу.\">Использование чехла для подзарядки сделает вас автономным в сутки.&nbsp;</span><span title=\"При цьому 15 хвилин підзарядки дадуть вам ще 3 години музики і спілкування!\">При этом 15 минут подзарядки дадут вам еще 3:00 музыки и общения!</span></span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 0.0, 0, 1, 18, 'Apple AirPods', 'Apple AirPods, Apple, Аксессуары', 'Магия звука     Все привыкли, что аксессуары от Apple - это больше, чем просто дополнение.   Это вещи самодостаточные и часто уникальные.   Именно так можно охарактеризовать и Apple AirPods.  Новая беспроводная гарнитура изменит ваше восприятие простых и', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(17, 'motorola-moto-g6', 6, 'Motorola Moto G6', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo.</p>', '<p>Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизацией и практически полным отсутствием любых надстроек. Motorola Moto G6 Plus оснащается 5.9-дюймовым IPS<span class=\"\" data-expand-box=\"card_13405579\">&nbsp;экраном, который подарит долгие часы удовольствия от чтения или просмотра видео, благодаря большой диагонали, высокому разрешению и отличной цветопередаче. С комфортом выполнять повседневные задачи и даже поиграть в любые современные мобильные игры можно благодаря процессору Qualcomm Snapdragon 630. Вдобавок ко всему Motorola Moto G6 Plus имеет защиту от воды по стандарту IPX7, а еще одним приятным бонусом выступает модуль NFC.</span><span class=\"expand-text\" data-expand=\"roll\" data-expand-id=\"card_13405579\"><span class=\"\" data-expand-state=\"roll\" data-tracking-id=\"product-16\">&nbsp;&nbsp;</span></span></p>', 0.0, 0, 1, 19, 'Motorola Moto G6', 'Motorola Moto G6, Motorola, Мобильные телефоны', 'Motorola Moto G6 &ndash; смартфон для тех, кто хочет получить универсальное решение, сочетающее в себе отличное исполнение, неплохую производительность и все преимущества операционной системы Android 8.0 Oreo. Устройства компании славятся своей оптимизаци', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57');
INSERT INTO `t_products` (`id`, `url`, `brand_id`, `name`, `annotation`, `body`, `rating`, `votes`, `visible`, `position`, `meta_title`, `meta_keywords`, `meta_description`, `created`, `featured`, `is_new`, `is_hit`, `to_export`, `external_id`, `sale_to`, `last_modified`) VALUES
(18, 'nokia-42-ds-3', 7, 'Nokia 4.2 DS 3', '<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>', '<p><strong>Легче жизни совсем рядом - стоит только нажать кнопку</strong></p>\r\n<p>Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше он работает. Меньше времени по телефону - больше времени для радостей жизни.</p>\r\n<p><strong>Мы повысили требования к дизайну, а потом довели его до совершенства</strong></p>\r\n<p>Мастерство и утонченность - на каждый день. Толщина 8,4 мм. Качественное стекло 2.5D с закругленными углами с передней и задней стороны. Не телефон, а сплошное удовольствие держать в руке. Экран HD + 5,71 дюймов с соотношением сторон 19: 9 Сплошное удовольствие не только держать, но и смотреть. Батарея, которая подстраивается под вас и долго держит заряд.</p>\r\n<p><strong>Памятные вам моменты еще никогда не выглядели так эффектно</strong></p>\r\n<p>Делитесь эмоциями. С помощью двойной основной камерой и широкоугольной Селфи камеры все улыбки будут в кадре. Проявите свои творческие способности, используя новейшие функции, такие как режим боке и расширенное редактирование снимков.</p>\r\n<p><strong>Постоянно совершенствуется</strong></p>\r\n<p>Nokia 4.2 - Android One смартфон на чистой Android 9 Pie без сторонних программ. Ничего лишнего - плюс бесплатные обновления безопасности раз в месяц, не замедляют работу телефона.<br />Добавьте искусственный интеллект, который на основе своем опыте предложит необходимые функции приложений и поможет вам контролировать время, проведенное у экрана смартфона с помощью функции Цифровое благополучия.</p>', 0.0, 0, 1, 20, 'Nokia 4.2 DS 3', 'Nokia 4.2 DS 3, Nokia, Мобильные телефоны', 'Легче жизни совсем рядом - стоит только нажать кнопку  \r\n Когда под рукой Google Ассистент жизни набирает темп. Можно задавать вопросы, смотреть свое расписание или даже приглушить свет. Ассистент может многое. И чем дольше вы его используете, тем лучше о', '2020-12-31 03:55:01', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(19, 'samsung-galaxy-fold', 2, 'Samsung Galaxy Fold', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4380 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.<span id=\"hscc\"></span></p>', 0.0, 0, 1, 21, 'Samsung Galaxy Fold', 'Samsung Galaxy Fold, Samsung, Мобильные телефоны', 'Самсунг Галакси Fold &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный HD Super AMOLED Plus-дисплеем, отображающим до 16 млн. цветов, с диагональю 4.6\" и камерой на 13 Mpx. Оснащен оче', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(20, 'samsung-galaxy-s10', 2, 'Samsung Galaxy S10', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', '<p>Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), NFC, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 5.0, 1, 1, 22, 'Samsung Galaxy S10', 'Samsung Galaxy S10, Samsung, Мобильные телефоны', 'Самсунг Галакси S10 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9 Octa 9820 2700Mhz, оснащенный Curved Dynamic AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 16 Mpx. Оснащен о', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-25 01:03:09'),
(21, 'samsung-galaxy-a30', 2, 'Samsung Galaxy A30', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;</p>', 0.0, 0, 1, 23, 'Samsung Galaxy A30', 'Samsung Galaxy A30, Samsung, Мобильные телефоны', 'Самсунг Галакси A30 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 9610 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 16 Mpx. Оснащен очень мощным', '2020-12-31 03:55:01', NULL, 0, 1, 0, '', NULL, '2021-05-21 23:08:57'),
(22, 'samsung-galaxy-m30', NULL, 'Samsung Galaxy M30', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx.</p>', '<p>Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 5000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 0.0, 0, 1, 24, 'Samsung Galaxy M30', 'Samsung Galaxy M30, Samsung, Мобильные телефоны', 'Самсунг Галакси M30 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7904 1800Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку', '2020-12-31 03:55:01', 0, 0, 1, 0, '', NULL, '2021-05-21 23:08:57'),
(23, 'samsung-galaxy-a50', 2, 'Samsung Galaxy A50', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx.</p>', '<p>Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 5.0, 3, 1, 25, 'Samsung Galaxy A50', 'Samsung Galaxy A50, Samsung, Мобильные телефоны', 'Самсунг Галакси A50 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 25 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может', '2020-12-31 03:55:01', 1, 1, 1, 1, '', NULL, '2021-05-21 23:08:57'),
(24, 'samsung-galaxy-a10', 2, 'Samsung Galaxy A10', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 3400 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 0.0, 0, 1, 26, 'Samsung Galaxy A10', 'Samsung Galaxy A10, Samsung, Мобильные телефоны', 'Самсунг Галакси A10 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.2\" и камерой на 13 Mpx. Оснащен очень мощным акку', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(25, 'samsung-galaxy-a20', 2, 'Samsung Galaxy A20', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн.</p>', '<p>Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным аккумулятором на 4000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"></span></p>', 0.0, 0, 1, 27, 'Samsung Galaxy A20', 'Samsung Galaxy A20, Samsung, Мобильные телефоны', 'Самсунг Галакси A20 &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.4\" и камерой на 13 Mpx. Оснащен очень мощным акку', '2020-12-31 03:55:01', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(26, 'samsung-galaxy-a70', 2, 'Samsung Galaxy A70', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx.</p>', '<p>Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим&nbsp;до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.&nbsp;<span id=\"hscc\"><br /></span></p>', 0.0, 0, 1, 28, 'Samsung Galaxy A70', 'Samsung Galaxy A70, Samsung, Мобильные телефоны', 'Самсунг Галакси A70 &mdash; отличный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 32 Mpx. Оснащен очень мощным аккумулятором на 4500 mAh Для коммуникации может', '2020-12-31 03:55:02', 0, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(27, 'samsung-galaxy-a40', 2, 'Samsung Galaxy A40', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx.</p>', '<p>Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться&nbsp;в любом месте!<span id=\"hscc\"></span></p>', 0.0, 0, 1, 29, 'Samsung Galaxy A40', 'Samsung Galaxy A40, Samsung, Мобильные телефоны', 'Самсунг Галакси A40 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.9\" и камерой на 16 Mpx. Оснащен очень мощным аккумулятором на 3100 mAh Для коммуникации м', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(28, 'samsung-galaxy-a2', 2, 'Samsung Galaxy A2', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx.</p>', '<p>Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!<span id=\"hscc\"><br /></span></p>', 0.0, 0, 1, 30, 'Samsung Galaxy A2', 'Samsung Galaxy A2, Samsung, Мобильные телефоны', 'Самсунг Галакси A2 Core &mdash; отличный смартфон, работающий на платформе Android с процессором Exynos 7870 Mhz, оснащенный IPS-дисплеем, отображающим до 16 млн. цветов, с диагональю 5\" и камерой на 5 Mpx. Оснащен мощным аккумулятором на 2600 mAh Для ком', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(29, 'samsung-galaxy-a80', 2, 'Samsung Galaxy A80', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A80 &mdash; замечательный смартфон, работающий на платформе Android, оснащенный Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 6.7\" и камерой на 48 Mpx. Оснащен очень мощным аккумулятором на 3700 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте! Подробней с техническими характеристиками смартфона Galaxy A80 можно ознакомиться ниже.</p>', 0.0, 0, 1, 31, 'Samsung Galaxy A80', 'Samsung Galaxy A80, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.', '2020-12-31 03:55:02', 1, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(30, 'samsung-galaxy-a20e', 2, 'Samsung Galaxy A20e', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx.&nbsp;</p>', '<p>Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, WiFi, LTE (4G), стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм. Также стоит отметить, что он оснащен GPS-приемником, который позволит Вам не заблудиться в любом месте!</p>', 0.0, 0, 1, 32, 'Samsung Galaxy A20e', 'Samsung Galaxy A20e, Samsung, Мобильные телефоны', 'Самсунг Галакси A20e &mdash; отличный смартфон, работающий на платформе Android с 8х-ядерным процессором Exynos 7884 1600Mhz, оснащенный IPS LCD-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.8\" и камерой на 13 Mpx. Оснащен мощным аккумулятором', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(31, 'apple-iphone-7-jet-black', 1, 'Apple iPhone 7 Black', '<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>', '<p>ВЕЛИКОЛЕПНАЯ СЕМЕРКА</p>\r\n<p>Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch. iPhone 7 получил прекрасный Unibody-корпус в новых цветах с доработанным дизайном.</p>\r\n<p>ПРИТЯГИВАЕТ ВНИМАНИЕ</p>\r\n<p>iPhone 7 притягивает к себе внимание. Уникальный цвет &laquo;черный оникс&raquo; радует глаз благородной игрой света на глянцевой поверхности и гранях. Корпус защищен от брызг и воды. Обновлены кнопка &laquo;Домой&raquo; и дизайн Unibody.</p>\r\n<p>КНОПКА &laquo;ДОМОЙ&raquo;</p>\r\n<p>Стала сенсорной и получила чувствительность к силе нажатия. Благодаря встроенному Taptic Engine тактильный отклик при нажатии получил несколько уровней интенсивности. Чем сильнее нажатие на кнопку, тем сильнее отклик телефона &mdash; это новый опыт использования и восприятия.</p>\r\n<p>ВЛАГОЗАЩИТА КОРПУСА</p>\r\n<p>Конструкция корпуса iPhone изменилась и внутри. Смартфон нового поколения защищен по стандарту IP67 от влаги и пыли.</p>\r\n<p>КАРДИНАЛЬНО НОВЫЙ ВЗГЛЯД НА КАМЕРУ</p>\r\n<p>В iPhone 7 установлен новый модуль камеры с 6-линзовым объективом со светосилой &fnof;/1.8 и оптической стабилизацией. Сенсор стал в 2 раза быстрее. Вспышка с 4 диодами. Специальный ISP-процессор управляет работой камеры. Все это выводит качество снимков на новый уровень, особенно в условиях недостаточной освещенности. Фронтальная камера оснащена сенсором 7 Мп с улучшенным цветовым диапазоном. Получить четкие и яркие селфи теперь еще проще.</p>', 5.0, 1, 1, 33, 'Apple iPhone 7 Black', 'Apple iPhone 7 Black, Apple, Мобильные телефоны', 'Флагман оснастили новым 4-ядерным процессором Apple A10 Fusion. Появились стереодинамики и защита от влаги и пыли по стандарту IP67. Модуль камеры принципиально обновился. Кнопка &laquo;Домой&raquo; теперь поддерживает Force Touch.', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(32, 'smartfon-samsung-galaxy-s7-edge-sm-g935f-lte-serebristyj-titan', 2, 'Samsung Galaxy S7', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px.</p>', '<p>Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающей снимки с разрешением 4992 х 3744 px. Оснащен мощным аккумулятором на 3000 mAh Для коммуникации может предложить: WAP браузер, EDGE, HSDPA, HSPA, WiFi, LTE (4G), NFC, Ик-порт, стерео Bluetooth, и, конечно, USB-порт. Для любителей музыки есть аудио выход на 3.5 мм.</p>', 0.0, 0, 1, 34, 'Samsung Galaxy S7', 'Samsung Galaxy S7, Samsung, Мобильные телефоны', 'Самсунг Галакси S7 &mdash; замечательный смартфон, работающий на платформе Android с 8х-ядерным процессором Qualcomm Snapdragon 820 2300Mhz, оснащенный HD Super AMOLED-дисплеем, отображающим до 16 млн. цветов, с диагональю 5.1\" и камерой на 12 Mpx, делающ', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(33, 'apple-iphone-x-64gb-space-gray', 1, 'Apple iPhone X', '<p>Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;с переосмысленной системой управления.&nbsp;</p>', '<p>&nbsp;Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн&nbsp;<br />с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благодаря мощнейшей внутренней 64 битной архитектуре. Разительно улучшенная самая популярная в мире мобильная камера.&nbsp;<br />Именно таким видит свой флагманский смартфон компания Apple в 2017 году.</p>', 0.0, 0, 1, 35, 'Apple iPhone X', 'Apple iPhone X, Apple, Мобильные телефоны', 'Apple iPhone X &ndash; воплощение лучших инновационных решений. Абсолютно новый дизайн  с переосмысленной системой управления. Безрамочный дизайн выводит опыт использования на новый уровень. Корпус из стекла и металла. Совершенное аппаратное ядро, благода', '2020-12-31 03:55:02', NULL, 0, 0, 0, '', NULL, '2021-05-21 23:08:57'),
(34, 'samsung-galaxy-watch-active', 2, 'Samsung Galaxy Watch', '<p>Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!</p>', '<p><strong>ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE</strong>&nbsp;<br /><br />Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch Active!&nbsp;<br /><br /><strong>СВОБОДА НАЧИНАЕТСЯ СО СТИЛЯ</strong>&nbsp;<br /><br />Galaxy Watch Active выделят вас из толпы. Легкий и тонкий корпус в минималистичном дизайне с гладкой закругленной рамкой и гибкий ремешок обеспечат комфорт, практически не ощущаясь на руке, а значит Galaxy Watch Active идеально подойдут к вашему активному, насыщенному образу жизни. Подчеркните свою индивидуальность, выбрав один из четырех цветов: Черный сатин, Нежная пудра, Серебристый лед или Морская глубина. А совместимость с ремешками 20 мм подарит еще большую свободу в экспериментах со стилем.&nbsp;<br /><br /><strong>УТОНЧЕННОСТЬ ВО ВСЕМ</strong>&nbsp;<br /><br />Уникальные и красивые циферблаты Galaxy Watch Active и персонализированные функциональные виджеты прекрасно подойдут для различных активностей и случаев жизни. Улучшенное сенсорное управление обеспечивает дополнительный комфорт при использовании. Galaxy Watch Active - это гармония стильного дизайна и интуитивного интерфейса.&nbsp;<br /><br /><strong>ВАША ЕЖЕДНЕВНАЯ МОТИВАЦИЯ</strong>&nbsp;<br /><br />Ставьте ежедневные цели и следите за их достижением в реальном времени с Galaxy Watch Active - сделайте шаг к здоровым привычкам прямо сейчас. Сожженные калории, время тренировки, пройденное за последний час расстояние - три простых показателя, которые мотивируют и наполняют решимостью превзойти себя. Проверяйте свой прогресс в любое время, благодаря лаконичному, интуитивно понятному виджету. Станьте ближе к большим результатам с каждой маленькой ежедневной победой.&nbsp;<br /><br /><strong>СТРЕСС ПОД КОНТРОЛЕМ</strong>&nbsp;<br /><br />Жизнь бьет ключом: дедлайны, проекты, значимые личные моменты. Когда важно просто расслабиться и сделать глубокий вдох, на помощь придут Galaxy Watch Active. Они определят, что уровень стресса повышается, и предложат подсказки по дыханию, чтобы помочь совладать с напряжением.&nbsp;<br /><br /><strong>НА СТРАЖЕ ХОРОШЕГО САМОЧУВСТВИЯ</strong>&nbsp;<br /><br />Galaxy Watch Active - персональный гуру здоровья - синхронизируйте их с приложением Samsung Health для сбора и анализа статистики, получения сводки по результатам на одном экране и попробуйте еще десятки функций, позволяющих контролировать не только эффективность тренировок, но и общее самочувствие.&nbsp;<br /><br /><strong>БУДЬТЕ НА СВЯЗИ</strong>&nbsp;<br /><br />Отвечайте на сообщения с Galaxy Watch Active, используя конвертор речи в текст, с помощью эмоджи или интуитивно-понятной экранной клавиатуры, пока ваш смартфон на зарядке.&nbsp;<br /><br /><strong>ОТДЫХАЙТЕ ПОЛНОЦЕННО</strong>&nbsp;<br /><br />Galaxy Watch Active заботятся о вас днем и ночью. Гаджет отслеживает и фиксирует четыре фазы сна, сохраняя данные в профиле, а также анализирует качество сна, сравнивая его со средними показателями в вашей возрастной группе, тем самым помогая сформировать и улучшить режим. С Galaxy Watch Active ночь сулит глубокий и спокойный сон, а утро становится ярким и наполненным жизнью.&nbsp;<br /><br /><strong>ВСЕГДА РЯДОМ</strong>&nbsp;<br /><br />Galaxy Watch Active - друг, на которого можно положиться, ведь они способны проработать более 45 часов без подзарядки. А с функцией Беспроводной зарядки Powershare Galaxy Watch Active можно зарядить напрямую от смартфона, достаточно разместить их на задней панели Samsung Galaxy S10, чтобы быстро добавить необходимой энергии и продолжить наслаждаться всеми преимуществами использования этого замечательного гаджета.&nbsp;<br /><br /><strong>ДЛЯ ПОЛЬЗЫ И ДЛЯ ЗАБАВЫ</strong>&nbsp;<br /><br />Делу время, потехе час. Используйте библиотеку приложений Galaxy Apps, чтобы выбрать как самые удобные инструменты для выполнения ежедневных задач, так и приложения для занятий спортом, и различные игры, разработанные специально для круглого дисплея Galaxy Watch Active.&nbsp;</p>', 0.0, 0, 1, 13, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'ОТКРОЙТЕ СВОЙ МАКСИМУМ С GALAXY WATCH ACTIVE    Новые Galaxy Watch Active - это не только трекер для отслеживания активности, но и надежный личный ассистент, помогающий сфокусироваться на том, что важно именно вам. Живите \"на максималках\" с Galaxy Watch A', '2021-01-08 23:47:40', NULL, 0, 0, 0, '', NULL, '2021-05-25 06:29:49'),
(35, 'samsung-galaxy-watch', 2, 'Samsung Galaxy Watch', '<p>Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;</p>', '<p><strong>НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ</strong>&nbsp;<br /><br />Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.&nbsp;<br /><br /><strong>НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ</strong>&nbsp;<br /><br />Оригинальное дизайнерское решение Samsung Galaxy Watch предлагает возможность выбора объемного 3D циферблата с имитацией настоящих стрелок и звука тиканья, как никогда приближая опыт использования к ощущениям от традиционных механических часов.&nbsp;<br /><br /><strong>ВЫБЕРИТЕ СВОЙ СТИЛЬ</strong>&nbsp;<br /><br />Подчеркните свою индивидуальность с Galaxy Watch. Выберите модель, подходящую вам по цвету и размеру корпуса: с диаметром 42 мм (цвета Глубокий черный или Розовое золото) или 46 мм (цвет Серебристая сталь). Придайте образу завершенность, подобрав понравившийся дизайн циферблата и ремешка.&nbsp;<br /><br /><strong>ВСЕГДА АКТИВНЫЙ ЭКРАН</strong>&nbsp;<br /><br />Настройте режим Always On Display так, чтобы sAMOLED экран ваших Galaxy Watch показывал время всегда - без необходимости нажимать на кнопку включения или поворачивать безель.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ ФИТНЕС-ТРЕНЕР</strong>&nbsp;<br /><br />Выведите эффективность ваших тренировок на новый уровень с персональным тренером - Samsung Galaxy Watch! Ваше умное устройство измерит частоту сердечного ритма и автоматически зафиксирует различные типы активности. Выберите дополнительные активности для отслеживания из списка до 39 возможных вариантов.&nbsp;<br /><br /><strong>SAMSUNG HEALTH</strong>&nbsp;<br /><br />С помощью сервиса Samsung Health вы можете расширить существующие функции Galaxy Watch и еще более детально фиксировать параметры состояния вашего здоровья.&nbsp;<br /><br /><strong>НА СТРАЖЕ ЗДОРОВЬЯ ДНЕМ И НОЧЬЮ</strong>&nbsp;<br /><br />Все знают, насколько важен здоровый сон и как он влияет на самочувствие. Samsung Galaxy Watch проанализирует параметры вашего сна в течение ночи, фиксируя в журнале его фазы.&nbsp;<br /><br /><strong>ПЕРСОНАЛЬНЫЙ АССИСТЕНТ</strong>&nbsp;<br /><br />Galaxy Watch фиксирует ваше пробуждение и выводит на экран информацию о погоде, а также список дел на сегодня и напоминания. Сводка событий перед сном отобразит пропущенные напоминания, результаты тренировок и активности, погоду на завтра и состояние заряда аккумулятора.&nbsp;<br /><br /><strong>ТАЙМ-МЕНЕДЖМЕНТ</strong>&nbsp;<br /><br />Переведите Samsung Galaxy Watch в режим My Day для удобного и эффективного управления своим временем. Быстрый и удобный доступ к запланированным событиям, отслеживание времени до следующего оповещения и напоминания, которые не дадут ничего пропустить. Планируйте свой день эффективно и легко. Меньше времени на планы, больше на их реализацию.&nbsp;<br /><br /><strong>БОЛЬШАЯ БИБЛИОТЕКА ПРИЛОЖЕНИЙ</strong>&nbsp;<br /><br />Библиотека приложений Galaxy Apps позволит выбрать не только самые удобные инструменты для выполнения ежедневных задач, но и различные игры, разработанные специально для круглого дисплея Galaxy Watch.&nbsp;<br /><br /><strong>КОМПАКТНЫЙ НАВИГАТОР</strong>&nbsp;<br /><br />Встроенный модуль GPS поможет определить местонахождение и отследить маршрут движения. А встроенные альтиметр и барометр помогут, если вы решите сойти с намеченного маршрута.&nbsp;<br /><br /><strong>ОСТАВЬТЕ БУМАЖНИК ДОМА</strong>&nbsp;<br /><br />С помощью удобного и надежного сервиса бесконтактной оплаты Samsung Pay, покупки можно делать одним взмахом руки - вам даже не нужно вынимать из кармана смартфон или бумажник.&nbsp;<br /><br /><strong>ЗАРЯЖАЙТЕСЬ БЕЗ ПРОВОДОВ</strong>&nbsp;<br /><br />Зарядить аккумулятор проще простого. Поместите Galaxy Watch на беспроводное зарядное устройство и процесс подзарядки начнется автоматически.&nbsp;</p>', 0.0, 0, 1, 12, 'Samsung Galaxy Watch', 'Samsung Galaxy Watch, Samsung, Часы', 'НЕТ ПРЕДЕЛА СОВЕРШЕНСТВУ    Знакомьтесь: ваш проводник в мир персональной эффективности. Samsung Galaxy Watch - это сочетание элегантного дизайна классических часов с передовыми технологиями из мира умных гаджетов.    НОВЫЙ ВЗГЛЯД НА АУТЕНТИЧНОСТЬ    Ориг', '2021-01-08 23:53:01', NULL, 0, 0, 0, '', NULL, '2021-05-25 06:30:08'),
(39, 'apple-iphone-12', 1, 'Apple iPhone 12', '<p>У всех новинок традиционно самый быстрый процессор Apple и поддержка 5G. Ещё из общего &mdash; самый прочный экран за всю историю iPhone.</p>', '<h3>Плоский и дерзкий</h3>\r\n<p>Apple iPhone 12 &mdash; это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое &laquo;железо&raquo;, в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-1.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Невероятно прочный</h3>\r\n<p>Apple iPhone 12 заключен в корпус из алюминия с плоскими боковыми гранями. Всю переднюю панель занимает прекрасный 6,1-дюймовый OLED-дисплей с технологией Super Retina XDR. В этом смартфоне впервые представлена совершенно новая технология покрытия &mdash; Ceramic Shield. Это стекло с нановкраплениями прозрачной керамики, которые делают его невероятно прочным. Теперь вы можете не бояться уронить смартфон &mdash; вероятность разбить экран при падении теперь меньше в 4 раза.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-2.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Потрясающе быстрый</h3>\r\n<p>Работает Apple iPhone 12 на мощнейшем чипе нового поколения A14 Bionic. Общая производительность смартфона по сравнению с предыдущей моделью выросла на 40%. 4-ядерный графический ускоритель стал на 30% мощнее, а улучшенный 16‑ядерный нейропроцессор Neural Engine работает в 10 раз быстрее своего предшественника. При этом энергопотребление нового процессора сократилось. Любые приложения, любые операции этот смартфон выполнит без малейшей задержки. В iPhone 12 стало возможно выполнять сложнейшие алгоритмы обработки и машинного обучения: лучше всего это заметно в невероятных возможностях его камер.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone12-3.jpg\" alt=\"\" width=\"1024\" height=\"537\" /></p>\r\n<h3>Заменяет киностудию</h3>\r\n<p>iPhone 12 получил две камеры: широкоугольную и сверхширокоугольную. Прекрасные камеры Apple в этом году получили апгрейд за счет совершенствования технологий обработки изображений. Теперь ночной режим поддерживается для обоих модулей. Это значит, что снимки, сделанные при недостаточном освещении, станут более детализированными и четкими. Кроме того, в ночном режиме теперь можно снимать таймлапс. Видео новый смартфон может снимать в режиме HDR 4K в стандарте Dolby Vision, это абсолютный рекорд не только среди камер смартфонов, но и среди многих профессиональных видеокамер.</p>\r\n<p><img class=\"fn_img_zoom img-fluid\" src=\"../files/uploads/apple-iphone-12-4.png\" alt=\"\" width=\"1023\" height=\"772\" /></p>\r\n<h3>Инновационно красив</h3>\r\n<p>Apple iPhone 12 поставляется в 5 цветах: стандартных белом и черном, специальном PRODUCT(RED), доходы с продаж которого направляются в фонд борьбы с COVID-19, зелёном и в новом цвете 2020 года &mdash; синем. Корпус телефона защищен от влаги по стандарту IP68, такая защита позволит вам плавать, не вынимая телефон из кармана. А на задней панели корпуса теперь находится магнитное крепление, благодаря которому iPhone удобно класть на беспроводную зарядку, а, при желании, на заднюю панель вы сможете &laquo;приклеить&raquo; специальные чехлы и карманы для карт, которые в этом году также впервые анонсировал производитель.</p>', 5.0, 8, 1, 39, 'Apple iPhone 12', 'Apple iPhone 12, Apple, Мобильные телефоны', 'Apple iPhone 12 — это один из самых мощных смартфонов 2020 года. Внутри у него находится самое передовое «железо», в то же время его дизайн оценят и те, кто переходит с предыдущих версий, и любители классических iPhone 4 и iPhone 5.', '2021-01-23 18:29:10', 1, 1, 1, 0, '', NULL, '2021-05-21 23:10:14');

-- --------------------------------------------------------

--
-- Структура таблицы `t_products_categories`
--

DROP TABLE IF EXISTS `t_products_categories`;
CREATE TABLE `t_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_products_categories`
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
-- Структура таблицы `t_products_videos`
--

DROP TABLE IF EXISTS `t_products_videos`;
CREATE TABLE `t_products_videos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_products_videos`
--

INSERT INTO `t_products_videos` (`id`, `product_id`, `position`, `link`) VALUES
(33, 23, 33, 'https://www.youtube.com/watch?v=itC7JmGXeeE'),
(32, 23, 32, 'https://www.youtube.com/watch?v=RwMvGbEWd94'),
(65, 39, 65, 'https://www.youtube.com/watch?v=65JrtwtTOdc'),
(64, 39, 64, 'https://www.youtube.com/watch?v=cnXapYkboRQ');

-- --------------------------------------------------------

--
-- Структура таблицы `t_purchases`
--

DROP TABLE IF EXISTS `t_purchases`;
CREATE TABLE `t_purchases` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `variant_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `variant_name` varchar(255) NOT NULL,
  `variant_color` varchar(25) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_purchases`
--

INSERT INTO `t_purchases` (`id`, `order_id`, `product_id`, `variant_id`, `product_name`, `variant_name`, `variant_color`, `price`, `amount`, `sku`) VALUES
(1, 1, 39, 67, 'Apple iPhone 12', '256 ГБ', 'Черный', '1309.42', 1, '675360'),
(2, 2, 23, 37, 'Samsung Galaxy A50', '128 ГБ', 'Оранжевый', '600.00', 1, '002'),
(3, 2, 10, 10, 'JBL Flip 4 Blue', '', '', '150.00', 1, ''),
(4, 3, 18, 18, 'Nokia 4.2 DS 3', '', '', '238.00', 1, ''),
(5, 3, 20, 20, 'Samsung Galaxy S10', '', '', '599.00', 1, ''),
(6, 4, 16, 16, 'Apple AirPods', '', '', '210.00', 1, ''),
(7, 4, 3, 3, 'Apple iPad Air', '', '', '279.99', 1, ''),
(8, 4, 15, 15, 'Apple Watch 4 White', '', '', '503.00', 1, ''),
(9, 4, 33, 36, 'Apple iPhone X', '', '', '447.98', 1, '0001'),
(10, 5, 19, 19, 'Samsung Galaxy Fold', '', '', '1253.00', 1, ''),
(11, 6, 5, 5, 'DJI Mavic Pro', '', '', '1692.00', 1, ''),
(12, 7, 6, 6, 'DJI Phantom 4 Pro', '', '', '1953.00', 1, ''),
(13, 8, 7, 7, 'Havit G1 Black/Red', '', '', '98.00', 1, ''),
(14, 9, 3, 3, 'Apple iPad Air', '', '', '279.99', 1, ''),
(15, 10, 39, 65, 'Apple iPhone 12', '64 ГБ', 'Черный', '1061.68', 1, '675370'),
(16, 11, 39, 65, 'Apple iPhone 12', '64 ГБ', 'Черный', '1061.68', 1, '675370'),
(17, 11, 39, 72, 'Apple iPhone 12', '128 ГБ', 'Красный', '1132.46', 1, '675351'),
(18, 12, 14, 14, 'Apple Watch 4 Silver', '', '', '470.00', 1, ''),
(19, 13, 29, 32, 'Samsung Galaxy A80', '', '', '417.00', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `t_related_products`
--

DROP TABLE IF EXISTS `t_related_products`;
CREATE TABLE `t_related_products` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_related_products`
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
(28, 24, 0),
(28, 30, 1),
(28, 21, 2),
(33, 31, 0),
(33, 13, 2),
(33, 1, 1),
(39, 33, 1),
(39, 31, 0),
(39, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `t_seo`
--

DROP TABLE IF EXISTS `t_seo`;
CREATE TABLE `t_seo` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_seo`
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
(28, 'article_meta_description', '');

-- --------------------------------------------------------

--
-- Структура таблицы `t_seo_lang`
--

DROP TABLE IF EXISTS `t_seo_lang`;
CREATE TABLE `t_seo_lang` (
  `name` varchar(128) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_seo_lang`
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
-- Структура таблицы `t_settings`
--

DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE `t_settings` (
  `setting_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_settings`
--

INSERT INTO `t_settings` (`setting_id`, `name`, `value`) VALUES
(1, 'theme', 'Light'),
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
(16, 'email_lang', 'ru'),
(17, 'decimals_point', '.'),
(18, 'thousands_separator', ' '),
(19, 'products_num', '9'),
(20, 'products_num_admin', '20'),
(21, 'max_order_amount', '50'),
(22, 'lang', 'ru'),
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
(42, 'image_sizes', '55x55|110x110|90x90|240x240|570x570|800x800w|300x300|95x95|330x300|500x500|100x100|900x350|35x35|400x300|300x120|130x130|150x150|170x170|116x116|75x23|40x40|700x700|750x750|750x300|750x467|700x467|250x120|50x50|700x300|120x120'),
(43, 'comments_tree_blog', 'on'),
(44, 'comments_tree_articles', 'on'),
(45, 'lastModifyPosts', '2021-01-16 22:04:47'),
(46, 'chat_viber', '123456789'),
(47, 'chat_whats_app', '123456789'),
(48, 'chat_telegram', 'test'),
(49, 'chat_facebook', 'test'),
(50, 'features_num_admin', '25');

-- --------------------------------------------------------

--
-- Структура таблицы `t_settings_lang`
--

DROP TABLE IF EXISTS `t_settings_lang`;
CREATE TABLE `t_settings_lang` (
  `name` varchar(128) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_settings_lang`
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
-- Структура таблицы `t_subscribes`
--

DROP TABLE IF EXISTS `t_subscribes`;
CREATE TABLE `t_subscribes` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_subscribes`
--

INSERT INTO `t_subscribes` (`id`, `date`, `email`, `processed`) VALUES
(1, '2021-05-22 02:12:00', 'mail@site.com', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `t_translations`
--

DROP TABLE IF EXISTS `t_translations`;
CREATE TABLE `t_translations` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `in_config` tinyint(1) NOT NULL,
  `label` varchar(255) NOT NULL,
  `lang_ru` varchar(255) NOT NULL,
  `lang_en` varchar(255) NOT NULL,
  `lang_ua` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_translations`
--

INSERT INTO `t_translations` (`id`, `template`, `in_config`, `label`, `lang_ru`, `lang_en`, `lang_ua`) VALUES
(39, '', 0, 'callback', 'Заказать звонок', 'Request a call', 'Замовити дзвінок'),
(40, '', 0, 'contact_details', 'Москва, шоссе Энтузиастов 45/31, офис 453', '41 West 40th Street New York, NY', 'Київ, вул. Глибочицька, 32б'),
(6, '', 0, 'bloge', 'Блоге', 'entries', 'Блогу'),
(41, '', 0, 'phone_number', '(903) 782-82-82', '(210) 876-5432', '(095) 545-54-54'),
(42, '', 0, 'close', 'Закрыть', 'Close', 'Закрити'),
(43, '', 0, 'catalog', 'Каталог', 'Catalog', 'Каталог'),
(9, '', 0, 'aktsionnye_tovary', 'Акционные товары', 'Action goods', 'Акційні товари'),
(37, '', 0, 'login', 'Вход', 'Login', 'Вхід'),
(22, '', 0, 'votes', 'голосов', 'votes', 'голосів'),
(21, '', 0, 'vote', 'голос', 'vote', 'голос'),
(38, '', 0, 'logout', 'Выйти', 'Logout', 'Вихід'),
(16, '', 0, 'add_cart', 'Купить', 'In Cart', 'Придбати'),
(17, '', 0, 'added_cart', 'Готово', 'Added', 'Готово'),
(18, '', 0, 'more_details', 'Далее', 'More details', 'Далі'),
(19, '', 0, 'not_available', 'Нет в наличии', 'Not available', 'Немає в наявності'),
(20, '', 0, 'In_stock', 'В наличии', 'In stock', 'В наявності'),
(23, '', 0, 'of_vote', 'голоса', 'vote', 'голоси'),
(24, '', 0, 'add_to_wishlist', 'В избранное', 'Add to wishlist', 'У обране'),
(25, '', 0, 'added_to_wishlist', 'В избранном', 'Added to wishlist', 'В обраному'),
(26, '', 0, 'add_to_compare', 'В сравнение', 'Add to compare', 'До порівняння'),
(27, '', 0, 'added_to_compare', 'В сравнении ', 'Added to compare', 'В порівнянні'),
(28, '', 0, 'delete', 'Удалить', 'Delete', 'Видалити'),
(29, '', 0, 'featured_products', 'Рекомендуемые товары', 'Featured products', 'Рекомендовані товари'),
(30, '', 0, 'badge_new', 'Новинка', 'New', 'Новинка'),
(31, '', 0, 'badge_hit', 'Хит', 'Hit', 'Хіт'),
(32, '', 0, 'badge_sale', 'Акция', 'Sale', 'Акція'),
(33, '', 0, 'new_arrivals', 'Новинки', 'New arrivals', 'Новинки'),
(34, '', 0, 'sale', 'Акционные товары', 'Sale', 'Акційні товари'),
(35, '', 0, 'index_cart', 'Корзина', 'Cart', 'Кошик'),
(36, '', 0, 'registration', 'Регистрация', 'Registration', 'Реєстрація'),
(44, '', 0, 'currency', 'Валюта', 'Currency', 'Валюта'),
(45, '', 0, 'product_search', 'Поиск товара...', 'Product search...', 'Пошук товару...'),
(46, '', 0, 'all_products', 'Все товары', 'All products', 'Усі товари'),
(47, '', 0, 'all_brands', 'Все бренды', 'All Brands', 'Всі бренди'),
(48, '', 0, 'viewed_products', 'Просмотренные товары', 'Viewed products', 'Переглянуті товари'),
(49, '', 0, 'index_blog', 'Блог', 'Blog', 'Блог'),
(50, '', 0, 'enter_your_email', 'Оставьте свой e-mail', 'Enter your Email', 'Залиште свій e-mail'),
(51, '', 0, 'main_description', 'Этот магазин является демонстрацией скрипта интернет-магазина Turbo CMS. Все материалы на этом сайте присутствуют исключительно в демонстрационных целях.', 'This store is a demo of the script of the Turbo CMS online store. All materials on this site are present for demonstration purposes only.', 'Цей магазин є демонстрацією скрипта інтернет-магазину Turbo CMS. Всі матеріали на цьому сайті присутні виключно в демонстраційних цілях.'),
(53, '', 0, 'about_shop', 'О магазине', 'About Shop', 'Про магазин'),
(54, '', 0, 'information', 'Информация', 'Information', 'Інформація'),
(55, '', 0, 'contacts', 'Контакты', 'Contacts', 'Контакти'),
(56, '', 0, 'request_a_call', 'Заказать звонок', 'Request a call', 'Замовити дзвінок'),
(57, '', 0, 'leave_your_phone_number', 'Оставьте свой номер телефона', 'Leave your phone number', 'Залиште свій номер телефону'),
(58, '', 0, 'enter_your_name', 'Введите имя', 'Enter your name', 'Введіть ім\'я'),
(59, '', 0, 'enter_your_phone_number', 'Введите номер телефона', 'Enter your phone number', 'Введіть номер телефону'),
(60, '', 0, 'captcha_entered_incorrectly', 'Неверно введена капча', 'Captcha entered incorrectly', 'Невірно введена капча'),
(61, '', 0, 'enter_the_address', 'Введите адрес', 'Enter the address', 'Введіть адресу'),
(62, '', 0, 'enter_captcha', 'Введите капчу', 'Enter captcha', 'Введіть капчу'),
(63, '', 0, 'name', 'Имя', 'Name', 'Ім\'я'),
(64, '', 0, 'enter_a_comment', 'Введите комментарий', 'Enter a comment', 'Введіть коментар'),
(80, '', 0, 'buy_in_one_click', 'Купить в один клик', 'Buy in one click', 'Купити в один клік'),
(66, '', 0, 'home', 'Главная', 'Home', 'Головна'),
(67, '', 0, 'password', 'Пароль', 'Password', 'Пароль'),
(68, '', 0, 'forgot_your_password', 'Забыли пароль?', 'Forgot your password', 'Забули пароль?'),
(69, '', 0, 'enter_password', 'Введите пароль', 'Enter password', 'Введіть пароль'),
(70, '', 0, 'phone', 'Телефон', 'Phone', 'Телефон'),
(71, '', 0, 'address', 'Адрес', 'Address', 'Адреса'),
(72, '', 0, 'user_with_this_email_is_already_registered', 'Пользователь с таким email уже зарегистрирован', 'User with this email is already registered', 'Користувач з таким email вже зареєстрований'),
(73, '', 0, 'send', 'Отправить', 'Send', 'Надіслати'),
(74, '', 0, 'short_description', 'Краткое описание', 'Short description', 'Короткий опис'),
(75, '', 0, 'until_the_end_of_the_promotion_is_left', 'До конца акции осталось:', 'Until the end of the promotion is left:', 'До кінця акції залишилося:'),
(76, '', 0, 'colour', 'Цвет', 'Colour', 'Колір'),
(77, '', 0, 'size', 'Размер', 'Size', 'Розмір'),
(78, '', 0, 'sku', 'Артикул', 'SKU', 'Артикул'),
(79, '', 0, 'added', 'Добавлен', 'Added', 'Доданий'),
(81, '', 0, 'description', 'Описание', 'Description', 'Опис'),
(82, '', 0, 'feature', 'Характиристики', 'Feature', 'Характеристики'),
(83, '', 0, 'comments_global', 'Комментарии', 'Comments', 'Коментарі'),
(84, '', 0, 'awaiting_moderation', 'ожидает модерации', 'awaiting moderation', 'очікує модерації'),
(85, '', 0, 'comment', 'Комментарий', 'Comment', 'Коментар'),
(86, '', 0, 'comment_on', 'Комментировать', 'Comment on', 'Коментувати'),
(87, '', 0, 'no_comments', 'Пока нет комментариев', 'No comments', 'Поки немає коментарів'),
(88, '', 0, 'we_also_advise_you_to_look', 'Также советуем посмотреть', 'We also advise you to look', 'Також радимо подивитися'),
(89, '', 0, 'email_order_title', 'Ваш заказ №', 'Your Order No.', 'Ваше замовлення №'),
(90, '', 0, 'email_order_on_total', 'на сумму', 'for the amount', 'на суму'),
(92, '', 0, 'badge_featured', 'Рекомендуем', 'featured', 'Рекомендуємо'),
(111, '', 0, 'reply', 'Ответить', 'Reply', 'Відповісти'),
(96, '', 0, 'files_global', 'Файлы', 'Files', 'Файли'),
(97, '', 0, 'videos_global', 'Видео', 'Video', 'Відео'),
(98, '', 0, 'wishlist_is_empty', 'Список избранного пуст', 'Wishlist is empty', 'Список обраного порожній'),
(99, '', 0, 'sort_by', 'Сортировать по', 'Sort by', 'Сортувати за'),
(100, '', 0, 'default', 'Умолчанию', 'Default', 'Замовчуванням'),
(101, '', 0, 'by_name_from_a_to_z', 'По имени от А до Я', 'By name from A to Z', 'На ім\'я від А до Я'),
(102, '', 0, 'by_name_from_z_to_a', 'По имени от Я до А', 'By name from Z to A', 'На ім\'я від Я до А'),
(103, '', 0, 'cheap_to_expensive', 'От дешевых к дорогим', 'Cheap to expensive', 'Від дешевих до дорогих'),
(104, '', 0, 'from_expensive_to_cheap', 'От дорогих к дешевым', 'From expensive to cheap', 'Від дорогих до дешевих'),
(105, '', 0, 'by_rating', 'По рейтингу', 'By rating', 'за рейтингом'),
(106, '', 0, 'no_products_found', 'Товары не найдены', 'No products found', 'Товари не знайдені'),
(107, '', 0, 'search', 'Поиск', 'Search', 'Пошук'),
(108, '', 0, 'nothing_found', 'Ничего не найдено', 'Nothing found', 'Нічого не знайдено'),
(109, '', 0, 'enter_your_search_term', 'Введите поисковый запрос', 'Enter your search term', 'Введіть пошуковий запит'),
(110, '', 0, 'site_search', 'Поиск по сайту', 'Site search', 'Пошук по сайту'),
(112, '', 0, 'at', 'в', 'at', 'в'),
(113, '', 0, 'popular', 'Популярные', 'Popular', 'Популярні'),
(114, '', 0, 'in_order', 'По порядку', 'In order', 'По порядку'),
(115, '', 0, 'comments', 'комментариев', 'comments', 'коментарів'),
(116, '', 0, 'table_of_contents', 'Содержание', 'Table of Contents', 'Зміст'),
(117, '', 0, 'you_have_already_voted', 'Вы уже голосовали!', 'You have already voted!', 'Ви вже голосували!'),
(118, '', 0, 'thank_you_your_vote_has_been_counted', 'Спасибо! Ваш голос учтен.', 'Thank you! Your vote has been counted.', 'Спасибі! Ваш голос враховано.'),
(119, '', 0, 'message_sent', 'Сообщение отправлено', 'Message sent', 'Повідомлення відправлено'),
(120, '', 0, 'you_have_been_successfully_subscribed', 'Вы были успешно подписаны', 'You have been successfully subscribed', 'Ви були успішно підписані'),
(121, '', 0, 'you_are_already_subscribed', 'Вы уже подписаны', 'You are already subscribed', 'Ви вже підписані'),
(122, '', 0, 'subscribe_to', 'Подписаться', 'Subscribe to', 'Підписатися'),
(123, '', 0, 'search_article', 'Поиск статьи...', 'Search article...', 'Пошук статті...'),
(124, '', 0, 'sitemap', 'Карта сайта', 'Sitemap', 'Карта сайту'),
(125, '', 0, 'index_articles', 'Статьи', 'Articles', 'Статті'),
(126, '', 0, 'index_products', 'Продукты', 'Products', 'Продукти'),
(127, '', 0, 'sort_date', 'По дате', 'Date', 'За датою'),
(128, '', 0, 'search_blog', 'Поиск в блоге...', 'Search blog...', 'Пошук в блозі...'),
(129, '', 0, 'filter_by_price', 'Фильтр по цене', 'Filter by price', 'Фільтр по ціні'),
(130, '', 0, 'apply', 'Применить', 'Apply', 'Застосувати'),
(131, '', 0, 'reset', 'Сбросить', 'Reset', 'Скинути'),
(132, '', 0, 'index_brands', 'Бренды', 'Brands', 'Бренди'),
(133, '', 0, 'index_feedback', 'Обратная связь', 'Feedback', 'Зворотній зв\'язок'),
(134, '', 0, 'your_message_has_been_sent', 'ваше сообщение отправлено.', 'your message has been sent.', 'ваше повідомлення відправлено.'),
(135, '', 0, 'enter_your_message', 'Введите сообщение', 'Enter your message', 'Введіть повідомлення'),
(136, '', 0, 'message', 'Сообщение', 'Message', 'Повідомлення'),
(137, '', 0, 'password_reminder', 'Напоминание пароля', 'Password reminder', 'Нагадування пароля'),
(138, '', 0, 'an_email_has_been_sent_to_you', 'Вам отправлено письмо', 'An email has been sent to you', 'Вам надіслано листа'),
(139, '', 0, 'user_is_not_found', 'Пользователь не найден', 'User is not found', 'Користувач не знайдений'),
(140, '', 0, 'password_recovery_email_has_been_sent', 'отправлено письмо для восстановления пароля.', 'password recovery email has been sent.', 'відправлено лист для відновлення пароля.'),
(141, '', 0, 'enter_the_email_you_provided_during_registration', 'Введите email, который вы указывали при регистрации', 'Enter the email you provided during registration', 'Введіть email, який ви вказали при реєстрації'),
(142, '', 0, 'wrong_login_or_password', 'Неверный логин или пароль', 'Wrong login or password', 'Невірний логін або пароль'),
(143, '', 0, 'your_account_has_not_been_activated_yet', 'Ваш аккаунт еще не активирован.', 'Your account has not been activated yet.', 'Ваш аккаунт ще не був активований.'),
(144, '', 0, 'no_post_found', 'Записи не найдены', 'No post found', 'Публікації не знайдено'),
(145, '', 0, 'your_discount', 'Ваша скидка', 'Your discount', 'Ваша знижка'),
(146, '', 0, 'change_password', 'Изменить пароль', 'Change Password', 'Змінити пароль'),
(147, '', 0, 'save', 'Сохранить', 'Save', 'Зберегти'),
(148, '', 0, 'your_orders', 'Ваши заказы', 'Your orders', 'Ваші заказы'),
(149, '', 0, 'index_order', 'Заказ №', 'Order №', 'Заказ №'),
(150, '', 0, 'paid', 'оплачен', 'paid', 'оплачений'),
(151, '', 0, 'waiting_for_processing', 'ждет обработки', 'waiting for processing', 'чекає обробки'),
(152, '', 0, 'in_processing', 'в обработке', 'in processing', 'в обробці'),
(153, '', 0, 'completed', 'выполнен', 'completed', 'виконаний'),
(154, '', 0, 'site_closed_for_maintenance', 'Сайт закрыт на техническое обслуживание', 'Site closed for maintenance', 'Сайт зараз закритий на технічне обслуговування'),
(155, '', 0, 'apologize', 'Приносим извинения за неудобство, но в данный момент сайт находится на техническом обслуживание. Скоро мы вернемся online!', 'We apologize for the inconvenience, but the site is currently undergoing maintenance. We\'ll be back online soon!', 'Приносимо вибачення за незручність, але в даний момент сайт знаходиться на технічному обслуговуванні. Скоро ми повернемося online!'),
(156, '', 0, 'forward', 'вперед', 'forward', 'вперед'),
(157, '', 0, 'back', 'назад', 'back', 'назад'),
(158, '', 0, 'all_at_once', 'все сразу', 'all at once', 'всі відразу'),
(159, '', 0, 'order_page', 'Страница заказа', 'Order page', 'Сторінка замовлення'),
(160, '', 0, 'accepted', 'принят', 'accepted', 'прийнятий'),
(161, '', 0, 'general_name', 'Название', 'Name', 'Назва'),
(162, '', 0, 'general_price', 'Цена', 'Price', 'Ціна'),
(163, '', 0, 'number', 'Количество', 'Number', 'Кількість'),
(164, '', 0, 'sum', 'Сумма', 'Sum', 'Сума'),
(165, '', 0, 'discount', 'Скидка', 'Discount', 'Знижка'),
(166, '', 0, 'coupon', 'Купон', 'Coupon', 'Купон'),
(167, '', 0, 'total', 'Итого', 'Total', 'Разом'),
(168, '', 0, 'choose_another_payment_method', 'Выбрать другой способ оплаты', 'Choose another payment method', 'Вибрати інший спосіб оплати'),
(169, '', 0, 'payment_method', 'Способ оплаты', 'Payment method', 'Спосіб оплати'),
(170, '', 0, 'select_a_payment_method', 'Выберите способ оплаты', 'Select a Payment Method', 'Оберіть спосіб оплати\r\n'),
(171, '', 0, 'order_details', 'Детали заказа', 'Order details', 'Деталі замовлення'),
(172, '', 0, 'order_date', 'Дата заказа', 'Order date', 'Дата замовлення'),
(173, '', 0, 'delivery_address', 'Адрес доставки', 'Delivery address', 'Адреса доставки'),
(174, '', 0, 'finish_the_order', 'Закончить заказ', 'Finish the order', 'Закінчити замовлення'),
(175, '', 0, 'to_pay', 'К оплате', 'To pay', 'До оплати'),
(176, '', 0, 'to_pay_small', 'к оплате', 'to pay', 'до оплати'),
(177, '', 0, 'proceed_to_checkout', 'Перейти к оплате', 'Proceed to checkout', 'Перейти до оплати'),
(178, '', 0, 'global_cart', 'Корзина', 'Cart', 'Кошик'),
(179, '', 0, 'cart_is_empty', 'Корзина пуста', 'Cart is empty', 'Кошик порожній'),
(180, '', 0, 'coupon_is_invalid', 'Купон недействителен', 'Coupon is invalid', 'Купон недійсний'),
(181, '', 0, 'valid_for_orders_from', 'действует для заказов от', 'valid for orders from', 'діє для замовлень від'),
(182, '', 0, 'enter_coupon_code', 'Введите код купона...', 'Enter coupon code...', 'Введіть код купона...'),
(183, '', 0, 'apply_coupon', 'Применить купон', 'Apply coupon', 'Застосувати купон'),
(184, '', 0, 'select_delivery_method', 'Выберите способ доставки', 'Select delivery method', 'Виберіть спосіб доставки'),
(185, '', 0, 'free', 'бесплатно', 'free', 'безкоштовно'),
(186, '', 0, 'address_of_the_recipient', 'Адрес получателя', 'Address of the recipient', 'Адреса отримувача'),
(187, '', 0, 'general_full_name', 'ФИО', 'Full name', 'ПІБ'),
(188, '', 0, 'checkout', 'Оформить заказ', 'Checkout', 'Оформити замовлення\r\n'),
(189, '', 0, 'there_are_no_products_in_the_cart', 'В корзине нет товаров', 'There are no products in the cart', 'У кошику немає товарів'),
(190, '', 0, 'new_password', 'Новый пароль', 'New password', 'Новий пароль'),
(191, '', 0, 'on_the_site', 'на сайте', 'on the site', 'на сайті'),
(192, '', 0, 'email_password_was_reply', 'был сделан запрос на восстановление вашего пароля.', 'a request was made to recover your password.', 'був зроблений запит на відновлення вашого пароля.'),
(193, '', 0, 'email_password_change_pass', 'Вы можете изменить пароль, перейдя по следующей ссылке', 'You can change your password by following the link below', 'Ви можете змінити пароль, перейшовши за наступним посиланням'),
(194, '', 0, 'email_password_text', 'Эта ссылка действует в течение нескольких минут. <br> Если это письмо пришло вам по ошибке, проигнорируйте его.', 'This link is effective for a few minutes. <br> If you received this error in error, ignore it.', 'Це посилання діє протягом декількох хвилин. <br>  Якщо цей лист прийшло вам помилково, ігноруйте його.'),
(226, '', 0, 'email_order_status', 'Статус заказа', 'Order status', 'Статус замовлення'),
(196, '', 0, 'not_paid', 'не оплачен', 'not paid', 'не сплачено'),
(197, '', 0, 'canceled', 'отменен', 'canceled', 'скасований'),
(198, '', 0, 'payment', 'Оплата', 'Payment', 'Оплата'),
(199, '', 0, 'you_ordered', 'Вы заказали', 'You ordered', 'Ви замовили'),
(200, '', 0, 'status', 'Статус', 'Status', 'Статус'),
(201, '', 0, 'status_order_link', 'Вы всегда можете проверить состояние заказа по ссылке:', 'You can always check the status of your order by following the link:', 'Ви завжди можете перевірити стан замовлення за посиланням:'),
(202, '', 0, 'compare', 'Сравнение', 'Compare', 'Порівняння'),
(203, '', 0, 'there_are_no_products_to_compare', 'Нет товаров для сравнения', 'There are no products to compare', 'Немає товарів для порівняння'),
(204, '', 0, 'no_brands_found', 'Бренды не найдены', 'No brands found', 'Бренди не знайдені'),
(205, '', 0, 'no_articles_found', 'Статьи не найдены', 'No articles found', 'Статті не знайдені'),
(206, '', 0, 'popular_categories', 'Популярные категории', 'Popular Categories', 'Популярні категорії'),
(207, '', 0, 'bestsellers', 'Хиты продаж', 'Bestsellers', 'Хіти продажів'),
(208, '', 0, 'empty_trash', 'Очистить корзину', 'Empty trash', 'Очистити кошик'),
(209, '', 0, 'products_from_category', 'Товары той же категории', 'Products from category', 'Товари тієї ж категорії'),
(210, '', 0, 'products_from_brand', 'Товары того же бренда', 'Products from brand', 'Товари того ж бренду'),
(211, '', 0, 'see_all', 'Посмотреть все', 'See all', 'Переглянути всі'),
(212, '', 0, 'captcha', 'Капча', 'Captcha', 'Капча'),
(213, '', 0, 'v_magazine', 'в магазине', 'in store', 'в магазині'),
(214, '', 0, 'fast_order', 'Быстрый заказ', 'Fast order', 'Швидке замовлення'),
(215, '', 0, 'weight', 'Вес', 'Weight', 'Вага'),
(216, '', 0, 'email_order_heading', 'Спасибо за ваш заказ', 'Thanks for your order', 'Дякуємо за ваше замовлення'),
(217, '', 0, 'email_comment_hello', 'Здравствуйте,', 'Hello,', 'Вітаємо,'),
(218, '', 0, 'email_order_order_message', 'Сообщаем вам, что вашему заказу', 'We inform you that your order', 'Повідомляємо вам, що ваше замовлення'),
(219, '', 0, 'email_order_text_of', 'от', 'of', 'від'),
(220, '', 0, 'email_order_text_status', 'присвоен статуc', 'assigned status', 'присвоєно статуc'),
(221, '', 0, 'email_order_button', 'Перейти к заказу', 'Go to order', 'Перейти до замовлення'),
(222, '', 0, 'email_order_number_s', 'Номер заказа', 'Order number', 'Номер замовлення'),
(223, '', 0, 'general_payment', 'Оплата', 'Payment', 'Оплата'),
(224, '', 0, 'password_remind_title', 'Восстановление пароля', 'Password recovery', 'Відновлення пароля'),
(225, '', 0, 'option', 'Вариант', 'Option', 'Варіант'),
(227, '', 0, 'to_contact_us', 'Связаться с нами', 'To contact us', 'Зв\'язатися з нами');

-- --------------------------------------------------------

--
-- Структура таблицы `t_users`
--

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_users`
--

INSERT INTO `t_users` (`id`, `email`, `password`, `name`, `phone`, `address`, `group_id`, `enabled`, `last_ip`, `created`) VALUES
(1, 'me@example.com', '003ff6279857ddb9bb1ccf7a1c86f710', 'Сергей Иванов', '+1(234) 567-89-01', '', 1, 1, '127.0.0.1', '2021-01-24 00:52:13');

-- --------------------------------------------------------

--
-- Структура таблицы `t_variants`
--

DROP TABLE IF EXISTS `t_variants`;
CREATE TABLE `t_variants` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(25) NOT NULL,
  `color_code` varchar(7) NOT NULL,
  `images_ids` varchar(150) NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(14,2) DEFAULT NULL,
  `weight` float(8,2) NOT NULL,
  `stock` mediumint(9) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `external_id` varchar(36) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_variants`
--

INSERT INTO `t_variants` (`id`, `product_id`, `sku`, `name`, `color`, `color_code`, `images_ids`, `price`, `compare_price`, `weight`, `stock`, `position`, `external_id`, `currency_id`) VALUES
(1, 1, '', '', '', '', '', '8000.00', '0.00', 0.00, NULL, 1, '', 0),
(2, 2, '', '64 ГБ', '', '', '', '274.99', '349.99', 0.00, NULL, 1, '', 0),
(3, 3, '', '', '', '', '', '279.99', '399.99', 0.00, NULL, 1, '', 0),
(4, 4, '', '', '', '', '', '989.00', '0.00', 0.00, NULL, 1, '', 0),
(5, 5, '', '', '', '', '', '1692.00', '0.00', 0.00, NULL, 1, '', 0),
(6, 6, '', '', '', '', '', '1953.00', '0.00', 0.00, NULL, 1, '', 0),
(7, 7, '', '', '', '', '', '98.00', '0.00', 0.00, NULL, 7, '', 0),
(8, 8, '', '', '', '', '', '130.00', '0.00', 0.00, NULL, 8, '', 0),
(9, 9, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 1, '', 0),
(10, 10, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 1, '', 0),
(11, 11, '', '', '', '', '', '150.00', '0.00', 0.00, NULL, 1, '', 0),
(12, 12, '', '', '', '', '', '250.00', '0.00', 0.00, NULL, 12, '', 1),
(13, 13, '', '', '', '', '', '500.00', '0.00', 0.00, NULL, 1, '', 0),
(14, 14, '', '', '', '', '', '470.00', '0.00', 0.00, NULL, 1, '', 0),
(15, 15, '', '', '', '', '', '503.00', '0.00', 0.00, NULL, 1, '', 0),
(16, 16, '', '', '', '', '', '210.00', '0.00', 0.00, NULL, 1, '', 0),
(17, 17, '', '', '', '', '', '165.00', '0.00', 0.00, NULL, 1, '', 0),
(18, 18, '', '', '', '', '', '238.00', '0.00', 0.00, NULL, 18, '', 0),
(19, 19, '', '', '', '', '', '1253.00', '0.00', 0.00, NULL, 1, '', 0),
(20, 20, '', '', '', '', '', '599.00', '0.00', 0.00, NULL, 1, '', 0),
(21, 21, '', '32 ГБ', '', '', '', '223.00', '0.00', 0.00, NULL, 21, '', 0),
(22, 22, '', '', '', '', '', '254.00', '0.00', 0.00, NULL, 1, '', 0),
(23, 23, '001', '64 МБ', 'Черный', '#000000', '109,110,111,112', '400.00', '600.00', 0.00, NULL, 23, '', 0),
(24, 23, '006', '128 ГБ', 'Синий', '#0000ff', '109,113,114', '399.99', '449.99', 0.00, NULL, 38, '', 0),
(25, 23, '005', '256 ГБ', 'Серый', '#c0c0c0', '109,116', '499.99', '549.99', 0.00, NULL, 37, '', 0),
(26, 23, '007', '512 ГБ', 'Синий', '#0000ff', '109,113,114', '599.99', '649.99', 0.00, NULL, 39, '', 0),
(27, 24, '', '', '', '', '', '300.00', '0.00', 0.00, NULL, 1, '', 0),
(28, 25, '', '', '', '', '', '216.00', '0.00', 0.00, NULL, 1, '', 0),
(29, 26, '', '', '', '', '', '800.00', '0.00', 0.00, NULL, 1, '', 0),
(30, 27, '', '', '', '', '', '400.00', '0.00', 0.00, NULL, 1, '', 0),
(31, 28, '', '', '', '', '', '160.00', '0.00', 0.00, NULL, 31, '', 0),
(32, 29, '', '', '', '', '', '417.00', '0.00', 0.00, NULL, 32, '', 0),
(33, 30, '', '', '', '', '', '400.00', '0.00', 0.00, NULL, 33, '', 0),
(34, 31, '', '', '', '', '', '1161.33', '0.00', 0.00, NULL, 34, '', 0),
(35, 32, '', '', '', '', '', '298.00', '0.00', 0.00, NULL, 35, '', 0),
(36, 33, '0001', '', '', '', '', '447.98', '0.00', 100.00, NULL, 36, '', 0),
(37, 23, '002', '128 ГБ', 'Оранжевый', '#ff6600', '109,115', '600.00', '700.00', 0.00, NULL, 24, '', 0),
(38, 23, '004', '256 ГБ', 'Синий', '#0000ff', '109,113,114', '499.99', '549.99', 0.00, NULL, 26, '', 0),
(39, 23, '003', '512 ГБ', 'Черный', '#000000', '109,110,111', '599.99', '649.99', 0.00, NULL, 25, '', 0),
(40, 34, '', '', '', '', '', '242.00', '0.00', 0.00, NULL, 40, '', 1),
(41, 35, '', '', '', '', '', '373.00', '0.00', 0.00, NULL, 41, '', 1),
(64, 21, '', '64 ГБ', '', '', '', '300.00', '0.00', 0.00, NULL, 64, '', 0),
(65, 39, '675370', '64 ГБ', 'Черный', '#000000', '181,180', '1061.68', '1167.85', 162.00, NULL, 65, '', 0),
(66, 39, '675348', '128 ГБ', 'Черный', '#000000', '181,180,182,183', '1132.46', '1238.64', 162.00, NULL, 66, '', 0),
(67, 39, '675360', '256 ГБ', 'Черный', '#000000', '181,180', '1309.42', '1415.59', 162.00, NULL, 67, '', 0),
(68, 39, '675375', '64 ГБ', 'Синий', '#0000ff', '185,184', '1061.68', '1167.85', 162.00, NULL, 68, '', 0),
(69, 39, '675357', '128 ГБ', 'Синий', '#0000ff', '185,184', '1132.46', '1238.64', 162.00, NULL, 69, '', 0),
(70, 39, '675369', '256 ГБ', 'Синий', '#0000ff', '185,184', '1309.42', '1415.59', 162.00, NULL, 70, '', 0),
(74, 39, '675371', '64 ГБ', 'Зеленый', '#99cc00', '189,188', '1061.68', '1167.85', 162.00, NULL, 74, '', 0),
(71, 39, '675372', '64 ГБ', 'Красный', '#ff0000', '187,186', '1061.68', '1167.85', 162.00, NULL, 71, '', 0),
(72, 39, '675351', '128 ГБ', 'Красный', '#ff0000', '187,186', '1132.46', '1238.64', 162.00, NULL, 72, '', 0),
(73, 39, '675367', '256 ГБ', 'Красный', '#ff0000', '187,186', '1309.42', '1415.59', 162.00, NULL, 73, '', 0),
(75, 39, '675350', '128 ГБ', 'Зеленый', '#99cc00', '189,188', '1132.46', '1238.64', 162.00, NULL, 75, '', 0),
(76, 39, '675363', '256 ГБ', 'Зеленый', '#99cc00', '189,188', '1309.42', '1415.59', 162.00, NULL, 76, '', 0),
(77, 39, '675374', '64 ГБ', 'Белый', '#ffffff', '191,190', '1061.68', '1167.85', 162.00, NULL, 77, '', 0),
(78, 39, '675354', '128 ГБ', 'Белый', '#ffffff', '191,190', '1132.46', '1238.64', 162.00, NULL, 78, '', 0),
(79, 39, '675368', '256 ГБ', 'Белый', '#ffffff', '191,190', '1309.42', '1415.59', 162.00, NULL, 79, '', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `t_articles`
--
ALTER TABLE `t_articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`visible`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `t_articles_categories`
--
ALTER TABLE `t_articles_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `external_id` (`external_id`);

--
-- Индексы таблицы `t_banners`
--
ALTER TABLE `t_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `show_all_pages` (`show_all_pages`),
  ADD KEY `category` (`categories`),
  ADD KEY `pages` (`pages`),
  ADD KEY `brands` (`brands`);

--
-- Индексы таблицы `t_banners_images`
--
ALTER TABLE `t_banners_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`);

--
-- Индексы таблицы `t_blog`
--
ALTER TABLE `t_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`visible`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `t_brands`
--
ALTER TABLE `t_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `t_callbacks`
--
ALTER TABLE `t_callbacks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_categories`
--
ALTER TABLE `t_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `position` (`position`),
  ADD KEY `visible` (`visible`),
  ADD KEY `external_id` (`external_id`);

--
-- Индексы таблицы `t_categories_features`
--
ALTER TABLE `t_categories_features`
  ADD PRIMARY KEY (`category_id`,`feature_id`);

--
-- Индексы таблицы `t_comments`
--
ALTER TABLE `t_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`object_id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `t_coupons`
--
ALTER TABLE `t_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_currencies`
--
ALTER TABLE `t_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `t_delivery`
--
ALTER TABLE `t_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `t_delivery_payment`
--
ALTER TABLE `t_delivery_payment`
  ADD PRIMARY KEY (`delivery_id`,`payment_method_id`);

--
-- Индексы таблицы `t_features`
--
ALTER TABLE `t_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `in_filter` (`in_filter`);

--
-- Индексы таблицы `t_feedbacks`
--
ALTER TABLE `t_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_files`
--
ALTER TABLE `t_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_groups`
--
ALTER TABLE `t_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_images`
--
ALTER TABLE `t_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename` (`filename`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `t_labels`
--
ALTER TABLE `t_labels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_languages`
--
ALTER TABLE `t_languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_lang_articles`
--
ALTER TABLE `t_lang_articles`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`article_id`);

--
-- Индексы таблицы `t_lang_articles_categories`
--
ALTER TABLE `t_lang_articles_categories`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`article_category_id`);

--
-- Индексы таблицы `t_lang_banners_images`
--
ALTER TABLE `t_lang_banners_images`
  ADD PRIMARY KEY (`lang_id`,`banner_image_id`);

--
-- Индексы таблицы `t_lang_blog`
--
ALTER TABLE `t_lang_blog`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`blog_id`);

--
-- Индексы таблицы `t_lang_brands`
--
ALTER TABLE `t_lang_brands`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`brand_id`);

--
-- Индексы таблицы `t_lang_categories`
--
ALTER TABLE `t_lang_categories`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`category_id`);

--
-- Индексы таблицы `t_lang_currencies`
--
ALTER TABLE `t_lang_currencies`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`currency_id`);

--
-- Индексы таблицы `t_lang_delivery`
--
ALTER TABLE `t_lang_delivery`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`delivery_id`);

--
-- Индексы таблицы `t_lang_features`
--
ALTER TABLE `t_lang_features`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`feature_id`);

--
-- Индексы таблицы `t_lang_files`
--
ALTER TABLE `t_lang_files`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`file_id`);

--
-- Индексы таблицы `t_lang_pages`
--
ALTER TABLE `t_lang_pages`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`page_id`);

--
-- Индексы таблицы `t_lang_payment_methods`
--
ALTER TABLE `t_lang_payment_methods`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`payment_id`);

--
-- Индексы таблицы `t_lang_products`
--
ALTER TABLE `t_lang_products`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`product_id`);

--
-- Индексы таблицы `t_lang_variants`
--
ALTER TABLE `t_lang_variants`
  ADD UNIQUE KEY `lang_id` (`lang_id`,`variant_id`);

--
-- Индексы таблицы `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_options`
--
ALTER TABLE `t_options`
  ADD PRIMARY KEY (`lang_id`,`product_id`,`feature_id`,`value`) USING BTREE,
  ADD KEY `value` (`value`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `feature_id` (`feature_id`);

--
-- Индексы таблицы `t_orders`
--
ALTER TABLE `t_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`user_id`),
  ADD KEY `written_off` (`closed`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`),
  ADD KEY `code` (`url`),
  ADD KEY `payment_status` (`paid`);

--
-- Индексы таблицы `t_orders_labels`
--
ALTER TABLE `t_orders_labels`
  ADD PRIMARY KEY (`order_id`,`label_id`);

--
-- Индексы таблицы `t_pages`
--
ALTER TABLE `t_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_num` (`position`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `t_payment_methods`
--
ALTER TABLE `t_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `t_products`
--
ALTER TABLE `t_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`),
  ADD KEY `hit` (`featured`),
  ADD KEY `name` (`name`(333));

--
-- Индексы таблицы `t_products_categories`
--
ALTER TABLE `t_products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `position` (`position`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `t_products_videos`
--
ALTER TABLE `t_products_videos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_purchases`
--
ALTER TABLE `t_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Индексы таблицы `t_related_products`
--
ALTER TABLE `t_related_products`
  ADD PRIMARY KEY (`product_id`,`related_id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `t_seo`
--
ALTER TABLE `t_seo`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `t_seo_lang`
--
ALTER TABLE `t_seo_lang`
  ADD PRIMARY KEY (`lang_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Индексы таблицы `t_settings`
--
ALTER TABLE `t_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `t_settings_lang`
--
ALTER TABLE `t_settings_lang`
  ADD PRIMARY KEY (`lang_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Индексы таблицы `t_subscribes`
--
ALTER TABLE `t_subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_translations`
--
ALTER TABLE `t_translations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `t_variants`
--
ALTER TABLE `t_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sku` (`sku`),
  ADD KEY `price` (`price`),
  ADD KEY `stock` (`stock`),
  ADD KEY `position` (`position`),
  ADD KEY `external_id` (`external_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `t_articles`
--
ALTER TABLE `t_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_articles_categories`
--
ALTER TABLE `t_articles_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_banners`
--
ALTER TABLE `t_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_banners_images`
--
ALTER TABLE `t_banners_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `t_blog`
--
ALTER TABLE `t_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `t_brands`
--
ALTER TABLE `t_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `t_callbacks`
--
ALTER TABLE `t_callbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_categories`
--
ALTER TABLE `t_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `t_comments`
--
ALTER TABLE `t_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `t_coupons`
--
ALTER TABLE `t_coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_currencies`
--
ALTER TABLE `t_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_delivery`
--
ALTER TABLE `t_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `t_features`
--
ALTER TABLE `t_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `t_feedbacks`
--
ALTER TABLE `t_feedbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_files`
--
ALTER TABLE `t_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_groups`
--
ALTER TABLE `t_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_images`
--
ALTER TABLE `t_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT для таблицы `t_labels`
--
ALTER TABLE `t_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `t_languages`
--
ALTER TABLE `t_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `t_orders`
--
ALTER TABLE `t_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `t_payment_methods`
--
ALTER TABLE `t_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `t_products`
--
ALTER TABLE `t_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `t_products_videos`
--
ALTER TABLE `t_products_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `t_purchases`
--
ALTER TABLE `t_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `t_seo`
--
ALTER TABLE `t_seo`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `t_settings`
--
ALTER TABLE `t_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `t_subscribes`
--
ALTER TABLE `t_subscribes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_translations`
--
ALTER TABLE `t_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `t_variants`
--
ALTER TABLE `t_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;