-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2021 at 12:55 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Kino`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bilet`
--

CREATE TABLE `Bilet` (
  `ID_bilet` int(11) NOT NULL,
  `ID_seans` int(11) NOT NULL,
  `ID_typ_bilet` int(11) NOT NULL,
  `ID_rezerwacja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Bilet`
--

INSERT INTO `Bilet` (`ID_bilet`, `ID_seans`, `ID_typ_bilet`, `ID_rezerwacja`) VALUES
(10, 11, 1, 26),
(11, 1, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `Film`
--

CREATE TABLE `Film` (
  `ID_film` int(11) NOT NULL,
  `ID_ograniczenia` int(11) NOT NULL,
  `ID_rezyser` int(11) NOT NULL,
  `ID_gatunek` int(11) NOT NULL,
  `oryginalny_tytul` varchar(100) NOT NULL,
  `tytul` varchar(100) NOT NULL,
  `rok_premiery` year(4) NOT NULL,
  `produkcja` varchar(50) NOT NULL,
  `czas_trwania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Film`
--

INSERT INTO `Film` (`ID_film`, `ID_ograniczenia`, `ID_rezyser`, `ID_gatunek`, `oryginalny_tytul`, `tytul`, `rok_premiery`, `produkcja`, `czas_trwania`) VALUES
(1, 3, 1, 1, 'sprawdzian', 'sprawdzian', 2016, 'USA', 147),
(2, 3, 2, 2, 'Marathon Captain America', 'Maraton Kapitan Ameryka', 2016, 'USA', 420),
(3, 3, 4, 4, '10 Cloverfield Lane', 'Cloverfield Lane 10', 2016, 'USA', 100),
(4, 4, 5, 5, 'Unser letzter Sommer', 'Letnie przesilenie', 2016, 'Polska', 100),
(5, 2, 12, 10, 'The Other Side of the Door', 'Po tamtej stronie drzwi', 2016, 'Wielka Brytania', 96),
(6, 4, 3, 9, 'Maryland', 'Cień', 2015, 'Belgia', 98),
(7, 4, 15, 2, 'Hardcore Henry', 'Hardcore Henry', 2015, 'USA', 98),
(8, 3, 3, 3, 'Droga do mistrzostwa', 'Droga do mistrzostwa', 2015, 'Polska', 50),
(9, 3, 8, 8, 'The Boss', 'Szefowa', 2016, 'USA', 99),
(10, 2, 10, 7, 'The Jungle Book', 'Księga Dżungli', 2016, 'USA', 106),
(11, 3, 13, 4, 'God\'s Not Dead 2', 'Bóg nie umarł 2', 2016, 'USA', 121),
(12, 4, 9, 4, 'High-Rise', 'High-Rise', 2015, 'Wielka Brytania', 119),
(13, 4, 11, 9, 'The 5th Wave', 'Piąta Fala', 2016, 'USA', 113),
(14, 5, 16, 4, 'php', 'php', 2020, 'POlska', 122),
(15, 1, 2, 3, 'ted', 'teed', 2016, 'USA', 120);

-- --------------------------------------------------------

--
-- Table structure for table `Gatunek`
--

CREATE TABLE `Gatunek` (
  `ID_gatunek` int(11) NOT NULL,
  `nazwa_gatunek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Gatunek`
--

INSERT INTO `Gatunek` (`ID_gatunek`, `nazwa_gatunek`) VALUES
(1, 'Sci-Fi'),
(2, 'Akcja'),
(3, 'Dokument'),
(4, 'Dramat'),
(5, 'Wojenny'),
(6, 'Animowany'),
(7, 'Przygodowy'),
(8, 'Komedia'),
(9, 'Thriller'),
(10, 'Horror'),
(11, 'Western'),
(12, 'Przyrodniczy'),
(13, 'Edukacyjny'),
(14, 'Muzyczny'),
(15, 'Biograficzny'),
(16, 'Religijny'),
(17, 'Kryminalny'),
(18, 'Katastroficzny'),
(19, 'Familijny'),
(20, 'Romantyczny'),
(21, 'Historyczny');

-- --------------------------------------------------------

--
-- Table structure for table `Klient`
--

CREATE TABLE `Klient` (
  `ID_klient` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `haslo` varchar(30) NOT NULL,
  `email` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Klient`
--

INSERT INTO `Klient` (`ID_klient`, `imie`, `nazwisko`, `haslo`, `email`) VALUES
(1, 'Aleksandra', 'Nowak', 'abcd1234', 'a.nowak@gmail.com'),
(2, 'adam', 'nowak', 'adamcostyodjebac', 'kurwa@nowak.pl'),
(4, 'a', 'a', 'a', 'a@a.a'),
(6, 'test', 'test', 'test123', 'test@test.pl'),
(8, 'j', 'jr', 'jr', 'JR@wppl'),
(16, 'test', 'test', 'test', 'test@wpp.pl');

-- --------------------------------------------------------

--
-- Table structure for table `OgraniczeniaWiekoweFilmu`
--

CREATE TABLE `OgraniczeniaWiekoweFilmu` (
  `ID_ograniczenia` int(11) NOT NULL,
  `wiek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `OgraniczeniaWiekoweFilmu`
--

INSERT INTO `OgraniczeniaWiekoweFilmu` (`ID_ograniczenia`, `wiek`) VALUES
(1, 0),
(2, 7),
(3, 12),
(4, 16),
(5, 18);

-- --------------------------------------------------------

--
-- Table structure for table `Pracownik`
--

CREATE TABLE `Pracownik` (
  `ID_pracownik` int(11) DEFAULT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `haslo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Pracownik`
--

INSERT INTO `Pracownik` (`ID_pracownik`, `imie`, `nazwisko`, `haslo`) VALUES
(1, 'Karol', 'Kowalski', 'pracownik'),
(2, 'test', 'test', 'test'),
(3, 'kurwa', 'dzialaj', '');

-- --------------------------------------------------------

--
-- Table structure for table `Rezerwacja`
--

CREATE TABLE `Rezerwacja` (
  `ID_rezerwacja` int(11) NOT NULL,
  `ilosc_biletow` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `id_seansu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rezerwacja`
--

INSERT INTO `Rezerwacja` (`ID_rezerwacja`, `ilosc_biletow`, `email`, `id_seansu`) VALUES
(1, 2, '', 0),
(2, 2, '', 0),
(3, 2, '', 0),
(4, 32, '', 0),
(5, 1, '', 0),
(6, 1, '', 0),
(7, 1, '', 0),
(8, 1, '', 0),
(9, 2, '', 0),
(10, 2, '', 0),
(11, 2, '', 0),
(12, 2, '', 0),
(13, 2, '', 0),
(14, 1, '', 0),
(15, 2, 'a@a.a', 0),
(16, 1, 'a@a.a', 0),
(17, 2, 'a@a.a', 2),
(18, 2, 'a@a.a', 5),
(19, 4, 'a@a.a', 11),
(20, 4, 'a@a.a', 11),
(22, 2, 'a@a.a', 2),
(23, 2, 'a@a.a', 2),
(24, 1, 'a@a.a', 1),
(25, 2, 'a@a.a', 1),
(26, 2, 'a@a.a', 11),
(27, 10, 'a@a.a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Rezyser`
--

CREATE TABLE `Rezyser` (
  `ID_rezyser` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rezyser`
--

INSERT INTO `Rezyser` (`ID_rezyser`, `imie`, `nazwisko`) VALUES
(1, 'Anthony', 'Russo'),
(2, 'Joe', 'Russo'),
(3, 'Bartosz', 'Konopka'),
(4, 'Dan', 'Trachtenberg'),
(5, 'Michał', 'Rogalski'),
(6, 'Jericca', 'Cleland'),
(7, 'Kevin', 'Munroe'),
(8, 'Ben', 'Falcone'),
(9, 'Ben', 'Wheatley'),
(10, 'Jon', 'Favreau'),
(11, 'Jonathan', 'Blakeson'),
(12, 'Johannes', 'Roberts'),
(13, 'Harold', 'Cronk'),
(14, 'Alice', 'Winocour'),
(15, 'Ilya', 'Naishuller'),
(16, 'TEST', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `Sala`
--

CREATE TABLE `Sala` (
  `ID_sala` int(11) NOT NULL,
  `ilosc_miejsc` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sala`
--

INSERT INTO `Sala` (`ID_sala`, `ilosc_miejsc`) VALUES
(1, 100),
(2, 100),
(3, 100);

-- --------------------------------------------------------

--
-- Table structure for table `Seans`
--

CREATE TABLE `Seans` (
  `ID_seans` int(11) NOT NULL,
  `ID_film` int(11) NOT NULL,
  `ID_sala` int(11) NOT NULL,
  `dzien_tygodnia` varchar(20) NOT NULL,
  `godzina` time DEFAULT '00:00:00',
  `wolne_miejsca` int(11) DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Seans`
--

INSERT INTO `Seans` (`ID_seans`, `ID_film`, `ID_sala`, `dzien_tygodnia`, `godzina`, `wolne_miejsca`) VALUES
(1, 1, 1, 'poniedzialek', '10:00:00', 97),
(2, 1, 1, 'poniedzialek', '13:00:00', 100),
(3, 2, 1, 'poniedzialek', '16:00:00', 100),
(4, 5, 1, 'poniedzialek', '23:00:00', 100),
(5, 3, 1, 'wtorek', '09:00:00', 100),
(6, 8, 1, 'wtorek', '11:00:00', 100),
(7, 4, 1, 'wtorek', '13:00:00', 100),
(8, 12, 1, 'wtorek', '16:00:00', 99),
(9, 10, 1, 'wtorek', '19:00:00', 100),
(10, 5, 1, 'wtorek', '22:00:00', 100),
(11, 6, 1, 'środa', '09:00:00', 99),
(12, 7, 1, 'środa', '11:00:00', 98),
(13, 9, 1, 'środa', '13:00:00', 100),
(14, 5, 1, 'środa', '16:00:00', 100),
(15, 10, 1, 'środa', '19:00:00', 100),
(16, 11, 1, 'środa', '22:00:00', 100),
(17, 1, 1, 'czwartek', '09:00:00', 100),
(18, 7, 1, 'czwartek', '11:00:00', 100),
(19, 5, 1, 'czwartek', '13:00:00', 100),
(20, 9, 1, 'czwartek', '16:00:00', 100),
(21, 12, 1, 'czwartek', '19:00:00', 100),
(22, 10, 1, 'czwartek', '22:00:00', 100),
(23, 1, 1, 'piątek', '09:00:00', 100),
(24, 4, 1, 'piątek', '11:00:00', 100),
(25, 2, 1, 'piątek', '13:00:00', 100),
(26, 6, 1, 'piątek', '16:00:00', 100),
(27, 10, 1, 'piątek', '19:00:00', 100),
(28, 5, 1, 'piątek', '22:00:00', 100),
(29, 1, 1, 'sobota', '09:00:00', 100),
(30, 4, 1, 'sobota', '11:00:00', 100),
(31, 2, 1, 'sobota', '13:00:00', 100),
(32, 6, 1, 'sobota', '16:00:00', 100),
(33, 10, 1, 'sobota', '19:00:00', 100),
(34, 5, 1, 'sobota', '22:00:00', 100),
(35, 8, 1, 'niedziela', '09:00:00', 100),
(36, 9, 1, 'niedziela', '11:00:00', 100),
(37, 10, 1, 'niedziela', '13:00:00', 100),
(38, 11, 1, 'niedziela', '16:00:00', 100),
(39, 2, 2, 'poniedzialek', '10:00:00', 100),
(40, 2, 2, 'poniedzialek', '13:00:00', 100),
(41, 2, 2, 'poniedzialek', '16:00:00', 100),
(42, 6, 2, 'poniedzialek', '23:00:00', 100),
(43, 4, 2, 'wtorek', '09:00:00', 100),
(44, 9, 2, 'wtorek', '11:00:00', 100),
(45, 5, 2, 'wtorek', '13:00:00', 100),
(46, 1, 2, 'wtorek', '16:00:00', 100),
(47, 11, 2, 'wtorek', '19:00:00', 100),
(48, 6, 2, 'wtorek', '22:00:00', 100),
(49, 7, 2, 'środa', '09:00:00', 100),
(50, 8, 2, 'środa', '11:00:00', 100),
(51, 10, 2, 'środa', '13:00:00', 100),
(52, 6, 2, 'środa', '16:00:00', 100),
(53, 11, 2, 'środa', '19:00:00', 100),
(54, 12, 2, 'środa', '22:00:00', 100),
(55, 2, 2, 'czwartek', '09:00:00', 100),
(56, 8, 2, 'czwartek', '11:00:00', 100),
(57, 6, 2, 'czwartek', '13:00:00', 100),
(58, 10, 2, 'czwartek', '16:00:00', 100),
(59, 13, 2, 'czwartek', '19:00:00', 100),
(60, 11, 2, 'czwartek', '22:00:00', 100),
(61, 2, 2, 'piątek', '09:00:00', 100),
(62, 5, 2, 'piątek', '11:00:00', 100),
(63, 6, 2, 'piątek', '13:00:00', 100),
(64, 7, 2, 'piątek', '16:00:00', 100),
(65, 11, 2, 'piątek', '19:00:00', 100),
(66, 6, 2, 'piątek', '22:00:00', 100),
(67, 2, 2, 'sobota', '09:00:00', 100),
(68, 5, 2, 'sobota', '11:00:00', 100),
(69, 3, 2, 'sobota', '13:00:00', 100),
(70, 7, 2, 'sobota', '16:00:00', 100),
(71, 11, 2, 'sobota', '19:00:00', 100),
(72, 6, 2, 'sobota', '22:00:00', 100),
(73, 9, 2, 'niedziela', '09:00:00', 100),
(74, 10, 2, 'niedziela', '11:00:00', 100),
(75, 11, 2, 'niedziela', '13:00:00', 100),
(76, 12, 2, 'niedziela', '16:00:00', 100),
(77, 3, 3, 'poniedzialek', '10:00:00', 100),
(78, 3, 3, 'poniedzialek', '13:00:00', 100),
(79, 5, 3, 'poniedzialek', '16:00:00', 100),
(80, 7, 3, 'poniedzialek', '23:00:00', 100),
(81, 5, 3, 'wtorek', '09:00:00', 100),
(82, 10, 3, 'wtorek', '11:00:00', 100),
(83, 6, 3, 'wtorek', '13:00:00', 100),
(84, 1, 3, 'wtorek', '16:00:00', 100),
(85, 12, 3, 'wtorek', '19:00:00', 100),
(86, 7, 3, 'wtorek', '22:00:00', 100),
(87, 8, 3, 'środa', '09:00:00', 100),
(88, 9, 3, 'środa', '11:00:00', 100),
(89, 11, 3, 'środa', '13:00:00', 100),
(90, 7, 3, 'środa', '16:00:00', 100),
(91, 12, 3, 'środa', '19:00:00', 100),
(92, 13, 3, 'środa', '22:00:00', 100),
(93, 3, 3, 'czwartek', '09:00:00', 100),
(94, 9, 3, 'czwartek', '11:00:00', 100),
(95, 7, 3, 'czwartek', '13:00:00', 100),
(96, 11, 3, 'czwartek', '16:00:00', 100),
(97, 1, 3, 'czwartek', '19:00:00', 100),
(98, 12, 3, 'czwartek', '22:00:00', 100),
(99, 3, 3, 'piątek', '09:00:00', 100),
(100, 6, 3, 'piątek', '11:00:00', 100),
(101, 4, 3, 'piątek', '13:00:00', 100),
(102, 8, 3, 'piątek', '16:00:00', 100),
(103, 12, 3, 'piątek', '19:00:00', 100),
(104, 7, 3, 'piątek', '22:00:00', 100),
(105, 3, 3, 'sobota', '09:00:00', 100),
(106, 6, 3, 'sobota', '11:00:00', 100),
(107, 4, 3, 'sobota', '13:00:00', 100),
(108, 8, 3, 'sobota', '16:00:00', 100),
(109, 12, 3, 'sobota', '19:00:00', 100),
(110, 7, 3, 'sobota', '22:00:00', 100),
(111, 10, 3, 'niedziela', '09:00:00', 100),
(112, 11, 3, 'niedziela', '11:00:00', 100),
(113, 12, 3, 'niedziela', '13:00:00', 100),
(114, 13, 3, 'niedziela', '16:00:00', 100);

-- --------------------------------------------------------

--
-- Table structure for table `TypBiletu`
--

CREATE TABLE `TypBiletu` (
  `ID_typ_bilet` int(11) NOT NULL,
  `cena_biletu` float NOT NULL,
  `nazwa_typu_biletu` varchar(50) NOT NULL,
  `opis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TypBiletu`
--

INSERT INTO `TypBiletu` (`ID_typ_bilet`, `cena_biletu`, `nazwa_typu_biletu`, `opis`) VALUES
(1, 27, 'bilet normalny', ' '),
(2, 15, 'dzieci', 'Do lat 12'),
(3, 20, 'uczniowie i studenci', 'Do lat 26'),
(4, 21, 'seniorzy', 'Od lat 60');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bilet`
--
ALTER TABLE `Bilet`
  ADD PRIMARY KEY (`ID_bilet`),
  ADD KEY `ID_rezerwacja` (`ID_rezerwacja`),
  ADD KEY `ID_seans` (`ID_seans`),
  ADD KEY `ID_typ_bilet` (`ID_typ_bilet`);

--
-- Indexes for table `Film`
--
ALTER TABLE `Film`
  ADD PRIMARY KEY (`ID_film`),
  ADD KEY `ID_ograniczenia` (`ID_ograniczenia`),
  ADD KEY `ID_rezyser` (`ID_rezyser`),
  ADD KEY `ID_gatunek` (`ID_gatunek`);

--
-- Indexes for table `Gatunek`
--
ALTER TABLE `Gatunek`
  ADD PRIMARY KEY (`ID_gatunek`);

--
-- Indexes for table `Klient`
--
ALTER TABLE `Klient`
  ADD PRIMARY KEY (`ID_klient`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `iemail` (`ID_klient`,`imie`,`nazwisko`,`haslo`,`email`);

--
-- Indexes for table `OgraniczeniaWiekoweFilmu`
--
ALTER TABLE `OgraniczeniaWiekoweFilmu`
  ADD PRIMARY KEY (`ID_ograniczenia`);

--
-- Indexes for table `Pracownik`
--
ALTER TABLE `Pracownik`
  ADD UNIQUE KEY `ID_pracownik` (`ID_pracownik`);

--
-- Indexes for table `Rezerwacja`
--
ALTER TABLE `Rezerwacja`
  ADD PRIMARY KEY (`ID_rezerwacja`);

--
-- Indexes for table `Rezyser`
--
ALTER TABLE `Rezyser`
  ADD PRIMARY KEY (`ID_rezyser`);

--
-- Indexes for table `Sala`
--
ALTER TABLE `Sala`
  ADD PRIMARY KEY (`ID_sala`);

--
-- Indexes for table `Seans`
--
ALTER TABLE `Seans`
  ADD PRIMARY KEY (`ID_seans`),
  ADD KEY `ID_film` (`ID_film`),
  ADD KEY `ID_sala` (`ID_sala`);

--
-- Indexes for table `TypBiletu`
--
ALTER TABLE `TypBiletu`
  ADD PRIMARY KEY (`ID_typ_bilet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bilet`
--
ALTER TABLE `Bilet`
  MODIFY `ID_bilet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Film`
--
ALTER TABLE `Film`
  MODIFY `ID_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Gatunek`
--
ALTER TABLE `Gatunek`
  MODIFY `ID_gatunek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `Klient`
--
ALTER TABLE `Klient`
  MODIFY `ID_klient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `OgraniczeniaWiekoweFilmu`
--
ALTER TABLE `OgraniczeniaWiekoweFilmu`
  MODIFY `ID_ograniczenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Rezerwacja`
--
ALTER TABLE `Rezerwacja`
  MODIFY `ID_rezerwacja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Rezyser`
--
ALTER TABLE `Rezyser`
  MODIFY `ID_rezyser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Sala`
--
ALTER TABLE `Sala`
  MODIFY `ID_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Seans`
--
ALTER TABLE `Seans`
  MODIFY `ID_seans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `TypBiletu`
--
ALTER TABLE `TypBiletu`
  MODIFY `ID_typ_bilet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bilet`
--
ALTER TABLE `Bilet`
  ADD CONSTRAINT `ID_rezerwacja` FOREIGN KEY (`ID_rezerwacja`) REFERENCES `Rezerwacja` (`ID_rezerwacja`),
  ADD CONSTRAINT `ID_seans` FOREIGN KEY (`ID_seans`) REFERENCES `Seans` (`ID_seans`),
  ADD CONSTRAINT `ID_typ_bilet` FOREIGN KEY (`ID_typ_bilet`) REFERENCES `TypBiletu` (`ID_typ_bilet`);

--
-- Constraints for table `Film`
--
ALTER TABLE `Film`
  ADD CONSTRAINT `ID_gatunek` FOREIGN KEY (`ID_gatunek`) REFERENCES `Gatunek` (`ID_gatunek`),
  ADD CONSTRAINT `ID_ograniczenia` FOREIGN KEY (`ID_ograniczenia`) REFERENCES `OgraniczeniaWiekoweFilmu` (`ID_ograniczenia`),
  ADD CONSTRAINT `ID_rezyser` FOREIGN KEY (`ID_rezyser`) REFERENCES `Rezyser` (`ID_rezyser`);

--
-- Constraints for table `Seans`
--
ALTER TABLE `Seans`
  ADD CONSTRAINT `ID_film` FOREIGN KEY (`ID_film`) REFERENCES `Film` (`ID_film`),
  ADD CONSTRAINT `ID_sala` FOREIGN KEY (`ID_sala`) REFERENCES `Sala` (`ID_sala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
