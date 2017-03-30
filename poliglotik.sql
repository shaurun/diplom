-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.17-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных polyglot
CREATE DATABASE IF NOT EXISTS `polyglotnetby` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `polyglotnetby`;


-- Дамп структуры для таблица polyglot.lessons
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.lessons: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` (`id`, `name`, `status`, `subject_id`) VALUES
	(1, 'Гринвич, урок 1', 0, 1),
	(2, 'Гринвич, урок 2', 0, 1),
	(7, 'Курсы, часть 1', 0, 10),
	(9, 'Курсы, часть 2', 0, 10),
	(10, 'Нечаева, урок 1', 0, 2),
	(11, 'Самообразование, урок 1', 0, 6),
	(12, 'Самообразование, урок 2', 0, 6),
	(13, 'Самообразование, урок 3', 0, 6),
	(15, 'Урок 1', 0, 13),
	(16, '1', 0, 18);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.news: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `info`, `date`) VALUES
	(1, 'Открыта регистрация пользователей!', 'Посетитель! Студент ты или преподаватель, или просто гость, решивший пополнить свой словарный запас - мы рады видеть тебя на нашем сайте!\r\nТеперь ты можешь зарегистрироваться, чтобы получить возможность создавать индивидуальные словари.', '2017-02-26 00:00:00'),
	(2, 'Создание индивидуальных словарей', 'Дорогой гость. Мы рады сообщить, что теперь у тебя появилась возможность создания индивидуальных словарей по любой дисциплине!\r\nПросто зарегистрируйся или войти в созданный аккаунт, создай дисциплину, а в ней - уроки и, по желанию, темы. Заполни свой урок словами и пометь их ярлыками тем.', '2017-02-26 00:00:00'),
	(3, 'Исправлена проблема!', 'Надеемся, вы не столкнулись с проблемой удаления слов при удалении тем. Рады сообщить, что теперь эта проблема исправлена!', '2017-02-26 00:00:00'),
	(4, 'Грядет новый дизайн', 'В настоящий момент идет активная разработка нового дизайна главной страницы. Мы очень хотим, чтобы Полиглот радовал вас с первой страницы.', '2017-02-26 00:00:00'),
	(5, 'Улучшения дизайна', 'Дизайн заглавной страницы изменен', '2017-02-26 00:00:00'),
	(6, 'Что теперь?', 'В настоящий момент активно ведется разработка генерации упражнений для пользователя.', '2017-02-26 00:00:00'),
	(7, 'Что дальше?', 'Посетитель. У нас готовы упражнения, генерируемые по уроку. Теперь разрабатывается генерация упражнений по теме выбранной дисциплины.', '2017-02-28 00:00:00'),
	(8, 'Можно ли выучить иностранный язык, не уча слов?', 'Едва ли. Но с чем в первую очередь ассоциируется изучение слов? Утомительный, нудный процесс, на который мы просто в итоге или совсем не решаемся, или бросаем, тщетно попробовав несколько раз. Результат? Иностранный язык учим давно, а ничего по-прежнему не знаем… Во всяком случае, так было с нами. Пока нас не окрылила идея: а если учить слова онлайн? И даже оффлайн, но на компьютере или телефоне? Когда есть свободная минутка.\r\n\r\nНам показалось, что в этом случае процесс запоминания слов будет не таким ужасным. А дальше посыпались идеи: сделать это возможным для как можно большего количества языков, и чтобы можно было все редактировать, и чтобы учить именно те слова, которые нам нужны, а не готовые кем-то составленные словари и разговорники… В общем, больше изучение слов нам не кажется страшным.\r\n\r\nТеперь это весело!', '2017-03-12 00:00:00');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`) VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.subjects: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`id`, `name`, `user_id`) VALUES
	(1, 'Английский язык', 1),
	(2, 'Японский язык', 1),
	(6, 'Немецкий язык', 1),
	(10, 'Французский язык', 1),
	(13, 'Латынь', 1),
	(18, 'Англицкий', 4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.topics
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `color` varchar(7) DEFAULT '#FFFFFF',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.topics: ~23 rows (приблизительно)
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` (`id`, `name`, `subject_id`, `color`) VALUES
	(1, 'Животные', 1, '#429935'),
	(2, 'Путешествия', 1, '#f50a38'),
	(3, 'Цвета', 1, '#66b3ad'),
	(4, 'Мебель', 1, '#ff8000'),
	(7, 'Вежливость', 10, '#968bf8'),
	(8, 'Больница', 10, '#fb5572'),
	(9, 'Магазин', 10, '#47ef3f'),
	(11, 'Дорога', 10, '#f48859'),
	(12, 'Еда', 10, '#151515'),
	(13, 'Цвета', 10, '#131dd2'),
	(14, 'Семья', 1, '#454ee4'),
	(15, 'Здоровье', 1, '#800080'),
	(16, 'Профессии', 2, '#6a8878'),
	(17, 'Животные', 2, '#4229ed'),
	(18, 'Вежливость', 6, '#ff8409'),
	(19, 'Эмоции', 6, '#ff4646'),
	(20, 'Семья', 6, '#1f4dd6'),
	(21, 'Местоимения', 6, '#400000'),
	(25, 'Местоимения', 13, '#af5f5f'),
	(28, 'Части тела', 13, '#FF8080'),
	(29, 'фразы', 13, '#4d3399'),
	(36, 'местоимения', 18, '#d04fb7'),
	(37, 'зверюшки', 18, '#43d34a');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.users: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`) VALUES
	(1, 'admin', '$2a$11$rb3MR3qbSnqp9UAYEzZFcuqXYEwoo12YdaGP0xKr5CyGm1hCBk.ri'),
	(2, 'admin2', '$2a$11$AhVZDGt07TLXAC8zJBKV4./kMyD36BWx7tWZSd4qm/dnUBqn0H1hu'),
	(3, 'Доманская', '$2a$11$5p2vVQAx1Ckwis0Dtm10X.6snspqBYQ6XuZV0qenWUI13IpG5jMLi'),
	(4, 'shaurun', '$2a$11$5wSfN5H72lfN3XEG7XBtm.gGBrvBFCMvzp9ywBq6zCCGQfAFDcula');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.user_roles: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;


