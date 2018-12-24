-- phpMyAdmin SQL Dump
-- version 3.3.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2010 at 08:27 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(7) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `albumArt` varchar(50) default NULL,
  `albumArtist` varchar(30) default NULL,
  `genre` varchar(20) default NULL,
  `releaseYear` year(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `name`, `albumArt`, `albumArtist`, `genre`, `releaseYear`) VALUES
(1, 'Aayirathil Oruvan', NULL, 'G V Prakash Kumar', NULL, 2010),
(2, 'Vinnaithaandi Varuvaaya', NULL, 'A R Rahman', 'love', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(7) NOT NULL auto_increment,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastPlayedDateTime` datetime default NULL,
  `url` varchar(150) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userID` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `username`, `name`, `lastPlayedDateTime`, `url`) VALUES
(12, 'mike', 'arr', NULL, 'e:\\playlist\\mike_arr.pl'),
(13, 'mike', 'hj', NULL, 'e:\\playlist\\mike_hj.pl'),
(14, 'Bairav', 'hj', NULL, 'e:\\playlist\\mike_hj.pl'),
(15, 'Bairav1', 'hj', NULL, 'e:\\playlist\\mike_hj.pl');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `id` int(7) NOT NULL auto_increment,
  `albumID` int(7) NOT NULL,
  `title` varchar(30) NOT NULL,
  `track` int(2) NOT NULL,
  `artist` varchar(30) NOT NULL,
  `songLength` time NOT NULL,
  `rating` int(1) NOT NULL,
  `playCount` int(5) NOT NULL,
  `lastPlayedDateTime` datetime default NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `albumID` (`albumID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `albumID`, `title`, `track`, `artist`, `songLength`, `rating`, `playCount`, `lastPlayedDateTime`, `url`) VALUES
(1, 1, 'Oh Eesa', 1, 'Karthick, Andrea Jereniah', '00:05:16', 3, 2, '2010-04-01 21:31:00', 'tamil/Oh Eesa.mp3'),
(2, 1, 'Un mela aasai', 2, 'Dhanush, Andrea Jereniah', '00:04:31', 3, 5, '2010-04-03 21:33:27', 'tamil/Un Mela.mp3'),
(3, 2, 'Omana Penne', 3, 'Benny Dayal', '00:00:47', 4, 4, '2010-04-11 18:34:05', 'tamil/Omana Penne.mp3'),
(4, 2, 'Kannukul Kannai', 4, 'Naresh Ayer', '00:04:30', 2, 1, NULL, 'tamil/Kannukul Kannai.mp3'),
(5, 2, 'Hosana', 1, 'A R Rahman', '00:04:23', 5, 90, NULL, 'tamil/Hosana.mp3'),
(6, 1, 'Maalai Neram', 7, '', '00:05:57', 2, 180, NULL, 'tamil/Maalai Neram.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) default NULL,
  `firstName` varchar(20) default NULL,
  `lastName` varchar(20) default NULL,
  `lastLoginDateTime` datetime default NULL,
  `registeredDateTime` datetime default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `firstName`, `lastName`, `lastLoginDateTime`, `registeredDateTime`) VALUES
('admin', NULL, NULL, NULL, NULL, NULL),
('Bairav', 'asd', 'qwe', 'Jaissdasdon', NULL, NULL),
('Bairav1', 'qwe', 'Bairav', 'Murthy', NULL, NULL),
('mike', 'jaison', 'Michael', 'Jaison', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`albumID`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
