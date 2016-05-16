-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2016 at 10:07 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `foodorder`
--
CREATE DATABASE IF NOT EXISTS `foodorder` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `foodorder`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `line1` text NOT NULL,
  `line2` text,
  `city` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `line1`, `line2`, `city`, `phone`) VALUES
(1, 3, 'Shashank Shetye Saudagar', 'G-2 Evergreen Appts,', 'Khorlim', 'Mapusa', '9158514761'),
(2, 3, 'Shashank Shetye Saudagar', 'Hostel 2, Goa college of engineering,', 'Farmagudi', 'Ponda', '9158514761'),
(3, 3, 'Michelle', 'Girls Hostel', 'GEC', 'Farmagudi Ponda', '9765024148'),
(4, 3, 'Dattaprasad Ekavade', 'Room No 113', 'GEC Hostel 1', 'Farmagudi Ponda', '9765819921');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `categ` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categ`) VALUES
(1, 'Chinese'),
(4, 'Goan'),
(2, 'Punjabi'),
(3, 'Rajasthani'),
(5, 'Sea Food'),
(6, 'Tandoor');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
`id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `percent` int(11) NOT NULL,
  `minprice` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `code`, `percent`, `minprice`, `status`) VALUES
(1, 'Spicy250', 10, 250, 0),
(2, 'NonVeggie50', 50, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fooditems`
--

DROP TABLE IF EXISTS `fooditems`;
CREATE TABLE IF NOT EXISTS `fooditems` (
`id` int(11) NOT NULL,
  `itemname` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `fooditems`
--

INSERT INTO `fooditems` (`id`, `itemname`, `category_id`, `price`) VALUES
(3, 'Roti', 6, 15),
(4, 'Butter Roti', 6, 25),
(5, 'Butter Chicken', 2, 120),
(6, 'Dal Makhani', 2, 90),
(7, 'Dal Fry', 3, 65),
(8, 'Dal Tadka', 3, 75),
(9, '1000 rice', 1, 110);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=not completed, 1=new, 2=Ready, 3=Transit, 4=Delivered'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `discount_id`, `price`, `addressid`, `status`) VALUES
(2, 3, 1, 410, 3, 4),
(5, 3, 1, 324, 1, 4),
(6, 3, 2, 305, 2, 4),
(7, 3, 2, 205, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_fooditems`
--

DROP TABLE IF EXISTS `order_fooditems`;
CREATE TABLE IF NOT EXISTS `order_fooditems` (
  `order_id` int(11) NOT NULL,
  `fooditems_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_fooditems`
--

INSERT INTO `order_fooditems` (`order_id`, `fooditems_id`, `quantity`, `remarks`) VALUES
(2, 3, 4, ''),
(2, 5, 2, 'Extra butter'),
(2, 6, 1, 'Spicy'),
(2, 7, 1, ''),
(5, 4, 6, ''),
(5, 5, 1, 'Spicy'),
(5, 6, 1, 'Thik se Pakana'),
(6, 3, 10, ''),
(6, 5, 2, 'Spicy'),
(6, 9, 2, ''),
(7, 3, 6, ''),
(7, 5, 1, 'Spicy'),
(7, 6, 1, 'Pack Seperately'),
(7, 9, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` tinyint(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `type`) VALUES
(1, 'Admin', 'admin@foodorder.com', 'admin', 0),
(2, 'Manager', 'manager@foodorder.com', 'manager', 1),
(3, 'Shashank Shetye Saudagar', 'shashanksaudagar@gmail.com', 'shashank', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `addr` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `categ` (`categ`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `fooditems`
--
ALTER TABLE `fooditems`
 ADD PRIMARY KEY (`id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`,`discount_id`), ADD KEY `addressid` (`addressid`), ADD KEY `discorder` (`discount_id`);

--
-- Indexes for table `order_fooditems`
--
ALTER TABLE `order_fooditems`
 ADD PRIMARY KEY (`order_id`,`fooditems_id`), ADD KEY `order_id` (`order_id`,`fooditems_id`), ADD KEY `jointblfood` (`fooditems_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fooditems`
--
ALTER TABLE `fooditems`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `addrusr` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `fooditems`
--
ALTER TABLE `fooditems`
ADD CONSTRAINT `categfood` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `addrordr` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `discordr` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `usrorder` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_fooditems`
--
ALTER TABLE `order_fooditems`
ADD CONSTRAINT `jointblfood` FOREIGN KEY (`fooditems_id`) REFERENCES `fooditems` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `jointblodr` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
