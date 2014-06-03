-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2014 at 04:03 PM
-- Server version: 5.5.34-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Chapull_Market_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add swapper', 7, 'add_swapper'),
(20, 'Can change swapper', 7, 'change_swapper'),
(21, 'Can delete swapper', 7, 'delete_swapper'),
(22, 'Can add item', 8, 'add_item'),
(23, 'Can change item', 8, 'change_item'),
(24, 'Can delete item', 8, 'delete_item'),
(25, 'Can add swap', 9, 'add_swap'),
(26, 'Can change swap', 9, 'change_swap'),
(27, 'Can delete swap', 9, 'delete_swap');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$bd98KRZ7Z2KB$oJGhtLJ3DGpDSsxz1N9lykujYFgm+Buwgbk5PSyEuDM=', '2014-01-16 14:37:39', 1, 'eren', '', '', 'eren5li@gmail.com', 1, 1, '2014-01-16 14:37:39'),
(2, 'pbkdf2_sha256$12000$VVPe2bPeLwF7$Irb06YWHoke6ybQ20jCKIcM/OaG0SXe0XtOEWxm+aEI=', '2014-01-16 15:08:32', 0, 'ali', '', '', 'ali@gmail.com', 0, 1, '2014-01-16 15:08:32'),
(4, 'pbkdf2_sha256$12000$xERCSLjpW2BY$FcoJzxLwt6wOugu1NDdgPhOD0ozHa/u7oMn4EXrIf5g=', '2014-01-21 00:16:31', 0, 'yigit', '', '', 'ali@gmail.com', 0, 1, '2014-01-16 15:09:28'),
(5, 'pbkdf2_sha256$12000$YGMT8MhuBhdR$ZBHahnOlDHV1ZCsk/SA15+9/+f9du0kRr1+GXyC+pe0=', '2014-01-21 10:18:53', 0, 'ayse', '', '', 'ayse@gmail.com', 0, 1, '2014-01-16 15:10:01'),
(6, 'pbkdf2_sha256$12000$XI64sEJDtuB3$MrGDNZeVzLU1dS+hUzVVbXpFagMguidmoDYKLvGm9n8=', '2014-01-21 10:18:00', 0, 'zeynep', '', '', 'zeynep@gmail.com', 0, 1, '2014-01-20 23:00:53'),
(7, 'pbkdf2_sha256$12000$I87Th7vMqT0t$4AuzlhXzxc+2dnohIqgdRrNWxyHulbP6Csi620DPKy4=', '2014-01-21 10:12:18', 0, 'kerem', '', '', 'kerem@gmail.com', 0, 1, '2014-01-20 23:04:57'),
(8, 'pbkdf2_sha256$12000$4xIxO4gM4d14$5egXgpTwfFMNIXlVqS/i4lAzkaU8lH1a/rte1zw0YMo=', '2014-01-21 10:24:54', 0, 'veli', '', '', 'veli@gmail.com', 0, 1, '2014-01-21 10:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'swapper', 'swapper', 'swapper'),
(8, 'item', 'swapper', 'item'),
(9, 'swap', 'swapper', 'swap');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('a6iuj9npzwxpmsc0vh4qm9q36fd3xqio', 'NTBlMDUzZjIwMTBiNDVlZjMwYWRkOGUwNmUzNjRiMTk5ZWE4NjNmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Nn0=', '2014-02-03 23:15:02'),
('eknuoflusp23ge5yalukd5cldl2zglyk', 'MGUzMzBjMDM5NjlkNmZiY2FiMDhhZTg0Zjk0Y2U1M2VkOTgxZDMyODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=', '2014-01-30 15:10:09'),
('lmnum7a35q2zpwrl80mdrxuoplewmda3', 'MGUzMzBjMDM5NjlkNmZiY2FiMDhhZTg0Zjk0Y2U1M2VkOTgxZDMyODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=', '2014-02-04 10:18:53'),
('w7tppql8qzgp6i6pblhpnw13wrnlad40', 'MDM3YzY0MzMwMzk5YTQ4YTE0MjVlMTcxMmQ5Yjk3ZGYzNmU3NTE0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=', '2014-02-04 10:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `swapper_item`
--

CREATE TABLE IF NOT EXISTS `swapper_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_model` varchar(30) NOT NULL,
  `item_status` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `item_swapper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `swapper_item_18eb8a87` (`item_swapper_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `swapper_item`
--

INSERT INTO `swapper_item` (`id`, `item_model`, `item_status`, `slug`, `image1`, `item_swapper_id`) VALUES
(4, 'empty', 'empty', 'empty', 'empty', 2),
(11, 'macbook_pro', 'iyi', 'macbook_pro', 'static/macbook_pro.jpg', 4),
(12, 'ipod_shuffle', 'iyi', 'ipod_shuffle', 'static/ipod_shuffle.jpg', 4),
(13, 'kulaklik', 'iyi', 'kulaklik', 'static/kulaklik.jpg', 5),
(14, 'sony_tv', 'iyi', 'sony_tv', 'static/sony_tv.jpg', 5),
(15, 'thinkpad', 'eski', 'thinkpad', 'static/thinkpad.jpg', 3),
(16, 'saat', 'iyi', 'saat', 'static/saat.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `swapper_swap`
--

CREATE TABLE IF NOT EXISTS `swapper_swap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swap_status` varchar(100) NOT NULL,
  `swapper_id` int(11) NOT NULL,
  `other_swapper_id` int(11) NOT NULL,
  `swapper_item_id` int(11) NOT NULL,
  `other_swapper_item_id` int(11) NOT NULL,
  `swapper_dec` varchar(100) NOT NULL,
  `other_swapper_dec` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swapper_swap_5941eea9` (`swapper_id`),
  KEY `swapper_swap_fc7e8340` (`other_swapper_id`),
  KEY `swapper_swap_5a5fe2d4` (`swapper_item_id`),
  KEY `swapper_swap_11997e61` (`other_swapper_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `swapper_swap`
--

INSERT INTO `swapper_swap` (`id`, `swap_status`, `swapper_id`, `other_swapper_id`, `swapper_item_id`, `other_swapper_item_id`, `swapper_dec`, `other_swapper_dec`) VALUES
(1, 'closed', 4, 3, 4, 11, 'empty', 'cancel'),
(2, 'completed', 4, 3, 15, 11, 'accept', 'accept'),
(3, 'in progress', 3, 5, 4, 14, 'empty', 'empty');

-- --------------------------------------------------------

--
-- Table structure for table `swapper_swapper`
--

CREATE TABLE IF NOT EXISTS `swapper_swapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `swapper_swapper`
--

INSERT INTO `swapper_swapper` (`id`, `user_id`, `name`, `address`, `slug`) VALUES
(2, 4, 'Ali Yilmaz', 'asd', 'yigit'),
(3, 5, 'Ayse Yilmaz', 'asd', 'ayse'),
(4, 6, 'Zeynep Yildirim', 'menekse sok.', 'zeynep'),
(5, 7, 'Kerem Uzun', 'menekse sok.', 'kerem'),
(6, 8, 'Veli Yildirim', 'menekse sok.', 'veli');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `swapper_item`
--
ALTER TABLE `swapper_item`
  ADD CONSTRAINT `item_swapper_id_refs_id_e8006010` FOREIGN KEY (`item_swapper_id`) REFERENCES `swapper_swapper` (`id`);

--
-- Constraints for table `swapper_swap`
--
ALTER TABLE `swapper_swap`
  ADD CONSTRAINT `other_swapper_id_refs_id_a687407f` FOREIGN KEY (`other_swapper_id`) REFERENCES `swapper_swapper` (`id`),
  ADD CONSTRAINT `other_swapper_item_id_refs_id_f8cb93c6` FOREIGN KEY (`other_swapper_item_id`) REFERENCES `swapper_item` (`id`),
  ADD CONSTRAINT `swapper_id_refs_id_a687407f` FOREIGN KEY (`swapper_id`) REFERENCES `swapper_swapper` (`id`),
  ADD CONSTRAINT `swapper_item_id_refs_id_f8cb93c6` FOREIGN KEY (`swapper_item_id`) REFERENCES `swapper_item` (`id`);

--
-- Constraints for table `swapper_swapper`
--
ALTER TABLE `swapper_swapper`
  ADD CONSTRAINT `user_id_refs_id_2d4d65e0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
