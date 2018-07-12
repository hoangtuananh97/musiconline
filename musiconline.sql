-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2018 at 04:23 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musiconline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `nameAdmin` varchar(200) NOT NULL,
  `gmail` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `nameAdmin`, `gmail`, `password`) VALUES
(1, 'admin', 'tunanhh64@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `idAreas` int(11) NOT NULL,
  `nameArea` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`idAreas`, `nameArea`) VALUES
(1, 'viet nam'),
(2, 'au my'),
(3, 'chau a');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `idArtis` int(11) NOT NULL,
  `nameArtis` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`idArtis`, `nameArtis`) VALUES
(1, 'tuan anh'),
(2, 'my tam'),
(3, 'tien tien'),
(4, 'son tung');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `idBank` int(11) NOT NULL,
  `nameBank` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`idBank`, `nameBank`) VALUES
(1, 'VietCombank'),
(2, 'BIDV');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `idBill` int(11) NOT NULL,
  `idBank` int(11) NOT NULL,
  `nameCus` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `sates` tinyint(4) NOT NULL,
  `dates` datetime NOT NULL,
  `summoney` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`idBill`, `idBank`, `nameCus`, `phone`, `address`, `sates`, `dates`, `summoney`) VALUES
(6, 2, 'hoang tuan anh', '0979867463', 'tb', 1, '2018-06-30 19:26:39', '1.440.000'),
(7, 2, 'hoang tuan anh', '0979867463', 'tb', 1, '2018-06-30 20:12:53', '600.000'),
(8, 1, 'fghfgh', '0979867463', 'tb', 0, '2018-07-02 14:12:03', '840.000'),
(9, 2, 'hoang tuan anh', '0979867463', 'tb', 0, '2018-07-04 14:57:15', '960.000'),
(11, 2, 'hoang', '0979867463', 'tbbbb', 1, '2018-07-07 19:22:44', '1.200.000');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `idSong` int(11) NOT NULL,
  `idFeels` int(11) NOT NULL,
  `name_comment` varchar(200) NOT NULL,
  `context` varchar(200) NOT NULL,
  `times` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`idComment`, `idSong`, `idFeels`, `name_comment`, `context`, `times`) VALUES
