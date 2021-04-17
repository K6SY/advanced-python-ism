--
-- Database structure eshop
--

CREATE SCHEMA `eshop` DEFAULT CHARACTER SET utf8mb4 ;
-- --------------------------------------------------------

use eshop;
--
-- Table structure for table `Categorie`
--

CREATE TABLE IF NOT EXISTS `Categorie` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Table structure for table `Produit`
--

CREATE TABLE IF NOT EXISTS `Produit` (
  `id` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marque` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vendable` tinyint NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Stock`
--

CREATE TABLE IF NOT EXISTS `Stock` (
  `id` int NOT NULL,
  `produit_id` int DEFAULT NULL,
  `quantite` int NOT NULL,
  `seuil` int DEFAULT NULL,
  `dateUpdate` datetime NOT NULL,
  `lastUserUpdate` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HistoriqueStock`
--

CREATE TABLE IF NOT EXISTS `HistoriqueStock` (
  `id` int NOT NULL,
  `stock_id` int DEFAULT NULL,
  `dateUpdate` datetime NOT NULL,
  `qteBeforeUpdate` int NOT NULL,
  `qteAfterUpdate` int NOT NULL,
  `lastUserpdate` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `qteAjoute` int NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Vente`
--

CREATE TABLE IF NOT EXISTS `Vente` (
  `id` int NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dateVente` datetime NOT NULL,
  `montantTotal` float DEFAULT NULL,
  `remise` float DEFAULT NULL,
  `netTotal` float DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `montantRestant` float DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VenteProduit`
--

CREATE TABLE IF NOT EXISTS `VenteProduit` (
  `id` int NOT NULL,
  `produit_id` int DEFAULT NULL,
  `vente_id` int DEFAULT NULL,
  `quantite` int NOT NULL,
  `prixUnitaire` float NOT NULL,
  `montantTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `PayVente`
--

CREATE TABLE IF NOT EXISTS `PayVente` (
  `id` int NOT NULL,
  `reference_id` int DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `datePaiement` datetime NOT NULL,
  `montantInitial` float NOT NULL,
  `montantPayer` float NOT NULL,
  `montantRestant` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CB8C54976C6E55B5` (`nom`);

--
-- Indexes for table `HistoriqueStock`
--
ALTER TABLE `HistoriqueStock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DB4E1003DCD6110` (`stock_id`);

--
-- Indexes for table `PayVente`
--
ALTER TABLE `PayVente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BE81C5A21645DEA9` (`reference_id`);

--
-- Indexes for table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E618D5BB6C6E55B5` (`nom`),
  ADD KEY `IDX_E618D5BBBCF5E72D` (`categorie_id`);

--
-- Indexes for table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8AF77964F347EFB` (`produit_id`);

--
-- Indexes for table `VenteProduit`
--
ALTER TABLE `VenteProduit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_80E01F9F347EFB` (`produit_id`),
  ADD KEY `IDX_80E01F97DC7170A` (`vente_id`);

--
-- Indexes for table `Vente`
--
ALTER TABLE `Vente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `HistoriqueStock`
--
ALTER TABLE `HistoriqueStock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PayVente`
--
ALTER TABLE `PayVente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Stock`
--
ALTER TABLE `Stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VenteProduit`
--
ALTER TABLE `VenteProduit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Vente`
--
ALTER TABLE `Vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `HistoriqueStock`
--
ALTER TABLE `HistoriqueStock`
  ADD CONSTRAINT `FK_DB4E1003DCD6110` FOREIGN KEY (`stock_id`) REFERENCES `Stock` (`id`);

--
-- Constraints for table `PayVente`
--
ALTER TABLE `PayVente`
  ADD CONSTRAINT `FK_BE81C5A21645DEA9` FOREIGN KEY (`reference_id`) REFERENCES `Vente` (`id`);

--
-- Constraints for table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `FK_E618D5BBBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

--
-- Constraints for table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `FK_8AF77964F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);

--
-- Constraints for table `VenteProduit`
--
ALTER TABLE `VenteProduit`
  ADD CONSTRAINT `FK_80E01F97DC7170A` FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`),
  ADD CONSTRAINT `FK_80E01F9F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);
  
