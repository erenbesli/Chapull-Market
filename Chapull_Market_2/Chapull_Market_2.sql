-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2014 at 07:56 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$n5m6N6AjmDks$DTpQte5yJCmEJ85Y7NSuMmVR6iYHWu0lm6famagmmGI=', '2014-01-07 13:50:08', 1, 'eren', '', '', 'eren5li@gmail.com', 1, 1, '2014-01-07 12:43:55'),
(2, 'pbkdf2_sha256$12000$GKPoxWIR3sSV$IJHHF+RGnE4DsXWq+rMd8EpKVofA7pr6McH05mMHVXI=', '2014-01-07 15:04:26', 0, 'ali', '', '', 'ali@gmail.com', 0, 1, '2014-01-07 12:44:35'),
(3, 'pbkdf2_sha256$12000$T7PAAhyBgkZG$RzK0WSdJXNuRZuDYqvkc2XmSfJSMWsNFFztjzyoDJv4=', '2014-01-07 19:54:11', 0, 'ayse', '', '', 'ayse@gmail.com', 0, 1, '2014-01-07 13:39:05');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-01-07 12:47:06', 1, 8, '2', 'xbox_one', 1, ''),
(2, '2014-01-07 13:36:57', 1, 8, '1', 'xbox_one', 1, ''),
(3, '2014-01-07 13:41:53', 1, 8, '2', 'toshiba', 1, ''),
(4, '2014-01-07 13:48:10', 1, 8, '3', 'ps4', 1, ''),
(5, '2014-01-07 13:50:14', 1, 8, '3', 'ps4', 2, 'Changed item_swapper.');

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
('f5lrpkopsukybrnk286ews5a1fro1cmd', 'NmFiNzYzMjE4OWM2NmJkMGIyNWQ4NzUyYWZiOGY4NjA4MmJkMGIyYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=', '2014-01-21 19:54:11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `swapper_item`
--

INSERT INTO `swapper_item` (`id`, `item_model`, `item_status`, `slug`, `image1`, `item_swapper_id`) VALUES
(1, 'xbox_one', 'yeni', 'xbox_one', 'uploaded_files/1389101817_78_Screenshot from 2013-12-14 125236.jpg', 1),
(2, 'toshiba', 'sifir', 'toshiba', 'uploaded_files/1389102113_04_Screenshot from 2013-12-14 14:39:10.png', 1),
(3, 'ps4', 'bad', 'ps_4', 'uploaded_files/1389102490_18_Screenshot from 2013-12-14 13:17:41.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `swapper_swap`
--

CREATE TABLE IF NOT EXISTS `swapper_swap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swap_status` varchar(100) NOT NULL,
  `item_owner_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `swap_owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swapper_swap_1210ae25` (`item_owner_id`),
  KEY `swapper_swap_0a47aae8` (`item_id`),
  KEY `swapper_swap_2d354f47` (`swap_owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `swapper_swap`
--

INSERT INTO `swapper_swap` (`id`, `swap_status`, `item_owner_id`, `item_id`, `swap_owner_id`) VALUES
(1, 'accepted', 1, 1, 2),
(2, 'closed', 1, 1, 2),
(3, 'closed', 1, 2, 2),
(4, 'accepted', 2, 3, 1),
(5, 'in progress', 2, 3, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `swapper_swapper`
--

INSERT INTO `swapper_swapper` (`id`, `user_id`, `name`, `address`, `slug`) VALUES
(1, 2, 'Ali Yilmaz', 'menekse sok.', 'ali'),
(2, 3, 'Ayse Yilmaz', 'menekse sok.', 'ayse');

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
  ADD CONSTRAINT `item_id_refs_id_f8cb93c6` FOREIGN KEY (`item_id`) REFERENCES `swapper_item` (`id`),
  ADD CONSTRAINT `item_owner_id_refs_id_a687407f` FOREIGN KEY (`item_owner_id`) REFERENCES `swapper_swapper` (`id`),
  ADD CONSTRAINT `swap_owner_id_refs_id_a687407f` FOREIGN KEY (`swap_owner_id`) REFERENCES `swapper_swapper` (`id`);

--
-- Constraints for table `swapper_swapper`
--
ALTER TABLE `swapper_swapper`
  ADD CONSTRAINT `user_id_refs_id_2d4d65e0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
