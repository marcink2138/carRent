-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 
-- Czas generowania: 27 Cze 2021, 21:56
-- Wersja serwera: 8.0.21
-- Wersja PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `s111`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars`
--

CREATE TABLE `cars` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgSource` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondDescription` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `cars`
--

INSERT INTO `cars` (`id`, `name`, `imgSource`, `description`, `title`, `secondDescription`, `cost`) VALUES
(1, 'citroen', '/images/citroen.png', 'Druga generacja modelu. Po swoim starszym bracie odziedziczył charakterystyczną przygarbioną sylwetkę mimo że sam jest nieco większy od swojego poprzednika. Idealny dla kierowców poruszających się po mieście.', 'Citroen C3 II', '<ul class=\"list-group list-group-flush\">   <li class=\"list-group-item\">Paliwo: <strong> Benzyna</strong></li>   <li class=\"list-group-item\">Typ: <strong>Kombi</strong></li>   <li class=\"list-group-item\">Liczba pasażerów: <strong>5</strong></li>   <li class=\"list-group-item\">Skrzynia biegów: <strong>manualna</strong></li>   <li class=\"list-group-item\">Moc: <strong>85 KM</strong></li>   <li class=\"list-group-item\">Napęd: <strong>na przednie koła koła</strong></li>   <li class=\"list-group-item\">Cena: <strong>85zł/24h</strong></li> </ul>', 85),
(2, 'audi', '/images/audi.png', 'Jesteś fanatykiem czterech kółek na zderzaku? Pomyśleliśmy również o tobie! Audi A6 2.0 to marzenie wielu kierowców zdobywających doświadczenie w połowie pierwszej dekady drugiego tysiąclecia. Teraz możesz odkopać młodzieńcze fantazje wybierając tą pozycje!', 'Audi A6 2.0 T', '<ul class=\"list-group list-group-flush\">   <li class=\"list-group-item\">Paliwo: <strong> Diesel</strong></li>   <li class=\"list-group-item\">Typ: <strong>Sedan</strong></li>   <li class=\"list-group-item\">Liczba pasażerów: <strong>5</strong></li>   <li class=\"list-group-item\">Skrzynia biegów: <strong>automatyczna</strong></li>   <li class=\"list-group-item\">Moc: <strong>217 KM</strong></li>   <li class=\"list-group-item\">Napęd: <strong>4x4</strong></li>   <li class=\"list-group-item\">Cena: <strong>250zł/24h</strong></li> </ul>', 250),
(3, 'ford', '/images/ford.png', 'Ford focus stał się jednym z najpopularniejszych reprezentantów niższej klasy średniej, a zarazem jednym z najlepiej sprzedających się modeli Forda dlatego nie mogło go zabraknąć w naszej ofercie. Idealnie sprawuje się jako auto zastępcze, bez względu na to ile kilometrów masz do przejechania.', 'Ford Focus 2015', '<ul class=\"list-group list-group-flush\">   <li class=\"list-group-item\">Paliwo: <strong> Diesel</strong></li>   <li class=\"list-group-item\">Typ: <strong>Kombi</strong></li>   <li class=\"list-group-item\">Liczba pasażerów: <strong>5</strong></li>   <li class=\"list-group-item\">Skrzynia biegów: <strong>manualma</strong></li>   <li class=\"list-group-item\">Moc: <strong>105 KM</strong></li>   <li class=\"list-group-item\">Napęd: <strong>na tylnie koła</strong></li>   <li class=\"list-group-item\">Cena: <strong>110zł/24h</strong></li> </ul>', 110),
(4, 'honda', '/images/honda.png', 'Dziewiąta generacja flagowego produktu Hondy. Ze swoją poprzedniczką jest silnie powiązana pod względem konstrukcyjnym, jak i technicznym. Idealna dla kierowców rządnych kapki emocji na drodze.', 'Honda Civic IX', '<ul class=\"list-group list-group-flush\">   <li class=\"list-group-item\">Paliwo: <strong> Benzyna</strong></li>   <li class=\"list-group-item\">Typ: <strong>Sedan</strong></li>   <li class=\"list-group-item\">Liczba pasażerów: <strong>5</strong></li>   <li class=\"list-group-item\">Skrzynia biegów: <strong>manualna</strong></li>   <li class=\"list-group-item\">Moc: <strong>142 KM</strong></li>   <li class=\"list-group-item\">Napęd: <strong>na przednie koła</strong></li>   <li class=\"list-group-item\">Cena: <strong>125zł/24h</strong></li> </ul>', 125),
(5, 'fiat', '/images/fiat.png', 'Zautomatyzowany wnuczek słynnej na początku lat 90 linii TIPO. Idealny na długie rodzinne wypady. Dzięki mocnemu silnikowi nie musisz się obawiać że jakość podróży na długich trasach będzie niesatysfakcjonująca.', 'Fiat Tipo', '<ul class=\"list-group list-group-flush\">\r\n  <li class=\"list-group-item\">Paliwo: <strong> Benzyna</strong></li>\r\n  <li class=\"list-group-item\">Typ: <strong>Sedan</strong></li>\r\n  <li class=\"list-group-item\">Liczba pasażerów: <strong>5</strong></li>\r\n  <li class=\"list-group-item\">Skrzynia biegów: <strong>automatyczna</strong></li>\r\n  <li class=\"list-group-item\">Moc: <strong>95 KM</strong></li>\r\n  <li class=\"list-group-item\">Napęd: <strong>na przednie koła</strong></li>\r\n  <li class=\"list-group-item\">Cena: <strong>100zł/24h</strong></li>\r\n</ul>', 100);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `imgSource` (`imgSource`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
