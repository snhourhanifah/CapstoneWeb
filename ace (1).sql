-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2017 at 05:22 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ace`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getcourseid`( code varchar(50)) RETURNS int(11)
begin
declare cid  int (11);
select courseid into cid from course where description = code;
return cid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getexamid`( classid int(11), examtitle text, edate date) RETURNS int(11)
begin
declare eid int (11);
select examid into eid from exam where exam_recipient = classid and title = examtitle and examdate = edate;
return eid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getid`( fname varchar(50), lname varchar(50), mname varchar(50) ) RETURNS int(11)
begin
declare myid int(11);
select userid into myid from user where firstname=fname and lastname=lname and middlename=mname;
return myid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getmyclassid`(sect varchar(20), ins int(11), course int(11), sem varchar(25), acadyr year) RETURNS int(11)
begin
declare clid int (11);
select classid into clid from class where section=sect and instructorid=ins and courseid=course and semester=sem and acadyear=acadyr;
return clid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getmyid`(idnumber varchar(20)) RETURNS int(11)
begin
declare id int (11);
select userid into id from user where password=idnumber;
return id;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getOptionID`(qid int(11), content varchar(50)) RETURNS int(11)
begin
declare myid int(11);
select optionid into myid from multiplechoiceoptions where question=qid and optioncontent=content;
return myid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getqid`( des text, qt varchar(30), w int(11)) RETURNS int(11)
begin
declare qid int (11);
select questionid into qid from questions where description = des and weight = w and questiontype = qt;
return qid;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getQuestionsForACourse`(clid int(11)) RETURNS int(11)
begin
declare totaltakers int (11);
select count(questionid) into totaltakers  from questions where courseid= clid;
return totaltakers;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getSubExamTakers`(examid int(11)) RETURNS int(11)
begin
declare totaltakers int (11);
select count(userid) into totaltakers  from examstudent where examtakenid = examid;
return totaltakers;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalExamTakers`(clid int(11)) RETURNS int(11)
begin
declare totaltakers int (11);
select count(myid) into totaltakers  from class_Student where myclassid = clid;
return totaltakers;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(25) NOT NULL,
  `instructorid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `acadyear` year(4) DEFAULT NULL,
  `semester` varchar(25) DEFAULT NULL,
  `marker` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`classid`),
  UNIQUE KEY `marker` (`marker`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classid`, `section`, `instructorid`, `courseid`, `acadyear`, `semester`, `marker`) VALUES
(8, 'GgMN', 1, 21, 2015, '2nd Semester', NULL),
(10, 'Yy', 1, 22, 2015, '2nd Semester', NULL),
(11, 'DdEe1', 1, 23, 2015, '2nd Semester', NULL),
(12, 'LlMm', 1, 24, 2015, '2nd Semester', NULL),
(14, 'VvWw2', 1, 25, 2016, '2nd Semester', NULL),
(15, 'EeFf', 1, 25, 2016, '2nd Semester', NULL),
(16, 'Oo', 1, 26, 2016, '1st Semester', NULL),
(17, 'Ee', 1, 26, 2016, '1st Semester', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classmates`
--
CREATE TABLE IF NOT EXISTS `classmates` (
`firstname` varchar(50)
,`middlename` varchar(50)
,`lastname` varchar(50)
,`username` varchar(50)
,`password` varchar(25)
,`myid` int(11)
,`classid` int(11)
,`instructorid` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `class_student`
--

CREATE TABLE IF NOT EXISTS `class_student` (
  `myclassid` int(11) NOT NULL,
  `myid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_student`
--

INSERT INTO `class_student` (`myclassid`, `myid`) VALUES
(8, 239),
(8, 240),
(8, 241),
(8, 242),
(8, 243),
(10, 249),
(10, 250),
(10, 251),
(10, 252),
(10, 253),
(10, 254),
(10, 255),
(10, 256),
(10, 257),
(10, 258),
(10, 259),
(10, 260),
(10, 261),
(10, 262),
(10, 263),
(10, 264),
(10, 265),
(10, 266),
(10, 267),
(11, 268),
(11, 269),
(11, 270),
(11, 271),
(11, 272),
(11, 273),
(11, 274),
(11, 275),
(11, 276),
(11, 277),
(11, 278),
(11, 279),
(11, 280),
(11, 281),
(11, 283),
(11, 285),
(11, 286),
(11, 288),
(11, 289),
(11, 290),
(11, 291),
(11, 292),
(12, 293),
(12, 294),
(12, 295),
(12, 296),
(12, 297),
(12, 298),
(12, 299),
(12, 300),
(12, 301),
(12, 302),
(12, 303),
(12, 304),
(12, 305),
(12, 306),
(12, 307),
(12, 308),
(12, 310),
(12, 311),
(12, 312),
(12, 313),
(12, 314),
(12, 316),
(12, 317),
(11, 319),
(11, 320),
(11, 321),
(11, 322),
(12, 322),
(14, 349),
(14, 350),
(14, 351),
(14, 352),
(14, 353),
(14, 354),
(14, 356),
(14, 357),
(14, 358),
(14, 359),
(14, 360),
(14, 361),
(14, 362),
(14, 363),
(14, 364),
(14, 366),
(14, 367),
(14, 368),
(14, 369),
(14, 370),
(14, 371),
(15, 323),
(15, 324),
(15, 325),
(15, 326),
(15, 327),
(15, 328),
(15, 329),
(15, 330),
(15, 331),
(15, 333),
(15, 334),
(15, 335),
(15, 336),
(15, 337),
(15, 338),
(15, 339),
(15, 340),
(15, 341),
(15, 342),
(15, 343),
(15, 344),
(15, 345),
(15, 346),
(16, 249),
(16, 250),
(16, 251),
(16, 252),
(16, 253),
(16, 254),
(16, 255),
(16, 256),
(16, 239),
(16, 257),
(16, 240),
(16, 407),
(16, 259),
(16, 241),
(16, 410),
(16, 262),
(16, 263),
(16, 264),
(16, 265),
(16, 266),
(16, 243),
(17, 249),
(17, 250),
(17, 419),
(17, 251),
(17, 252),
(17, 254),
(17, 255),
(17, 256),
(17, 239),
(17, 240),
(17, 259),
(17, 428),
(17, 410),
(17, 262),
(17, 263),
(17, 264),
(17, 265),
(17, 266),
(16, 319);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `coursecode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseid`, `description`, `coursecode`) VALUES
(21, 'Software Engineering', 'CSc 181'),
(22, 'Capstone Project 1', 'IT 191'),
(23, 'Introduction to Computers 1', 'CSc 1'),
(24, 'Introduction to Computers 2', 'CSc 2'),
(25, 'Introduction to Computer Programming', 'CSc 101'),
(26, 'Capstone Project 2', 'IT 192');

-- --------------------------------------------------------

--
-- Stand-in structure for view `eq_summary`
--
CREATE TABLE IF NOT EXISTS `eq_summary` (
`description` text
,`weight` int(11)
,`courseid` int(11)
,`questionid` int(11)
,`examid` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `exam_recipient` int(11) DEFAULT NULL,
  `examstatus` varchar(25) DEFAULT NULL,
  `examdate` date DEFAULT NULL,
  `expiredate` date DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  `title` text,
  `status` varchar(25) DEFAULT NULL,
  `start` varchar(25) DEFAULT NULL,
  `end` varchar(25) DEFAULT NULL,
  `totaltakers` int(20) DEFAULT NULL,
  `subtakers` int(20) DEFAULT NULL,
  PRIMARY KEY (`examid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`examid`, `exam_recipient`, `examstatus`, `examdate`, `expiredate`, `items`, `title`, `status`, `start`, `end`, `totaltakers`, `subtakers`) VALUES
(35, 10, NULL, '2015-07-20', NULL, 5, 'Take This', '', '22:00\n', '19:32', 19, 1),
(36, 8, NULL, '2015-07-20', NULL, 5, 'Take This 2', '', '22:00\n', '19:32', 5, 1),
(37, 8, NULL, '2015-07-20', NULL, 5, 'Bago', '', '22:00\n', '19:32', 5, 1),
(38, 10, NULL, '2015-07-20', NULL, 3, 'Tsu Tsu', '', '22:00\n', '19:32', 19, 1),
(39, 8, NULL, '2015-07-30', NULL, 4, 'check check', '', '11:29', '15:00', 5, 5),
(40, 8, NULL, '2015-08-12', NULL, 0, 'IT 192 Usability Test Exam', '', '10:00', '10:45', 5, 1),
(41, 10, NULL, '2015-08-12', NULL, 0, 'Usabilty Text Exam', '', '10:00', '10:45', 19, 1),
(42, 11, NULL, '2015-08-17', NULL, 10, 'Exam for Usability Testing', 'active', '10:00', '10:45', 22, 1),
(43, 10, NULL, '2015-08-17', NULL, 10, 'CSc 101 - Eeff Exam', '', '13:00', '14:00', 19, 1),
(44, 12, NULL, '2015-11-02', NULL, 0, '192 Capstone Exam', NULL, '21:00', '21:45', 24, 1),
(45, 12, NULL, '2015-11-02', NULL, 0, '192 Capstone Exam', NULL, '21:00', '21:30', 24, 1),
(46, 11, NULL, '2015-11-02', NULL, 0, '192 Capstone Exam', 'active', '21:00', '21:30', 22, 1),
(47, 12, NULL, '2015-11-03', NULL, 10, 'IT 192 - Capstone Exam', 'active', '08:30', '08:47', 24, 1),
(48, 8, NULL, '2017-01-13', NULL, 4, 'An Exam Title', 'active', '11:00', '11:30', 5, NULL),
(49, 12, NULL, '2016-05-19', NULL, 4, '', 'active', '11:00', '11:30', 24, NULL),
(50, 11, NULL, '2016-05-19', NULL, 2, '', 'active', '11:00', '11:30', 26, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examquestions`
--

CREATE TABLE IF NOT EXISTS `examquestions` (
  `examid` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examquestions`
--

INSERT INTO `examquestions` (`examid`, `questionid`) VALUES
(30, 27),
(31, 27),
(32, 27),
(33, 1),
(33, 2),
(33, 3),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(33, 10),
(33, 11),
(33, 12),
(34, 1),
(34, 2),
(34, 3),
(34, 6),
(34, 7),
(35, 1),
(35, 2),
(35, 3),
(35, 6),
(35, 7),
(36, 1),
(36, 2),
(36, 3),
(36, 6),
(36, 7),
(37, 1),
(37, 2),
(37, 3),
(37, 6),
(37, 7),
(38, 1),
(38, 2),
(38, 3),
(39, 1),
(39, 2),
(39, 3),
(39, 7),
(42, 1),
(42, 2),
(42, 3),
(42, 7),
(42, 8),
(42, 9),
(42, 10),
(42, 11),
(42, 12),
(42, 29),
(43, 1),
(43, 2),
(43, 3),
(43, 7),
(43, 8),
(43, 9),
(43, 10),
(43, 11),
(43, 12),
(43, 29),
(47, 1),
(47, 2),
(47, 3),
(47, 7),
(47, 8),
(47, 9),
(47, 10),
(47, 11),
(47, 12),
(47, 29),
(48, 1),
(48, 2),
(49, 28),
(49, 27),
(50, 31);

--
-- Triggers `examquestions`
--
DROP TRIGGER IF EXISTS `add_item`;
DELIMITER //
CREATE TRIGGER `add_item` AFTER INSERT ON `examquestions`
 FOR EACH ROW begin update exam set items=items+1
where examid = new.examid;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `examquestions_summary`
--
CREATE TABLE IF NOT EXISTS `examquestions_summary` (
`examid` int(11)
,`questionid` int(11)
,`description` text
,`questiontype` text
,`weight` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `examstudent`
--

CREATE TABLE IF NOT EXISTS `examstudent` (
  `examtakenid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `takendate` date DEFAULT NULL,
  `takentime` time DEFAULT NULL,
  `correctitems` int(11) DEFAULT NULL,
  `wrongitems` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `overall` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examstudent`
--

INSERT INTO `examstudent` (`examtakenid`, `userid`, `takendate`, `takentime`, `correctitems`, `wrongitems`, `score`, `overall`) VALUES
(35, 249, '2017-01-06', '00:07:48', 3, 2, 10, 20),
(39, 239, NULL, NULL, 2, 2, 10, 15),
(39, 240, NULL, NULL, 2, 2, 10, 15),
(39, 241, NULL, NULL, 2, 2, 10, 15),
(39, 242, NULL, NULL, 2, 2, 10, 15),
(39, 243, NULL, NULL, 2, 2, 8, 15);

--
-- Triggers `examstudent`
--
DROP TRIGGER IF EXISTS `updateSubTakers`;
DELIMITER //
CREATE TRIGGER `updateSubTakers` AFTER INSERT ON `examstudent`
 FOR EACH ROW begin
update exam set subtakers = getSubExamTakers(new.examtakenid)
where examid = new.examtakenid;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `examstudent_summary`
--
CREATE TABLE IF NOT EXISTS `examstudent_summary` (
`examtakenid` int(11)
,`takendate` date
,`takentime` time
,`score` int(11)
,`overall` int(11)
,`wrongitems` int(11)
,`correctitems` int(11)
,`userid` int(11)
,`firstname` varchar(50)
,`lastname` varchar(50)
,`middlename` varchar(50)
,`password` varchar(25)
,`username` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `examsummary`
--
CREATE TABLE IF NOT EXISTS `examsummary` (
`instructorid` int(11)
,`section` varchar(25)
,`semester` varchar(25)
,`acadyear` year(4)
,`courseid` int(11)
,`description` varchar(100)
,`coursecode` varchar(15)
,`examid` int(11)
,`exam_recipient` int(11)
,`examdate` date
,`items` int(11)
,`title` text
,`start` varchar(25)
,`end` varchar(25)
,`totaltakers` int(20)
,`subtakers` int(20)
,`status` varchar(25)
);
-- --------------------------------------------------------

--
-- Table structure for table `multiplechoiceoptions`
--

CREATE TABLE IF NOT EXISTS `multiplechoiceoptions` (
  `optionid` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) DEFAULT NULL,
  `optioncontent` text,
  `optiontype` text,
  PRIMARY KEY (`optionid`),
  UNIQUE KEY `optionid` (`optionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `multiplechoiceoptions`
--

INSERT INTO `multiplechoiceoptions` (`optionid`, `question`, `optioncontent`, `optiontype`) VALUES
(1, 1, 'Syntax', 'Correct'),
(2, 2, 'True', 'Correct'),
(3, 3, 'HTML', 'Correct'),
(4, 3, 'c++', 'Option'),
(5, 3, 'Java', 'Option'),
(7, 6, 'A', 'Correct'),
(8, 7, 'Variable', 'Correct'),
(9, 8, 'Array', 'Correct'),
(10, 9, 'True', 'Correct'),
(11, 10, 'C#', 'Option'),
(12, 10, 'Visual C++ .NET', 'Correct'),
(13, 10, 'Phyton', 'Option'),
(14, 11, 'Pseudocode', 'Correct'),
(15, 11, 'Method', 'Option'),
(16, 11, 'Class', 'Option'),
(17, 12, 'method', 'Correct'),
(18, 13, 'samsung', 'Correct'),
(19, 16, 'False', 'Correct'),
(20, 17, 'False', 'Correct'),
(21, 18, 'False', 'Correct'),
(22, 19, 'ok', 'Correct'),
(23, 20, 'True', 'Correct'),
(24, 21, 'a', 'Correct'),
(25, 22, 'True', 'Correct'),
(26, 23, 'ok', 'Correct'),
(27, 24, 'False', 'Correct'),
(28, 25, 'Unified Modelling Language', 'Correct'),
(29, 26, 'Conceptual Framerwork', 'Correct'),
(30, 26, 'Main Objectives', 'Option'),
(31, 26, 'Introduction', 'Option'),
(32, 27, 'True', 'Correct'),
(33, 28, 'True', 'Correct'),
(34, 29, 'Java', 'Correct'),
(35, 29, 'C++', 'Option'),
(36, 29, 'Python', 'Option'),
(37, 30, '', 'Correct'),
(38, 31, 'Justin Bieber', 'Correct'),
(39, 32, 'False', 'Correct');

-- --------------------------------------------------------

--
-- Stand-in structure for view `myclasses`
--
CREATE TABLE IF NOT EXISTS `myclasses` (
`classid` int(11)
,`section` varchar(25)
,`instructorid` int(11)
,`acadyear` year(4)
,`semester` varchar(25)
,`coursecode` varchar(15)
,`description` varchar(100)
,`courseid` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `mydistinctcourses`
--
CREATE TABLE IF NOT EXISTS `mydistinctcourses` (
`courseid` int(11)
,`instructorid` int(11)
,`coursecode` varchar(15)
,`description` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `myyears`
--
CREATE TABLE IF NOT EXISTS `myyears` (
`acadyear` year(4)
,`instructorid` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `questiontype` text,
  `weight` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionid`, `description`, `questiontype`, `weight`, `userid`, `courseid`) VALUES
(1, 'It is a property of a programming language that specifies the rules for creating a proper program in that language', 'Identification', 1, 1, 22),
(2, 'Is Java an example of OOP?', 'True or False', 2, 1, 22),
(3, 'Which of the following is not an OOP?', 'Multiple Choice', 6, 1, 22),
(6, 'What is the first character of the Alphabet?', 'Identification', 2, 1, 22),
(7, 'Every Java ______ has a name, a type, a size and a value. ', 'Identification', 3, 1, 22),
(8, 'It is a group of variables containing values that all have the same type.', 'Identification', 4, 1, 22),
(9, 'The length of an array is fixed.', 'True or False', 5, 1, 22),
(10, 'A new programming language based on c++ and java that was developed expressly for the .NET platform', 'Multiple Choice', 1, 1, 22),
(11, 'An informal language that helps programmers develop algorithms wihout having worry about the strict details of a language syntax', 'Multiple Choice', 5, 1, 22),
(12, 'It allows the programmer to modularize a program by separating its tasks into self-contained units', 'Identification', 3, 1, 22),
(13, 'My laptop brand is?', 'Identification', 2, 1, 22),
(16, 'Kumain ka na?', 'True or False', 2, 1, 22),
(17, 'naload na?', 'True or False', 1, 1, 22),
(18, 'nalagay ba?', 'True or False', 1, 1, 22),
(19, 'sample here againn..', 'Identification', 1, 1, 22),
(20, 'sample again and again', 'True or False', 1, 1, 22),
(21, 'a', 'Identification', 1, 1, 22),
(22, 'aaa', 'True or False', 1, 1, 22),
(23, 'hahaa', 'Identification', 11, 1, 22),
(24, 'Question smple...', 'True or False', 2, 1, 22),
(25, 'What does UML stands for?', 'Identification', 1, 1, 22),
(26, 'Which of the following is not included in writing Chapter 1?', 'Multiple Choice', 1, 1, 24),
(27, 'I am pretty.', 'True or False', 3, 1, 24),
(28, 'hello', 'True or False', 2, 1, 24),
(29, 'Which of the following languages is core of JQuery?', 'Multiple Choice', 2, 1, 22),
(30, 'aa', 'Identification', 2, 1, 36),
(31, 'Sorry is a song by..', 'Identification', 2, 1, 23),
(32, 'add this question', 'True or False', 2, 1, 25);

-- --------------------------------------------------------

--
-- Stand-in structure for view `questions_summary`
--
CREATE TABLE IF NOT EXISTS `questions_summary` (
`description` text
,`questionid` int(11)
,`questiontype` text
,`weight` int(11)
,`userid` int(11)
,`coursename` varchar(100)
,`coursecode` varchar(15)
,`courseid` int(11)
,`optionid` int(11)
,`optioncontent` text
,`optiontype` text
);
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `usertype` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=429 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `firstname`, `lastname`, `middlename`, `usertype`, `password`, `status`, `username`) VALUES
(1, 'Sittie Nhourhanifa', 'Guro', 'Mamailao', 'Faculty', '201027511', NULL, 'ecoyguro'),
(239, 'Nhor', 'DOMAOT', 'Olama', 'Student', '201115978', '', 'dno'),
(240, 'Sacaria', 'GULAM', 'Barabadan', 'Student', '201100777', '', 'gsb'),
(241, 'Sittie', 'MAULANA', 'Timbol', 'Student', '201124126', '', 'mst'),
(242, 'Angelica', 'OUANO', 'Peras', 'Student', '201105961', '', 'oap'),
(243, 'Sundosia', 'YUSOP', 'Mote', 'Student', '201122075', '', 'ysm'),
(249, 'Abufirash', 'ABDULHAMID ', 'Abdullah', 'Student', '200850009', '', 'aaa'),
(250, 'Farhan', 'ABDULKARIM', 'A.', 'Student', '201026253', '', 'afa'),
(251, 'Ali', 'ALA', 'Dimalotang', 'Student', '201120197', '', 'aad'),
(252, 'Solayem', 'ANSARI', 'Umpa', 'Student', '200952364', '', 'asu'),
(253, 'Imee', 'ANTONIDA', 'Medillo', 'Student', '201134514', '', 'aim'),
(254, 'Mansour', 'BALINDONG', 'Boloto', 'Student', '201124284', '', 'bmb'),
(255, 'Janimah', 'BAUNTO', 'Sacar', 'Student', '201121223', '', 'bjs'),
(256, 'Mohammad', 'DICA', 'Gao', 'Student', '201000663', '', 'dmg'),
(257, 'Jair', 'GUALVEZ', 'Plazo', 'Student', '201254644', '', 'gjp'),
(258, 'Ronie', 'GUINGGUE', 'Cacho', 'Student', '200214305', '', 'grc'),
(259, 'Naharah', 'MACABUAT', 'Malik', 'Student', '201133489', '', 'mnm'),
(260, 'Mohammad', 'MAGOMNANG', 'Marohomsalic', 'Student', '200955120', '', 'mmm'),
(261, 'Amanola', 'PANARA-AG', 'D', 'Student', '201032712', '', 'pad'),
(262, 'Ahmad', 'SAM', 'Abubakar', 'Student', '201242149', '', 'saa'),
(263, 'Kenrick', 'TAGLE', 'Paculba', 'Student', '201133439', '', 'tkp'),
(264, 'Abdullah', 'TAGO', 'Abdullah', 'Student', '200952593', '', 'taa'),
(265, 'Hassan', 'TAURAK', 'Miraato', 'Student', '201268590', '', 'thm'),
(266, 'Christian', 'TENEFRANCIA', 'Logronio', 'Student', '201102000', '', 'tcl'),
(267, 'Morjan', 'UMBAR', 'Tomawis', 'Student', '201025366', '', 'umt'),
(268, 'Sharief', 'ABANTAS', 'Abbas', 'Student', '201121756', '', 'asa'),
(269, 'Johanna', 'BALANGUE', 'Ayaon', 'Student', '200955201', '', 'bja'),
(270, 'Ralph', 'BRIONES', 'Santos', 'Student', '200848787', '', 'brs'),
(271, 'Joel', 'CUENCA', 'Ampo', 'Student', '201105889', '', 'cja'),
(272, 'Mohaimen', 'DIBARATUN', 'L', 'Student', '200928447', '', 'dml'),
(273, 'Kristel', 'DIZON', 'Ocon', 'Student', '201320165', '', 'dko'),
(274, 'Sohaila', 'FAROUK', 'Milano', 'Student', '200533167', '', 'fsm'),
(275, 'Ronah', 'FERRAREN', 'Jamil', 'Student', '201011025', '', 'frj'),
(276, 'Sittie', 'H. OMAR', 'Usman', 'Student', '201120913', '', 'hsu'),
(277, 'Asnairah', 'HADJI AMEN', 'Riga', 'Student', '201121127', '', 'har'),
(278, 'Alaizah', 'HADJI FAIZ', 'Ditingki', 'Student', '201120908', '', 'had'),
(279, 'Rasmina', 'INTO', 'Mambuay', 'Student', '201031643', '', 'irm'),
(280, 'Joephet', 'JAPOS', 'Baldeconza', 'Student', '200430480', '', 'jjb'),
(281, 'Precious', 'LEE', 'Balanay', 'Student', '201134708', '', 'lpb'),
(283, 'Aisah', 'MIMBALA', 'Macod', 'Student', '200952727', '', 'mam'),
(285, 'Apple', 'PALISAN', 'Matiga', 'Student', '201030988', '', 'pam'),
(286, 'Najerah', 'PANGANDAMAN', 'Bagul', 'Student', '201245685', '', 'pnb'),
(288, 'Zaynab', 'RAKIM', 'Masorong', 'Student', '201024534', '', 'rzm'),
(289, 'Faridah', 'ROMATO', 'Pangompig', 'Student', '201027339', '', 'rfp'),
(290, 'Normidah', 'SAMPACO', 'Sangca', 'Student', '201119997', '', 'sns'),
(291, 'Akisah', 'SUOD', 'Domado', 'Student', '201245238', '', 'sad'),
(292, 'Amerah', 'TAWANO', 'Cawi', 'Student', '200848837', '', 'tac'),
(293, 'Madjedah', 'AMINODIN', 'Balindong', 'Student', '200956653', '', 'amb'),
(294, 'Hannah', 'ARNADO', 'V', 'Student', '200804748', '', 'ahv'),
(295, 'Rohanisah', 'CARIS', 'Macaric', 'Student', '201119381', '', 'crm'),
(296, 'Fermin', 'CUSTODIO', 'Alimas', 'Student', '201022784', '', 'cfa'),
(297, 'Najwa', 'DAUD', 'Racman', 'Student', '201134161', '', 'dnr'),
(298, 'Sittie', 'DEROGONGAN', 'Serad', 'Student', '201120095', '', 'dss'),
(299, 'Nihara', 'DIRON', 'Hassan', 'Student', '201148883', '', 'dnh'),
(300, 'Jamel', 'HADJI ALI', 'Ampaso', 'Student', '201026905', '', 'hja'),
(301, 'Allyn', 'JUTBA', 'Lopez', 'Student', '201027330', '', 'jal'),
(302, 'Hasim', 'LANGKAY', 'Darimbang', 'Student', '201134053', '', 'lhd'),
(303, 'Amiladen', 'MABANING', 'N', 'Student', '200850873', '', 'man'),
(304, 'Saidah', 'MACAPAAR', 'M', 'Student', '200895320', '', 'msm'),
(305, 'Faisal', 'MANGONDATO', 'Guro', 'Student', '201100772', '', 'mfg'),
(306, 'Christopher', 'MANLIGUEZ', 'Brien', 'Student', '201047908', '', 'mcb'),
(307, 'Alanisah', 'METHALICOP', 'Arongo', 'Student', '201120952', '', 'maa'),
(308, 'Mohaimen', 'MOCTAR', 'Abdulcahar', 'Student', '200953121', '', 'mma'),
(310, 'Luigi', 'MONTEVEROS', 'Alberca', 'Student', '201242957', '', 'mla'),
(311, 'Alinader', 'OMAR', 'Masbud', 'Student', '201247409', '', 'oam'),
(312, 'Mohammad', 'PACASUM', 'Lucman', 'Student', '200743684', '', 'pml'),
(313, 'July', 'REDULA', 'M', 'Student', '201031609', '', 'rjm'),
(314, 'Elias', 'SACAR', 'Alero', 'Student', '200955255', '', 'sea'),
(315, 'Nobaisah', 'SUNGGOD', 'Guro', 'Student', '201119661', '', 'sng'),
(316, 'Junaisah', 'TUAN', 'Datumanong', 'Student', '200955276', '', 'tjd'),
(317, 'Caleb', 'VARGAS', 'Ociones', 'Student', '200850238', '', 'vco'),
(318, 'Monaifah', 'H. Abdulcader', 'Asugar', 'Faculty', '1058626', NULL, 'hm'),
(319, 'Jasifa', 'Ameril', 'Moctar', 'Student', '201127511', '', 'ajm'),
(322, 'Rasidah', 'Sarip', 'Guro', 'Student', '201227511', '', 'srg'),
(323, 'Abdurrahman', 'ABDULJALIL', 'Bayabao', 'Student', '201536644', '', 'aab'),
(324, 'Hamdani', 'ALGANDI', 'Saibin', 'Student', '201537087', '', 'ahs'),
(325, 'Al-hanzaliya', 'AMER', 'Pangcoga', 'Student', '201401279', '', 'aap'),
(326, 'Mohammad', 'ASAL', 'Simbanatao', 'Student', '201549758', '', 'ams'),
(327, 'Jalel', 'CALANDA', 'Mamalo', 'Student', '201401045', '', 'cjm'),
(328, 'Melvin', 'CALO', 'Dahunog', 'Student', '201404526', '', 'cmd'),
(329, 'NILVEN', 'GASTARDO', 'NAZARENO', 'Student', '201564562', '', 'gnn'),
(330, 'Kenneth', 'LUCERO', 'Santos', 'Student', '201400538', '', 'lks'),
(331, 'Rashied', 'MACATAMPO', 'Mudag', 'Student', '201403511', '', 'mrm'),
(333, 'Jalil', 'MAMAYO', 'Tanggo', 'Student', '201247954', '', 'mjt'),
(334, 'Jalizah', 'MANALUNDONG', 'Quimson', 'Student', '201539363', '', 'mjq'),
(335, 'Refa-e', 'MAROHOM', 'Abbas', 'Student', '201400244', '', 'mra'),
(336, 'Fatmah', 'MASNAR', 'Lininding', 'Student', '201305874', '', 'mfl'),
(337, 'Charlotte', 'MELLORIA', 'Israel', 'Student', '201310429', '', 'mci'),
(338, 'Kevin', 'OCON', 'Sombilon', 'Student', '201148789', '', 'oks'),
(339, 'Abdul', 'PAGADOR', 'Ayaon', 'Student', '201432194', '', 'paa'),
(340, 'Abdulazis', 'PANDAPATAN', 'Solaiman', 'Student', '201401251', '', 'pas'),
(341, 'Ma.', 'PEDRABLANCA', 'Hamboy', 'Student', '201318294', '', 'pmh'),
(342, 'Charliemagne', 'REYES', 'Amaba', 'Student', '201405702', '', 'rca'),
(343, 'Mary', 'SUMONOD', 'Jabian', 'Student', '201435563', '', 'smj'),
(344, 'Omar-Hamza', 'TAHIR', 'Harib', 'Student', '201011910', '', 'toh'),
(345, 'Daisy', 'WAMILDA', 'Watin', 'Student', '201405009', '', 'wdw'),
(346, 'Joselito', 'ZAPANTA', 'Catinoy', 'Student', '201317969', '', 'zjc'),
(349, 'Mohammad', 'ACRAMAN', 'Usman', 'Student', '201344995', '', 'amu'),
(350, 'Noaim', 'ALICASIM', 'Taher', 'Student', '201403815', '', 'ant'),
(351, 'Abdullah', 'AMEROL', 'Imam', 'Student', '201544864', '', 'aai'),
(352, 'NOSAER', 'AMPASO', 'AMPASO', 'Student', '201571332', '', 'ana'),
(353, 'Sittie', 'ANDANG', 'Pilingan', 'Student', '201402317', '', 'asp'),
(354, 'Bendaud', 'BATABOR', 'Magdara', 'Student', '201544510', '', 'bbm'),
(356, 'Nurhan', 'DIMARO', 'Salic', 'Student', '201403079', '', 'dns'),
(357, 'Omelkhair', 'DISIMBAN', 'Macapundag', 'Student', '201312306', '', 'dom'),
(358, 'John', 'DULGUIME', 'Navarro', 'Student', '201254191', '', 'djn'),
(359, 'Alnaisah', 'GURO', 'Datuimam', 'Student', '201431843', '', 'gad'),
(360, 'Isnihayah', 'HADJINAIF', 'Macapaar', 'Student', '201539583', '', 'him'),
(361, 'Mohammad', 'HASSAN', 'Acop', 'Student', '201306907', '', 'hma'),
(362, 'Mohsin', 'JAMEL', 'Ibrahim', 'Student', '201305378', '', 'jmi'),
(363, 'Norjannah', 'MANALUNDONG', 'Sangcopan', 'Student', '201538894', '', 'mns'),
(364, 'JAMALIAH', 'MANGONDATO', 'ACOON', 'Student', '201130368', '', 'mja'),
(366, 'JOHN', 'NAIGAL', 'BESAS', 'Student', '201339436', '', 'njb'),
(367, 'Isnihaya', 'PANGCATAN', 'Mulok', 'Student', '201423128', '', 'pim'),
(368, 'Charina', 'PORDALIZA', 'Culanag', 'Student', '201542636', '', 'pcc'),
(369, 'Jamil', 'PUMBAYA', 'Alawi', 'Student', '201403080', '', 'pja'),
(370, 'Alejandro', 'SAGA', 'Caadlawon', 'Student', '201269265', '', 'sac'),
(371, 'Candace', 'SULIMA', 'Castuya', 'Student', '201254361', '', 'scc'),
(407, 'Honey', 'LOOD', 'Abes', 'Student', '200848079', '', 'lha'),
(410, 'Asminah', 'RASCAL', 'Daud', 'Student', '201134197', '', 'rad'),
(419, 'Rajeb', 'ACRAMAN', 'Natangcop', 'Student', '200742387', '', 'arn'),
(428, 'Hanif', 'NASSER', 'Catamanan', 'Student', '200847470', '', 'nhc');

-- --------------------------------------------------------

--
-- Structure for view `classmates`
--
DROP TABLE IF EXISTS `classmates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classmates` AS select `u`.`firstname` AS `firstname`,`u`.`middlename` AS `middlename`,`u`.`lastname` AS `lastname`,`u`.`username` AS `username`,`u`.`password` AS `password`,`cs`.`myid` AS `myid`,`c`.`classid` AS `classid`,`c`.`instructorid` AS `instructorid` from ((`user` `u` join `class_student` `cs` on((`cs`.`myid` = `u`.`userid`))) join `class` `c` on((`c`.`classid` = `cs`.`myclassid`)));

-- --------------------------------------------------------

--
-- Structure for view `eq_summary`
--
DROP TABLE IF EXISTS `eq_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eq_summary` AS select `q`.`description` AS `description`,`q`.`weight` AS `weight`,`q`.`courseid` AS `courseid`,`eq`.`questionid` AS `questionid`,`e`.`examid` AS `examid` from ((`questions` `q` join `examquestions` `eq` on((`eq`.`questionid` = `q`.`questionid`))) join `exam` `e` on((`e`.`examid` = `eq`.`examid`)));

-- --------------------------------------------------------

--
-- Structure for view `examquestions_summary`
--
DROP TABLE IF EXISTS `examquestions_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examquestions_summary` AS select `e`.`examid` AS `examid`,`eq`.`questionid` AS `questionid`,`q`.`description` AS `description`,`q`.`questiontype` AS `questiontype`,`q`.`weight` AS `weight` from ((`exam` `e` join `examquestions` `eq` on((`eq`.`examid` = `e`.`examid`))) join `questions` `q` on((`q`.`questionid` = `eq`.`questionid`)));

-- --------------------------------------------------------

--
-- Structure for view `examstudent_summary`
--
DROP TABLE IF EXISTS `examstudent_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examstudent_summary` AS select `es`.`examtakenid` AS `examtakenid`,`es`.`takendate` AS `takendate`,`es`.`takentime` AS `takentime`,`es`.`score` AS `score`,`es`.`overall` AS `overall`,`es`.`wrongitems` AS `wrongitems`,`es`.`correctitems` AS `correctitems`,`u`.`userid` AS `userid`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`middlename` AS `middlename`,`u`.`password` AS `password`,`u`.`username` AS `username` from (`examstudent` `es` join `user` `u` on((`es`.`userid` = `u`.`userid`)));

-- --------------------------------------------------------

--
-- Structure for view `examsummary`
--
DROP TABLE IF EXISTS `examsummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examsummary` AS select `c`.`instructorid` AS `instructorid`,`c`.`section` AS `section`,`c`.`semester` AS `semester`,`c`.`acadyear` AS `acadyear`,`crs`.`courseid` AS `courseid`,`crs`.`description` AS `description`,`crs`.`coursecode` AS `coursecode`,`e`.`examid` AS `examid`,`e`.`exam_recipient` AS `exam_recipient`,`e`.`examdate` AS `examdate`,`e`.`items` AS `items`,`e`.`title` AS `title`,`e`.`start` AS `start`,`e`.`end` AS `end`,`e`.`totaltakers` AS `totaltakers`,`e`.`subtakers` AS `subtakers`,`e`.`status` AS `status` from ((`class` `c` join `course` `crs` on((`c`.`courseid` = `crs`.`courseid`))) join `exam` `e` on((`e`.`exam_recipient` = `c`.`classid`)));

-- --------------------------------------------------------

--
-- Structure for view `myclasses`
--
DROP TABLE IF EXISTS `myclasses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myclasses` AS select `c`.`classid` AS `classid`,`c`.`section` AS `section`,`c`.`instructorid` AS `instructorid`,`c`.`acadyear` AS `acadyear`,`c`.`semester` AS `semester`,`crs`.`coursecode` AS `coursecode`,`crs`.`description` AS `description`,`crs`.`courseid` AS `courseid` from (`course` `crs` join `class` `c` on((`c`.`courseid` = `crs`.`courseid`)));

-- --------------------------------------------------------

--
-- Structure for view `mydistinctcourses`
--
DROP TABLE IF EXISTS `mydistinctcourses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydistinctcourses` AS select `c`.`courseid` AS `courseid`,`c`.`instructorid` AS `instructorid`,`crs`.`coursecode` AS `coursecode`,`crs`.`description` AS `description` from (`course` `crs` join `class` `c` on((`c`.`courseid` = `crs`.`courseid`)));

-- --------------------------------------------------------

--
-- Structure for view `myyears`
--
DROP TABLE IF EXISTS `myyears`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myyears` AS select distinct `class`.`acadyear` AS `acadyear`,`class`.`instructorid` AS `instructorid` from `class`;

-- --------------------------------------------------------

--
-- Structure for view `questions_summary`
--
DROP TABLE IF EXISTS `questions_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `questions_summary` AS select `q`.`description` AS `description`,`q`.`questionid` AS `questionid`,`q`.`questiontype` AS `questiontype`,`q`.`weight` AS `weight`,`q`.`userid` AS `userid`,`crs`.`description` AS `coursename`,`crs`.`coursecode` AS `coursecode`,`crs`.`courseid` AS `courseid`,`m`.`optionid` AS `optionid`,`m`.`optioncontent` AS `optioncontent`,`m`.`optiontype` AS `optiontype` from ((`course` `crs` join `questions` `q` on((`crs`.`courseid` = `q`.`courseid`))) join `multiplechoiceoptions` `m` on((`q`.`questionid` = `m`.`question`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
