-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 26, 2025 alle 09:12
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agenziainterinale`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aziende`
--

CREATE TABLE `aziende` (
  `ID_Azienda` int(11) NOT NULL,
  `RagioneSociale` varchar(30) NOT NULL,
  `P_Iva` varchar(30) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Sede` varchar(30) NOT NULL,
  `Indirizzo` varchar(30) NOT NULL,
  `N_Dipendenti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `aziende`
--

INSERT INTO `aziende` (`ID_Azienda`, `RagioneSociale`, `P_Iva`, `Telefono`, `Email`, `Sede`, `Indirizzo`, `N_Dipendenti`) VALUES
(1, 'InnovaTech', '10245782903', '+39 3471386715', 'innovatech@gmail.com', 'Brembate Sotto', 'Via Aldo Moro 5', 2),
(2, 'Elettrocomp', '12457625491', '+39 3332406468', 'elettrocomp@gmail.com', 'Valbondione', 'Via Milano 7', 5),
(3, 'Acerocomp', '25489123578', '+39 3334581245', 'acerocomp@gmail.com', 'Bergamo', 'Via Bergamo 37', 900),
(4, 'Econsas', '1010100101', '123 456 7890', 'davidetrussa@gmail.com', 'I.C.CLUSONE', 'via como', 3),
(6, 'Scame spa', '123456789', '123456789', 'scame@gmail.com', 'parre', 'via parre', 350),
(7, 'rossi srl', '123456789', '987654321', 'rossi@gmail.com', 'clusone', 'via moro', 77);

-- --------------------------------------------------------

--
-- Struttura della tabella `candidati`
--

CREATE TABLE `candidati` (
  `ID_Candidato` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Indirizzo` varchar(30) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `URL_Curriculum` varchar(100) DEFAULT NULL,
  `Data_Nascita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `candidati`
--

INSERT INTO `candidati` (`ID_Candidato`, `Nome`, `Cognome`, `Indirizzo`, `Telefono`, `Email`, `URL_Curriculum`, `Data_Nascita`) VALUES
(1, 'Luca', 'Verdi', 'Via Verdi 4', '+39 3470235468', 'lucaverdi@gmail.com', NULL, '2002-12-03'),
(2, 'Enrico Pasquale', 'Prattico', 'Via Napoli 3', '+39 3470235468', 'enricoprattico@gmail.com', NULL, '1989-01-31'),
(3, 'Gianni', 'Gianni', 'Via Brescia 4', '+39 3363253648', 'giannix2@gmail.com', NULL, '1983-02-21'),
(4, 'Davide', 'Trussardi', 'via como', '123 456 7890', 'davidetrussa@gmail.com', NULL, '2025-05-08'),
(5, 'Luigi', 'Verdi', 'via verdi', '123456789', 'luigi@gmail.com', NULL, '2025-05-01'),
(6, 'luca', 'verdi', 'via como', '123456789', 'luca@gmail.com', NULL, '2025-05-23');

-- --------------------------------------------------------

--
-- Struttura della tabella `offertedilavoro`
--

CREATE TABLE `offertedilavoro` (
  `ID_Offerta` int(11) NOT NULL,
  `Descrizione` varchar(100) NOT NULL,
  `Inizio` date NOT NULL,
  `Fine` date DEFAULT NULL,
  `PostiDisponibili` int(11) NOT NULL,
  `id_Azienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `offertedilavoro`
--

INSERT INTO `offertedilavoro` (`ID_Offerta`, `Descrizione`, `Inizio`, `Fine`, `PostiDisponibili`, `id_Azienda`) VALUES
(1, 'ci occupiamo della creazione di un prodtto unico come l\'acero, dopo decenni di studi e lavorazioni', '2025-10-03', NULL, 2, 3),
(2, 'installiamo impianti innovativi per salvaguardare l\'ambiente che ci circonda', '2025-06-23', NULL, 1, 2),
(3, 'realizziamo l\'azienda del futuro con l\'unione di anni di esperienza, uniamo le aziende', '2026-01-03', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `richieste`
--

CREATE TABLE `richieste` (
  `id_Offerta` int(11) NOT NULL,
  `id_Candidato` int(11) NOT NULL,
  `Data_Richiesta` date NOT NULL,
  `Validata` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `ID_utente` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(30) NOT NULL,
  `is_company` tinyint(1) DEFAULT 0,
  `data_registrazione` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`ID_utente`, `username`, `email`, `password`, `is_company`, `data_registrazione`) VALUES
(36, 'davide', 'davidetrussa@gmail.com', '123', 1, '2025-05-15 10:24:01'),
(43, 'gianni', 'gianni@gmail.com', '123', 1, '2025-05-23 06:01:13'),
(44, 'luigi', 'luigi@gmail.com', '123', 0, '2025-05-23 06:08:13'),
(45, 'tommaso', 'tommaso@gmail.com', '123', 1, '2025-05-23 09:03:26'),
(46, 'luca', 'luca@gmail.com', '123', 0, '2025-05-23 09:05:05'),
(47, 'marco', 'marco@gmail.com', '123', 1, '2025-05-26 07:06:40'),
(48, 'pietro', 'pietro@gmail.com', '123', 0, '2025-05-26 07:08:30');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aziende`
--
ALTER TABLE `aziende`
  ADD PRIMARY KEY (`ID_Azienda`);

--
-- Indici per le tabelle `candidati`
--
ALTER TABLE `candidati`
  ADD PRIMARY KEY (`ID_Candidato`);

--
-- Indici per le tabelle `offertedilavoro`
--
ALTER TABLE `offertedilavoro`
  ADD PRIMARY KEY (`ID_Offerta`),
  ADD KEY `id_Azienda` (`id_Azienda`);

--
-- Indici per le tabelle `richieste`
--
ALTER TABLE `richieste`
  ADD PRIMARY KEY (`id_Offerta`,`id_Candidato`),
  ADD KEY `id_Candidato` (`id_Candidato`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID_utente`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `aziende`
--
ALTER TABLE `aziende`
  MODIFY `ID_Azienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `candidati`
--
ALTER TABLE `candidati`
  MODIFY `ID_Candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `offertedilavoro`
--
ALTER TABLE `offertedilavoro`
  MODIFY `ID_Offerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `offertedilavoro`
--
ALTER TABLE `offertedilavoro`
  ADD CONSTRAINT `offertedilavoro_ibfk_1` FOREIGN KEY (`id_Azienda`) REFERENCES `aziende` (`ID_Azienda`);

--
-- Limiti per la tabella `richieste`
--
ALTER TABLE `richieste`
  ADD CONSTRAINT `richieste_ibfk_1` FOREIGN KEY (`id_Offerta`) REFERENCES `offertedilavoro` (`ID_Offerta`),
  ADD CONSTRAINT `richieste_ibfk_2` FOREIGN KEY (`id_Candidato`) REFERENCES `candidati` (`ID_Candidato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
