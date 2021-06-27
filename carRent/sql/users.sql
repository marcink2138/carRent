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
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `carRented` mediumtext COLLATE utf8mb4_unicode_ci,
  `loanStart` date DEFAULT NULL,
  `loanEnd` date DEFAULT NULL,
  `fee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `carRented`, `loanStart`, `loanEnd`, `fee`) VALUES
(4, 'admin@admin.pl', '$2y$10$qQJNwY2KZa3iVUgJXk2eouXK9AmjfdOf.Ml6pf85SXPkIXBRYlKSm', 'Citroen C3 II', '2021-06-27', '2021-06-30', 455),
(13, 'test@test.pl', '$2y$10$5ZG3wJ2gBOpc0Tw3kHpxg.QR9EzP7u96L25suBTj1K19UirjCTB86', NULL, NULL, NULL, NULL),
(14, 'adad@op.pl', '$2y$10$m1Wq.tMV1ehwtNmznUY5VO9IA2HlSsM5sJXva0rLcodhm3.UVooQO', NULL, NULL, NULL, NULL),
(24, 'karcz@karcz.pl', '$2y$10$ppWUJMsKO4NIQN.e1r1L/.4W4zC9.9QzGdf6Kq1lKPbbnmStgEQ5.', NULL, NULL, NULL, NULL),
(25, 'cieslik@cieslik.pl', '$2y$10$ZlL1GfrK5uCZvJykBGuos.MZHbau/BC/xYPhp3iX3yU7Djah.GfzG', 'Citroen C3 II', '2021-07-05', '2021-07-07', 370),
(26, 'jeden@jeden.pl', '$2y$10$8SxlG/S21wRHIlEamvr8oe1T6xBqZDbF4g/YIgrtZpEPzUJ3Sumve', 'Audi A6 2.0 T', '2021-06-29', '2021-07-06', 1750),
(27, 'dwa@dwa.pl', '$2y$10$L7hJnD2imgvs0R8NfMhypeGoW523IN7zWbzCHAhZU5PpJobp8z35G', 'Ford Focus 2015', '2021-06-29', '2021-06-30', 310);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
