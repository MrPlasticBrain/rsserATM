-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2016 at 10:48 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rsser`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  `article` text NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_articles_categories` (`category`),
  KEY `category` (`category`),
  KEY `category_2` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category`, `title`, `intro`, `article`, `date`, `status`) VALUES
(1, 1, 'PHP is Awesome!', 'This is an article about PHP!', 'PHP: Hypertext Preprocessor', '2012-10-19 22:36:46', 'Y'),
(2, 4, 'What is Routing and why do we need it?', 'As you may or may not know, communication on the Internet uses packets for transmitting data.\r\n	So, every time your computer communicates with a computer on the Internet, IP packets are\r\n	used to transmit and receive data. ', '<p>\r\n	As you may or may not know, communication on the Internet uses packets for transmitting data.\r\n	So, every time your computer communicates with a computer on the Internet, IP packets are\r\n	used to transmit and receive data. \r\n</p>\r\n\r\n<p>\r\n	Your computer by itself can&rsquo;t deliver the packets all the way to the destination,\r\n	so it relies on other networking hardware on the way over to do their part. We could say that \r\n	Routing is a process of selecting the best paths through the network for forwarding packets \r\n	from source to their destination. \r\n</p>', '2012-10-19 23:05:15', 'Y'),
(3, 2, 'What is ASP.NET MVC?', '<strong>MVC</strong> stands for <strong>Model-View-Controller</strong>. MVC enables us to separate our logic from the \r\n	presentation. This philosophy is very popular for all the right reasons. One of the biggest advantages is the code re-usability. \r\n	There are other benefits, such as: We can let the designers edit the Views, without worrying that they will screw up database \r\n	access logic. What if we switch to another programming language, such as PHP? We can still use most of the presentation \r\n	logic with only minimal changes.', '<p>\r\n	<strong>MVC</strong> stands for <strong>Model-View-Controller</strong>. MVC enables us to separate our logic from the \r\n	presentation. This philosophy is very popular for all the right reasons. One of the biggest advantages is the code re-usability. \r\n	There are other benefits, such as: We can let the designers edit the Views, without worrying that they will screw up database \r\n	access logic. What if we switch to another programming language, such as PHP? We can still use most of the presentation \r\n	logic with only minimal changes.\r\n</p>\r\n\r\n<p>\r\n	So, to summarize:\r\n</p>\r\n\r\n<ul>\r\n	<li><strong>Model</strong> - Classes that connect and talk to the database</li>\r\n	<li><strong>View</strong> - presentation logic - HTML/CSS/JSON, etc</li>\r\n	<li><strong>Controller</strong> - loads View, talks to the the Model, does stuff that user asks it to</li>\r\n</ul>', '2012-10-19 23:07:09', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'PHP'),
(2, 'ASP.NET'),
(3, 'Photoshop'),
(4, 'Networking');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `message`) VALUES
(1, 'dsa', 'dsa', 'asd@asd.com', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE IF NOT EXISTS `logging` (
  `LogDate` datetime NOT NULL,
  `LogPerson` varchar(20) NOT NULL,
  `LogInfo` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logging`
--