-- Дамп структуры для таблица polyglot.words
CREATE TABLE IF NOT EXISTS `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL,
  `translation` varchar(255) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  CONSTRAINT `words_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы polyglot.words: ~53 rows (приблизительно)
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` (`id`, `word`, `translation`, `lesson_id`, `topic_id`) VALUES
	(1, 'cat', 'кот', 1, 1),
	(2, 'dog', 'собака', 1, 1),
	(3, 'life', 'жизнь', 1, NULL),
	(4, 'house', 'дом', 1, 4),
	(5, 'bed', 'кровать', 1, NULL),
	(12, 'bonjour', 'доброе утро', 7, 7),
	(13, 'acheter', 'купить', 7, 9),
	(14, 'mauvaise dent', 'больной зуб', 7, 8),
	(18, 'bleu', 'синий', 7, 13),
	(20, 'feu de circulation', 'светофор', 7, 11),
	(21, 'vendre', 'продать', 7, 9),
	(22, 'to travel', 'путешествовать', 1, 2),
	(23, 'crocodile', 'крокодил', 2, 1),
	(24, 'parent', 'родитель', 2, 14),
	(25, 'father', 'папа', 2, 14),
	(26, 'mother', 'мама', 2, 14),
	(27, 'sister', 'сестра', 2, 14),
	(28, 'brother', 'брат', 2, 14),
	(29, 'health', 'здоровье', 2, 15),
	(30, 'hospital', 'госпиталь', 2, 15),
	(31, 'こんにちは', 'добрый день', 10, NULL),
	(32, 'こんばんは', 'добрый вечер', 10, NULL),
	(33, '看護師', 'медсестра', 10, 16),
	(34, '歯', 'зуб', 10, NULL),
	(35, '獣医師', 'ветеринарный врач', 10, 16),
	(36, '犬', 'собака', 10, 17),
	(37, 'trauer', 'грусть', 11, 19),
	(38, 'tod', 'смерть', 11, NULL),
	(39, 'hallo', 'привет', 11, 18),
	(40, 'adieu', 'пока', 11, 18),
	(41, 'freund', 'друг', 11, NULL),
	(42, 'ich', 'я', 12, 21),
	(43, 'du', 'ты', 12, 21),
	(44, 'wir', 'мы', 12, 21),
	(45, 'er', 'он', 12, 21),
	(46, 'sie', 'она', 12, 21),
	(47, 'es', 'они', 12, 21),
	(48, 'familie', 'семья', 13, 20),
	(49, 'papa', 'папа', 13, 20),
	(50, 'gute nacht', 'спокойной ночи', 13, 18),
	(51, 'guten appetit', 'приятного аппетита', 13, 18),
	(52, 'lieben', 'любить', 13, 19),
	(55, 'rue', 'улица', 9, 11),
	(56, 'pourquoi', 'почему', 9, NULL),
	(57, 'petit déjeuner', 'завтрак', 9, 12),
	(58, 'ordre', 'заказ', 9, 9),
	(59, 'client', 'клиент', 9, 9),
	(60, 'médecin', 'врач', 9, 8),
	(61, 'absque omni exceptione', 'без всякого сомнения', 15, 29),
	(62, 'ab exterioribus ad interiora', 'от внешнего к внутреннему', 15, 29),
	(64, 'a contratio', 'доказывать от противного', 15, 29),
	(65, 'ad exstra', 'до крайней степени', 15, 29),
	(72, 'he', 'он', 16, 36);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
