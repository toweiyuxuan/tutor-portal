-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-04-30 16:29:09
-- 服务器版本： 5.6.44-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wyx_jj`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` int(5) NOT NULL,
  `a_username` varchar(255) DEFAULT NULL,
  `a_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`a_id`, `a_username`, `a_password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- 表的结构 `mechanism`
--

CREATE TABLE IF NOT EXISTS `mechanism` (
  `u_id` int(5) NOT NULL,
  `m_area` int(5) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `m_address` varchar(255) DEFAULT NULL,
  `m_introduce` varchar(255) DEFAULT NULL,
  `m_contact` varchar(255) DEFAULT NULL,
  `m_tedian` varchar(255) DEFAULT NULL,
  `m_homepage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `mechanism`
--

INSERT INTO `mechanism` (`u_id`, `m_area`, `m_name`, `m_address`, `m_introduce`, `m_contact`, `m_tedian`, `m_homepage`) VALUES
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mechanismtype`
--

CREATE TABLE IF NOT EXISTS `mechanismtype` (
  `m_id` int(5) NOT NULL,
  `m_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `mechanismtype`
--

INSERT INTO `mechanismtype` (`m_id`, `m_name`) VALUES
(1, '美术'),
(2, '英语'),
(3, '课程');

-- --------------------------------------------------------

--
-- 表的结构 `mechanism_relation_mechanismtype`
--

CREATE TABLE IF NOT EXISTS `mechanism_relation_mechanismtype` (
  `m_r_m` int(5) NOT NULL,
  `m_id` int(5) DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `mphoto`
--

CREATE TABLE IF NOT EXISTS `mphoto` (
  `mp_id` int(5) NOT NULL,
  `u_id` int(5) DEFAULT NULL,
  `u_tel` varchar(50) DEFAULT NULL,
  `mp_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `mrelease`
--

CREATE TABLE IF NOT EXISTS `mrelease` (
  `r_id` int(5) NOT NULL,
  `r_time` date DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `m_area` int(5) DEFAULT NULL,
  `m_address` varchar(255) DEFAULT NULL,
  `m_introduce` varchar(255) DEFAULT NULL,
  `m_contact` varchar(255) DEFAULT NULL,
  `m_mechanismtype` varchar(255) DEFAULT NULL,
  `m_tedian` varchar(255) DEFAULT NULL,
  `m_teachertype` varchar(255) DEFAULT NULL,
  `m_limitgender` int(5) DEFAULT NULL,
  `m_tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `u_id` int(5) NOT NULL,
  `p_name` varchar(50) DEFAULT NULL,
  `p_area` int(5) DEFAULT NULL,
  `p_address` varchar(50) DEFAULT NULL,
  `p_money` int(5) DEFAULT NULL,
  `p_gender` int(5) DEFAULT NULL,
  `p_grade` int(5) DEFAULT NULL,
  `p_character` int(5) DEFAULT NULL,
  `p_limitgender` int(5) DEFAULT NULL,
  `p_other` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `parent`
--

INSERT INTO `parent` (`u_id`, `p_name`, `p_area`, `p_address`, `p_money`, `p_gender`, `p_grade`, `p_character`, `p_limitgender`, `p_other`) VALUES
(2, '疯狂的奶牛', 3, '西山森岭公园', 3, 2, 4, 3, 1, '无无无'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `parent_relation_subjecttype`
--

CREATE TABLE IF NOT EXISTS `parent_relation_subjecttype` (
  `p_r_s` int(5) NOT NULL,
  `s_id` int(5) DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `parent_relation_subjecttype`
--

INSERT INTO `parent_relation_subjecttype` (`p_r_s`, `s_id`, `u_id`) VALUES
(1, 2, 2),
(2, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `parent_relation_teachertype`
--

CREATE TABLE IF NOT EXISTS `parent_relation_teachertype` (
  `p_r_t` int(5) NOT NULL,
  `tt_id` int(5) DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `parent_relation_teachertype`
--

INSERT INTO `parent_relation_teachertype` (`p_r_t`, `tt_id`, `u_id`) VALUES
(1, 1, 2),
(2, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `pphoto`
--

CREATE TABLE IF NOT EXISTS `pphoto` (
  `u_id` int(5) NOT NULL,
  `pp_zaddress` varchar(255) DEFAULT NULL,
  `pp_faddress` varchar(255) DEFAULT NULL,
  `pp_saddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `pphoto`
--

INSERT INTO `pphoto` (`u_id`, `pp_zaddress`, `pp_faddress`, `pp_saddress`) VALUES
(2, '/ppupload/90f7ee0a-2f8a-4f8b-8b21-539f9b5e44ee.jpg', '/ppupload/5decea3f-7bb8-4d1b-9a7a-ac7434e20848.jpg', '/ppupload/324636b5-cd13-43a6-97a2-badf74e9124d.jpg'),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL),
(19, NULL, NULL, NULL),
(21, NULL, NULL, NULL),
(24, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `prelease`
--

CREATE TABLE IF NOT EXISTS `prelease` (
  `r_id` int(5) NOT NULL,
  `r_time` date DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL,
  `p_tel` varchar(50) DEFAULT NULL,
  `p_area` int(5) DEFAULT NULL,
  `p_address` varchar(50) DEFAULT NULL,
  `p_money` int(5) DEFAULT NULL,
  `p_gender` int(5) DEFAULT NULL,
  `p_grade` int(5) DEFAULT NULL,
  `p_character` int(5) DEFAULT NULL,
  `p_limitgender` int(5) DEFAULT NULL,
  `p_other` varchar(255) DEFAULT NULL,
  `p_subjecttype` varchar(255) DEFAULT NULL,
  `p_limitteachertype` varchar(255) DEFAULT NULL,
  `si_count` int(5) DEFAULT NULL,
  `p_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `si_id` int(5) unsigned NOT NULL,
  `t_id` int(5) DEFAULT NULL,
  `t_tel` varchar(50) DEFAULT NULL,
  `p_tel` varchar(50) DEFAULT NULL,
  `si_time` date DEFAULT NULL,
  `r_id` int(5) DEFAULT NULL,
  `u_id` int(5) DEFAULT NULL,
  `r_time` date DEFAULT NULL,
  `p_area` int(5) DEFAULT NULL,
  `p_address` varchar(50) DEFAULT NULL,
  `p_money` int(5) DEFAULT NULL,
  `p_gender` int(5) DEFAULT NULL,
  `p_grade` int(5) DEFAULT NULL,
  `p_character` int(5) DEFAULT NULL,
  `p_limitgender` int(5) DEFAULT NULL,
  `p_other` varchar(255) DEFAULT NULL,
  `p_subjecttype` varchar(255) DEFAULT NULL,
  `p_limitteachertype` varchar(255) DEFAULT NULL,
  `p_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `subjecttype`
--

CREATE TABLE IF NOT EXISTS `subjecttype` (
  `s_id` int(5) NOT NULL,
  `s_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `subjecttype`
--

INSERT INTO `subjecttype` (`s_id`, `s_name`) VALUES
(1, '语文'),
(2, '数学'),
(3, '英语');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `u_id` int(5) NOT NULL,
  `tt_id` int(5) DEFAULT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_age` varchar(50) DEFAULT NULL,
  `t_gender` int(5) DEFAULT NULL,
  `t_school` varchar(50) DEFAULT NULL,
  `t_major` varchar(50) DEFAULT NULL,
  `t_address` varchar(50) DEFAULT NULL,
  `t_wechat` varchar(255) DEFAULT NULL,
  `t_introduce` varchar(255) DEFAULT NULL,
  `t_experience` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`u_id`, `tt_id`, `t_name`, `t_age`, `t_gender`, `t_school`, `t_major`, `t_address`, `t_wechat`, `t_introduce`, `t_experience`) VALUES
(1, 1, '魏宇轩', '22', 1, '昆明理工大学莲花校区', '物联网工程', '丽江', '/tpwupload/35a309ec-be70-4d2b-9d0f-22be8e2e4d55.jpg', ' 我是大连某军校的一名计算机软件专业教师，具有高级专业技术职称，2005年转业，授聘于某校计算机软件专业任教师。我的手机：13352289982；我的EMAIL：zjj_sgxx@163.com', ' 我是大连某军校的一名计算机软件专业教师，具有高级专业技术职称，2005年转业，授聘于某校计算机软件专业任教师。我的手机：13352289982；我的EMAIL：zjj_sgxx@163.com'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `teachertype`
--

CREATE TABLE IF NOT EXISTS `teachertype` (
  `tt_id` int(5) NOT NULL,
  `tt_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `teachertype`
--

INSERT INTO `teachertype` (`tt_id`, `tt_name`) VALUES
(1, '在校教师'),
(2, '在校博士生'),
(3, '在校研究生');

-- --------------------------------------------------------

--
-- 表的结构 `tphoto`
--

CREATE TABLE IF NOT EXISTS `tphoto` (
  `tp_id` int(5) NOT NULL,
  `u_id` int(5) DEFAULT NULL,
  `u_tel` varchar(50) DEFAULT NULL,
  `tp_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int(5) NOT NULL,
  `u_sf` int(5) DEFAULT NULL,
  `u_tel` varchar(255) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_station` int(5) DEFAULT NULL,
  `u_attestation` int(5) DEFAULT NULL,
  `u_isfinish` int(5) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`u_id`, `u_sf`, `u_tel`, `u_password`, `u_station`, `u_attestation`, `u_isfinish`, `u_time`) VALUES
(1, 2, '18468041823', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 2, '2020-04-03 00:03:30'),
(2, 1, '15987940720', 'e10adc3949ba59abbe56e057f20f883e', 1, 2, 1, '2020-04-03 00:03:44'),
(3, 3, '15887864046', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:03:56'),
(4, 3, '18468041821', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:04:22'),
(5, 2, '18468041822', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:04:31'),
(6, 1, '182468041824', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:04:40'),
(7, 1, '18468041825', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:04:48'),
(8, 1, '18468041826', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:04:55'),
(9, 1, '18468041827', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:05:02'),
(11, 1, '18468041829', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:05:22'),
(12, 1, '15987940721', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:05:51'),
(13, 2, '15987940821', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:08'),
(14, 2, '15987940236', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:16'),
(15, 2, '15987452152', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:23'),
(16, 2, '18452154126', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:33'),
(17, 2, '18542156241', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:40'),
(18, 2, '18465213254', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:06:48'),
(19, 1, '18468041524', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:06:55'),
(20, 2, '18465214521', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:07:03'),
(21, 1, '18465215463', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:07:10'),
(22, 3, '12541265213', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:07:19'),
(23, 3, '16524513522', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:07:30'),
(24, 1, '15246521542', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, '2020-04-03 00:07:37'),
(25, 2, '15241351165', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:07:49'),
(26, 3, '18468521562', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:07:56'),
(27, 3, '12516241558', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:08:08'),
(28, 3, '18465215423', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:08:16'),
(29, 2, '18468521542', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:08:36'),
(30, 3, '18468041254', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:08:49'),
(31, 3, '12541652413', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:08:58'),
(32, 3, '18468251341', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, 1, '2020-04-03 00:09:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`) USING BTREE;

--
-- Indexes for table `mechanism`
--
ALTER TABLE `mechanism`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- Indexes for table `mechanismtype`
--
ALTER TABLE `mechanismtype`
  ADD PRIMARY KEY (`m_id`) USING BTREE;

--
-- Indexes for table `mechanism_relation_mechanismtype`
--
ALTER TABLE `mechanism_relation_mechanismtype`
  ADD PRIMARY KEY (`m_r_m`) USING BTREE;

--
-- Indexes for table `mphoto`
--
ALTER TABLE `mphoto`
  ADD PRIMARY KEY (`mp_id`) USING BTREE;

--
-- Indexes for table `mrelease`
--
ALTER TABLE `mrelease`
  ADD PRIMARY KEY (`r_id`) USING BTREE;

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- Indexes for table `parent_relation_subjecttype`
--
ALTER TABLE `parent_relation_subjecttype`
  ADD PRIMARY KEY (`p_r_s`) USING BTREE;

--
-- Indexes for table `parent_relation_teachertype`
--
ALTER TABLE `parent_relation_teachertype`
  ADD PRIMARY KEY (`p_r_t`) USING BTREE;

--
-- Indexes for table `pphoto`
--
ALTER TABLE `pphoto`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- Indexes for table `prelease`
--
ALTER TABLE `prelease`
  ADD PRIMARY KEY (`r_id`) USING BTREE;

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`si_id`) USING BTREE;

--
-- Indexes for table `subjecttype`
--
ALTER TABLE `subjecttype`
  ADD PRIMARY KEY (`s_id`) USING BTREE;

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- Indexes for table `teachertype`
--
ALTER TABLE `teachertype`
  ADD PRIMARY KEY (`tt_id`) USING BTREE;

--
-- Indexes for table `tphoto`
--
ALTER TABLE `tphoto`
  ADD PRIMARY KEY (`tp_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mechanismtype`
--
ALTER TABLE `mechanismtype`
  MODIFY `m_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mechanism_relation_mechanismtype`
--
ALTER TABLE `mechanism_relation_mechanismtype`
  MODIFY `m_r_m` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mphoto`
--
ALTER TABLE `mphoto`
  MODIFY `mp_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mrelease`
--
ALTER TABLE `mrelease`
  MODIFY `r_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parent_relation_subjecttype`
--
ALTER TABLE `parent_relation_subjecttype`
  MODIFY `p_r_s` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `parent_relation_teachertype`
--
ALTER TABLE `parent_relation_teachertype`
  MODIFY `p_r_t` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `prelease`
--
ALTER TABLE `prelease`
  MODIFY `r_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `si_id` int(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subjecttype`
--
ALTER TABLE `subjecttype`
  MODIFY `s_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `teachertype`
--
ALTER TABLE `teachertype`
  MODIFY `tt_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tphoto`
--
ALTER TABLE `tphoto`
  MODIFY `tp_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