INSERT INTO `logging` (`LogDate`, `LogPerson`, `LogInfo`) VALUES
('2016-01-11 22:44:40', 'ControllerRss', 'Call Controller Construct'),
('2016-01-11 22:44:41', 'ERROR: callRss', 'ERROR Execute: http://rss.cnn.com/rss/editiodsn.rss  ERROR->desc :Always throw this error'),
('2016-01-11 22:44:41', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-11 22:45:45', 'ControllerRss', 'Call Controller Construct'),
('2016-01-11 22:45:45', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-11 22:45:46', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-11 22:47:36', 'ControllerRss', 'Call Controller Construct'),
('2016-01-11 22:47:37', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-11 22:47:38', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-11 22:48:38', 'ControllerRss', 'Call Controller Construct'),
('2016-01-11 22:48:39', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-11 22:48:39', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:27:53', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:27:59', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:28:46', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:28:47', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-14 20:28:48', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:38:43', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:38:43', 'OK: callRss', 'Success Execute: http://feeds.foxnews.com/foxnews/latest'),
('2016-01-14 20:39:04', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:39:05', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-14 20:39:05', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:39:05', 'OK: callRss', 'Success Execute: http://feeds.foxnews.com/foxnews/latest'),
('2016-01-14 20:50:08', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:50:09', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-14 20:50:09', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:56:36', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:56:37', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 20:56:38', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:57:16', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:57:17', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 20:57:17', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 20:59:32', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 20:59:32', 'OK: callRss', 'Success Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int'),
('2016-01-14 21:03:04', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:04', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:03:28', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:28', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:03:57', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:57', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:03:58', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:58', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:03:58', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:58', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:03:59', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:03:59', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:05:11', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:05:11', 'ERROR: callRss', 'ERROR Execute: http://feeds.bbci.co.uk/news/rss.xml?edition=int  ERROR->desc :'),
('2016-01-14 21:06:04', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:07:21', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:11:23', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:15:28', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:15:56', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:16:45', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:18:35', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:19:17', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:19:19', 'ERROR: callRss', 'ERROR Execute: http://www.autoexpress.co.uk/feeds/all  ERROR->desc :'),
('2016-01-14 21:21:14', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:22:20', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:23:15', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:23:51', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:24:12', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:24:49', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:25:13', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:25:54', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:25:56', 'ERROR: callRss', 'ERROR Execute: http://www.autoexpress.co.uk/feeds/all  ERROR->desc :'),
('2016-01-14 21:40:41', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:41:25', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:41:45', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:41:48', 'ERROR: callRss', 'ERROR Execute: http://www.autoexpress.co.uk/feeds/all  ERROR->desc :'),
('2016-01-14 21:42:26', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:42:28', 'ERROR: callRss', 'ERROR Execute: http://rss.cnn.com/rss/edition.rss  ERROR->desc :'),
('2016-01-14 21:42:57', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:42:58', 'OK: callRss', 'Success Execute: http://rss.cnn.com/rss/edition.rss'),
('2016-01-14 21:44:33', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:44:34', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:44:54', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:44:55', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:04', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:05', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:18', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:19', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:25', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:26', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:36', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:37', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:44', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:45', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:45:55', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:45:56', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:46:09', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:46:09', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:46:23', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:46:23', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:46:35', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:46:36', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:46:44', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:46:44', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:46:58', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:46:58', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:47:07', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:47:08', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:48:03', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:58:36', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:58:38', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:59:17', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:59:18', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:59:33', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:59:33', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 21:59:57', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 21:59:58', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:00:16', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:00:18', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:01:11', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:01:12', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:01:37', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:01:39', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:02:01', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:02:02', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:02:09', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:02:10', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:02:54', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:02:55', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:04:03', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:04:26', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:06:59', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:07:02', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:07:30', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:07:31', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:08:54', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:08:55', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:10:14', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:10:14', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:10:46', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:10:47', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:11:44', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:11:45', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:12:16', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:12:17', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:14:38', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:14:39', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:14:52', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:14:52', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:15:29', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:15:30', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:15:46', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:15:47', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all'),
('2016-01-14 22:16:38', 'ControllerRss', 'Call Controller Construct'),
('2016-01-14 22:16:39', 'OK: callRss', 'Success Execute: http://www.autoexpress.co.uk/feeds/all');

-- --------------------------------------------------------

--
-- Table structure for table `rss_urls`
--

CREATE TABLE IF NOT EXISTS `rss_urls` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rssname` varchar(30) NOT NULL,
  `rssurl` longtext NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `inputdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `categoryId` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rss_urls_categories` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rss_urls`
--

INSERT INTO `rss_urls` (`id`, `rssname`, `rssurl`, `category`, `inputdate`, `categoryId`, `active`) VALUES
(1, 'CNN', 'http://rss.cnn.com/rss/edition.rss', 'top news', '2016-01-14 20:44:28', 1, 0),
(2, 'BBS', 'http://feeds.bbci.co.uk/news/rss.xml?edition=int', 'ALL', '2016-01-14 20:38:37', 2, 0),
(3, 'foxnews', 'http://feeds.foxnews.com/foxnews/latest', 'latest', '2016-01-14 20:38:40', 3, 0),
(4, 'autoexpress', 'http://www.autoexpress.co.uk/feeds/all', 'all', '2016-01-14 20:44:29', 4, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
