-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Lis 2023, 12:29
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `komis_samochodowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komitenci`
--

DROP DATABASE IF EXISTS komis_samochodowy;

CREATE DATABASE IF NOT EXISTS komis_samochodowy;

USE komis_samochodowy;

CREATE TABLE `komitenci` (
  `id` int(11) NOT NULL,
  `imie` varchar(200) NOT NULL,
  `nazwisko` varchar(200) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefon` int(15) NOT NULL,
  `adres` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `komitenci`
--

INSERT INTO `komitenci` (`id`, `imie`, `nazwisko`, `pesel`, `email`, `telefon`, `adres`) VALUES
(1, 'Andrzej', 'Kowalski', '01300575465', 'ja@wielkapolska.pl', 872457868, 'Panie Janie Weź Pan Wstań 20-200'),
(2, 'Anna', 'Bober', '02212594654', 'jaber@gmail.com', 893809095, 'Dabrowskiego 5'),
(3, 'Joanna', 'Górka', '89062127726', 'joa@wp.pl', 840621768, 'Mlynska 4'),
(4, 'Kamil', 'Papron', '87110519934', 'kapa@xyz.com', 983615770, 'Smrekowa 26'),
(5, 'Mateusz', 'Stroka', '78102274764', 'marny@yahoo.com', 942318107, 'Traktorowa 63'),
(6, 'Janusz', 'Byka', '57122944211', 'poto@rumba.ayy', 125534801, 'Mlynska 11'),
(7, 'Sławomir', 'Powin', '55120476567', 'bad@sys.exe', 876752675, 'Dabrowskiego 55'),
(8, 'Kacper', 'Derno', '83112966583', 'virus@anty.com', 324978249, 'Dabrowskiego 12'),
(9, 'Dawid', 'Morta', '48021814945', 'person@bad.com', 742495683, 'Mlynska 12'),
(10, 'Alan', 'Posma', '80021847282', 'good@luck.lol', 735125633, 'Smrekowa 8');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nabywcy`
--

CREATE TABLE `nabywcy` (
  `id` int(11) NOT NULL,
  `imie` varchar(200) NOT NULL,
  `nazwisko` varchar(200) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefon` int(15) NOT NULL,
  `adres` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `nabywcy`
--

INSERT INTO `nabywcy` (`id`, `imie`, `nazwisko`, `pesel`, `email`, `telefon`, `adres`) VALUES
(1, 'Bruno', 'Łoza', '87031678837', 'vruno@wp.pl', 608078252, 'Janowice 298'),
(2, 'Kamil', 'Goławski', '85120431888', 'sober@gmail.com', 644443628, 'Janowice 5'),
(3, 'Juliana', 'Kamieński', '91070278541', 'julia@wp.pl', 622304010, 'Wesola 51'),
(4, 'Beata', 'Nobis', '59052427194', 'kat@yahoo.com', 614897740, 'Smrekowa 26'),
(5, 'Dargomir', 'Burek', '76081122519', 'dargomir@gmail.com', 942172463, 'Wesola 9'),
(6, 'Sędzisława', 'Karolczyk', '82061871665', 'poco@pol.ska', 300091200, 'Mlynska 11'),
(7, 'Mieczysława', 'Mierzyński', '96090383222', 'materac@fun.xd', 850019946, 'Dabrowskiego 55'),
(8, 'Ariel', 'Sykuła', '58122651781', 'pomoroncz@merge.issue', 782938381, 'Janowice 8'),
(9, 'Mariola', 'Matejko', '67010159319', 'lubija@nice.me', 835147005, 'Mlynska 12'),
(10, 'Borzywoj', 'Szmyt', '04231274791', 'have@fun.lol', 419392878, 'Smrekowa 8');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rejestry_sprzedazy`
--

CREATE TABLE `rejestry_sprzedazy` (
  `id` int(11) NOT NULL,
  `nabywca_id` int(11) NOT NULL,
  `komitent_id` int(11) NOT NULL,
  `samochod_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rejestry_sprzedazy`
--

INSERT INTO `rejestry_sprzedazy` (`id`, `nabywca_id`, `komitent_id`, `samochod_id`, `data`, `cena`) VALUES
(1, 1, 1, 1, '2023-09-02', 120000),
(2, 1, 6, 8, '2022-03-06', 42000),
(3, 4, 7, 4, '2023-05-16', 35000),
(4, 8, 3, 2, '2022-01-25', 10000),
(5, 3, 9, 3, '2021-06-21', 86500),
(6, 10, 1, 5, '2023-05-12', 95000),
(7, 5, 1, 6, '2023-09-30', 86900);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `id` int(11) NOT NULL,
  `marka` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `typ_nadwozia` varchar(200) NOT NULL,
  `rok_produkcji` int(11) NOT NULL,
  `rodzaj_paliwa` varchar(50) NOT NULL,
  `przebieg` int(11) NOT NULL,
  `numer_rejestracyjny` varchar(50) NOT NULL,
  `cena_wywolawcza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`id`, `marka`, `model`, `typ_nadwozia`, `rok_produkcji`, `rodzaj_paliwa`, `przebieg`, `numer_rejestracyjny`, `cena_wywolawcza`) VALUES
(1, 'Volvo', 'V90', 'Kombi', 2019, 'Diesel', 122000, 'DWR7822N', 131900),
(2, 'Skoda', 'Octavia', 'Kombi', 2012, 'Benzyna', 258500, 'WPR7844F', 12900),
(3, 'BMW', 'Seria 1', 'Hatchback', 2018, 'Benzyna', 44700, 'GA532TF3', 86900),
(4, 'Audi', 'A4', 'Kombi', 2009, 'Diesel', 291168, 'WA64BE2H', 35900),
(5, 'Mercedes-Benz', 'CLA', 'Sedan', 2016, 'Benzyna', 129000, 'XD9VAC23', 95000),
(6, 'Ford', 'Focus', 'Kompakt', 2021, 'Benzyna', 80293, 'SZ8576R', 86900),
(7, 'Kia', 'Soul', 'Hatchback', 2021, 'Benzyna', 27000, 'WA03BU4S', 97500),
(8, 'Toyota', 'Yaris', 'Kompakt', 2018, 'Benzyna', 108000, 'WE533TK', 44890);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `komitenci`
--
ALTER TABLE `komitenci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `nabywcy`
--
ALTER TABLE `nabywcy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rejestry_sprzedazy`
--
ALTER TABLE `rejestry_sprzedazy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nabywca_id` (`nabywca_id`,`komitent_id`,`samochod_id`),
  ADD KEY `komitent_id` (`komitent_id`),
  ADD KEY `samochod_id` (`samochod_id`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `komitenci`
--
ALTER TABLE `komitenci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `nabywcy`
--
ALTER TABLE `nabywcy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rejestry_sprzedazy`
--
ALTER TABLE `rejestry_sprzedazy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `samochody`
--
ALTER TABLE `samochody`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rejestry_sprzedazy`
--
ALTER TABLE `rejestry_sprzedazy`
  ADD CONSTRAINT `rejestry_sprzedazy_ibfk_1` FOREIGN KEY (`nabywca_id`) REFERENCES `nabywcy` (`id`),
  ADD CONSTRAINT `rejestry_sprzedazy_ibfk_2` FOREIGN KEY (`komitent_id`) REFERENCES `komitenci` (`id`),
  ADD CONSTRAINT `rejestry_sprzedazy_ibfk_3` FOREIGN KEY (`samochod_id`) REFERENCES `samochody` (`id`);
  
SHOW TABLES;
COMMIT;

DROP PROCEDURE IF EXISTS sprzedane_w_roku;

DELIMITER //
CREATE PROCEDURE sprzedane_w_roku(IN rok int)
BEGIN 

SELECT COUNT(*) AS 'Sprzedane'
FROM `rejestry_sprzedazy`
WHERE YEAR(`rejestry_sprzedazy`.`data`) = rok;

END //
DELIMITER ;

CALL sprzedane_w_roku(2023);

DROP PROCEDURE IF EXISTS przebieg_mniejszy_niz;

DELIMITER //
CREATE PROCEDURE przebieg_mniejszy_niz(IN przebieg int)
BEGIN 

SELECT *
FROM `samochody`
WHERE `samochody`.`przebieg` < przebieg;

END //
DELIMITER ;

CALL przebieg_mniejszy_niz(80000);

DROP PROCEDURE IF EXISTS rodzaj_paliwa;

DELIMITER //
CREATE PROCEDURE rodzaj_paliwa(IN paliwo varchar(200))
BEGIN 

SELECT *
FROM `samochody`
WHERE `samochody`.`rodzaj_paliwa` = paliwo;

END //
DELIMITER ;

CALL rodzaj_paliwa('benzyna');

DROP PROCEDURE IF EXISTS najwyzsza_cena_komitenta;

DELIMITER //
CREATE PROCEDURE najwyzsza_cena_komitenta()
BEGIN
SELECT komitent_id, cena FROM rejestry_sprzedazy
EXCEPT
SELECT komitent_id, cena FROM rejestry_sprzedazy WHERE cena NOT IN (
	SELECT max(cena) FROM rejestry_sprzedazy GROUP BY komitent_id
);
END //

DELIMITER ;
CALL najwyzsza_cena_komitenta();

DROP PROCEDURE IF EXISTS sprzedaz_z_adresami;

DELIMITER //
CREATE PROCEDURE sprzedaz_z_adresami(IN k_adres text, IN n_adres text)
BEGIN
SELECT rejestry_sprzedazy.* FROM rejestry_sprzedazy
JOIN komitenci ON komitenci.id = komitent_id 
WHERE komitenci.adres LIKE k_adres
INTERSECT
SELECT rejestry_sprzedazy.* FROM rejestry_sprzedazy
JOIN nabywcy ON nabywcy.id = nabywca_id 
WHERE nabywcy.adres LIKE n_adres;
END //

DELIMITER ;
CALL sprzedaz_z_adresami("Mlynska%", "Janowice%");

DROP PROCEDURE IF EXISTS wszyscy_uzytkownicy;

DELIMITER //
CREATE PROCEDURE wszyscy_uzytkownicy()
BEGIN
SELECT imie, nazwisko, pesel, email, telefon, adres FROM nabywcy
UNION ALL
SELECT imie, nazwisko, pesel, email, telefon, adres FROM komitenci;
END //
DELIMITER ;
CALL wszyscy_uzytkownicy();

DROP VIEW IF EXISTS sprzedaze;
CREATE VIEW sprzedaze AS
SELECT imie, nazwisko, data, cena 
FROM rejestry_sprzedazy 
JOIN komitenci ON komitenci.id = rejestry_sprzedazy.komitent_id;

SELECT * FROM sprzedaze;

DROP VIEW IF EXISTS kontakt;
CREATE VIEW kontakt AS
SELECT imie, nazwisko, email, telefon
FROM komitenci;

SELECT * FROM kontakt;

DROP VIEW IF EXISTS stopien_uzytkowania_pojazdow;
CREATE VIEW stopien_uzytkowania_pojazdow AS
SELECT numer_rejestracyjny, rok_produkcji, przebieg 
FROM samochody
ORDER BY rok_produkcji DESC, przebieg;

SELECT * FROM stopien_uzytkowania_pojazdow;

DROP VIEW IF EXISTS cena_finalna;
CREATE VIEW cena_finalna AS
SELECT marka, model, cena
FROM rejestry_sprzedazy
JOIN samochody ON samochody.id = rejestry_sprzedazy.samochod_id;

SELECT * FROM cena_finalna;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