(1, 9, 1, 'g', 'fdfdgf', '2018-06-25 00:00:00'),
(2, 2, 1, 'dd', 'ddd', '2018-06-25 00:00:00'),
(3, 9, 1, 'fdf', 'dfdf', '2018-06-25 00:00:00'),
(4, 1, 1, 'fsd', 'sdfs', '2018-06-25 00:00:00'),
(5, 2, 1, 'sdf', 'fsdfsd', '2018-06-25 00:00:00'),
(6, 12, 1, 'hello', 'hello\n', '2018-06-25 00:00:00'),
(7, 2, 1, 'hello', 'hello', '2018-06-25 00:00:00'),
(8, 2, 1, 'hello', 'hello', '2018-06-25 00:00:00'),
(11, 8, 1, 'heeloo', 'tuan anh', '2018-06-25 00:00:00'),
(12, 11, 1, 'tuan anh', 'dep trai', '2018-06-25 00:00:00'),
(13, 13, 1, 'dep trai', 'dep trai', '2018-06-25 00:00:00'),
(14, 1, 1, 'hello', 'hello fuck', '2018-06-26 00:00:00'),
(15, 11, 1, 'tuan anh dep trai ', 'tuan anh dep trai ', '2018-06-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `detailbill`
--

CREATE TABLE `detailbill` (
  `IdDetailBill` int(11) NOT NULL,
  `idBill` int(11) NOT NULL,
  `idSong` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `countSong` int(11) NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detailbill`
--

INSERT INTO `detailbill` (`IdDetailBill`, `idBill`, `idSong`, `idUser`, `countSong`, `price`) VALUES
(15, 6, 1, 11, 4, '120.000'),
(16, 6, 2, 11, 2, '120.000'),
(17, 6, 14, 11, 1, '120.000'),
(18, 6, 15, 11, 2, '120.000'),
(21, 7, 2, 11, 3, '120.000'),
(22, 7, 9, 11, 2, '120.000'),
(23, 8, 9, 11, 3, '120.000'),
(24, 8, 11, 11, 1, '120.000'),
(25, 8, 8, 11, 1, '120.000'),
(26, 8, 14, 11, 2, '120.000'),
(27, 9, 1, 10, 4, '120.000'),
(28, 9, 2, 10, 1, '120.000'),
(29, 9, 8, 10, 1, '120.000'),
(35, 11, 1, 10, 3, '120.000'),
(36, 11, 2, 10, 1, '120.000'),
(37, 11, 8, 10, 2, '120.000'),
(38, 11, 12, 10, 1, '120.000'),
(39, 11, 11, 10, 3, '120.000');

-- --------------------------------------------------------

--
-- Table structure for table `feels`
--

CREATE TABLE `feels` (
  `idFeels` int(11) NOT NULL,
  `nameFeels` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feels`
--

INSERT INTO `feels` (`idFeels`, `nameFeels`) VALUES
(1, 'like');

-- --------------------------------------------------------

--
-- Table structure for table `reply_comment`
--

CREATE TABLE `reply_comment` (
  `idReply` int(11) NOT NULL,
  `idComment` int(11) NOT NULL,
  `idFeels` int(11) NOT NULL,
  `rep_dates` datetime NOT NULL,
  `rep_comtext` varchar(200) NOT NULL,
  `rep_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reply_comment`
--

INSERT INTO `reply_comment` (`idReply`, `idComment`, `idFeels`, `rep_dates`, `rep_comtext`, `rep_name`) VALUES
(1, 11, 1, '2018-06-26 00:00:00', 'thuy thuy', 'hong hong'),
(2, 6, 1, '2018-06-26 00:00:00', 'fffffffffffffffffffffdd?', 'gggggggg'),
(3, 11, 1, '2018-06-26 00:00:00', 'bbbbbbbbbbb', 'aaaaa'),
(4, 2, 1, '2018-06-26 00:00:00', 'chao', 'xin chao'),
(5, 11, 1, '2018-06-26 00:00:00', 'hêllo', 'xin chào'),
(6, 2, 1, '2018-06-26 00:00:00', 'hello', 'hello'),
(7, 4, 1, '2018-06-26 00:00:00', 'gggg', 'hhee'),
(8, 2, 1, '2018-06-26 00:00:00', 'dgdfgd', 'dgdg'),
(9, 2, 1, '2018-06-26 00:00:00', 'fuck', 'fuck'),
(10, 5, 1, '2018-06-26 00:00:00', 'ssdfsf', 'hêml'),
(11, 2, 1, '2018-06-26 00:00:00', 'sdfsd', 'sfsdf'),
(12, 2, 1, '2018-06-26 00:00:00', 'reply 6', 'reply 6'),
(13, 2, 1, '2018-06-26 00:00:00', '7', '7'),
(14, 13, 1, '2018-06-26 00:00:00', 'chao l?i', 'xin chao'),
(15, 2, 1, '2018-06-30 00:00:00', '8', '8');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `nameRole` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idRole`, `nameRole`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `idSong` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `url` varchar(255) NOT NULL,
  `idArtist` int(255) NOT NULL,
  `author` varchar(200) NOT NULL,
  `idArea` int(255) NOT NULL,
  `idType` int(255) NOT NULL,
  `cover_art_url` varchar(300) NOT NULL,
  `dateUpdate` date NOT NULL,
  `countListen` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`idSong`, `name`, `url`, `idArtist`, `author`, `idArea`, `idType`, `cover_art_url`, `dateUpdate`, `countListen`) VALUES
(1, 'Frankie ', 'Take A Chance On Me - Frankie J.mp3', 2, 'Frankie ', 1, 2, 'we-are-to-answer.jpg', '2018-03-07', 42),
(2, 'Wiz Khalifa Charlie Puth', 'See You Again - Wiz Khalifa Charlie Puth.mp3', 4, 'Wiz Khalifa Charlie Puth', 1, 3, 'we-are-to-answer.jpg', '2017-09-06', 105),
(8, 'Alan Walked', 'Alan Walker Fade NCS Release - Fade NCS Release.mp3', 1, 'Alan Walked', 2, 1, '4.jpg', '2018-05-02', 52),
(9, 'beautiful in white', 'Beautiful In White - Shane Filan.mp3', 1, 'Shane Filan', 1, 1, '5.jpg', '0011-11-08', 25),
(11, 'i am yours', 'I-m-Yours-Jason-Mraz.mp3', 1, 'jason- mraz', 2, 1, '2.jpg', '0011-02-04', 16),
(12, 'cam on vi tat ca', 'Cam On Vi Tat Ca - Anh Quan Idol.mp3', 1, 'anh quan', 1, 1, '3.jpg', '0013-12-06', 13),
(13, 'den sau', 'DenSau-UngHoangPhuc.mp3', 1, 'ung hoan phuc', 1, 1, '1.jpg', '0009-01-04', 7),
(14, 'marry me', 'Marry Me - Mr Siro.mp3', 1, 'Mr.siro', 1, 1, '2.jpg', '0012-11-06', 8),
(15, 'khoc', 'Khoc - Vu Duy Khanh.mp3', 1, 'duy khanh', 1, 1, '3.jpg', '0007-11-05', 4),
(19, 'chipmun', 'chipmun.mp3', 4, 'anh khang', 3, 1, '1.jpg', '2018-06-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `song_of_user`
--

CREATE TABLE `song_of_user` (
  `idSong_user` int(11) NOT NULL,
  `idSong` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `song_of_user`
--

INSERT INTO `song_of_user` (`idSong_user`, `idSong`, `idUser`) VALUES
(1, 1, 9),
(2, 2, 9),
(3, 8, 10),
(4, 1, 10),
(5, 8, 11),
(13, 2, 10),
(14, 15, 10),
(15, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `idType` int(11) NOT NULL,
  `nameType` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`idType`, `nameType`) VALUES
(1, 'nhac tre'),
(2, 'tru tinh'),
(3, 'nhac han'),
(4, 'pop');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(255) NOT NULL,
  `nameUser` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `nameUser`, `gmail`, `password`) VALUES
(9, 'tuan', 'tuan@gmail', '1234'),
(10, 'hhh', 'tutu', '1234'),
(11, 'tu', 'tu', '1234'),
(12, 'admin', 'admin', '$2a$04$GYGsaJj9l6kH2GikK6QVzO0v3sOCxt3vdkiA2/tcoSw8erI85ZYDG'),
(13, 'tuấn anh', 'hoangtuananh1997tb@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `idRole`, `idUser`) VALUES
(1, 1, 9),
(2, 2, 10),
(3, 2, 11),
(4, 1, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `Gmail` (`gmail`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`idAreas`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`idArtis`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`idBank`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`idBill`),
  ADD KEY `IdBank_IdBill` (`idBank`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `IdSong_IdComment` (`idSong`),
  ADD KEY `IdFeels_IdComment` (`idFeels`);

--
-- Indexes for table `detailbill`
--
ALTER TABLE `detailbill`
  ADD PRIMARY KEY (`IdDetailBill`),
  ADD KEY `IdBill_IdSong` (`idSong`),
  ADD KEY `IdUser_IdBill` (`idUser`),
  ADD KEY `IdDetailBill_IdBill` (`idBill`);

--
-- Indexes for table `feels`
--
ALTER TABLE `feels`
  ADD PRIMARY KEY (`idFeels`);

--
-- Indexes for table `reply_comment`
--
ALTER TABLE `reply_comment`
  ADD PRIMARY KEY (`idReply`),
  ADD KEY `idComment` (`idComment`),
  ADD KEY `IdReplyComment_IdFeels` (`idFeels`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`idSong`),
  ADD KEY `artist` (`idArtist`),
  ADD KEY `area` (`idArea`),
  ADD KEY `type` (`idType`);

--
-- Indexes for table `song_of_user`
--
ALTER TABLE `song_of_user`
  ADD PRIMARY KEY (`idSong_user`),
  ADD KEY `idSong` (`idSong`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`idType`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `gmail` (`gmail`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRole` (`idRole`),
  ADD KEY `idUser` (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `idAreas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `idArtis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `idBank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `idBill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `detailbill`
--
ALTER TABLE `detailbill`
  MODIFY `IdDetailBill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `feels`
--
ALTER TABLE `feels`
  MODIFY `idFeels` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reply_comment`
--
ALTER TABLE `reply_comment`
  MODIFY `idReply` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `idSong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `song_of_user`
--
ALTER TABLE `song_of_user`
  MODIFY `idSong_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`idBank`) REFERENCES `banks` (`idBank`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idSong`) REFERENCES `songs` (`idSong`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`idFeels`) REFERENCES `feels` (`idFeels`);

--
-- Constraints for table `detailbill`
--
ALTER TABLE `detailbill`
  ADD CONSTRAINT `detailbill_ibfk_1` FOREIGN KEY (`idBill`) REFERENCES `bill` (`idBill`),
  ADD CONSTRAINT `detailbill_ibfk_2` FOREIGN KEY (`idSong`) REFERENCES `songs` (`idSong`),
  ADD CONSTRAINT `detailbill_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `reply_comment`
--
ALTER TABLE `reply_comment`
  ADD CONSTRAINT `reply_comment_ibfk_1` FOREIGN KEY (`idComment`) REFERENCES `comment` (`idComment`),
  ADD CONSTRAINT `reply_comment_ibfk_2` FOREIGN KEY (`idFeels`) REFERENCES `feels` (`idFeels`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`idArtist`) REFERENCES `artists` (`idArtis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`idArea`) REFERENCES `areas` (`idAreas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `songs_ibfk_3` FOREIGN KEY (`idType`) REFERENCES `types` (`idType`) ON UPDATE CASCADE;

--
-- Constraints for table `song_of_user`
--
ALTER TABLE `song_of_user`
  ADD CONSTRAINT `song_of_user_ibfk_1` FOREIGN KEY (`idSong`) REFERENCES `songs` (`idSong`),
  ADD CONSTRAINT `song_of_user_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
